@extends('layouts.backoffice')

@section('title', $evento->titulo)

@section('content')
<div class="container py-4">
  <h2 class="fw-bold mb-3">{{ $evento->titulo }}</h2>
  <p class="text-muted">{{ $evento->descripcion }}</p>
  <div class="mb-3">
    <span class="badge bg-info text-dark">{{ ucfirst($evento->modalidad) }}</span>
    <span class="ms-2"><i class="bi bi-geo-alt"></i> {{ $evento->lugar ?? 'Por definir' }}</span>
  </div>
  <p><strong>Fechas:</strong> {{ \Carbon\Carbon::parse($evento->fecha_inicio)->format('d/m/Y') }} - {{ \Carbon\Carbon::parse($evento->fecha_fin)->format('d/m/Y') }}</p>

  <hr>

  
    <div class="mt-4">
        <form action="{{ route('eventos.confirmar', $evento->id) }}" method="POST">
        @csrf
        @foreach($evento->dias as $dia)
            <h6 class="fw-semibold text-primary mt-3">{{ \Carbon\Carbon::parse($dia->fecha)->format('d/m/Y') }}</h6>
            @foreach($dia->actividades as $act)
            <div class="form-check ms-3 mb-2">
                <input class="form-check-input" type="checkbox" name="actividades[]" value="{{ $act->id }}" id="act{{ $act->id }}" checked>
                <label class="form-check-label" for="act{{ $act->id }}">
                <strong>{{ $act->titulo }}</strong>
                <small class="text-muted">({{ substr($act->hora_inicio,0,5) }} - {{ substr($act->hora_fin,0,5) }})</small>
                @if($act->requiere_asistencia)
                    <span class="badge bg-success ms-2">Asistencia</span>
                @endif
                </label>
            </div>
            @endforeach
        @endforeach

        @auth
            <button type="submit" class="btn btn-success px-4 mt-3">Confirmar asistencia</button>
        @else
            <button type="button" class="btn btn-success px-4 mt-3" data-bs-toggle="modal" data-bs-target="#modalLogin">
            Confirmar asistencia
            </button>
        @endauth
        </form>
    </div>
  <div id="calendarContainer" class="border rounded-4 shadow-sm p-3 bg-white mb-3 mt-3"></div>

</div>

<!-- Modal de registro/login -->
<div class="modal fade" id="modalLogin" tabindex="-1" aria-labelledby="modalLoginLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLoginLabel">Confirmar asistencia</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <form action="{{ route('register') }}" method="POST">
          @csrf
          <div class="mb-3">
            <label for="name" class="form-label">Nombres y Apellidos</label>
            <input type="text" class="form-control" name="name" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Correo electrónico</label>
            <input type="email" class="form-control" name="email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" name="password" required>
          </div>
          <div class="mb-3">
            <label for="password_confirmation" class="form-label">Confirmar contraseña</label>
            <input type="password" class="form-control" name="password_confirmation" required>
          </div>
          <button type="submit" class="btn btn-primary w-100">Registrarme y confirmar asistencia</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendarContainer');
    const events = @json($evento->dias->flatMap->actividades->map(fn($a) => [
        'title' => $a->titulo,
        'start' => $a->dia->fecha . 'T' . $a->hora_inicio,
        'end' => $a->dia->fecha . 'T' . $a->hora_fin
    ]));

    // Calcular la hora más temprana y más tardía
    const horas = events.map(e => ({
        inicio: e.start.split('T')[1],
        fin: e.end.split('T')[1],
    }));
    const minHora = horas.reduce((a, b) => a.inicio < b.inicio ? a : b).inicio;
    const maxHora = horas.reduce((a, b) => a.fin > b.fin ? a : b).fin;

    const isMobile = window.innerWidth < 768;

    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: isMobile ? 'timeGridTwoDay' : 'timeGridWeek',
        views: {
            timeGridTwoDay: {
                type: 'timeGrid',
                duration: { days: 2 },
                buttonText: '2 días'
            }
        },
        initialDate: '{{ $evento->fecha_inicio }}',
        locale: 'es',
        events: events,
        allDaySlot: false,
        slotDuration: '01:00:00',
        slotMinTime: minHora,
        slotMaxTime: maxHora,
        height: 'auto',
    });

    calendar.render();
    // Ajustes visuales para móvil
    if (isMobile) {
      const style = document.createElement('style');
      style.innerHTML = `
        .fc-toolbar-title { display: none !important; } /* Oculta "31 oct – 2 nov 2025" */
        .fc-col-header-cell-cushion {
          text-decoration: none !important; /* Quita subrayado de fechas */
          color: #333 !important;
        }
      `;
      document.head.appendChild(style);
    }
    });
</script>
@endsection