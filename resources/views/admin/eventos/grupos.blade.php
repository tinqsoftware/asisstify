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
  .grupo-badge-asistencia {
    border-radius: 999px;
    padding: 4px 10px;
    font-size: .65rem;
    text-transform: uppercase;
    letter-spacing: .12em;
    border: 1px solid rgba(34, 197, 94, 0.4);
    color: #bbf7d0;
  }
  .badge-asistio {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 2px 8px;
    border-radius: 999px;
    border: 1px solid rgba(34, 197, 94, 0.4);
    color: #bbf7d0;
    font-size: .62rem;
    text-transform: uppercase;
    letter-spacing: .12em;
  }
  .badge-asistio-dot {
    width: 6px;
    height: 6px;
    border-radius: 999px;
    background: #22c55e;
    box-shadow: 0 0 8px rgba(34, 197, 94, 0.8);
  }
  .grupo-list {
    max-height: 260px;
    overflow: auto;
  }
  .grupo-search {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    margin-bottom: 12px;
  }
  .grupo-search .form-control,
  .grupo-search .form-select {
    flex: 1 1 220px;
  }
  .grupo-miembros-table th,
  .grupo-miembros-table td {
    white-space: nowrap;
  }
  .grupo-empty {
    color: #9ca3af;
    font-size: .85rem;
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

  <div class="accordion" id="eventoGruposAccordion">
    @forelse($grupos as $grupo)
      @php
        $grupoId = 'eventoGrupo' . $grupo->id;
        $miembrosGrupo = $grupo->usuarios;
        $asistidosCount = $miembrosGrupo->filter(fn($m) => $asistidosUsuarioIds->contains($m->id))->count();
      @endphp
      <div class="grupo-card accordion-item bg-transparent border-0">
        <div class="accordion-header d-flex justify-content-between align-items-center" id="heading{{ $grupoId }}">
          <button class="accordion-button collapsed bg-transparent text-light border rounded" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{ $grupoId }}" aria-expanded="false">
            <strong>{{ $grupo->nombre }}</strong>
            <span class="ms-3 grupo-badge-count">Miembros: {{ $miembrosGrupo->count() }}</span>
            <span class="ms-2 grupo-badge-asistencia">Asistencias: {{ $asistidosCount }}</span>
          </button>
          <button type="button" class="btn btn-sm btn-outline-warning ms-2" data-bs-toggle="modal" data-bs-target="#modalMiembros{{ $grupo->id }}">
            Agregar miembros
          </button>
        </div>
        <div id="collapse{{ $grupoId }}" class="accordion-collapse collapse" data-bs-parent="#eventoGruposAccordion">
          <div class="accordion-body pt-3">
            @if($miembrosGrupo->isEmpty())
              <div class="grupo-empty">Este grupo aún no tiene miembros.</div>
            @else
              <div class="table-responsive">
                <table class="table table-bordered table-striped w-100 grupo-miembros-table">
                  <thead class="table-light">
                    <tr>
                      <th>Miembro</th>
                      <th>Documento</th>
                      <th>Grupo entidad</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($miembrosGrupo as $miembro)
                      <tr>
                        <td>{{ trim(($miembro->name ?? '') . ' ' . ($miembro->apellidos ?? '')) }}</td>
                        <td>{{ $miembro->nro_documento ?? '—' }}</td>
                        <td>
                          {{ $grupoEntidadPorUsuario[$miembro->id] ?? '—' }}
                          @if($asistidosUsuarioIds->contains($miembro->id))
                            <span class="badge-asistio ms-2"><span class="badge-asistio-dot"></span>Asistió</span>
                          @endif
                        </td>
                      </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
            @endif
          </div>
        </div>
      </div>

      <div class="modal fade modal-evento-grupo" id="modalMiembros{{ $grupo->id }}" tabindex="-1" aria-hidden="true" data-grupo="{{ $grupo->id }}">
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <form method="POST" action="{{ route('admin.eventos.grupos.miembros.update', [$evento->id, $grupo->id]) }}">
              @csrf
              <div class="modal-header">
                <h5 class="modal-title">Agregar miembros - {{ $grupo->nombre }}</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
              </div>
              <div class="modal-body">
                <div class="grupo-search">
                  <input type="text" class="form-control" placeholder="Buscar por nombre, correo o documento" data-search>
                  <select class="form-select" data-filter-grupo>
                    <option value="">Todos los grupos</option>
                    @foreach($gruposEntidad as $gEnt)
                      <option value="{{ $gEnt->nombre }}">{{ $gEnt->nombre }}</option>
                    @endforeach
                  </select>
                </div>
                <div class="grupo-list" data-list>
                  @foreach($confirmados as $usuario)
                    <div class="form-check d-flex align-items-center gap-2 mb-2 grupo-item"
                      data-name="{{ strtolower($usuario['name']) }}"
                      data-email="{{ strtolower($usuario['email'] ?? '') }}"
                      data-doc="{{ strtolower($usuario['nro_documento'] ?? '') }}"
                      data-grupoentidad="{{ strtolower($usuario['grupo_entidad'] ?? '—') }}">
                      <input
                        class="form-check-input"
                        type="checkbox"
                        name="user_ids[]"
                        value="{{ $usuario['id'] }}"
                        {{ $miembrosGrupo->contains($usuario['id']) ? 'checked' : '' }}
                      >
                      <label class="form-check-label">
                        {{ $usuario['name'] }}
                        <small class="text-muted">({{ $usuario['email'] ?? $usuario['nro_documento'] ?? '—' }}) · {{ $usuario['grupo_entidad'] ?? '—' }}</small>
                      </label>
                    </div>
                  @endforeach
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-warning text-dark">Guardar miembros</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    @empty
      <div class="text-muted">No hay grupos creados para este evento.</div>
    @endforelse
  </div>
</div>

<script>
  document.querySelectorAll('.modal-evento-grupo').forEach(modal => {
    const searchInput = modal.querySelector('[data-search]');
    const filterGrupo = modal.querySelector('[data-filter-grupo]');
    const items = Array.from(modal.querySelectorAll('.grupo-item'));

    const applyFilter = () => {
      const query = (searchInput.value || '').trim().toLowerCase();
      const grupo = (filterGrupo.value || '').trim().toLowerCase();
      items.forEach(item => {
        const hayTexto = !query || item.dataset.name.includes(query) || item.dataset.email.includes(query) || item.dataset.doc.includes(query);
        const hayGrupo = !grupo || item.dataset.grupoentidad.includes(grupo);
        item.style.display = (hayTexto && hayGrupo) ? 'flex' : 'none';
      });
    };

    if (searchInput) {
      searchInput.addEventListener('input', applyFilter);
    }
    if (filterGrupo) {
      filterGrupo.addEventListener('change', applyFilter);
    }
  });
</script>
@endsection
