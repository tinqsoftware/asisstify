<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_Encuesta extends Model
{
    protected $table = 'E_encuestas';

    protected $fillable = [
        'evento_id',
        'nombre',
        'slug',
        'descripcion',
        'tipo',
        'es_abierta',
        'unica_por_opcion',
        'max_opciones_por_usuario',
        'modo_resultados',
        'permitir_cambiar_voto',
        'ronda_actual',
        'estado',
        'id_user',
    ];

    protected $casts = [
        'es_abierta'              => 'boolean',
        'unica_por_opcion'        => 'boolean',
        'permitir_cambiar_voto'   => 'boolean',
        'max_opciones_por_usuario'=> 'integer',
        'ronda_actual'            => 'integer',
    ];

    public function evento()
    {
        return $this->belongsTo(E_Evento::class, 'evento_id');
    }

    public function opciones()
    {
        return $this->hasMany(E_EncuestaOpcion::class, 'encuesta_id');
    }

    public function votos()
    {
        return $this->hasMany(E_EncuestaVoto::class, 'encuesta_id');
    }
}