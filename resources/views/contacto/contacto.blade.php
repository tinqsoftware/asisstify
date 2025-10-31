@extends('layouts.app')

@section('content')

<section class="inner-page-banner inner-banner-6" data-bg-image="image/banner/inner-banner6.jpg">
        <div class="container">
          <div class="entry-banner-content">
            <h1 class="entry-title">CONTACTANOS Y CREA TU EVENTO</h1>
          </div>
        </div>
      </section>
      <!--=====================================-->
      <!--=     Inne Page Banner Area End     =-->
      <!--=====================================-->
      <!--=====================================-->
      <!--=    Contact Section Area Start     =-->
      <!--=====================================-->
      <section class="contact-wrap-layout2">
        <div class="container">
          <div class="row">
            <div class="col-lg-5 wow fadeInLeft animated" data-wow-delay="0.3s" data-wow-duration="1s">
              <div class="contact-box-layout2">
                <div class="content-box">
                  <div class="sub-title">Estamos en etapa BETA</div>
                  <h2 class="title">Déjanos tus datos y nos contactaremos contigo</h2>
                  <p class="description">Al estar en etapa beta, estamos terminando de pulir las funcionalidades principales por lo que la creación de eventos aún será guiada por un miembro de nuestro equipo.</p>
                </div>
              </div>
            </div>
            <div class="col-lg-7 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
              <div class="contact-box-layout2">
                <div class="contact-form">
                    @if(session('exito'))
                        <div class="alert alert-success" role="alert">
                            {{ session('exito') }}
                        </div>
                    @endif
                    <form method="POST" action="/contactanos">
                        @csrf
                        <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" placeholder="Tu nombre" class="form-control" name="name" data-error="Campo requerido" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="col-md-6 form-group">
                            <input type="email" placeholder="Correo" class="form-control" name="email" data-error="Campo requerido" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="col-md-6 form-group">
                            <input type="text" placeholder="Celular" class="form-control" name="phone" data-error="Campo requerido" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="col-12 form-group">
                            <textarea placeholder="Comentanos sobre tu evento" class="textarea form-control" name="message" rows="4" cols="20" data-error="Campo requerido" required></textarea>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="col-12 form-group mb-0">
                            <button type="submit" class="btn-fill style-one">Enviar</button>
                        </div>
                        </div>
                        <div class="form-response"></div>
                    </form>
                </div>
              </div>
            </div>

          </div>
        </div>
      </section>
@endsection
