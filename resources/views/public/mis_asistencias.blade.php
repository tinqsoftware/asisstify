@extends('layouts.backoffice')

@section('title', 'Mis Asistencias')

@section('content')
<div class="container py-4">
  <h2 class="fw-bold mb-4 text-dark">Mis Asistencias</h2>

  <!-- Fichas de navegación -->
  <ul class="nav nav-tabs mb-3" id="asistenciasTab" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="confirmadas-tab" data-bs-toggle="tab" data-bs-target="#confirmadas" type="button" role="tab" aria-controls="confirmadas" aria-selected="true">
        Confirmadas
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="asistidas-tab" data-bs-toggle="tab" data-bs-target="#asistidas" type="button" role="tab" aria-controls="asistidas" aria-selected="false">
        Asistidas
      </button>
    </li>
  </ul>

  <div class="tab-content" id="asistenciasTabContent">

    <!-- TAB CONFIRMADAS -->
    <div class="tab-pane fade show active" id="confirmadas" role="tabpanel" aria-labelledby="confirmadas-tab">
      @php
        $eventosConfirmados = $eventos->filter(function($evento){
          return $evento->dias->flatMap->actividades->flatMap->asistencias
            ->contains(fn($a) => $a->metodo_entrada === 'confirmacion');
        });
      @endphp

      @forelse($eventosConfirmados as $evento)
        <div class="card mb-4 shadow-sm">
          <div class="card-header bg-warning text-dark d-flex justify-content-between align-items-center">
            <h5 class="mb-0">{{ $evento->titulo }}</h5>
            <small>{{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }} - {{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}</small>
          </div>
          <div class="card-body">
            @foreach($evento->dias as $dia)
              @php
                $actividades = $dia->actividades->filter(fn($a) => $a->asistencias->first()?->metodo_entrada === 'confirmacion');
              @endphp
              @if($actividades->isNotEmpty())
                <h6 class="fw-semibold text-primary mt-3">{{ \Carbon\Carbon::parse($dia->fecha)->format('d/m/Y') }}</h6>
                @foreach($actividades as $act)
                  <div class="d-flex justify-content-between align-items-center border rounded-3 px-3 py-2 mb-2">
                    <div>
                      <strong>{{ $act->titulo }}</strong>
                      <br>
                      <small class="text-muted">{{ substr($act->hora_inicio,0,5) }} - {{ substr($act->hora_fin,0,5) }}</small>
                    </div>
                    <span class="badge bg-warning text-dark">Confirmado</span>
                  </div>
                @endforeach
              @endif
            @endforeach
          </div>
        </div>
      @empty
        <div class="alert alert-info text-center">
          No tienes actividades confirmadas.
        </div>
      @endforelse
    </div>

    <!-- TAB ASISTIDAS -->
    <div class="tab-pane fade" id="asistidas" role="tabpanel" aria-labelledby="asistidas-tab">
      @php
        $eventosAsistidos = $eventos->filter(function($evento){
          return $evento->dias->flatMap->actividades->flatMap->asistencias
            ->contains(fn($a) => $a->metodo_entrada !== 'confirmacion');
        });
      @endphp

      @forelse($eventosAsistidos as $evento)
        <div class="card mb-4 shadow-sm">
          <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0">{{ $evento->titulo }}</h5>
            <small>{{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }} - {{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}</small>
          </div>
          <div class="card-body">
            @foreach($evento->dias as $dia)
              @php
                $actividades = $dia->actividades->filter(fn($a) => $a->asistencias->first()?->metodo_entrada !== 'confirmacion');
              @endphp
              @if($actividades->isNotEmpty())
                <h6 class="fw-semibold text-primary mt-3">{{ \Carbon\Carbon::parse($dia->fecha)->format('d/m/Y') }}</h6>
                @foreach($actividades as $act)
                  <div class="d-flex justify-content-between align-items-center border rounded-3 px-3 py-2 mb-2">
                    <div>
                      <strong>{{ $act->titulo }}</strong>
                      <br>
                      <small class="text-muted">{{ substr($act->hora_inicio,0,5) }} - {{ substr($act->hora_fin,0,5) }}</small>
                    </div>
                    <span class="badge bg-success">Asistió</span>
                  </div>
                @endforeach
              @endif
            @endforeach
          </div>
        </div>
      @empty
        <div class="alert alert-info text-center">
          No tienes actividades asistidas.
        </div>
      @endforelse
    </div>

  </div>
</div>
@endsection