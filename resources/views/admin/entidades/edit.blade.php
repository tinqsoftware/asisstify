@extends('layouts.backoffice')

@section('content')
<div class="container mt-4">
    <h3>Editar Entidad</h3>
    @if($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <form action="{{ route('admin.entidades.update', $entidad->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="mb-3">
            <label>Nombre</label>
            <input type="text" name="nombre" class="form-control" value="{{ $entidad->nombre }}" required>
        </div>
        <div class="mb-3">
            <label>Descripción</label>
            <textarea name="descripcion" class="form-control" rows="3">{{ $entidad->descripcion }}</textarea>
        </div>
        <div class="mb-3">
            <label>Estado</label>
            <select name="estado" class="form-control">
                <option value="1" {{ $entidad->estado ? 'selected' : '' }}>Activo</option>
                <option value="0" {{ !$entidad->estado ? 'selected' : '' }}>Inactivo</option>
            </select>
        </div>

        <hr class="my-4">
        <h5 class="mb-3">Administradores</h5>
        <div class="admin-selector" data-admin-selector data-owner-radio="owner_radio_edit_{{ $entidad->id }}">
            <div class="mb-3">
                <input type="text" class="form-control" data-admin-search placeholder="Buscar por nombre, correo o documento (mín. 3 caracteres)">
                <div class="list-group mt-2" data-admin-results></div>
            </div>
            <input type="hidden" name="owner_id" value="{{ $ownerId ?? '' }}">
            <div class="list-group" data-admin-selected>
                @foreach($admins as $admin)
                    <div class="list-group-item d-flex justify-content-between align-items-center" data-admin-id="{{ $admin->usuario->id }}">
                        <div>
                            <div class="fw-semibold">{{ $admin->usuario->name }} {{ $admin->usuario->apellidos }}</div>
                            <small class="text-muted">{{ $admin->usuario->email ?? '—' }} {{ $admin->usuario->nro_documento ? '· ' . $admin->usuario->nro_documento : '' }}</small>
                        </div>
                        <div class="d-flex gap-2 align-items-center">
                            <div class="form-check mb-0">
                                <input class="form-check-input" type="radio" data-owner-radio name="owner_radio_edit_{{ $entidad->id }}" value="{{ $admin->usuario->id }}" {{ ($ownerId ?? null) == $admin->usuario->id ? 'checked' : '' }}>
                                <label class="form-check-label">Propietario</label>
                            </div>
                            <button type="button" class="btn btn-sm btn-outline-danger" data-remove-admin>Quitar</button>
                        </div>
                        <input type="hidden" name="admin_ids[]" value="{{ $admin->usuario->id }}">
                    </div>
                @endforeach
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Actualizar</button>
        <a href="{{ route('admin.entidades.index') }}" class="btn btn-secondary">Volver</a>
    </form>
</div>

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
