<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_EntidadUsuario extends Model
{
    protected $table = 'E_entidad_usuarios';

    protected $fillable = [
        'entidad_id', 'usuario_id', 'rol_entidad_id',
        'es_propietario', 'id_user_create'
    ];

    public function entidad()
    {
        return $this->belongsTo(E_Entidad::class, 'entidad_id');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }

    public function rol()
    {
        return $this->belongsTo(E_RolEntidad::class, 'rol_entidad_id');
    }
}