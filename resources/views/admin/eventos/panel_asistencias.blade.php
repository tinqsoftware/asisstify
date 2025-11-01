@extends('layouts.backoffice')

@section('title', 'Asistencias - ' . $evento->titulo)

@section('content')
<div class="container py-4">
  <h3 class="fw-bold mb-3 text-success">Asistencias – {{ $evento->titulo }}</h3>

  <div class="mb-3 d-flex gap-2 align-items-center">
    <span class="badge bg-warning text-dark">Confirmados: {{ $totalConfirmados }}</span>
    <span class="badge bg-success">Asistidos: {{ $totalAsistidos }}</span>
  </div>

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
            <span class="badge grupo-badge">{{ $m['grupo'] }}</span>
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
$(function () {
  const table = $('#tablaAsistencias').DataTable({
    order: [[0, 'asc']],
    language: {
      url: 'https://cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
    }
  });

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
        `<span class="badge grupo-badge">${m.grupo}</span>`,
        estadoBadge,
        m.fecha,
        m.hora
      ]);
    });
    table.draw();
  }
});
</script>
@endsection