<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_AsistenciaDia extends Model
{
    protected $table = 'E_asistencias_dia';
    protected $fillable = [
        'evento_dia_id', 'usuario_id', 'hora_entrada', 'metodo_entrada',
        'hora_salida', 'metodo_salida', 'id_user_create'
    ];

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }

    public function dia()
    {
        return $this->belongsTo(E_EventoDia::class, 'evento_dia_id');
    }
}