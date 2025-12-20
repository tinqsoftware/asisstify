<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\E_AsistenciaActividad;
use App\Models\E_Evento;
use App\Models\E_EventoGrupo;
use App\Models\E_EventoGrupoUsuario;
use App\Models\E_GrupoEntidad;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class E_EventoGrupoController extends Controller
{
    public function index(E_Evento $evento)
    {
        $this->authorizeEventoAccess($evento);

        $grupos = E_EventoGrupo::with('usuarios')
            ->where('evento_id', $evento->id)
            ->orderBy('created_at', 'desc')
            ->get();

        $confirmadosRaw = E_AsistenciaActividad::with('usuario')
            ->where('metodo_entrada', 'confirmacion')
            ->whereHas('actividad.dia', function ($q) use ($evento) {
                $q->where('evento_id', $evento->id);
            })
            ->get()
            ->pluck('usuario')
            ->filter()
            ->unique('id')
            ->values();

        $userIdsAll = $confirmadosRaw->pluck('id')
            ->merge($grupos->flatMap(fn($g) => $g->usuarios->pluck('id')))
            ->unique()
            ->values();

        $grupoEntidadPorUsuario = DB::table('E_grupo_usuarios')
            ->join('E_grupos_entidad', 'E_grupos_entidad.id', '=', 'E_grupo_usuarios.grupo_id')
            ->whereIn('E_grupo_usuarios.usuario_id', $userIdsAll)
            ->select('E_grupo_usuarios.usuario_id', 'E_grupos_entidad.nombre')
            ->get()
            ->groupBy('usuario_id')
            ->map(fn($rows) => $rows->pluck('nombre')->unique()->implode(', '));

        $confirmados = $confirmadosRaw->map(function ($u) use ($grupoEntidadPorUsuario) {
            return [
                'id' => $u->id,
                'name' => trim(($u->name ?? '') . ' ' . ($u->apellidos ?? '')),
                'email' => $u->email,
                'nro_documento' => $u->nro_documento,
                'grupo_entidad' => $grupoEntidadPorUsuario[$u->id] ?? '—',
            ];
        })->values();

        $gruposEntidad = E_GrupoEntidad::where('entidad_id', $evento->entidad_id)
            ->orderBy('nombre')
            ->get(['id', 'nombre']);

        return view('admin.eventos.grupos', compact('evento', 'grupos', 'confirmados', 'gruposEntidad', 'grupoEntidadPorUsuario'));
    }

    public function store(Request $request, E_Evento $evento)
    {
        $this->authorizeEventoAccess($evento);

        $request->validate([
            'nombre' => 'required|string|max:150',
            'descripcion' => 'nullable|string|max:255',
        ]);

        E_EventoGrupo::create([
            'evento_id' => $evento->id,
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'id_user_create' => Auth::id(),
        ]);

        return back()->with('success', 'Grupo creado correctamente.');
    }

    public function updateMiembros(Request $request, E_Evento $evento, E_EventoGrupo $grupo)
    {
        $this->authorizeEventoAccess($evento);

        if ($grupo->evento_id !== $evento->id) {
            abort(404);
        }

        $userIds = array_values(array_unique(array_filter($request->input('user_ids', []))));

        E_EventoGrupoUsuario::where('evento_grupo_id', $grupo->id)
            ->when(!empty($userIds), function ($q) use ($userIds) {
                $q->whereNotIn('usuario_id', $userIds);
            })
            ->when(empty($userIds), function ($q) {
                $q->whereNotNull('usuario_id');
            })
            ->delete();

        foreach ($userIds as $userId) {
            E_EventoGrupoUsuario::firstOrCreate(
                ['evento_grupo_id' => $grupo->id, 'usuario_id' => $userId],
                ['id_user_create' => Auth::id()]
            );
        }

        return back()->with('success', 'Miembros actualizados.');
    }

    private function authorizeEventoAccess(E_Evento $evento)
    {
        $user = Auth::user();
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
