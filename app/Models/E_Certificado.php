<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class E_Certificado extends Model
{
    protected $table = 'E_certificados';
    protected $fillable = [
        'evento_id', 'usuario_id', 'regla_certificado_id', 'numero',
        'emitido_el', 'archivo', 'id_user_create'
    ];

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }

    public function evento()
    {
        return $this->belongsTo(E_Evento::class, 'evento_id');
    }

    public function regla()
    {
        return $this->belongsTo(E_ReglaCertificado::class, 'regla_certificado_id');
    }
}