@extends('layouts.backoffice')

@section('content')
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Roles de Entidad</h3>
        <a href="{{ route('admin.roles.create') }}" class="btn btn-primary">Nuevo Rol</a>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Creado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            @forelse($roles as $rol)
                <tr>
                    <td>{{ $rol->codigo }}</td>
                    <td>{{ $rol->nombre }}</td>
                    <td>{{ Str::limit($rol->descripcion, 60) }}</td>
                    <td>{{ $rol->created_at->format('d/m/Y') }}</td>
                    <td>
                        <a href="{{ route('admin.roles.edit', $rol->id) }}" class="btn btn-sm btn-outline-primary">Editar</a>
                    </td>
                </tr>
            @empty
                <tr><td colspan="5" class="text-center">No hay roles registrados.</td></tr>
            @endforelse
        </tbody>
    </table>

    {{ $roles->links() }}
</div>
@endsection