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
    @if($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Estado</th>
                @if(Auth::user()->esSuperAdmin())
                    <th>Administradores</th>
                @endif
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
                    @if(Auth::user()->esSuperAdmin())
                        <td>
                            @php($admins = $adminsPorEntidad[$ent->id] ?? collect())
                            @if($admins->isEmpty())
                                —
                            @else
                                {{ $admins->map(fn($a) => $a->usuario->name)->join(', ') }}
                            @endif
                        </td>
                    @endif
                    <td>{{ $ent->created_at->format('d/m/Y') }}</td>
                    <td>
                        <a href="{{ route('admin.entidades.edit', $ent->id) }}" class="btn btn-sm btn-outline-primary">Editar</a>
                        @if(Auth::user()->esSuperAdmin())
                            <button class="btn btn-sm btn-outline-dark" data-bs-toggle="modal" data-bs-target="#modalAdmins{{ $ent->id }}">Administradores</button>
                        @endif
                    </td>
                </tr>
            @empty
                <tr><td colspan="{{ Auth::user()->esSuperAdmin() ? 6 : 5 }}" class="text-center">No hay entidades registradas.</td></tr>
            @endforelse
        </tbody>
    </table>

    {{ $entidades->links() }}
</div>

@if(Auth::user()->esSuperAdmin())
@foreach($entidades as $ent)
  <div class="modal fade" id="modalAdmins{{ $ent->id }}" tabindex="-1" aria-labelledby="modalAdminsLabel{{ $ent->id }}" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalAdminsLabel{{ $ent->id }}">Administradores - {{ $ent->nombre }}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <form method="POST" action="{{ route('admin.entidades.admins.sync', $ent->id) }}" class="admin-selector" data-admin-selector data-owner-radio="owner_radio_index_{{ $ent->id }}">
            @csrf
            <div class="mb-3">
              <input type="text" class="form-control" data-admin-search placeholder="Buscar por nombre, correo o documento (mín. 3 caracteres)">
              <div class="list-group mt-2" data-admin-results></div>
            </div>
            <input type="hidden" name="owner_id" value="{{ $ownerPorEntidad[$ent->id] ?? '' }}">
            <div class="list-group mb-3" data-admin-selected>
              @foreach(($adminsPorEntidad[$ent->id] ?? collect()) as $admin)
                <div class="list-group-item d-flex justify-content-between align-items-center" data-admin-id="{{ $admin->usuario->id }}">
                  <div>
                    <div class="fw-semibold">{{ $admin->usuario->name }} {{ $admin->usuario->apellidos }}</div>
                    <small class="text-muted">{{ $admin->usuario->email ?? '—' }} {{ $admin->usuario->nro_documento ? '· ' . $admin->usuario->nro_documento : '' }}</small>
                  </div>
                  <div class="d-flex gap-2 align-items-center">
                    <div class="form-check mb-0">
                      <input class="form-check-input" type="radio" data-owner-radio name="owner_radio_index_{{ $ent->id }}" value="{{ $admin->usuario->id }}" {{ ($ownerPorEntidad[$ent->id] ?? null) == $admin->usuario->id ? 'checked' : '' }}>
                      <label class="form-check-label">Propietario</label>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-danger" data-remove-admin>Quitar</button>
                  </div>
                  <input type="hidden" name="admin_ids[]" value="{{ $admin->usuario->id }}">
                </div>
              @endforeach
            </div>
            <button type="submit" class="btn btn-primary">Guardar administradores</button>
          </form>
        </div>
      </div>
    </div>
  </div>
@endforeach
@endif

<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchUrl = "{{ route('admin.entidades.buscarUsuarios') }}";

    function initAdminSelector(root) {
        const searchInput = root.querySelector('[data-admin-search]');
        const results = root.querySelector('[data-admin-results]');
        const selected = root.querySelector('[data-admin-selected]');
        const ownerInput = root.querySelector('input[name="owner_id"]');
        const ownerRadioName = root.getAttribute('data-owner-radio') || 'owner_radio';

        const addAdmin = (u) => {
            if (selected.querySelector(`[data-admin-id="${u.id}"]`)) {
                return;
            }

            const item = document.createElement('div');
            item.className = 'list-group-item d-flex justify-content-between align-items-center';
            item.dataset.adminId = u.id;
            item.innerHTML = `
                <div>
                    <div class="fw-semibold">${u.name} ${u.apellidos || ''}</div>
                    <small class="text-muted">${u.email || '—'} ${u.nro_documento ? '· ' + u.nro_documento : ''}</small>
                </div>
                <div class="d-flex gap-2 align-items-center">
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="radio" data-owner-radio name="${ownerRadioName}" value="${u.id}">
                        <label class="form-check-label">Propietario</label>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-danger" data-remove-admin>Quitar</button>
                </div>
                <input type="hidden" name="admin_ids[]" value="${u.id}">
            `;
            selected.appendChild(item);

            if (!ownerInput.value) {
                const radio = item.querySelector('[data-owner-radio]');
                if (radio) {
                    radio.checked = true;
                    ownerInput.value = u.id;
                }
            }
        };

        const syncOwnerInput = () => {
            const checked = selected.querySelector('[data-owner-radio]:checked');
            ownerInput.value = checked ? checked.value : '';
        };

        searchInput.addEventListener('input', function() {
            const q = this.value.trim();
            results.innerHTML = '';
            if (q.length < 3) {
                return;
            }

            fetch(`${searchUrl}?q=${encodeURIComponent(q)}`)
                .then(res => res.json())
                .then(data => {
                    results.innerHTML = '';
                    data.forEach(u => {
                        const item = document.createElement('a');
                        item.href = '#';
                        item.className = 'list-group-item list-group-item-action';
                        item.textContent = `${u.name} ${u.apellidos || ''} (${u.email || u.nro_documento || '—'})`;
                        item.addEventListener('click', (e) => {
                            e.preventDefault();
                            addAdmin(u);
                            results.innerHTML = '';
                            searchInput.value = '';
                        });
                        results.appendChild(item);
                    });
                });
        });

        root.addEventListener('click', function(e) {
            const removeBtn = e.target.closest('[data-remove-admin]');
            if (!removeBtn) return;

            const item = removeBtn.closest('[data-admin-id]');
            if (!item) return;

            const removedId = item.dataset.adminId;
            item.remove();

            if (ownerInput.value === removedId) {
                ownerInput.value = '';
                const firstRadio = selected.querySelector('[data-owner-radio]');
                if (firstRadio) {
                    firstRadio.checked = true;
                    ownerInput.value = firstRadio.value;
                }
            }
        });

        root.addEventListener('change', function(e) {
            if (e.target.matches('[data-owner-radio]')) {
                ownerInput.value = e.target.value;
            }
        });

        const formEl = root.closest('form') || root;
        formEl.addEventListener('submit', function() {
            syncOwnerInput();
        });

        syncOwnerInput();
    }

    document.querySelectorAll('[data-admin-selector]').forEach(initAdminSelector);
});
</script>
@endsection
