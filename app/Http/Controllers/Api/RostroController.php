<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\E_Actividad;
use App\Models\User;
use App\Models\E_RostroUsuario;
use Carbon\Carbon;
use App\Models\E_AsistenciaActividad;

class RostroController extends Controller
{
    public function listar($eventoId)
    {
        $rostros = E_RostroUsuario::with('usuario')
            ->whereHas('usuario')
            ->get()
            ->groupBy('usuario_id')
            ->map(function ($grupo) {
                return [
                    'nombre' => $grupo->first()->usuario->name,
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
            'nombre' => 'required|string'
        ]);

        $usuario = User::where('name', $request->nombre)->first();
        if (!$usuario) {
            return response()->json(['error' => 'Usuario no encontrado'], 404);
        }

        // Evitar duplicados
        $yaExiste = E_AsistenciaActividad::where('actividad_id', $request->actividad_id)
            ->where('usuario_id', $usuario->id)
            ->exists();

        if ($yaExiste) {
            return response()->json(['status' => 'ok', 'mensaje' => 'Ya marcado anteriormente']);
        }

        E_AsistenciaActividad::create([
            'actividad_id' => $request->actividad_id,
            'usuario_id' => $usuario->id,
            'hora_entrada' => Carbon::now(),
            'metodo_entrada' => 'rostro',
            'id_user_create' => 1, // puedes usar Auth::id() si hay sesión admin
        ]);

        return response()->json(['status' => 'ok', 'mensaje' => 'Asistencia registrada']);
    }

    public function listarAsistencias($actividadId)
    {
        $asistencias = \App\Models\E_AsistenciaActividad::with('usuario')
            ->where('actividad_id', $actividadId)
            ->get()
            ->map(fn($a) => $a->usuario->name);

        return response()->json($asistencias);
    }
}