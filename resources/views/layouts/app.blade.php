<!DOCTYPE html>
<html lang="en">

<head>
    @include('layouts.partials.head')
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

        @include('layouts.partials.header')

        @yield('content')


        @include('layouts.partials.footer')
      
    </div>
    @include('layouts.partials.menu_lateral')
  </div>
  <!-- Dependency Scripts -->
  @include('layouts.partials.footer-scripts')
</body>

</html>