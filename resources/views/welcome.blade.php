<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Asisstify
  </title>
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="{{ URL::asset('image/icono.png')}}">
  <!-- Dependency Styles -->
  <link rel="stylesheet" href="{{ URL::asset('assets/wow/animate.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('assets/bootstrap/css/bootstrap.min.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('assets/fontawesome/css/all.min.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('assets/magnific-popup/css/magnific-popup.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('assets/swiper/css/swiper.min.css')}}">
  <link rel="stylesheet" href="{{ URL::asset('css/app.css')}}">
  <!-- Google Web Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>

<body>
  <!-- Add your site or application content here -->
  <div id="preloader" class="preloader">
    <div class="preloader-inner-wrap">
      <div class="preloader-inner">
        <div class="main-loader">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
  </div>
  <div class="wrapper" id="wrapper">
    <div id="main_content">
      <!--=====================================-->
      <!--=            Navbar Start           =-->
      <!--=====================================-->
      <header class="header header3 sticky-on">
        <div id="sticky-placeholder"></div>
        <div id="navbar-wrap" class="navbar-wrap">
          <div class="header-menu">
            <div class="d-flex justify-content-between">
              <div class="site-branding">
                <a href="/" class="logo logo-dark"><img src="{{ URL::asset('image/logo-light.svg')}}" alt="Logo" width="200" height="37"></a>
              </div>
              <nav id="dropdown" class="template-main-menu">
                <ul class="menu">
                  <!--
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
                    <a href="/evento">EVENTOS</a>
                    <!--
                      <ul class="sub-menu">
                        <li class="menu-item"><a href="schedule1.html">Schedule 1</a></li>
                        <li class="menu-item"><a href="schedule2.html">Schedule 2</a></li>
                        <li class="menu-item"><a href="schedule3.html">Schedule 3</a></li>
                        <li class="menu-item"><a href="schedule4.html">Schedule 4</a></li>
                        <li class="menu-item"><a href="event-single.html">Event Single</a></li>
                      </ul>
                    -->
                  </li>
                  <li class="menu-item menu-item-has-children">
                    <a href="/asistencia">ASISTENCIAS</a>
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
              <!--
              <ul class="header-action-items">
                <li class="header-contact-info d-none d-xl-flex">
                  <div class="icon-box">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M16.57 22C16.8356 22.0015 17.0989 21.9502 17.3444 21.8489C17.5899 21.7476 17.8128 21.5984 18 21.41L20.71 18.7C20.8963 18.5126 21.0008 18.2592 21.0008 17.995C21.0008 17.7308 20.8963 17.4774 20.71 17.29L16.71 13.29C16.5227 13.1038 16.2692 12.9992 16.005 12.9992C15.7408 12.9992 15.4874 13.1038 15.3 13.29L13.7 14.88C12.5923 14.5846 11.5663 14.0409 10.7 13.29C9.95115 12.4223 9.40766 11.3969 9.11003 10.29L10.7 8.69C10.8863 8.50264 10.9908 8.24919 10.9908 7.985C10.9908 7.72082 10.8863 7.46737 10.7 7.28L6.70003 3.28C6.51267 3.09375 6.25922 2.98921 5.99503 2.98921C5.73085 2.98921 5.4774 3.09375 5.29003 3.28L2.59003 6C2.40167 6.18725 2.25248 6.41013 2.15118 6.65565C2.04988 6.90117 1.9985 7.16441 2.00003 7.43C2.09076 11.2723 3.62611 14.9393 6.30003 17.7C9.06075 20.3739 12.7277 21.9093 16.57 22ZM6.00003 5.41L8.59003 8L7.30003 9.29C7.17785 9.40445 7.08636 9.54774 7.03395 9.70673C6.98153 9.86573 6.96987 10.0353 7.00003 10.2C7.3738 11.8704 8.16514 13.4187 9.30003 14.7C10.5804 15.8364 12.1291 16.6279 13.8 17C13.9622 17.0339 14.1303 17.027 14.2891 16.9799C14.4479 16.9327 14.5926 16.8469 14.71 16.73L16 15.41L18.59 18L16.59 20C13.2738 19.9146 10.1095 18.5911 7.72003 16.29C5.41295 13.8995 4.08564 10.7311 4.00003 7.41L6.00003 5.41ZM20 11H22C22.026 9.811 21.8109 8.62906 21.3678 7.52541C20.9247 6.42176 20.2627 5.41925 19.4217 4.5783C18.5808 3.73735 17.5783 3.07537 16.4746 2.63226C15.371 2.18914 14.189 1.97407 13 2V4C13.9279 3.96791 14.8525 4.12701 15.7163 4.46744C16.5801 4.80786 17.3647 5.32232 18.0212 5.97884C18.6777 6.63537 19.1922 7.41991 19.5326 8.28371C19.873 9.14751 20.0321 10.0721 20 11Z" />
                      <path d="M13 8C15.1 8 16 8.9 16 11H18C18 7.78 16.22 6 13 6V8Z" />
                    </svg>
                  </div>
                  <div class="content-box">
                    <div class="info-title">Call Support</div>
                    <div class="info-description">92 666 888 0000</div>
                  </div>
                </li>
                <li class="search-wrap">
                  <a href="#template-search" title="Search">
                    <svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M20 20L15.514 15.506L20 20ZM18 9.5C18 11.7543 17.1045 13.9163 15.5104 15.5104C13.9163 17.1045 11.7543 18 9.5 18C7.24566 18 5.08365 17.1045 3.48959 15.5104C1.89553 13.9163 1 11.7543 1 9.5C1 7.24566 1.89553 5.08365 3.48959 3.48959C5.08365 1.89553 7.24566 1 9.5 1C11.7543 1 13.9163 1.89553 15.5104 3.48959C17.1045 5.08365 18 7.24566 18 9.5V9.5Z" stroke-width="2" stroke-linecap="round" />
                    </svg>
                  </a>
                </li>
              </ul>
              -->
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
                <li>
                  <a href="/evento">EVENTOS</a>
                </li>
                <li >
                  <a href="/asistencia">ASISTENCIAS</a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
      <!--=====================================-->
      <!--=              Navbar End           =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=      Hero Section Area Start      =-->
      <!--=====================================
        <section class="hero-wrap-layout3" data-bg-image="image/banner/fondo_inicio.jpg">
          <ul class="animated-shape-small has-animation">
            <li>
              <img src="image/elements/element1.png" alt="Animated Figure" width="41" height="41">
            </li>
            <li>
              <img src="image/elements/element2.png" alt="Animated Figure" width="21" height="21">
            </li>
            <li>
              <img src="image/elements/element3.png" alt="Animated Figure" width="18" height="57">
            </li>
            <li>
              <img src="image/elements/element4.png" alt="Animated Figure" width="24" height="24">
            </li>
            <li>
              <img src="image/elements/element5.png" alt="Animated Figure" width="25" height="23">
            </li>
            <li>
              <img src="image/elements/element6.png" alt="Animated Figure" width="34" height="35">
            </li>
            <li>
              <img src="image/elements/element7.png" alt="Animated Figure" width="36" height="36">
            </li>
            <li>
              <img src="image/elements/element8.png" alt="Animated Figure" width="21" height="21">
            </li>
            <li>
              <img src="image/elements/element9.png" alt="Animated Figure" width="63" height="28">
            </li>
          </ul>
          <div class="container">
            <div class="row">
              <div class="col-lg-6">
                <div class="hero-box-layout3">
                  <div class="sub-title wow fadeInLeft animated" data-wow-delay="0.2s" data-wow-duration="1s">LLEVA EL CONTROL DE LAS ASISTENCIAS</div>
                  <h1 class="title wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">EN TUS EVENTOS CON NOSOTROS</h1>-->
                  <!--<p class="description wow fadeInLeft animated" data-wow-delay="0.8s" data-wow-duration="1s">Lorem
                    ipsum dolor sit adipiscing elit luctus fringilla
                    porttitor rhoncus ullamcorper eget nulla facilisi etiam dignissim diam quis enim
                    lobortis scelerisque fermentum ornare quam.</p>--><!--
                  <a href="/evento_crear" class="btn-fill style-two wow fadeInLeft animated" data-wow-delay="1.1s" data-wow-duration="1s">CREA UN EVENTO</a>
                </div>
              </div>
            </div>
          </div>
        </section>
      =====================================-->
      <!--=       Hero Section Area End       =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=     About Section Area Start      =-->
      <!--=====================================-->
      <section class="about-wrap-layout3">
        <div class="container">

          <div class="section-heading style-four">
            <h2 class="title">Eventos <span>pasados</span></h2>
          </div>
          <!--bucle-->
          @if($eventos)
            @foreach($eventos as $e)
              <div class="row">
                <div class="col-lg-6 d-flex align-items-center">
                  <div class="about-box-layout3 has-animation">
                    <div class="figure-box1">
                      <img src="{{ URL::asset('image/eventos/'.$e->foto_logo)}}" alt="About" width="1116" height="1020">
                      <!--
                      <div class="mask-content">
                          <div class="number">{{date('d', strtotime($e->fecha_inicio))}}</div>
                          <div class="text">Noviembre</div>
                        </div>
                      -->
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 d-flex align-items-center">
                  <div class="about-box-layout3">
                    <div class="content-box1">
                      <h2 class="title">{{$e->nombre}}</h2>
                      <p class="description">{{$e->detalle}}.</p>
                      <div class="contact-box">
                        <ul>
                          <li>
                            <div class="icon-box">
                              <i class="far fa-calendar-alt"></i>
                            </div>
                            <h3 class="contact-title">Cuando</h3>
                            <div class="contact-description">{{date('d', strtotime($e->fecha_inicio))}} - {{date('d', strtotime($e->fecha_fin))}} Nov, {{date('Y', strtotime($e->fecha_inicio))}}</div>
                          </li>
                          <li>
                            <div class="icon-box">
                              <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <h3 class="contact-title">Donde</h3>
                            <div class="contact-description">{{$e->lugar_evento}}
                            </div>
                          </li>
                          <li>
                            <div class="icon-box">
                              <i class="fas fa-microphone-alt"></i>
                            </div>
                            <h3 class="contact-title">Dirigido a</h3>
                            <div class="contact-description">{{$e->dirigido_a}}</div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 d-flex align-items-center">
                  <div class="about-box-layout3">
                    <div class="content-box2">
                      <!--<h2 class="title">We can also work with you on bespoke content packages on a
                        global scale.</h2>-->
                      <p class="description">{{$e->detalle_2}}.</p>
                      <a href="/evento/{{$e->url_personalizado}}" class="btn-fill style-one">Ver evento</a>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 d-flex align-items-center">
                  <div class="about-box-layout3 has-animation">
                    <div class="figure-box2">
                      <img src="{{ URL::asset('image/eventos/'.$e->foto_2)}}" alt="About" width="920" height="742">
                      <div class="mask-content">
                        <div class="number">15</div>
                        <div class="text">Ponentes</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            @endforeach
          @endif
        </div>
      </section>
      <!--=====================================-->
      <!--=      About Section Area End       =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=      Two Sections Area Start      =-->
      <!--=====================================
        <div class="twice-section-bg" data-bg-image="image/banner/banner3.jpg">
          <div class="brand-wrap-layout2">
            <div class="container">
              <div class="row row-cols-5 mb-3">
                <div class="col">
                  <div class="brand-box-layout2">
                    <img src="image/brand/1.png" alt="Brand" width="130" height="112">
                  </div>
                </div>
                <div class="col">
                  <div class="brand-box-layout2">
                    <img src="image/brand/2.png" alt="Brand" width="130" height="112">
                  </div>
                </div>
                <div class="col">
                  <div class="brand-box-layout2">
                    <img src="image/brand/3.png" alt="Brand" width="130" height="112">
                  </div>
                </div>
                <div class="col">
                  <div class="brand-box-layout2">
                    <img src="image/brand/4.png" alt="Brand" width="130" height="112">
                  </div>
                </div>
                <div class="col">
                  <div class="brand-box-layout2">
                    <img src="image/brand/5.png" alt="Brand" width="130" height="112">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <section class="service-wrap-layout1">
            <div class="container">
              <div class="section-heading style-five">
                <h2 class="title">Register Today and <span>Get Access To..</span></h2>
              </div>
              <div class="row">
                <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.3s" data-wow-duration="1s">
                  <div class="service-box-layout1 bg-style-one color-one">
                    <div class="icon-box">
                      <svg width="63" height="52" viewBox="0 0 63 52" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M59.783 37.419H3.21737C1.44334 37.419 0 35.9763 0 34.2025V3.78691C0 2.01327 1.44334 0.570312 3.21737 0.570312H59.783C61.5564 0.570312 63 2.01327 63 3.78691V34.2025C63 35.9763 61.5564 37.419 59.783 37.419ZM3.21737 3.16861C2.87614 3.16861 2.59804 3.44594 2.59804 3.78691V34.2025C2.59804 34.5435 2.87614 34.821 3.21737 34.821H59.783C60.1241 34.821 60.4018 34.5435 60.4018 34.2025V3.78691C60.4018 3.44594 60.1242 3.16861 59.783 3.16861H3.21737Z" />
                        <path d="M24.7744 28.8675C24.3478 28.6341 24.0703 28.1991 24.0703 27.7131V10.2764C24.0703 9.79017 24.3421 9.34493 24.7744 9.12185C25.2064 8.89891 25.7263 8.93607 26.1226 9.2179L38.3829 17.9362C38.7259 18.18 38.9291 18.5744 38.9291 18.9949C38.9291 19.4154 38.7259 19.8099 38.3829 20.0536C38.3829 20.0536 29.1872 26.592 26.1226 28.7717C25.8986 28.931 25.4158 29.2186 24.7744 28.8675ZM26.6689 12.7944V25.1952L35.3882 18.9949L26.6689 12.7944Z" />
                        <path d="M61.701 44.7935H36.87C36.2934 42.5846 34.281 40.95 31.8941 40.95C29.5074 40.95 27.4955 42.5846 26.9187 44.7935H1.29909C0.581786 44.7935 0 45.3753 0 46.0926C0 46.8101 0.581786 47.3916 1.29909 47.3916H26.9189C27.4956 49.6005 29.5077 51.2354 31.8942 51.2354C34.2811 51.2354 36.2935 49.6004 36.8702 47.3916H61.701C62.4178 47.3916 63 46.8102 63 46.0926C63 45.3753 62.4178 44.7935 61.701 44.7935ZM31.8941 48.637C30.4916 48.637 29.3499 47.4955 29.3499 46.0924C29.3499 44.6896 30.4916 43.5483 31.8941 43.5483C33.2972 43.5483 34.4386 44.6896 34.4386 46.0924C34.4386 47.4957 33.2972 48.637 31.8941 48.637Z" />
                      </svg>
                    </div>
                    <h3 class="title">High Value Learning</h3>
                    <p class="description">Lorem ipsum dolor amet adds off many the consectetur
                      adipiscing.This pharetra more work this posuere.</p>
                  </div>
                </div>
                <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.5s" data-wow-duration="1s">
                  <div class="service-box-layout1 bg-style-one color-two">
                    <div class="icon-box">
                      <svg width="54" height="55" viewBox="0 0 54 55" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M49.7812 29.7314V21.4374L52.0003 19.6149C52.1044 19.5334 52.1873 19.4279 52.2416 19.3074C52.296 19.1869 52.3203 19.055 52.3125 18.923C52.3035 18.7905 52.2648 18.6616 52.199 18.5462C52.1333 18.4308 52.0422 18.3317 51.9328 18.2564L27.464 2.22519C27.3248 2.13833 27.1641 2.09229 27 2.09229C26.8359 2.09229 26.6751 2.13833 26.5359 2.22519L2.06716 18.2564C1.95771 18.3317 1.8667 18.4308 1.80095 18.5462C1.7352 18.6616 1.69641 18.7905 1.68748 18.923C1.67963 19.055 1.70394 19.1869 1.75831 19.3074C1.81269 19.4279 1.89551 19.5334 1.99966 19.6149L10.9687 26.9555V27.4364C9.83803 29.8383 9.2615 32.4636 9.28175 35.1183C9.30199 37.773 9.9185 40.3891 11.0857 42.7735C12.2529 45.1579 13.941 47.2495 16.0252 48.8939C18.1094 50.5382 20.5364 51.6932 23.127 52.2734C25.7175 52.8537 28.4053 52.8445 30.9918 52.2464C33.5783 51.6483 35.9974 50.4767 38.0702 48.8181C40.143 47.1594 41.8167 45.0562 42.9675 42.6639C44.1182 40.2715 44.7167 37.6512 44.7187 34.9964C44.7255 32.3823 44.149 29.7996 43.0312 27.4364V26.9555L48.0937 22.8127V29.7314L46.0265 33.8658C45.8337 34.2521 45.7428 34.6813 45.7627 35.1126C45.7825 35.5439 45.9123 35.963 46.1398 36.33C46.3672 36.697 46.6848 36.9997 47.0622 37.2093C47.4397 37.4189 47.8645 37.5285 48.2962 37.5277H49.5787C50.0105 37.5285 50.4353 37.4189 50.8127 37.2093C51.1902 36.9997 51.5077 36.697 51.7352 36.33C51.9627 35.963 52.0925 35.5439 52.1123 35.1126C52.1321 34.6813 52.0413 34.2521 51.8484 33.8658L49.7812 29.7314ZM20.2669 34.1527C20.2953 30.7786 20.9002 27.4342 22.0556 24.2639C23.6987 24.1014 25.3489 24.0226 27 24.0277C28.651 24.0226 30.3013 24.1014 31.9444 24.2639C33.0997 27.4342 33.7047 30.7786 33.7331 34.1527H20.2669ZM33.7331 35.8402C33.6973 38.4414 33.3431 41.0285 32.6784 43.5436C28.9995 42.2724 25.0004 42.2724 21.3215 43.5436C20.6569 41.0285 20.3027 38.4414 20.2669 35.8402H33.7331ZM27 22.3402C21.2287 22.3402 15.4322 23.2599 12.6562 25.0233V19.8089C12.6562 18.6614 17.7187 16.4339 27 16.4339C36.2812 16.4339 41.3437 18.6614 41.3437 19.8089V25.0233C38.5678 23.2599 32.7712 22.3402 27 22.3402ZM20.1656 24.4917C19.1503 27.6131 18.6155 30.8706 18.5794 34.1527H10.994C11.0983 32.0167 11.6351 29.9242 12.5718 28.0017C12.6286 27.8863 12.6575 27.7591 12.6562 27.6305V27.4027C12.6562 26.5842 15.2718 25.2089 20.1656 24.4917ZM11.0109 35.8402H18.5794C18.6193 38.6516 19.0133 41.4467 19.7522 44.1596C18.3713 44.7828 17.0756 45.5795 15.8962 46.5305C12.9656 43.7193 11.2183 39.8958 11.0109 35.8402ZM17.1956 47.6527C18.145 46.9115 19.1753 46.2803 20.2669 45.7711C20.8372 47.4719 21.7058 49.0576 22.8319 50.4539C20.7854 49.9045 18.8692 48.9522 17.1956 47.6527ZM27 51.0277C25.11 51.0277 23.144 48.8508 21.8278 45.1552C25.1767 43.9852 28.8233 43.9852 32.1722 45.1552C30.8559 48.8508 28.89 51.0277 27 51.0277ZM31.1681 50.4539C32.2942 49.0576 33.1627 47.4719 33.7331 45.7711C34.8246 46.2803 35.8549 46.9115 36.8044 47.6527C35.1307 48.9522 33.2145 49.9045 31.1681 50.4539ZM38.1037 46.5305C36.9244 45.5795 35.6286 44.7828 34.2478 44.1596C34.9866 41.4467 35.3806 38.6516 35.4206 35.8402H42.989C42.7816 39.8958 41.0343 43.7193 38.1037 46.5305ZM35.4206 34.1527C35.3845 30.8706 34.8496 27.6131 33.8344 24.4917C38.7281 25.2089 41.3437 26.5842 41.3437 27.4027V27.6305C41.3425 27.7591 41.3714 27.8863 41.4281 28.0017C42.3649 29.9242 42.9016 32.0167 43.0059 34.1527H35.4206ZM43.0312 24.7786V19.8089C43.0312 16.4846 34.965 14.7464 27 14.7464C19.035 14.7464 10.9687 16.4846 10.9687 19.8089V24.7786L3.95716 19.0411L27 3.94644L50.0428 19.0411L43.0312 24.7786ZM50.2959 35.4436C50.222 35.5672 50.1168 35.6689 49.9908 35.7386C49.8648 35.8083 49.7226 35.8433 49.5787 35.8402H48.2962C48.1523 35.8433 48.0101 35.8083 47.8842 35.7386C47.7582 35.6689 47.6529 35.5672 47.579 35.4436C47.5022 35.3208 47.4579 35.1804 47.4505 35.0357C47.4431 34.891 47.4729 34.7468 47.5369 34.6167L48.9375 31.8239L50.3381 34.6167C50.4021 34.7468 50.4318 34.891 50.4244 35.0357C50.417 35.1804 50.3728 35.3208 50.2959 35.4436Z" />
                      </svg>
                    </div>
                    <h3 class="title">1-on-1 Sessions</h3>
                    <p class="description">Lorem ipsum dolor amet adds off many the consectetur
                      adipiscing.This pharetra more work this posuere.</p>
                  </div>
                </div>
                <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.7s" data-wow-duration="1s">
                  <div class="service-box-layout1 bg-style-one color-three">
                    <div class="icon-box">
                      <svg width="51" height="52" viewBox="0 0 51 52" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_364:402)">
                          <path d="M25.4999 0.402832C22.6832 0.402832 20.3999 2.68614 20.3999 5.50283C20.3999 8.31952 22.6832 10.6028 25.4999 10.6028C28.3154 10.6001 30.5971 8.31835 30.5999 5.50283C30.5999 2.68614 28.3166 0.402832 25.4999 0.402832ZM25.4999 8.90283C23.6221 8.90283 22.0999 7.38059 22.0999 5.50283C22.0999 3.62508 23.6221 2.10283 25.4999 2.10283C27.3777 2.10283 28.8999 3.62508 28.8999 5.50283C28.8999 7.38059 27.3777 8.90283 25.4999 8.90283Z" />
                          <path d="M28.9001 11.4529H28.6995L28.5201 11.5421C26.6182 12.4891 24.382 12.4891 22.48 11.5421L22.3007 11.4529H22.1001C19.7541 11.4556 17.8529 13.3569 17.8501 15.7029V20.8029C17.8501 22.2112 18.9918 23.3529 20.4001 23.3529H30.6001C32.0084 23.3529 33.1501 22.2112 33.1501 20.8029V15.7029C33.1473 13.3569 31.2461 11.4556 28.9001 11.4529ZM31.4501 20.8029C31.4501 21.2723 31.0695 21.6529 30.6001 21.6529H20.4001C19.9307 21.6529 19.5501 21.2723 19.5501 20.8029V15.7029C19.5503 14.365 20.5844 13.2547 21.919 13.1597C24.1901 14.2137 26.8102 14.2137 29.0811 13.1597C30.4156 13.2547 31.4499 14.365 31.4501 15.7029V20.8029Z" />
                          <path d="M43.35 28.4529C40.5333 28.4529 38.25 30.7362 38.25 33.5529C38.25 36.3696 40.5333 38.6529 43.35 38.6529C46.1667 38.6529 48.45 36.3696 48.45 33.5529C48.4472 30.7374 46.1655 28.4556 43.35 28.4529ZM43.35 36.9529C41.4722 36.9529 39.95 35.4306 39.95 33.5529C39.95 31.6751 41.4722 30.1529 43.35 30.1529C45.2278 30.1529 46.75 31.6751 46.75 33.5529C46.75 35.4306 45.2278 36.9529 43.35 36.9529Z" />
                          <path d="M46.7497 39.5027H46.5491L46.3698 39.5877C44.4678 40.5346 42.2316 40.5346 40.3297 39.5877L40.1503 39.5027H39.9497C37.6037 39.5054 35.7025 41.4067 35.6997 43.7527V48.8527C35.6997 50.261 36.8414 51.4027 38.2497 51.4027H48.4497C49.858 51.4027 50.9997 50.261 50.9997 48.8527V43.7527C50.9969 41.4067 49.0957 39.5054 46.7497 39.5027ZM49.2997 48.8527C49.2997 49.3221 48.9191 49.7027 48.4497 49.7027H38.2497C37.7803 49.7027 37.3997 49.3221 37.3997 48.8527V43.7527C37.3999 42.4148 38.434 41.3045 39.7687 41.2095C42.0397 42.2635 44.6597 42.2635 46.9308 41.2095C48.2654 41.3045 49.2995 42.4148 49.2997 43.7527V48.8527Z" />
                          <path d="M7.65029 28.4529C4.83361 28.4529 2.55029 30.7362 2.55029 33.5529C2.55029 36.3696 4.83361 38.6529 7.65029 38.6529C10.467 38.6529 12.7503 36.3696 12.7503 33.5529C12.7475 30.7374 10.4658 28.4556 7.65029 28.4529ZM7.65029 36.9529C5.77254 36.9529 4.25029 35.4306 4.25029 33.5529C4.25029 31.6751 5.77254 30.1529 7.65029 30.1529C9.52805 30.1529 11.0503 31.6751 11.0503 33.5529C11.0503 35.4306 9.52805 36.9529 7.65029 36.9529Z" />
                          <path d="M11.05 39.5027H10.8494L10.6701 39.5877C8.76807 40.5346 6.53193 40.5346 4.62995 39.5877L4.4506 39.5027H4.25C1.904 39.5054 0.0027625 41.4067 0 43.7527V48.8527C0 50.261 1.14166 51.4027 2.55 51.4027H12.75C14.1583 51.4027 15.3 50.261 15.3 48.8527V43.7527C15.2972 41.4067 13.396 39.5054 11.05 39.5027ZM13.6 48.8527C13.6 49.3221 13.2194 49.7027 12.75 49.7027H2.55C2.08059 49.7027 1.7 49.3221 1.7 48.8527V43.7527C1.70021 42.4148 2.73434 41.3045 4.06895 41.2095C6.34004 42.2635 8.95996 42.2635 11.2311 41.2095C12.5657 41.3045 13.5998 42.4148 13.6 43.7527V48.8527Z" />
                          <path d="M33.9335 43.5696C33.9331 43.5686 33.9327 43.5676 33.9323 43.5666C33.7482 43.1347 33.249 42.9338 32.8172 43.1178C28.9789 44.7264 24.7161 45.0199 20.6936 43.9525L21.4892 43.7187C21.9399 43.5868 22.1983 43.1146 22.0664 42.6639C21.9344 42.2132 21.4622 41.9548 21.0115 42.0867L17.6115 43.0838C17.5988 43.0838 17.5894 43.0982 17.5775 43.1025C17.4988 43.1318 17.4248 43.1728 17.3582 43.224C17.3287 43.24 17.3003 43.2578 17.2732 43.2776C17.1835 43.3576 17.1125 43.4562 17.065 43.5666C17.0188 43.6777 16.9969 43.7974 17.0004 43.9176C17.0211 44.0327 17.0494 44.1463 17.0854 44.2576C17.0905 44.2695 17.0854 44.2831 17.0947 44.295L18.7947 47.548C19.0121 47.9644 19.5258 48.1258 19.9422 47.9084C20.3586 47.691 20.52 47.1773 20.3026 46.7609L19.6107 45.4383C24.1809 46.8121 29.0877 46.5451 33.4819 44.6835C33.9141 44.5006 34.1164 44.0019 33.9335 43.5696Z" />
                          <path d="M48.201 22.7519C47.8691 22.4201 47.331 22.4201 46.9991 22.7519L45.7964 23.9546C45.0926 16.5097 40.3658 10.0491 33.4833 7.12465C33.0513 6.94062 32.5521 7.14154 32.3681 7.57345C32.184 8.00535 32.3849 8.50462 32.8169 8.68865C38.991 11.3127 43.2829 17.0472 44.0598 23.7107L43.101 22.7519C42.7633 22.4257 42.2253 22.4351 41.8991 22.7727C41.581 23.1021 41.581 23.6243 41.8991 23.9538L44.4491 26.5038C44.7806 26.8362 45.3189 26.8369 45.6512 26.5053C45.6517 26.5048 45.6523 26.5042 45.6527 26.5038L48.2027 23.9538C48.5341 23.6215 48.5334 23.0834 48.201 22.7519Z" />
                          <path d="M18.6754 7.76295C18.6727 7.71333 18.6654 7.66414 18.6533 7.6159C18.6533 7.60825 18.644 7.60315 18.6406 7.59465C18.6372 7.58615 18.6406 7.5802 18.6406 7.5734C18.6174 7.53207 18.5907 7.49276 18.5607 7.4561C18.5332 7.40627 18.5007 7.35931 18.4638 7.31585C18.4135 7.27133 18.3579 7.2334 18.298 7.2028C18.2682 7.17741 18.2363 7.15435 18.2029 7.13395L14.8029 5.581C14.3686 5.40271 13.872 5.61022 13.6937 6.04446C13.5251 6.45512 13.7009 6.92645 14.0973 7.1263L15.8577 7.93125C9.23057 11.478 5.09532 18.3862 5.1001 25.9028C5.1001 26.3722 5.48069 26.7528 5.9501 26.7528C6.41951 26.7528 6.8001 26.3722 6.8001 25.9028C6.79585 19.2842 10.2958 13.1579 15.9997 9.8004L15.3851 11.0848C15.1825 11.5073 15.36 12.0141 15.782 12.2178C15.8967 12.2738 16.0225 12.3029 16.1501 12.3028C16.4765 12.3024 16.7738 12.1151 16.9151 11.8209L18.6151 8.2738C18.6151 8.2653 18.6151 8.25595 18.6219 8.24745C18.644 8.18933 18.6594 8.12888 18.6678 8.06725C18.6824 8.02146 18.6932 7.9746 18.7001 7.927C18.6972 7.87165 18.689 7.81671 18.6754 7.76295Z" />
                        </g>
                        <defs>
                          <clipPath id="clip0_364:402">
                            <rect width="51" height="51" fill="white" transform="translate(0 0.402832)" />
                          </clipPath>
                        </defs>
                      </svg>
                    </div>
                    <h3 class="title">Networking People</h3>
                    <p class="description">Lorem ipsum dolor amet adds off many the consectetur
                      adipiscing.This pharetra more work this posuere.</p>
                  </div>
                </div>
                <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.9s" data-wow-duration="1s">
                  <div class="service-box-layout1 bg-style-two color-four">
                    <div class="icon-box">
                      <svg width="51" height="52" viewBox="0 0 51 52" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_366:476)">
                          <path d="M45.1561 42.9028H36.2736C35.3938 42.9028 34.6798 42.1888 34.6798 41.3091C34.6798 40.4293 35.3938 39.7153 36.2736 39.7153H44.0383L47.1302 31.2153H3.86732L6.95919 39.7153H14.7261C15.6058 39.7153 16.3198 40.4293 16.3198 41.3091C16.3198 42.1888 15.6058 42.9028 14.7261 42.9028H5.84357C5.17419 42.9028 4.57494 42.4842 4.34544 41.8531L0.0954427 30.1656C-0.0809323 29.6768 -0.0108073 29.1328 0.288818 28.7057C0.586318 28.2807 1.07294 28.0278 1.59357 28.0278H49.4061C49.9267 28.0278 50.4133 28.2807 50.7108 28.7078C51.0104 29.1328 51.0806 29.679 50.9042 30.1677L46.6542 41.8552C46.4247 42.4842 45.8254 42.9028 45.1561 42.9028Z" />
                          <path d="M34.5332 51.4028C34.4524 51.4028 34.3717 51.3965 34.2888 51.3837C33.4197 51.2498 32.8225 50.436 32.9564 49.5668L34.7988 37.5903H16.2008L18.0432 49.5668C18.177 50.4381 17.5799 51.2498 16.7108 51.3837C15.8417 51.5261 15.0257 50.9226 14.8939 50.0513L12.7689 36.2388C12.6988 35.7798 12.8305 35.3102 13.1344 34.9575C13.4383 34.6047 13.8782 34.4028 14.3435 34.4028H36.656C37.1214 34.4028 37.5634 34.6068 37.8652 34.9596C38.1669 35.3123 38.3008 35.7798 38.2307 36.241L36.1057 50.0535C35.9867 50.8397 35.3067 51.4028 34.5332 51.4028Z" />
                          <path d="M47.8122 30.684C46.9325 30.684 46.2185 29.97 46.2185 29.0903C46.2185 24.8849 43.9702 20.9048 40.3514 18.7012C39.5991 18.2422 39.3611 17.2625 39.8201 16.5103C40.2791 15.758 41.2587 15.52 42.011 15.979C46.5712 18.7585 49.4039 23.7821 49.4039 29.0903C49.406 29.97 48.692 30.684 47.8122 30.684Z" />
                          <path d="M39.3125 19.5278C41.0729 19.5278 42.5 18.1007 42.5 16.3403C42.5 14.5799 41.0729 13.1528 39.3125 13.1528C37.5521 13.1528 36.125 14.5799 36.125 16.3403C36.125 18.1007 37.5521 19.5278 39.3125 19.5278Z" />
                          <path d="M25.5 17.4028C20.8122 17.4028 17 13.5906 17 8.90283C17 4.21508 20.8122 0.402832 25.5 0.402832C30.1877 0.402832 34 4.21508 34 8.90283C34 13.5906 30.1877 17.4028 25.5 17.4028ZM25.5 3.59033C22.5696 3.59033 20.1875 5.97458 20.1875 8.90283C20.1875 11.8311 22.5696 14.2153 25.5 14.2153C28.4304 14.2153 30.8125 11.8311 30.8125 8.90283C30.8125 5.97458 28.4304 3.59033 25.5 3.59033Z" />
                          <path d="M41.4375 31.2153C40.5578 31.2153 39.8438 30.5013 39.8438 29.6216C39.8438 25.8136 36.7455 22.7153 32.9375 22.7153H18.0625C14.2545 22.7153 11.1562 25.8136 11.1562 29.6216C11.1562 30.5013 10.4423 31.2153 9.5625 31.2153C8.68275 31.2153 7.96875 30.5013 7.96875 29.6216C7.96875 24.0562 12.4971 19.5278 18.0625 19.5278H32.9375C38.5029 19.5278 43.0312 24.0562 43.0312 29.6216C43.0312 30.5013 42.3172 31.2153 41.4375 31.2153Z" />
                        </g>
                        <defs>
                          <clipPath id="clip0_366:476">
                            <rect width="51" height="51" fill="white" transform="translate(0 0.402832)" />
                          </clipPath>
                        </defs>
                      </svg>
                    </div>
                    <h3 class="title">Great Speakers</h3>
                    <p class="description">Lorem ipsum dolor amet adds off many the consectetur
                      adipiscing.This pharetra more work this posuere.</p>
                  </div>
                </div>
                <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="1.1s" data-wow-duration="1s">
                  <div class="service-box-layout1 bg-style-two color-five">
                    <div class="icon-box">
                      <svg width="51" height="52" viewBox="0 0 51 52" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_366:484)">
                          <path d="M6.53905 37.7603C6.62422 37.8442 6.72675 37.9091 6.83961 37.9496V50.5562C6.83961 51.0238 7.21872 51.4029 7.6863 51.4029H46.6342C47.1018 51.4029 47.4809 51.0238 47.4809 50.5562V30.2355C47.4809 29.768 47.1018 29.3888 46.6342 29.3888H42.3941C43.2524 28.2693 44.0941 26.9182 44.0941 26.0021C44.0933 24.5939 43.221 23.3334 41.9038 22.8361C40.5862 22.3387 39.0987 22.7083 38.1673 23.7642C37.2358 22.7083 35.7483 22.3387 34.4307 22.8361C33.1136 23.3334 32.2412 24.5939 32.2404 26.0021C32.2404 26.9182 33.0821 28.2693 33.9404 29.3888H16.1073L19.7095 25.7871L25.6963 19.7999L37.6711 7.82504C38.0015 7.49471 38.0015 6.9585 37.6711 6.62818L31.6843 0.640964C31.3482 0.323455 30.8228 0.323455 30.4871 0.640964L22.5973 8.53034C19.8323 6.36565 16.5369 5.01251 14.9204 6.62818C13.8596 7.68902 14.0832 9.47791 14.9737 11.3635L11.2757 15.0629C9.3892 14.1728 7.5999 13.9487 6.53905 15.0104C4.92422 16.624 6.27735 19.921 8.44246 22.6856L0.552254 30.5741C0.221514 30.9049 0.221514 31.4407 0.552254 31.7714L6.53905 37.7603ZM33.9338 26.0021C33.9338 25.0669 34.692 24.3087 35.6272 24.3087C36.5623 24.3087 37.3206 25.0669 37.3206 26.0021V26.2307C37.3206 26.6983 37.6997 27.0774 38.1673 27.0774C38.6348 27.0774 39.0139 26.6983 39.0139 26.2307V26.0021C39.0139 25.0669 39.7722 24.3087 40.7073 24.3087C41.6425 24.3087 42.4007 25.0669 42.4007 26.0021C41.9149 27.2754 41.1629 28.4301 40.1943 29.3888H36.1402C35.172 28.4301 34.4196 27.2754 33.9338 26.0021ZM31.3937 31.0822H45.7875V49.7095H31.3937V31.0822ZM24.6202 31.0822H29.7003V49.7095H24.6202V31.0822ZM22.9268 31.0822V49.7095H8.533V37.0091H8.48628L14.4598 31.0363V31.0822H22.9268ZM19.1117 23.9903L14.3218 19.2004L19.1117 14.4109L23.9012 19.2004L19.1117 23.9903ZM31.0857 2.43688L35.8752 7.22681L25.0985 18.0031L20.309 13.2169L31.0857 2.43688ZM16.1177 7.82504C16.3203 7.66215 16.5782 7.58443 16.8375 7.60758C17.7813 7.60758 19.4292 8.22482 21.3917 9.73547L18.5131 12.6141L18.0285 13.0991C15.9837 10.4449 15.5757 8.36704 16.1177 7.82504ZM15.8316 12.9052C16.1346 13.3811 16.4666 13.8519 16.8238 14.3084L14.2151 16.9171C13.7587 16.5599 13.2882 16.2279 12.8132 15.924L15.8316 12.9052ZM7.73633 16.2076C7.93849 16.0447 8.19564 15.9666 8.45445 15.9898C9.39912 15.9898 11.0479 16.6062 13.0104 18.1177L12.5258 18.6018L9.64718 21.4809C7.60155 18.8263 7.19433 16.7484 7.73633 16.2076ZM13.1245 20.3977L17.9144 25.1876L7.13769 35.9644L2.3523 31.1744L13.1245 20.3977Z" />
                          <path d="M44.941 11.9105C44.0096 10.8546 42.5221 10.485 41.2045 10.9824C39.8873 11.4797 39.015 12.7403 39.0142 14.1484C39.0142 15.9873 43.0124 20.9219 44.941 20.9219C46.8696 20.9219 50.8679 15.9873 50.8679 14.1484C50.867 12.7403 49.9947 11.4797 48.6775 10.9824C47.36 10.485 45.8725 10.8546 44.941 11.9105ZM49.1745 14.1484C49.1559 15.21 45.9002 19.1041 44.9547 19.2285C43.9819 19.1033 40.7262 15.2092 40.7075 14.1484C40.7075 13.2132 41.4658 12.455 42.4009 12.455C43.3361 12.455 44.0943 13.2132 44.0943 14.1484V14.377C44.0943 14.8446 44.4734 15.2237 44.941 15.2237C45.4086 15.2237 45.7877 14.8446 45.7877 14.377V14.1484C45.7877 13.2132 46.5459 12.455 47.4811 12.455C48.4163 12.455 49.1745 13.2132 49.1745 14.1484Z" />
                          <path d="M44.941 3.14136C44.4734 3.14136 44.0943 3.52047 44.0943 3.98805V4.83474H43.2476C42.78 4.83474 42.4009 5.21385 42.4009 5.68144C42.4009 6.14902 42.78 6.52813 43.2476 6.52813H44.0943V7.37482C44.0943 7.84241 44.4734 8.22152 44.941 8.22152C45.4085 8.22152 45.7877 7.84241 45.7877 7.37482V6.52813H46.6343C47.1019 6.52813 47.481 6.14902 47.481 5.68144C47.481 5.21385 47.1019 4.83474 46.6343 4.83474H45.7877V3.98805C45.7877 3.52047 45.4085 3.14136 44.941 3.14136Z" />
                          <path d="M33.9341 16.6885C33.9341 17.1561 33.555 17.5352 33.0874 17.5352C32.6198 17.5352 32.2407 17.1561 32.2407 16.6885C32.2407 16.2209 32.6198 15.8418 33.0874 15.8418C33.555 15.8418 33.9341 16.2209 33.9341 16.6885Z" />
                          <path d="M26.3135 27.6954C26.7811 27.6954 27.1602 27.3163 27.1602 26.8487V26.002H28.0069C28.4745 26.002 28.8536 25.6229 28.8536 25.1553C28.8536 24.6877 28.4745 24.3086 28.0069 24.3086H27.1602V23.4619C27.1602 22.9943 26.7811 22.6152 26.3135 22.6152C25.8459 22.6152 25.4668 22.9943 25.4668 23.4619V24.3086H24.6201C24.1525 24.3086 23.7734 24.6877 23.7734 25.1553C23.7734 25.6229 24.1525 26.002 24.6201 26.002H25.4668V26.8487C25.4668 27.3163 25.8459 27.6954 26.3135 27.6954Z" />
                          <path d="M49.1744 25.1555C49.1744 25.6231 48.7952 26.0022 48.3277 26.0022C47.8601 26.0022 47.481 25.6231 47.481 25.1555C47.481 24.6879 47.8601 24.3088 48.3277 24.3088C48.7952 24.3088 49.1744 24.6879 49.1744 25.1555Z" />
                        </g>
                        <defs>
                          <clipPath id="clip0_366:484">
                            <rect width="51" height="51" fill="white" transform="translate(0 0.402832)" />
                          </clipPath>
                        </defs>
                      </svg>
                    </div>
                    <h3 class="title">Exaiting Giveways</h3>
                    <p class="description">Lorem ipsum dolor amet adds off many the consectetur
                      adipiscing.This pharetra more work this posuere.</p>
                  </div>
                </div>
                <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="1.3s" data-wow-duration="1s">
                  <div class="service-box-layout1 bg-style-two color-six">
                    <div class="icon-box">
                      <svg width="64" height="65" viewBox="0 0 64 65" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_366:522)">
                          <path d="M46.5363 6.74756H3.60388C1.61663 6.74756 0 8.36419 0 10.3513V36.1084C0 38.0955 1.61663 39.7122 3.60388 39.7122H6.38776V49.301C6.38776 49.9115 6.75551 50.4621 7.31976 50.6959C7.50652 50.7734 7.70277 50.8109 7.89727 50.8109C8.29027 50.8109 8.67627 50.6574 8.96514 50.3686L19.6215 39.7124H21.7595C22.5934 39.7124 23.2693 39.0365 23.2693 38.2026C23.2693 37.3686 22.5932 36.6927 21.7595 36.6927C21.7595 36.6927 18.9233 36.6947 18.8937 36.6977C18.5422 36.7216 18.1972 36.8664 17.9284 37.135L9.40727 45.6561C9.40727 45.6561 9.40464 38.1071 9.39977 38.068C9.33164 37.2972 8.68514 36.6927 7.89677 36.6927H3.60388C3.28163 36.6927 3.01963 36.4306 3.01963 36.1085V10.3513C3.01963 10.0291 3.28176 9.76706 3.60388 9.76706H46.5363C46.8586 9.76706 47.1206 10.0292 47.1206 10.3513V20.2332C47.1206 21.0671 47.7967 21.743 48.6303 21.743C49.464 21.743 50.1401 21.0671 50.1401 20.2332V10.3513C50.1401 8.36419 48.5235 6.74756 46.5363 6.74756Z" />
                          <path d="M60.3965 25.2144H30.3446C28.3575 25.2144 26.7407 26.831 26.7407 28.8182V46.3895C26.7407 48.3767 28.3573 49.9934 30.3446 49.9934H49.1589L56.7814 57.6159C57.0703 57.9048 57.4564 58.0582 57.8493 58.0582C58.0438 58.0582 58.24 58.0205 58.4268 57.9432C58.9908 57.7094 59.3588 57.159 59.3588 56.5483V49.9933H60.3964C62.3835 49.9933 64.0003 48.3767 64.0003 46.3894V28.8181C64.0004 26.831 62.3838 25.2144 60.3965 25.2144ZM60.9809 46.3895C60.9809 46.7117 60.7188 46.9738 60.3967 46.9738H57.8497C57.0552 46.9738 56.4054 47.5878 56.3458 48.3672C56.3419 48.4002 56.3394 52.9034 56.3394 52.9034L50.8576 47.4215C50.8519 47.4158 50.8459 47.4104 50.8401 47.4047C50.8186 47.3837 50.7983 47.3654 50.779 47.349C50.5133 47.116 50.1661 46.9737 49.7851 46.9737H30.3446C30.0224 46.9737 29.7604 46.7115 29.7604 46.3894V28.8181C29.7604 28.4959 30.0225 28.2339 30.3446 28.2339H60.3967C60.7188 28.2339 60.9809 28.496 60.9809 28.8181V46.3895Z" />
                          <path d="M45.3706 36.0942C44.5372 36.0942 43.8608 36.7706 43.8608 37.604C43.8608 38.4374 44.5372 39.1138 45.3706 39.1138C46.2041 39.1138 46.8803 38.4374 46.8803 37.604C46.8803 36.7706 46.204 36.0942 45.3706 36.0942Z" />
                          <path d="M38.8093 16.7292H11.3315C10.4978 16.7292 9.82178 17.4051 9.82178 18.239C9.82178 19.0729 10.4979 19.7488 11.3315 19.7488H38.8093C39.6431 19.7488 40.3191 19.0729 40.3191 18.239C40.3191 17.4051 39.6431 16.7292 38.8093 16.7292Z" />
                          <path d="M21.7597 26.7109H11.3315C10.4978 26.7109 9.82178 27.3868 9.82178 28.2207C9.82178 29.0546 10.4979 29.7304 11.3315 29.7304H21.7597C22.5936 29.7304 23.2694 29.0546 23.2694 28.2207C23.2694 27.3868 22.5934 26.7109 21.7597 26.7109Z" />
                          <path d="M38.355 36.0942C37.5217 36.0942 36.8452 36.7706 36.8452 37.604C36.8452 38.4374 37.5217 39.1138 38.355 39.1138C39.1885 39.1138 39.8647 38.4374 39.8647 37.604C39.8647 36.7706 39.1885 36.0942 38.355 36.0942Z" />
                          <path d="M52.3848 36.0942C51.5514 36.0942 50.875 36.7706 50.875 37.604C50.875 38.4374 51.5514 39.1138 52.3848 39.1138C53.2183 39.1138 53.8945 38.4374 53.8945 37.604C53.8945 36.7706 53.2181 36.0942 52.3848 36.0942Z" />
                        </g>
                        <defs>
                          <clipPath id="clip0_366:522">
                            <rect width="64" height="64" fill="white" transform="translate(0 0.402832)" />
                          </clipPath>
                        </defs>
                      </svg>
                    </div>
                    <h3 class="title">Live Q&A</h3>
                    <p class="description">Lorem ipsum dolor amet adds off many the consectetur
                      adipiscing.This pharetra more work this posuere.</p>
                  </div>
                </div>
              </div>
              <div class="mt-4 d-flex flex-wrap align-items-center justify-content-center">
                <div class="register-content"><i class="fas fa-circle"></i>Register today for the price
                  of $59</div>
                <a href="contact.html" class="btn-fill style-two">REGISTER</a>
              </div>
            </div>
          </section>
        </div>
      <=====================================-->
      <!--=       Two Sections Area End       =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=  Testimonials Section Area Start  =-->
      <!--=====================================
        <section class="testimonials-wrap-layout2">
          <div class="container">
            <div class="section-heading style-four">
              <h2 class="title">What our Attendees <span>Have to Say</span></h2>
            </div>
            <div class="sliderTestimonialOne swiper-container mb-5">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <div class="testimonial-box-layout2">
                    <div class="icon-box">
                      <svg width="56" height="57" viewBox="0 0 56 57" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_375:665)">
                          <path d="M55.9876 17.6591C55.9876 17.653 55.9882 17.647 55.9882 17.6409C55.9882 10.2785 50.02 4.3103 42.6576 4.3103C35.2953 4.3103 29.3271 10.2784 29.3271 17.6409C29.3271 25.0034 35.2959 30.9715 42.6577 30.9715C44.1708 30.9715 45.6192 30.7077 46.9744 30.243C43.9753 47.4483 30.5584 58.5439 42.9957 49.412C56.7869 39.2857 56.003 18.0476 55.9876 17.6591Z" fill="#EE0034" />
                          <path d="M13.3306 30.9714C14.8437 30.9714 16.2921 30.7076 17.648 30.2429C14.648 47.4482 1.23112 58.5438 13.6685 49.4119C27.4598 39.2857 26.676 18.0476 26.6604 17.6591C26.6604 17.653 26.6611 17.647 26.6611 17.6409C26.6611 10.2785 20.693 4.3103 13.3306 4.3103C5.96811 4.3103 0 10.2784 0 17.6409C0 25.0034 5.96877 30.9714 13.3306 30.9714Z" fill="#EE0034" />
                        </g>
                        <defs>
                          <clipPath id="clip0_375:665">
                            <rect width="56" height="56" fill="white" transform="translate(0 0.5)" />
                          </clipPath>
                        </defs>
                      </svg>
                    </div>
                    <p class="description">Lorem ipsum dolor sit amet consectetur the more as
                      adipiscing
                      elit ut aliquam purus sit amet luctus venenatis lectus magna fringilla urna
                      at
                      porttitor rhoncus.</p>
                    <div class="d-flex justify-content-center">
                      <div class="figure-box">
                        <img src="image/testimonial/1.jpg" alt="testimonial" width="65" height="65">
                      </div>
                      <div class="content-box">
                        <h3 class="title">Neel Eonathon</h3>
                        <div class="designation">Computer Member</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="testimonial-box-layout2">
                    <div class="icon-box">
                      <svg width="56" height="57" viewBox="0 0 56 57" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_375:666)">
                          <path d="M55.9876 17.6591C55.9876 17.653 55.9882 17.647 55.9882 17.6409C55.9882 10.2785 50.02 4.3103 42.6576 4.3103C35.2953 4.3103 29.3271 10.2784 29.3271 17.6409C29.3271 25.0034 35.2959 30.9715 42.6577 30.9715C44.1708 30.9715 45.6192 30.7077 46.9744 30.243C43.9753 47.4483 30.5584 58.5439 42.9957 49.412C56.7869 39.2857 56.003 18.0476 55.9876 17.6591Z" fill="#EE0034" />
                          <path d="M13.3306 30.9714C14.8437 30.9714 16.2921 30.7076 17.648 30.2429C14.648 47.4482 1.23112 58.5438 13.6685 49.4119C27.4598 39.2857 26.676 18.0476 26.6604 17.6591C26.6604 17.653 26.6611 17.647 26.6611 17.6409C26.6611 10.2785 20.693 4.3103 13.3306 4.3103C5.96811 4.3103 0 10.2784 0 17.6409C0 25.0034 5.96877 30.9714 13.3306 30.9714Z" fill="#EE0034" />
                        </g>
                        <defs>
                          <clipPath id="clip0_375:666">
                            <rect width="56" height="56" fill="white" transform="translate(0 0.5)" />
                          </clipPath>
                        </defs>
                      </svg>
                    </div>
                    <p class="description">Lorem ipsum dolor sit amet consectetur the more as
                      adipiscing
                      elit ut aliquam purus sit amet luctus venenatis lectus magna fringilla urna
                      at
                      porttitor rhoncus.</p>
                    <div class="d-flex justify-content-center">
                      <div class="figure-box">
                        <img src="image/testimonial/2.jpg" alt="testimonial" width="65" height="65">
                      </div>
                      <div class="content-box">
                        <h3 class="title">Leslie Alexander</h3>
                        <div class="designation">CEO Of Ac Tex</div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="testimonial-box-layout2">
                    <div class="icon-box">
                      <svg width="56" height="57" viewBox="0 0 56 57" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_375:667)">
                          <path d="M55.9876 17.6591C55.9876 17.653 55.9882 17.647 55.9882 17.6409C55.9882 10.2785 50.02 4.3103 42.6576 4.3103C35.2953 4.3103 29.3271 10.2784 29.3271 17.6409C29.3271 25.0034 35.2959 30.9715 42.6577 30.9715C44.1708 30.9715 45.6192 30.7077 46.9744 30.243C43.9753 47.4483 30.5584 58.5439 42.9957 49.412C56.7869 39.2857 56.003 18.0476 55.9876 17.6591Z" fill="#EE0034" />
                          <path d="M13.3306 30.9714C14.8437 30.9714 16.2921 30.7076 17.648 30.2429C14.648 47.4482 1.23112 58.5438 13.6685 49.4119C27.4598 39.2857 26.676 18.0476 26.6604 17.6591C26.6604 17.653 26.6611 17.647 26.6611 17.6409C26.6611 10.2785 20.693 4.3103 13.3306 4.3103C5.96811 4.3103 0 10.2784 0 17.6409C0 25.0034 5.96877 30.9714 13.3306 30.9714Z" fill="#EE0034" />
                        </g>
                        <defs>
                          <clipPath id="clip0_375:667">
                            <rect width="56" height="56" fill="white" transform="translate(0 0.5)" />
                          </clipPath>
                        </defs>
                      </svg>
                    </div>
                    <p class="description">Lorem ipsum dolor sit amet consectetur the more as
                      adipiscing
                      elit ut aliquam purus sit amet luctus venenatis lectus magna fringilla urna
                      at
                      porttitor rhoncus.</p>
                    <div class="d-flex justify-content-center">
                      <div class="figure-box">
                        <img src="image/testimonial/1.jpg" alt="testimonial" width="65" height="65">
                      </div>
                      <div class="content-box">
                        <h3 class="title">Neel Eonathon</h3>
                        <div class="designation">Computer Member</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="text-center">
              <a href="contact.html" class="btn-fill style-one">REGISTER</a>
            </div>
          </div>
        </section>
      =====================================-->
      <!--=   Testimonials Section Area End   =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=      Venue Section Area Start     =-->
      <!--=====================================
        <section class="venue-wrap-layout1">
          <div class="container">
            <div class="section-heading style-four">
              <h2 class="title">Explore Beautiful <span>Venues</span></h2>
            </div>
            <div class="row">
              <div class="col-lg-6 wow fadeInUp animated" data-wow-delay="0.3s" data-wow-duration="1s">
                <div class="venue-box-layout1">
                  <div class="figure-box">
                    <a href="event-single.html" class="link"><img src="image/venu/1.jpg" alt="Venue" width="1116" height="780"></a>
                  </div>
                  <div class="content-box">
                    <div class="venu-number">Venue : 1</div>
                    <h3 class="title"><a href="event-single.html">Blue Harbor Skylines 2021</a></h3>
                    <div class="location"><i class="fas fa-map-marker-alt"></i>California, USA</div>
                    <div class="video"><a class="video-link" href="event-single.html"><i class="fas fa-play"></i></a><span
                                  class="text">Virtual Tour</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 wow fadeInUp animated" data-wow-delay="0.5s" data-wow-duration="1s">
                <div class="venue-box-layout1">
                  <div class="figure-box">
                    <a href="event-single.html" class="link"><img src="image/venu/2.jpg" alt="Venue" width="1116" height="780"></a>
                  </div>
                  <div class="content-box">
                    <div class="venu-number">Venue : 2</div>
                    <h3 class="title"><a href="event-single.html">Daniel fernandes Cecilia.</a></h3>
                    <div class="location"><i class="fas fa-map-marker-alt"></i>California, USA</div>
                    <div class="video"><a class="video-link" href="event-single.html"><i class="fas fa-play"></i></a><span
                                  class="text">Virtual Tour</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      =====================================-->
      <!--=       Venue Section Area End      =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=    Schedule Section Area Start    =-->
      <!--=====================================
        <section class="schedule-wrap-layout3">
          <div class="container">
            <div class="section-heading style-five">
              <h2 class="title">Commerce <span>Roundtable</span></h2>
            </div>
            <div class="row justify-content-center">
              <div class="col-lg-10">
                <div class="schedule-slider-main-wrap">
                  <div class="schedule-slider-thumbnail-style-1 swiper-container schedule-box-layout3 schedule-nav">
                    <div class="swiper-wrapper">
                      <div class="swiper-slide">
                        S4: Mon, Mar 28th
                      </div>
                      <div class="swiper-slide">
                        S3: Tue, Mar 29th
                      </div>
                      <div class="swiper-slide">
                        S4: Wen, Mar 30th
                      </div>
                      <div class="swiper-slide">
                        S4: Fri, Mar 31th
                      </div>
                    </div>
                  </div>
                  <span class="slider-btn slider-btn-prev">
                      <i class="fas fa-chevron-left"></i>
                  </span>
                  <span class="slider-btn slider-btn-next">
                      <i class="fas fa-chevron-right"></i>
                  </span>
                </div>
                <div class="shcedule-slider-style-1 swiper-container schedule-box-layout3 schedule-content">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <div class="panel-group" id="accordionExample">
                        <div class="panel panel-default wow fadeInUp animated" data-wow-delay="0.3s" data-wow-duration="1s">
                          <div class="panel-heading" id="headingOne">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">
                              <div class="date-time-wrap">
                                <div class="date">21</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/37.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Developer VR Programming</h3>
                                  <div class="sub-title">By <span>Kathryn
                                                          Murphy</span> VP
                                    Design Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A ,
                                  Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default wow fadeInUp animated" data-wow-delay="0.5s" data-wow-duration="1s">
                          <div class="panel-heading" id="headingTwo">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" role="button">
                              <div class="date-time-wrap">
                                <div class="date">22</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/38.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Top executive & start up here
                                  </h3>
                                  <div class="sub-title">By <span>Marvin
                                                          McKinney</span>
                                    Co-founder Zipcar
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A ,
                                  Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default wow fadeInUp animated" data-wow-delay="0.7s" data-wow-duration="1s">
                          <div class="panel-heading" id="headingThree">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree" role="button">
                              <div class="date-time-wrap">
                                <div class="date">23</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/39.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Talks from Leading IT Use
                                    Minds
                                  </h3>
                                  <div class="sub-title">By <span>Courtney
                                                          Henry</span>
                                    Content Writer Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A ,
                                  Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default wow fadeInUp animated" data-wow-delay="0.9s" data-wow-duration="1s">
                          <div class="panel-heading" id="headingFour">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour" role="button">
                              <div class="date-time-wrap">
                                <div class="date">24</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/40.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Clients in Control Building ..
                                  </h3>
                                  <div class="sub-title">By <span>Dianne
                                                          Russell</span>
                                    Co-founder Blackbox</div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A ,
                                  Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="panel-group" id="accordionExampleB">
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingOneB">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOneB" aria-expanded="true" aria-controls="collapseOneB" role="button">
                              <div class="date-time-wrap">
                                <div class="date">25</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/37.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Developer VR Programming</h3>
                                  <div class="sub-title">By <span>Kathryn
                                                          Murphy</span> VP
                                    Design Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseOneB" class="accordion-collapse collapse" aria-labelledby="headingOneB" data-bs-parent="#accordionExampleB">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingTwoB">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwoB" aria-expanded="true" aria-controls="collapseTwoB" role="button">
                              <div class="date-time-wrap">
                                <div class="date">26</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/38.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Top executive & start up here</h3>
                                  <div class="sub-title">By <span>Marvin
                                                          McKinney</span>
                                    Co-founder Zipcar
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseTwoB" class="accordion-collapse collapse" aria-labelledby="headingTwoB" data-bs-parent="#accordionExampleB">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingThreeB">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThreeB" aria-expanded="true" aria-controls="collapseThreeB" role="button">
                              <div class="date-time-wrap">
                                <div class="date">27</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/39.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Talks from Leading IT Use Minds
                                  </h3>
                                  <div class="sub-title">By <span>Courtney
                                                          Henry</span>
                                    Content Writer Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseThreeB" class="accordion-collapse collapse" aria-labelledby="headingThreeB" data-bs-parent="#accordionExampleB">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingFourB">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFourB" aria-expanded="true" aria-controls="collapseFourB" role="button">
                              <div class="date-time-wrap">
                                <div class="date">28</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/40.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Clients in Control Building ..
                                  </h3>
                                  <div class="sub-title">By <span>Dianne
                                                          Russell</span>
                                    Co-founder Blackbox</div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseFourB" class="accordion-collapse collapse" aria-labelledby="headingFourB" data-bs-parent="#accordionExampleB">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="panel-group" id="accordionExampleC">
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingOneC">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOneC" aria-expanded="true" aria-controls="collapseOneC" role="button">
                              <div class="date-time-wrap">
                                <div class="date">11</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/37.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Developer VR Programming</h3>
                                  <div class="sub-title">By <span>Kathryn
                                                          Murphy</span> VP
                                    Design Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseOneC" class="accordion-collapse collapse" aria-labelledby="headingOneC" data-bs-parent="#accordionExampleC">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingTwoC">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwoC" aria-expanded="true" aria-controls="collapseTwoC" role="button">
                              <div class="date-time-wrap">
                                <div class="date">12</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/38.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Top executive & start up here</h3>
                                  <div class="sub-title">By <span>Marvin
                                                          McKinney</span>
                                    Co-founder Zipcar
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseTwoC" class="accordion-collapse collapse" aria-labelledby="headingTwoC" data-bs-parent="#accordionExampleC">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingThreeC">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThreeC" aria-expanded="true" aria-controls="collapseThreeC" role="button">
                              <div class="date-time-wrap">
                                <div class="date">13</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/39.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Talks from Leading IT Use Minds
                                  </h3>
                                  <div class="sub-title">By <span>Courtney
                                                          Henry</span>
                                    Content Writer Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseThreeC" class="accordion-collapse collapse" aria-labelledby="headingThreeC" data-bs-parent="#accordionExampleC">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingFourC">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFourC" aria-expanded="true" aria-controls="collapseFourC" role="button">
                              <div class="date-time-wrap">
                                <div class="date">14</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/40.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Clients in Control Building ..
                                  </h3>
                                  <div class="sub-title">By <span>Dianne
                                                          Russell</span>
                                    Co-founder Blackbox</div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseFourC" class="accordion-collapse collapse" aria-labelledby="headingFourC" data-bs-parent="#accordionExampleC">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="panel-group" id="accordionExampleD">
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingOneD">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOneD" aria-expanded="true" aria-controls="collapseOneD" role="button">
                              <div class="date-time-wrap">
                                <div class="date">15</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/37.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Developer VR Programming</h3>
                                  <div class="sub-title">By <span>Kathryn
                                                          Murphy</span> VP
                                    Design Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseOneD" class="accordion-collapse collapse" aria-labelledby="headingOneD" data-bs-parent="#accordionExampleD">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingTwoD">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwoD" aria-expanded="true" aria-controls="collapseTwoD" role="button">
                              <div class="date-time-wrap">
                                <div class="date">16</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/38.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Top executive & start up here</h3>
                                  <div class="sub-title">By <span>Marvin
                                                          McKinney</span>
                                    Co-founder Zipcar
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseTwoD" class="accordion-collapse collapse" aria-labelledby="headingTwoD" data-bs-parent="#accordionExampleD">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingThreeD">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThreeD" aria-expanded="true" aria-controls="collapseThreeD" role="button">
                              <div class="date-time-wrap">
                                <div class="date">17</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/39.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Talks from Leading IT Use Minds
                                  </h3>
                                  <div class="sub-title">By <span>Courtney
                                                          Henry</span>
                                    Content Writer Microsoft
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseThreeD" class="accordion-collapse collapse" aria-labelledby="headingThreeD" data-bs-parent="#accordionExampleD">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="panel panel-default">
                          <div class="panel-heading" id="headingFourD">
                            <div class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFourD" aria-expanded="true" aria-controls="collapseFourD" role="button">
                              <div class="date-time-wrap">
                                <div class="date">18</div>
                                <div>
                                  <div class="month">November</div>
                                  <div class="time">09:30 - 10:30 AM</div>
                                </div>
                              </div>
                              <div class="content-box-wrap">
                                <div class="figure-box">
                                  <img src="image/speaker/40.jpg" alt="Speaker" width="60" height="60">
                                </div>
                                <div class="inner-box">
                                  <h3 class="title">Clients in Control Building ..
                                  </h3>
                                  <div class="sub-title">By <span>Dianne
                                                          Russell</span>
                                    Co-founder Blackbox</div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div id="collapseFourD" class="accordion-collapse collapse" aria-labelledby="headingFourD" data-bs-parent="#accordionExampleD">
                            <div class="panel-body">
                              <p class="description">Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now. Lorem ipsum dolor sit amet
                                consectetur
                                adipiscing elit ut aliquam
                                purus sit amet luctus venenatis lectus magna the
                                fringilla urna
                                porttitor more ready now.</p>
                              <div class="address-wrap">
                                <div class="icon-box">
                                  <svg width="14" height="19" viewBox="0 0 14 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.04688 17.8984C6.36328 18.3906 7.10156 18.3906 7.41797 17.8984C12.5508 10.5156 13.5 9.74219 13.5 7C13.5 3.27344 10.4766 0.25 6.75 0.25C2.98828 0.25 0 3.27344 0 7C0 9.74219 0.914062 10.5156 6.04688 17.8984ZM6.75 9.8125C5.16797 9.8125 3.9375 8.58203 3.9375 7C3.9375 5.45312 5.16797 4.1875 6.75 4.1875C8.29688 4.1875 9.5625 5.45312 9.5625 7C9.5625 8.58203 8.29688 9.8125 6.75 9.8125Z" />
                                  </svg>
                                </div>
                                <div class="address-text">Hall 1, Building A , Golden
                                  Street ,
                                  Southafrica</div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="text-center mt-4 wow fadeInUp animated" data-wow-delay="1.1s" data-wow-duration="1s">
                  <a href="event-single.html" class="btn-fill style-four">VIEW FULL SCHEDULE</a>
                </div>
              </div>
            </div>
          </div>
        </section>
      =====================================-->
      <!--=     Schedule Section Area End     =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=    Speaker Section Area Start     =-->
      <!--=====================================
        <section class="speaker-wrap-layout3">
          <div class="container">
            <div class="section-heading style-four">
              <h2 class="title">Who's <span>Speaking?</span></h2>
            </div>
            <div class="row g-0 child-items-wrap">
              <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.3s" data-wow-duration="1s">
                <div class="speaker-box-layout3 animated-bg-wrap">
                  <span class="animated-bg"></span>
                  <div class="figure-box">
                    <a href="speaker-single.html"><img src="image/speaker/19.jpg" alt="Speaker" width="267" height="267"></a>
                  </div>
                  <div class="content-box">
                    <h3 class="title"><a href="speaker-single.html">Cameron Williamson</a></h3>
                    <div class="sub-title">Brand Manager Apple</div>
                    <div class="speaker-social">
                      <ul>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/radiustheme"><i class="fab fa-twitter"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a target="_blank" href="https://www.pinterest.com/radius_theme"><i class="fab fa-pinterest"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-instagram"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.5s" data-wow-duration="1s">
                <div class="speaker-box-layout3 animated-bg-wrap">
                  <span class="animated-bg"></span>
                  <div class="figure-box">
                    <a href="speaker-single.html"><img src="image/speaker/20.jpg" alt="Speaker" width="267" height="267"></a>
                  </div>
                  <div class="content-box">
                    <h3 class="title"><a href="speaker-single.html">Marvin McKinney</a></h3>
                    <div class="sub-title">Co-founder Zipcar</div>
                    <div class="speaker-social">
                      <ul>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/radiustheme"><i class="fab fa-twitter"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a target="_blank" href="https://www.pinterest.com/radius_theme"><i class="fab fa-pinterest"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-instagram"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.7s" data-wow-duration="1s">
                <div class="speaker-box-layout3 animated-bg-wrap">
                  <span class="animated-bg"></span>
                  <div class="figure-box">
                    <a href="speaker-single.html"><img src="image/speaker/21.jpg" alt="Speaker" width="267" height="267"></a>
                  </div>
                  <div class="content-box">
                    <h3 class="title"><a href="speaker-single.html">Kathryn Murphy</a></h3>
                    <div class="sub-title">VP Design Microsoft</div>
                    <div class="speaker-social">
                      <ul>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/radiustheme"><i class="fab fa-twitter"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a target="_blank" href="https://www.pinterest.com/radius_theme"><i class="fab fa-pinterest"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-instagram"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="0.9s" data-wow-duration="1s">
                <div class="speaker-box-layout3 animated-bg-wrap">
                  <span class="animated-bg"></span>
                  <div class="figure-box">
                    <a href="speaker-single.html"><img src="image/speaker/22.jpg" alt="Speaker" width="267" height="267"></a>
                  </div>
                  <div class="content-box">
                    <h3 class="title"><a href="speaker-single.html">Savannah Nguyen</a></h3>
                    <div class="sub-title">Head Engineering Ajex</div>
                    <div class="speaker-social">
                      <ul>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/radiustheme"><i class="fab fa-twitter"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a target="_blank" href="https://www.pinterest.com/radius_theme"><i class="fab fa-pinterest"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-instagram"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="1.1s" data-wow-duration="1s">
                <div class="speaker-box-layout3 animated-bg-wrap">
                  <span class="animated-bg"></span>
                  <div class="figure-box">
                    <a href="speaker-single.html"><img src="image/speaker/23.jpg" alt="Speaker" width="267" height="267"></a>
                  </div>
                  <div class="content-box">
                    <h3 class="title"><a href="speaker-single.html">Courtney Henry</a></h3>
                    <div class="sub-title">Content Writer</div>
                    <div class="speaker-social">
                      <ul>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/radiustheme"><i class="fab fa-twitter"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a target="_blank" href="https://www.pinterest.com/radius_theme"><i class="fab fa-pinterest"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-instagram"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-md-6 col-12 wow fadeInUp animated" data-wow-delay="1.3s" data-wow-duration="1s">
                <div class="speaker-box-layout3 animated-bg-wrap">
                  <span class="animated-bg"></span>
                  <div class="figure-box">
                    <a href="speaker-single.html"><img src="image/speaker/24.jpg" alt="Speaker" width="267" height="267"></a>
                  </div>
                  <div class="content-box">
                    <h3 class="title"><a href="speaker-single.html">Ronald Richards</a></h3>
                    <div class="sub-title">Brand Manager Olex</div>
                    <div class="speaker-social">
                      <ul>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a target="_blank" href="https://twitter.com/radiustheme"><i class="fab fa-twitter"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a target="_blank" href="https://www.pinterest.com/radius_theme"><i class="fab fa-pinterest"></i></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/radiustheme"><i class="fab fa-instagram"></i></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="mt-5 d-flex align-items-center justify-content-center">
              <div class="register-content"><i class="fas fa-circle"></i>Reserve your Digital Event Saason
                5</div>
              <a href="contact.html" class="btn-fill style-one">REGISTER</a>
            </div>
          </div>
        </section>
        =====================================-->
      <!--=     Speaker Section Area End      =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=     Event Section Area Start      =-->
      <!--=====================================
        <section class="event-wrap-layout1">
          <div class="container-fluid">
            <div class="section-heading style-four">
              <h2 class="title">A Collection of <span>Recent Event</span></h2>
            </div>
            <div class="sliderEventOne swiper-container">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <div class="event-box-layout1">
                    <div class="figure-box">
                      <a href="event-single.html"><img src="image/gallery/13.jpg" alt="Event" width="900" height="1080"></a>
                    </div>
                    <div class="content-box">
                      <div class="me-3">
                        <div class="sub-title">Thought Leadership</div>
                        <h3 class="title"><a href="event-single.html">Marketing Advice</a></h3>
                      </div>
                      <a href="event-single.html" class="btn-icon">
                        <svg width="13" height="14" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M11.0322 7.04186L6.23594 11.3482C6.19912 11.381 6.15215 11.3994 6.10264 11.3994H4.9791C4.88516 11.3994 4.84199 11.2786 4.91309 11.2156L9.35898 7.22309H1.92969C1.87383 7.22309 1.82812 7.17581 1.82812 7.11803V6.33004C1.82812 6.27226 1.87383 6.22498 1.92969 6.22498H9.35771L4.91182 2.23252C4.84072 2.16817 4.88389 2.04866 4.97783 2.04866H6.13945C6.16357 2.04866 6.1877 2.05785 6.20547 2.07493L11.0322 6.40622C11.0762 6.44575 11.1114 6.49458 11.1356 6.54941C11.1597 6.60424 11.1722 6.66379 11.1722 6.72404C11.1722 6.78429 11.1597 6.84384 11.1356 6.89866C11.1114 6.95349 11.0762 7.00232 11.0322 7.04186Z" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="event-box-layout1">
                    <div class="figure-box">
                      <a href="event-single.html"><img src="image/gallery/14.jpg" alt="Event" width="900" height="1080"></a>
                    </div>
                    <div class="content-box">
                      <div class="me-3">
                        <div class="sub-title">Designing / Graphics</div>
                        <h3 class="title"><a href="event-single.html">Fimlor Experience</a></h3>
                      </div>
                      <a href="event-single.html" class="btn-icon">
                        <svg width="13" height="14" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M11.0322 7.04186L6.23594 11.3482C6.19912 11.381 6.15215 11.3994 6.10264 11.3994H4.9791C4.88516 11.3994 4.84199 11.2786 4.91309 11.2156L9.35898 7.22309H1.92969C1.87383 7.22309 1.82812 7.17581 1.82812 7.11803V6.33004C1.82812 6.27226 1.87383 6.22498 1.92969 6.22498H9.35771L4.91182 2.23252C4.84072 2.16817 4.88389 2.04866 4.97783 2.04866H6.13945C6.16357 2.04866 6.1877 2.05785 6.20547 2.07493L11.0322 6.40622C11.0762 6.44575 11.1114 6.49458 11.1356 6.54941C11.1597 6.60424 11.1722 6.66379 11.1722 6.72404C11.1722 6.78429 11.1597 6.84384 11.1356 6.89866C11.1114 6.95349 11.0762 7.00232 11.0322 7.04186Z" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="event-box-layout1">
                    <div class="figure-box">
                      <a href="event-single.html"><img src="image/gallery/15.jpg" alt="Event" width="900" height="1080"></a>
                    </div>
                    <div class="content-box">
                      <div class="me-3">
                        <div class="sub-title">Business Strategy</div>
                        <h3 class="title"><a href="event-single.html">Finance Consulting</a></h3>
                      </div>
                      <a href="event-single.html" class="btn-icon">
                        <svg width="13" height="14" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M11.0322 7.04186L6.23594 11.3482C6.19912 11.381 6.15215 11.3994 6.10264 11.3994H4.9791C4.88516 11.3994 4.84199 11.2786 4.91309 11.2156L9.35898 7.22309H1.92969C1.87383 7.22309 1.82812 7.17581 1.82812 7.11803V6.33004C1.82812 6.27226 1.87383 6.22498 1.92969 6.22498H9.35771L4.91182 2.23252C4.84072 2.16817 4.88389 2.04866 4.97783 2.04866H6.13945C6.16357 2.04866 6.1877 2.05785 6.20547 2.07493L11.0322 6.40622C11.0762 6.44575 11.1114 6.49458 11.1356 6.54941C11.1597 6.60424 11.1722 6.66379 11.1722 6.72404C11.1722 6.78429 11.1597 6.84384 11.1356 6.89866C11.1114 6.95349 11.0762 7.00232 11.0322 7.04186Z" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="event-box-layout1">
                    <div class="figure-box">
                      <a href="event-single.html"><img src="image/gallery/16.jpg" alt="Event" width="900" height="1080"></a>
                    </div>
                    <div class="content-box">
                      <div class="me-3">
                        <div class="sub-title">Extra Briliant</div>
                        <h3 class="title"><a href="event-single.html">Top-notch Consultation</a></h3>
                      </div>
                      <a href="event-single.html" class="btn-icon">
                        <svg width="13" height="14" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M11.0322 7.04186L6.23594 11.3482C6.19912 11.381 6.15215 11.3994 6.10264 11.3994H4.9791C4.88516 11.3994 4.84199 11.2786 4.91309 11.2156L9.35898 7.22309H1.92969C1.87383 7.22309 1.82812 7.17581 1.82812 7.11803V6.33004C1.82812 6.27226 1.87383 6.22498 1.92969 6.22498H9.35771L4.91182 2.23252C4.84072 2.16817 4.88389 2.04866 4.97783 2.04866H6.13945C6.16357 2.04866 6.1877 2.05785 6.20547 2.07493L11.0322 6.40622C11.0762 6.44575 11.1114 6.49458 11.1356 6.54941C11.1597 6.60424 11.1722 6.66379 11.1722 6.72404C11.1722 6.78429 11.1597 6.84384 11.1356 6.89866C11.1114 6.95349 11.0762 7.00232 11.0322 7.04186Z" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>
        </section>
      -=====================================-->
      <!--=      Event Section Area End       =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=      Blog Section Area Start      =-->
      <!--=====================================
        <section class="blog-wrap-layout3">
          <div class="container">
            <div class="section-heading style-four">
              <h2 class="title">Recent Blog <span>Posts</span></h2>
            </div>
            <div class="row">
              <div class="col-lg-6 wow fadeInUp animated" data-wow-delay="0.3s" data-wow-duration="1s">
                <div class="blog-box-layout3">
                  <div class="figure-box">
                    <a href="blog-single.html" class="link-wrap"><img src="image/blog/blog-figure-7.jpg" alt="blog" width="1116" height="600"></a>
                    <div class="entry-date-wrap">
                      <svg width="68" height="81" viewBox="0 0 68 81" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M3.8147e-05 81C0.112061 81 0.24276 81 0.373459 81C0.504158 81 0.61618 81 0.728203 81L33.4772 81L34.5415 81L67.2718 81C67.3839 81 67.5146 81 67.6266 81C67.7573 81 67.888 81 68 81C67.4959 80.1115 67.1411 79.3738 66.9171 78.8708C65.3114 75.2664 64.9566 72.1816 64.9753 70.7063C64.9753 70.0692 64.9753 69.4489 64.9753 68.8119L64.9753 0.762855C61.4651 3.91466 57.9737 5.92647 54.4635 9.06152L43.821 0.645507L34 8.34062L24.1791 0.645506L13.5366 9.06151C10.0264 5.9097 6.53491 3.8979 3.02475 0.762853L3.02475 68.8286C3.02475 69.4657 3.02475 70.086 3.02475 70.7231C3.02475 72.1984 2.68868 75.2831 1.08296 78.8876C0.85891 79.3906 0.504158 80.1282 3.8147e-05 81Z" />
                      </svg>
                      <div class="entry-date">23<span>Jun</span></div>
                    </div>
                  </div>
                  <div class="content-box">
                    <div class="entry-meta mb-1">
                      <ul>
                        <li><a href="blog-single.html"><i class="far fa-user"></i>Jenny Wilson</a></li>
                        <li><a href="blog-single.html"><i class="fas fa-tags"></i>Technology</a></li>
                      </ul>
                    </div>
                    <h3 class="entry-title"><a href="blog-single.html">Chances are Good that there’s a Cloud this
                        Amazing
                        Software..</a></h3>
                    <p class="entry-description">Lorem ipsum dolor sit amet consectetur adipiscing
                      elit ut aliquam purus amet lectus magna fringilla porttitor.</p>
                    <a href="blog-single.html" class="btn-text style-one">READ MORE</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 wow fadeInUp animated" data-wow-delay="0.5s" data-wow-duration="1s">
                <div class="blog-box-layout3">
                  <div class="figure-box">
                    <a href="blog-single.html" class="link-wrap"><img src="image/blog/blog-figure-8.jpg" alt="blog" width="1116" height="600"></a>
                    <div class="entry-date-wrap">
                      <svg width="68" height="81" viewBox="0 0 68 81" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M3.8147e-05 81C0.112061 81 0.24276 81 0.373459 81C0.504158 81 0.61618 81 0.728203 81L33.4772 81L34.5415 81L67.2718 81C67.3839 81 67.5146 81 67.6266 81C67.7573 81 67.888 81 68 81C67.4959 80.1115 67.1411 79.3738 66.9171 78.8708C65.3114 75.2664 64.9566 72.1816 64.9753 70.7063C64.9753 70.0692 64.9753 69.4489 64.9753 68.8119L64.9753 0.762855C61.4651 3.91466 57.9737 5.92647 54.4635 9.06152L43.821 0.645507L34 8.34062L24.1791 0.645506L13.5366 9.06151C10.0264 5.9097 6.53491 3.8979 3.02475 0.762853L3.02475 68.8286C3.02475 69.4657 3.02475 70.086 3.02475 70.7231C3.02475 72.1984 2.68868 75.2831 1.08296 78.8876C0.85891 79.3906 0.504158 80.1282 3.8147e-05 81Z" />
                      </svg>
                      <div class="entry-date">23<span>Jun</span></div>
                    </div>
                  </div>
                  <div class="content-box">
                    <div class="entry-meta mb-1">
                      <ul>
                        <li><a href="blog-single.html"><i class="far fa-user"></i>Jenny Wilson</a></li>
                        <li><a href="blog-single.html"><i class="fas fa-tags"></i>Technology</a></li>
                      </ul>
                    </div>
                    <h3 class="entry-title"><a href="blog-single.html">Many of those more Valuable Products Offer
                        Potential not
                        just to...</a></h3>
                    <p class="entry-description">Lorem ipsum dolor sit amet consectetur adipiscing
                      elit ut aliquam purus amet lectus magna fringilla porttitor.</p>
                    <a href="blog-single.html" class="btn-text style-one">READ MORE</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      =====================================-->
      <!--=       Blog Section Area End       =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=     Footer Section Area Start     =-->
      <!--=====================================-->
      <footer class="footer-wrap-layout3" data-bg-image="image/banner/footer-bg1.jpg">
        <div class="container">
          <!--
            <div class="footer3 footer-top">
              <div class="row align-items-center">
                <div class="col-lg-6 wow fadeInLeft animated" data-wow-delay="0.3s" data-wow-duration="1s">
                  <h2 class="title">Are You Ready for Next Season</h2>
                  <div class="list-description">
                    <p class="description">Lorem ipsum dolor sit amet consectetur adipiscing elit
                      aliquam thae purus sit amet luctus venenatis lectus magna fringilla urna
                      porttitor rhoncus dolor purus enim praesent elementum facilisis fringilla
                      facilisi dignissim
                      diam more....
                    </p>
                    <p class="description">‘’Lorem ipsum dolor sit amet consectetur adipiscing elit
                      aliquam thae purus sit amet luctus venenatis lectus magna fringilla urna
                      fringilla facilisi dignissim diam more’’</p>
                  </div>
                </div>
                <div class="col-lg-5 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
                  <div class="pricing-box">
                    <div class="price">$59</div>
                    <div class="time-info">
                      <ul>
                        <li>Tue, May 25, 2021</li>
                        <li>8.30 AM - 2:00 PM EST</li>
                      </ul>
                    </div>
                    <div class="price-info">
                      <ul>
                        <li>
                          <div class="info-icon">
                            <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M11 1.375C5.68477 1.375 1.375 5.68477 1.375 11C1.375 16.3152 5.68477 20.625 11 20.625C16.3152 20.625 20.625 16.3152 20.625 11C20.625 5.68477 16.3152 1.375 11 1.375ZM15.1572 7.85684L10.6326 14.1303C10.5694 14.2185 10.486 14.2905 10.3894 14.3401C10.2928 14.3897 10.1858 14.4156 10.0772 14.4156C9.96866 14.4156 9.86165 14.3897 9.76506 14.3401C9.66848 14.2905 9.58511 14.2185 9.52188 14.1303L6.84277 10.4178C6.76113 10.3039 6.84277 10.1449 6.98242 10.1449H7.99004C8.20918 10.1449 8.41758 10.2502 8.54648 10.4307L10.0762 12.5533L13.4535 7.86973C13.5824 7.69141 13.7887 7.58398 14.01 7.58398H15.0176C15.1572 7.58398 15.2389 7.74297 15.1572 7.85684Z" />
                            </svg>
                          </div>
                          <span class="info-text">6 curated educational sessions</span>
                        </li>
                        <li>
                          <div class="info-icon">
                            <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M11 1.375C5.68477 1.375 1.375 5.68477 1.375 11C1.375 16.3152 5.68477 20.625 11 20.625C16.3152 20.625 20.625 16.3152 20.625 11C20.625 5.68477 16.3152 1.375 11 1.375ZM15.1572 7.85684L10.6326 14.1303C10.5694 14.2185 10.486 14.2905 10.3894 14.3401C10.2928 14.3897 10.1858 14.4156 10.0772 14.4156C9.96866 14.4156 9.86165 14.3897 9.76506 14.3401C9.66848 14.2905 9.58511 14.2185 9.52188 14.1303L6.84277 10.4178C6.76113 10.3039 6.84277 10.1449 6.98242 10.1449H7.99004C8.20918 10.1449 8.41758 10.2502 8.54648 10.4307L10.0762 12.5533L13.4535 7.86973C13.5824 7.69141 13.7887 7.58398 14.01 7.58398H15.0176C15.1572 7.58398 15.2389 7.74297 15.1572 7.85684Z" />
                            </svg>
                          </div>
                          <span class="info-text">Learn from experts with 100+ years combined
                                          experience.</span>
                        </li>
                        <li>
                          <div class="info-icon">
                            <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M11 1.375C5.68477 1.375 1.375 5.68477 1.375 11C1.375 16.3152 5.68477 20.625 11 20.625C16.3152 20.625 20.625 16.3152 20.625 11C20.625 5.68477 16.3152 1.375 11 1.375ZM15.1572 7.85684L10.6326 14.1303C10.5694 14.2185 10.486 14.2905 10.3894 14.3401C10.2928 14.3897 10.1858 14.4156 10.0772 14.4156C9.96866 14.4156 9.86165 14.3897 9.76506 14.3401C9.66848 14.2905 9.58511 14.2185 9.52188 14.1303L6.84277 10.4178C6.76113 10.3039 6.84277 10.1449 6.98242 10.1449H7.99004C8.20918 10.1449 8.41758 10.2502 8.54648 10.4307L10.0762 12.5533L13.4535 7.86973C13.5824 7.69141 13.7887 7.58398 14.01 7.58398H15.0176C15.1572 7.58398 15.2389 7.74297 15.1572 7.85684Z" />
                            </svg>
                          </div>
                          <span class="info-text">5+ hours of valuable content</span>
                        </li>
                        <li>
                          <div class="info-icon">
                            <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M11 1.375C5.68477 1.375 1.375 5.68477 1.375 11C1.375 16.3152 5.68477 20.625 11 20.625C16.3152 20.625 20.625 16.3152 20.625 11C20.625 5.68477 16.3152 1.375 11 1.375ZM15.1572 7.85684L10.6326 14.1303C10.5694 14.2185 10.486 14.2905 10.3894 14.3401C10.2928 14.3897 10.1858 14.4156 10.0772 14.4156C9.96866 14.4156 9.86165 14.3897 9.76506 14.3401C9.66848 14.2905 9.58511 14.2185 9.52188 14.1303L6.84277 10.4178C6.76113 10.3039 6.84277 10.1449 6.98242 10.1449H7.99004C8.20918 10.1449 8.41758 10.2502 8.54648 10.4307L10.0762 12.5533L13.4535 7.86973C13.5824 7.69141 13.7887 7.58398 14.01 7.58398H15.0176C15.1572 7.58398 15.2389 7.74297 15.1572 7.85684Z" />
                            </svg>
                          </div>
                          <span class="info-text">8 high-tech giveways</span>
                        </li>
                      </ul>
                    </div>
                    <a href="contact.html" class="btn-fill style-one">REGISTERED</a>
                  </div>
                </div>
              </div>
            </div>
          -->
          <div class="footer3 footer-middle">
            <div class="row">
              <div class="col-lg-3 wow fadeInLeft animated" data-wow-delay="0.3s" data-wow-duration="1s">
                <div class="footer-widgets">
                  <h3 class="widget-title">¿Quieres crear un evento?</h3>
                  <p>Dale clic al botón contáctanos.</p>
                  <div class="footer-newsletter">
                    <form><!--
                      <input type="email" class="form-control" placeholder="Email">-->
                      <a href="https://api.whatsapp.com/send?phone=51923366555&text=%C2%A1Hola!%0AQuisiera%20crear%20un%20evento%20en%20*Asisstify*%20%F0%9F%98%84%0A%C2%BFMe%20puedes%20ayudar%3F" target="_blanck" class="btn-fill style-three">CONTÁCTANOS</a>
                    </form>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
                <div class="footer-widgets">
                  <h3 class="widget-title">Servicios</h3>
                  <div class="footer-menu">
                    <ul>
                      <!--<li><a href="contact.html">Ingresar</a></li>
                      <li><a href="contact.html">Registrarse</a></li>
                      <li><a href="about.html">Sobre Asisstify</a></li>-->
                      <li><a href="/evento">Eventos</a></li>
                      <li><a href="/asistencia">Asistencias</a></li>
                      <li><a href="https://api.whatsapp.com/send?phone=51923366555&text=%C2%A1Hola!%0AQuisiera%20crear%20un%20evento%20en%20*Asisstify*%20%F0%9F%98%84%0A%C2%BFMe%20puedes%20ayudar%3F" >Contáctanos</a></li>
                      <!--<li><a href="contact.html">¿Cómo funciona?</a></li>-->
                    </ul>
                  </div>
                </div>
              </div>
              <!--
                <div class="col-lg-3 wow fadeInLeft animated" data-wow-delay="0.7s" data-wow-duration="1s">
                  <div class="footer-widgets">
                    <h3 class="widget-title">Useful Links</h3>
                    <div class="footer-menu">
                      <ul>
                        <li><a href="brand.html">Sponsors</a></li>
                        <li><a href="speaker.html">Speakers</a></li>
                        <li><a href="contact.html">Registration</a></li>
                        <li><a href="schedule1.html">Schedule</a></li>
                        <li><a href="gallery.html">Event Gallery</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              -->
              <!--
                <div class="col-lg-3 wow fadeInLeft animated" data-wow-delay="0.9s" data-wow-duration="1s">
                  <div class="footer-widgets">
                    <h3 class="widget-title">Contact Info</h3>
                    <div class="footer-address">
                      <ul>
                        <li>
                          <div class="icon-box">
                            <svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M14.4988 19.2499C14.7312 19.2512 14.9615 19.2063 15.1763 19.1176C15.3912 19.029 15.5862 18.8985 15.75 18.7336L18.1213 16.3624C18.2843 16.1984 18.3757 15.9767 18.3757 15.7455C18.3757 15.5143 18.2843 15.2926 18.1213 15.1286L14.6213 11.6286C14.4573 11.4657 14.2356 11.3742 14.0044 11.3742C13.7732 11.3742 13.5515 11.4657 13.3875 11.6286L11.9875 13.0199C11.0183 12.7614 10.1206 12.2857 9.36253 11.6286C8.70726 10.8694 8.23171 9.97213 7.97128 9.00363L9.36253 7.60363C9.5255 7.43969 9.61697 7.21792 9.61697 6.98675C9.61697 6.75559 9.5255 6.53382 9.36253 6.36988L5.86253 2.86988C5.69859 2.70691 5.47682 2.61544 5.24565 2.61544C5.01449 2.61544 4.79272 2.70691 4.62878 2.86988L2.26628 5.24988C2.10146 5.41372 1.97092 5.60874 1.88228 5.82357C1.79365 6.0384 1.74869 6.26874 1.75003 6.50113C1.82941 9.86314 3.17284 13.0718 5.51253 15.4874C7.92816 17.8271 11.1368 19.1705 14.4988 19.2499ZM5.25003 4.73363L7.51628 6.99988L6.38753 8.12863C6.28062 8.22877 6.20057 8.35415 6.1547 8.49327C6.10884 8.63239 6.09864 8.78079 6.12503 8.92488C6.45208 10.3865 7.1445 11.7412 8.13753 12.8624C9.25784 13.8567 10.6129 14.5493 12.075 14.8749C12.2169 14.9045 12.364 14.8985 12.503 14.8572C12.642 14.816 12.7685 14.7409 12.8713 14.6386L14 13.4836L16.2663 15.7499L14.5163 17.4999C11.6145 17.4252 8.84585 16.2671 6.75503 14.2536C4.73633 12.162 3.57494 9.3896 3.50003 6.48363L5.25003 4.73363ZM17.5 9.62488H19.25C19.2727 8.5845 19.0845 7.5503 18.6968 6.58461C18.3091 5.61892 17.7299 4.74172 16.994 4.00589C16.2582 3.27006 15.381 2.69082 14.4153 2.3031C13.4496 1.91538 12.4154 1.72719 11.375 1.74988V3.49988C12.1869 3.47179 12.996 3.61101 13.7518 3.90888C14.5076 4.20675 15.1941 4.65691 15.7685 5.23136C16.343 5.80582 16.7932 6.4923 17.091 7.24812C17.3889 8.00395 17.5281 8.81296 17.5 9.62488Z" />
                              <path d="M11.375 7C13.2125 7 14 7.7875 14 9.625H15.75C15.75 6.8075 14.1925 5.25 11.375 5.25V7Z" />
                            </svg>
                          </div>
                          <span class="text-box">(541)754-3010</span>
                        </li>
                        <li>
                          <div class="icon-box">
                            <svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <g clip-path="url(#clip0_424:102)">
                                <path d="M14.4235 10.479L19.8056 5.803V15.1016L14.4235 10.479ZM7.48825 11.2709L9.37825 12.9115C9.67487 13.1635 10.0616 13.3158 10.4843 13.3158H10.4991H10.4982H10.5105C10.934 13.3158 11.3207 13.1626 11.6209 12.9089L11.6182 12.9106L13.5082 11.27L19.2535 16.2041H1.74562L7.48825 11.2709ZM1.73775 4.69437H19.264L10.8456 12.0059C10.751 12.0807 10.6338 12.1214 10.5131 12.1214H10.5009H10.5017H10.4895C10.3684 12.1215 10.2508 12.0805 10.1561 12.005L10.157 12.0059L1.73775 4.69437ZM1.19437 5.80213L6.57562 10.4781L1.19437 15.0981V5.80213ZM20.0944 3.66625C19.8844 3.56125 19.6376 3.5 19.376 3.5H1.62662C1.37302 3.50006 1.12289 3.55907 0.896 3.67238L0.905625 3.668C0.634002 3.80197 0.405254 4.00923 0.245222 4.26636C0.0851906 4.5235 0.00025143 4.82026 0 5.12313L0 15.7736C0.000463228 16.2047 0.171896 16.6179 0.476683 16.9227C0.78147 17.2275 1.19472 17.3989 1.62575 17.3994H19.3734C19.8044 17.3989 20.2177 17.2275 20.5224 16.9227C20.8272 16.6179 20.9987 16.2047 20.9991 15.7736V5.12663V5.12313C20.9991 4.487 20.6325 3.93575 20.0987 3.67063L20.0891 3.66625H20.0944Z" />
                              </g>
                              <defs>
                                <clipPath id="clip0_424:102">
                                  <rect width="21" height="21" fill="white" />
                                </clipPath>
                              </defs>
                            </svg>
                          </div>
                          <span class="text-box">websiteinfo@gmail.com</span>
                        </li>
                        <li>
                          <div class="icon-box">
                            <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M6.32987 4.94839C8.09889 3.17937 10.4982 2.18555 13 2.18555C15.5017 2.18555 17.901 3.17937 19.67 4.94839C21.4391 6.7174 22.4329 9.1167 22.4329 11.6185C22.4329 14.1202 21.4391 16.5195 19.67 18.2886L18.3841 19.5604C17.4362 20.4899 16.2066 21.6859 14.6943 23.1484C14.2398 23.5879 13.6322 23.8336 13 23.8336C12.3677 23.8336 11.7602 23.5879 11.3056 23.1484L7.52371 19.4694C7.04812 19.0025 6.65054 18.6092 6.32987 18.2886C5.45391 17.4126 4.75905 16.3728 4.28497 15.2283C3.8109 14.0839 3.56689 12.8572 3.56689 11.6185C3.56689 10.3797 3.8109 9.15308 4.28497 8.00862C4.75905 6.86416 5.45391 5.82429 6.32987 4.94839ZM18.5206 6.09672C17.0562 4.63255 15.07 3.8101 12.9992 3.8103C10.9283 3.8105 8.94238 4.63334 7.47821 6.0978C6.01404 7.56226 5.19159 9.54838 5.19179 11.6192C5.19199 13.6901 6.01483 15.676 7.47929 17.1402L9.08912 18.7306C10.2011 19.8171 11.3163 20.9004 12.4345 21.9806C12.586 22.1272 12.7886 22.2091 12.9994 22.2091C13.2103 22.2091 13.4128 22.1272 13.5644 21.9806L17.2412 18.4056C17.7504 17.9061 18.1761 17.4847 18.5195 17.1402C19.9837 15.676 20.8062 13.6902 20.8062 11.6196C20.8062 9.54892 19.9837 7.56308 18.5195 6.09889L18.5206 6.09672ZM13 8.6653C13.427 8.6653 13.8499 8.74942 14.2445 8.91286C14.6391 9.0763 14.9976 9.31585 15.2996 9.61784C15.6016 9.91983 15.8411 10.2783 16.0046 10.6729C16.168 11.0675 16.2521 11.4904 16.2521 11.9175C16.2521 12.3446 16.168 12.7674 16.0046 13.162C15.8411 13.5566 15.6016 13.9151 15.2996 14.2171C14.9976 14.5191 14.6391 14.7586 14.2445 14.9221C13.8499 15.0855 13.427 15.1696 13 15.1696C12.1479 15.1541 11.3359 14.8047 10.7388 14.1966C10.1417 13.5885 9.80714 12.7703 9.80714 11.918C9.80714 11.0658 10.1417 10.2476 10.7388 9.63946C11.3359 9.03136 12.1479 8.68194 13 8.66639V8.6653ZM13 10.2903C12.7863 10.2903 12.5747 10.3324 12.3773 10.4142C12.1798 10.4959 12.0005 10.6158 11.8494 10.7669C11.6983 10.918 11.5784 11.0974 11.4967 11.2948C11.4149 11.4922 11.3728 11.7038 11.3728 11.9175C11.3728 12.1312 11.4149 12.3427 11.4967 12.5402C11.5784 12.7376 11.6983 12.917 11.8494 13.0681C12.0005 13.2191 12.1798 13.339 12.3773 13.4208C12.5747 13.5025 12.7863 13.5446 13 13.5446C13.4314 13.5446 13.8451 13.3733 14.1502 13.0682C14.4552 12.7632 14.6266 12.3494 14.6266 11.918C14.6266 11.4866 14.4552 11.0729 14.1502 10.7678C13.8451 10.4628 13.4314 10.2914 13 10.2914V10.2903Z" />
                            </svg>
                          </div>
                          <span class="text-box">5151 State Los Angeles California, TX
                                          90032</span>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              -->
            </div>
          </div>
          <div class="footer3 footer-bottom">
            <div class="d-flex flex-wrap align-items-center justify-content-between">
              <a href="/" class="footer-logo me-4"><img src="{{ URL::asset('image/logo-light.svg')}}" alt="Footer Logo" width="200" height="37"></a>
              <div class="copyright-text">All Rights Reserved &copy;<span id="currentYear"></span>. Desarrollado por<a href="https://.tinq.pe" class="link-text" rel="nofollow">tinq.pe</a></div>
            </div>
          </div>
        </div>
      </footer>
      <!--=====================================-->
      <!--=      Footer Section Area End      =-->
      <!--=====================================-->
    </div>
    <!-- Offcanvas Menu Start 
      <div class="offcanvas-menu-wrap" id="offcanvas-wrap" data-position="right">
        <div class="offcanvas-header">
          <span class="header-text">Close</span>
          <button type="button" class="offcanvas-menu-btn menu-status-close offcanvas-close">
            <span class="menu-btn-icon">
                <span></span>
            <span></span>
            <span></span>
            </span>
          </button>
        </div>
        <div class="offcanvas-content">
          <div class="top-content">
            <div class="offcanvas-logo">
              <a href="/"><img src="image/logo-light.svg" alt="logo" width="200" height="37"></a>
            </div>
            <p>Lorem ipsum dolor sit, consectetur iscing sed diam nonummy nibh euismo Lorem ipsum dolor sit,
              consectetur</p>
          </div>
          <h2>@my_event_day</h2>
          <div class="sub-title">Event Details</div>
          <ul class="info">
            <li>Sunday, 05 November 2017</li>
            <li>2:00 PM – 3:30 PM</li>
            <li>Mas Montagnette,</li>
            <li>198 West 21th Street, NY</li>
            <li>+1 485-048-1995</li>
          </ul>
          <a href="contact.html" class="text-btn">View map</a>
        </div>
        <div class="offcanvas-footer">
          <ul>
            <li>
              <a target="_blank" href="https://www.facebook.com/radiustheme">Facebook</a>
            </li>
            <li>
              <a target="_blank" href="https://twitter.com/radiustheme">Twitter</a>
            </li>
            <li>
              <a target="_blank" href="https://www.pinterest.com/radius_theme/">Pinterest</a>
            </li>
            <li>
              <a target="_blank" href="https://www.pinterest.com/radius_theme/">Instagram</a>
            </li>
          </ul>
        </div>
      </div>
     Offcanvas Menu End -->
    <!-- Search Start -->
    <div id="template-search" class="template-search">
      <button type="button" class="close">×</button>
      <form class="search-form">
        <input type="search" value="" placeholder="Search" />
        <button type="submit" class="search-btn btn-ghost style-1">
          <i class="fas fa-search"></i>
        </button>
      </form>
    </div>
    <!-- Search End -->
  </div>
  <!-- Dependency Scripts -->
  <script src="{{ URL::asset('assets/jquery/jquery.min.js')}}"></script>
  <script src="{{ URL::asset('assets/bootstrap/js/bootstrap.min.js')}}"></script>
  <script src="{{ URL::asset('assets/imagesloaded/imagesloaded.pkgd.min.js')}}"></script>
  <script src="{{ URL::asset('assets/magnific-popup/js/magnific-popup.min.js')}}"></script>
  <script src="{{ URL::asset('assets/countdown/js/jquery.countdown.min.js')}}"></script>
  <script src="{{ URL::asset('assets/wow/wow.min.js')}}"></script>
  <script src="{{ URL::asset('assets/isotope-layout/isotope.pkgd.min.js')}}"></script>
  <script src="{{ URL::asset('assets/swiper/js/swiper.min.js')}}"></script>
  <script src="{{ URL::asset('assets/validator/validator.min.js')}}"></script>
  <!-- Custom Script -->
  <script src="{{ URL::asset('js/app.js')}}"></script>
</body>

</html>