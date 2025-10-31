@extends('layouts.app')

@section('content')

<section class="inner-page-banner inner-banner-2" >

    <div class="container">
        <div class="row justify-content-center">
            
            <div class="col-md-6">
                <div class="col-lg-12 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
                    <div class="contact-box-layout2">
                        <div class="contact-form">
                            <h2 class="title"><b>Confirmar correo</b></h2>
                            <h6> Confirma tu correo para enviarte tu constancia de asistencia por ese medio: <br/></h6>
                                <form method="POST" action="/grabar_grabar">
                            
                                @csrf

                                <div class="row mb-3">

                                    <div class="col-md-12 form-group">
                                        <select class="form-control select"  id="tip_doc" name="tip_doc" required autofocus>
                                            @if($participante->tipo_doc=='1')
                                            <option value="1" selected>DNI</option>
                                            <option value="2">CE</option>
                                            <option value="3">PST</option>
                                            @elseif($participante->tipo_doc=='2')
                                            <option value="1" >DNI</option>
                                            <option value="2" selected>CE</option>
                                            <option value="3">PST</option>
                                            @elseif($participante->tipo_doc=='3')
                                            <option value="1" >DNI</option>
                                            <option value="2" >CE</option>
                                            <option value="3" selected>PST</option>
                                            @endif
                                            
                                        </select>
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <input id="nro_doc" type="text"  placeholder="Nro Documento"  class="form-control @error('nro_doc') is-invalid @enderror" name="nro_doc" required autocomplete="nro_doc" value="{{$participante->nro_doc}}">
                                        @error('nro_doc')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <input id="correo" type="mail"  placeholder="Correo"  class="form-control @error('correo') is-invalid @enderror" name="correo" required autocomplete="correo">
                                        @error('correo')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="col-12 form-group mb-0">
                                        <button type="submit" class="btn-fill style-one">Confirmar correo</button>
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
                            <img src="{{ URL::asset('image/eventos/'.$evento->foto_logo)}}" alt="blog" width="839" height="766">
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
@endsection
