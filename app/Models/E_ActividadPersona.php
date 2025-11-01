<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_ActividadPersona extends Model
{
    protected $table = 'E_actividad_personas';
    protected $fillable = [
        'actividad_id', 'usuario_id', 'tipo_participante_id', 'id_user_create'
    ];

    public function actividad()
    {
        return $this->belongsTo(E_Actividad::class, 'actividad_id');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }

    public function tipoParticipante()
    {
        return $this->belongsTo(E_TipoParticipante::class, 'tipo_participante_id');
    }
}