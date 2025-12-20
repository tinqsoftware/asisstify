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
      --color-primary: #fbbf24;
      --color-dark: #0b1220;
      --color-panel: #0f172a;
      --color-muted: #9ca3af;
      --color-border: rgba(148, 163, 184, 0.28);
    }

    body {
      font-family: 'Inter', sans-serif;
      background-color: var(--color-dark);
      color: #e5e7eb;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Navbar */
    .navbar {
      background-color: #101827;
      box-shadow: 0 2px 6px rgba(0,0,0,0.2);
      z-index: 1030;
    }

    .navbar-brand {
      font-weight: 700;
      color: #fff !important;
      letter-spacing: 0.5px;
    }

    .navbar-brand span {
      color: #f59e0b;
    }

    .navbar-nav .nav-link {
      color: #cbd5f5 !important;
      transition: color 0.2s ease-in-out;
    }

    .navbar-nav .nav-link:hover {
      color: #fff !important;
    }

    /* Main Content */
    .content-wrapper {
      flex: 1;
      padding: 2rem 1rem;
      background: radial-gradient(circle at top, #1f2937 0, #050816 60%, #02010a 100%);
    }

    .card {
      background: var(--color-panel);
      border: 1px solid var(--color-border);
      border-radius: 12px;
      box-shadow: 0 12px 32px rgba(0, 0, 0, 0.45);
    }

    h3, h4, h5 {
      font-weight: 600;
      color: #e5e7eb;
    }

    .btn-primary {
      background-color: #fbbf24;
      border-color: #fbbf24;
      color: #111827;
      border-radius: 8px;
      font-weight: 500;
      transition: all 0.2s ease-in-out;
    }

    .btn-primary:hover {
      background-color: #f59e0b;
      border-color: #f59e0b;
      transform: translateY(-1px);
    }

    .btn-outline-dark,
    .btn-outline-secondary,
    .btn-outline-primary {
      color: #e5e7eb;
      border-color: rgba(148, 163, 184, 0.35);
    }

    .btn-outline-dark:hover,
    .btn-outline-secondary:hover,
    .btn-outline-primary:hover {
      background: rgba(148, 163, 184, 0.12);
      color: #fff;
    }

    .text-dark {
      color: #e5e7eb !important;
    }

    .bg-light,
    .bg-white {
      background: var(--color-panel) !important;
      color: #e5e7eb;
    }

    .form-control,
    .form-select,
    textarea {
      background: rgba(2, 6, 23, 0.7);
      border: 1px solid rgba(148, 163, 184, 0.35);
      color: #e5e7eb;
    }

    .form-control:focus,
    .form-select:focus,
    textarea:focus {
      border-color: rgba(251, 191, 36, 0.6);
      box-shadow: 0 0 0 2px rgba(251, 191, 36, 0.16);
      background: rgba(2, 6, 23, 0.7);
      color: #e5e7eb;
    }

    .table {
      color: #e5e7eb;
      border-color: rgba(148, 163, 184, 0.2);
      --bs-table-bg: transparent;
      --bs-table-striped-bg: rgba(2, 6, 23, 0.6);
      --bs-table-hover-bg: rgba(251, 191, 36, 0.08);
    }

    .table-light {
      --bs-table-bg: rgba(30, 41, 59, 0.75);
      --bs-table-color: #e5e7eb;
    }

    .table-striped > tbody > tr:nth-of-type(odd) > * {
      --bs-table-accent-bg: rgba(2, 6, 23, 0.6);
      color: #e5e7eb;
    }

    .table-hover > tbody > tr:hover > * {
      --bs-table-accent-bg: rgba(251, 191, 36, 0.08);
      color: #e5e7eb;
    }

    .modal-content {
      background: var(--color-panel);
      color: #e5e7eb;
      border: 1px solid var(--color-border);
    }

    .modal-header,
    .modal-footer {
      border-color: rgba(148, 163, 184, 0.2);
    }

    .alert {
      background: rgba(15, 23, 42, 0.9);
      border: 1px solid var(--color-border);
      color: #e5e7eb;
    }

    .alert-success {
      border-color: rgba(34, 197, 94, 0.4);
    }

    .alert-danger {
      border-color: rgba(239, 68, 68, 0.4);
    }

    .pagination {
      --bs-pagination-bg: rgba(15, 23, 42, 0.9);
      --bs-pagination-border-color: rgba(148, 163, 184, 0.25);
      --bs-pagination-color: #e5e7eb;
      --bs-pagination-hover-bg: rgba(251, 191, 36, 0.18);
      --bs-pagination-hover-color: #fef3c7;
      --bs-pagination-active-bg: #fbbf24;
      --bs-pagination-active-border-color: #fbbf24;
      --bs-pagination-active-color: #111827;
    }

    /* Footer */
    footer {
      background: #101827;
      color: #cbd5f5;
      font-size: 0.9rem;
      text-align: center;
      padding: 1rem 0;
      margin-top: auto;
    }

    footer a {
      color: #fbbf24;
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
              @if(Auth::user()->esSuperAdmin() || Auth::user()->tieneRolEntidad('ADMIN'))
                <a class="nav-link dropdown-toggle" href="#" id="adminMenu" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  ADMIN
                </a>
                <ul class="dropdown-menu dropdown-menu-dark shadow" aria-labelledby="adminMenu">
                  @if(Auth::user()->esSuperAdmin())
                    <li><a class="dropdown-item" href="{{ route('admin.entidades.index') }}">Entidades</a></li>
                  @endif
                  <li><a class="dropdown-item" href="{{ route('admin.roles.index') }}">Roles de Entidad</a></li>
                  <li><a class="dropdown-item" href="{{ route('admin.grupos.index') }}">Grupos</a></li>
                  <li><a class="dropdown-item" href="{{ route('admin.eventos.index') }}">Eventos</a></li>
                </ul>
              @endif
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
