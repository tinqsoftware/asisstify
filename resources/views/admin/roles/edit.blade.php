@extends('layouts.backoffice')

@section('content')
<div class="container mt-4">
    <h3>Editar Rol de Entidad</h3>
    <form action="{{ route('admin.roles.update', $rol->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="mb-3">
            <label>Código</label>
            <input type="text" name="codigo" class="form-control" value="{{ $rol->codigo }}" disabled>
        </div>
        <div class="mb-3">
            <label>Nombre</label>
            <input type="text" name="nombre" class="form-control" value="{{ $rol->nombre }}" required>
        </div>
        <div class="mb-3">
            <label>Descripción</label>
            <textarea name="descripcion" class="form-control" rows="3">{{ $rol->descripcion }}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Actualizar</button>
        <a href="{{ route('admin.roles.index') }}" class="btn btn-secondary">Volver</a>
    </form>
</div>
@endsection