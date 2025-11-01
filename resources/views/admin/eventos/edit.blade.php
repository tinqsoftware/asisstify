@extends('layouts.backoffice')

@section('title', 'Editar Evento')

@section('content')
<div class="container py-4">
  <h3 class="mb-4 fw-semibold text-dark">Editar Evento</h3>

  <form action="{{ route('admin.eventos.update', $evento->id) }}" method="POST" class="card shadow-sm p-4 border-0">
    @csrf
    @method('PUT')

    <div class="mb-3">
      <label for="titulo" class="form-label fw-semibold">Título del Evento</label>
      <input type="text" name="titulo" id="titulo" class="form-control" value="{{ old('titulo', $evento->titulo) }}" required>
    </div>

    <div class="mb-3">
      <label for="descripcion" class="form-label fw-semibold">Descripción</label>
      <textarea name="descripcion" id="descripcion" rows="3" class="form-control">{{ old('descripcion', $evento->descripcion) }}</textarea>
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="modalidad" class="form-label fw-semibold">Modalidad</label>
        <select name="modalidad" id="modalidad" class="form-select">
          <option value="presencial" {{ $evento->modalidad == 'presencial' ? 'selected' : '' }}>Presencial</option>
          <option value="virtual" {{ $evento->modalidad == 'virtual' ? 'selected' : '' }}>Virtual</option>
          <option value="híbrido" {{ $evento->modalidad == 'híbrido' ? 'selected' : '' }}>Híbrido</option>
        </select>
      </div>
      <div class="col-md-6 mb-3">
        <label for="lugar" class="form-label fw-semibold">Lugar</label>
        <input type="text" name="lugar" id="lugar" class="form-control" value="{{ old('lugar', $evento->lugar) }}">
      </div>
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="fecha_inicio" class="form-label fw-semibold">Fecha de Inicio</label>
        <input type="date" name="fecha_inicio" id="fecha_inicio" class="form-control" value="{{ $evento->fecha_inicio }}">
      </div>
      <div class="col-md-6 mb-3">
        <label for="fecha_fin" class="form-label fw-semibold">Fecha de Fin</label>
        <input type="date" name="fecha_fin" id="fecha_fin" class="form-control" value="{{ $evento->fecha_fin }}">
      </div>
    </div>

    <hr class="my-4">
    <h5 class="fw-semibold mb-3">Calendario de Actividades</h5>

    <input type="hidden" name="dias_json" id="dias_json" value='{{ $jsonActividades ?? "[]" }}'>

    {{-- Script modular para gestión de días y actividades --}}
    @include('admin.eventos.partials.script_dias_actividades')

    <div class="mb-3">
      <label for="estado" class="form-label fw-semibold">Estado</label>
      <select name="estado" id="estado" class="form-select">
        <option value="borrador" {{ $evento->estado == 'borrador' ? 'selected' : '' }}>Borrador</option>
        <option value="publicado" {{ $evento->estado == 'publicado' ? 'selected' : '' }}>Publicado</option>
        <option value="cerrado" {{ $evento->estado == 'cerrado' ? 'selected' : '' }}>Cerrado</option>
      </select>
    </div>

    <div class="text-end">
      <a href="{{ route('admin.eventos.index') }}" class="btn btn-outline-secondary me-2">Cancelar</a>
      <button type="submit" class="btn btn-success">Actualizar</button>
    </div>
  </form>
</div>

<!-- Modal para crear/editar actividad -->
<div class="modal fade" id="modalActividad" tabindex="-1" aria-labelledby="modalActividadLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalActividadLabel">Agregar/Editar Actividad</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formActividad">
          <input type="hidden" id="actividadId">
          <div class="mb-3">
            <label for="actividadTitulo" class="form-label">Título</label>
            <input type="text" class="form-control" id="actividadTitulo" required>
          </div>
          <div class="mb-3">
            <label for="actividadFecha" class="form-label">Fecha</label>
            <input type="date" class="form-control" id="actividadFecha" required>
          </div>
          <div class="mb-3">
            <label for="actividadHoraInicio" class="form-label">Hora de inicio</label>
            <input type="time" class="form-control" id="actividadHoraInicio" required>
          </div>
          <div class="mb-3">
            <label for="actividadHoraFin" class="form-label">Hora de fin</label>
            <input type="time" class="form-control" id="actividadHoraFin" required>
          </div>
          <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" id="actividadAsistencia">
            <label class="form-check-label" for="actividadAsistencia">Requiere asistencia</label>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="guardarActividadBtn">Guardar</button>
      </div>
    </div>
  </div>
</div>
@endsection