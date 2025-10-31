<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Eventos;
use App\Http\Controllers\Certificado;
use App\Http\Controllers\Contacto;
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

Route::get('/evento/{url_evento}', [Eventos::class, 'detalle']);