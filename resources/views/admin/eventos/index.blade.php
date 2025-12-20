@extends('layouts.event_app')

@section('title', 'Eventos')

@section('content')
<style>
  .eventos-shell {
    background: rgba(15, 23, 42, 0.96);
    border: 1px solid rgba(148, 163, 184, 0.35);
    border-radius: 22px;
    padding: 20px;
    color: #e5e7eb;
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.5);
  }
  .eventos-title {
    font-weight: 800;
    font-size: 1.5rem;
    margin-bottom: 4px;
  }
  .eventos-sub {
    color: #9ca3af;
    font-size: .82rem;
  }
  .eventos-actions .btn {
    border-radius: 999px;
    text-transform: uppercase;
    letter-spacing: .12em;
    font-size: .7rem;
  }
  .eventos-tabs .nav-link {
    border-radius: 999px;
    text-transform: uppercase;
    letter-spacing: .14em;
    font-size: .7rem;
    color: #9ca3af;
    border: 1px solid transparent;
  }
  .eventos-tabs .nav-link.active {
    background: linear-gradient(135deg, #fbbf24, #f59e0b);
    color: #111827;
    border-color: transparent;
  }
  .eventos-table {
    border-color: rgba(148, 163, 184, 0.25);
    color: #e5e7eb;
  }
  .eventos-table thead {
    background: rgba(30, 41, 59, 0.7);
    color: #e5e7eb;
    text-transform: uppercase;
    letter-spacing: .1em;
    font-size: .7rem;
  }
  .eventos-table tbody tr {
    background: rgba(2, 6, 23, 0.6);
  }
  .eventos-table td, .eventos-table th {
    border-color: rgba(148, 163, 184, 0.2);
    vertical-align: middle;
  }
  .eventos-badge {
    border-radius: 999px;
    padding: 4px 10px;
    font-size: .65rem;
    text-transform: uppercase;
    letter-spacing: .12em;
  }
  .eventos-actions-cell .btn {
    border-radius: 999px;
    font-size: .65rem;
    text-transform: uppercase;
    letter-spacing: .1em;
  }
  .pagination {
    --bs-pagination-bg: rgba(15, 23, 42, 0.9);
    --bs-pagination-border-color: rgba(148, 163, 184, 0.25);
    --bs-pagination-color: #e5e7eb;
    --bs-pagination-hover-bg: rgba(251, 191, 36, 0.18);
    --bs-pagination-hover-color: #fef3c7;
    --bs-pagination-active-bg: #fbbf24;
    --bs-pagination-active-border-color: #fbbf24;
    --bs-pagination-active-color: #111827;
  }
  @media (max-width: 768px) {
    .eventos-actions {
      flex-direction: column;
      align-items: flex-start;
      gap: 8px;
    }
  }
</style>

<div class="eventos-shell">
  <div class="d-flex justify-content-between align-items-center mb-3 eventos-actions">
    <div>
      <div class="eventos-title">Gestión de Eventos</div>
      <div class="eventos-sub">Administra tus próximos eventos y asistencias.</div>
    </div>
    <a href="{{ route('admin.eventos.create') }}" class="btn btn-warning text-dark">Nuevo Evento</a>
  </div>

@if(session('success'))
  <div class="alert alert-success">{{ session('success') }}</div>
@endif

<ul class="nav nav-tabs mb-3 eventos-tabs">
  <li class="nav-item">
    <a class="nav-link {{ $tab === 'proximos' ? 'active' : '' }}"
      href="{{ route('admin.eventos.index', ['tab' => 'proximos']) }}">Próximos</a>
  </li>
  <li class="nav-item">
    <a class="nav-link {{ $tab === 'pasados' ? 'active' : '' }}"
      href="{{ route('admin.eventos.index', ['tab' => 'pasados']) }}">Pasados</a>
  </li>
  <li class="nav-item">
    <a class="nav-link {{ $tab === 'todos' ? 'active' : '' }}"
      href="{{ route('admin.eventos.index', ['tab' => 'todos']) }}">Todos</a>
  </li>
</ul>

<table class="table table-hover align-middle eventos-table">
  <thead>
    <tr>
      <th>Título</th>
      <th>Modalidad</th>
      <th>Confirmados</th>
      <th>Asistencias</th>
      <th>Inicio</th>
      <th>Fin</th>
      <th>Estado</th>
      <th>Acciones</th>
    </tr>
  </thead>
  <tbody>
    @forelse($eventos as $evento)
      <tr>
        <td>{{ $evento->titulo }}</td>
        <td>{{ ucfirst($evento->modalidad) }}</td>
        <!-- Confirmados: Enlace a detalle agrupado -->
        <td>
          <a href="{{ route('admin.eventos.asistencias', $evento->id) }}" class="text-decoration-none fw-semibold text-primary">
            {{ $evento->dias->flatMap->actividades->flatMap->asistencias->where('metodo_entrada','confirmacion')->unique('usuario_id')->count() }}
          </a>
        </td>
        <!-- Asistencias: Enlace a detalle (espacio preparado) -->
        <td>
          <a href="{{ route('admin.eventos.asistencias', $evento->id) }}" class="text-decoration-none fw-semibold text-success">
            {{ $evento->dias->flatMap->actividades->flatMap->asistencias->where('metodo_entrada','!=','confirmacion')->unique('usuario_id')->count() }}
          </a>
        </td>
        <td>{{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }}</td>
        <td>{{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}</td>
        <td><span class="badge bg-info eventos-badge">{{ ucfirst($evento->estado) }}</span></td>
        <td class="d-flex gap-2 eventos-actions-cell">
          <a href="{{ route('admin.eventos.encuestas.index', $evento->id) }}" class="btn btn-sm btn-outline-info">Encuestas</a>
          <a href="{{ route('admin.eventos.grupos.index', $evento->id) }}" class="btn btn-sm btn-outline-warning">Grupos</a>
          <a href="{{ route('admin.eventos.edit', $evento->id) }}" class="btn btn-sm btn-outline-light">Editar</a>
          <a href="{{ route('eventos.publico', $evento->id) }}" class="btn btn-sm btn-outline-warning" target="_blank">Compartir</a>
          <a href="{{ route('admin.eventos.asistencias.camera', $evento->id) }}" target="_blank" class="btn btn-sm btn-success">Asistencia</a>
        </td>
      </tr>
    @empty
      <tr><td colspan="8" class="text-center text-muted">No hay eventos registrados.</td></tr>
    @endforelse
  </tbody>
</table>
{{ $eventos->appends(['tab' => $tab])->links() }}
</div>

<!-- Modal de asistencia -->
<div class="modal fade" id="modalAsistencia" tabindex="-1" aria-labelledby="modalAsistenciaLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-success text-white">
        <h5 class="modal-title" id="modalAsistenciaLabel">Registro de Asistencia</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body text-center">
        <div id="infoEvento" class="mb-3"></div>
        <video id="camera" autoplay playsinline class="w-100 rounded shadow"></video>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const modal = document.getElementById('modalAsistencia');
  const camera = document.getElementById('camera');
  const infoEvento = document.getElementById('infoEvento');

  modal.addEventListener('show.bs.modal', async (e) => {
    const button = e.relatedTarget;
    const eventoId = button.getAttribute('data-evento');
    infoEvento.innerHTML = `<div class="text-muted">Cargando información del evento...</div>`;

    try {
      const response = await fetch(`/admin/eventos/${eventoId}/info`);
      const data = await response.json();
      infoEvento.innerHTML = `
        <h5>${data.titulo}</h5>
        <p><strong>Modalidad:</strong> ${data.modalidad}</p>
        <p><strong>Fechas:</strong> ${data.fecha_inicio} - ${data.fecha_fin}</p>
      `;
    } catch {
      infoEvento.innerHTML = `<div class="text-danger">Error al cargar la información del evento.</div>`;
    }

    try {
      const stream = await navigator.mediaDevices.getUserMedia({ video: true });
      camera.srcObject = stream;
    } catch (err) {
      console.error("Error al acceder a la cámara:", err);
      infoEvento.innerHTML += `<p class="text-danger mt-2">No se pudo acceder a la cámara.</p>`;
    }
  });

  modal.addEventListener('hidden.bs.modal', () => {
    if (camera.srcObject) {
      camera.srcObject.getTracks().forEach(track => track.stop());
      camera.srcObject = null;
    }
  });
});
</script>
@endsection
