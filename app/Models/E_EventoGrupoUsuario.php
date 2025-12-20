<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_EventoGrupoUsuario extends Model
{
    protected $table = 'E_evento_grupo_usuarios';
    protected $fillable = [
        'evento_grupo_id', 'usuario_id', 'id_user_create'
    ];

    public function grupo()
    {
        return $this->belongsTo(E_EventoGrupo::class, 'evento_grupo_id');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }
}
