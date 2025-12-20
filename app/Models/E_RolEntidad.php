<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_RolEntidad extends Model
{
    protected $table = 'E_roles_entidad';
    protected $fillable = ['entidad_id', 'codigo', 'nombre', 'descripcion', 'id_user_create'];

    public function creador()
    {
        return $this->belongsTo(User::class, 'id_user_create');
    }

    public function entidad()
    {
        return $this->belongsTo(E_Entidad::class, 'entidad_id');
    }
}
