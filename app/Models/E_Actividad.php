<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_Actividad extends Model
{
    protected $table = 'E_actividades';
    protected $fillable = [
        'evento_dia_id', 'titulo', 'descripcion', 'tema',
        'imagen', 'hora_inicio', 'hora_fin',
        'id_grupo_dirigido', 'permite_asistencia', 'requiere_salida', 'requiere_asistencia', 'id_user_create'
    ];

    public function dia()
    {
        return $this->belongsTo(E_EventoDia::class, 'evento_dia_id');
    }

    public function participantes()
    {
        return $this->hasMany(E_ActividadPersona::class, 'actividad_id');
    }

    public function asistencias()
    {
        return $this->hasMany(E_AsistenciaActividad::class, 'actividad_id');
    }

    public function grupos()
    {
        return $this->belongsToMany(E_GrupoEntidad::class, 'E_actividad_grupos', 'actividad_id', 'grupo_id')
                    ->withTimestamps();
    }
}