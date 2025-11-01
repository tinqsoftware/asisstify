<?php 
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_Entidad extends Model
{
    protected $table = 'E_entidades';
    protected $fillable = ['nombre', 'descripcion', 'estado', 'id_user_create'];

    public function creador()
    {
        return $this->belongsTo(User::class, 'id_user_create');
    }

    public function usuarios()
    {
        return $this->hasMany(E_EntidadUsuario::class, 'entidad_id');
    }

    public function grupos()
    {
        return $this->hasMany(E_GrupoEntidad::class, 'entidad_id');
    }

    public function eventos()
    {
        return $this->hasMany(E_Evento::class, 'entidad_id');
    }
}