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
    align-items: stretch;
    justify-content: center;
  }

  .opciones-grid {
    --cols: 4;
    --gap: 12px;
    display: grid;
    grid-template-columns: repeat(var(--cols), minmax(0, 1fr));
    gap: var(--gap);
    justify-content: center;
    align-content: start;
    justify-items: center;
    width: 100%;
    padding: 6px 0 2px;
  }

  .opciones-grid[data-size="xl"] {
    --gap: 16px;
  }

  .opciones-grid[data-size="xl"] .opcion-card {
    min-height: 320px;
  }

  .opciones-grid[data-size="xl"] .opcion-img {
    width: min(150px, 80%);
    aspect-ratio: 4 / 5;
  }

  .opciones-grid[data-size="lg"] {
    --gap: 14px;
  }

  .opciones-grid[data-size="md"] {
    --gap: 12px;
  }

  .opciones-grid[data-size="sm"] {
    --gap: 10px;
  }

  .opcion-card {
    background: radial-gradient(circle at top, rgba(15,23,42,1), rgba(15,23,42,.9));
    border-radius: 28px;
    padding: 12px 14px 16px;
    text-align: center;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: all .28s ease;
    box-shadow: 0 12px 30px rgba(0,0,0,.7);
    border: 1px solid rgba(148,163,184,.4);
    transform-origin: center bottom;
    position: relative;
    overflow: hidden;
  }

  .opciones-grid.shuffle-active .opcion-card {
    animation: shuffleDrift var(--drift-duration, 7.2s) cubic-bezier(0.45, 0, 0.55, 1) infinite;
    animation-delay: var(--drift-delay, 0s);
    will-change: transform;
  }

  .opciones-grid.shuffle-active .opcion-card--placeholder {
    animation: none;
  }

  @keyframes shuffleDrift {
    0% { transform: translateX(calc(var(--drift, 12px) * -1)); }
    50% { transform: translateX(var(--drift, 12px)); }
    100% { transform: translateX(calc(var(--drift, 12px) * -1)); }
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

  .opcion-card--placeholder {
    visibility: hidden;
    pointer-events: none;
    box-shadow: none;
    border: none;
  }

  .opcion-img {
    width: min(140px, 82%);
    aspect-ratio: 1 / 1;
    border-radius: 20px;
    object-fit: cover;
    margin: 0 auto .7rem;
    background: #020617;
    border: 1px solid rgba(55,65,81,.8);
  }

  .opcion-nombre {
    font-size: 1.15rem;
    font-weight: 700;
    margin-bottom: .5rem;
    line-height: 1.2;
    min-height: 2.4em;
  }

  .opcion-bar-wrapper {
    width: 100%;
    height: 12px;
    border-radius: 999px;
    background: #020617;
    overflow: hidden;
    margin-bottom: .3rem;
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
    font-size: 1rem;
    opacity: .9;
  }

  .opcion-porcentaje {
    margin-top: .6rem;
    font-size: 1.25rem;
    font-weight: 800;
    color: #facc15;
    letter-spacing: .08em;
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

  .panel-controles {
    position: absolute;
    left: 50%;
    bottom: 22px;
    transform: translateX(-50%);
    z-index: 5;
    display: flex;
    gap: 10px;
    align-items: center;
    background: rgba(15,23,42,.8);
    border: 1px solid rgba(148,163,184,.35);
    padding: 8px 10px;
    border-radius: 999px;
    backdrop-filter: blur(6px);
  }

  .panel-controles form,
  .panel-controles a {
    margin: 0;
  }

  .panel-controles .btn {
    border-radius: 999px;
    font-size: .75rem;
    text-transform: uppercase;
    letter-spacing: .14em;
    padding: .35rem .8rem;
  }

  .btn-ranking-toggle {
    border-radius: 999px;
    border: 1px solid rgba(148,163,184,.5);
    background: rgba(15,23,42,.85);
    color: #e2e8f0;
    padding: .45rem 1rem;
    font-size: .75rem;
    text-transform: uppercase;
    letter-spacing: .14em;
    transition: all .2s ease;
  }
  .btn-ranking-toggle:hover {
    border-color: rgba(251,191,36,.6);
    color: #facc15;
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

  .opciones-grid.winner-only {
    --cols: 1;
    justify-items: center;
    align-content: center;
  }

  .opciones-grid.winner-only .opcion-card {
    max-width: 520px;
    min-height: 380px;
    transform: translateY(-10px) scale(1.22);
    border-color: rgba(251,191,36,.9);
    box-shadow:
      0 22px 50px rgba(0,0,0,.9),
      0 0 0 2px rgba(251,191,36,.45);
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
      gap: 12px;
      grid-template-rows: auto;
      --cols: 2;
    }
    .opcion-card {
      min-width: 140px;
      max-width: 190px;
      padding: 12px 12px 16px;
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
    <button id="btnRankingToggle" class="btn-ranking-toggle" style="display:none;" type="button">
      Mostrar ranking
    </button>
    <div class="estado-mensaje">
      <span class="label">Estado de pantalla</span>
      <span id="labelMensajeEstado">Esperando resultados…</span>
    </div>
  </div>

  <div class="panel-controles">
    @if($prevEncuesta)
      <a href="{{ route('admin.eventos.encuestas.pantalla', [$evento->id, $prevEncuesta->id]) }}" class="btn btn-outline-light">Anterior</a>
    @endif

    @if($encuesta->estado !== 'activa')
      <form action="{{ route('admin.eventos.encuestas.activar', [$evento->id, $encuesta->id]) }}" method="POST">
        @csrf
        <button class="btn btn-success">Activar</button>
      </form>
    @else
      <form action="{{ route('admin.eventos.encuestas.cerrar', [$evento->id, $encuesta->id]) }}" method="POST">
        @csrf
        <button class="btn btn-danger">Cerrar</button>
      </form>
    @endif

    @if($nextEncuesta)
      <a href="{{ route('admin.eventos.encuestas.pantalla', [$evento->id, $nextEncuesta->id]) }}" class="btn btn-outline-light">Siguiente</a>
    @endif
  </div>
</div>

@push('scripts')
<script>
  const ENCUESTA_ID = {{ $encuesta->id }};
  const URL_ESTADO  = @json(route('api.encuestas.estado', $encuesta->id));
  const ADMIN_LIVE = @json($adminLive ?? false);

  let prevEstado = @json($encuesta->estado);

  const pantallaWrap = document.getElementById('pantallaWrap');
  const confettiContainer = document.getElementById('confettiContainer');
  const grid = document.getElementById('gridOpciones');
  const btnRankingToggle = document.getElementById('btnRankingToggle');

  let pollingId = null;
  let animacionGanadorHecha = false;
  let rankingVisible = false;
  let shuffleOrderIds = null;

  function calcularLayout(total) {
    if (total <= 0) return { rows: 0, cols: 0 };
    if (total <= 6) return { rows: 1, cols: total, size: 'xl' };
    if (total <= 12) return { rows: 2, cols: 6, size: 'lg' };
    if (total <= 14) return { rows: 2, cols: 7, size: 'lg' };
    if (total <= 21) return { rows: 3, cols: 7, size: 'md' };

    const cols = Math.max(7, Math.ceil(total / 3));
    const rows = Math.ceil(total / cols);
    return { rows, cols, size: 'sm' };
  }

  function lanzarConfetti() {
    confettiContainer.innerHTML = '';
    const colores = ['#facc15','#fbbf24','#f59e0b','#eab308','#fcd34d'];
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
    const totalVotos = data.total_votos ?? 0;
    const adminLiveActivo = ADMIN_LIVE && e.estado === 'activa';
    const shuffleActivo = !adminLiveActivo && e.estado === 'activa';
    const showRankingToggle = !e.unica_por_opcion && e.estado === 'cerrada';

    // textos básicos
    document.getElementById('labelTotalVotos').innerText = totalVotos;
    document.getElementById('labelRonda').innerText = e.ronda_actual;
    document.getElementById('labelModo').innerText = (e.modo_resultados || '').toUpperCase();

    const pill = document.getElementById('pillEstado');
    const pillText = document.getElementById('pillEstadoText');
    pillText.textContent = e.estado.toUpperCase();
    pill.className = 'pill-estado ' + e.estado;

    const labelMensaje = document.getElementById('labelMensajeEstado');

    if (adminLiveActivo) {
      labelMensaje.textContent = 'Resultados en vivo (admin).';
    } else if (e.estado === 'activa' && e.modo_resultados === 'tiempo_real') {
      labelMensaje.textContent = 'Resultados actualizándose en tiempo real.';
    } else if (e.estado === 'activa' && e.modo_resultados === 'final') {
      labelMensaje.textContent = 'Votación en curso. Resultados ocultos.';
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
    // si está en modo final activo, se muestra aleatorio para ocultar tendencia
    let listaMostrar = sortedByVotes;
    if (shuffleActivo) {
      const idsActuales = opciones.map(o => o.id);
      const mismoSet = shuffleOrderIds
        && shuffleOrderIds.length === idsActuales.length
        && idsActuales.every(id => shuffleOrderIds.includes(id));

      if (!mismoSet) {
        shuffleOrderIds = [...idsActuales].sort(() => Math.random() - 0.5);
      }

      listaMostrar = shuffleOrderIds
        .map(id => opciones.find(o => o.id === id))
        .filter(Boolean);
    } else {
      shuffleOrderIds = null;
    }

    const winnerOnly = showRankingToggle && !rankingVisible && idGanador;
    if (winnerOnly) {
      listaMostrar = sortedByVotes.filter(opt => opt.id === idGanador);
    }

    const layout = calcularLayout(listaMostrar.length);
    const cols = layout.cols || Math.max(1, Math.ceil(listaMostrar.length / Math.max(1, layout.rows || 1)));
    const rows = layout.rows || Math.max(1, Math.ceil(listaMostrar.length / cols));
    const size = layout.size || (rows === 1 ? 'xl' : rows === 2 ? 'lg' : 'md');

    grid.style.setProperty('--cols', cols);
    grid.dataset.size = size;
    grid.classList.toggle('shuffle-active', shuffleActivo);
    grid.classList.toggle('winner-only', winnerOnly);

    if (showRankingToggle) {
      btnRankingToggle.style.display = 'inline-flex';
      btnRankingToggle.textContent = rankingVisible ? 'Ocultar ranking' : 'Mostrar ranking';
    } else {
      btnRankingToggle.style.display = 'none';
      rankingVisible = false;
    }

    const crearPlaceholder = () => {
      const ghost = document.createElement('div');
      ghost.className = 'opcion-card opcion-card--placeholder';
      return ghost;
    };

    const cards = listaMostrar.map((opt) => {
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

      if (!e.unica_por_opcion && e.estado === 'cerrada' && !winnerOnly) {
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

        if (e.estado === 'cerrada' || adminLiveActivo) {
          votos.innerText = `${opt.votos} votos · ${opt.porcentaje}%`;
        } else {
          votos.innerText = 'Votación en curso…';
        }
        card.appendChild(votos);
      }

      if (e.unica_por_opcion && opt.tomado_por) {
        const ticket = document.createElement('div');
        ticket.className = 'opcion-ticket';
        ticket.innerHTML = `
          <span class="opcion-ticket-dot"></span>
          <span>${opt.tomado_por}</span>
        `;
        card.appendChild(ticket);
      }

      if (!e.unica_por_opcion && e.estado === 'cerrada' && idGanador && opt.id === idGanador) {
        const badge = document.createElement('div');
        badge.className = 'badge-ganador';
        badge.innerText = 'GANADOR';
        card.appendChild(badge);
      }

      if (winnerOnly) {
        const porcentaje = document.createElement('div');
        porcentaje.className = 'opcion-porcentaje';
        porcentaje.innerText = `${opt.porcentaje}%`;
        card.appendChild(porcentaje);
      }

      if (shuffleActivo) {
        const drift = 8 + Math.random() * 18;
        card.style.setProperty('--drift', drift.toFixed(0) + 'px');
        card.style.setProperty('--drift-delay', (Math.random() * 0.6).toFixed(2) + 's');
        card.style.setProperty('--drift-duration', (6.2 + Math.random() * 3.2).toFixed(2) + 's');
      }

      return card;
    });

    const fullRows = Math.floor(cards.length / cols);
    const lastCount = cards.length % cols;
    const padTotal = lastCount ? (cols - lastCount) : 0;
    const startPad = lastCount ? Math.ceil(padTotal / 2) : 0;
    const endPad = lastCount ? padTotal - startPad : 0;

    let idx = 0;
    for (let r = 0; r < rows; r++) {
      if (r < fullRows) {
        for (let c = 0; c < cols; c++) {
          grid.appendChild(cards[idx++]);
        }
      } else if (lastCount && r === fullRows) {
        for (let i = 0; i < startPad; i++) grid.appendChild(crearPlaceholder());
        for (let c = 0; c < lastCount; c++) grid.appendChild(cards[idx++]);
        for (let i = 0; i < endPad; i++) grid.appendChild(crearPlaceholder());
      } else {
        for (let c = 0; c < cols; c++) grid.appendChild(crearPlaceholder());
      }
    }

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
        const todas = Array.from(grid.querySelectorAll('.opcion-card'))
          .filter(c => !c.classList.contains('opcion-card--placeholder'));

        if (ganadorCard) {
          todas.forEach(c => { if (c !== ganadorCard) c.classList.add('opcion-card--dim'); });
          ganadorCard.classList.add('opcion-card--anim-win');

          ganadorCard.addEventListener('animationend', () => {
            // Volvemos a mostrar todas sin blur
            todas.forEach(c => c.classList.remove('opcion-card--dim'));
            ganadorCard.classList.remove('opcion-card--anim-win');
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

  btnRankingToggle.addEventListener('click', () => {
    rankingVisible = !rankingVisible;
    animacionGanadorHecha = false;
    refreshEstado();
  });

  function iniciarPolling() {
    refreshEstado();
    pollingId = setInterval(refreshEstado, REFRESH_MS);
  }

  iniciarPolling();
</script>
@endpush
@endsection
