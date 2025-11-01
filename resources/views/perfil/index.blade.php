@extends('layouts.backoffice')

@section('title', 'Mi Perfil')

@section('content')
<div class="container py-4">
  <h2 class="fw-bold mb-4 text-success">Mi Perfil</h2>

  <div class="card mb-4 shadow-sm">
    <div class="card-body">
      <p><strong>Nombre:</strong> {{ $usuario->name }} {{ $usuario->apellidos }}</p>
      <p><strong>Correo:</strong> {{ $usuario->email }}</p>
    </div>
  </div>

  {{-- ================== SECCIÓN ROSTROS ================== --}}
  <div class="card shadow-sm">
    <div class="card-header bg-primary text-white">Mis Rostros (máximo 8 fotos)</div>
    <div class="card-body">

      {{-- ====== Subir o Tomar fotos ====== --}}
      <div class="mb-3 text-center">
        <input type="file" id="inputRostros" accept="image/*" multiple class="form-control mb-2">
        <button id="btnTomarFoto" class="btn btn-outline-primary me-2"><i class="bi bi-camera"></i> Tomar Foto</button>
        <button id="btnSubirFotos" class="btn btn-success"><i class="bi bi-upload"></i> Guardar Rostros</button>
      </div>

      {{-- Vista previa cámara --}}
      <div class="text-center mb-3" id="cameraBox" style="display:none;">
        <video id="videoCam" autoplay playsinline class="border rounded shadow" width="300" style="transform: scaleX(-1);"></video>
        <br>
        <button id="btnCapturar" class="btn btn-sm btn-success mt-2">Capturar</button>
        <button id="btnCerrarCam" class="btn btn-sm btn-secondary mt-2">Cerrar cámara</button>
      </div>

      {{-- Previsualización de fotos seleccionadas --}}
      <div id="previewBox" class="row mt-4"></div>

      {{-- Fotos guardadas --}}
      <hr>
      <h5 class="text-muted mb-3">Fotos guardadas</h5>
      <div class="row">
        @forelse($rostros as $r)
          <div class="col-md-3 mb-3 text-center">
            <img src="{{ asset('storage/' . $r->imagen_path) }}" class="img-fluid rounded border" style="max-height: 160px;">
            <form method="POST" action="{{ route('perfil.rostros.eliminar', $r->id) }}" class="mt-2">
              @csrf @method('DELETE')
              <button class="btn btn-sm btn-outline-danger">Eliminar</button>
            </form>
          </div>
        @empty
          <p class="text-muted">Aún no has cargado fotos de tu rostro.</p>
        @endforelse
      </div>

    </div>
  </div>
</div>

{{-- ============ FACEAPI ============ --}}
<script src="https://cdn.jsdelivr.net/npm/face-api.js@0.22.2/dist/face-api.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', async () => {
  // Carga modelos FaceAPI
  await Promise.all([
    faceapi.nets.tinyFaceDetector.loadFromUri('/models'),
    faceapi.nets.faceLandmark68Net.loadFromUri('/models'),
    faceapi.nets.faceRecognitionNet.loadFromUri('/models')
  ]);
  console.log('✅ Modelos cargados');

  const input = document.getElementById('inputRostros');
  const previewBox = document.getElementById('previewBox');
  const btnSubir = document.getElementById('btnSubirFotos');
  const btnTomar = document.getElementById('btnTomarFoto');
  const cameraBox = document.getElementById('cameraBox');
  const video = document.getElementById('videoCam');
  const btnCapturar = document.getElementById('btnCapturar');
  const btnCerrarCam = document.getElementById('btnCerrarCam');

  let fotosTomadas = [];
  let stream;

  // Mostrar cámara
  btnTomar.addEventListener('click', async () => {
    cameraBox.style.display = 'block';
    stream = await navigator.mediaDevices.getUserMedia({ video: true });
    video.srcObject = stream;
  });

  // Capturar foto
  btnCapturar.addEventListener('click', () => {
    const canvas = document.createElement('canvas');
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    const ctx = canvas.getContext('2d');
    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
    canvas.toBlob(blob => {
      const file = new File([blob], `captura_${Date.now()}.jpg`, { type: 'image/jpeg' });
      fotosTomadas.push(file);
      mostrarPrevia(file);
    }, 'image/jpeg', 0.8);
  });

  // Cerrar cámara
  btnCerrarCam.addEventListener('click', () => {
    cameraBox.style.display = 'none';
    if (stream) {
      stream.getTracks().forEach(track => track.stop());
    }
  });

  // Mostrar vista previa de archivo
  function mostrarPrevia(file) {
    const url = URL.createObjectURL(file);
    const div = document.createElement('div');
    div.className = 'col-md-3 mb-3 text-center';
    div.innerHTML = `<img src="${url}" class="img-fluid rounded border" style="max-height:160px;">`;
    previewBox.appendChild(div);
  }

  // Al seleccionar fotos
  input.addEventListener('change', (e) => {
    previewBox.innerHTML = '';
    const files = Array.from(e.target.files);
    [...fotosTomadas, ...files].slice(0, 8).forEach(mostrarPrevia);
  });

  // Subir fotos + embeddings
  btnSubir.addEventListener('click', async () => {
    const files = [...fotosTomadas, ...(input.files ? Array.from(input.files) : [])];
    if (files.length === 0) {
      alert('Selecciona o toma al menos una foto.');
      return;
    }

    if (files.length > 8) {
      alert('Solo se permiten hasta 8 fotos.');
      return;
    }

    const data = new FormData();

    for (const file of files) {
      const img = await faceapi.bufferToImage(file);
      const det = await faceapi.detectSingleFace(img, new faceapi.TinyFaceDetectorOptions())
        .withFaceLandmarks()
        .withFaceDescriptor();

      if (!det) {
        alert(`No se detectó rostro en ${file.name}`);
        continue;
      }

      data.append('rostros[]', file);
      data.append('embeddings[]', JSON.stringify(Array.from(det.descriptor)));
    }

    await fetch('{{ route("perfil.rostros.subir") }}', {
      method: 'POST',
      headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
      body: data
    });

    alert('✅ Rostros guardados correctamente');
    window.location.reload();
  });
});
</script>
@endsection