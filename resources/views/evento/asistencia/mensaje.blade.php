@extends('layouts.app_certificado')

    @section('content')
    
    <section class="error-wrap-layout1" data-bg-image="{{URL::asset('image/banner/404-banner.jpg')}}">
        <div class="error-box-layout1">
            <span class="sub-title"> </span>
            <h1 class="main-title" style="font-size:55px">{{$titulo}}</h1>
            <h4 style="color:white">{{$mensaje}}</h4>
            <a href="/asistencia" class="btn-fill style-one">Volver</a>
        </div>
    </section>

    
@endsection