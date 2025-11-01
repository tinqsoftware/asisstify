@extends('layouts.backoffice')

@section('title', 'Confirmar asistencia')

@section('content')
<div class="container py-4">
  <h4 class="fw-bold mb-3">{{ $evento->titulo }}</h4>
  <p class="text-muted">{{ $evento->descripcion }}</p>
  <form method="POST" action="{{ route('eventos.confirmar', $evento->id) }}">
    @csrf
    @foreach($evento->dias as $dia)
      <h6 class="text-primary mt-3">{{ \Carbon\Carbon::parse($dia->fecha)->format('d/m/Y') }}</h6>
      @foreach($dia->actividades as $act)
        <div class="form-check mb-2">
          <input class="form-check-input" type="checkbox" name="actividades[]" value="{{ $act->id }}" checked>
          <label class="form-check-label">
            {{ $act->titulo }}
            <small class="text-muted">({{ substr($act->hora_inicio,0,5) }} - {{ substr($act->hora_fin,0,5) }})</small>
          </label>
        </div>
      @endforeach
    @endforeach
    <button type="submit" class="btn btn-success mt-3">Confirmar asistencia</button>
  </form>
</div>
@endsection