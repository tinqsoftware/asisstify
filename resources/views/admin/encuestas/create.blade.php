@extends('layouts.event_app')

@section('title', 'Nueva encuesta - ' . $evento->titulo)

@section('content')
<div class="container-fluid">
  <div class="mb-3">
    <a href="{{ route('admin.eventos.encuestas.index', $evento->id) }}" class="btn btn-link ps-0">
      ← Volver a encuestas
    </a>
  </div>

  <div class="card">
    <div class="card-header">
      <h5 class="mb-0">Crear encuesta para: {{ $evento->titulo }}</h5>
    </div>
    <div class="card-body">
      @if ($errors->any())
        <div class="alert alert-danger">
          <ul class="mb-0">
            @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
            @endforeach
          </ul>
        </div>
      @endif

      <form method="POST" action="{{ route('admin.eventos.encuestas.store', $evento->id) }}">
        @csrf

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label">Nombre de la encuesta</label>
            <input type="text" name="nombre" class="form-control" required value="{{ old('nombre') }}">
          </div>
          <div class="col-md-6">
            <label class="form-label">Tipo</label>
            <select name="tipo" class="form-select" required>
              <option value="karaoke" {{ old('tipo') === 'karaoke' ? 'selected' : '' }}>Karaoke</option>
              <option value="ranking" {{ old('tipo','ranking') === 'ranking' ? 'selected' : '' }}>Ranking por categoría</option>
            </select>
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label">Descripción / instrucciones (opcional)</label>
          <textarea name="descripcion" class="form-control" rows="2">{{ old('descripcion') }}</textarea>
        </div>

        <div class="row mb-3">
          <div class="col-md-4">
            <label class="form-label">Encuesta abierta</label>
            <select name="es_abierta" class="form-select">
              <option value="0" {{ old('es_abierta') == '0' ? 'selected' : '' }}>Solo asistentes (login)</option>
              <option value="1" {{ old('es_abierta') == '1' ? 'selected' : '' }}>Abierta con link (pide nombre)</option>
            </select>
          </div>
          <div class="col-md-4">
            <label class="form-label">Máx. opciones por usuario</label>
            <input type="number" name="max_opciones_por_usuario" min="1" class="form-control"
                   value="{{ old('max_opciones_por_usuario',1) }}" required>
          </div>
          <div class="col-md-4">
            <label class="form-label">Modo de resultados</label>
            <select name="modo_resultados" class="form-select" required>
              <option value="tiempo_real" {{ old('modo_resultados') === 'tiempo_real' ? 'selected' : '' }}>En tiempo real</option>
              <option value="solo_total" {{ old('modo_resultados') === 'solo_total' ? 'selected' : '' }}>Mostrar solo total de votantes</option>
              <option value="final" {{ old('modo_resultados') === 'final' ? 'selected' : '' }}>Mostrar solo al final</option>
            </select>
          </div>
        </div>

        <div class="row mb-4">
          <div class="col-md-4">
            <div class="form-check mb-2">
              <input type="checkbox" class="form-check-input" id="unica_por_opcion" name="unica_por_opcion"
                     value="1" {{ old('unica_por_opcion') ? 'checked' : '' }}>
              <label class="form-check-label" for="unica_por_opcion">
                Solo un usuario por opción (modo karaoke)
              </label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="permitir_cambiar_voto" name="permitir_cambiar_voto"
                     value="1" {{ old('permitir_cambiar_voto') ? 'checked' : '' }}>
              <label class="form-check-label" for="permitir_cambiar_voto">
                Permitir cambiar voto dentro de la ronda
              </label>
            </div>
          </div>
        </div>

        <hr>

        <h5 class="mb-3">Opciones de la encuesta</h5>
        <p class="text-muted">Cada opción puede ser una canción (karaoke) o un participante/categoría (ranking).</p>

        <div id="opcionesWrapper">
          {{-- plantilla inicial de 3 opciones --}}
          @for($i=0;$i<3;$i++)
          <div class="card mb-2 opcion-item">
            <div class="card-body p-3">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>Opción <span class="opcion-index"></span></strong>
                <button type="button" class="btn btn-sm btn-outline-danger btn-remove-opcion">Quitar</button>
              </div>
              <div class="row">
                <div class="col-md-6 mb-2">
                  <label class="form-label">Nombre</label>
                  <input type="text" name="opciones[{{ $i }}][nombre]" class="form-control"
                         value="{{ old("opciones.$i.nombre") }}">
                </div>
                <div class="col-md-4 mb-2">
                  <label class="form-label">Color (CSS opcional)</label>
                  <input type="text" name="opciones[{{ $i }}][color]" class="form-control"
                         placeholder="#000000 o nombre"
                         value="{{ old("opciones.$i.color") }}">
                </div>
                <div class="col-md-12">
                  <label class="form-label">Descripción (opcional)</label>
                  <input type="text" name="opciones[{{ $i }}][descripcion]" class="form-control"
                         value="{{ old("opciones.$i.descripcion") }}">
                </div>
              </div>
            </div>
          </div>
          @endfor
        </div>

        <button type="button" class="btn btn-outline-secondary mb-4" id="btnAgregarOpcion">
          + Agregar otra opción
        </button>

        <div class="text-end">
          <button type="submit" class="btn btn-primary">
            Guardar encuesta
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const wrapper = document.getElementById('opcionesWrapper');
  const btnAdd = document.getElementById('btnAgregarOpcion');

  function refreshIndexes() {
    wrapper.querySelectorAll('.opcion-item').forEach((card, index) => {
      card.querySelector('.opcion-index').innerText = index + 1;
      card.querySelectorAll('input').forEach(inp => {
        const name = inp.getAttribute('name');
        if (!name) return;
        const newName = name.replace(/opciones\[\d+\]/, 'opciones['+index+']');
        inp.setAttribute('name', newName);
      });
    });
  }

  wrapper.addEventListener('click', (e) => {
    if (e.target.classList.contains('btn-remove-opcion')) {
      const cards = wrapper.querySelectorAll('.opcion-item');
      if (cards.length <= 2) {
        alert('La encuesta debe tener al menos 2 opciones.');
        return;
      }
      e.target.closest('.opcion-item').remove();
      refreshIndexes();
    }
  });

  btnAdd.addEventListener('click', () => {
    const count = wrapper.querySelectorAll('.opcion-item').length;
    const div = document.createElement('div');
    div.className = 'card mb-2 opcion-item';
    div.innerHTML = `
      <div class="card-body p-3">
        <div class="d-flex justify-content-between align-items-center mb-2">
          <strong>Opción <span class="opcion-index"></span></strong>
          <button type="button" class="btn btn-sm btn-outline-danger btn-remove-opcion">Quitar</button>
        </div>
        <div class="row">
          <div class="col-md-6 mb-2">
            <label class="form-label">Nombre</label>
            <input type="text" name="opciones[${count}][nombre]" class="form-control">
          </div>
          <div class="col-md-4 mb-2">
            <label class="form-label">Color (CSS opcional)</label>
            <input type="text" name="opciones[${count}][color]" class="form-control" placeholder="#000000 o nombre">
          </div>
          <div class="col-md-12">
            <label class="form-label">Descripción (opcional)</label>
            <input type="text" name="opciones[${count}][descripcion]" class="form-control">
          </div>
        </div>
      </div>`;
    wrapper.appendChild(div);
    refreshIndexes();
  });

  refreshIndexes();
});
</script>
@endsection