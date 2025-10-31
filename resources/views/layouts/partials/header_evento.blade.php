      <!--=====================================-->
      <!--=            Navbar Start           =-->
      <!--=====================================-->
      <header class="header header2 sticky-on trheader">
        <div id="sticky-placeholder"></div>
        <div id="navbar-wrap" class="navbar-wrap">
          <div class="header-menu">
            <div class="container-fluid">
              <div class="inner-wrap">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="site-branding">
                    <a href="/" class="logo logo-light"><img src="{{ URL::asset('image/logo-dark.svg')}}" alt="Logo" width="200" height="37"></a>
                    <a href="/" class="logo logo-dark"><img src="{{ URL::asset('image/logo-dark.svg')}}" alt="Logo" width="200" height="37"></a>
                  </div>
                  <nav id="dropdown" class="template-main-menu menu-text-dark">
                    <ul class="menu">
                      <!---
                        <li class="menu-item menu-item-has-children">
                          <a href="/">HOME</a>
                          <ul class="sub-menu">
                            <li class="menu-item"><a href="/">Main Home</a>
                            </li>
                            <li class="menu-item"><a href="index2.html">Design Conference</a>
                            </li>
                            <li class="menu-item"><a href="index3.html">Web Seminar</a>
                            </li>
                            <li class="menu-item"><a href="index4.html">Digital Event</a>
                            </li>
                          </ul>
                        </li>
                        <li class="menu-item menu-item-has-children mega-menu mega-menu-col-2">
                          <a href="about.html">PAGES</a>
                          <ul class="sub-menu">
                            <li class="menu-item">
                              <ul class="sub-menu">
                                <li class="menu-item"><a href="about.html">About</a></li>
                                <li class="menu-item"><a href="pricing.html">Pricing</a></li>
                                <li class="menu-item"><a href="gallery.html">Gallery</a></li>
                                <li class="menu-item"><a href="venue.html">Venu</a></li>
                              </ul>
                            </li>
                            <li class="menu-item">
                              <ul class="sub-menu">
                                <li class="menu-item"><a href="brand.html">Brand</a></li>
                                <li class="menu-item"><a href="faq.html">Faq</a></li>
                                <li class="menu-item"><a href="404.html">404 Error</a></li>
                                <li class="menu-item"><a href="contact.html">Contact Us</a></li>
                              </ul>
                            </li>
                          </ul>
                        </li>
                        <li class="menu-item menu-item-has-children">
                          <a href="speaker.html">SPEAKERS</a>
                          <ul class="sub-menu">
                            <li class="menu-item"><a href="speaker.html">Speaker</a></li>
                            <li class="menu-item"><a href="speaker-single.html">Speaker Single</a></li>
                          </ul>
                        </li>
                      -->
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
                      <!--
                        <li class="menu-item menu-item-has-children">
                          <a href="portfolio-two-col-grid.html">PORTFOLIO</a>
                          <ul class="sub-menu">
                            <li class="menu-item"><a href="portfolio-two-col-grid.html">Standard Two Column</a></li>
                            <li class="menu-item"><a href="portfolio-three-col-grid1.html">Standard Three Column</a>
                            </li>
                            <li class="menu-item"><a href="portfolio-three-col-grid2.html">Three Column Grid</a></li>
                            <li class="menu-item"><a href="portfolio-four-col-grid.html">Four Column Grid</a></li>
                            <li class="menu-item"><a href="portfolio-four-col-full-wide.html">Four Column Full Wide</a></li>
                          </ul>
                        </li>
                        <li class="menu-item menu-item-has-children">
                          <a href="blog-grid.html">BLOG</a>
                          <ul class="sub-menu">
                            <li class="menu-item"><a href="blog-grid.html">Blog Grid</a></li>
                            <li class="menu-item"><a href="blog-list.html">Blog List</a></li>
                            <li class="menu-item"><a href="blog-single.html">Blog Single</a></li>
                          </ul>
                        </li>
                      -->
                    </ul>
                  </nav>
                  @guest
                    <ul class="header-action-items" >
                      <!--
                        @if (Route::has('login'))
                          <li class="header-action-item d-none d-xl-block">
                              <a href="{{ route('login') }}" class="item-btn btn-fill style-two">Ingresar</a>
                          </li>
                        @endif

                        @if (Route::has('register'))
                          <li class="header-action-item d-none d-xl-block">
                              <a href="{{ route('register') }}" class="btn-fill style-four" >Registrate</a>
                          </li>
                        @endif
                      -->
                      <!--
                        <li class="header-action-item">
                          <button type="button" class="offcanvas-menu-btn style-one menu-status-open">
                            <span class="menu-btn-icon">
                            <span></span>
                            <span></span>
                            <span></span>
                            </span>
                          </button>
                        </li>
                      -->
                    </ul>
                  @else
                  <nav class="navbar navbar-expand-md navbar-light bg-white">
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
                        <!-- butón amburguesa
                      <li class="header-action-item">
                        <button type="button" class="offcanvas-menu-btn style-one menu-status-open">
                          <span class="menu-btn-icon">
                          <span></span>
                          <span></span>
                          <span></span>
                          </span>
                        </button>
                      </li>
                       -->
                    </ul>
                  </nav>
                  @endguest
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
                <!--
                <li class="list menu-item-parent menu-item-has-children">
                  <a class="animation" href="home-main.html">HOME</a>
                  <ul class="main-menu__dropdown sub-menu">
                    <li><a href="/">Main Home</a>
                    </li>
                    <li><a href="index2.html">Design Conference</a>
                    </li>
                    <li><a href="index3.html">Web Seminar</a>
                    </li>
                    <li><a href="index4.html">Digital Event</a>
                    </li>
                  </ul>
                </li>
                <li class="list menu-item-parent menu-item-has-children">
                  <a class="animation" href="home-main.html">PAGES</a>
                  <ul class="main-menu__dropdown sub-menu">
                    <li><a href="about.html">About</a></li>
                    <li><a href="pricing.html">Pricing</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="venue.html">Venu</a></li>
                    <li><a href="brand.html">Brand</a></li>
                    <li><a href="faq.html">Faq</a></li>
                    <li><a href="404.html">404 Error</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                  </ul>
                </li>
                <li class="list menu-item-parent menu-item-has-children">
                  <a class="animation" href="home-main.html">SPEAKERS</a>
                  <ul class="main-menu__dropdown sub-menu">
                    <li><a href="speaker.html">Speaker</a></li>
                    <li><a href="speaker-single.html">Speaker Single</a></li>
                  </ul>
                </li>
                <li class="list menu-item-parent menu-item-has-children">
                  <a class="animation" href="home-main.html">EVENTS</a>
                  <ul class="main-menu__dropdown sub-menu">
                    <li><a href="schedule1.html">Schedule 1</a></li>
                    <li><a href="schedule2.html">Schedule 2</a></li>
                    <li><a href="schedule3.html">Schedule 3</a></li>
                    <li><a href="schedule4.html">Schedule 4</a></li>
                    <li><a href="event-single.html">Event Single</a></li>
                  </ul>
                </li>
                <li class="list menu-item-parent menu-item-has-children">
                  <a class="animation" href="home-main.html">PORTFOLIO</a>
                  <ul class="main-menu__dropdown sub-menu">
                    <li><a href="portfolio-two-col-grid.html">Standard Two Column</a></li>
                    <li><a href="portfolio-three-col-grid1.html">Standard Three Column</a>
                    </li>
                    <li><a href="portfolio-three-col-grid2.html">Three Column Grid</a></li>
                    <li><a href="portfolio-four-col-grid.html">Four Column Grid</a></li>
                    <li><a href="portfolio-four-col-full-wide.html">Four Column Full Wide</a></li>
                  </ul>
                </li>
                <li class="list menu-item-parent menu-item-has-children">
                  <a class="animation" href="home-main.html">BLOG</a>
                  <ul class="main-menu__dropdown sub-menu">
                    <li><a href="blog-grid.html">Blog Grid</a></li>
                    <li><a href="blog-list.html">Blog List</a></li>
                    <li><a href="blog-single.html">Blog Single</a></li>
                  </ul>
                </li>
                -->
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
                  <a href="/contactanos">CREAR TU EVENTO</a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
      <!--=====================================-->
      <!--=              Navbar End           =-->
      <!--=====================================-->