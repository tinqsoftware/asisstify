@extends('layouts.app_certificado')

    @section('content')
    
    <section class="error-wrap-layout1" data-bg-image="{{URL::asset('image/banner/404-banner.jpg')}}">
        <div class="error-box-layout1">
            <span class="sub-title"> Participación</span>
            <h1 class="main-title">¡Muchas gracias!</h1>
            <h4 style="color:white">{{$mensaje}}</h4>

                <h6 style="color:white"><b>Si cumplió con su registro en ambos días,<br/>se le enviará su certificado de participación mediante correo en los próximos días.</b></h6>
                <!--
                    @if($certificado == 'si')
                        <a href="/evento/constancia/{{$url_personalizado}}" class="btn-fill style-one">Descargar aquí tu constancia</a>
                    @else
                        
                            <h6 style="color:white"><b>Si su participación fue virtual y cumplió con su registro en ambos días,<br/>se le enviará su certificado de participación mediante correo en los próximos días.</b></h6>
                        
                    @endif
                -->
        </div>
    </section>

    
@endsection