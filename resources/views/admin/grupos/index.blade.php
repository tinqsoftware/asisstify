@extends('layouts.backoffice')

@section('title', 'Grupos')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
  <h3>Gestión de Grupos</h3>
  <a href="{{ route('admin.grupos.create') }}" class="btn btn-primary">Nuevo Grupo</a>
</div>

@if(session('success'))
  <div class="alert alert-success">{{ session('success') }}</div>
@endif

<table class="table table-hover align-middle">
  <thead class="table-light">
    <tr>
      <th>Nombre</th>
      <th>Entidad</th>
      <th>Miembros</th>
      <th>Descripción</th>
      <th>Estado</th>
      <th>Creado</th>
      <th>Acciones</th>
    </tr>
  </thead>
  <tbody>
    @forelse($grupos as $grupo)
      <tr>
        <td>{{ $grupo->nombre }}</td>
        <td>{{ $grupo->entidad ? $grupo->entidad->nombre : '—' }}</td>
        <td>
          <span class="badge bg-info text-dark">
            {{ $grupo->usuarios_count }}
          </span>
        </td>
        <td>{{ Str::limit($grupo->descripcion, 60) }}</td>
        <td>
          {!! $grupo->estado 
              ? '<span class="badge bg-success">Activo</span>' 
              : '<span class="badge bg-secondary">Inactivo</span>' !!}
        </td>
        <td>{{ $grupo->created_at->format('d/m/Y') }}</td>
        <td>
          <a href="{{ route('admin.grupos.miembros', $grupo->id) }}" class="btn btn-sm btn-outline-primary">👥 Miembros</a>
          <a href="{{ route('admin.grupos.edit', $grupo->id) }}" class="btn btn-sm btn-outline-dark">Editar</a>
        </td>
      </tr>
    @empty
      <tr>
        <td colspan="7" class="text-center">No hay grupos registrados.</td>
      </tr>
    @endforelse
  </tbody>
</table>

{{ $grupos->links() }}
@endsection