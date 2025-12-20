@extends('layouts.event_app')

@section('title', 'Asistencias - ' . $evento->titulo)

@section('content')
<div class="container py-4">
  <h3 class="fw-bold mb-3 text-success">Asistencias – {{ $evento->titulo }}</h3>

  <div class="mb-3 d-flex gap-2 align-items-center">
    <span class="badge bg-warning text-dark">Confirmados: {{ $totalConfirmados }}</span>
    <span class="badge bg-success">Asistidos: {{ $totalAsistidos }}</span>
  </div>

  @php
    $gruposDetalle = $miembros->groupBy('grupo')->map(function ($items) {
        return [
            'miembros' => $items,
            'confirmados' => $items->where('estado', 'Confirmado')->count(),
            'asistidos' => $items->where('estado', 'Asistió')->count(),
        ];
    });
  @endphp

  <ul class="nav nav-tabs mb-3">
    <li class="nav-item">
      <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tabGeneral" type="button">General</button>
    </li>
    <li class="nav-item">
      <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tabGrupos" type="button">Por grupos</button>
    </li>
  </ul>

  <div class="tab-content">
    <div class="tab-pane fade" id="tabGeneral">
      <table id="tablaAsistencias" class="table table-bordered table-striped w-100">
        <thead class="table-light">
          <tr>
            <th>Miembro</th>
            <th>Entidad</th>
            <th>Grupo</th>
            <th>Estado</th>
            <th>Fecha</th>
            <th>Hora</th>
          </tr>
        </thead>
        <tbody>
          @foreach($miembros as $m)
            <tr>
              <td>{{ $m['miembro'] }}</td>
              <td>{{ $m['entidad'] }}</td>
              <td>
                <span class="badge grupo-badge" data-grupo="{{ $m['grupo'] }}">{{ $m['grupo'] }}</span>
              </td>
              <td>
                @if($m['estado'] === 'Confirmado')
                  <span class="badge bg-warning text-dark">Confirmado</span>
                @elseif($m['estado'] === 'Asistió')
                  <span class="badge bg-success">Asistió</span>
                @else
                  <span class="badge bg-info text-dark">Mixto</span>
                @endif
              </td>
              <td>{{ $m['fecha'] }}</td>
              <td>{{ $m['hora'] }}</td>
            </tr>
          @endforeach
        </tbody>
      </table>
    </div>
    <div class="tab-pane fade show active" id="tabGrupos">
      <div class="accordion" id="gruposAccordion">
        @foreach($gruposDetalle as $grupoNombre => $detalle)
          @php $grupoId = 'grupo' . md5($grupoNombre); @endphp
          <div class="accordion-item bg-transparent border-0 mb-2">
            <h2 class="accordion-header" id="heading{{ $grupoId }}">
              <button class="accordion-button collapsed bg-transparent text-light border rounded" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{ $grupoId }}" aria-expanded="false">
                <span class="badge grupo-badge me-2" data-grupo="{{ $grupoNombre }}">{{ $grupoNombre }}</span>
                <span class="me-2">Confirmados: {{ $detalle['confirmados'] }}</span>
                <span>Asistidos: {{ $detalle['asistidos'] }}</span>
              </button>
            </h2>
            <div id="collapse{{ $grupoId }}" class="accordion-collapse collapse" data-bs-parent="#gruposAccordion">
              <div class="accordion-body pt-2">
                <table class="table table-bordered table-striped w-100">
                  <thead class="table-light">
                    <tr>
                      <th>Miembro</th>
                      <th>Estado</th>
                      <th>Fecha</th>
                      <th>Hora</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($detalle['miembros'] as $m)
                      <tr>
                        <td>{{ $m['miembro'] }}</td>
                        <td>
                          @if($m['estado'] === 'Confirmado')
                            <span class="badge bg-warning text-dark">Confirmado</span>
                          @elseif($m['estado'] === 'Asistió')
                            <span class="badge bg-success">Asistió</span>
                          @else
                            <span class="badge bg-info text-dark">Mixto</span>
                          @endif
                        </td>
                        <td>{{ $m['fecha'] }}</td>
                        <td>{{ $m['hora'] }}</td>
                      </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        @endforeach
      </div>
    </div>
  </div>
</div>

{{-- DataTables --}}
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<style>
/* colores para grupos (reutilizables) */
.badge.grupo-badge {
  background: #e3e3e3;
  color: #000;
}
</style>

<script>
function applyGroupBadgeColors(scope) {
  const badges = (scope || document).querySelectorAll('.grupo-badge[data-grupo]');
  badges.forEach(badge => {
    const group = (badge.getAttribute('data-grupo') || '').trim();
    if (!group || group === '—') {
      badge.style.background = '#e3e3e3';
      badge.style.color = '#000';
      return;
    }

    let hash = 0;
    for (let i = 0; i < group.length; i++) {
      hash = group.charCodeAt(i) + ((hash << 5) - hash);
      hash |= 0;
    }
    const hue = Math.abs(hash) % 360;
    badge.style.background = `hsl(${hue}, 70%, 35%)`;
    badge.style.color = '#fff';
  });
}

$(function () {
  const table = $('#tablaAsistencias').DataTable({
    order: [[0, 'asc']],
    pageLength: 100,
    lengthMenu: [[25, 50, 100, -1], [25, 50, 100, 'Todos']],
    language: {
      url: 'https://cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
    }
  });

  applyGroupBadgeColors();

  // refrescar automáticamente cada 15 s
  setInterval(loadLive, 15000);

  async function loadLive() {
    const res = await fetch("{{ route('admin.eventos.asistencias.live', $evento->id) }}");
    const data = await res.json();

    table.clear();
    data.forEach(m => {
      let estadoBadge = '';
      if (m.estado === 'Confirmado') {
        estadoBadge = "<span class='badge bg-warning text-dark'>Confirmado</span>";
      } else if (m.estado === 'Asistió') {
        estadoBadge = "<span class='badge bg-success'>Asistió</span>";
      } else {
        estadoBadge = "<span class='badge bg-info text-dark'>Mixto</span>";
      }

      table.row.add([
        m.miembro,
        m.entidad,
        `<span class="badge grupo-badge" data-grupo="${m.grupo}">${m.grupo}</span>`,
        estadoBadge,
        m.fecha,
        m.hora
      ]);
    });
    table.draw();
    applyGroupBadgeColors(document.getElementById('tablaAsistencias'));
  }
});
</script>
@endsection
