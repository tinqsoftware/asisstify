<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StaffDetalle extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    protected $table= 'staff_detalle';
    protected $fillable = [
        'id',
    ];
}
