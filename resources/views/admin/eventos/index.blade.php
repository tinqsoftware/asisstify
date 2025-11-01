@extends('layouts.backoffice')

@section('title', 'Eventos')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
  <h3>Gestión de Eventos</h3>
  <a href="{{ route('admin.eventos.create') }}" class="btn btn-primary">Nuevo Evento</a>
</div>

@if(session('success'))
  <div class="alert alert-success">{{ session('success') }}</div>
@endif

<table class="table table-hover align-middle">
  <thead class="table-light">
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
        <td><span class="badge bg-info">{{ ucfirst($evento->estado) }}</span></td>
        <td class="d-flex gap-2">
          <a href="{{ route('admin.eventos.edit', $evento->id) }}" class="btn btn-sm btn-outline-dark">Editar</a>
          <a href="{{ route('eventos.publico', $evento->id) }}" class="btn btn-sm btn-outline-primary" target="_blank">Compartir</a>
          <a href="{{ route('admin.eventos.asistencias.camera', $evento->id) }}" target="_blank" class="btn btn-sm btn-success">Asistencia</a>
        </td>
      </tr>
    @empty
      <tr><td colspan="8" class="text-center">No hay eventos registrados.</td></tr>
    @endforelse
  </tbody>
</table>
{{ $eventos->links() }}

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