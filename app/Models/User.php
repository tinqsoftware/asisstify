<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];


    // Perfil extendido (1-1)
    public function perfil()
    {
        return $this->hasOne(E_PerfilUsuario::class, 'usuario_id');
    }

    // Entidades donde el usuario está asociado
    public function entidades()
    {
        return $this->belongsToMany(E_Entidad::class, 'E_entidad_usuarios', 'usuario_id', 'entidad_id')
                    ->withPivot('rol_entidad_id', 'es_propietario')
                    ->withTimestamps();
    }

    // Grupos a los que pertenece
    public function grupos()
    {
        return $this->belongsToMany(E_GrupoEntidad::class, 'E_grupo_usuarios', 'usuario_id', 'grupo_id')
                    ->withTimestamps();
    }

    // Actividades donde participa (como ponente, staff, asistente)
    public function actividadesParticipadas()
    {
        return $this->belongsToMany(E_Actividad::class, 'E_actividad_personas', 'usuario_id', 'actividad_id')
                    ->withPivot('tipo_participante_id')
                    ->withTimestamps();
    }

    // Asistencias por día
    public function asistenciasDia()
    {
        return $this->hasMany(E_AsistenciaDia::class, 'usuario_id');
    }

    // Asistencias por actividad
    public function asistenciasActividad()
    {
        return $this->hasMany(E_AsistenciaActividad::class, 'usuario_id');
    }

    // Certificados emitidos
    public function certificados()
    {
        return $this->hasMany(E_Certificado::class, 'usuario_id');
    }

    // Verifica si es superadmin global (puedes definirlo por ID o email)
    public function esSuperAdmin()
    {
        return in_array($this->email, ['enrique@tinq.pe']); // cámbialo
    }

    // Verifica si tiene un rol dentro de una entidad específica
    public function tieneRolEntidad($codigoRol)
    {
        return $this->entidades()
            ->whereHas('usuarios', function($q) use ($codigoRol) {
                $q->whereHas('rol', function($r) use ($codigoRol) {
                    $r->where('codigo', $codigoRol);
                });
            })
            ->exists();
    }

    public function rostros()
    {
        return $this->hasMany(E_RostroUsuario::class, 'usuario_id');
    }
}
