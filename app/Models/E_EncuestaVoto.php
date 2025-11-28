<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_EncuestaVoto extends Model
{
    protected $table = 'E_encuesta_votos';

    protected $fillable = [
        'encuesta_id',
        'opcion_id',
        'usuario_id',
        'nombre_invitado',
        'ronda',
        'id_user',
    ];

    protected $casts = [
        'ronda' => 'integer',
    ];

    public function encuesta()
    {
        return $this->belongsTo(E_Encuesta::class, 'encuesta_id');
    }

    public function opcion()
    {
        return $this->belongsTo(E_EncuestaOpcion::class, 'opcion_id');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }
}