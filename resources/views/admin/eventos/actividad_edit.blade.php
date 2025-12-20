@extends('layouts.event_app')

@section('title', 'Editar Actividad')

@section('content')
<div class="container py-4">
  <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
    <div>
      <h3 class="mb-1 fw-semibold">Editar Actividad</h3>
      <small class="text-muted">{{ $evento->titulo }} - {{ $actividad->dia?->fecha }}</small>
    </div>
    <a href="{{ route('admin.eventos.edit', $evento->id) }}" class="btn btn-outline-secondary">Volver al evento</a>
  </div>

  @if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
  @endif

  <form action="{{ route('admin.eventos.actividades.actualizar', [$evento->id, $actividad->id]) }}" method="POST" enctype="multipart/form-data" class="card shadow-sm p-4 border-0">
    @csrf
    @method('PUT')

    <div class="mb-3">
      <label for="titulo" class="form-label fw-semibold">Titulo de la actividad</label>
      <input type="text" name="titulo" id="titulo" class="form-control" value="{{ old('titulo', $actividad->titulo) }}" required>
    </div>

    <div class="mb-3">
      <label for="descripcion" class="form-label fw-semibold">Descripcion</label>
      <textarea name="descripcion" id="descripcion" rows="3" class="form-control">{{ old('descripcion', $actividad->descripcion) }}</textarea>
    </div>

    <div class="mb-3">
      <label for="imagen" class="form-label fw-semibold">Foto de fondo de la asistencia</label>
      <input type="file" name="imagen" id="imagen" class="form-control" accept="image/*">
      @if(!empty($actividad->imagen))
        <div class="mt-2">
          <small class="text-muted">Actual:</small>
          <div class="mt-1">
            <img src="{{ asset('storage/' . $actividad->imagen) }}" alt="Fondo actividad" style="max-width: 260px; border-radius: 12px;">
          </div>
        </div>
      @endif
    </div>

    <div class="mb-3">
      <label class="form-label fw-semibold">Metodos de asistencia disponibles</label>
      <div class="d-flex flex-wrap gap-3">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="asistencia_rostro" id="asistencia_rostro" {{ old('asistencia_rostro', $actividad->asistencia_rostro) ? 'checked' : '' }}>
          <label class="form-check-label" for="asistencia_rostro">Rostro (cámara)</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="asistencia_documento" id="asistencia_documento" {{ old('asistencia_documento', $actividad->asistencia_documento) ? 'checked' : '' }}>
          <label class="form-check-label" for="asistencia_documento">Numero de documento</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" name="asistencia_qr" id="asistencia_qr" {{ old('asistencia_qr', $actividad->asistencia_qr) ? 'checked' : '' }}>
          <label class="form-check-label" for="asistencia_qr">QR en pantalla</label>
        </div>
      </div>
      <small class="text-muted d-block mt-1">Puedes activar uno o varios metodos segun la dinamica del evento.</small>
    </div>

    <div class="mb-4">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" name="mostrar_lista_asistencias" id="mostrar_lista_asistencias" {{ old('mostrar_lista_asistencias', $actividad->mostrar_lista_asistencias ?? true) ? 'checked' : '' }}>
        <label class="form-check-label" for="mostrar_lista_asistencias">Mostrar lista de asistencias en pantalla</label>
      </div>
    </div>

    <div class="d-flex flex-wrap gap-2 justify-content-between">
      <a href="{{ route('admin.eventos.asistencias.actividadCamera', [$evento->id, $actividad->id]) }}" class="btn btn-outline-primary" target="_blank">
        Abrir pantalla de asistencia
      </a>
      <button type="submit" class="btn btn-success">Guardar cambios</button>
    </div>
  </form>

  <div class="alert alert-info mt-4">
    <strong>Tip:</strong> Para acomodar la camara, el QR, el documento y el mensaje de bienvenida,
    abre la pantalla de asistencia y arrastralos a la posicion que prefieras. El layout se guarda automaticamente.
  </div>
</div>
@endsection
