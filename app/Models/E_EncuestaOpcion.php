<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_EncuestaOpcion extends Model
{
    protected $table = 'E_encuesta_opciones';

    protected $fillable = [
        'encuesta_id',
        'nombre',
        'descripcion',
        'imagen',
        'color',
        'orden',
        'es_activa',
        'es_bloqueada',
        'id_user',
    ];

    protected $casts = [
        'es_activa'    => 'boolean',
        'es_bloqueada' => 'boolean',
        'orden'        => 'integer',
    ];

    public function encuesta()
    {
        return $this->belongsTo(E_Encuesta::class, 'encuesta_id');
    }

    public function votos()
    {
        return $this->hasMany(E_EncuestaVoto::class, 'opcion_id');
    }
}