@extends('layouts.app')

@section('content')

<section class="inner-page-banner inner-banner-3" >

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="col-lg-12 wow fadeInLeft animated" data-wow-delay="0.5s" data-wow-duration="1s">
                    <div class="contact-box-layout2">
                        <div class="contact-form">
                            <h2 class="title">Inicio</h2>
                            
                            <div class="row mb-3">

                                <div class="col-md-12 form-group">
                                    @if (session('status'))
                                        <div class="alert alert-success" role="alert">
                                            {{ session('status') }}
                                        </div>
                                    @endif
                                </div>

                                <div class="col-md-12 form-group">
                                    <input id="email" type="email"  placeholder="Email"  class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                
                            </div>
                            <div class="form-response"></div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</section>

@endsection
