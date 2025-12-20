<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\E_Evento;
use App\Models\E_Encuesta;
use App\Models\E_EncuestaOpcion;
use App\Models\E_EncuestaVoto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class E_EncuestaController extends Controller
{
    // Listado de encuestas de un evento
    public function index(E_Evento $evento)
    {
        $encuestas = $evento->encuestas()
            ->withCount(['votos as total_votos' => function ($q) {
                $q->whereColumn('ronda', 'E_encuestas.ronda_actual');
            }])
            ->with('opciones')
            ->orderBy('id', 'asc')
            ->get();

        return view('admin.encuestas.index', compact('evento', 'encuestas'));
    }

    // Formulario crear encuesta
    public function create(E_Evento $evento)
    {
        return view('admin.encuestas.create', compact('evento'));
    }

    // Guardar nueva encuesta + opciones
    public function store(Request $request, E_Evento $evento)
    {
        $data = $request->validate([
            'nombre'                     => 'required|string|max:200',
            'descripcion'               => 'nullable|string',
            'tipo'                      => 'required|in:karaoke,ranking',
            'es_abierta'                => 'nullable|boolean',
            'unica_por_opcion'          => 'nullable|boolean',
            'max_opciones_por_usuario'  => 'required|integer|min:1',
            'modo_resultados'           => 'required|in:tiempo_real,solo_total,final',
            'permitir_cambiar_voto'     => 'nullable|boolean',
            'opciones'                  => 'required|array|min:2',
            'opciones.*.nombre'         => 'required|string|max:200',
            'opciones.*.descripcion'    => 'nullable|string',
            'opciones.*.color'          => 'nullable|string|max:20',
        ]);

        $encuesta = E_Encuesta::create([
            'evento_id'                 => $evento->id,
            'nombre'                    => $data['nombre'],
            'slug'                      => \Str::slug($data['nombre'] . '-' . $evento->id),
            'descripcion'               => $data['descripcion'] ?? null,
            'tipo'                      => $data['tipo'],
            'es_abierta'                => $data['es_abierta'] ?? 0,
            'unica_por_opcion'          => $data['unica_por_opcion'] ?? 0,
            'max_opciones_por_usuario'  => $data['max_opciones_por_usuario'],
            'modo_resultados'           => $data['modo_resultados'],
            'permitir_cambiar_voto'     => $data['permitir_cambiar_voto'] ?? 0,
            'ronda_actual'              => 1,
            'estado'                    => 'borrador',
            'id_user'                   => Auth::id(),
        ]);

        foreach ($data['opciones'] as $i => $opt) {
            E_EncuestaOpcion::create([
                'encuesta_id' => $encuesta->id,
                'nombre'      => $opt['nombre'],
                'descripcion' => $opt['descripcion'] ?? null,
                'color'       => $opt['color'] ?? null,
                'orden'       => $i + 1,
                'es_activa'   => 1,
                'es_bloqueada'=> 0,
                'id_user'     => Auth::id(),
            ]);
        }

        return redirect()->route('admin.eventos.encuestas.index', $evento->id)
            ->with('success', 'Encuesta creada correctamente.');
    }

    // Formulario edición
    public function edit(E_Evento $evento, E_Encuesta $encuesta)
    {
        $encuesta->load('opciones');

        return view('admin.encuestas.edit', compact('evento', 'encuesta'));
    }

    // Actualizar encuesta y opciones (con imagen)
    public function update(Request $request, E_Evento $evento, E_Encuesta $encuesta)
    {
        $rules = [
            'nombre'                     => 'required|string|max:200',
            'descripcion'               => 'nullable|string',
            'tipo'                      => 'required|in:karaoke,ranking',
            'es_abierta'                => 'nullable|boolean',
            'unica_por_opcion'          => 'nullable|boolean',
            'max_opciones_por_usuario'  => 'required|integer|min:1',
            'modo_resultados'           => 'required|in:tiempo_real,solo_total,final',
            'permitir_cambiar_voto'     => 'nullable|boolean',

            // Opciones existentes
            'opciones'                  => 'required|array|min:2',
            'opciones.*.nombre'         => 'required|string|max:200',
            'opciones.*.descripcion'    => 'nullable|string',
            'opciones.*.color'          => 'nullable|string|max:20',
            'opciones.*.imagen'         => 'nullable|image|max:2048', // jpg, png, etc.
        ];

        $data = $request->validate($rules);

        // Datos generales de la encuesta
        $encuesta->update([
            'nombre'                    => $data['nombre'],
            'descripcion'               => $data['descripcion'] ?? null,
            'tipo'                      => $data['tipo'],
            'es_abierta'                => $data['es_abierta'] ?? 0,
            'unica_por_opcion'          => $data['unica_por_opcion'] ?? 0,
            'max_opciones_por_usuario'  => $data['max_opciones_por_usuario'],
            'modo_resultados'           => $data['modo_resultados'],
            'permitir_cambiar_voto'     => $data['permitir_cambiar_voto'] ?? 0,
            'id_user'                   => Auth::id(),
        ]);

        // Datos de opciones
        $opcionesInput = $data['opciones']; // array indexado por id de opción

        foreach ($encuesta->opciones as $opt) {
            // Cada opción vendrá como opciones[ID][...]
            if (!isset($opcionesInput[$opt->id])) {
                continue;
            }

            $optData = $opcionesInput[$opt->id];

            $updateOpt = [
                'nombre'      => $optData['nombre'],
                'descripcion' => $optData['descripcion'] ?? null,
                'color'       => $optData['color'] ?? null,
            ];

            // Si subieron nueva imagen para esta opción
            if ($request->hasFile("opciones.{$opt->id}.imagen")) {
                $path = $request->file("opciones.{$opt->id}.imagen")
                    ->store('encuestas_opciones', 'public'); // storage/app/public/encuestas_opciones
                $updateOpt['imagen'] = $path;
            }

            $opt->update($updateOpt);
        }

        return redirect()->route('admin.eventos.encuestas.index', $evento->id)
            ->with('success', 'Encuesta actualizada.');
    }

    // Activar encuesta (la deja lista para votar)
    public function activar(E_Evento $evento, E_Encuesta $encuesta)
    {
        $encuesta->update([
            'estado'  => 'activa',
            'id_user' => Auth::id(),
        ]);

        return back()->with('success', 'Encuesta activada.');
    }

    // Cerrar encuesta (ya no acepta votos)
    public function cerrar(E_Evento $evento, E_Encuesta $encuesta)
    {
        $encuesta->update([
            'estado'  => 'cerrada',
            'id_user' => Auth::id(),
        ]);

        return back()->with('success', 'Encuesta cerrada.');
    }

    // Abrir nueva ronda (resetea votos por ronda pero conserva histórico)
    public function nuevaRonda(E_Evento $evento, E_Encuesta $encuesta)
    {
        $encuesta->update([
            'ronda_actual' => $encuesta->ronda_actual + 1,
            'estado'       => 'activa',
            'id_user'      => Auth::id(),
        ]);

        // desbloquear opciones (por si es karaoke)
        $encuesta->opciones()->update(['es_bloqueada' => 0]);

        return back()->with('success', 'Nueva ronda iniciada.');
    }

    // Pantalla grande con ranking / karaoke
    public function pantalla(Request $request, E_Evento $evento, E_Encuesta $encuesta)
    {
        $encuesta->load('opciones');
        $adminLive = false;
        $nextEncuesta = E_Encuesta::where('evento_id', $evento->id)
            ->where('id', '>', $encuesta->id)
            ->orderBy('id')
            ->first();
        $prevEncuesta = E_Encuesta::where('evento_id', $evento->id)
            ->where('id', '<', $encuesta->id)
            ->orderBy('id', 'desc')
            ->first();

        if ($request->boolean('live')) {
            $user = Auth::user();
            if ($user) {
                if ($user->esSuperAdmin()) {
                    $adminLive = true;
                } elseif ($user->tieneRolEntidad('ADMIN') && $user->adminEntidadIds()->contains($evento->entidad_id)) {
                    $adminLive = true;
                }
            }
        }

        return view('admin.encuestas.pantalla', compact('evento', 'encuesta', 'adminLive', 'nextEncuesta', 'prevEncuesta'));
    }
}
