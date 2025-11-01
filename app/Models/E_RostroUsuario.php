<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class E_RostroUsuario extends Model
{
    use HasFactory;

    protected $table = 'e_rostros_usuarios';

    protected $fillable = [
        'usuario_id',
        'imagen_path',
        'embedding',
        'es_principal',
        'id_user_create',
    ];

    public function usuario()
    {
        return $this->belongsTo(\App\Models\User::class, 'usuario_id');
    }
}