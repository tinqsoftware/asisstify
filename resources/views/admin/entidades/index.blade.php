@extends('layouts.backoffice')

@section('content')
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Gestión de Entidades</h3>
        <a href="{{ route('admin.entidades.create') }}" class="btn btn-primary">Nueva Entidad</a>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Estado</th>
                <th>Creado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            @forelse($entidades as $ent)
                <tr>
                    <td>{{ $ent->nombre }}</td>
                    <td>{{ Str::limit($ent->descripcion, 60) }}</td>
                    <td>
                        @if($ent->estado)
                            <span class="badge bg-success">Activo</span>
                        @else
                            <span class="badge bg-secondary">Inactivo</span>
                        @endif
                    </td>
                    <td>{{ $ent->created_at->format('d/m/Y') }}</td>
                    <td>
                        <a href="{{ route('admin.entidades.edit', $ent->id) }}" class="btn btn-sm btn-outline-primary">Editar</a>
                    </td>
                </tr>
            @empty
                <tr><td colspan="5" class="text-center">No hay entidades registradas.</td></tr>
            @endforelse
        </tbody>
    </table>

    {{ $entidades->links() }}
</div>
@endsection