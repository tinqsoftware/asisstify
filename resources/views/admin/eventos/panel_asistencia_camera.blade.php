@extends('layouts.backoffice')

@section('title', 'Asistencia - ' . $evento->titulo)

@section('content')
<div class="container py-4">
  <h3 class="fw-bold text-success mb-3">{{ $evento->titulo }}</h3>
  <p><strong>Modalidad:</strong> {{ ucfirst($evento->modalidad) }}</p>
  <p><strong>Fechas:</strong> {{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }} - {{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}</p>

  <div class="card shadow-sm mb-4">
    <div class="card-header bg-dark text-white">
      <strong>Actividades del evento</strong>
    </div>
    <div class="list-group list-group-flush">
      @foreach($evento->dias as $dia)
        @foreach($dia->actividades as $actividad)
          <a href="{{ route('admin.eventos.asistencias.actividadCamera', [$evento->id, $actividad->id]) }}" 
             class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
             <div>
               <strong>{{ $actividad->titulo }}</strong><br>
               <small class="text-muted">Día: {{ \Carbon\Carbon::parse($dia->fecha_dia)->format('d/m/Y') }}</small>
             </div>
             <span class="badge bg-success">Abrir</span>
          </a>
        @endforeach
      @endforeach
    </div>
  </div>
</div>
@endsection