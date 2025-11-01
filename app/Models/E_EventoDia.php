<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_EventoDia extends Model
{
    protected $table = 'E_evento_dias';
    protected $fillable = [
        'evento_id', 'fecha', 'titulo', 'permite_asistencia',
        'hora_inicio', 'hora_fin', 'id_user_create'
    ];

    public function evento()
    {
        return $this->belongsTo(E_Evento::class, 'evento_id');
    }

    public function actividades()
    {
        return $this->hasMany(E_Actividad::class, 'evento_dia_id');
    }
}