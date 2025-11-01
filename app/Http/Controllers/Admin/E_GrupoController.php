<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\E_GrupoEntidad;
use Illuminate\Support\Facades\Auth;

use App\Models\E_GrupoUsuario;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class E_GrupoController extends Controller
{
    public function index()
    {
        $grupos = \App\Models\E_GrupoEntidad::with('entidad')
                    ->withCount('usuarios')
                    ->orderBy('created_at', 'desc')
                    ->paginate(10);

        return view('admin.grupos.index', compact('grupos'));
    }

    public function create()
    {
        // Obtener las entidades creadas por el usuario autenticado
        $entidades = \App\Models\E_Entidad::where('id_user_create', Auth::id())->get();
        return view('admin.grupos.create', compact('entidades'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'entidad_id' => 'required|exists:E_entidades,id',
            'nombre' => 'required|string|max:150',
            'descripcion' => 'nullable|string|max:255',
        ]);

        E_GrupoEntidad::create([
            'entidad_id' => $request->entidad_id,
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'estado' => 1,
            'id_user_create' => Auth::id(),
        ]);

        return redirect()->route('admin.grupos.index')->with('success', 'Grupo creado correctamente.');
    }

    public function edit($id)
    {
        $grupo = E_GrupoEntidad::findOrFail($id);
        return view('admin.grupos.edit', compact('grupo'));
    }

    public function update(Request $request, $id)
    {
        $grupo = E_GrupoEntidad::findOrFail($id);

        $request->validate([
            'nombre' => 'required|string|max:150',
            'descripcion' => 'nullable|string|max:255',
            'estado' => 'required|boolean'
        ]);

        $grupo->update($request->only(['nombre', 'descripcion', 'estado']));

        return redirect()->route('admin.grupos.index')->with('success', 'Grupo actualizado correctamente.');
    }

    public function miembros($id)
    {
        $grupo = E_GrupoEntidad::with(['usuarios'])->findOrFail($id);
        return view('admin.grupos.miembros', compact('grupo'));
    }

    public function buscarUsuarios(Request $request, $id)
    {
        $q = trim($request->get('q'));

        if (strlen($q) < 3) {
            return response()->json([]);
        }

        $usuarios = User::where(function($query) use ($q) {
            $query->where('name', 'LIKE', "%$q%")
                ->orWhere('apellidos', 'LIKE', "%$q%")
                ->orWhere('email', 'LIKE', "%$q%")
                ->orWhere('nro_documento', 'LIKE', "%$q%");
        })
        ->limit(10)
        ->get(['id', 'name', 'apellidos', 'email', 'nro_documento']);

        return response()->json($usuarios);
    }

    public function agregarUsuario(Request $request, $id)
    {
        $grupo = E_GrupoEntidad::findOrFail($id);
        $usuario_id = $request->usuario_id;

        $existe = E_GrupoUsuario::where('grupo_id', $id)
                    ->where('usuario_id', $usuario_id)
                    ->exists();

        if ($existe) {
            return response()->json(['error' => 'El usuario ya pertenece a este grupo.'], 409);
        }

        E_GrupoUsuario::create([
            'grupo_id' => $id,
            'usuario_id' => $usuario_id,
            'id_user_create' => Auth::id(),
        ]);

        return response()->json(['success' => 'Usuario agregado correctamente.']);
    }

    public function eliminarUsuario($id, $usuario_id)
    {
        E_GrupoUsuario::where('grupo_id', $id)
                    ->where('usuario_id', $usuario_id)
                    ->delete();

        return response()->json(['success' => 'Usuario eliminado del grupo.']);
    }
}