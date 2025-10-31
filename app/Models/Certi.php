<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Certi extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table= 'certificado';
    protected $fillable = [
        'id',
    ];
}
