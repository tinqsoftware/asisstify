      <!--=====================================-->
      <!--=            Navbar Start           =-->
      <!--=====================================-->
      <header class="header header1 sticky-on trheader">
        <div id="sticky-placeholder"></div>
        <div id="navbar-wrap" class="navbar-wrap">
          <div class="header-menu">
            <div class="header-width">
              <div class="container-fluid">
                <div class="inner-wrap">
                  <div class="d-flex align-items-center justify-content-between"  >
                    <div class="site-branding">
                      <a href="/" class="logo logo-light"><img src="{{ URL::asset('image/logo-light.svg')}}" alt="Logo" width="200" height="37"></a>
                      <a href="/" class="logo logo-dark"><img src="{{ URL::asset('image/logo-dark.svg')}}" alt="Logo" width="200" height="37"></a>
                    </div>
                    <nav id="dropdown" class="template-main-menu menu-text-light">
                      <ul class="menu">

                        <li class="menu-item menu-item-has-children">
                          <a href="/">INICIO</a>
                        </li>
                        <li class="menu-item menu-item-has-children">
                          <a href="/evento">EVENTOS</a>
                        </li>
                        <li class="menu-item menu-item-has-children">
                          <a href="/asistencia">ASISTENCIAS</a>
                        </li>
                        <li class="menu-item menu-item-has-children">
                          <a href="/contactanos">CREA TU EVENTO</a>
                        </li>

                        @if(Auth::user())
                        <li class="menu-item menu-item-has-children">
                          <a href="#">ADMIN</a>
                          <ul class="sub-menu">
                            @if(Auth::user()->esSuperAdmin())
                              <li><a href="{{ route('admin.entidades.index') }}">Entidades</a></li>
                              <li><a href="{{ route('admin.roles.index') }}">Roles de Entidad</a></li>
                            @endif

                            @if(Auth::user()->tieneRolEntidad('ADMIN') || Auth::user()->tieneRolEntidad('STAFF'))
                              <li><a href="{{ route('admin.grupos.index') }}">Grupos</a></li>
                              <li><a href="{{ route('admin.eventos.index') }}">Eventos</a></li>
                            @endif
                          </ul>
                        </li>

                        <li class="menu-item menu-item-has-children">
                          <a href="{{ route('mis.asistencias') }}">Mis Asistencias</a>
                        </li>
                        @endif

                      </ul>
                    </nav>

                        
                          @guest

                            <ul class="header-action-items" >

                            </ul>
                          @else
                          <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
                            <ul class="header-action-items" >
                              <li class="nav-item dropdown">
                                  <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                      {{ Auth::user()->name }}
                                  </a>

                                  <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                      <a class="dropdown-item" href="{{ route('logout') }}"
                                          onclick="event.preventDefault();
                                                        document.getElementById('logout-form').submit();">
                                          {{ __('Cerrar sesión') }}
                                      </a>

                                      <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                          @csrf
                                      </form>
                                  </div>
                              </li>

                            </ul>
                          </nav>
                          @endguest

                         
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>


        
      <div class="rt-header-menu mean-container" id="meanmenu">
        <div class="mean-bar">
          <a href="/">
            <img src="{{ URL::asset('image/logo-dark.svg')}}" alt="Logo" width="80" height="29">
          </a>
          <span class="sidebarBtn">
            <span class="bar"></span>
          <span class="bar"></span>
          <span class="bar"></span>
          <span class="bar"></span>
          </span>
        </div>
        <div class="rt-slide-nav">
          <div class="offscreen-navigation">
            <nav class="menu-main-primary-container">
              <ul class="menu">

                <li >
                  <a href="/">INICIO</a>
                </li>
                <li >
                  <a href="/evento">EVENTOS</a>
                </li>
                <li >
                  <a href="/asistencia">ASISTENCIAS</a>
                </li>
                <li >
                  <a href="/contactanos">CREA TU EVENTO</a>
                </li>
                @if(Auth::user())
                  <li class="menu-item menu-item-has-children">
                    <a href="#">ADMIN</a>
                    <ul class="sub-menu">
                      @if(Auth::user()->esSuperAdmin())
                        <li><a href="{{ route('admin.entidades.index') }}">Entidades</a></li>
                        <li><a href="{{ route('admin.roles.index') }}">Roles de Entidad</a></li>
                      @endif

                      @if(Auth::user()->tieneRolEntidad('ADMIN') || Auth::user()->tieneRolEntidad('STAFF'))
                        <li><a href="{{ route('admin.grupos.index') }}">Grupos</a></li>
                        <li><a href="{{ route('admin.eventos.index') }}">Eventos</a></li>
                      @endif
                    </ul>
                  </li>

                  <li class="menu-item menu-item-has-children">
                    <a href="{{ route('mis.asistencias') }}">Mis Asistencias</a>
                  </li>
                  @endif
              </ul>
            </nav>
          </div>
        </div>
      </div>
      <!--=====================================-->
      <!--=              Navbar End           =-->
      <!--=====================================-->
