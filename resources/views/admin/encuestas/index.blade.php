@extends('layouts.event_app')

@section('title', 'Encuestas - ' . $evento->titulo)

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <div>
      <h3 class="mb-0">Encuestas del evento</h3>
      <small class="text-muted">{{ $evento->titulo }}</small>
    </div>
    <a href="{{ route('admin.eventos.encuestas.create', $evento->id) }}" class="btn btn-primary">
      + Nueva encuesta
    </a>
  </div>

  @if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
  @endif

  @if($encuestas->isEmpty())
    <div class="alert alert-info">
      Aún no has creado encuestas para este evento.
    </div>
  @else
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table mb-0 align-middle">
            <thead class="table-light">
              <tr>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Estado</th>
                <th>Ronda</th>
                <th>Opciones</th>
                <th>Votos ronda actual</th>
                <th class="text-end">Acciones</th>
              </tr>
            </thead>
            <tbody>
              @foreach($encuestas as $encuesta)
                <tr>
                  <td>
                    <strong>{{ $encuesta->nombre }}</strong><br>
                    <small class="text-muted">{{ Str::limit($encuesta->descripcion, 60) }}</small>
                  </td>
                  <td>
                    <span class="badge bg-dark text-uppercase">{{ $encuesta->tipo }}</span>
                  </td>
                  <td>
                    @php
                      $colors = [
                        'borrador' => 'secondary',
                        'activa'   => 'success',
                        'cerrada'  => 'danger',
                      ];
                    @endphp
                    <span class="badge bg-{{ $colors[$encuesta->estado] ?? 'secondary' }}">
                      {{ strtoupper($encuesta->estado) }}
                    </span>
                  </td>
                  <td>{{ $encuesta->ronda_actual }}</td>
                  <td>{{ $encuesta->opciones->count() }}</td>
                  <td>{{ $encuesta->total_votos ?? 0 }}</td>
                  <td class="text-end">
                    <a href="{{ route('admin.eventos.encuestas.edit', [$evento->id, $encuesta->id]) }}"
                       class="btn btn-sm btn-outline-primary me-1">
                      Editar
                    </a>

                    <a href="{{ route('admin.eventos.encuestas.pantalla', [$evento->id, $encuesta->id]) }}"
                       target="_blank"
                       class="btn btn-sm btn-outline-dark me-1">
                      Pantalla
                    </a>

                    @if($encuesta->estado !== 'activa')
                      <form action="{{ route('admin.eventos.encuestas.activar', [$evento->id, $encuesta->id]) }}"
                            method="POST" class="d-inline">
                        @csrf
                        <button class="btn btn-sm btn-success">Activar</button>
                      </form>
                    @endif

                    @if($encuesta->estado === 'activa')
                      <form action="{{ route('admin.eventos.encuestas.cerrar', [$evento->id, $encuesta->id]) }}"
                            method="POST" class="d-inline">
                        @csrf
                        <button class="btn btn-sm btn-danger">Cerrar</button>
                      </form>
                    @endif

                    <form action="{{ route('admin.eventos.encuestas.nuevaRonda', [$evento->id, $encuesta->id]) }}"
                          method="POST" class="d-inline">
                      @csrf
                      <button class="btn btn-sm btn-outline-secondary">
                        Nueva ronda
                      </button>
                    </form>

                  </td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  @endif
</div>
@endsection