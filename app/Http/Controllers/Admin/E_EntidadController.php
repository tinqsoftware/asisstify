<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\E_Entidad;
use App\Models\E_EntidadUsuario;
use App\Models\E_RolEntidad;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class E_EntidadController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $query = E_Entidad::orderBy('created_at', 'desc');

        if (!$user->esSuperAdmin()) {
            $query->whereIn('id', $user->adminEntidadIds());
        }

        $entidades = $query->paginate(10);
        $adminsPorEntidad = [];
        $ownerPorEntidad = [];

        foreach ($entidades as $entidad) {
            $admins = $this->getAdmins($entidad);

            $adminsPorEntidad[$entidad->id] = $admins;
            $ownerPorEntidad[$entidad->id] = optional(
                $admins->firstWhere('es_propietario', 1)
            )->usuario_id;
        }

        return view('admin.entidades.index', compact('entidades', 'adminsPorEntidad', 'ownerPorEntidad'));
    }

    public function create()
    {
        if (!Auth::user()->esSuperAdmin()) {
            abort(403);
        }
        return view('admin.entidades.create');
    }

    public function store(Request $request)
    {
        if (!Auth::user()->esSuperAdmin()) {
            abort(403);
        }
        $request->validate([
            'nombre' => 'required|string|max:200',
            'descripcion' => 'nullable|string',
            'estado' => 'required|boolean',
            'admin_ids' => 'required|array|min:1',
            'admin_ids.*' => 'integer|exists:users,id',
            'owner_id' => 'nullable|integer|exists:users,id',
        ]);

        $entidad = E_Entidad::create([
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'estado' => $request->estado,
            'id_user_create' => auth()->id(),
        ]);

        $adminIds = $request->input('admin_ids', []);
        $ownerId = $request->input('owner_id');
        $this->syncAdmins($entidad, $adminIds, $ownerId);

        return redirect()->route('admin.entidades.index')
            ->with('success', 'Entidad creada correctamente.');
    }

    public function edit($id)
    {
        $entidad = E_Entidad::findOrFail($id);
        $this->authorizeEntidadAccess($entidad);
        $admins = collect();
        $ownerId = null;
        if (Auth::user()->esSuperAdmin()) {
            $admins = $this->getAdmins($entidad);
            $ownerId = optional($admins->firstWhere('es_propietario', 1))->usuario_id;
        }

        return view('admin.entidades.edit', compact('entidad', 'admins', 'ownerId'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nombre' => 'required|string|max:200',
            'descripcion' => 'nullable|string',
            'estado' => 'required|boolean',
        ]);

        $entidad = E_Entidad::findOrFail($id);
        $this->authorizeEntidadAccess($entidad);
        $entidad->update([
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'estado' => $request->estado,
        ]);

        if (Auth::user()->esSuperAdmin()) {
            $request->validate([
                'admin_ids' => 'required|array|min:1',
                'admin_ids.*' => 'integer|exists:users,id',
                'owner_id' => 'nullable|integer|exists:users,id',
            ]);
            $adminIds = $request->input('admin_ids', []);
            $ownerId = $request->input('owner_id');
            $this->syncAdmins($entidad, $adminIds, $ownerId);
        }

        return redirect()->route('admin.entidades.index')
            ->with('success', 'Entidad actualizada correctamente.');
    }

    public function buscarUsuarios(Request $request)
    {
        $q = trim($request->get('q'));

        if (strlen($q) < 3) {
            return response()->json([]);
        }

        $usuarios = \App\Models\User::where(function ($query) use ($q) {
            $query->where('name', 'LIKE', "%$q%")
                ->orWhere('apellidos', 'LIKE', "%$q%")
                ->orWhere('email', 'LIKE', "%$q%")
                ->orWhere('nro_documento', 'LIKE', "%$q%");
        })
            ->limit(10)
            ->get(['id', 'name', 'apellidos', 'email', 'nro_documento']);

        return response()->json($usuarios);
    }

    public function syncAdminsRequest(Request $request, $id)
    {
        if (!Auth::user()->esSuperAdmin()) {
            abort(403);
        }
        $request->validate([
            'admin_ids' => 'required|array|min:1',
            'admin_ids.*' => 'integer|exists:users,id',
            'owner_id' => 'nullable|integer|exists:users,id',
        ]);

        $entidad = E_Entidad::findOrFail($id);
        $this->authorizeEntidadAccess($entidad);
        $adminIds = $request->input('admin_ids', []);
        $ownerId = $request->input('owner_id');

        $this->syncAdmins($entidad, $adminIds, $ownerId);

        return redirect()->route('admin.entidades.index')
            ->with('success', 'Administradores actualizados correctamente.');
    }

    private function ensureDefaultRoles(E_Entidad $entidad)
    {
        $admin = E_RolEntidad::firstOrCreate(
            ['entidad_id' => $entidad->id, 'codigo' => 'ADMIN'],
            [
                'nombre' => 'Administrador',
                'descripcion' => null,
                'id_user_create' => Auth::id(),
            ]
        );

        $miembro = E_RolEntidad::firstOrCreate(
            ['entidad_id' => $entidad->id, 'codigo' => 'MIEMBRO'],
            [
                'nombre' => 'Miembro',
                'descripcion' => null,
                'id_user_create' => Auth::id(),
            ]
        );

        return ['admin' => $admin, 'miembro' => $miembro];
    }

    private function syncAdmins(E_Entidad $entidad, array $adminIds, $ownerId)
    {
        $adminIds = array_values(array_unique(array_filter($adminIds)));
        $ownerId = $ownerId ? (int) $ownerId : null;

        if (empty($adminIds)) {
            throw ValidationException::withMessages([
                'admin_ids' => 'Debes seleccionar al menos un administrador.',
            ]);
        }

        if (!$ownerId || !in_array($ownerId, $adminIds, true)) {
            $ownerId = $adminIds[0];
        }

        $adminRole = $this->ensureDefaultRoles($entidad)['admin'];

        E_EntidadUsuario::where('entidad_id', $entidad->id)->update(['es_propietario' => 0]);

        E_EntidadUsuario::where('entidad_id', $entidad->id)
            ->where('rol_entidad_id', $adminRole->id)
            ->when(!empty($adminIds), function ($query) use ($adminIds) {
                $query->whereNotIn('usuario_id', $adminIds);
            })
            ->when(empty($adminIds), function ($query) {
                $query->whereNotNull('usuario_id');
            })
            ->delete();

        foreach ($adminIds as $userId) {
            E_EntidadUsuario::updateOrCreate(
                ['entidad_id' => $entidad->id, 'usuario_id' => $userId],
                [
                    'rol_entidad_id' => $adminRole->id,
                    'es_propietario' => $ownerId === (int) $userId ? 1 : 0,
                    'id_user_create' => Auth::id(),
                ]
            );
        }
    }

    private function getAdmins(E_Entidad $entidad)
    {
        return E_EntidadUsuario::with(['usuario', 'rol'])
            ->where('entidad_id', $entidad->id)
            ->whereHas('rol', function ($q) use ($entidad) {
                $q->where('codigo', 'ADMIN')
                    ->where(function ($q2) use ($entidad) {
                        $q2->whereNull('entidad_id')
                            ->orWhere('entidad_id', $entidad->id);
                    });
            })
            ->get();
    }

    private function authorizeEntidadAccess(E_Entidad $entidad)
    {
        $user = Auth::user();
        if ($user->esSuperAdmin()) {
            return;
        }

        if (!$user->adminEntidadIds()->contains($entidad->id)) {
            abort(403);
        }
    }
}
