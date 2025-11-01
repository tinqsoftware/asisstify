<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_GrupoUsuario extends Model
{
    protected $table = 'E_grupo_usuarios';
    protected $fillable = ['grupo_id', 'usuario_id', 'id_user_create'];

    public function grupo()
    {
        return $this->belongsTo(E_GrupoEntidad::class, 'grupo_id');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }
}