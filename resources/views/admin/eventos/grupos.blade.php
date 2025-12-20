@extends('layouts.event_app')

@section('title', 'Grupos del evento')

@section('content')
<style>
  .grupo-shell {
    width: 100%;
    max-width: 980px;
    background: rgba(15, 23, 42, 0.96);
    border: 1px solid rgba(148, 163, 184, 0.35);
    border-radius: 22px;
    padding: 20px;
    color: #e5e7eb;
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.5);
    margin: 0 auto;
  }
  .grupo-title {
    font-weight: 800;
    font-size: 1.4rem;
    margin-bottom: 4px;
  }
  .grupo-sub {
    color: #9ca3af;
    font-size: .82rem;
  }
  .grupo-form {
    background: rgba(2, 6, 23, 0.6);
    border: 1px solid rgba(148, 163, 184, 0.25);
    border-radius: 16px;
    padding: 14px;
  }
  .grupo-card {
    background: rgba(2, 6, 23, 0.6);
    border: 1px solid rgba(148, 163, 184, 0.25);
    border-radius: 16px;
    padding: 14px;
    margin-bottom: 12px;
  }
  .grupo-badge-count {
    border-radius: 999px;
    padding: 4px 10px;
    font-size: .65rem;
    text-transform: uppercase;
    letter-spacing: .12em;
    border: 1px solid rgba(148, 163, 184, 0.35);
    color: #e5e7eb;
  }
  .grupo-list {
    max-height: 260px;
    overflow: auto;
  }
  @media (max-width: 768px) {
    .grupo-shell {
      padding: 16px;
    }
  }
</style>

<div class="grupo-shell">
  <div class="mb-3 d-flex justify-content-between align-items-center">
    <div>
      <div class="grupo-title">Grupos del evento</div>
      <div class="grupo-sub">{{ $evento->titulo }}</div>
    </div>
    <a href="{{ route('admin.eventos.index') }}" class="btn btn-outline-light btn-sm">Volver</a>
  </div>

  @if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
  @endif

  <div class="grupo-form mb-4">
    <form method="POST" action="{{ route('admin.eventos.grupos.store', $evento->id) }}" class="row g-2">
      @csrf
      <div class="col-12 col-md-4">
        <input type="text" name="nombre" class="form-control" placeholder="Nombre del grupo" required>
      </div>
      <div class="col-12 col-md-6">
        <input type="text" name="descripcion" class="form-control" placeholder="Descripción (opcional)">
      </div>
      <div class="col-12 col-md-2 d-grid">
        <button class="btn btn-warning text-dark">Crear</button>
      </div>
    </form>
  </div>

  @forelse($grupos as $grupo)
    <div class="grupo-card">
      <div class="d-flex justify-content-between align-items-center mb-2">
        <div>
          <strong>{{ $grupo->nombre }}</strong>
          <small class="text-muted d-block">{{ $grupo->descripcion ?: 'Sin descripción' }}</small>
        </div>
        <span class="grupo-badge-count">Miembros: {{ $grupo->usuarios->count() }}</span>
      </div>

      <form method="POST" action="{{ route('admin.eventos.grupos.miembros.update', [$evento->id, $grupo->id]) }}">
        @csrf
        <div class="grupo-list">
          @foreach($confirmados as $usuario)
            <div class="form-check d-flex align-items-center gap-2 mb-2">
              <input
                class="form-check-input"
                type="checkbox"
                name="user_ids[]"
                value="{{ $usuario->id }}"
                {{ $grupo->usuarios->contains($usuario->id) ? 'checked' : '' }}
              >
              <label class="form-check-label">
                {{ $usuario->name }} {{ $usuario->apellidos }}
                <small class="text-muted">({{ $usuario->email ?? $usuario->nro_documento ?? '—' }})</small>
              </label>
            </div>
          @endforeach
        </div>
        <div class="mt-3">
          <button class="btn btn-outline-info btn-sm">Guardar miembros</button>
        </div>
      </form>
    </div>
  @empty
    <div class="text-muted">No hay grupos creados para este evento.</div>
  @endforelse
</div>
@endsection
