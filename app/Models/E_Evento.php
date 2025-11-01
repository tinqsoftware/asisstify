<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_Evento extends Model
{
    protected $table = 'E_eventos';
    protected $fillable = [
        'entidad_id', 'titulo', 'descripcion', 'lugar', 'modalidad',
        'enlace_virtual', 'fecha_inicio', 'fecha_fin', 'estado', 'id_user_create'
    ];

    public function entidad()
    {
        return $this->belongsTo(E_Entidad::class, 'entidad_id');
    }

    public function dias()
    {
        return $this->hasMany(E_EventoDia::class, 'evento_id');
    }

    public function reglasCertificado()
    {
        return $this->hasMany(E_ReglaCertificado::class, 'evento_id');
    }
}