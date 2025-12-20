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
      padding: 12px 14px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: .75rem;
      letter-spacing: .16em;
      text-transform: uppercase;
      color: var(--text-muted);
      gap: 12px;
      position: relative;
      z-index: 5;
    }

    .event-app-brand {
      font-weight: 700;
      color: #fff;
      text-decoration: none;
    }

    .event-app-nav {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .event-app-nav a,
    .event-app-nav button {
      font-size: .7rem;
      letter-spacing: .14em;
      text-transform: uppercase;
      color: var(--text-main);
      background: transparent;
      border: 1px solid rgba(148, 163, 184, 0.35);
      padding: 6px 10px;
      border-radius: 999px;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 6px;
    }

    .event-app-nav a:hover,
    .event-app-nav button:hover {
      border-color: rgba(251, 191, 36, 0.5);
      color: #fef3c7;
    }

    .event-app-dropdown {
      position: relative;
    }

    .event-app-dropdown-menu {
      position: absolute;
      right: 0;
      top: calc(100% + 8px);
      background: rgba(15, 23, 42, 0.98);
      border: 1px solid rgba(148, 163, 184, 0.35);
      border-radius: 12px;
      min-width: 180px;
      display: none;
      flex-direction: column;
      padding: 8px;
      z-index: 10;
      box-shadow: 0 14px 30px rgba(0,0,0,0.35);
    }

    .event-app-dropdown-title {
      padding: 6px 10px 4px;
      font-size: .62rem;
      text-transform: uppercase;
      letter-spacing: .18em;
      color: var(--text-muted);
    }

    .event-app-divider {
      height: 1px;
      margin: 6px 4px;
      background: rgba(148, 163, 184, 0.2);
    }

    .event-app-dropdown-menu a,
    .event-app-dropdown-menu button {
      width: 100%;
      border: none;
      padding: 8px 10px;
      border-radius: 8px;
      text-align: left;
      color: var(--text-main);
      background: transparent;
      font-size: .72rem;
      text-transform: none;
      letter-spacing: .02em;
    }

    .event-app-dropdown-menu a:hover,
    .event-app-dropdown-menu button:hover {
      background: rgba(148, 163, 184, 0.12);
      color: #fff;
    }

    .event-app-toggle {
      border: 1px solid rgba(148, 163, 184, 0.35);
      background: transparent;
      color: var(--text-main);
      padding: 6px 10px;
      border-radius: 999px;
      font-size: .72rem;
      letter-spacing: .12em;
      text-transform: uppercase;
    }

    .event-app-mobile {
      display: none;
    }

    @media (max-width: 768px) {
      .event-app-nav {
        display: none;
      }
      .event-app-mobile {
        display: flex;
        align-items: center;
        gap: 8px;
      }
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
    <a class="event-app-brand" href="/">ASISSTIFY</a>
    <div class="event-app-nav">
      @auth
        @if(Auth::user()->esSuperAdmin() || Auth::user()->tieneRolEntidad('ADMIN'))
          <div class="event-app-dropdown" data-dropdown>
            <button type="button" class="event-app-toggle" data-dropdown-toggle>
              Admin
            </button>
            <div class="event-app-dropdown-menu" data-dropdown-menu>
              <div class="event-app-dropdown-title">Admin</div>
              <a href="{{ route('admin.eventos.index') }}">Eventos</a>
              <a href="{{ route('admin.grupos.index') }}">Grupos</a>
              <a href="{{ route('admin.roles.index') }}">Roles</a>
              @if(Auth::user()->esSuperAdmin())
                <a href="{{ route('admin.entidades.index') }}">Entidades</a>
              @endif
            </div>
          </div>
        @endif
        <a href="{{ route('mis.asistencias') }}">Mis Asistencias</a>
        <div class="event-app-dropdown" data-dropdown>
          <button type="button" class="event-app-toggle" data-dropdown-toggle>
            {{ Auth::user()->name }}
          </button>
          <div class="event-app-dropdown-menu" data-dropdown-menu>
            <a href="{{ route('perfil.index') }}">Mi Perfil</a>
            <form method="POST" action="{{ route('logout') }}">
              @csrf
              <button type="submit">Cerrar sesión</button>
            </form>
          </div>
        </div>
      @endauth
      @guest
        <a href="{{ route('login') }}">Ingresar</a>
      @endguest
    </div>
    <div class="event-app-mobile">
      @auth
        <div class="event-app-dropdown" data-dropdown>
          <button type="button" class="event-app-toggle" data-dropdown-toggle>
            <i class="bi bi-list"></i>
          </button>
          <div class="event-app-dropdown-menu" data-dropdown-menu>
            @if(Auth::user()->esSuperAdmin() || Auth::user()->tieneRolEntidad('ADMIN'))
              <div class="event-app-dropdown-title">Admin</div>
              <a href="{{ route('admin.eventos.index') }}">Eventos</a>
              <a href="{{ route('admin.grupos.index') }}">Grupos</a>
              <a href="{{ route('admin.roles.index') }}">Roles</a>
              @if(Auth::user()->esSuperAdmin())
                <a href="{{ route('admin.entidades.index') }}">Entidades</a>
              @endif
              <div class="event-app-divider"></div>
            @endif
            <a href="{{ route('mis.asistencias') }}">Mis Asistencias</a>
            <div class="event-app-divider"></div>
            <a href="{{ route('perfil.index') }}">Mi Perfil</a>
            <form method="POST" action="{{ route('logout') }}">
              @csrf
              <button type="submit">Cerrar sesión</button>
            </form>
          </div>
        </div>
      @endauth
      @guest
        <a class="event-app-toggle" href="{{ route('login') }}">Ingresar</a>
      @endguest
    </div>
  </header>

  <main class="event-app-wrapper">
    {{-- Aquí va la tarjeta de evento / encuestas --}}
    @yield('content')
  </main>

  {{-- Scripts --}}
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    document.addEventListener('click', (e) => {
      const toggle = e.target.closest('[data-dropdown-toggle]');
      const dropdown = e.target.closest('[data-dropdown]');
      document.querySelectorAll('[data-dropdown-menu]').forEach(menu => {
        if (!dropdown || !dropdown.contains(menu)) {
          menu.style.display = 'none';
        }
      });
      if (toggle && dropdown) {
        const menu = dropdown.querySelector('[data-dropdown-menu]');
        if (menu) {
          menu.style.display = menu.style.display === 'flex' ? 'none' : 'flex';
        }
      }
    });
  </script>
  @stack('scripts')
</body>
</html>
