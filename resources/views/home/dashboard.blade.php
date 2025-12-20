@extends('layouts.event_app')

@section('title', 'Inicio')

@section('content')
<style>
  :root {
    --bg-main: #050816;
    --bg-gradient: radial-gradient(circle at top, #1f2937 0, #050816 55%, #02010a 100%);
    --card-bg: rgba(15, 23, 42, 0.96);
    --card-border: rgba(148, 163, 184, 0.35);
    --accent: #fbbf24;
    --accent-strong: #f59e0b;
    --text-main: #e5e7eb;
    --text-muted: #9ca3af;
    --success: #22c55e;
    --info: #38bdf8;
  }

  .dash-shell {
    width: 100%;
    display: flex;
    justify-content: center;
    padding: 24px 12px;
  }

  .dash-card {
    position: relative;
    background: var(--card-bg);
    border-radius: 26px;
    border: 1px solid var(--card-border);
    box-shadow: 0 20px 45px rgba(0, 0, 0, 0.6);
    width: 100%;
    max-width: 980px;
    padding: 22px 20px 26px;
    color: var(--text-main);
    overflow: hidden;
  }

  .dash-card::before {
    content: '';
    position: absolute;
    inset: -120px auto auto -120px;
    width: 240px;
    height: 240px;
    background: radial-gradient(circle, rgba(251, 191, 36, 0.16), transparent 70%);
    opacity: .7;
    pointer-events: none;
  }

  .dash-title {
    font-size: 1.6rem;
    font-weight: 800;
    margin-bottom: 4px;
  }

  .dash-sub {
    color: var(--text-muted);
    font-size: .88rem;
  }

  .dash-grid {
    display: grid;
    gap: 14px;
    margin-top: 18px;
  }

  .dash-section {
    border-radius: 18px;
    border: 1px solid rgba(148, 163, 184, 0.28);
    padding: 16px;
    background: rgba(2, 6, 23, 0.55);
  }

  .dash-section h4 {
    font-size: .85rem;
    text-transform: uppercase;
    letter-spacing: .18em;
    color: var(--text-muted);
    margin-bottom: 10px;
  }

  .event-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    padding: 10px 12px;
    border-radius: 14px;
    background: rgba(15, 23, 42, 0.85);
    border: 1px solid rgba(148, 163, 184, 0.25);
    margin-bottom: 8px;
  }

  .event-item small {
    color: var(--text-muted);
  }

  .event-pill {
    font-size: .68rem;
    padding: 4px 10px;
    border-radius: 999px;
    border: 1px solid rgba(148, 163, 184, 0.3);
    text-transform: uppercase;
    letter-spacing: .12em;
  }

  .event-pill--confirmado {
    border-color: rgba(251, 191, 36, .6);
    color: #fde68a;
  }

  .event-pill--asistido {
    border-color: rgba(34, 197, 94, .6);
    color: #bbf7d0;
  }

  .cta-big {
    display: flex;
    flex-direction: column;
    gap: 8px;
    padding: 16px;
    border-radius: 18px;
    background: linear-gradient(135deg, rgba(251,191,36,.12), rgba(56,189,248,.08));
    border: 1px solid rgba(251, 191, 36, 0.35);
  }

  .cta-big a {
    text-decoration: none;
    color: #111827;
    background: linear-gradient(135deg, var(--accent), var(--accent-strong));
    border-radius: 999px;
    padding: 10px 14px;
    font-size: .7rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: .14em;
    display: inline-flex;
    justify-content: center;
  }

  .mini-list {
    display: grid;
    gap: 8px;
  }

  .mini-chip {
    border-radius: 999px;
    padding: 6px 12px;
    font-size: .7rem;
    text-transform: uppercase;
    letter-spacing: .12em;
    border: 1px solid rgba(148, 163, 184, 0.3);
    color: var(--text-main);
  }

  .empty-note {
    font-size: .82rem;
    color: var(--text-muted);
  }

  .metric-row {
    display: flex;
    align-items: center;
    gap: 12px;
    flex-wrap: wrap;
  }

  .metric-card {
    flex: 1 1 160px;
    border-radius: 16px;
    padding: 12px;
    background: rgba(15, 23, 42, 0.7);
    border: 1px solid rgba(148, 163, 184, 0.3);
  }

  .metric-card span {
    display: block;
    font-size: .7rem;
    text-transform: uppercase;
    letter-spacing: .14em;
    color: var(--text-muted);
  }

  .metric-card strong {
    font-size: 1.2rem;
  }

  @media (min-width: 960px) {
    .dash-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }
</style>

<div class="dash-shell">
  <div class="dash-card">
    <div class="dash-title">Hola {{ strtoupper($user->name ?? 'USUARIO') }}</div>
    <div class="dash-sub">Tu panel rápido según tu rol.</div>

    <div class="dash-grid">
      @if($isMember && !$isAdmin)
        <div class="dash-section">
          <h4>Próximo evento</h4>
          @if($memberNext)
            <div class="cta-big">
              <div class="fw-semibold">{{ $memberNext->titulo }}</div>
              <small class="text-muted">{{ \Carbon\Carbon::parse($memberNext->fecha_inicio)->format('d/m/Y') }} - {{ \Carbon\Carbon::parse($memberNext->fecha_fin)->format('d/m/Y') }}</small>
              <a href="{{ route('mis.asistencias.evento', $memberNext->id) }}">Ver detalle</a>
            </div>
          @else
            <div class="empty-note">No tienes eventos próximos confirmados.</div>
          @endif
        </div>

        <div class="dash-section">
          <h4>Tus próximos eventos</h4>
          @forelse($memberProximos as $evento)
            <div class="event-item">
              <div>
                <div class="fw-semibold">{{ $evento->titulo }}</div>
                <small>{{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }}</small>
              </div>
              <span class="event-pill event-pill--confirmado">Confirmado</span>
            </div>
          @empty
            <div class="empty-note">Aún no tienes eventos próximos.</div>
          @endforelse
        </div>

        <div class="dash-section">
          <h4>Historial de asistencias</h4>
          @forelse($memberPasados as $evento)
            <div class="event-item">
              <div>
                <div class="fw-semibold">{{ $evento->titulo }}</div>
                <small>{{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}</small>
              </div>
              <span class="event-pill event-pill--asistido">Asistió</span>
            </div>
          @empty
            <div class="empty-note">Todavía no registras asistencias.</div>
          @endforelse
        </div>

        <div class="dash-section">
          <h4>Tus grupos</h4>
          <div class="mini-list">
            @forelse($memberGrupos as $grupo)
              <div class="mini-chip">{{ $grupo->nombre }}</div>
            @empty
              <div class="empty-note">No tienes grupos asignados.</div>
            @endforelse
          </div>
        </div>
      @endif

      @if($isAdmin)
        <div class="dash-section">
          <h4>Próximos eventos</h4>
          @forelse($adminEventos as $evento)
            <div class="event-item">
              <div>
                <div class="fw-semibold">{{ $evento->titulo }}</div>
                <small>{{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }}</small>
              </div>
              <div class="text-end">
                <div class="event-pill event-pill--confirmado">{{ $evento->confirmados_count }} confirmados</div>
                <div class="event-pill event-pill--asistido">{{ $evento->asistidos_count }} asistidos</div>
              </div>
            </div>
          @empty
            <div class="empty-note">No hay eventos próximos.</div>
          @endforelse
        </div>

        <div class="dash-section">
          <h4>Métricas rápidas</h4>
          <div class="metric-row">
            <div class="metric-card">
              <span>Total eventos</span>
              <strong>{{ $adminTotalEventos ?? 0 }}</strong>
            </div>
            <div class="metric-card">
              <span>Acceso rápido</span>
              <a class="mini-chip" href="{{ route('admin.eventos.index') }}">Eventos</a>
            </div>
            <div class="metric-card">
              <span>Gestión</span>
              <a class="mini-chip" href="{{ route('admin.grupos.index') }}">Grupos</a>
            </div>
          </div>
        </div>

        <div class="dash-section">
          <h4>Funcionalidades</h4>
          <div class="mini-list">
            <div class="mini-chip">Asistencia automatizada</div>
            <div class="mini-chip">Control por actividades</div>
            <div class="mini-chip">Encuestas en vivo</div>
          </div>
        </div>
      @endif
    </div>
  </div>
</div>
@endsection
