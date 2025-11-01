<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Eventos;
use App\Http\Controllers\Certificado;
use App\Http\Controllers\Contacto;
use App\Http\Controllers\Admin\E_EntidadController;
use App\Http\Controllers\Admin\E_GrupoController;
use App\Http\Controllers\Admin\E_EventoController;
use App\Http\Controllers\Admin\E_RolEntidadController;
use App\Http\Controllers\Admin\PerfilController;
use App\Http\Controllers\Admin\E_AsistenciaController;
use App\Http\Controllers\Api\RostroController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [Eventos::class, 'welcome']);

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/contacto', function () { return view('contacto');});

//Evento público
Route::get('/evento', [Eventos::class, 'inicio']);
Route::get('/evento/constancia/{DNI}', [Eventos::class, 'descarga_constancia']);

Route::get('/asistencia', [Eventos::class, 'asistencia']);
Route::post('/asistencia', [Eventos::class, 'asistencia_buscar']);

Route::get('/contactanos', [Contacto::class, 'contactanos']);
Route::post('/contactanos', [Contacto::class, 'contactanos_post']);

//certificado
Route::get('/certificado/crear', [Certificado::class, 'crear']);
Route::post('/certificado/crear', [Certificado::class, 'crear_post']);
Route::get('/certificado/{tipo}/{id_evento}/{id_user}', [Certificado::class, 'ver']);
Route::get('/ver_ejemplo', [Certificado::class, 'ver_ejemplo']);


Route::post('/grabar_asistencia', [Eventos::class, 'detalle_post']);
Route::post('/grabar_grabar', [Eventos::class, 'grabarcorreo_post']);

//Route::get('/Asistencia/{url_evento}', [Eventos::class, 'asistencia']);
//Route::post('/{url_evento}_Asistencia', [Eventos::class, 'detalle_asistencia_post']);

Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {

    //Eventos
    Route::get('/evento/crear', [Eventos::class, 'crear']);
    Route::post('/evento/crear', [Eventos::class, 'crear_post']);

});


Route::middleware(['auth'])->prefix('admin')->group(function () {

    // ENTIDADES
    Route::get('/entidades', [E_EntidadController::class, 'index'])->name('admin.entidades.index');
    Route::get('/entidades/crear', [E_EntidadController::class, 'create'])->name('admin.entidades.create');
    Route::post('/entidades', [E_EntidadController::class, 'store'])->name('admin.entidades.store');
    Route::get('/entidades/{id}/editar', [E_EntidadController::class, 'edit'])->name('admin.entidades.edit');
    Route::put('/entidades/{id}', [E_EntidadController::class, 'update'])->name('admin.entidades.update');

    // ROLES DE ENTIDAD
    Route::get('/roles', [E_RolEntidadController::class, 'index'])->name('admin.roles.index');
    Route::get('/roles/crear', [E_RolEntidadController::class, 'create'])->name('admin.roles.create');
    Route::post('/roles', [E_RolEntidadController::class, 'store'])->name('admin.roles.store');
    Route::get('/roles/{id}/editar', [E_RolEntidadController::class, 'edit'])->name('admin.roles.edit');
    Route::put('/roles/{id}', [E_RolEntidadController::class, 'update'])->name('admin.roles.update');

    // GRUPOS
    Route::get('/grupos', [E_GrupoController::class, 'index'])->name('admin.grupos.index');
    Route::get('/grupos/crear', [E_GrupoController::class, 'create'])->name('admin.grupos.create');
    Route::post('/grupos', [E_GrupoController::class, 'store'])->name('admin.grupos.store');
    Route::get('/grupos/{id}/editar', [E_GrupoController::class, 'edit'])->name('admin.grupos.edit');
    Route::put('/grupos/{id}', [E_GrupoController::class, 'update'])->name('admin.grupos.update');
    Route::get('/grupos/{id}/usuarios', [E_GrupoController::class, 'usuarios'])->name('admin.grupos.usuarios');
    Route::post('/grupos/{id}/usuarios', [E_GrupoController::class, 'agregarUsuario'])->name('admin.grupos.agregarUsuario');

    // EVENTOS → DÍAS → ACTIVIDADES
    Route::get('/eventos', [E_EventoController::class, 'index'])->name('admin.eventos.index');
    Route::get('/eventos/crear', [E_EventoController::class, 'create'])->name('admin.eventos.create');
    Route::post('/eventos', [E_EventoController::class, 'store'])->name('admin.eventos.store');
    Route::get('/eventos/{id}/editar', [E_EventoController::class, 'edit'])->name('admin.eventos.edit');
    Route::put('/eventos/{id}', [E_EventoController::class, 'update'])->name('admin.eventos.update');
    Route::post('/eventos/{id}/duplicar', [E_EventoController::class, 'duplicar'])->name('admin.eventos.duplicar');

    Route::get('/eventos/{evento}/dias', [E_EventoController::class, 'dias'])->name('admin.eventos.dias');
    Route::get('/eventos/{evento}/dias/{dia}/actividades', [E_EventoController::class, 'actividades'])->name('admin.eventos.dia.actividades');

    // Reporte de asistentes
    Route::get('/eventos/{evento}/asistentes', [E_AsistenciaController::class, 'index'])->name('admin.eventos.asistentes');

    // MIEMBROS DE GRUPO
    Route::get('/grupos/{id}/miembros', [E_GrupoController::class, 'miembros'])->name('admin.grupos.miembros');
    Route::get('/grupos/{id}/buscar-usuarios', [E_GrupoController::class, 'buscarUsuarios'])->name('admin.grupos.buscarUsuarios');
    Route::post('/grupos/{id}/agregar-usuario', [E_GrupoController::class, 'agregarUsuario'])->name('admin.grupos.agregarUsuario');
    Route::delete('/grupos/{id}/eliminar-usuario/{usuario_id}', [E_GrupoController::class, 'eliminarUsuario'])->name('admin.grupos.eliminarUsuario');

    // DÍAS DE EVENTO
    Route::get('/eventos/{id}/dias', [E_EventoController::class, 'dias'])->name('admin.eventos.dias');
    Route::post('/eventos/{id}/dias', [E_EventoController::class, 'agregarDia'])->name('admin.eventos.agregarDia');
    Route::delete('/eventos/{id}/dias/{dia}', [E_EventoController::class, 'eliminarDia'])->name('admin.eventos.eliminarDia');

    // ACTIVIDADES POR DÍA
    Route::get('/eventos/{id}/dias/{dia}/actividades', [E_EventoController::class, 'actividades'])->name('admin.eventos.actividades');
    Route::post('/eventos/{id}/dias/{dia}/actividades', [E_EventoController::class, 'agregarActividad'])->name('admin.eventos.agregarActividad');
    Route::delete('/eventos/{id}/dias/{dia}/actividades/{actividad}', [E_EventoController::class, 'eliminarActividad'])->name('admin.eventos.eliminarActividad');
    Route::post('/eventos/{eventoId}/confirmar', [E_EventoController::class, 'confirmar'])->name('eventos.confirmar');

    // Panel unificado de confirmados y asistencias
    Route::get('/admin/eventos/{id}/asistencias', [E_EventoController::class, 'panelAsistencias'])->name('admin.eventos.asistencias');
    Route::get('/admin/eventos/{id}/asistencias/live', [E_EventoController::class, 'panelAsistenciasLive'])->name('admin.eventos.asistencias.live');

    Route::get('/eventos/{id}/asistencias/camera', [E_EventoController::class, 'panelAsistenciaCamera'])->name('admin.eventos.asistencias.camera');

    Route::get('/perfil', [PerfilController::class, 'index'])->name('perfil.index');
    Route::post('/perfil/rostros', [PerfilController::class, 'subirRostros'])->name('perfil.rostros.subir');
    Route::delete('/perfil/rostros/{id}', [PerfilController::class, 'eliminar'])->name('perfil.rostros.eliminar');


    Route::prefix('admin/eventos')->middleware(['auth'])->group(function () {
        Route::get('{evento}/asistencias/camera', [App\Http\Controllers\Admin\E_AsistenciaController::class, 'camera'])
            ->name('admin.eventos.asistencias.camera');

        Route::get('{evento}/asistencias/actividad/{actividad}', [App\Http\Controllers\Admin\E_AsistenciaController::class, 'actividadCamera'])
            ->name('admin.eventos.asistencias.actividadCamera');
    });




});

Route::get('/rostros/{evento}', [RostroController::class, 'listar'])->name('api.rostros');
Route::post('/marcar-asistencia', [RostroController::class, 'marcar'])->name('api.marcarAsistencia');
Route::get('/asistencias/{actividad}', [RostroController::class, 'listarAsistencias'])->name('api.asistencias');

// ============================================
Route::middleware(['auth'])->get('/mis-asistencias', [E_AsistenciaController::class, 'misAsistencias'])
    ->name('mis.asistencias');

Route::get('/eventos/{id}/publico', [E_EventoController::class, 'show'])->name('eventos.publico');
Route::get('/eventos/{id}/confirmar', [E_EventoController::class, 'confirmarVista'])->name('eventos.confirmarVista');



// ============================================
// MIS ASISTENCIAS
// ============================================
Route::middleware(['auth'])->get('/mis-asistencias', [E_AsistenciaController::class, 'misAsistencias'])
    ->name('mis.asistencias');

Route::get('/evento/{url_evento}', [Eventos::class, 'detalle']);