<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_AsistenciaActividad extends Model
{
    protected $table = 'E_asistencias_actividad';
    protected $fillable = [
        'actividad_id', 'usuario_id', 'hora_entrada', 'metodo_entrada',
        'hora_salida', 'metodo_salida', 'id_user_create'
    ];

    public function actividad()
    {
        return $this->belongsTo(E_Actividad::class, 'actividad_id');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }
}