<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\E_GrupoEntidad;
use Illuminate\Support\Facades\Auth;

use App\Models\E_GrupoUsuario;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use App\Models\E_Entidad;
use App\Models\E_EntidadUsuario;
use App\Models\E_RolEntidad;

class E_GrupoController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $query = \App\Models\E_GrupoEntidad::with('entidad')
            ->withCount('usuarios')
            ->orderBy('created_at', 'desc');

        if (!$user->esSuperAdmin()) {
            $entidadIds = $user->adminEntidadIds();
            $query->whereIn('entidad_id', $entidadIds);
        }

        $grupos = $query->paginate(10);

        return view('admin.grupos.index', compact('grupos'));
    }

    public function create()
    {
        $user = Auth::user();
        if ($user->esSuperAdmin()) {
            $entidades = E_Entidad::orderBy('nombre')->get();
        } else {
            $entidades = E_Entidad::whereIn('id', $user->adminEntidadIds())->orderBy('nombre')->get();
        }
        return view('admin.grupos.create', compact('entidades'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'entidad_id' => 'required|exists:E_entidades,id',
            'nombre' => 'required|string|max:150',
            'descripcion' => 'nullable|string|max:255',
        ]);

        $user = Auth::user();
        if (!$user->esSuperAdmin() && !$user->adminEntidadIds()->contains((int) $request->entidad_id)) {
            abort(403);
        }

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
        $this->authorizeGrupoAccess($grupo);
        return view('admin.grupos.edit', compact('grupo'));
    }

    public function update(Request $request, $id)
    {
        $grupo = E_GrupoEntidad::findOrFail($id);
        $this->authorizeGrupoAccess($grupo);

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
        $this->authorizeGrupoAccess($grupo);
        return view('admin.grupos.miembros', compact('grupo'));
    }

    public function buscarUsuarios(Request $request, $id)
    {
        $grupo = E_GrupoEntidad::findOrFail($id);
        $this->authorizeGrupoAccess($grupo);
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
        $this->authorizeGrupoAccess($grupo);
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

        $this->attachEntityMember($grupo, $usuario_id);

        return response()->json(['success' => 'Usuario agregado correctamente.']);
    }

    public function eliminarUsuario($id, $usuario_id)
    {
        $grupo = E_GrupoEntidad::findOrFail($id);
        $this->authorizeGrupoAccess($grupo);
        E_GrupoUsuario::where('grupo_id', $id)
                    ->where('usuario_id', $usuario_id)
                    ->delete();

        return response()->json(['success' => 'Usuario eliminado del grupo.']);
    }

    public function registrarUsuario(Request $request, $id)
    {
        $grupo = E_GrupoEntidad::findOrFail($id);
        $this->authorizeGrupoAccess($grupo);

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'nullable|email|max:255|unique:users,email|required_without:nro_documento',
            'nro_documento' => [
                'nullable',
                'string',
                'max:25',
                'required_without:email',
                Rule::unique('users', 'nro_documento')->where(function ($query) use ($request) {
                    return $query->where('tipo_documento', $request->tipo_documento);
                }),
            ],
            'tipo_documento' => 'nullable|in:1,2,3,4|required_with:nro_documento',
            'sexo' => 'nullable|in:M,F',
        ], [
            'email.required_without' => 'Debe ingresar correo o número de documento.',
            'nro_documento.required_without' => 'Debe ingresar correo o número de documento.',
            'nro_documento.unique' => 'El número de documento ya existe para ese tipo de documento.',
        ]);

        $tipoDocumento = $request->filled('nro_documento')
            ? ($request->tipo_documento ?: '1')
            : null;

        $rawPassword = $request->filled('nro_documento') ? $request->nro_documento : '12345678';

        $usuario = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($rawPassword),
            'tipo_documento' => $tipoDocumento,
            'nro_documento' => $request->nro_documento,
            'sexo' => $request->sexo,
        ]);

        E_GrupoUsuario::firstOrCreate(
            ['grupo_id' => $grupo->id, 'usuario_id' => $usuario->id],
            ['id_user_create' => Auth::id()]
        );

        $this->attachEntityMember($grupo, $usuario->id);

        return redirect()
            ->route('admin.grupos.miembros', $grupo->id)
            ->with('success', 'Usuario registrado y agregado al grupo.');
    }

    private function attachEntityMember(E_GrupoEntidad $grupo, $usuarioId)
    {
        if (!$grupo->entidad_id) {
            return;
        }

        $rolMiembro = E_RolEntidad::firstOrCreate(
            ['entidad_id' => $grupo->entidad_id, 'codigo' => 'MIEMBRO'],
            [
                'nombre' => 'Miembro',
                'descripcion' => null,
                'id_user_create' => Auth::id(),
            ]
        );

        E_EntidadUsuario::firstOrCreate(
            ['entidad_id' => $grupo->entidad_id, 'usuario_id' => $usuarioId],
            [
                'rol_entidad_id' => $rolMiembro->id,
                'es_propietario' => 0,
                'id_user_create' => Auth::id(),
            ]
        );
    }

    private function authorizeGrupoAccess(E_GrupoEntidad $grupo)
    {
        $user = Auth::user();
        if ($user->esSuperAdmin()) {
            return;
        }

        if (!$user->adminEntidadIds()->contains($grupo->entidad_id)) {
            abort(403);
        }
    }
}
