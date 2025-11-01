@extends('layouts.backoffice')

@section('title', 'Crear Evento')

@section('content')
<div class="container py-4">
  <h3 class="mb-4 fw-semibold text-dark">Crear Nuevo Evento</h3>

  <form id="formEvento" action="{{ route('admin.eventos.store') }}" method="POST" class="card shadow-sm p-4 border-0">
    @csrf

    {{-- Si el usuario tiene entidades --}}
    @if(isset($entidades) && $entidades->count() > 0)
      <div class="mb-3">
        <label for="entidad_id" class="form-label fw-semibold">Entidad Asociada</label>
        <select name="entidad_id" id="entidad_id" class="form-select">
          <option value="">-- Seleccione una Entidad --</option>
          @foreach($entidades as $entidad)
            <option value="{{ $entidad->id }}">{{ $entidad->nombre }}</option>
          @endforeach
        </select>
      </div>
    @endif

    <div class="mb-3">
      <label for="titulo" class="form-label fw-semibold">Título del Evento</label>
      <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Ingrese el título del evento" value="{{ old('titulo') }}" required>
    </div>

    <div class="mb-3">
      <label for="descripcion" class="form-label fw-semibold">Descripción</label>
      <textarea name="descripcion" id="descripcion" rows="3" class="form-control">{{ old('descripcion') }}</textarea>
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="modalidad" class="form-label fw-semibold">Modalidad</label>
        <select name="modalidad" id="modalidad" class="form-select">
          <option value="presencial">Presencial</option>
          <option value="virtual" selected>Virtual</option>
          <option value="híbrido">Híbrido</option>
        </select>
      </div>
      <div class="col-md-6 mb-3">
        <label for="lugar" class="form-label fw-semibold">Lugar</label>
        <input type="text" name="lugar" id="lugar" class="form-control" placeholder="Ejemplo: Auditorio Central o Zoom">
      </div>
    </div>

    <div class="row">
      <div class="col-md-6 mb-3">
        <label for="fecha_inicio" class="form-label fw-semibold">Fecha de Inicio</label>
        <input type="date" name="fecha_inicio" id="fecha_inicio" class="form-control" required>
      </div>
      <div class="col-md-6 mb-3">
        <label for="fecha_fin" class="form-label fw-semibold">Fecha de Fin</label>
        <input type="date" name="fecha_fin" id="fecha_fin" class="form-control" required>
      </div>
    </div>

    <hr class="my-4">
    <h5 class="fw-semibold mb-3">Calendario de Actividades</h5>

    <input type="hidden" name="dias_json" id="dias_json">

    {{-- Script modular para gestión de días y actividades --}}
    @include('admin.eventos.partials.script_dias_actividades')

    <div class="text-end">
      <a href="{{ route('admin.eventos.index') }}" class="btn btn-outline-secondary me-2">Cancelar</a>
      <button type="submit" class="btn btn-primary">Guardar Evento</button>
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