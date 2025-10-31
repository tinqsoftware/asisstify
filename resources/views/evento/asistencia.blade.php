@extends('layouts.app')

@section('content')

<section class="inner-page-banner inner-banner-2" >

    <div class="container">
        <div class="row justify-content-center">
            
            <div class="col-md-6">
                <div class="col-lg-12 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
                    <div class="contact-box-layout2">
                        <div class="contact-form">
                            <h2 class="title"><b>Marcar asistencia</b></h2>
                            <h6> Ingresa tu Nro de documento para marcar tu asistencia a: <br/><b>{{$evento->evento->nombre}}</b></h6>
                                <form method="POST" action="/grabar_asistencia">
                            
                                @csrf
                                <input id="dia" type="text"  name="dia" required value="{{$evento->id}}" style="display:none;">
                                <input id="tipo_asis" type="text" name="tipo_asis" required value="{{$evento->tipo_ingreso}}" style="display:none;">


                                <div class="row mb-3">

                                    <div class="col-md-12 form-group">
                                        <select class="form-control select"  id="tip_doc" name="tip_doc" required autofocus>
                                            <option value="1">DNI</option>
                                            <option value="2">CE</option>
                                            <option value="3">PST</option>
                                        </select>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <input id="nro_doc" type="text"  placeholder="Nro Documento"  class="form-control @error('nro_doc') is-invalid @enderror" name="nro_doc" required autocomplete="nro_doc">
                                        @error('nro_doc')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>


                                    <div class="col-12 form-group mb-0">
                                        <button type="submit" class="btn-fill style-one">Registrar asistencia</button>
                                        <a href="/evento" type="submit" class="btn-fill style-six">Cancelar</a>
                                    </div>
                                    
                                </div>
                                <div class="form-response"></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="col-lg-12 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
                    <div class="contact-box-layout2">
                        <div class="contact-form">
                            <img src="{{URL::asset('image/eventos/'.$evento->evento->foto_logo)}}" alt="blog" width="839" height="766">
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
@endsection
