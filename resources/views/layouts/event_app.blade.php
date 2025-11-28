<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>@yield('title', 'Evento interactivo') - Asisstify</title>

  {{-- Bootstrap + Google Fonts --}}
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    :root {
      --bg-main: #050816;
      --bg-gradient: radial-gradient(circle at top, #1f2937 0, #050816 55%, #02010a 100%);
      --text-main: #e5e7eb;
      --text-muted: #9ca3af;
      --accent: #fbbf24;
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: 'Inter', sans-serif;
      background: var(--bg-gradient);
      color: var(--text-main);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    .event-app-header {
      padding: 10px 14px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: .8rem;
      letter-spacing: .18em;
      text-transform: uppercase;
      color: var(--text-muted);
    }

    .event-app-header span.brand {
      font-weight: 700;
      color: #fff;
    }

    .event-app-wrapper {
      flex: 1;
      display: flex;
      align-items: stretch;
      justify-content: center;
      padding: 16px 8px 24px;
    }

    @media (min-width: 768px) {
      .event-app-wrapper {
        padding: 24px 16px 32px;
      }
    }
  </style>

  @stack('head')
</head>

<body>
  {{-- Cabecera muy discreta tipo app --}}
  <header class="event-app-header">
    <span class="brand">ASISSTIFY</span>
    <span>Evento interactivo</span>
  </header>

  <main class="event-app-wrapper">
    {{-- Aquí va la tarjeta de evento / encuestas --}}
    @yield('content')
  </main>

  {{-- Scripts --}}
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  @stack('scripts')
</body>
</html>