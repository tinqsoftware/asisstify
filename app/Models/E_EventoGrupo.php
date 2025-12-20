<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_EventoGrupo extends Model
{
    protected $table = 'E_evento_grupos';
    protected $fillable = [
        'evento_id', 'nombre', 'descripcion', 'id_user_create'
    ];

    public function evento()
    {
        return $this->belongsTo(E_Evento::class, 'evento_id');
    }

    public function usuarios()
    {
        return $this->belongsToMany(User::class, 'E_evento_grupo_usuarios', 'evento_grupo_id', 'usuario_id')
            ->withTimestamps();
    }
}
