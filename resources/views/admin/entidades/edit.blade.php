@extends('layouts.backoffice')

@section('content')
<div class="container mt-4">
    <h3>Editar Entidad</h3>
    <form action="{{ route('admin.entidades.update', $entidad->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="mb-3">
            <label>Nombre</label>
            <input type="text" name="nombre" class="form-control" value="{{ $entidad->nombre }}" required>
        </div>
        <div class="mb-3">
            <label>Descripción</label>
            <textarea name="descripcion" class="form-control" rows="3">{{ $entidad->descripcion }}</textarea>
        </div>
        <div class="mb-3">
            <label>Estado</label>
            <select name="estado" class="form-control">
                <option value="1" {{ $entidad->estado ? 'selected' : '' }}>Activo</option>
                <option value="0" {{ !$entidad->estado ? 'selected' : '' }}>Inactivo</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Actualizar</button>
        <a href="{{ route('admin.entidades.index') }}" class="btn btn-secondary">Volver</a>
    </form>
</div>
@endsection