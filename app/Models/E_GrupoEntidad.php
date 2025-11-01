<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_GrupoEntidad extends Model
{
    protected $table = 'E_grupos_entidad';
    protected $fillable = ['entidad_id', 'nombre', 'descripcion', 'estado', 'id_user_create'];

    public function entidad()
    {
        return $this->belongsTo(E_Entidad::class, 'entidad_id');
    }

    public function usuarios()
    {
        return $this->belongsToMany(User::class, 'E_grupo_usuarios', 'grupo_id', 'usuario_id')
                    ->withTimestamps();
    }
    
    public function actividades()
    {
        return $this->belongsToMany(E_Actividad::class, 'E_actividad_grupos', 'grupo_id', 'actividad_id')
                    ->withTimestamps();
    }
}