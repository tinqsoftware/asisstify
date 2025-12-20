<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\E_Evento;
use App\Models\E_Encuesta;
use App\Models\E_EncuestaOpcion;
use App\Models\E_EncuestaVoto;
use App\Models\E_EventoGrupoUsuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class EncuestaController extends Controller
{
    // Encuestras de un evento (para "mis asistencias" o QR)
    public function porEvento(E_Evento $evento)
    {
        $userId = Auth::id();

        $encuestas = $evento->encuestas()
            ->with('opciones')
            ->orderBy('id', 'asc')
            ->get()
            ->map(function (E_Encuesta $encuesta) use ($userId) {
                $votosUsuario = null;

                if ($userId) {
                    $votosUsuario = $encuesta->votos()
                        ->where('ronda', $encuesta->ronda_actual)
                        ->where('usuario_id', $userId)
                        ->pluck('opcion_id');
                }

                return [
                    'id'         => $encuesta->id,
                    'nombre'     => $encuesta->nombre,
                    'descripcion'=> $encuesta->descripcion,
                    'tipo'       => $encuesta->tipo,
                    'estado'     => $encuesta->estado,
                    'modo_resultados'          => $encuesta->modo_resultados,
                    'unica_por_opcion'        => (bool)$encuesta->unica_por_opcion,
                    'max_opciones_por_usuario'=> $encuesta->max_opciones_por_usuario,
                    'permitir_cambiar_voto'   => (bool)$encuesta->permitir_cambiar_voto,
                    'ronda_actual'            => $encuesta->ronda_actual,
                    'opciones'  => $encuesta->opciones->map(function ($opt) {
                        return [
                            'id'           => $opt->id,
                            'nombre'       => $opt->nombre,
                            'descripcion'  => $opt->descripcion,
                            'imagen'       => $opt->imagen,
                            'color'        => $opt->color,
                            'es_activa'    => (bool)$opt->es_activa,
                            'es_bloqueada' => (bool)$opt->es_bloqueada,
                        ];
                    })->values(),
                    'votos_usuario' => $votosUsuario,
                ];
            });

        return response()->json([
            'evento'    => ['id' => $evento->id, 'titulo' => $evento->titulo],
            'encuestas' => $encuestas,
        ]);
    }

    // Registrar voto
    public function votar(Request $request, E_Encuesta $encuesta)
    {
        if ($encuesta->estado !== 'activa') {
            return response()->json(['error' => 'La encuesta no está activa.'], 422);
        }

        $data = $request->validate([
            'opcion_id'      => 'required|exists:E_encuesta_opciones,id',
            'nombre_invitado'=> 'nullable|string|max:150',
        ]);

        $opcion = E_EncuestaOpcion::where('id', $data['opcion_id'])
            ->where('encuesta_id', $encuesta->id)
            ->firstOrFail();

        $userId = Auth::id();

        // Validaciones de acceso
        if (!$encuesta->es_abierta && !$userId) {
            return response()->json(['error' => 'Debes iniciar sesión para votar en esta encuesta.'], 401);
        }

        if ($encuesta->es_abierta && !$userId && empty($data['nombre_invitado'])) {
            return response()->json(['error' => 'Debes indicar tu nombre para votar.'], 422);
        }

        // Karaoke: solo un usuario por opción
        if ($encuesta->unica_por_opcion) {
            $ocupada = E_EncuestaVoto::where('encuesta_id', $encuesta->id)
                ->where('opcion_id', $opcion->id)
                ->where('ronda', $encuesta->ronda_actual)
                ->exists();

            if ($ocupada) {
                return response()->json(['error' => 'Esta opción ya fue tomada por otro participante.'], 422);
            }
        }

        // Limitar cantidad de opciones por usuario en esta ronda
        $queryUserVotes = E_EncuestaVoto::where('encuesta_id', $encuesta->id)
            ->where('ronda', $encuesta->ronda_actual);

        if ($userId) {
            $queryUserVotes->where('usuario_id', $userId);
        } else {
            // Encuesta abierta, usamos nombre_invitado como "identidad"
            $queryUserVotes->where('nombre_invitado', $data['nombre_invitado']);
        }

        $votosUsuarioRonda = $queryUserVotes->count();

        if ($votosUsuarioRonda >= $encuesta->max_opciones_por_usuario) {
            if ($encuesta->permitir_cambiar_voto) {
                // reemplazar: borramos votos previos de la ronda y registramos nuevo
                $queryUserVotes->delete();
            } else {
                return response()->json(['error' => 'Ya alcanzaste el máximo de opciones permitidas en esta encuesta.'], 422);
            }
        }

        // Registrar voto
        $voto = E_EncuestaVoto::create([
            'encuesta_id'    => $encuesta->id,
            'opcion_id'      => $opcion->id,
            'usuario_id'     => $userId,
            'nombre_invitado'=> $userId ? null : ($data['nombre_invitado'] ?? null),
            'ronda'          => $encuesta->ronda_actual,
            'id_user'        => $userId,
        ]);

        // Si es karaoke, bloquear opción visualmente
        if ($encuesta->unica_por_opcion) {
            $opcion->update(['es_bloqueada' => 1]);
        }

        return response()->json(['status' => 'ok', 'voto_id' => $voto->id]);
    }

    // Estado/resultados para ecram / celulares
    public function estado(E_Encuesta $encuesta)
    {
        $encuesta->load('opciones');

        $ronda = $encuesta->ronda_actual;

        $totales = E_EncuestaVoto::select(
                'opcion_id',
                DB::raw('COUNT(*) as votos')
            )
            ->where('encuesta_id', $encuesta->id)
            ->where('ronda', $ronda)
            ->groupBy('opcion_id')
            ->pluck('votos', 'opcion_id');

        $totalVotos = $totales->sum();

        // Para encuestas tipo "un usuario por opción" (karaoke) queremos saber
        // quién tomó cada opción
        $asignaciones = [];
        if ($encuesta->unica_por_opcion) {
            $votosKaraoke = E_EncuestaVoto::where('encuesta_id', $encuesta->id)
                ->where('ronda', $ronda)
                ->with('usuario')
                ->get();

            $grupoPorUsuario = [];
            $userIds = $votosKaraoke->pluck('usuario_id')->filter()->unique()->values();
            if ($userIds->isNotEmpty()) {
                $grupoPorUsuario = E_EventoGrupoUsuario::whereIn('usuario_id', $userIds)
                    ->whereHas('grupo', function ($q) use ($encuesta) {
                        $q->where('evento_id', $encuesta->evento_id);
                    })
                    ->with('grupo')
                    ->get()
                    ->keyBy('usuario_id')
                    ->map(fn($row) => $row->grupo?->nombre)
                    ->toArray();
            }

            foreach ($votosKaraoke as $v) {
                $nombre = $v->usuario ? $v->usuario->name : $v->nombre_invitado;
                if ($nombre) {
                    $grupo = $v->usuario_id ? ($grupoPorUsuario[$v->usuario_id] ?? null) : null;
                    $asignaciones[$v->opcion_id] = $grupo ? ($grupo . ' - ' . $nombre) : $nombre;
                }
            }
        }

        $opciones = $encuesta->opciones->map(function (E_EncuestaOpcion $opt) use ($totales, $totalVotos, $encuesta, $ronda, $asignaciones) {
            $votos = (int)($totales[$opt->id] ?? 0);
            $porcentaje = $totalVotos > 0 ? round($votos * 100 / $totalVotos, 1) : 0;

            $tomadoPor = null;
            if ($encuesta->unica_por_opcion) {
                $tomadoPor = $asignaciones[$opt->id] ?? null;
            }

            return [
                'id'           => $opt->id,
                'nombre'       => $opt->nombre,
                'descripcion'  => $opt->descripcion,
                'imagen'       => $opt->imagen,
                'color'        => $opt->color,
                'votos'        => $votos,
                'porcentaje'   => $porcentaje,
                'es_activa'    => (bool)$opt->es_activa,
                'es_bloqueada' => (bool)$opt->es_bloqueada,
                'tomado_por'   => $tomadoPor, // <- NUEVO
            ];
        });

        // Ordenar ya de acuerdo a votos para ranking
        $opcionesOrdenadas = $opciones->sortByDesc('votos')->values();

        return response()->json([
            'encuesta' => [
                'id'         => $encuesta->id,
                'nombre'     => $encuesta->nombre,
                'descripcion'=> $encuesta->descripcion,
                'tipo'       => $encuesta->tipo,
                'estado'     => $encuesta->estado,
                'modo_resultados'          => $encuesta->modo_resultados,
                'unica_por_opcion'        => (bool)$encuesta->unica_por_opcion,
                'max_opciones_por_usuario'=> $encuesta->max_opciones_por_usuario,
                'permitir_cambiar_voto'   => (bool)$encuesta->permitir_cambiar_voto,
                'ronda_actual'            => $encuesta->ronda_actual,
            ],
            'total_votos'   => $totalVotos,
            'opciones'      => $opcionesOrdenadas,
        ]);
    }
}
