<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_ReglaCertificado extends Model
{
    protected $table = 'E_reglas_certificado';
    protected $fillable = [
        'evento_id', 'nombre', 'porcentaje_minimo', 'requiere_asistencia_dia',
        'requiere_asistencia_actividades', 'plantilla', 'id_user_create'
    ];

    public function evento()
    {
        return $this->belongsTo(E_Evento::class, 'evento_id');
    }
}