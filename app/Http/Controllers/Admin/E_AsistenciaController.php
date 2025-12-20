<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\E_Encuesta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\E_Evento;
use App\Models\E_EventoGrupoUsuario;
use App\Models\E_Actividad;

class E_AsistenciaController extends Controller
{
    /**
     * Muestra las asistencias del usuario agrupadas por evento.
     */
    public function misAsistencias()
    {
        $userId = Auth::id();

        // Obtener los eventos donde el usuario tenga actividades confirmadas o asistidas
        $eventos = E_Evento::with([
            'dias.actividades.asistencias' => function ($q) use ($userId) {
                $q->where('usuario_id', $userId);
            }
        ])
        ->whereHas('dias.actividades.asistencias', function ($q) use ($userId) {
            $q->where('usuario_id', $userId);
        })
        ->orderBy('fecha_inicio', 'desc')
        ->get();

        return view('public.mis_asistencias', compact('eventos'));
    }

    public function camera($eventoId)
    {
        $evento = \App\Models\E_Evento::with('dias.actividades')->findOrFail($eventoId);
        return view('admin.eventos.panel_asistencia_camera', compact('evento'));
    }

    public function actividadCamera($eventoId, $actividadId)
    {
        $evento = \App\Models\E_Evento::findOrFail($eventoId);
        $actividad = \App\Models\E_Actividad::with('dia')->findOrFail($actividadId);

        $this->authorizeActividadAccess($actividad, $evento);
        return view('admin.eventos.panel_asistencia_actividad', compact('evento', 'actividad'));
    }

    public function detalleEvento(E_Evento $evento)
    {
        $user = Auth::user();

        // Cargamos encuestas + opciones, y opcionalmente qué votó el usuario
        $encuestas = $evento->encuestas()
            ->with('opciones')
            ->get()
            ->map(function (E_Encuesta $encuesta) use ($user) {
                $votosUsuario = null;
                if ($user) {
                    $votosUsuario = $encuesta->votos()
                        ->where('ronda', $encuesta->ronda_actual)
                        ->where('usuario_id', $user->id)
                        ->pluck('opcion_id')
                        ->toArray();
                }
                $encuesta->setAttribute('votos_usuario', $votosUsuario);
                return $encuesta;
            });

        $gruposEvento = E_EventoGrupoUsuario::where('usuario_id', $user->id)
            ->whereHas('grupo', function ($q) use ($evento) {
                $q->where('evento_id', $evento->id);
            })
            ->with('grupo')
            ->get()
            ->pluck('grupo.nombre')
            ->filter()
            ->values();

        return view('mis_asistencias.detalle_evento', compact('evento', 'encuestas', 'user', 'gruposEvento'));
    }

    public function qrAsistencia(E_Actividad $actividad)
    {
        $actividad->load('dia.evento');
        $evento = $actividad->dia?->evento;

        return view('public.asistencia_qr', compact('actividad', 'evento'));
    }

    public function guardarLayout(Request $request, E_Actividad $actividad)
    {
        $actividad->load('dia.evento');
        $evento = $actividad->dia?->evento;
        if (!$evento) {
            return response()->json(['error' => 'Actividad sin evento asociado.'], 422);
        }
        $this->authorizeActividadAccess($actividad, $evento);

        $data = $request->validate([
            'layout' => 'required|array',
        ]);

        $actividad->update([
            'asistencia_layout' => $data['layout'],
        ]);

        return response()->json(['status' => 'ok']);
    }

    private function authorizeActividadAccess(E_Actividad $actividad, E_Evento $evento)
    {
        $user = Auth::user();
        if (!$user) {
            abort(403);
        }

        if ($user->esSuperAdmin()) {
            return;
        }

        if (!$user->tieneRolEntidad('ADMIN')) {
            abort(403);
        }

        if (!$user->adminEntidadIds()->contains($evento->entidad_id)) {
            abort(403);
        }
    }

}
