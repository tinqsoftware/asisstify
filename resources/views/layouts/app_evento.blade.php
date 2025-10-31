<!DOCTYPE html>
<html lang="en">

<head>
    @include('layouts.partials.head_evento')
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
        @include('layouts.partials.header_evento')

        @yield('content')

        @include('layouts.partials.footer_evento')

    </div>
    @include('layouts.partials.menu_lateral_evento')
  </div>
  @include('layouts.partials.footer-scripts_evento')
</body>

</html>