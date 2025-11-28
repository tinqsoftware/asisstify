@extends('layouts.event_screen')

@section('title', 'Pantalla encuesta - ' . $encuesta->nombre)

@section('content')
<style>
  .pantalla-wrap {
    position: relative;
    width: 100%;
    height: 100%;
    border-radius: 32px;
    padding: 32px 40px;
    background:
      radial-gradient(circle at top left, rgba(251,191,36,.18), transparent 65%),
      radial-gradient(circle at bottom right, rgba(56,189,248,.18), transparent 65%),
      rgba(15,23,42,.94);
    box-shadow:
      0 40px 120px rgba(0,0,0,.9),
      0 0 0 1px rgba(148,163,184,.4);
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  .pantalla-wrap::before {
    content:'';
    position:absolute;
    inset:-180px auto auto -120px;
    width:260px;
    height:260px;
    background:radial-gradient(circle,rgba(251,191,36,.25),transparent 70%);
    opacity:.9;
    pointer-events:none;
  }
  .pantalla-wrap::after {
    content:'';
    position:absolute;
    inset:auto -160px -160px auto;
    width:260px;
    height:260px;
    background:radial-gradient(circle,rgba(56,189,248,.25),transparent 70%);
    opacity:.9;
    pointer-events:none;
  }

  .pantalla-top {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    gap: .25rem;
  }

  .pantalla-titulo-evento {
    font-size: 1.2rem;
    letter-spacing: .18em;
    text-transform: uppercase;
    font-weight: 600;
    color: #e5e7eb;
    opacity: .85;
  }

  .pantalla-titulo-encuesta {
    font-size: 3.4rem;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: .14em;
    margin-top: .25rem;
    color: #fefce8;
  }

  .pill-estado {
    display: inline-flex;
    align-items: center;
    gap: .35rem;
    padding: .25rem .9rem;
    border-radius: 999px;
    font-size: .8rem;
    text-transform: uppercase;
    letter-spacing: .16em;
    margin-left: .8rem;
    border: 1px solid rgba(148,163,184,.35);
    background: rgba(15,23,42,.95);
  }
  .pill-estado span.dot {
    width: 8px;
    height: 8px;
    border-radius: 999px;
  }
  .pill-estado.activa span.dot { background:#22c55e; box-shadow:0 0 12px rgba(34,197,94,.9);}
  .pill-estado.cerrada span.dot { background:#ef4444; box-shadow:0 0 12px rgba(239,68,68,.9);}
  .pill-estado.borrador span.dot { background:#e5e7eb; opacity:.7;}

  .pantalla-sub {
    font-size: 1rem;
    opacity: .85;
    margin-top: .75rem;
  }

  .pantalla-sub span.label {
    text-transform: uppercase;
    letter-spacing: .18em;
    font-size: .75rem;
    color: #9ca3af;
  }

  .pantalla-sub strong {
    font-weight: 700;
    color: #fef3c7;
  }

  .zona-principal {
    position: relative;
    z-index: 1;
    flex: 1;
    margin-top: 18px;
    margin-bottom: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .opciones-grid {
    display: flex;
    gap: 24px;
    justify-content: center;
    align-items: flex-end;
    flex-wrap: nowrap;
    max-width: 100%;
  }

  .opcion-card {
    background: radial-gradient(circle at top, rgba(15,23,42,1), rgba(15,23,42,.9));
    border-radius: 28px;
    padding: 18px 22px 20px;
    text-align: center;
    min-width: 190px;
    max-width: 240px;
    transition: all .28s ease;
    box-shadow: 0 12px 30px rgba(0,0,0,.7);
    border: 1px solid rgba(148,163,184,.4);
    transform-origin: center bottom;
    position: relative;
    overflow: hidden;
  }

  .opcion-card::before {
    content:'';
    position:absolute;
    inset:-60px auto auto -60px;
    width:120px;
    height:120px;
    background:radial-gradient(circle,rgba(148,163,184,.3),transparent 70%);
    opacity:.3;
    pointer-events:none;
  }

  .opcion-card--ganador {
    transform: translateY(-16px) scale(1.08);
    border-color: rgba(251,191,36,.8);
    box-shadow:
      0 18px 40px rgba(0,0,0,.9),
      0 0 0 2px rgba(251,191,36,.4);
  }

  .opcion-nombre {
    font-size: 1.15rem;
    font-weight: 700;
    margin-bottom: .45rem;
  }

  /* OPCIONES PANTALLA — aumento del tamaño en ~35% */
  .opcion-img {
      width: 200px; /* antes 150 */
      height: 200px; /* antes 150 */
      border-radius: 28px;
      object-fit: cover;
      margin-bottom: 1rem; /* un poco más de aire */
      background: #020617;
      border: 1px solid rgba(55,65,81,.8);
  }

  .opcion-nombre {
      font-size: 1.55rem; /* antes 1.15rem */
      font-weight: 700;
      margin-bottom: .6rem;
  }

  .opcion-votos {
      font-size: 1.15rem; /* antes .95rem */
      opacity: .95;
  }

  .opcion-card {
      padding: 24px 26px 28px; /* antes 18px 22px 20px */
      min-width: 230px;        /* antes 190 */
      max-width: 300px;        /* antes 240 */
  }

  .opcion-bar-wrapper {
    height: 22px; /* antes 16px */
  } 

  .opcion-bar-wrapper {
    width: 100%;
    height: 16px;
    border-radius: 999px;
    background: #020617;
    overflow: hidden;
    margin-bottom: .4rem;
    border: 1px solid rgba(31,41,55,1);
  }
  .opcion-bar-fill {
    height: 100%;
    border-radius: 999px;
    background: linear-gradient(90deg, #f97316, #facc15, #22c55e);
    width: 0%;
    transition: width .5s ease;
  }

  .opcion-votos {
    font-size: .95rem;
    opacity: .9;
  }

  .opcion-ticket {
    margin-top: .35rem;
    font-size: .8rem;
    text-transform: uppercase;
    letter-spacing: .14em;
    color: #bfdbfe;
    display: inline-flex;
    align-items: center;
    gap: .35rem;
    padding: 3px 10px;
    border-radius: 999px;
    border: 1px solid rgba(59,130,246,.7);
    background: rgba(15,23,42,.9);
  }
  .opcion-ticket-dot {
    width: 8px;
    height: 8px;
    border-radius: 999px;
    background: #60a5fa;
    box-shadow: 0 0 12px rgba(59,130,246,.9);
  }

  .badge-ganador {
    margin-top: .3rem;
    font-size: .9rem;
    font-weight: 800;
    color: #facc15;
    letter-spacing: .16em;
    text-transform: uppercase;
  }

  .badge-ganador.suspenso {
    color: #38bdf8;
  }

  .zona-bottom {
    position: relative;
    z-index: 1;
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    gap: 1rem;
  }

  .total-votos {
    font-size: 1.05rem;
    opacity: .9;
  }
  .total-votos strong {
    font-size: 1.25rem;
  }

  .estado-mensaje {
    font-size: .95rem;
    text-align: right;
    color: #e5e7eb;
  }
  .estado-mensaje span.label {
    text-transform: uppercase;
    letter-spacing: .18em;
    font-size: .75rem;
    color: #9ca3af;
    display: block;
  }


    /* ANIMACIÓN GANADOR FINAL */
  .opcion-card--dim {
    opacity: .18;
    filter: blur(2px);
  }

  .opcion-card--anim-win {
    z-index: 5;
    animation: ganadorZoom 2.4s ease-out forwards;
  }

  @keyframes ganadorZoom {
    0% {
      transform: translateY(0) scale(1) rotate(0deg);
    }
    35% {
      transform: translateY(-6vh) scale(1.5) rotate(-4deg);
    }
    65% {
      transform: translateY(-10vh) scale(2.1) rotate(3deg);
    }
    100% {
      transform: translateY(-4vh) scale(1.4) rotate(0deg);
    }
  }

  /* Tamaños finales según ranking (después de la animación) */
  .opcion-card--rank1 {
    transform: translateY(-14px) scale(1.18);
    border-color: rgba(251,191,36,.9);
    box-shadow:
      0 18px 40px rgba(0,0,0,.9),
      0 0 0 2px rgba(251,191,36,.35);
  }

  .opcion-card--rank2 {
    transform: translateY(-8px) scale(1.06);
  }

  .opcion-card--rank3 {
    transform: translateY(-2px) scale(1.0);
  }

  .opcion-card--rank4,
  .opcion-card--rank5,
  .opcion-card--rank6 {
    transform: translateY(4px) scale(.94);
    opacity: .92;
  }
 

  /* CONFETTI */
  .confetti-container {
    pointer-events: none;
    position: absolute;
    inset: 0;
    overflow: hidden;
    z-index: 0;
  }

  .confetti-piece {
    position: absolute;
    width: 8px;
    height: 14px;
    border-radius: 2px;
    opacity: 0;
    animation: confetti-fall 3.5s ease-out forwards;
  }

  @keyframes confetti-fall {
    0% { transform: translateY(-10vh) rotateZ(0deg); opacity: 1; }
    100% { transform: translateY(110vh) rotateZ(360deg); opacity: 0; }
  }

  /* RESPONSIVE */
  @media (max-width: 1024px) {
    .pantalla-wrap {
      padding: 20px 16px;
      border-radius: 22px;
    }
    .pantalla-titulo-evento {
      font-size: .95rem;
      letter-spacing: .14em;
    }
    .pantalla-titulo-encuesta {
      font-size: 2.1rem;
      letter-spacing: .10em;
    }
    .opciones-grid {
      gap: 14px;
      flex-wrap: wrap;
    }
    .opcion-card {
      min-width: 150px;
      max-width: 190px;
    }
    .zona-bottom {
      flex-direction: column;
      align-items: flex-start;
    }
    .estado-mensaje {
      text-align: left;
    }
  }
</style>

<div class="pantalla-wrap" id="pantallaWrap">
  <div class="confetti-container" id="confettiContainer"></div>

  <div class="pantalla-top">
    <div class="pantalla-titulo-evento">{{ strtoupper($evento->titulo) }}</div>
    <div class="pantalla-titulo-encuesta">
      {{ strtoupper($encuesta->nombre) }}
      <span id="pillEstado" class="pill-estado {{ $encuesta->estado }}">
        <span class="dot"></span>
        <span id="pillEstadoText">{{ strtoupper($encuesta->estado) }}</span>
      </span>
    </div>
    <div class="pantalla-sub">
      <span class="label">Ronda</span>
      <strong id="labelRonda">{{ $encuesta->ronda_actual }}</strong>
      &nbsp;&nbsp;·&nbsp;&nbsp;
      <span class="label">Modo resultados</span>
      <strong id="labelModo">{{ strtoupper($encuesta->modo_resultados) }}</strong>
    </div>
  </div>

  <div class="zona-principal">
    <div id="gridOpciones" class="opciones-grid"></div>
  </div>

  <div class="zona-bottom">
    <div class="total-votos">
      Total de votos: <strong id="labelTotalVotos">0</strong>
    </div>
    <div class="estado-mensaje">
      <span class="label">Estado de pantalla</span>
      <span id="labelMensajeEstado">Esperando resultados…</span>
    </div>
  </div>
</div>

@push('scripts')
<script>
  const ENCUESTA_ID = {{ $encuesta->id }};
  const URL_ESTADO  = @json(route('api.encuestas.estado', $encuesta->id));

  let prevEstado = @json($encuesta->estado);

  const pantallaWrap = document.getElementById('pantallaWrap');
  const confettiContainer = document.getElementById('confettiContainer');
  const grid = document.getElementById('gridOpciones');

  let pollingId = null;
  let animacionGanadorHecha = false;

  function lanzarConfetti() {
    confettiContainer.innerHTML = '';
    const colores = ['#facc15','#fbbf24','#eab308','#a855f7','#38bdf8'];
    const piezas = 120;

    for (let i = 0; i < piezas; i++) {
      const el = document.createElement('div');
      el.className = 'confetti-piece';
      el.style.left = (Math.random() * 100) + 'vw';
      el.style.backgroundColor = colores[Math.floor(Math.random() * colores.length)];
      el.style.animationDelay = (Math.random() * 1.8) + 's';
      el.style.transform = 'translateY(-10vh) rotateZ(' + (Math.random() * 360) + 'deg)';
      confettiContainer.appendChild(el);
    }
  }



  function renderEstado(data) {
    const e = data.encuesta;
    const opciones = data.opciones || [];

    // textos básicos
    document.getElementById('labelTotalVotos').innerText = data.total_votos ?? 0;
    document.getElementById('labelRonda').innerText = e.ronda_actual;
    document.getElementById('labelModo').innerText = (e.modo_resultados || '').toUpperCase();

    const pill = document.getElementById('pillEstado');
    const pillText = document.getElementById('pillEstadoText');
    pillText.textContent = e.estado.toUpperCase();
    pill.className = 'pill-estado ' + e.estado;

    const labelMensaje = document.getElementById('labelMensajeEstado');

    if (e.estado === 'activa' && e.modo_resultados === 'tiempo_real') {
      labelMensaje.textContent = 'Resultados actualizándose en tiempo real.';
    } else if (e.estado === 'activa') {
      labelMensaje.textContent = 'Mostrando participantes mientras se reciben votos…';
    } else if (e.estado === 'cerrada') {
      labelMensaje.textContent = 'Resultado final de la votación.';
    } else {
      labelMensaje.textContent = 'Esperando resultados…';
    }

    // Si no hay opciones, limpiamos y salimos
    grid.innerHTML = '';
    if (!opciones.length) {
      prevEstado = e.estado;
      return;
    }

    // Ranking REAL (para saber quién gana y poner tamaños finales)
    const sortedByVotes = [...opciones].sort((a,b) => b.votos - a.votos);
    const maxVotos = sortedByVotes[0].votos || 0;
    const idGanador = sortedByVotes[0]?.id ?? null;

    // Lista que se VA A MOSTRAR:
    // ahora siempre ordenada por votos desc (no se reordenan aleatoriamente)
    const listaMostrar = sortedByVotes;

    // Pintamos tarjetas
    listaMostrar.forEach((opt) => {
      const card = document.createElement('div');
      card.className = 'opcion-card';
      card.dataset.opcionId = opt.id;

      const name = document.createElement('div');
      name.className = 'opcion-nombre';
      name.innerText = opt.nombre;
      card.appendChild(name);

      const img = document.createElement('img');
      img.className = 'opcion-img';
      img.src = opt.imagen ? ('/storage/' + opt.imagen) : 'https://via.placeholder.com/150?text=Opcion';
      img.alt = opt.nombre;
      card.appendChild(img);

      const barWrap = document.createElement('div');
      barWrap.className = 'opcion-bar-wrapper';
      const barFill = document.createElement('div');
      barFill.className = 'opcion-bar-fill';
      const ancho = (maxVotos > 0) ? (opt.votos * 100 / maxVotos) : 0;
      barFill.style.width = ancho.toFixed(1) + '%';
      barWrap.appendChild(barFill);
      card.appendChild(barWrap);

      const votos = document.createElement('div');
      votos.className = 'opcion-votos';

      if (e.estado === 'cerrada' || e.modo_resultados === 'tiempo_real') {
        votos.innerText = `${opt.votos} votos · ${opt.porcentaje}%`;
      } else {
        votos.innerText = 'Votación en curso…';
      }
      card.appendChild(votos);

      // Si es encuesta tipo "un usuario por opción" (karaoke),
      // mostramos quién tomó esa opción como un ticket elegante
      if (e.unica_por_opcion && opt.tomado_por) {
        const ticket = document.createElement('div');
        ticket.className = 'opcion-ticket';
        ticket.innerHTML = `
          <span class="opcion-ticket-dot"></span>
          <span>TOMADO POR&nbsp;${opt.tomado_por.toUpperCase()}</span>
        `;
        card.appendChild(ticket);
      }

      // SOLO cuando esté cerrada y NO sea karaoke marcamos GANADOR (badge)
      if (!e.unica_por_opcion && e.estado === 'cerrada' && idGanador && opt.id === idGanador) {
        const badge = document.createElement('div');
        badge.className = 'badge-ganador';
        badge.innerText = 'GANADOR';
        card.appendChild(badge);
      }

      grid.appendChild(card);
    });

    // Si acaba de pasar de cualquier estado a CERRADA
    // → animación especial SOLO si NO es encuesta karaoke (unica_por_opcion = false)
    if (!e.unica_por_opcion && e.estado === 'cerrada' && prevEstado !== 'cerrada') {
      if (pollingId) {
        clearInterval(pollingId); // ya no es necesario seguir pidiendo datos
      }

      // Confetti
      lanzarConfetti();

      // Animación de carta ganadora
      if (idGanador) {
        const ganadorCard = grid.querySelector('[data-opcion-id="' + idGanador + '"]');
        const todas = Array.from(grid.querySelectorAll('.opcion-card'));

        if (ganadorCard) {
          todas.forEach(c => { if (c !== ganadorCard) c.classList.add('opcion-card--dim'); });
          ganadorCard.classList.add('opcion-card--anim-win');

          ganadorCard.addEventListener('animationend', () => {
            // Volvemos a mostrar todas sin blur
            todas.forEach(c => c.classList.remove('opcion-card--dim'));
            ganadorCard.classList.remove('opcion-card--anim-win');

            // Reordenamos visualmente según ranking real y aplicamos tamaños finales
            grid.innerHTML = '';
            sortedByVotes.forEach((opt, index) => {
              const card = todas.find(c => c.dataset.opcionId == opt.id);
              if (!card) return;

              card.classList.remove(
                'opcion-card--rank1',
                'opcion-card--rank2',
                'opcion-card--rank3',
                'opcion-card--rank4',
                'opcion-card--rank5',
                'opcion-card--rank6'
              );

              const rankClass = 'opcion-card--rank' + (index + 1);
              card.classList.add(rankClass);

              grid.appendChild(card);
            });

            animacionGanadorHecha = true;
          }, { once: true });
        }
      }
    }

    prevEstado = e.estado;
  }

  async function refreshEstado() {
    // Si ya hicimos la animación final del ganador, no necesitamos seguir pidiendo datos
    if (animacionGanadorHecha) return;

    try {
      const res = await fetch(URL_ESTADO);
      if (!res.ok) return;
      const json = await res.json();
      renderEstado(json);
    } catch (e) {
      console.error('Error obteniendo estado encuesta:', e);
    }
  }

  const REFRESH_MS = 600;

  function iniciarPolling() {
    refreshEstado();
    pollingId = setInterval(refreshEstado, REFRESH_MS);
  }

  iniciarPolling();
</script>
@endpush
@endsection
