@extends('layouts.backoffice')

@section('content')
<div class="container mt-4">
    <h3>Nueva Entidad</h3>
    <form action="{{ route('admin.entidades.store') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label>Nombre</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Descripción</label>
            <textarea name="descripcion" class="form-control" rows="3"></textarea>
        </div>
        <div class="mb-3">
            <label>Estado</label>
            <select name="estado" class="form-control">
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Guardar</button>
        <a href="{{ route('admin.entidades.index') }}" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
@endsection