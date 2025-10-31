<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventoDetalle extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table= 'evento_detalle';
    protected $fillable = [
        'id',
    ];
}
