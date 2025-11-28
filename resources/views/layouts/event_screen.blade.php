{{-- resources/views/layouts/event_screen.blade.php --}}
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>@yield('title', 'Resultados en vivo') - Asisstify</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

  <style>
    :root {
      --bg-main: #020617;
      --bg-gradient: radial-gradient(circle at top, #1f2937 0, #020617 55%, #000 100%);
      --text-main: #f9fafb;
      --text-muted: #9ca3af;
      --accent: #fbbf24;
      --accent-2: #a855f7;
      --accent-3: #38bdf8;
    }

    * { box-sizing: border-box; }

    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      width: 100%;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: var(--bg-gradient);
      color: var(--text-main);
      overflow: hidden;
    }

    .screen-shell {
      height: 100vh;
      width: 100vw;
      display: flex;
      flex-direction: column;
    }

    .screen-header {
      padding: 16px 40px 8px;
      display: flex;
      align-items: baseline;
      justify-content: space-between;
      font-size: .9rem;
      letter-spacing: .16em;
      text-transform: uppercase;
      color: var(--text-muted);
    }

    .screen-header .brand {
      font-weight: 800;
      color: #e5e7eb;
      display: flex;
      align-items: center;
      gap: .4rem;
    }

    .screen-header .brand span.dot {
      width: 10px;
      height: 10px;
      border-radius: 999px;
      background: #22c55e;
      box-shadow: 0 0 16px rgba(34,197,94,.9);
    }

    .screen-main {
      flex: 1;
      padding: 10px 40px 40px;
      display: flex;
      align-items: stretch;
      justify-content: center;
    }

    @media (max-width: 1024px) {
      .screen-header {
        padding: 12px 20px 6px;
      }
      .screen-main {
        padding: 8px 16px 24px;
      }
    }
  </style>

  @stack('head')
</head>
<body>
  <div class="screen-shell">
    <header class="screen-header">
      <div class="brand">
        <span class="dot"></span> ASISSTIFY LIVE
      </div>
      <div class="label-right">
        RESULTADOS EN VIVO
      </div>
    </header>

    <main class="screen-main">
      @yield('content')
    </main>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  @stack('scripts')
</body>
</html>