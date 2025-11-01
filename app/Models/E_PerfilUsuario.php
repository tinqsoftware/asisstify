<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_PerfilUsuario extends Model
{
    protected $table = 'E_perfiles_usuarios';

    protected $fillable = [
        'usuario_id', 'tipo_documento', 'nro_documento', 'telefono',
        'pais', 'region', 'institucion', 'cargo', 'foto', 'id_user_create'
    ];

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }

    public function creador()
    {
        return $this->belongsTo(User::class, 'id_user_create');
    }
}