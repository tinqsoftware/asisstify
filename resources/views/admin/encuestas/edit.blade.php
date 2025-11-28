@extends('layouts.backoffice')

@section('title', 'Editar encuesta - ' . $encuesta->nombre)

@section('content')
<div class="container-fluid">
  <div class="mb-3 d-flex justify-content-between">
    <a href="{{ route('admin.eventos.encuestas.index', $evento->id) }}" class="btn btn-link ps-0">
      ← Volver a encuestas
    </a>
    <span class="text-muted align-self-center">Evento: {{ $evento->titulo }}</span>
  </div>

  <div class="card">
    <div class="card-header">
      <h5 class="mb-0">Editar encuesta</h5>
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

      <form method="POST" action="{{ route('admin.eventos.encuestas.update', [$evento->id, $encuesta->id]) }}" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div class="row mb-3">
          <div class="col-md-6">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control"
                   value="{{ old('nombre', $encuesta->nombre) }}" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Tipo</label>
            <select name="tipo" class="form-select" required>
              <option value="karaoke" {{ old('tipo',$encuesta->tipo) === 'karaoke' ? 'selected' : '' }}>Karaoke</option>
              <option value="ranking" {{ old('tipo',$encuesta->tipo) === 'ranking' ? 'selected' : '' }}>Ranking</option>
            </select>
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label">Descripción</label>
          <textarea name="descripcion" class="form-control" rows="2">{{ old('descripcion', $encuesta->descripcion) }}</textarea>
        </div>

        <div class="row mb-3">
          <div class="col-md-4">
            <label class="form-label">Encuesta abierta</label>
            <select name="es_abierta" class="form-select">
              <option value="0" {{ old('es_abierta',$encuesta->es_abierta) ? '' : 'selected' }}>Solo asistentes (login)</option>
              <option value="1" {{ old('es_abierta',$encuesta->es_abierta) ? 'selected' : '' }}>Abierta con link</option>
            </select>
          </div>
          <div class="col-md-4">
            <label class="form-label">Máx. opciones por usuario</label>
            <input type="number" min="1" name="max_opciones_por_usuario" class="form-control"
                   value="{{ old('max_opciones_por_usuario', $encuesta->max_opciones_por_usuario) }}" required>
          </div>
          <div class="col-md-4">
            <label class="form-label">Modo resultados</label>
            <select name="modo_resultados" class="form-select" required>
              <option value="tiempo_real" {{ old('modo_resultados',$encuesta->modo_resultados) === 'tiempo_real' ? 'selected' : '' }}>En tiempo real</option>
              <option value="solo_total" {{ old('modo_resultados',$encuesta->modo_resultados) === 'solo_total' ? 'selected' : '' }}>Solo total de votantes</option>
              <option value="final" {{ old('modo_resultados',$encuesta->modo_resultados) === 'final' ? 'selected' : '' }}>Solo al final</option>
            </select>
          </div>
        </div>

        <div class="row mb-4">
          <div class="col-md-4">
            <div class="form-check mb-2">
              <input type="checkbox" class="form-check-input" id="unica_por_opcion" name="unica_por_opcion"
                     value="1" {{ old('unica_por_opcion',$encuesta->unica_por_opcion) ? 'checked' : '' }}>
              <label class="form-check-label" for="unica_por_opcion">
                Solo un usuario por opción (karaoke)
              </label>
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="permitir_cambiar_voto" name="permitir_cambiar_voto"
                     value="1" {{ old('permitir_cambiar_voto',$encuesta->permitir_cambiar_voto) ? 'checked' : '' }}>
              <label class="form-check-label" for="permitir_cambiar_voto">
                Permitir cambiar voto
              </label>
            </div>
          </div>
        </div>

        <hr>
        <h6 class="mb-3">Opciones de la encuesta</h6>

        @foreach($encuesta->opciones as $opt)
          <div class="card mb-3">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <strong>Opción #{{ $loop->iteration }}</strong>
                <small class="text-muted">ID: {{ $opt->id }}</small>
              </div>

              <div class="row g-3 align-items-end">
                <div class="col-md-4">
                  <label class="form-label">Nombre de la opción</label>
                  <input type="text"
                        name="opciones[{{ $opt->id }}][nombre]"
                        class="form-control"
                        value="{{ old('opciones.'.$opt->id.'.nombre', $opt->nombre) }}"
                        required>
                </div>

                <div class="col-md-4">
                  <label class="form-label">Descripción (opcional)</label>
                  <input type="text"
                        name="opciones[{{ $opt->id }}][descripcion]"
                        class="form-control"
                        value="{{ old('opciones.'.$opt->id.'.descripcion', $opt->descripcion) }}">
                </div>

                <div class="col-md-4">
                  <label class="form-label">Color (opcional)</label>
                  <input type="text"
                        name="opciones[{{ $opt->id }}][color]"
                        class="form-control"
                        value="{{ old('opciones.'.$opt->id.'.color', $opt->color) }}"
                        placeholder="#FFFFFF o nombre CSS">
                </div>
              </div>

              <div class="row g-3 align-items-center mt-3">
                <div class="col-md-6">
                  <label class="form-label mb-1">Imagen (opcional)</label>
                  <input type="file"
                        name="opciones[{{ $opt->id }}][imagen]"
                        class="form-control"
                        accept="image/*">
                  <small class="text-muted">Máx. 2 MB. Deja vacío si no deseas cambiar la imagen.</small>
                </div>

                <div class="col-md-6">
                  @if($opt->imagen)
                    <label class="form-label d-block mb-1">Imagen actual</label>
                    <img src="{{ asset('storage/'.$opt->imagen) }}"
                        alt="Imagen opción {{ $opt->nombre }}"
                        class="img-thumbnail"
                        style="max-height: 90px;">
                  @else
                    <small class="text-muted">Esta opción aún no tiene imagen.</small>
                  @endif
                </div>
              </div>
            </div>
          </div>
        @endforeach

        <div class="text-end">
          <button type="submit" class="btn btn-primary">Guardar cambios</button>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection