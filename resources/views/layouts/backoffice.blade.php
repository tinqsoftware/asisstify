<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>@yield('title', 'Panel Administrativo') - Asisstify</title>

  {{-- Bootstrap + Google Fonts --}}
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>

  <style>
    :root {
      --color-primary: #d92332;
      --color-dark: #1c1f24;
      --color-light: #f8f9fa;
      --color-muted: #6c757d;
    }

    body {
      font-family: 'Inter', sans-serif;
      background-color: var(--color-light);
      color: #212529;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Navbar */
    .navbar {
      background-color: var(--color-dark);
      box-shadow: 0 2px 6px rgba(0,0,0,0.2);
      z-index: 1030;
    }

    .navbar-brand {
      font-weight: 700;
      color: #fff !important;
      letter-spacing: 0.5px;
    }

    .navbar-brand span {
      color: var(--color-primary);
    }

    .navbar-nav .nav-link {
      color: #bbb !important;
      transition: color 0.2s ease-in-out;
    }

    .navbar-nav .nav-link:hover {
      color: #fff !important;
    }

    /* Main Content */
    .content-wrapper {
      flex: 1;
      padding: 2rem 1rem;
      background: linear-gradient(180deg, #f9fafb 0%, #f2f3f5 100%);
    }

    .card {
      border: none;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      transition: transform 0.15s ease-in-out;
    }

    .card:hover {
      transform: translateY(-3px);
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
    }

    h3, h4, h5 {
      font-weight: 600;
      color: #212529;
    }

    .btn-primary {
      background-color: var(--color-primary);
      border-color: var(--color-primary);
      border-radius: 8px;
      font-weight: 500;
      transition: all 0.2s ease-in-out;
    }

    .btn-primary:hover {
      background-color: #b81d29;
      border-color: #b81d29;
      transform: scale(1.02);
    }

    /* Footer */
    footer {
      background: var(--color-dark);
      color: #bbb;
      font-size: 0.9rem;
      text-align: center;
      padding: 1rem 0;
      margin-top: auto;
    }

    footer a {
      color: var(--color-primary);
      text-decoration: none;
      transition: color 0.2s ease-in-out;
    }

    footer a:hover {
      color: #fff;
    }

    /* Responsive */
    @media (max-width: 768px) {
      .navbar-nav {
        text-align: center;
      }
      .content-wrapper {
        padding: 1.5rem 0.5rem;
      }
    }
  </style>
</head>

<body>
  {{-- Header Backoffice --}}
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid px-4">
      <a class="navbar-brand" href="{{ route('admin.entidades.index') }}">
        ASISSTIFY<span> Admin</span>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto align-items-center">
          @if(Auth::check())
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="adminMenu" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                ADMIN
              </a>
              <ul class="dropdown-menu dropdown-menu-dark shadow" aria-labelledby="adminMenu">
                @if(Auth::user()->esSuperAdmin())
                  <li><a class="dropdown-item" href="{{ route('admin.entidades.index') }}">Entidades</a></li>
                  <li><a class="dropdown-item" href="{{ route('admin.roles.index') }}">Roles de Entidad</a></li>
                  <li><hr class="dropdown-divider"></li>
                @endif

                @if(Auth::user()->tieneRolEntidad('ADMIN') || Auth::user()->tieneRolEntidad('STAFF') || Auth::user()->esSuperAdmin())
                  <li><a class="dropdown-item" href="{{ route('admin.grupos.index') }}">Grupos</a></li>
                @endif
                <li><a class="dropdown-item" href="{{ route('admin.eventos.index') }}">Eventos</a></li>
              </ul>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="{{ route('mis.asistencias') }}">Mis Asistencias</a>
            </li>
          @endif
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
              {{ Auth::user()->name }}
            </a>
            <ul class="dropdown-menu dropdown-menu-end shadow-sm">
              <li>
                <a class="dropdown-item" href="{{ route('perfil.index') }}"> Mi Perfil</a>
              </li>
              <li>
                <a class="dropdown-item" href="{{ route('logout') }}"
                  onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                  Cerrar sesión
                </a>
              </li>
            </ul>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">@csrf</form>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  {{-- Main Content --}}
  <main class="container-fluid content-wrapper">
    <div class="container">
      @yield('content')
    </div>
  </main>

  {{-- Footer --}}
  <footer>
    <div>© {{ date('Y') }} <strong>Asisstify</strong> — Panel Administrativo</div>
  </footer>

  {{-- Scripts --}}
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>