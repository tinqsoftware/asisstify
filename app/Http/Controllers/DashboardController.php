<?php

namespace App\Http\Controllers;

use App\Models\E_Entidad;
use App\Models\E_Evento;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        if (!Auth::check()) {
            return view('inicio');
        }

        $user = Auth::user();
        $isAdmin = $user->esSuperAdmin() || $user->tieneRolEntidad('ADMIN');
        $isMember = $user->grupos()->exists();

        if (!$isAdmin && !$isMember) {
            return view('inicio');
        }

        $today = Carbon::today();
        $data = [
            'user' => $user,
            'isAdmin' => $isAdmin,
            'isMember' => $isMember,
        ];

        if ($isAdmin) {
            $entidadIds = $user->esSuperAdmin()
                ? E_Entidad::pluck('id')->all()
                : $user->adminEntidadIds()->all();

            $adminEventos = E_Evento::with('dias.actividades.asistencias')
                ->whereIn('entidad_id', $entidadIds)
                ->whereDate('fecha_fin', '>=', $today)
                ->orderBy('fecha_inicio')
                ->take(4)
                ->get()
                ->map(function ($evento) {
                    $confirmados = $evento->dias->flatMap->actividades->flatMap->asistencias
                        ->where('metodo_entrada', 'confirmacion')
                        ->unique('usuario_id')
                        ->count();
                    $asistidos = $evento->dias->flatMap->actividades->flatMap->asistencias
                        ->where('metodo_entrada', '!=', 'confirmacion')
                        ->unique('usuario_id')
                        ->count();

                    $evento->confirmados_count = $confirmados;
                    $evento->asistidos_count = $asistidos;
                    return $evento;
                });

            $data['adminEventos'] = $adminEventos;
            $data['adminTotalEventos'] = E_Evento::whereIn('entidad_id', $entidadIds)->count();
        }

        if ($isMember) {
            $userId = $user->id;
            $memberEventos = E_Evento::with([
                'dias.actividades.asistencias' => function ($q) use ($userId) {
                    $q->where('usuario_id', $userId);
                }
            ])
                ->whereHas('dias.actividades.asistencias', function ($q) use ($userId) {
                    $q->where('usuario_id', $userId);
                })
                ->orderBy('fecha_inicio')
                ->get();

            $proximos = $memberEventos->filter(function ($evento) use ($today) {
                return Carbon::parse($evento->fecha_fin)->gte($today);
            })->values();

            $pasados = $memberEventos->filter(function ($evento) use ($today) {
                return Carbon::parse($evento->fecha_fin)->lt($today);
            })->values();

            $data['memberProximos'] = $proximos->take(3);
            $data['memberNext'] = $proximos->first();
            $data['memberPasados'] = $pasados->take(3);
            $data['memberGrupos'] = $user->grupos()->with('entidad')->take(4)->get();
        }

        return view('home.dashboard', $data);
    }
}
