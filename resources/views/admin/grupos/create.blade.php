@extends('layouts.backoffice')

@section('title', 'Crear Grupo')

@section('content')
<div class="container py-4">
  <h3 class="mb-4 fw-semibold text-dark">Crear Nuevo Grupo</h3>

  <form action="{{ route('admin.grupos.store') }}" method="POST" class="card shadow-sm p-4 border-0">
    @csrf

    <div class="mb-3">
      <label for="entidad_id" class="form-label fw-semibold">Entidad</label>
      <select name="entidad_id" id="entidad_id" class="form-select" required>
        <option value="">Seleccione una entidad</option>
        @foreach($entidades as $ent)
          <option value="{{ $ent->id }}" {{ old('entidad_id') == $ent->id ? 'selected' : '' }}>
            {{ $ent->nombre }}
          </option>
        @endforeach
      </select>
      @error('entidad_id') <small class="text-danger">{{ $message }}</small> @enderror
    </div>

    <div class="mb-3">
      <label for="nombre" class="form-label fw-semibold">Nombre del Grupo</label>
      <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Ingrese el nombre del grupo" value="{{ old('nombre') }}" required>
      @error('nombre') <small class="text-danger">{{ $message }}</small> @enderror
    </div>

    <div class="mb-3">
      <label for="descripcion" class="form-label fw-semibold">Descripción</label>
      <textarea name="descripcion" id="descripcion" rows="3" class="form-control" placeholder="Describa brevemente el propósito del grupo">{{ old('descripcion') }}</textarea>
    </div>

    <div class="text-end">
      <a href="{{ route('admin.grupos.index') }}" class="btn btn-outline-secondary me-2">Cancelar</a>
      <button type="submit" class="btn btn-primary">Guardar Grupo</button>
    </div>
  </form>
</div>
@endsection