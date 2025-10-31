<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventoUserAsistenteDetalle extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table= 'evento_userasistente_detalle';
    protected $fillable = [
        'id',
    ];
}
