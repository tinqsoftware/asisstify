<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Evento extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table= 'evento';
    protected $fillable = [
        'id',
    ];
}
