@extends('layouts.backoffice')

@section('title', 'Editar Grupo')

@section('content')
<div class="container py-4">
  <h3 class="mb-4 fw-semibold text-dark">Editar Grupo</h3>

  <form action="{{ route('admin.grupos.update', $grupo->id) }}" method="POST" class="card shadow-sm p-4 border-0">
    @csrf
    @method('PUT')

    <div class="mb-3">
      <label for="nombre" class="form-label fw-semibold">Nombre del Grupo</label>
      <input type="text" name="nombre" id="nombre" class="form-control" value="{{ old('nombre', $grupo->nombre) }}" required>
    </div>

    <div class="mb-3">
      <label for="descripcion" class="form-label fw-semibold">Descripción</label>
      <textarea name="descripcion" id="descripcion" rows="3" class="form-control">{{ old('descripcion', $grupo->descripcion) }}</textarea>
    </div>

    <div class="mb-3">
      <label for="estado" class="form-label fw-semibold">Estado</label>
      <select name="estado" id="estado" class="form-select">
        <option value="1" {{ $grupo->estado ? 'selected' : '' }}>Activo</option>
        <option value="0" {{ !$grupo->estado ? 'selected' : '' }}>Inactivo</option>
      </select>
    </div>

    <div class="text-end">
      <a href="{{ route('admin.grupos.index') }}" class="btn btn-outline-secondary me-2">Cancelar</a>
      <button type="submit" class="btn btn-success">Actualizar</button>
    </div>
  </form>
</div>
@endsection