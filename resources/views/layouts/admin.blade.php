<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Administrativo - Asisstify</title>
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body class="bg-light">
    @include('layouts.partials.header')

    <main class="py-4" style="min-height: 75vh;">
        <div class="container">
            @yield('content')
        </div>
    </main>

    @include('layouts.partials.footer')
</body>
</html>