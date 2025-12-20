<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\E_Actividad;
use App\Models\User;
use App\Models\E_RostroUsuario;
use Carbon\Carbon;
use App\Models\E_AsistenciaActividad;
use App\Models\E_EventoGrupoUsuario;

class RostroController extends Controller
{
    public function listar($eventoId)
    {
        $rostros = E_RostroUsuario::with('usuario')
            ->whereHas('usuario')
            ->get()
            ->groupBy('usuario_id')
            ->map(function ($grupo) {
                $usuario = $grupo->first()->usuario;
                return [
                    'usuario_id' => $usuario->id,
                    'nombre' => $usuario->name,
                    'sexo' => $usuario->sexo,
                    'embeddings' => $grupo->map(fn($r) => json_decode($r->embedding)),
                ];
            })
            ->values();

        return response()->json($rostros);
    }

    // ✅ Marca la asistencia cuando un rostro es detectado
    public function marcar(Request $request)
    {
        $request->validate([
            'actividad_id' => 'required|exists:E_actividades,id',
            'nombre' => 'nullable|string',
            'usuario_id' => 'nullable|integer',
            'tipo_documento' => 'nullable|string|max:10',
            'nro_documento' => 'nullable|string|max:30',
            'metodo_entrada' => 'nullable|in:rostro,documento,qr',
        ]);

        $actividad = E_Actividad::with('dia')->findOrFail($request->actividad_id);

        $usuario = null;
        if ($request->filled('usuario_id')) {
            $usuario = User::find($request->usuario_id);
        } elseif ($request->filled('tipo_documento') && $request->filled('nro_documento')) {
            $tipoInput = trim((string) $request->tipo_documento);
            $map = [
                '1' => 'DNI',
                '2' => 'CE',
                '3' => 'PST',
                '4' => 'RUC',
            ];
            $tipoCandidates = [];
            if ($tipoInput !== '') {
                $tipoCandidates[] = $tipoInput;
            }
            if (isset($map[$tipoInput])) {
                $tipoCandidates[] = $map[$tipoInput];
            } else {
                $reverse = array_search(strtoupper($tipoInput), $map, true);
                if ($reverse !== false) {
                    $tipoCandidates[] = (string) $reverse;
                }
            }
            $tipoCandidates = array_values(array_unique(array_filter($tipoCandidates)));

            $tipoCandidatesUpper = array_values(array_unique(array_filter(array_map('strtoupper', $tipoCandidates))));
            $usuario = User::where('nro_documento', $request->nro_documento)
                ->whereIn('tipo_documento', array_merge($tipoCandidates, $tipoCandidatesUpper))
                ->first();
        } elseif ($request->filled('nombre')) {
            $usuario = User::where('name', $request->nombre)->first();
        }

        if (!$usuario) {
            return response()->json(['error' => 'Usuario no encontrado'], 404);
        }

        // Evitar duplicados
        $registroExistente = E_AsistenciaActividad::where('actividad_id', $request->actividad_id)
            ->where('usuario_id', $usuario->id)
            ->first();
        $yaExiste = (bool) $registroExistente;

        if (!$yaExiste) {
            E_AsistenciaActividad::create([
                'actividad_id' => $request->actividad_id,
                'usuario_id' => $usuario->id,
                'hora_entrada' => Carbon::now(),
                'metodo_entrada' => $request->metodo_entrada ?: 'rostro',
                'id_user_create' => $usuario->id,
            ]);
        } elseif ($registroExistente && $registroExistente->metodo_entrada === 'confirmacion') {
            $registroExistente->update([
                'hora_entrada' => $registroExistente->hora_entrada ?: Carbon::now(),
                'metodo_entrada' => $request->metodo_entrada ?: 'rostro',
                'id_user_create' => $usuario->id,
            ]);
        }

        $eventoId = $actividad->dia?->evento_id;
        $grupoNombre = null;
        if ($eventoId) {
            $grupo = E_EventoGrupoUsuario::where('usuario_id', $usuario->id)
                ->whereHas('grupo', function ($q) use ($eventoId) {
                    $q->where('evento_id', $eventoId);
                })
                ->with('grupo')
                ->first();
            $grupoNombre = $grupo?->grupo?->nombre;
        }

        $primerNombre = trim(explode(' ', trim($usuario->name ?? ''))[0] ?? '');

        return response()->json([
            'status' => 'ok',
            'mensaje' => $yaExiste ? 'Ya marcado anteriormente' : 'Asistencia registrada',
            'ya_existia' => (bool) $yaExiste,
            'usuario' => [
                'id' => $usuario->id,
                'nombre' => $usuario->name,
                'sexo' => $usuario->sexo,
                'primer_nombre' => $primerNombre,
                'grupo' => $grupoNombre,
            ],
        ]);
    }

    public function listarAsistencias($actividadId)
    {
        $asistencias = \App\Models\E_AsistenciaActividad::with('usuario')
            ->where('actividad_id', $actividadId)
            ->get()
            ->map(fn($a) => [
                'id' => $a->usuario?->id,
                'nombre' => $a->usuario?->name,
            ]);

        return response()->json($asistencias);
    }
}
