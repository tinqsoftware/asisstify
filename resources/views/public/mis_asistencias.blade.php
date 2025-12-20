@extends('layouts.event_app')

@section('title', 'Mis Asistencias')

@section('content')
<style>
  :root {
    --bg-main: #050816;
    --bg-gradient: radial-gradient(circle at top, #1f2937 0, #050816 55%, #02010a 100%);
    --card-bg: rgba(15, 23, 42, 0.96);
    --card-border: rgba(148, 163, 184, 0.35);
    --accent: #fbbf24;
    --accent-soft: rgba(251, 191, 36, 0.15);
    --accent-strong: #f59e0b;
    --text-main: #e5e7eb;
    --text-muted: #9ca3af;
    --success: #22c55e;
  }

  .evento-shell {
    min-height: 100%;
    width: 100%;
    display: flex;
    justify-content: center;
    padding: 24px 12px;
  }

  .evento-card {
    position: relative;
    background: var(--card-bg);
    border-radius: 28px;
    border: 1px solid var(--card-border);
    box-shadow:
      0 20px 45px rgba(0, 0, 0, 0.65),
      0 0 0 1px rgba(15, 23, 42, 0.7);
    width: 100%;
    max-width: 980px;
    padding: 22px 20px 26px;
    display: flex;
    flex-direction: column;
    gap: 18px;
    color: var(--text-main);
    overflow: hidden;
  }

  .evento-card::before {
    content: '';
    position: absolute;
    inset: -120px auto auto -120px;
    width: 240px;
    height: 240px;
    background: radial-gradient(circle, var(--accent-soft), transparent 70%);
    opacity: .8;
    pointer-events: none;
  }

  .evento-card::after {
    content: '';
    position: absolute;
    inset: auto -100px -120px auto;
    width: 220px;
    height: 220px;
    background: radial-gradient(circle, rgba(56, 189, 248, .18), transparent 70%);
    opacity: .7;
    pointer-events: none;
  }

  .evento-header {
    position: relative;
    z-index: 1;
  }

  .evento-chip-top {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    font-size: .68rem;
    text-transform: uppercase;
    letter-spacing: .22em;
    padding: 4px 12px 4px 6px;
    border-radius: 999px;
    border: 1px solid rgba(249, 250, 251, 0.08);
    background: linear-gradient(120deg, rgba(15,23,42,.95), rgba(17,24,39,.9));
    color: var(--text-muted);
    margin-bottom: 6px;
  }

  .evento-chip-dot {
    width: 10px;
    height: 10px;
    border-radius: 999px;
    background: var(--accent);
    box-shadow: 0 0 0 4px var(--accent-soft);
  }

  .evento-header small {
    text-transform: uppercase;
    letter-spacing: .16em;
    font-weight: 700;
    font-size: .75rem;
    color: var(--accent);
    display: block;
  }

  .evento-header h1 {
    font-size: 1.7rem;
    font-weight: 800;
    margin: 4px 0 0;
  }

  .evento-sub {
    font-size: .86rem;
    color: var(--text-muted);
    margin-top: 6px;
  }

  .evento-main {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    gap: 14px;
  }

  .tabs-pill {
    display: inline-flex;
    gap: 8px;
    border-radius: 999px;
    padding: 6px;
    background: rgba(15,23,42,.75);
    border: 1px solid rgba(148, 163, 184, 0.25);
  }

  .tabs-pill .nav-link {
    border-radius: 999px;
    border: 1px solid transparent;
    padding: 6px 14px;
    font-size: .72rem;
    text-transform: uppercase;
    letter-spacing: .14em;
    color: var(--text-muted);
  }

  .tabs-pill .nav-link.active {
    color: #111827;
    background: linear-gradient(135deg, var(--accent), var(--accent-strong));
    border-color: transparent;
  }

  .asistencia-card {
    border-radius: 18px;
    background: linear-gradient(145deg, rgba(15,23,42,.98), rgba(17,24,39, .96));
    padding: 16px 14px 18px;
    border: 1px solid rgba(148, 163, 184, 0.35);
  }

  .asistencia-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 12px;
  }

  .asistencia-header h5 {
    margin: 0;
    font-size: 1rem;
    font-weight: 700;
  }

  .asistencia-date {
    font-size: .74rem;
    color: var(--text-muted);
    letter-spacing: .12em;
    text-transform: uppercase;
  }

  .asistencia-item {
    border-radius: 14px;
    padding: 10px 12px;
    border: 1px solid rgba(148, 163, 184, 0.3);
    background: rgba(2, 6, 23, 0.7);
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
  }

  .asistencia-item small {
    color: var(--text-muted);
  }

  .badge-pill {
    font-size: .68rem;
    padding: 4px 10px;
    border-radius: 999px;
    text-transform: uppercase;
    letter-spacing: .12em;
    border: 1px solid rgba(148, 163, 184, 0.3);
  }

  .badge-confirmado {
    border-color: rgba(251, 191, 36, .6);
    color: #fde68a;
  }

  .badge-asistio {
    border-color: rgba(34, 197, 94, .6);
    color: #bbf7d0;
  }

  .btn-detalle {
    border-radius: 999px;
    padding: 8px 14px;
    border: 1px solid rgba(148, 163, 184, 0.4);
    color: var(--text-main);
    text-transform: uppercase;
    letter-spacing: .14em;
    font-size: .68rem;
    text-decoration: none;
  }

  .btn-detalle:hover {
    border-color: rgba(251, 191, 36, .5);
    color: #fef3c7;
  }

  .empty-state {
    border-radius: 16px;
    border: 1px dashed rgba(148, 163, 184, 0.35);
    padding: 16px;
    color: var(--text-muted);
    text-align: center;
  }

  @media (min-width: 1024px) {
    .evento-card {
      padding: 26px 24px 30px;
    }
    .evento-header h1 {
      font-size: 2rem;
    }
  }
</style>

<div class="evento-shell">
  <div class="evento-card">
    <div class="evento-header">
      <div class="evento-chip-top">
        <span class="evento-chip-dot"></span>
        <span>Mis asistencias</span>
      </div>
      <small>Tu historial</small>
      <h1>Hola {{ strtoupper(Auth::user()->name ?? 'Invitado') }}</h1>
      <p class="evento-sub mb-0">
        Revisa tus actividades confirmadas y tus asistencias registradas en cada evento.
      </p>
    </div>

    <div class="evento-main">
      <ul class="nav tabs-pill" id="asistenciasTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="confirmadas-tab" data-bs-toggle="tab" data-bs-target="#confirmadas" type="button" role="tab" aria-controls="confirmadas" aria-selected="true">
            Confirmadas
          </button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="asistidas-tab" data-bs-toggle="tab" data-bs-target="#asistidas" type="button" role="tab" aria-controls="asistidas" aria-selected="false">
            Asistidas
          </button>
        </li>
      </ul>

      <div class="tab-content" id="asistenciasTabContent">
        <div class="tab-pane fade show active" id="confirmadas" role="tabpanel" aria-labelledby="confirmadas-tab">
          @php
            $eventosConfirmados = $eventos->filter(function($evento){
              return $evento->dias->flatMap->actividades->flatMap->asistencias
                ->contains(fn($a) => $a->metodo_entrada === 'confirmacion');
            });
          @endphp

          @forelse($eventosConfirmados as $evento)
            <div class="asistencia-card mb-3">
              <div class="asistencia-header mb-3">
                <div>
                  <h5>{{ $evento->titulo }}</h5>
                  <div class="asistencia-date">
                    {{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }} - {{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}
                  </div>
                </div>
              </div>
              @foreach($evento->dias as $dia)
                @php
                  $actividades = $dia->actividades->filter(fn($a) => $a->asistencias->first()?->metodo_entrada === 'confirmacion');
                @endphp
                @if($actividades->isNotEmpty())
                  <div class="text-uppercase text-muted small mb-2 mt-3">{{ \Carbon\Carbon::parse($dia->fecha)->format('d/m/Y') }}</div>
                  @foreach($actividades as $act)
                    <div class="asistencia-item mb-2">
                      <div>
                        <strong>{{ $act->titulo }}</strong>
                        <br>
                        <small>{{ substr($act->hora_inicio,0,5) }} - {{ substr($act->hora_fin,0,5) }}</small>
                      </div>
                      <span class="badge-pill badge-confirmado">Confirmado</span>
                    </div>
                  @endforeach
                @endif
              @endforeach
            </div>
          @empty
            <div class="empty-state">
              No tienes actividades confirmadas.
            </div>
          @endforelse
        </div>

        <div class="tab-pane fade" id="asistidas" role="tabpanel" aria-labelledby="asistidas-tab">
          @php
            $eventosAsistidos = $eventos->filter(function($evento){
              return $evento->dias->flatMap->actividades->flatMap->asistencias
                ->contains(fn($a) => $a->metodo_entrada !== 'confirmacion');
            });
          @endphp

          @forelse($eventosAsistidos as $evento)
            <div class="asistencia-card mb-3">
              <div class="asistencia-header mb-3">
                <div>
                  <h5>{{ $evento->titulo }}</h5>
                  <div class="asistencia-date">
                    {{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }} - {{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}
                  </div>
                </div>
                <a href="{{ route('mis.asistencias.evento', $evento->id) }}" class="btn-detalle">
                  Ver detalle
                </a>
              </div>
              @foreach($evento->dias as $dia)
                @php
                  $actividades = $dia->actividades->filter(fn($a) => $a->asistencias->first()?->metodo_entrada !== 'confirmacion');
                @endphp
                @if($actividades->isNotEmpty())
                  <div class="text-uppercase text-muted small mb-2 mt-3">{{ \Carbon\Carbon::parse($dia->fecha)->format('d/m/Y') }}</div>
                  @foreach($actividades as $act)
                    <div class="asistencia-item mb-2">
                      <div>
                        <strong>{{ $act->titulo }}</strong>
                        <br>
                        <small>{{ substr($act->hora_inicio,0,5) }} - {{ substr($act->hora_fin,0,5) }}</small>
                      </div>
                      <span class="badge-pill badge-asistio">Asistió</span>
                    </div>
                  @endforeach
                @endif
              @endforeach
            </div>
          @empty
            <div class="empty-state">
              No tienes actividades asistidas.
            </div>
          @endforelse
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
