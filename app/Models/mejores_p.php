<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mejores_p extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table= '__lista_participantes_mejorespracticas';
    protected $fillable = [
        'id',
    ];
}
