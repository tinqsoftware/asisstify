@extends('layouts.backoffice')

@section('title', 'Miembros del Grupo')

@section('content')
<div class="container py-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h3 class="fw-semibold text-dark">Miembros del Grupo: {{ $grupo->nombre }}</h3>
    <a href="{{ route('admin.grupos.index') }}" class="btn btn-outline-secondary">Volver</a>
  </div>

  <div class="card shadow-sm p-4 mb-4 border-0">
    <h5 class="fw-semibold mb-3">Agregar Miembro</h5>
    <input type="text" id="buscarUsuario" class="form-control" placeholder="Escribe nombre, apellido, correo o documento (mínimo 3 letras)">
    <div id="resultadosUsuarios" class="list-group mt-2"></div>
  </div>

  <div class="card shadow-sm p-4 border-0">
    <h5 class="fw-semibold mb-3">Lista de Miembros</h5>
    <table class="table align-middle table-hover">
      <thead class="table-light">
        <tr>
          <th>Nombre</th>
          <th>Email</th>
          <th>Documento</th>
          <th>Acción</th>
        </tr>
      </thead>
      <tbody id="tablaMiembros">
        @forelse($grupo->usuarios as $usuario)
          <tr id="miembro-{{ $usuario->id }}">
            <td>{{ $usuario->name }} {{ $usuario->apellidos }}</td>
            <td>{{ $usuario->email }}</td>
            <td>{{ $usuario->nro_documento }}</td>
            <td>
              <button class="btn btn-sm btn-outline-danger eliminarUsuario" data-id="{{ $usuario->id }}">
                🗑 Eliminar
              </button>
            </td>
          </tr>
        @empty
          <tr><td colspan="4" class="text-center">No hay miembros en este grupo.</td></tr>
        @endforelse
      </tbody>
    </table>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const buscarInput = document.getElementById('buscarUsuario');
  const resultadosDiv = document.getElementById('resultadosUsuarios');

  buscarInput.addEventListener('input', function() {
    const q = this.value.trim();
    if (q.length < 3) {
      resultadosDiv.innerHTML = '';
      return;
    }

    fetch(`{{ route('admin.grupos.buscarUsuarios', $grupo->id) }}?q=${q}`)
      .then(res => res.json())
      .then(data => {
        resultadosDiv.innerHTML = '';
        data.forEach(u => {
          const item = document.createElement('a');
          item.href = '#';
          item.className = 'list-group-item list-group-item-action';
          item.textContent = `${u.name} ${u.apellidos || ''} (${u.email})`;
          item.addEventListener('click', () => agregarMiembro(u.id, `${u.name} ${u.apellidos || ''}`));
          resultadosDiv.appendChild(item);
        });
      });
  });

  function agregarMiembro(usuario_id, nombre) {
    if (!confirm(`¿Agregar a ${nombre} al grupo?`)) return;

    fetch(`{{ route('admin.grupos.agregarUsuario', $grupo->id) }}`, {
      method: 'POST',
      headers: {
        'X-CSRF-TOKEN': '{{ csrf_token() }}',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ usuario_id })
    })
    .then(res => res.json())
    .then(resp => {
      if (resp.error) {
        alert(resp.error);
      } else {
        location.reload();
      }
    });
  }

  document.querySelectorAll('.eliminarUsuario').forEach(btn => {
    btn.addEventListener('click', function() {
      const usuario_id = this.dataset.id;
      if (!confirm('¿Eliminar este usuario del grupo?')) return;

      fetch(`/admin/grupos/{{ $grupo->id }}/eliminar-usuario/${usuario_id}`, {
        method: 'DELETE',
        headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}' }
      })
      .then(res => res.json())
      .then(() => location.reload());
    });
  });
});
</script>
@endsection