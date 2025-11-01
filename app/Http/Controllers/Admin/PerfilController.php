<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\E_RostroUsuario;

class PerfilController extends Controller
{
    public function index()
    {
        $usuario = Auth::user();
        $rostros = E_RostroUsuario::where('usuario_id', $usuario->id)->get();

        return view('perfil.index', compact('usuario', 'rostros'));
    }

    public function subirRostros(Request $request)
    {
        $request->validate([
            'rostros.*' => 'required|image|mimes:jpeg,png,jpg|max:512',
            'embeddings.*' => 'nullable|string'
        ]);

        $usuario = Auth::user();
        $rostros = $request->file('rostros', []);
        $embeddings = $request->input('embeddings', []);

        foreach ($rostros as $i => $foto) {
            $path = $foto->store('rostros/' . $usuario->id, 'public');
            $this->comprimirImagen(storage_path('app/public/' . $path));

            E_RostroUsuario::create([
                'usuario_id' => $usuario->id,
                'imagen_path' => $path,
                'embedding' => isset($embeddings[$i]) ? json_encode(json_decode($embeddings[$i])) : null, // 🧠 aquí guardas el vector
                'id_user_create' => $usuario->id,
            ]);
        }

        return back()->with('success', 'Fotos de rostro cargadas correctamente.');
    }

    private function comprimirImagen($ruta)
    {
        $imagen = imagecreatefromstring(file_get_contents($ruta));
        imagejpeg($imagen, $ruta, 60); // calidad 60/100
        imagedestroy($imagen);
    }

    public function eliminar($id)
    {
        $rostro = E_RostroUsuario::findOrFail($id);
        unlink(storage_path('app/public/' . $rostro->imagen_path));
        $rostro->delete();
        return back()->with('success', 'Foto eliminada correctamente.');
    }
}