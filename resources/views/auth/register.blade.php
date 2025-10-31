@extends('layouts.app')

@section('content')

<section class="inner-page-banner inner-banner-2" >

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <div class="col-lg-12 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
                    <div class="contact-box-layout2">
                        <div class="contact-form">
                            <h2 class="title">Registrarse</h2>
                            
                            <form method="POST" action="{{ route('register') }}">
                                @csrf
                                <div class="row mb-3">

                                    <div class="col-md-12 form-group">
                                        <input id="name" type="text"  placeholder="Nombre"  class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <input id="email" type="email"  placeholder="Email"  class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Contraseña" required autocomplete="new-password">
                                        @error('password')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Repetir contraseña" required autocomplete="new-password">
                                    </div>

                                    <div class="col-12 form-group mb-0">
                                        <button type="submit" class="btn-fill style-one">Registrarse</button>
                                    </div>
                                    
                                </div>
                                <div class="form-response"></div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</section>
@endsection
