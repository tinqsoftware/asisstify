@extends('layouts.event_app')

@section('title', 'Asistencia - ' . $actividad->titulo)

@section('content')
<style>
  .asistencia-stage {
    position: relative;
    width: 100%;
    min-height: calc(100vh - 120px);
    border-radius: 28px;
    overflow: hidden;
    box-shadow: 0 30px 80px rgba(0,0,0,.55);
  }

  .fondo-actividad {
    position: absolute;
    inset: 0;
    background-color: #0f172a;
    @if(!empty($actividad->imagen))
    background-image: url('{{ asset("storage/" . $actividad->imagen) }}');
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    @endif
    filter: brightness(0.55) saturate(1.1);
    z-index: 0;
  }

  .asistencia-overlay {
    position: absolute;
    inset: 0;
    background:
      radial-gradient(circle at 10% 10%, rgba(251,191,36,.18), transparent 55%),
      radial-gradient(circle at 90% 90%, rgba(59,130,246,.16), transparent 55%),
      rgba(2,6,23,.55);
    z-index: 1;
  }

  .movible {
    position: absolute;
    cursor: grab;
    z-index: 3;
    user-select: none;
    touch-action: none;
  }

  .movible.dragging {
    cursor: grabbing;
  }

  .widget-panel {
    background: rgba(15,23,42,.78);
    border-radius: 18px;
    border: 1px solid rgba(148,163,184,.4);
    box-shadow: 0 12px 30px rgba(0,0,0,.45);
    color: #f8fafc;
    padding: 12px 14px;
    backdrop-filter: blur(6px);
  }

  .resize-handle {
    position: absolute;
    width: 14px;
    height: 14px;
    right: 6px;
    bottom: 6px;
    border-radius: 4px;
    background: rgba(251,191,36,.9);
    box-shadow: 0 0 10px rgba(251,191,36,.45);
    cursor: se-resize;
  }

  .panel-titulo {
    color: #fef3c7;
    font-weight: 700;
    letter-spacing: .08em;
    text-transform: uppercase;
  }

  #camara {
    width: 320px;
    height: 320px;
    border-radius: 50%;
    overflow: hidden;
    border: 2px solid rgba(251,191,36,.7);
    background: rgba(15,23,42,.85);
  }

  #cameraMirror {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
  }

  .panel-doc {
    min-width: 320px;
  }

  .panel-doc .doc-row {
    display: flex;
    gap: 10px;
    margin-top: 8px;
  }

  .panel-doc select,
  .panel-doc input,
  .panel-doc button {
    background: rgba(2,6,23,.9);
    color: #f8fafc;
    border: 1px solid rgba(148,163,184,.5);
    border-radius: 10px;
    padding: 8px 10px;
    font-size: calc(0.9rem * var(--font-scale, 1));
  }

  .panel-doc select {
    width: 110px;
  }

  .panel-doc input {
    flex: 1;
  }

  .panel-doc button {
    margin-top: 10px;
    width: 100%;
    font-weight: 600;
    letter-spacing: .04em;
    background: linear-gradient(90deg, rgba(251,191,36,.95), rgba(59,130,246,.85));
    color: #0f172a;
    border: none;
  }

  .doc-estado {
    margin-top: 8px;
    font-size: 0.95rem;
    color: #fbbf24;
    min-height: 1.1rem;
  }

  .panel-qr {
    text-align: center;
  }

  .panel-qr img {
    width: 200px;
    height: 200px;
    object-fit: contain;
    border-radius: 14px;
    border: 1px solid rgba(148,163,184,.45);
    background: rgba(15,23,42,.9);
  }

  .panel-qr .qr-label {
    margin-top: 8px;
    font-size: 0.95rem;
    color: #e2e8f0;
  }

  .panel-lista {
    min-width: 220px;
    max-height: 320px;
    font-size: calc(0.9rem * var(--font-scale, 1));
  }

  .panel-lista h4 {
    font-size: 1rem;
    margin: 0 0 8px;
    color: #f8fafc;
  }

  .panel-lista ul {
    list-style: none;
    padding: 0;
    margin: 0;
    max-height: 230px;
    overflow-y: auto;
  }

  .panel-lista li {
    padding: 4px 0;
    font-size: 0.95rem;
    border-bottom: 1px solid rgba(148,163,184,.2);
  }

  .panel-bienvenida {
    text-align: center;
    min-width: 260px;
  }

  .panel-bienvenida .bienvenida-nombre {
    font-size: calc(1.1rem * var(--font-scale, 1));
    font-weight: 700;
    color: #facc15;
    text-shadow: 0 4px 18px rgba(251,191,36,.35);
  }

  .panel-bienvenida .bienvenida-grupo {
    margin-top: 6px;
    font-size: calc(0.95rem * var(--font-scale, 1));
    color: #e2e8f0;
  }

  .panel-bienvenida .bienvenida-grupo span {
    color: #38bdf8;
    font-weight: 600;
  }

  .panel-meta {
    min-width: 240px;
  }

  .panel-meta .meta-title {
    font-size: 1.05rem;
    font-weight: 700;
  }

  .panel-meta .meta-sub {
    font-size: 0.9rem;
    color: #cbd5f5;
  }

  @media (max-width: 768px) {
    .asistencia-stage {
      min-height: 75vh;
    }
  }
</style>

<div class="asistencia-stage" id="asistenciaStage">
  <div class="fondo-actividad"></div>
  <div class="asistencia-overlay"></div>

  <div id="panelMeta" class="movible widget-panel panel-meta" data-layout-key="meta" style="top: 24px; left: 24px;">
    <div class="panel-titulo">{{ $evento->titulo }}</div>
    <div class="meta-title">{{ $actividad->titulo }}</div>
    <div class="meta-sub">{{ $actividad->dia?->fecha }}</div>
    <div class="resize-handle"></div>
  </div>

  <div id="camara" class="movible" data-layout-key="camara" style="top: 110px; left: 100px;">
    <video id="cameraMirror" autoplay playsinline muted></video>
    <div class="resize-handle"></div>
  </div>

  <div id="panelDocumento" class="movible widget-panel panel-doc" data-layout-key="documento" style="top: 90px; right: 60px;">
    <div class="panel-titulo">Documento</div>
    <div class="doc-row">
      <select id="tipoDocumento">
        <option value="DNI" selected>DNI</option>
        <option value="CE">CE</option>
        <option value="PST">PST</option>
        <option value="RUC">RUC</option>
      </select>
      <input type="text" id="nroDocumento" placeholder="Número de documento">
    </div>
    <button type="button" id="btnRegistrarDoc">Marcar asistencia</button>
    <div id="docEstado" class="doc-estado"></div>
    <div class="resize-handle"></div>
  </div>

  <div id="panelQr" class="movible widget-panel panel-qr" data-layout-key="qr" style="top: 320px; right: 80px;">
    <img id="qrImage" alt="QR Asistencia">
    <div class="qr-label">Escanea para marcar asistencia</div>
    <div class="resize-handle"></div>
  </div>

  <div id="panelAsistentes" class="movible widget-panel panel-lista" data-layout-key="lista" style="bottom: 30px; left: 30px;">
    <h4>Asistentes (<span id="contadorAsistentes">0</span>)</h4>
    <ul id="listaAsistentes"></ul>
    <div class="resize-handle"></div>
  </div>

  <div id="panelBienvenida" class="movible widget-panel panel-bienvenida" data-layout-key="saludo" style="bottom: 30px; right: 30px;">
    <div id="bienvenidaNombre" class="bienvenida-nombre"></div>
    <div id="bienvenidaGrupo" class="bienvenida-grupo"></div>
    <div class="resize-handle"></div>
  </div>
</div>

@if($actividad->asistencia_rostro)
<script src="https://cdn.jsdelivr.net/npm/face-api.js@0.22.2/dist/face-api.min.js"></script>
@endif
<script>
document.addEventListener('DOMContentLoaded', async () => {
  const actividadNombre = @json($actividad->titulo);
  const actividadId = @json($actividad->id);
  const layoutUrl = @json(route('admin.actividades.layout', $actividad->id));
  const qrUrl = @json(route('asistencias.qr', $actividad->id));

  const config = {
    rostro: @json((bool) ($actividad->asistencia_rostro ?? true)),
    documento: @json((bool) ($actividad->asistencia_documento ?? false)),
    qr: @json((bool) ($actividad->asistencia_qr ?? false)),
    lista: @json((bool) ($actividad->mostrar_lista_asistencias ?? true)),
  };

  const savedLayout = @json($actividad->asistencia_layout ?? null);

  const widgets = {
    meta: document.getElementById('panelMeta'),
    camara: document.getElementById('camara'),
    documento: document.getElementById('panelDocumento'),
    qr: document.getElementById('panelQr'),
    lista: document.getElementById('panelAsistentes'),
    saludo: document.getElementById('panelBienvenida'),
  };

  const lista = document.getElementById('listaAsistentes');
  const contador = document.getElementById('contadorAsistentes');
  const bienvenidaNombre = document.getElementById('bienvenidaNombre');
  const bienvenidaGrupo = document.getElementById('bienvenidaGrupo');
  const docEstado = document.getElementById('docEstado');

  const qrImage = document.getElementById('qrImage');
  if (config.qr) {
    qrImage.src = `https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=${encodeURIComponent(qrUrl)}`;
  } else {
    qrImage.removeAttribute('src');
  }

  const defaultLayout = {
    meta: { x: 2, y: 4, w: 22, h: 12 },
    camara: { x: 4, y: 18, w: 26, h: 26 },
    documento: { x: 62, y: 12, w: 30, h: 18 },
    qr: { x: 70, y: 36, w: 18, h: 22 },
    lista: { x: 3, y: 62, w: 22, h: 30 },
    saludo: { x: 58, y: 70, w: 38, h: 18 },
  };

  function applyLayout(layout) {
    Object.keys(widgets).forEach(key => {
      const el = widgets[key];
      if (!el) return;
      const cfg = (layout && layout[key]) ? layout[key] : defaultLayout[key];
      if (!cfg) return;
      el.style.left = cfg.x + '%';
      el.style.top = cfg.y + '%';
      el.style.width = cfg.w + '%';
      el.style.height = cfg.h + '%';
      syncFontScale(el);
    });
  }

  function getLayout() {
    const layout = {};
    const w = window.innerWidth;
    const h = window.innerHeight;
    Object.entries(widgets).forEach(([key, el]) => {
      if (!el || el.style.display === 'none') return;
      const rect = el.getBoundingClientRect();
      layout[key] = {
        x: Math.max(0, Math.min(100, (rect.left / w) * 100)),
        y: Math.max(0, Math.min(100, (rect.top / h) * 100)),
        w: Math.max(5, Math.min(100, (rect.width / w) * 100)),
        h: Math.max(5, Math.min(100, (rect.height / h) * 100)),
      };
    });
    return layout;
  }

  let saveTimer = null;
  function scheduleSaveLayout() {
    if (saveTimer) window.clearTimeout(saveTimer);
    saveTimer = window.setTimeout(() => {
      const layout = getLayout();
      fetch(layoutUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': @json(csrf_token()),
        },
        body: JSON.stringify({ layout })
      }).catch(() => {});
    }, 350);
  }

  function syncFontScale(el) {
    const rect = el.getBoundingClientRect();
    const scale = Math.max(0.8, Math.min(2.6, rect.height / 140));
    el.style.setProperty('--font-scale', scale);
  }

  function clamp(value, min, max) {
    return Math.max(min, Math.min(max, value));
  }

  function enableDrag(el) {
    el.addEventListener('pointerdown', (e) => {
      if (e.target.closest('input, select, button, textarea')) return;
      if (e.target.classList.contains('resize-handle')) return;
      e.preventDefault();
      el.classList.add('dragging');
      const rect = el.getBoundingClientRect();
      const offsetX = e.clientX - rect.left;
      const offsetY = e.clientY - rect.top;

      function onMove(ev) {
        const left = clamp(ev.clientX - offsetX, 0, window.innerWidth - rect.width);
        const top = clamp(ev.clientY - offsetY, 0, window.innerHeight - rect.height);
        el.style.left = left + 'px';
        el.style.top = top + 'px';
      }

      function onUp() {
        el.classList.remove('dragging');
        document.removeEventListener('pointermove', onMove);
        document.removeEventListener('pointerup', onUp);
        scheduleSaveLayout();
      }

      document.addEventListener('pointermove', onMove);
      document.addEventListener('pointerup', onUp);
    });
  }

  function enableResize(el) {
    const handle = el.querySelector('.resize-handle');
    if (!handle) return;
    handle.addEventListener('pointerdown', (e) => {
      e.preventDefault();
      const rect = el.getBoundingClientRect();
      const startX = e.clientX;
      const startY = e.clientY;
      const startW = rect.width;
      const startH = rect.height;
      const isCircle = el.id === 'camara';

      function onMove(ev) {
        let newW = clamp(startW + (ev.clientX - startX), 140, window.innerWidth - rect.left - 10);
        let newH = clamp(startH + (ev.clientY - startY), 120, window.innerHeight - rect.top - 10);
        if (isCircle) {
          const size = Math.min(newW, newH);
          newW = size;
          newH = size;
        }
        el.style.width = newW + 'px';
        el.style.height = newH + 'px';
        syncFontScale(el);
      }

      function onUp() {
        document.removeEventListener('pointermove', onMove);
        document.removeEventListener('pointerup', onUp);
        scheduleSaveLayout();
      }

      document.addEventListener('pointermove', onMove);
      document.addEventListener('pointerup', onUp);
    });
  }

  Object.values(widgets).forEach((el) => {
    if (!el) return;
    enableDrag(el);
    enableResize(el);
  });

  applyLayout(savedLayout || defaultLayout);

  if (!config.rostro && widgets.camara) widgets.camara.style.display = 'none';
  if (!config.documento && widgets.documento) widgets.documento.style.display = 'none';
  if (!config.qr && widgets.qr) widgets.qr.style.display = 'none';
  if (!config.lista && widgets.lista) widgets.lista.style.display = 'none';

  const detectados = new Set();

  async function cargarAsistentes() {
    if (!config.lista) return;
    const res = await fetch(@json(route('api.asistencias', $actividad->id)));
    const data = await res.json();
    lista.innerHTML = data.map(n => `<li>${n.nombre || '—'}</li>`).join('');
    contador.textContent = data.length;
    data.forEach(n => { if (n.id) detectados.add(n.id); });
  }
  await cargarAsistentes();

  function firstName(nombre) {
    return String(nombre || '').trim().split(/\s+/)[0] || '';
  }

  function genderWordFor(sexo) {
    return (sexo && String(sexo).toUpperCase() === 'F') ? 'Bienvenida' : 'Bienvenido';
  }

  function buildGreeting(nombreCompleto, sexo, grupo) {
    const saludoBase = genderWordFor(sexo);
    const primerNombre = firstName(nombreCompleto);
    const grupoFinal = grupo || 'sin grupo';
    let texto = `${saludoBase} ${primerNombre} a ${actividadNombre}.`;
    texto += ` Tu grupo es ${grupoFinal}.`;
    return texto;
  }

  function mostrarBienvenida(nombreCompleto, sexo, grupo) {
    const primer = firstName(nombreCompleto);
    bienvenidaNombre.textContent = `${genderWordFor(sexo)} ${primer}`;
    const grupoFinal = grupo || 'Sin grupo';
    bienvenidaGrupo.innerHTML = `Tu grupo es: <span>${grupoFinal}</span>`;
  }

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

      this.profile = (this.styles[this.style]?.profile) || this.profile;
      return chosen;
    },

    setStyle(styleName) {
      if (!this.styles[styleName]) return;
      this.style = styleName;
      localStorage.setItem('assistify_voice_style', this.style);
      this.voice = this._pickVoice();
      this.ready = !!this.voice;
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

      this.setStyle(this.style);
    },

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

  async function registrarAsistencia(payload) {
    const res = await fetch(@json(route('api.marcarAsistencia')), {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': @json(csrf_token()),
      },
      body: JSON.stringify(payload)
    });
    return res.json();
  }

  if (config.documento) {
    const tipoDocumento = document.getElementById('tipoDocumento');
    const nroDocumento = document.getElementById('nroDocumento');
    const btnRegistrar = document.getElementById('btnRegistrarDoc');

    const submitDoc = async () => {
      const tipo = tipoDocumento.value;
      const nro = nroDocumento.value.trim();
      if (!nro) {
        docEstado.textContent = 'Ingresa un número de documento válido.';
        return;
      }
      docEstado.textContent = 'Registrando...';
      try {
        const resp = await registrarAsistencia({
          actividad_id: actividadId,
          tipo_documento: tipo,
          nro_documento: nro,
          metodo_entrada: 'documento'
        });

        if (resp.error) {
          docEstado.textContent = resp.error;
          return;
        }

        const usuario = resp.usuario || {};
        mostrarBienvenida(usuario.nombre, usuario.sexo, usuario.grupo);
        if (!resp.ya_existia) {
          const texto = buildGreeting(usuario.nombre, usuario.sexo, usuario.grupo);
          tts.speak(texto);
        }
        docEstado.textContent = resp.mensaje || 'Asistencia registrada.';
        nroDocumento.value = '';
        if (usuario.id && !detectados.has(usuario.id)) {
          detectados.add(usuario.id);
          if (config.lista) {
            lista.innerHTML += `<li>${usuario.nombre}</li>`;
            contador.textContent = detectados.size;
          }
        }
      } catch (err) {
        console.error(err);
        docEstado.textContent = 'Error al registrar. Intenta nuevamente.';
      }
    };

    btnRegistrar.addEventListener('click', submitDoc);
    nroDocumento.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        e.preventDefault();
        submitDoc();
      }
    });
  }

  if (!config.rostro) return;

  window.video = document.getElementById('cameraMirror');
  const MATCH_THRESHOLD = 0.62;
  const PERSON_COOLDOWN_MS = 10000;
  const lastSeenAt = new Map();

  await Promise.all([
    faceapi.nets.tinyFaceDetector.loadFromUri('/models'),
    faceapi.nets.faceLandmark68Net.loadFromUri('/models'),
    faceapi.nets.faceRecognitionNet.loadFromUri('/models')
  ]);

  const response = await fetch(@json(route('api.rostros', $evento->id)));
  const rostros = await response.json();
  const usuariosEmbeddings = rostros.map(usuario => ({
    usuario_id: usuario.usuario_id,
    nombre: usuario.nombre,
    sexo: usuario.sexo || null,
    embeddings: (usuario.embeddings || []).map(e => new Float32Array(e))
  }));

  const mapIdSexo = new Map();
  usuariosEmbeddings.forEach(u => mapIdSexo.set(u.usuario_id, u.sexo));

  let embeddingsPlana = [];
  usuariosEmbeddings.forEach(u => {
    u.embeddings.forEach(em => {
      embeddingsPlana.push({ usuario_id: u.usuario_id, nombre: u.nombre, sexo: u.sexo, embedding: em });
    });
  });

  let selectedDeviceId = null;
  async function seleccionarCamara() {
    const devices = await navigator.mediaDevices.enumerateDevices();
    const cameras = devices.filter(d => d.kind === 'videoinput');
    if (cameras.length === 0) {
      alert('No se detectaron cámaras.');
      return null;
    }
    if (cameras.length === 1) {
      selectedDeviceId = cameras[0].deviceId;
      return selectedDeviceId;
    }
    return new Promise((resolve) => {
      let modal = document.createElement('div');
      modal.id = 'modalSeleccionCamara';
      modal.style.position = 'fixed';
      modal.style.top = 0;
      modal.style.left = 0;
      modal.style.width = '100vw';
      modal.style.height = '100vh';
      modal.style.background = 'rgba(2,6,23,0.7)';
      modal.style.display = 'flex';
      modal.style.alignItems = 'center';
      modal.style.justifyContent = 'center';
      modal.style.zIndex = 2000;
      let content = document.createElement('div');
      content.style.background = '#0f172a';
      content.style.color = '#f8fafc';
      content.style.padding = '2rem 2.5rem';
      content.style.borderRadius = '12px';
      content.style.boxShadow = '0 4px 16px rgba(0,0,0,0.4)';
      content.style.textAlign = 'center';
      let titulo = document.createElement('h4');
      titulo.innerText = 'Selecciona una cámara';
      let select = document.createElement('select');
      select.style.margin = '1rem 0';
      select.style.fontSize = '1.05rem';
      select.style.padding = '0.4rem 1rem';
      select.style.borderRadius = '7px';
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
      btn.style.background = '#fbbf24';
      btn.style.color = '#0f172a';
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
      constraints.video.deviceId = { exact: deviceId };
    }

    stream = await navigator.mediaDevices.getUserMedia(constraints);
    window.video.srcObject = stream;
  } catch (err) {
    console.error("Error al iniciar cámara:", err.name, err.message);
    alert("Error al iniciar la cámara: " + err.message);
    return;
  }

  window.video.onplay = function () {
    setInterval(async () => {
      const detecciones = await faceapi
        .detectAllFaces(window.video, new faceapi.TinyFaceDetectorOptions())
        .withFaceLandmarks()
        .withFaceDescriptors();

      if (!detecciones.length) return;

      for (const d of detecciones) {
        let resultados = embeddingsPlana.map(obj => {
          let dist = 0;
          for (let i = 0; i < obj.embedding.length; i++) {
            const diff = d.descriptor[i] - obj.embedding[i];
            dist += diff * diff;
          }
          return { usuario_id: obj.usuario_id, nombre: obj.nombre, sexo: obj.sexo, distancia: Math.sqrt(dist) };
        });
        resultados.sort((a, b) => a.distancia - b.distancia);
        const best = resultados[0];

        const now = Date.now();
        const last = lastSeenAt.get(best.usuario_id) || 0;
        const cooled = (now - last) > PERSON_COOLDOWN_MS;

        if (best.distancia < MATCH_THRESHOLD && cooled && !detectados.has(best.usuario_id)) {
          detectados.add(best.usuario_id);
          lastSeenAt.set(best.usuario_id, now);

          const resp = await registrarAsistencia({
            actividad_id: actividadId,
            usuario_id: best.usuario_id,
            metodo_entrada: 'rostro'
          });

          if (resp.error) {
            console.warn(resp.error);
            return;
          }

          const usuario = resp.usuario || { nombre: best.nombre, sexo: best.sexo };
          mostrarBienvenida(usuario.nombre, usuario.sexo || best.sexo, usuario.grupo);
          if (!resp.ya_existia) {
            const texto = buildGreeting(usuario.nombre, usuario.sexo || best.sexo, usuario.grupo);
            tts.speak(texto);
          }

          if (config.lista) {
            lista.innerHTML += `<li>${usuario.nombre}</li>`;
            contador.textContent = detectados.size;
          }
        }
      }
    }, 2000);
  };
});
</script>
@endsection
