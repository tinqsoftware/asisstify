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
  // Hacer el video globalmente accesible
  window.video = document.getElementById('cameraMirror');
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

  // 📸 Selección de cámara (popup si hay 2+)
  let selectedDeviceId = null;
  async function seleccionarCamara() {
    // Listar dispositivos
    const devices = await navigator.mediaDevices.enumerateDevices();
    const cameras = devices.filter(d => d.kind === 'videoinput');
    if (cameras.length === 0) {
      alert('No se detectaron cámaras.');
      return null;
    }
    if (cameras.length === 1) {
      // Solo una cámara, usar directamente
      selectedDeviceId = cameras[0].deviceId;
      return selectedDeviceId;
    }
    // 2 o más cámaras: mostrar popup
    return new Promise((resolve) => {
      // Modal básico
      let modal = document.createElement('div');
      modal.id = 'modalSeleccionCamara';
      modal.style.position = 'fixed';
      modal.style.top = 0;
      modal.style.left = 0;
      modal.style.width = '100vw';
      modal.style.height = '100vh';
      modal.style.background = 'rgba(0,0,0,0.5)';
      modal.style.display = 'flex';
      modal.style.alignItems = 'center';
      modal.style.justifyContent = 'center';
      modal.style.zIndex = 2000;
      // Modal content
      let content = document.createElement('div');
      content.style.background = '#fff';
      content.style.padding = '2rem 2.5rem';
      content.style.borderRadius = '12px';
      content.style.boxShadow = '0 4px 16px rgba(0,0,0,0.18)';
      content.style.textAlign = 'center';
      let titulo = document.createElement('h4');
      titulo.innerText = 'Selecciona una cámara';
      let select = document.createElement('select');
      select.style.margin = '1rem 0';
      select.style.fontSize = '1.1rem';
      select.style.padding = '0.4rem 1rem';
      select.style.borderRadius = '7px';
      // Opciones
      cameras.forEach((cam, i) => {
        let opt = document.createElement('option');
        opt.value = cam.deviceId;
        opt.innerText = cam.label || `Cámara ${i+1}`;
        select.appendChild(opt);
      });
      let btn = document.createElement('button');
      btn.innerText = 'Usar cámara';
      btn.style.marginTop = '1.2rem';
      btn.style.padding = '0.5rem 1.5rem';
      btn.style.background = '#d92332';
      btn.style.color = '#fff';
      btn.style.border = 'none';
      btn.style.borderRadius = '8px';
      btn.style.fontWeight = '600';
      btn.style.fontSize = '1rem';
      btn.style.cursor = 'pointer';
      btn.onclick = function() {
        selectedDeviceId = select.value;
        document.body.removeChild(modal);
        resolve(selectedDeviceId);
      };
      content.appendChild(titulo);
      content.appendChild(select);
      content.appendChild(document.createElement('br'));
      content.appendChild(btn);
      modal.appendChild(content);
      document.body.appendChild(modal);
    });
  }

  // Esperar selección de cámara y abrir stream
  const deviceId = await seleccionarCamara();
  if (!deviceId) return;
  let stream = null;
  try {
    stream = await navigator.mediaDevices.getUserMedia({
      video: {
        deviceId: { exact: deviceId },
        width: { ideal: 1280 },
        height: { ideal: 720 }
      }
    });
    window.video.srcObject = stream;
  } catch (err) {
    console.error("🚫 Error al iniciar cámara:", err.name, err.message);
    alert("Error al iniciar la cámara: " + err.message);
    return;
  }
  // Mostrar información de resolución y cámara después de cargar metadata
  window.video.onloadedmetadata = async function() {
    const track = stream.getVideoTracks()[0];
    console.log("📸 Cámara activa:", track.label);

    // Esperar a que el video realmente tenga frames renderizados
    await new Promise(resolve => {
      const checkReady = setInterval(() => {
        if (window.video.videoWidth > 0 && window.video.videoHeight > 0) {
          clearInterval(checkReady);
          resolve();
        }
      }, 100);
    });

    console.log("✅ Resolución real confirmada:", window.video.videoWidth, "x", window.video.videoHeight);
  };
  console.log("Resolución real:", window.video.videoWidth, "x", window.video.videoHeight);

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

  // 🕵️‍♂️ Detección en bucle (cada 2 segundos) - iniciar solo cuando el video esté reproduciéndose
  window.video.onplay = function () {
    setInterval(async () => {
      const detecciones = await faceapi.detectAllFaces(window.video, new faceapi.TinyFaceDetectorOptions())
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
  };
});
</script>
@endsection