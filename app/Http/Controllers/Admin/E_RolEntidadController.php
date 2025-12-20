<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\E_RolEntidad;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;

class E_RolEntidadController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $query = E_RolEntidad::orderBy('created_at', 'desc');
        if (!$user->esSuperAdmin()) {
            $query->whereIn('entidad_id', $user->adminEntidadIds());
        }

        $roles = $query->paginate(10);
        return view('admin.roles.index', compact('roles'));
    }

    public function create()
    {
        if (!Auth::user()->esSuperAdmin()) {
            abort(403);
        }
        return view('admin.roles.create');
    }

    public function store(Request $request)
    {
        if (!Auth::user()->esSuperAdmin()) {
            abort(403);
        }
        $request->validate([
            'codigo' => [
                'required',
                'string',
                'max:50',
                Rule::unique('E_roles_entidad', 'codigo')->whereNull('entidad_id'),
            ],
            'nombre' => 'required|string|max:100',
            'descripcion' => 'nullable|string|max:255',
        ]);

        E_RolEntidad::create([
            'codigo' => strtoupper($request->codigo),
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'entidad_id' => null,
            'id_user_create' => auth()->id(),
        ]);

        return redirect()->route('admin.roles.index')
            ->with('success', 'Rol creado correctamente.');
    }

    public function edit($id)
    {
        if (!Auth::user()->esSuperAdmin()) {
            abort(403);
        }
        $rol = E_RolEntidad::findOrFail($id);
        return view('admin.roles.edit', compact('rol'));
    }

    public function update(Request $request, $id)
    {
        if (!Auth::user()->esSuperAdmin()) {
            abort(403);
        }
        $request->validate([
            'nombre' => 'required|string|max:100',
            'descripcion' => 'nullable|string|max:255',
        ]);

        $rol = E_RolEntidad::findOrFail($id);
        $rol->update([
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
        ]);

        return redirect()->route('admin.roles.index')
            ->with('success', 'Rol actualizado correctamente.');
    }
}
