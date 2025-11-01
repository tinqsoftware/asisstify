<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\E_Entidad;
use Illuminate\Http\Request;

class E_EntidadController extends Controller
{
    public function index()
    {
        $entidades = E_Entidad::orderBy('created_at', 'desc')->paginate(10);
        return view('admin.entidades.index', compact('entidades'));
    }

    public function create()
    {
        return view('admin.entidades.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|string|max:200',
            'descripcion' => 'nullable|string',
            'estado' => 'required|boolean',
        ]);

        E_Entidad::create([
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'estado' => $request->estado,
            'id_user_create' => auth()->id(),
        ]);

        return redirect()->route('admin.entidades.index')
            ->with('success', 'Entidad creada correctamente.');
    }

    public function edit($id)
    {
        $entidad = E_Entidad::findOrFail($id);
        return view('admin.entidades.edit', compact('entidad'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nombre' => 'required|string|max:200',
            'descripcion' => 'nullable|string',
            'estado' => 'required|boolean',
        ]);

        $entidad = E_Entidad::findOrFail($id);
        $entidad->update([
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'estado' => $request->estado,
        ]);

        return redirect()->route('admin.entidades.index')
            ->with('success', 'Entidad actualizada correctamente.');
    }
}