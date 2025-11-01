<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_TipoParticipante extends Model
{
    protected $table = 'E_tipos_participante';
    protected $fillable = ['nombre', 'codigo', 'id_user_create'];
}