@extends('layouts.backoffice')

@section('title', 'Asistencia - ' . $actividad->titulo)

@section('content')

<style>
  .fondo-actividad {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url('{{ asset("storage/" . $actividad->imagen) }}') no-repeat center center fixed;
    background-size: cover;
    z-index: 0;
  }

  .movible {
    position: absolute;
    cursor: move;
    z-index: 10;
    user-select: none;
  }

  .panel-blanco {
    background: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
    padding: 10px 15px;
    text-align: center;
    backdrop-filter: blur(4px);
  }

  #cameraMirror {
    width: 800px;
    height: 800px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid white;
  }
</style>

{{-- ✅ Fondo de la actividad --}}
<div class="fondo-actividad"></div>

{{-- ✅ Contenido interactivo --}}
<div id="camara" class="movible" style="top: 100px; left: 100px;">
  <video id="cameraMirror" autoplay playsinline></video>
</div>

<div id="panelDatos" class="movible panel-blanco" style="top: 50px; right: 50px;">
  <h3 class="fw-bold text-primary">{{ $actividad->titulo }}</h3>
</div>

<div id="panelAsistentes" class="movible panel-blanco" style="bottom: 30px; left: 30px; width: 250px; max-height: 300px; overflow-y: auto;">
  <h4>Asistentes (<span id="contadorAsistentes">0</span>)</h4>
  <ul id="listaAsistentes" class="list-unstyled m-0"></ul>
</div>

<div id="panelBienvenida" class="movible panel-blanco" style="bottom: 30px; right: 30px;">
  <h4 id="mensajeBienvenida" class="text-success"></h4>
</div>

<script src="https://cdn.jsdelivr.net/npm/face-api.js@0.22.2/dist/face-api.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', async () => {
  const video = document.getElementById('cameraMirror');
  const mensaje = document.getElementById('mensajeBienvenida');
  const lista = document.getElementById('listaAsistentes');
  const contador = document.getElementById('contadorAsistentes');
  let detectados = new Set();
  let asistenciasActuales = [];

  // 🧲 Hacer movibles los paneles
  document.querySelectorAll('.movible').forEach(el => {
    el.onmousedown = e => {
      let shiftX = e.clientX - el.getBoundingClientRect().left;
      let shiftY = e.clientY - el.getBoundingClientRect().top;
      el.style.zIndex = 1000;
      function mover(ev) {
        el.style.left = ev.pageX - shiftX + 'px';
        el.style.top = ev.pageY - shiftY + 'px';
      }
      document.addEventListener('mousemove', mover);
      document.onmouseup = () => {
        document.removeEventListener('mousemove', mover);
        el.onmouseup = null;
      };
    };
    el.ondragstart = () => false;
  });

  // 🧠 Cargar modelos FaceAPI
  await Promise.all([
    faceapi.nets.tinyFaceDetector.loadFromUri('/models'),
    faceapi.nets.faceLandmark68Net.loadFromUri('/models'),
    faceapi.nets.faceRecognitionNet.loadFromUri('/models')
  ]);
  console.log('✅ Modelos cargados');

  // 🚀 Cargar rostros
  const response = await fetch('{{ route("api.rostros", $evento->id) }}');
  const rostros = await response.json();
  // Convertimos a una lista de {nombre, embeddings}
  const usuariosEmbeddings = rostros.map(usuario => ({
    nombre: usuario.nombre,
    embeddings: usuario.embeddings.map(e => new Float32Array(e))
  }));
  // Creamos una lista plana de {nombre, embedding}
  let embeddingsPlana = [];
  usuariosEmbeddings.forEach(u => {
    u.embeddings.forEach(em => {
      embeddingsPlana.push({nombre: u.nombre, embedding: em});
    });
  });

  // 📸 Iniciar cámara
  const stream = await navigator.mediaDevices.getUserMedia({ video: true });
  video.srcObject = stream;

  // 🔄 Mostrar asistentes ya registrados
  async function cargarAsistentes() {
    const res = await fetch('{{ route("api.asistencias", $actividad->id) }}');
    const data = await res.json();
    lista.innerHTML = data.map(n => `<li>${n}</li>`).join('');
    contador.textContent = data.length;
    data.forEach(n => detectados.add(n));
    asistenciasActuales = data;
  }
  await cargarAsistentes();

  // 🕵️‍♂️ Detección en bucle (cada 2 segundos)
  video.addEventListener('play', async () => {
    setInterval(async () => {
      const detecciones = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions())
        .withFaceLandmarks().withFaceDescriptors();

      if (!detecciones.length) return;

      // Solo tomamos el primer rostro detectado (puedes recorrer todos si quieres)
      for (const d of detecciones) {
        // Calcula la distancia euclidiana manualmente para todos los embeddings
        let resultados = embeddingsPlana.map(obj => {
          let dist = 0;
          for (let i = 0; i < obj.embedding.length; i++) {
            let diff = d.descriptor[i] - obj.embedding[i];
            dist += diff * diff;
          }
          return {nombre: obj.nombre, distancia: Math.sqrt(dist)};
        });
        // Ordena por menor distancia
        resultados.sort((a, b) => a.distancia - b.distancia);
        // Top 3
        let top3 = resultados.slice(0, 3);
        // Mostrar en consola
        console.log('Top 3:', top3);

        // Si la mejor es suficientemente cercana y no detectado aún
        if (top3[0].distancia < 0.45 && !detectados.has(top3[0].nombre)) {
          detectados.add(top3[0].nombre);
          mensaje.textContent = `Bienvenido ${top3[0].nombre}`;
          lista.innerHTML += `<li>${top3[0].nombre}</li>`;
          contador.textContent = detectados.size;

          await fetch('{{ route("api.marcarAsistencia") }}', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
              actividad_id: {{ $actividad->id }},
              nombre: top3[0].nombre
            })
          }).then(r => r.json())
            .then(d => console.log('🧾 Asistencia:', d))
            .catch(err => console.error('❌ Error al registrar:', err));
        }
        // Puedes mostrar el top3 visualmente si lo deseas
        break; // Solo procesamos el primer rostro por frame
      }
    }, 2000);
  });
});
</script>
@endsection