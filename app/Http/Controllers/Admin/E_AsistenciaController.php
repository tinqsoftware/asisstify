<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\E_Evento;

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
        return view('admin.eventos.panel_asistencia_actividad', compact('evento', 'actividad'));
    }
}