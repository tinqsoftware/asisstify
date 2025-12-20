@extends('layouts.event_app')

@section('title', 'Grupos')

@section('content')
<style>
  .grupos-shell {
    background: rgba(15, 23, 42, 0.96);
    border: 1px solid rgba(148, 163, 184, 0.35);
    border-radius: 22px;
    padding: 20px;
    color: #e5e7eb;
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.5);
  }
  .grupos-title {
    font-weight: 800;
    font-size: 1.5rem;
    margin-bottom: 4px;
  }
  .grupos-sub {
    color: #9ca3af;
    font-size: .82rem;
  }
  .grupos-actions .btn {
    border-radius: 999px;
    text-transform: uppercase;
    letter-spacing: .12em;
    font-size: .7rem;
  }
  .grupos-table {
    border-color: rgba(148, 163, 184, 0.25);
    color: #e5e7eb;
  }
  .grupos-table thead {
    background: rgba(30, 41, 59, 0.7);
    color: #e5e7eb;
    text-transform: uppercase;
    letter-spacing: .1em;
    font-size: .7rem;
  }
  .grupos-table tbody tr {
    background: rgba(2, 6, 23, 0.6);
  }
  .grupos-table td, .grupos-table th {
    border-color: rgba(148, 163, 184, 0.2);
    vertical-align: middle;
  }
  .grupos-badge {
    border-radius: 999px;
    padding: 4px 10px;
    font-size: .65rem;
    text-transform: uppercase;
    letter-spacing: .12em;
  }
  .grupos-actions-cell .btn {
    border-radius: 999px;
    font-size: .65rem;
    text-transform: uppercase;
    letter-spacing: .1em;
  }
  .pagination {
    --bs-pagination-bg: rgba(15, 23, 42, 0.9);
    --bs-pagination-border-color: rgba(148, 163, 184, 0.25);
    --bs-pagination-color: #e5e7eb;
    --bs-pagination-hover-bg: rgba(251, 191, 36, 0.18);
    --bs-pagination-hover-color: #fef3c7;
    --bs-pagination-active-bg: #fbbf24;
    --bs-pagination-active-border-color: #fbbf24;
    --bs-pagination-active-color: #111827;
  }
  @media (max-width: 768px) {
    .grupos-actions {
      flex-direction: column;
      align-items: flex-start;
      gap: 8px;
    }
  }
</style>

<div class="grupos-shell">
  <div class="d-flex justify-content-between align-items-center mb-3 grupos-actions">
    <div>
      <div class="grupos-title">Gestión de Grupos</div>
      <div class="grupos-sub">Organiza miembros y accesos por entidad.</div>
    </div>
    @if(Auth::user()->esSuperAdmin() || Auth::user()->tieneRolEntidad('ADMIN'))
      <a href="{{ route('admin.grupos.create') }}" class="btn btn-warning text-dark">Nuevo Grupo</a>
    @endif
  </div>

@if(session('success'))
  <div class="alert alert-success">{{ session('success') }}</div>
@endif

<table class="table table-hover align-middle grupos-table">
  <thead>
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
          <span class="badge bg-info text-dark grupos-badge">
            {{ $grupo->usuarios_count }}
          </span>
        </td>
        <td>{{ Str::limit($grupo->descripcion, 60) }}</td>
        <td>
          {!! $grupo->estado 
              ? '<span class="badge bg-success grupos-badge">Activo</span>' 
              : '<span class="badge bg-secondary grupos-badge">Inactivo</span>' !!}
        </td>
        <td>{{ $grupo->created_at->format('d/m/Y') }}</td>
        <td>
          @php
            $canManage = Auth::user()->esSuperAdmin() || in_array($grupo->entidad_id, $adminEntidadIds ?? []);
            $canViewMembers = $canManage || in_array($grupo->id, $userGroupIds ?? []);
          @endphp
          @if($canViewMembers)
            <a href="{{ route('admin.grupos.miembros', $grupo->id) }}" class="btn btn-sm btn-outline-info">Miembros</a>
          @endif
          @if($canManage)
            <a href="{{ route('admin.grupos.edit', $grupo->id) }}" class="btn btn-sm btn-outline-light">Editar</a>
          @endif
        </td>
      </tr>
    @empty
      <tr>
        <td colspan="7" class="text-center text-muted">No hay grupos registrados.</td>
      </tr>
    @endforelse
  </tbody>
</table>

{{ $grupos->links() }}
</div>
@endsection
