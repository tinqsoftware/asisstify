<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\E_Encuesta;
use App\Models\E_EncuestaOpcion;
use App\Models\E_EncuestaVoto;

class SimularVotosEncuesta extends Command
{
    /**
     * El nombre y firma del comando.
     *
     * Uso:
     *   php artisan encuestas:simular-votos 3 --total=100
     */
    protected $signature = 'encuestas:simular-votos 
                            {encuesta_id : ID de la encuesta} 
                            {--total=100 : Total de votos a simular} 
                            {--ronda= : Ronda (por defecto la ronda_actual}';

    /**
     * Descripción del comando.
     */
    protected $description = 'Simula votos aleatorios para una encuesta (para probar la pantalla de resultados)';

    public function handle()
    {
        $encuestaId = (int) $this->argument('encuesta_id');
        $total      = (int) $this->option('total') ?: 100;

        /** @var E_Encuesta $encuesta */
        $encuesta = E_Encuesta::with('opciones')->find($encuestaId);

        if (!$encuesta) {
            $this->error("No se encontró la encuesta {$encuestaId}");
            return 1;
        }

        if ($encuesta->opciones->isEmpty()) {
            $this->error('La encuesta no tiene opciones.');
            return 1;
        }

        $ronda = $this->option('ronda') ?: $encuesta->ronda_actual;

        $this->info("Simulando votos para la encuesta #{$encuesta->id} ({$encuesta->nombre})");
        $this->info("Ronda: {$ronda} | Total de votos a generar: {$total}");

        // Preguntamos si borramos votos anteriores de esa ronda
        if ($this->confirm('¿Borrar votos existentes de esta ronda antes de simular?', true)) {
            E_EncuestaVoto::where('encuesta_id', $encuesta->id)
                ->where('ronda', $ronda)
                ->delete();
            $this->info('Votos anteriores eliminados.');
        }

        // Para karaoke (unica_por_opcion) no podemos tener más votos que opciones
        if ($encuesta->unica_por_opcion) {
            $maxPosible = $encuesta->opciones->count();
            if ($total > $maxPosible) {
                $this->warn("Encuesta tipo karaoke (unica_por_opcion). Ajustando total de votos a {$maxPosible}.");
                $total = $maxPosible;
            }
        }

        // Simulación: vamos creando 1 voto cada pequeño intervalo
        for ($i = 1; $i <= $total; $i++) {
            $opcion = $encuesta->opciones->random(); // repartimos de forma aleatoria

            // Si es karaoke, no repetir opción en la misma ronda
            if ($encuesta->unica_por_opcion) {
                $yaTomada = E_EncuestaVoto::where('encuesta_id', $encuesta->id)
                    ->where('ronda', $ronda)
                    ->where('opcion_id', $opcion->id)
                    ->exists();

                if ($yaTomada) {
                    // Si todas las opciones ya tienen voto, paramos
                    $distinct = E_EncuestaVoto::where('encuesta_id', $encuesta->id)
                        ->where('ronda', $ronda)
                        ->distinct('opcion_id')
                        ->count('opcion_id');

                    if ($distinct >= $encuesta->opciones->count()) {
                        $this->warn('Todas las opciones ya tienen un voto (karaoke). Finalizando simulación.');
                        break;
                    }

                    // Reintentamos con otra opción (no contamos este intento)
                    $i--;
                    continue;
                }
            }

            E_EncuestaVoto::create([
                'encuesta_id'     => $encuesta->id,
                'opcion_id'       => $opcion->id,
                'usuario_id'      => null,
                'nombre_invitado' => 'Simulado #' . $i,
                'ronda'           => $ronda,
                'id_user'         => null,
            ]);

            if ($encuesta->unica_por_opcion) {
                $opcion->update(['es_bloqueada' => 1]);
            }

            $this->line("Voto {$i} → opción {$opcion->id} ({$opcion->nombre})");

            // Pequeña pausa para que en la pantalla se vea "llegar" voto por voto
            usleep(200000); // 0.2 segundos (ajusta si quieres más rápido o más lento)
        }

        $this->info('Simulación terminada.');
        return 0;
    }
}