@extends('layouts.event_app')

@section('title', 'Miembros del Grupo')

@section('content')
<div class="container py-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h3 class="fw-semibold text-dark">Miembros del Grupo: {{ $grupo->nombre }}</h3>
    <div class="d-flex gap-2">
      @if($canManage)
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalRegistrarUsuario">Registrar Usuario</button>
      @endif
      <a href="{{ route('admin.grupos.index') }}" class="btn btn-outline-secondary">Volver</a>
    </div>
  </div>

  @if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
  @endif

  @if($errors->any())
    <div class="alert alert-danger">
      <ul class="mb-0">
        @foreach($errors->all() as $error)
          <li>{{ $error }}</li>
        @endforeach
      </ul>
    </div>
  @endif

  @if($canManage)
    <div class="card shadow-sm p-4 mb-4 border-0">
      <h5 class="fw-semibold mb-3">Agregar Miembro</h5>
      <input type="text" id="buscarUsuario" class="form-control" placeholder="Escribe nombre, apellido, correo o documento (mínimo 3 letras)">
      <div id="resultadosUsuarios" class="list-group mt-2"></div>
    </div>
  @endif

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
              @if($canManage)
                <button class="btn btn-sm btn-outline-danger eliminarUsuario" data-id="{{ $usuario->id }}">
                  🗑 Eliminar
                </button>
              @else
                —
              @endif
            </td>
          </tr>
        @empty
          <tr><td colspan="4" class="text-center">No hay miembros en este grupo.</td></tr>
        @endforelse
      </tbody>
    </table>
  </div>
</div>

@if($canManage)
<!-- Modal Registrar Usuario -->
<div class="modal fade" id="modalRegistrarUsuario" tabindex="-1" aria-labelledby="modalRegistrarUsuarioLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalRegistrarUsuarioLabel">Registrar Usuario</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <form method="POST" action="{{ route('admin.grupos.registrarUsuario', $grupo->id) }}">
          @csrf
          <div class="mb-3">
            <input type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="Nombre completo" required>
          </div>
          <div class="mb-3">
            <input type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="Correo electrónico (opcional)">
          </div>
          <div class="row g-2 mb-3">
            <div class="col-4">
              <select class="form-select" name="tipo_documento">
                <option value="1" {{ old('tipo_documento', '1') === '1' ? 'selected' : '' }}>DNI</option>
                <option value="2" {{ old('tipo_documento') === '2' ? 'selected' : '' }}>CE</option>
                <option value="3" {{ old('tipo_documento') === '3' ? 'selected' : '' }}>PST</option>
                <option value="4" {{ old('tipo_documento') === '4' ? 'selected' : '' }}>RUC</option>
              </select>
            </div>
            <div class="col-8">
              <input type="text" class="form-control" name="nro_documento" value="{{ old('nro_documento') }}" placeholder="Número de documento (opcional)">
            </div>
          </div>
          <div class="mb-3">
            <select class="form-select" name="sexo">
              <option value="" {{ old('sexo') === null || old('sexo') === '' ? 'selected' : '' }}>Seleccionar sexo</option>
              <option value="M" {{ old('sexo') === 'M' ? 'selected' : '' }}>Masculino</option>
              <option value="F" {{ old('sexo') === 'F' ? 'selected' : '' }}>Femenino</option>
            </select>
          </div>
          <div class="alert alert-info mb-3">
            La contraseña de este usuario es: <strong id="passwordHint">12345678</strong>
          </div>
          <button type="submit" class="btn btn-success w-100">Registrar</button>
        </form>
      </div>
    </div>
  </div>
</div>
@endif

<script>
document.addEventListener('DOMContentLoaded', function() {
  const hasErrors = {{ $errors->any() ? 'true' : 'false' }};
  const modalEl = document.getElementById('modalRegistrarUsuario');
  if (hasErrors && modalEl) {
    const modal = new bootstrap.Modal(modalEl);
    modal.show();
  }

  const buscarInput = document.getElementById('buscarUsuario');
  const resultadosDiv = document.getElementById('resultadosUsuarios');
  const nroDocumentoInput = document.querySelector('input[name="nro_documento"]');
  const passwordHint = document.getElementById('passwordHint');

  if (nroDocumentoInput && passwordHint) {
    const updatePasswordHint = () => {
      const value = nroDocumentoInput.value.trim();
      passwordHint.textContent = value.length ? value : '12345678';
    };
    nroDocumentoInput.addEventListener('input', updatePasswordHint);
    updatePasswordHint();
  }

  if (buscarInput && resultadosDiv) {
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
  }

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
