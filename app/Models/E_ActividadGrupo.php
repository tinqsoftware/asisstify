<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_ActividadGrupo extends Model
{
    protected $table = 'E_actividad_grupos';
    protected $fillable = ['actividad_id', 'grupo_id'];

    public function actividad()
    {
        return $this->belongsTo(E_Actividad::class, 'actividad_id');
    }

    public function grupo()
    {
        return $this->belongsTo(E_GrupoEntidad::class, 'grupo_id');
    }
}