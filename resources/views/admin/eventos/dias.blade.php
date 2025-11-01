@extends('layouts.backoffice')

@section('title', 'Días del Evento')

@section('content')
<div class="container py-4">
  <h3 class="mb-4 fw-semibold">{{ $evento->titulo }} — Días del Evento</h3>

  <form method="POST" action="{{ route('admin.eventos.agregarDia', $evento->id) }}" class="card p-3 mb-4">
    @csrf
    <div class="row">
      <div class="col-md-4">
        <label>Fecha</label>
        <input type="date" name="fecha" class="form-control" required>
      </div>
      <div class="col-md-6">
        <label>Título</label>
        <input type="text" name="titulo" class="form-control" placeholder="Ej. Día 1 - Bienvenida">
      </div>
      <div class="col-md-2 d-flex align-items-end">
        <button type="submit" class="btn btn-primary w-100">Agregar</button>
      </div>
    </div>
  </form>

  <table class="table table-striped align-middle">
    <thead class="table-light">
      <tr>
        <th>Fecha</th>
        <th>Título</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      @foreach($evento->dias as $dia)
      <tr>
        <td>{{ \Carbon\Carbon::parse($dia->fecha)->format('d/m/Y') }}</td>
        <td>{{ $dia->titulo }}</td>
        <td>
          <a href="{{ route('admin.eventos.actividades', [$evento->id, $dia->id]) }}" class="btn btn-sm btn-outline-dark">Actividades</a>
          <form action="{{ route('admin.eventos.eliminarDia', [$evento->id, $dia->id]) }}" method="POST" class="d-inline">
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