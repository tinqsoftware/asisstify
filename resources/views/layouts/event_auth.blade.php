<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>@yield('title', 'Ingresar') - Asisstify</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    :root {
      --bg-main: #050816;
      --bg-gradient: radial-gradient(circle at top, #1f2937 0, #050816 55%, #02010a 100%);
      --card-bg: rgba(15, 23, 42, 0.96);
      --card-border: rgba(148, 163, 184, 0.35);
      --accent: #fbbf24;
      --accent-strong: #f59e0b;
      --text-main: #e5e7eb;
      --text-muted: #9ca3af;
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

    .auth-header {
      padding: 14px 16px 0;
      font-size: .8rem;
      letter-spacing: .2em;
      text-transform: uppercase;
      color: var(--text-muted);
    }

    .auth-header span {
      color: #fff;
      font-weight: 700;
    }

    .auth-wrapper {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px 12px;
    }

    .auth-footer {
      padding: 14px 16px 20px;
      text-align: center;
      font-size: .75rem;
      color: var(--text-muted);
    }

    .auth-footer a {
      color: var(--text-main);
      text-decoration: none;
      margin: 0 6px;
    }

    .auth-footer a:hover {
      color: #fef3c7;
    }
  </style>

  @stack('head')
</head>

<body>
  <header class="auth-header">
    <span>ASISSTIFY</span>
  </header>

  <main class="auth-wrapper">
    @yield('content')
  </main>

  <footer class="auth-footer">
    <div>Asisstify</div>
    <div>
      <a href="/contactanos">Contactanos</a>
      <span>·</span>
      <a href="/">Inicio</a>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  @stack('scripts')
</body>
</html>
