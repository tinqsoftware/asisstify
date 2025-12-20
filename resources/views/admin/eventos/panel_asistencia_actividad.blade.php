@extends('layouts.event_app')

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
  <video id="cameraMirror" autoplay playsinline muted></video>
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
  const actividadNombre = @json($actividad->titulo);

  const MATCH_THRESHOLD = 0.62;           // umbral de aceptación
  const PERSON_COOLDOWN_MS = 10000;       // 10s por persona para no repetir
  const lastSeenAt = new Map();           // nombre -> timestamp

  // Utilidades para frases
  function joinNames(names) {
    if (names.length === 1) return names[0];
    return names.slice(0, -1).join(', ') + ' y ' + names[names.length - 1];
  }
  function genderWordFor(sexo) {
    return (sexo && sexo.toUpperCase() === 'F') ? 'Bienvenida' : 'Bienvenido';
  }

  function pickEndingSingular(sexo) {
    const endsM = ['¡Qué gusto verte!', '¡Nos alegra tenerte aquí!'];
    const endsF = ['¡Qué gusto verte!', '¡Nos alegra tenerte aquí!'];
    const arr = (sexo && sexo.toUpperCase() === 'F') ? endsF : endsM;
    return arr[Math.floor(Math.random() * arr.length)];
  }
  function pickEndingPlural(allF, allM) {
    const endsNeutral = ['¡Qué gusto verlos!', '¡Nos alegra que estén aquí!'];
    const endsF = ['¡Qué gusto verlas!', '¡Nos alegra que estén aquí!'];
    const endsM = ['¡Qué gusto verlos!', '¡Nos alegra que estén aquí!'];
    const arr = allF ? endsF : allM ? endsM : endsNeutral;
    return arr[Math.floor(Math.random() * arr.length)];
  }
  function pluralWordFor(sexos) {
    const allF = sexos.length && sexos.every(s => (s || 'M').toUpperCase() === 'F');
    const allM = sexos.length && sexos.every(s => (s || 'M').toUpperCase() === 'M');
    return { word: allF ? 'Bienvenidas' : 'Bienvenidos', allF, allM };
  }
  function buildGreetingSingle(nombre, sexo, actividadNombre) {
    const saludoBase = genderWordFor(sexo);
    // Ej.: "Buenos días, Bienvenida Ana a Encuentro AWAKE. ¡Qué gusto verte!"
    return ` ${saludoBase} ${nombre} a ${actividadNombre}.`;
  }
  function buildGreetingGroup(nuevos, actividadNombre) {
    const nombres = nuevos.map(n => n.nombre);
    const sexos = nuevos.map(n => n.sexo);
    const { word, allF, allM } = pluralWordFor(sexos);
    // Ej.: "Buenas tardes, Bienvenidas Ana y Sofía a Encuentro AWAKE. ¡Qué gusto verlas!"
    return ` ${word} ${joinNames(nombres)} a ${actividadNombre}. ${pickEndingPlural(allF, allM)}`;
  }

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

  // 🔊 Text-to-Speech (anuncio de bienvenida) con estilos y persistencia
  const tts = {
    ready: false,
    voice: null,
    style: localStorage.getItem('assistify_voice_style') || 'natural',
    profile: { rate: 0.92, pitch: 1.08, volume: 0.98, gapMs: 140 },

    styles: {
      natural: {
        preferVoices: [/Google Español/i, /Paulina/i, /Monica/i, /Mónica/i, /Luciana/i, /Camila/i],
        profile: { rate: 0.92, pitch: 1.08, volume: 0.98, gapMs: 140 }
      },
      dota: {
        // estilo narrador eSports: un poco más grave, algo más rápido y con más proyección
        preferVoices: [/Jorge/i, /Enrique/i, /Diego/i, /Google Español/i, /Alvaro/i],
        profile: { rate: 1.03, pitch: 0.92, volume: 1.0, gapMs: 110 }
      },
      serena: {
        preferVoices: [/Monica/i, /Mónica/i, /Luciana/i, /Google Español/i],
        profile: { rate: 0.88, pitch: 1.0, volume: 0.95, gapMs: 160 }
      },
      energica: {
        preferVoices: [/Camila/i, /Google Español/i, /Jorge/i],
        profile: { rate: 1.08, pitch: 1.12, volume: 1.0, gapMs: 120 }
      }
    },

    _pickVoice() {
      const preferOrder = (this.styles[this.style]?.preferVoices) || [];
      const voices = window.speechSynthesis.getVoices() || [];
      let chosen = null;

      for (const pref of preferOrder) {
        const v = voices.find(v => pref.test(v.name));
        if (v) { chosen = v; break; }
      }
      if (!chosen) {
        chosen = voices.find(v => (v.lang || '').toLowerCase().startsWith('es')) || voices[0] || null;
      }

      // perfilar según estilo
      this.profile = (this.styles[this.style]?.profile) || this.profile;
      return chosen;
    },

    setStyle(styleName) {
      if (!this.styles[styleName]) return;
      this.style = styleName;
      localStorage.setItem('assistify_voice_style', this.style);
      this.voice = this._pickVoice();
      this.ready = !!this.voice;
      console.log('🔊 Estilo de voz:', this.style, '→ voz:', this.voice ? this.voice.name : '(por defecto)');
    },

    init() {
      const pick = () => {
        this.voice = this._pickVoice();
        this.ready = !!this.voice;
      };
      pick();
      if (!this.ready) {
        window.speechSynthesis.onvoiceschanged = () => {
          pick();
        };
      }

      // Desbloqueo por primer gesto del usuario (iOS/Safari/Chrome políticas de audio)
      const unlock = () => {
        try {
          const u = new SpeechSynthesisUtterance(' ');
          if (this.voice) u.voice = this.voice;
          u.volume = 0;
          window.speechSynthesis.speak(u);
        } catch {}
        document.removeEventListener('click', unlock, { passive: true });
        document.removeEventListener('touchstart', unlock, { passive: true });
      };
      document.addEventListener('click', unlock, { passive: true });
      document.addEventListener('touchstart', unlock, { passive: true });

      // Aplicar estilo guardado al iniciar
      this.setStyle(this.style);
    },

    // Divide en frases y aplica pequeñas variaciones para que suene más natural
    speak(text) {
      if (!text) return;
      try {
        window.speechSynthesis.cancel();

        const chunks = String(text)
          .replace(/\s+/g, ' ')
          .split(/([.!?…]+)\s*/g)
          .reduce((acc, part, i, arr) => {
            if (!part) return acc;
            if (/[.!?…]+/.test(part) && acc.length) {
              acc[acc.length - 1] += part;
            } else if (!/[.!?…]+/.test(arr[i + 1] || '')) {
              acc.push(part);
            } else {
              acc.push(part);
            }
            return acc;
          }, [])
          .map(s => s.trim())
          .filter(Boolean);

        let delay = 0;
        const { rate, pitch, volume, gapMs } = this.profile;

        chunks.forEach((phrase) => {
          const u = new SpeechSynthesisUtterance(phrase);
          if (this.voice) u.voice = this.voice;
          u.lang   = (this.voice && this.voice.lang) || 'es-ES';
          // Micro-variaciones según estilo
          const delta = (this.style === 'dota') ? 0.04 : 0.06;
          u.rate   = Math.max(0.75, Math.min(1.25, rate + (Math.random() * delta - delta/2)));
          u.pitch  = Math.max(0.6,  Math.min(1.35, pitch + (Math.random() * delta - delta/2)));
          u.volume = volume;

          setTimeout(() => window.speechSynthesis.speak(u), delay);
          delay += gapMs + Math.min(280, Math.max(80, phrase.length * 2));
        });
      } catch (e) {
        console.warn('TTS error:', e);
      }
    }
  };
  tts.init();


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
  // Convertimos a una lista de {nombre, sexo, embeddings}
  const usuariosEmbeddings = rostros.map(usuario => ({
    nombre: usuario.nombre,
    sexo: usuario.sexo || usuario.genero || null, // soporta campos alternos si existen
    embeddings: (usuario.embeddings || []).map(e => new Float32Array(e))
  }));

  // Mapa nombre -> sexo
  const mapNombreSexo = new Map();
  usuariosEmbeddings.forEach(u => mapNombreSexo.set(u.nombre, u.sexo));

  // Lista plana para buscar mejor match
  let embeddingsPlana = [];
  usuariosEmbeddings.forEach(u => {
    u.embeddings.forEach(em => {
      embeddingsPlana.push({ nombre: u.nombre, sexo: u.sexo, embedding: em });
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
    let constraints = {
      video: {
        width: { ideal: 1280 },
        height: { ideal: 720 }
      }
    };
    if (deviceId && navigator.userAgent.indexOf("Safari") === -1) {
      // Solo Chrome/Firefox aceptan deviceId exacto
      constraints.video.deviceId = { exact: deviceId };
    }

    try {
      stream = await navigator.mediaDevices.getUserMedia(constraints);
      window.video.srcObject = stream;
    } catch (err) {
      console.error("🚫 Error al iniciar cámara:", err.name, err.message);
      alert("Error al iniciar la cámara: " + err.message);
      return;
    }
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
      // Detección directa sobre el elemento de video
      const detecciones = await faceapi
        .detectAllFaces(window.video, new faceapi.TinyFaceDetectorOptions())
        .withFaceLandmarks()
        .withFaceDescriptors();

      if (!detecciones.length) return;

      const nuevos = []; // nombres recién validados en este frame

      for (const d of detecciones) {
        // calcula distancias contra todos los embeddings
        let resultados = embeddingsPlana.map(obj => {
          let dist = 0;
          for (let i = 0; i < obj.embedding.length; i++) {
            const diff = d.descriptor[i] - obj.embedding[i];
            dist += diff * diff;
          }
          return { nombre: obj.nombre, sexo: obj.sexo, distancia: Math.sqrt(dist) };
        });
        resultados.sort((a, b) => a.distancia - b.distancia);
        const best = resultados[0];

        console.log('Best match:', best.nombre, 'dist:', best.distancia.toFixed(3), 'threshold:', MATCH_THRESHOLD);

        // umbral + cooldown por persona
        const now = Date.now();
        const last = lastSeenAt.get(best.nombre) || 0;
        const cooled = (now - last) > PERSON_COOLDOWN_MS;

        if (best.distancia < MATCH_THRESHOLD && cooled && !detectados.has(best.nombre)) {
          detectados.add(best.nombre);
          lastSeenAt.set(best.nombre, now);
          nuevos.push({ nombre: best.nombre, sexo: mapNombreSexo.get(best.nombre) || best.sexo || 'M' });

          // UI: lista y contador
          lista.innerHTML += `<li>${best.nombre}</li>`;
          contador.textContent = detectados.size;

          // Registro en backend (sin bloquear el bucle)
          fetch('{{ route("api.marcarAsistencia") }}', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
              actividad_id: {{ $actividad->id }},
              nombre: best.nombre
            })
          })
          .then(r => r.json())
          .then(d => console.log('🧾 Asistencia:', d))
          .catch(err => console.error('❌ Error al registrar:', err));
        }
      }

      // Anuncio por voz:
      if (nuevos.length === 1) {
        const p = nuevos[0];
        const saludo = buildGreetingSingle(p.nombre, p.sexo, actividadNombre);
        mensaje.textContent = saludo;
        tts.speak(saludo);
      } else if (nuevos.length > 1) {
        const saludo = buildGreetingGroup(nuevos, actividadNombre);
        mensaje.textContent = saludo;
        tts.speak(saludo);
      }
    }, 2000);
  };
});
</script>
@endsection