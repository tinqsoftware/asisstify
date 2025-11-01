@extends('layouts.backoffice')

@section('title', 'Actividades del Día')

@section('content')
<div class="container py-4">
  <h3 class="mb-4 fw-semibold">{{ $dia->titulo }} — {{ $evento->titulo }}</h3>

  <form method="POST" action="{{ route('admin.eventos.agregarActividad', [$evento->id, $dia->id]) }}" class="card p-3 mb-4">
    @csrf
    <div class="row">
      <div class="col-md-4">
        <label>Título</label>
        <input type="text" name="titulo" class="form-control" required>
      </div>
      <div class="col-md-3">
        <label>Hora inicio</label>
        <input type="time" name="hora_inicio" class="form-control" required>
      </div>
      <div class="col-md-3">
        <label>Hora fin</label>
        <input type="time" name="hora_fin" class="form-control" required>
      </div>
    </div>

    <div class="mt-3">
      <label>Descripción</label>
      <textarea name="descripcion" class="form-control" rows="2"></textarea>
    </div>

    <div class="mt-3">
      <label>Grupos Dirigidos:</label>
      <div class="d-flex flex-wrap gap-3">
        @foreach($grupos as $grupo)
          <div class="form-check">
            <input class="form-check-input" type="checkbox" name="grupos[]" value="{{ $grupo->id }}" id="g{{ $grupo->id }}">
            <label class="form-check-label" for="g{{ $grupo->id }}">{{ $grupo->nombre }}</label>
          </div>
        @endforeach
      </div>
    </div>

    <div class="text-end mt-3">
      <button type="submit" class="btn btn-primary">Agregar Actividad</button>
    </div>
  </form>

  <table class="table table-hover">
    <thead>
      <tr>
        <th>Título</th>
        <th>Horario</th>
        <th>Grupos Dirigidos</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      @foreach($dia->actividades as $act)
      <tr>
        <td>{{ $act->titulo }}</td>
        <td>{{ $act->hora_inicio }} - {{ $act->hora_fin }}</td>
        <td>
          @php
            $gruposActividad = DB::table('E_actividad_grupos')
              ->join('E_grupos_entidad', 'E_actividad_grupos.grupo_id', '=', 'E_grupos_entidad.id')
              ->where('E_actividad_grupos.actividad_id', $act->id)
              ->pluck('E_grupos_entidad.nombre');
          @endphp
          @foreach($gruposActividad as $g)
            <span class="badge bg-secondary">{{ $g }}</span>
          @endforeach
        </td>
        <td>
          <form action="{{ route('admin.eventos.eliminarActividad', [$evento->id, $dia->id, $act->id]) }}" method="POST">
            @csrf @method('DELETE')
            <button type="submit" class="btn btn-sm btn-outline-danger">Eliminar</button>
          </form>
        </td>
      </tr>
      @endforeach
    </tbody>
  </table>
</div>
@endsection