<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\E_Evento;
use Illuminate\Support\Facades\Auth;

class E_EventoController extends Controller
{
    public function index()
    {
        $eventos = E_Evento::orderBy('created_at', 'desc')->paginate(10);
        return view('admin.eventos.index', compact('eventos'));
    }

    public function create()
    {
        $user = Auth::user();

        // Entidades creadas directamente por el usuario
        $entidades = \App\Models\E_Entidad::where('id_user_create', $user->id);

        // Entidades a las que pertenece el usuario mediante un grupo
        $entidadesGrupo = \App\Models\E_Entidad::whereHas('grupos.usuarios', function ($q) use ($user) {
            $q->where('users.id', $user->id);
        });

        // Unir ambas colecciones sin duplicados
        $entidades = $entidades->union($entidadesGrupo)->get();

        return view('admin.eventos.create', compact('entidades'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'titulo' => 'required|string|max:255',
            'modalidad' => 'required|in:presencial,virtual,híbrido',
            'fecha_inicio' => 'required|date',
            'fecha_fin' => 'required|date|after_or_equal:fecha_inicio',
        ]);

        $evento = E_Evento::create([
            'entidad_id' => $request->entidad_id,
            'titulo' => $request->titulo,
            'descripcion' => $request->descripcion,
            'lugar' => $request->lugar,
            'modalidad' => $request->modalidad,
            'fecha_inicio' => $request->fecha_inicio,
            'fecha_fin' => $request->fecha_fin,
            'estado' => 'borrador',
            'id_user_create' => Auth::id(),
        ]);
        

        // GUARDAR DÍAS Y ACTIVIDADES DESDE JSON
        if (!empty($request->dias_json) && $request->dias_json != '[]') {
            $actividades = collect(json_decode($request->dias_json, true))
                ->filter(fn($a) => !empty($a['start']) && !empty($a['end']));

            if ($actividades->isNotEmpty()) {
                $diasAgrupados = $actividades->groupBy(fn($a) => date('Y-m-d', strtotime($a['start'])));

                foreach ($diasAgrupados as $fecha => $acts) {
                    $dia = \App\Models\E_EventoDia::create([
                        'evento_id' => $evento->id,
                        'fecha' => $fecha,
                        'titulo' => 'Día ' . date('d/m', strtotime($fecha)),
                        'id_user_create' => Auth::id(),
                    ]);

                    foreach ($acts as $act) {
                        \App\Models\E_Actividad::create([
                            'evento_dia_id' => $dia->id,
                            'titulo' => $act['title'],
                            'hora_inicio' => date('H:i:s', strtotime($act['start'])),
                            'hora_fin' => date('H:i:s', strtotime($act['end'])),
                            'requiere_asistencia' => !empty($act['requiere_asistencia']) ? 1 : 0,
                            'id_user_create' => Auth::id(),
                        ]);
                    }
                }
            }
        }

        return redirect()->route('admin.eventos.index')->with('success', 'Evento creado correctamente.');
    }

    public function edit($id)
    {
        $evento = \App\Models\E_Evento::with('dias.actividades')->findOrFail($id);

        // Convertimos las actividades en formato compatible con FullCalendar
        $actividades = [];
        foreach ($evento->dias as $dia) {
            foreach ($dia->actividades as $act) {
                $actividades[] = [
                    'id' => $act->id,
                    'title' => $act->titulo,
                    'start' => $dia->fecha . 'T' . $act->hora_inicio,
                    'end' => $dia->fecha . 'T' . $act->hora_fin,
                    'requiere_asistencia' => (bool) $act->requiere_asistencia,
                ];
            }
        }

        $jsonActividades = json_encode($actividades);

        return view('admin.eventos.edit', compact('evento', 'jsonActividades'));
    }

    public function update(Request $request, $id)
    {
        $evento = E_Evento::findOrFail($id);

        $request->validate([
            'titulo' => 'required|string|max:255',
            'modalidad' => 'required|in:presencial,virtual,híbrido',
            'fecha_inicio' => 'required|date',
            'fecha_fin' => 'required|date|after_or_equal:fecha_inicio',
            'estado' => 'required|in:borrador,publicado,cerrado',
        ]);

        $evento->update([
            'entidad_id' => $request->entidad_id,
            'titulo' => $request->titulo,
            'descripcion' => $request->descripcion,
            'lugar' => $request->lugar,
            'modalidad' => $request->modalidad,
            'fecha_inicio' => $request->fecha_inicio,
            'fecha_fin' => $request->fecha_fin,
            'estado' => $request->estado,
        ]);

        // Si se mandan días y actividades (editable desde el formulario)
        if ($request->filled('dias')) {
            foreach ($request->dias as $diaData) {
                if (isset($diaData['id'])) {
                    // Actualizar día existente
                    $dia = \App\Models\E_EventoDia::find($diaData['id']);
                    if ($dia) {
                        $dia->update([
                            'fecha' => $diaData['fecha'],
                            'titulo' => $diaData['titulo'] ?? $dia->titulo,
                        ]);
                    }
                } else {
                    // Nuevo día
                    $dia = \App\Models\E_EventoDia::create([
                        'evento_id' => $evento->id,
                        'fecha' => $diaData['fecha'],
                        'titulo' => $diaData['titulo'] ?? 'Nuevo día',
                        'id_user_create' => Auth::id(),
                    ]);
                }

                // Guardar/actualizar actividades
                if (isset($diaData['actividades'])) {
                    foreach ($diaData['actividades'] as $actData) {
                        if (isset($actData['id'])) {
                            $actividad = \App\Models\E_Actividad::find($actData['id']);
                            if ($actividad) {
                                $actividad->update([
                                    'titulo' => $actData['titulo'],
                                    'descripcion' => $actData['descripcion'] ?? null,
                                    'hora_inicio' => $actData['hora_inicio'],
                                    'hora_fin' => $actData['hora_fin'],
                                ]);
                            }
                        } else {
                            \App\Models\E_Actividad::create([
                                'evento_dia_id' => $dia->id,
                                'titulo' => $actData['titulo'],
                                'descripcion' => $actData['descripcion'] ?? null,
                                'hora_inicio' => $actData['hora_inicio'],
                                'hora_fin' => $actData['hora_fin'],
                                'id_user_create' => Auth::id(),
                            ]);
                        }
                    }
                }
            }
        }

        return redirect()->route('admin.eventos.index')->with('success', 'Evento actualizado correctamente.');
    }

    public function dias($id)
    {
        $evento = \App\Models\E_Evento::with('dias')->findOrFail($id);
        return view('admin.eventos.dias', compact('evento'));
    }

    public function agregarDia(Request $request, $id)
    {
        $request->validate([
            'fecha' => 'required|date',
            'titulo' => 'required|string|max:150',
        ]);

        \App\Models\E_EventoDia::create([
            'evento_id' => $id,
            'fecha' => $request->fecha,
            'titulo' => $request->titulo,
            'permite_asistencia' => $request->has('permite_asistencia'),
            'id_user_create' => Auth::id(),
        ]);

        return back()->with('success', 'Día agregado correctamente.');
    }

    public function eliminarDia($id, $dia)
    {
        \App\Models\E_EventoDia::where('evento_id', $id)->where('id', $dia)->delete();
        return back()->with('success', 'Día eliminado correctamente.');
    }

    public function actividades($id, $dia)
    {
        $evento = \App\Models\E_Evento::findOrFail($id);
        $dia = \App\Models\E_EventoDia::with(['actividades'])->findOrFail($dia);
        $grupos = \App\Models\E_GrupoEntidad::where('entidad_id', $evento->entidad_id)->get();

        return view('admin.eventos.actividades', compact('evento', 'dia', 'grupos'));
    }

    public function agregarActividad(Request $request, $id, $dia)
    {
        $request->validate([
            'titulo' => 'required|string|max:150',
            'descripcion' => 'nullable|string',
            'hora_inicio' => 'required',
            'hora_fin' => 'required',
        ]);

        $actividad = \App\Models\E_Actividad::create([
            'evento_dia_id' => $dia,
            'titulo' => $request->titulo,
            'descripcion' => $request->descripcion,
            'hora_inicio' => $request->hora_inicio,
            'hora_fin' => $request->hora_fin,
            'id_user_create' => Auth::id(),
        ]);

        // Relación con grupos (checkboxes)
        if ($request->has('grupos')) {
            foreach ($request->grupos as $grupoId) {
                \DB::table('E_actividad_grupos')->insert([
                    'actividad_id' => $actividad->id,
                    'grupo_id' => $grupoId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        return back()->with('success', 'Actividad agregada correctamente.');
    }

    public function eliminarActividad($id, $dia, $actividad)
    {
        \App\Models\E_Actividad::where('id', $actividad)->delete();
        return back()->with('success', 'Actividad eliminada correctamente.');
    }

    public function show($id)
    {
        $evento = \App\Models\E_Evento::with('dias.actividades')->findOrFail($id);
        return view('public.evento', compact('evento'));
    }


    public function confirmar(Request $request, $eventoId)
    {
        $user = Auth::user();
        $evento = \App\Models\E_Evento::with('dias.actividades')->findOrFail($eventoId);

        $actividadesSeleccionadas = $request->input('actividades', []);

        foreach ($evento->dias as $dia) {
            foreach ($dia->actividades as $act) {
                if (in_array($act->id, $actividadesSeleccionadas)) {
                    \App\Models\E_AsistenciaActividad::firstOrCreate([
                        'actividad_id' => $act->id,
                        'usuario_id' => $user->id,
                    ], [
                        'metodo_entrada' => 'confirmacion',
                        'id_user_create' => $user->id,
                    ]);
                }
            }
        }

        return redirect()->route('mis.asistencias')->with('success', 'Asistencia confirmada correctamente.');
    }

    public function confirmarVista($id)
    {
        $evento = \App\Models\E_Evento::with('dias.actividades')->findOrFail($id);
        return view('public.confirmar_asistencia', compact('evento'));
    }


    public function misConfirmaciones()
    {
        $userId = Auth::id();
        $eventos = \App\Models\E_Evento::whereHas('dias.actividades.asistencias', function($q) use ($userId) {
            $q->where('usuario_id', $userId);
        })->get();

        return view('public.mis_confirmaciones', compact('eventos'));
    }

    // Panel unificado de confirmados + asistidos (vista)
    public function panelAsistencias($id)
    {
        $evento = \App\Models\E_Evento::with([
            'dias.actividades.asistencias.usuario',
            'entidad.grupos.usuarios'
        ])->findOrFail($id);

        // Traemos TODAS las asistencias del evento (confirmación y reales)
        $asistencias = collect();
        foreach ($evento->dias as $dia) {
            foreach ($dia->actividades as $act) {
                foreach ($act->asistencias as $asis) {
                    $asistencias->push($asis);
                }
            }
        }

        // Agrupamos por usuario_id para que salga UNA FILA por miembro
        $miembros = $asistencias
            ->groupBy('usuario_id')
            ->map(function ($regs, $usuarioId) use ($evento) {

                $usuario = $regs->first()->usuario; // puede ser null si era “nuevo”
                $nombreUsuario = $usuario
                    ? trim(($usuario->name ?? '') . ' ' . ($usuario->apellidos ?? ''))
                    : '—';

                // estado: si tiene alguna asistencia real (metodo_entrada != 'confirmacion')
                $tieneAsistenciaReal = $regs->contains(function ($r) {
                    return $r->metodo_entrada !== 'confirmacion';
                });

                $tieneSoloConfirmacion = $regs->every(function ($r) {
                    return $r->metodo_entrada === 'confirmacion';
                });

                $estado = 'Confirmado';
                if ($tieneAsistenciaReal && $tieneSoloConfirmacion === false) {
                    $estado = 'Asistió';
                }
                if ($tieneAsistenciaReal && $tieneSoloConfirmacion) {
                    // caso raro, pero por si acaso
                    $estado = 'Asistió';
                }
                if ($tieneAsistenciaReal && !$tieneSoloConfirmacion) {
                    $estado = 'Asistió';
                }
                if ($tieneAsistenciaReal && $tieneSoloConfirmacion === true) {
                    // si todas son reales
                    $estado = 'Asistió';
                }

                // entidad / grupo (tomamos el primero que tenga)
                // === ENTIDAD ===
                $entidadUsuario = \DB::table('E_grupo_usuarios')
                    ->join('E_grupos_entidad', 'E_grupos_entidad.id', '=', 'E_grupo_usuarios.grupo_id')
                    ->join('E_entidades', 'E_entidades.id', '=', 'E_grupos_entidad.entidad_id')
                    ->where('E_grupo_usuarios.usuario_id', $usuarioId)
                    ->select('E_entidades.nombre as entidad_nombre')
                    ->first();

                $entidadNombre = $entidadUsuario->entidad_nombre ?? '—';

                // === GRUPO ===
                $grupoUsuario = \DB::table('E_grupo_usuarios')
                    ->join('E_grupos_entidad', 'E_grupos_entidad.id', '=', 'E_grupo_usuarios.grupo_id')
                    ->where('E_grupo_usuarios.usuario_id', $usuarioId)
                    ->select('E_grupos_entidad.nombre')
                    ->first();

                $grupoNombre = $grupoUsuario->nombre ?? '—';

                // si tuvieras relación usuario -> entidad -> grupos la puedes completar aquí
                // pero en tus tablas tienes: e_entidad_usuarios y E_grupo_usuarios
                // como no las hemos cargado aquí, dejamos — para no romper

                // fecha y hora de la última acción
                $ultimo = $regs->sortByDesc('created_at')->first();

                return [
                    'usuario_id' => $usuarioId,
                    'miembro'    => $nombreUsuario,
                    'entidad'    => $entidadNombre,
                    'grupo'      => $grupoNombre,
                    'estado'     => $estado,
                    'fecha'      => optional($ultimo->created_at)->format('d/m/Y'),
                    'hora'       => optional($ultimo->created_at)->format('H:i:s'),
                ];
            })
            ->values();

        $totalConfirmados = $miembros->where('estado', 'Confirmado')->count();
        $totalAsistidos   = $miembros->where('estado', 'Asistió')->count();

        return view('admin.eventos.panel_asistencias', [
            'evento'           => $evento,
            'miembros'         => $miembros,
            'totalConfirmados' => $totalConfirmados,
            'totalAsistidos'   => $totalAsistidos,
        ]);
    }

    // Endpoint live para DataTables (se llama solo desde JS)
    public function panelAsistenciasLive($id)
    {
        $evento = \App\Models\E_Evento::with([
            'dias.actividades.asistencias.usuario'
        ])->findOrFail($id);

        $asistencias = collect();
        foreach ($evento->dias as $dia) {
            foreach ($dia->actividades as $act) {
                foreach ($act->asistencias as $asis) {
                    $asistencias->push($asis);
                }
            }
        }

        $miembros = $asistencias
            ->groupBy('usuario_id')
            ->map(function ($regs, $usuarioId) {

                $usuario = $regs->first()->usuario;
                $nombreUsuario = $usuario
                    ? trim(($usuario->name ?? '') . ' ' . ($usuario->apellidos ?? ''))
                    : '—';

                $tieneAsistenciaReal = $regs->contains(fn($r) => $r->metodo_entrada !== 'confirmacion');
                $tieneSoloConfirmacion = $regs->every(fn($r) => $r->metodo_entrada === 'confirmacion');

                $estado = 'Confirmado';
                if ($tieneAsistenciaReal && $tieneSoloConfirmacion === false) {
                    $estado = 'Asistió';
                }
                if ($tieneAsistenciaReal && $tieneSoloConfirmacion === true) {
                    $estado = 'Asistió';
                }

                $ultimo = $regs->sortByDesc('created_at')->first();

                $entidadUsuario = \DB::table('E_grupo_usuarios')
                    ->join('E_grupos_entidad', 'E_grupos_entidad.id', '=', 'E_grupo_usuarios.grupo_id')
                    ->join('E_entidades', 'E_entidades.id', '=', 'E_grupos_entidad.entidad_id')
                    ->where('E_grupo_usuarios.usuario_id', $usuarioId)
                    ->select('E_entidades.nombre as entidad_nombre')
                    ->first();

                $grupoUsuario = \DB::table('E_grupo_usuarios')
                    ->join('E_grupos_entidad', 'E_grupos_entidad.id', '=', 'E_grupo_usuarios.grupo_id')
                    ->where('E_grupo_usuarios.usuario_id', $usuarioId)
                    ->select('E_grupos_entidad.nombre')
                    ->first();

                return [
                    'miembro' => $nombreUsuario,
                    'entidad' => $entidadUsuario->entidad_nombre ?? '—',
                    'grupo'   => $grupoUsuario->nombre ?? '—',
                    'estado'  => $estado,
                    'fecha'   => optional($ultimo->created_at)->format('d/m/Y'),
                    'hora'    => optional($ultimo->created_at)->format('H:i:s'),
                ];
            })
            ->values();

        return response()->json($miembros);
    }

    public function panelAsistenciaCamera($id)
    {
        $evento = \App\Models\E_Evento::findOrFail($id);
        return view('admin.eventos.panel_asistencia_camera', compact('evento'));
    }
}