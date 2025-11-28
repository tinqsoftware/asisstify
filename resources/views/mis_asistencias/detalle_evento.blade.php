@extends('layouts.event_app')

@section('title', 'Detalle del evento')

@section('content')
<style>
  :root {
    --bg-main: #050816;
    --bg-gradient: radial-gradient(circle at top, #1f2937 0, #050816 55%, #02010a 100%);
    --card-bg: rgba(15, 23, 42, 0.96);
    --card-border: rgba(148, 163, 184, 0.35);
    --accent: #fbbf24;
    --accent-soft: rgba(251, 191, 36, 0.15);
    --accent-strong: #f59e0b;
    --text-main: #e5e7eb;
    --text-muted: #9ca3af;
    --error: #ef4444;
    --success: #22c55e;
  }

  body {
    background: var(--bg-gradient);
    min-height: 100vh;
  }

  .evento-shell {
    min-height: 100vh;
    align-items: stretch;
    justify-content: center;
    padding: 24px 12px;
  }

  .evento-card {
    position: relative;
    background: var(--card-bg);
    border-radius: 28px;
    border: 1px solid var(--card-border);
    box-shadow:
      0 20px 45px rgba(0, 0, 0, 0.65),
      0 0 0 1px rgba(15, 23, 42, 0.7);
    width: 100%;
    max-width: 900px;
    padding: 22px 20px 26px;
    display: flex;
    flex-direction: column;
    gap: 18px;
    color: var(--text-main);
    overflow: hidden;
  }


  /* Detalle decorativo tipo gala */
  .evento-card::before {
    content: '';
    position: absolute;
    inset: -120px auto auto -120px;
    width: 240px;
    height: 240px;
    background: radial-gradient(circle, var(--accent-soft), transparent 70%);
    opacity: .8;
    pointer-events: none;
  }
  .evento-card::after {
    content: '';
    position: absolute;
    inset: auto -100px -120px auto;
    width: 220px;
    height: 220px;
    background: radial-gradient(circle, rgba(56, 189, 248, .18), transparent 70%);
    opacity: .7;
    pointer-events: none;
  }

  .evento-header {
    position: relative;
    z-index: 1;
  }

  .evento-chip-top {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    font-size: .68rem;
    text-transform: uppercase;
    letter-spacing: .22em;
    padding: 4px 12px 4px 6px;
    border-radius: 999px;
    border: 1px solid rgba(249, 250, 251, 0.08);
    background: linear-gradient(120deg, rgba(15,23,42,.95), rgba(17,24,39,.9));
    color: var(--text-muted);
    margin-bottom: 6px;
  }

  .evento-chip-dot {
    width: 10px;
    height: 10px;
    border-radius: 999px;
    background: var(--accent);
    box-shadow: 0 0 0 4px var(--accent-soft);
  }

  .evento-header small {
    text-transform: uppercase;
    letter-spacing: .16em;
    font-weight: 700;
    font-size: .75rem;
    color: var(--accent);
    display: block;
  }

  .evento-header h1 {
    font-size: 1.9rem;
    font-weight: 800;
    margin: 4px 0 0;
  }

  .evento-header h2 {
    font-size: .85rem;
    text-transform: uppercase;
    letter-spacing: .18em;
    margin-top: 8px;
    color: var(--text-muted);
  }

  .evento-sub {
    font-size: .86rem;
    color: var(--text-muted);
    margin-top: 6px;
  }

  .tag-mesa {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 4px 12px;
    border-radius: 999px;
    background: rgba(15, 23, 42, 0.9);
    border: 1px solid rgba(248, 250, 252, 0.18);
    color: #fefce8;
    font-size: .7rem;
    text-transform: uppercase;
    letter-spacing: .14em;
    margin-top: 6px;
    gap: 6px;
  }
  .tag-mesa span.badge-dot {
    width: 5px;
    height: 5px;
    border-radius: 999px;
    background: var(--accent);
  }

  /* CONTENIDO PRINCIPAL */
  .evento-main {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .section-title-small {
    font-size: .8rem;
    text-transform: uppercase;
    letter-spacing: .18em;
    color: var(--text-muted);
  }

  /* BOTONES DE ENCUESTAS */
  .btn-accion {
    display: flex;
    width: 100%;
    align-items: center;
    justify-content: space-between;
    border-radius: 999px;
    padding: 12px 16px;
    border: 1px solid rgba(148, 163, 184, 0.24);
    background: radial-gradient(circle at top left, rgba(15,23,42,.95), rgba(15,23,42,.9));
    color: var(--text-main);
    font-weight: 600;
    letter-spacing: .04em;
    text-transform: uppercase;
    font-size: .78rem;
    margin-bottom: 10px;
    position: relative;
    overflow: hidden;
    transition: all .22s ease-out;
  }

  .btn-accion::after {
    content: '';
    position: absolute;
    inset: 0 auto 0 0;
    width: 40%;
    background: linear-gradient(120deg, rgba(251,191,36,.10), transparent);
    opacity: 0;
    transition: opacity .2s;
  }

  .btn-accion:hover:not(.disabled) {
    border-color: rgba(251, 191, 36, 0.45);
    box-shadow: 0 0 0 1px rgba(251, 191, 36, .18);
    transform: translateY(-1px);
  }
  .btn-accion:hover:not(.disabled)::after {
    opacity: 1;
  }

  .btn-accion.disabled {
    opacity: .45;
    cursor: not-allowed;
    border-style: dashed;
  }

  .btn-accion span.main-label {
    display: block;
  }

  .btn-accion span.small {
    font-weight: 400;
    font-size: .67rem;
    letter-spacing: .12em;
    text-transform: uppercase;
    display: block;
    color: var(--text-muted);
  }

  .btn-pill-status {
    font-size: .68rem;
    padding: 4px 10px;
    border-radius: 999px;
    border: 1px solid rgba(148, 163, 184, 0.3);
    text-transform: uppercase;
    letter-spacing: .14em;
  }
  .btn-pill-status--activa {
    border-color: rgba(34, 197, 94, .5);
    color: #bbf7d0;
  }
  .btn-pill-status--cerrada {
    border-color: rgba(239, 68, 68, .5);
    color: #fecaca;
  }
  .btn-pill-status--proximamente {
    border-color: rgba(147, 197, 253, .45);
    color: #dbeafe;
  }

  /* PANEL ENCUESTA */
  .encuesta-panel {
    margin-top: 4px;
    border-radius: 22px;
    background: linear-gradient(145deg, rgba(15,23,42,.98), rgba(17,24,39, .96));
    padding: 16px 14px 18px;
    border: 1px solid rgba(148, 163, 184, 0.35);
    position: relative;
    overflow: hidden;
  }
  .encuesta-panel::before {
    content:'';
    position:absolute;
    inset:-80px auto auto -80px;
    width:160px;
    height:160px;
    background: radial-gradient(circle, var(--accent-soft), transparent 70%);
    opacity:.9;
    pointer-events:none;
  }

  .encuesta-panel-title {
    font-weight: 700;
    font-size: 1rem;
    margin-bottom: 4px;
    text-transform: uppercase;
    letter-spacing: .14em;
  }

  .texto-estado {
    font-size: .74rem;
    color: var(--text-muted);
    margin-top: 3px;
    margin-bottom: 8px;
  }

  .encuesta-opciones {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .opcion-btn {
    border-radius: 16px;
    background: #020617;
    color: #f9fafb;
    padding: 9px 10px;
    display: flex;
    align-items: center;
    gap: 10px;
    border: 1px solid rgba(148, 163, 184, 0.4);
    transition: all .2s ease-out;
    position: relative;
    overflow: hidden;
  }
  .opcion-btn::after {
    content:'';
    position:absolute;
    inset:0 auto 0 0;
    width:30%;
    background:linear-gradient(120deg,rgba(148,163,184,.2),transparent);
    opacity:0;
    transition:opacity .2s;
  }

  .opcion-btn:hover:not(:disabled) {
    border-color: rgba(251, 191, 36, .55);
    transform: translateY(-1px);
  }
  .opcion-btn:hover:not(:disabled)::after {
    opacity:1;
  }

  .opcion-btn.selected {
    border-color: rgba(251, 191, 36, 1);
    box-shadow: 0 0 0 1px rgba(251,191,36,.5);
  }

  .opcion-img {
    width: 38px;
    height: 38px;
    border-radius: 12px;
    object-fit: cover;
    background: #1f2937;
    flex-shrink: 0;
  }
  .opcion-name {
    font-size: .95rem;
    font-weight: 600;
  }
  .opcion-sub {
    font-size: .75rem;
    opacity: .8;
  }

  .btn-confirmar {
    width: 100%;
    border-radius: 999px;
    border: none;
    padding: 11px 16px;
    margin-top: 14px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: .14em;
    background: linear-gradient(135deg, var(--accent), var(--accent-strong));
    color: #111827;
    box-shadow: 0 10px 25px rgba(251,191,36,.35);
    transition: all .2s ease-out;
    font-size: .78rem;
  }
  .btn-confirmar:disabled {
    opacity: .35;
    box-shadow: none;
    cursor: not-allowed;
  }
  .btn-confirmar:not(:disabled):hover {
    transform: translateY(-1px);
    box-shadow: 0 14px 30px rgba(251,191,36,.46);
  }

  .toast-min {
    position: fixed;
    bottom: 16px;
    left: 50%;
    transform: translateX(-50%);
    max-width: 90%;
    background: rgba(15,23,42,.96);
    color: #f9fafb;
    border-radius: 999px;
    padding: 10px 18px;
    font-size: .8rem;
    display: none;
    z-index: 9999;
    border: 1px solid rgba(148,163,184,.4);
    backdrop-filter: blur(12px);
  }

  /* RESPONSIVE */
  @media (min-width: 768px) {
    .evento-shell {
      padding: 40px 16px;
    }
    .evento-card {
      max-width: 520px;
      padding: 26px 24px 30px;
      border-radius: 32px;
    }
    .evento-header h1 {
      font-size: 2.1rem;
    }
    .evento-sub {
      font-size: .9rem;
    }
  }

  @media (min-width: 1024px) {
    .evento-shell {
      padding: 52px 24px;
    }
    .evento-card {
      max-width: 870px;
      flex-direction: row;
      gap: 26px;
    }
    .evento-header {
      width: 48%;
      border-right: 1px solid rgba(148,163,184,.25);
      padding-right: 18px;
    }
    .evento-main {
      width: 52%;
    }
  }
</style>

<div class="evento-shell">
  <div class="evento-card">
    <div class="evento-header">
      <div class="evento-chip-top">
        <span class="evento-chip-dot"></span>
        <span>Evento asistify</span>
      </div>
      <small>{{ strtoupper($evento->titulo) }}</small>
      <h1>Hola {{ strtoupper($user->name) }}</h1>

      @if(!empty($mesa ?? null))
        <div class="tag-mesa">
          <span class="badge-dot"></span>
          <span>Tu mesa es la {{ $mesa }}</span>
        </div>
      @endif

      <h2 class="mt-2">Tu evento interactivo</h2>
      <p class="evento-sub mb-0">
        Desde aquí podrás participar en votaciones, rankings y dinámicas en vivo
        que el equipo de animación vaya activando durante la gala.
      </p>
    </div>

    <div class="evento-main">
      <div>
        <div class="section-title-small mb-2">Dinámicas disponibles</div>
        <div id="encuestasListSection">
          {{-- Aquí se inyectan dinámicamente los botones de encuestas --}}
        </div>
      </div>

      <div id="encuestaPanel" class="encuesta-panel" style="display:none;">
        <div class="encuesta-panel-title" id="encuestaPanelTitle"></div>
        <p class="texto-estado" id="encuestaPanelEstado"></p>
        <div class="encuesta-opciones" id="encuestaOpciones"></div>
        <button id="btnConfirmarRespuesta" class="btn-confirmar" disabled>
          Confirmar respuesta
        </button>
      </div>
    </div>
  </div>
</div>

<div id="toastMin" class="toast-min"></div>

<script>
  const EVENTO_ID = {{ $evento->id }};
  const URL_ENCUESTAS_EVENTO = @json(route('api.encuestas.evento', $evento->id));
  const URL_VOTAR = (id) => `/api/encuestas/${id}/votar`;
  const CSRF_TOKEN = @json(csrf_token());

  let ENCUESTAS = [];
  let encuestaActual = null;
  let opcionSeleccionada = null;

  const encuestasListSection = document.getElementById('encuestasListSection');
  const encuestaPanel = document.getElementById('encuestaPanel');
  const encuestaPanelTitle = document.getElementById('encuestaPanelTitle');
  const encuestaPanelEstado = document.getElementById('encuestaPanelEstado');
  const encuestaOpciones = document.getElementById('encuestaOpciones');
  const btnConfirmarRespuesta = document.getElementById('btnConfirmarRespuesta');
  const toastMin = document.getElementById('toastMin');

  function showToast(msg) {
    toastMin.innerText = msg;
    toastMin.style.display = 'block';
    setTimeout(() => {
      toastMin.style.display = 'none';
    }, 2600);
  }

  function estadoToTexto(enc) {
    if (enc.estado === 'activa') return 'Disponible';
    if (enc.estado === 'cerrada') return 'Cerrada';
    return 'Próximamente';
  }

  function estadoToClasePill(enc) {
    if (enc.estado === 'activa') return 'btn-pill-status btn-pill-status--activa';
    if (enc.estado === 'cerrada') return 'btn-pill-status btn-pill-status--cerrada';
    return 'btn-pill-status btn-pill-status--proximamente';
  }

  function renderButtons() {
    encuestasListSection.innerHTML = '';
    if (!ENCUESTAS.length) {
      encuestasListSection.innerHTML =
        '<p class="texto-estado mt-2">Por ahora no hay dinámicas activas para este evento.</p>';
      return;
    }

    ENCUESTAS.forEach(enc => {
      const btn = document.createElement('button');
      btn.type = 'button';
      btn.className = 'btn-accion';
      if (enc.estado !== 'activa') {
        btn.classList.add('disabled');
      }

      const subtitulo = estadoToTexto(enc);
      const pillClass = estadoToClasePill(enc);

      btn.innerHTML = `
        <div class="text-start">
          <span class="main-label">${enc.nombre}</span>
          <span class="small">${subtitulo}</span>
        </div>
        <div class="${pillClass}">
          ${enc.tipo === 'karaoke' ? 'Karaoke' : 'Ranking'}
        </div>
      `;

      btn.addEventListener('click', () => {
        if (enc.estado !== 'activa') {
          showToast('Esta dinámica todavía no está activa.');
          return;
        }
        abrirEncuesta(enc);
      });

      encuestasListSection.appendChild(btn);
    });
  }

  function abrirEncuesta(enc) {
    encuestaActual = enc;
    opcionSeleccionada = null;

    encuestaPanel.style.display = 'block';
    encuestaPanelTitle.innerText = enc.nombre.toUpperCase();

    let modoTxt = '';
    if (enc.modo_resultados === 'tiempo_real') {
      modoTxt = 'Los resultados se están actualizando en tiempo real en la pantalla principal.';
    } else if (enc.modo_resultados === 'solo_total') {
      modoTxt = 'Solo se mostrará el total de votos hasta que el anfitrión revele los resultados.';
    } else {
      modoTxt = 'Los resultados se revelarán al final del evento.';
    }

    encuestaPanelEstado.innerText = modoTxt;

    renderOpciones(enc);
  }

  function renderOpciones(enc) {
    encuestaOpciones.innerHTML = '';
    btnConfirmarRespuesta.disabled = true;

    const votosUsuario = (enc.votos_usuario || []).map(Number);

    enc.opciones.forEach(opt => {
      const div = document.createElement('button');
      div.type = 'button';
      div.className = 'opcion-btn';

      // Karaoke: opción bloqueada por otro
      if (enc.unica_por_opcion && opt.es_bloqueada && !votosUsuario.includes(opt.id)) {
        div.style.opacity = 0.4;
        div.disabled = true;
      }

      if (votosUsuario.includes(opt.id)) {
        div.classList.add('selected');
        opcionSeleccionada = opt;
      }

      div.innerHTML = `
        <img class="opcion-img" src="${
          opt.imagen ? ('/storage/' + opt.imagen) : 'https://via.placeholder.com/80?text=OP'
        }" alt="">
        <div class="flex-grow-1 text-start">
          <div class="opcion-name">${opt.nombre}</div>
          <div class="opcion-sub">${opt.descripcion || ''}</div>
        </div>
      `;

      div.addEventListener('click', () => {
        encuestaOpciones.querySelectorAll('.opcion-btn').forEach(b => b.classList.remove('selected'));
        div.classList.add('selected');
        opcionSeleccionada = opt;
        btnConfirmarRespuesta.disabled = false;
      });

      encuestaOpciones.appendChild(div);
    });

    // Si ya tenía voto y NO puede cambiar, deshabilitamos botón
    if (opcionSeleccionada) {
      btnConfirmarRespuesta.disabled = !enc.permitir_cambiar_voto;
    }
  }

  async function cargarEncuestas(quiet = false) {
    try {
      const res = await fetch(URL_ENCUESTAS_EVENTO, { credentials: 'same-origin' });
      if (!res.ok) throw new Error('No se pudieron cargar las encuestas');
      const json = await res.json();
      ENCUESTAS = json.encuestas || [];
      renderButtons();

      // Si el usuario tenía una encuesta abierta, intentamos mantenerla actualizada
      if (encuestaActual) {
        const encActualizada = ENCUESTAS.find(e => e.id === encuestaActual.id);

        if (encActualizada && encActualizada.estado === 'activa') {
          // sigue activa → refrescamos datos (opciones bloqueadas, etc.)
          abrirEncuesta(encActualizada);
        } else if (encuestaPanel.style.display !== 'none') {
          // la encuesta ya no está activa o desapareció → cerramos panel SIEMPRE
          encuestaPanel.style.display = 'none';
          encuestaActual = null;
          opcionSeleccionada = null;

          // solo mostramos toast cuando NO es modo silencioso
          if (!quiet) {
            showToast('Esta dinámica ha finalizado.');
          }
        }
      }
    } catch (e) {
      console.error(e);
      if (!quiet) showToast('Error cargando encuestas.');
    }
  }

  btnConfirmarRespuesta.addEventListener('click', async () => {
    if (!encuestaActual || !opcionSeleccionada) return;

    btnConfirmarRespuesta.disabled = true;

    try {
      const res = await fetch(URL_VOTAR(encuestaActual.id), {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': CSRF_TOKEN,
          'Accept': 'application/json'
        },
        body: JSON.stringify({
          opcion_id: opcionSeleccionada.id
        })
      });

      const json = await res.json();
      if (!res.ok || json.error) {
        showToast(json.error || 'No se pudo registrar tu voto.');
        btnConfirmarRespuesta.disabled = false;
        return;
      }

      showToast('¡Voto registrado!');

      // recargar encuestas para refrescar estado de opciones (bloqueadas, etc.)
      await cargarEncuestas(true);
      const encActualizada = ENCUESTAS.find(e => e.id === encuestaActual.id);
      if (encActualizada) abrirEncuesta(encActualizada);

    } catch (e) {
      console.error(e);
      showToast('Error al enviar tu voto.');
      btnConfirmarRespuesta.disabled = false;
    }
  });

  document.addEventListener('DOMContentLoaded', () => {
    cargarEncuestas();

    // "Tiempo real": polling cada 7 segundos
    setInterval(() => {
      cargarEncuestas(true); // quiet = true -> no spamear toasts
    }, 7000);
  });
</script>
@endsection