@extends('layouts.event_auth')

@section('content')
<style>
  .auth-card {
    background: rgba(15, 23, 42, 0.96);
    border: 1px solid rgba(148, 163, 184, 0.35);
    border-radius: 26px;
    padding: 26px 22px;
    width: 100%;
    max-width: 420px;
    box-shadow: 0 20px 45px rgba(0, 0, 0, 0.6);
    color: #e5e7eb;
    position: relative;
    overflow: hidden;
  }

  .auth-card::before {
    content: '';
    position: absolute;
    inset: -110px auto auto -110px;
    width: 220px;
    height: 220px;
    background: radial-gradient(circle, rgba(251, 191, 36, 0.18), transparent 70%);
    opacity: .9;
  }

  .auth-title {
    font-weight: 700;
    font-size: 1.6rem;
    margin-bottom: 4px;
  }

  .auth-sub {
    font-size: .85rem;
    color: #9ca3af;
    margin-bottom: 18px;
  }

  .auth-input {
    background: rgba(2, 6, 23, 0.7);
    border: 1px solid rgba(148, 163, 184, 0.35);
    color: #e5e7eb;
    border-radius: 14px;
    padding: 12px 14px;
  }

  .auth-input:focus {
    border-color: rgba(251, 191, 36, 0.6);
    box-shadow: 0 0 0 2px rgba(251, 191, 36, 0.18);
    background: rgba(2, 6, 23, 0.7);
    color: #e5e7eb;
  }

  .auth-btn {
    width: 100%;
    border-radius: 999px;
    border: none;
    padding: 10px 16px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: .14em;
    background: linear-gradient(135deg, #fbbf24, #f59e0b);
    color: #111827;
    margin-top: 8px;
  }

  .auth-link {
    display: inline-block;
    margin-top: 10px;
    color: #fef3c7;
    text-decoration: none;
    font-size: .8rem;
  }

  .auth-link:hover {
    color: #fff;
  }

  .auth-shell {
    display: flex;
    flex-direction: column;
    gap: 12px;
    width: min(980px, 100%);
  }

  .brand-glow {
    font-weight: 800;
    letter-spacing: .28em;
    text-transform: uppercase;
    font-size: 2rem;
    text-align: center;
    background: linear-gradient(120deg, #fbbf24, #38bdf8, #f59e0b);
    background-size: 200% 200%;
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    animation: brandShift 6s ease-in-out infinite;
    text-shadow:
      0 0 24px rgba(251, 191, 36, 0.25),
      0 0 36px rgba(56, 189, 248, 0.2);
  }

  @keyframes brandShift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
  }

  .brand-strip {
    margin-top: 10px;
    border-radius: 999px;
    border: 1px solid rgba(148, 163, 184, 0.25);
    background: rgba(15, 23, 42, 0.75);
    padding: 8px 0;
    overflow: hidden;
  }

  .strip-track {
    display: inline-flex;
    align-items: center;
    gap: 32px;
    white-space: nowrap;
    animation: stripScroll 30s linear infinite;
    padding-left: 100%;
  }

  .strip-item {
    font-size: .78rem;
    text-transform: uppercase;
    letter-spacing: .12em;
    color: #e5e7eb;
  }

  @keyframes stripScroll {
    0% { transform: translateX(0); }
    70% { transform: translateX(-60%); }
    100% { transform: translateX(-100%); }
  }

  .mobile-strip {
    margin-top: 8px;
    border-radius: 999px;
    border: 1px solid rgba(148, 163, 184, 0.2);
    background: rgba(15, 23, 42, 0.6);
    padding: 8px 0;
    overflow: hidden;
  }

  .mobile-track {
    display: inline-flex;
    align-items: center;
    gap: 28px;
    white-space: nowrap;
    animation: mobileScroll 34s linear infinite;
    padding-left: 100%;
  }

  .mobile-item {
    font-size: .76rem;
    text-transform: uppercase;
    letter-spacing: .14em;
    color: #e5e7eb;
  }

  @keyframes mobileScroll {
    0% { transform: translateX(0); }
    70% { transform: translateX(-60%); }
    100% { transform: translateX(-100%); }
  }

  @media (min-width: 992px) {
    .auth-shell {
      flex-direction: row;
      align-items: center;
      justify-content: center;
      gap: 22px;
    }
    .auth-left {
      flex: 1;
      max-width: 420px;
      text-align: left;
    }
    .brand-glow {
      font-size: 3rem;
      text-align: left;
    }
    .mobile-strip { display: none; }
    .auth-card {
      flex: 1;
    }
  }

  @media (max-width: 991px) {
    .brand-strip {
      display: none;
    }
    .brand-glow {
      font-size: 2.4rem;
      text-shadow:
        0 0 30px rgba(251, 191, 36, 0.35),
        0 0 42px rgba(56, 189, 248, 0.28);
    }
  }
</style>

<div class="auth-shell">
  <div class="auth-left" aria-live="polite">
    <div class="brand-glow">ASSISTIFY</div>
    <div class="brand-strip" aria-hidden="true">
      <div class="strip-track">
        <span class="strip-item">Marca tu asistencia en segundos</span>
        <span class="strip-item">Confirma tus actividades</span>
        <span class="strip-item">Consulta tu historial</span>
        <span class="strip-item">Recibe tus certificados</span>
        <span class="strip-item">Participa en encuestas en vivo</span>
        <span class="strip-item">Marca tu asistencia en segundos</span>
        <span class="strip-item">Confirma tus actividades</span>
        <span class="strip-item">Consulta tu historial</span>
        <span class="strip-item">Recibe tus certificados</span>
        <span class="strip-item">Participa en encuestas en vivo</span>
      </div>
    </div>
    <div class="mobile-strip" aria-hidden="true">
      <div class="mobile-track">
        <span class="mobile-item">Marca tu asistencia en segundos</span>
        <span class="mobile-item">Confirma tus actividades</span>
        <span class="mobile-item">Consulta tu historial</span>
        <span class="mobile-item">Recibe tus certificados</span>
        <span class="mobile-item">Participa en encuestas en vivo</span>
        <span class="mobile-item">Marca tu asistencia en segundos</span>
        <span class="mobile-item">Confirma tus actividades</span>
        <span class="mobile-item">Consulta tu historial</span>
        <span class="mobile-item">Recibe tus certificados</span>
        <span class="mobile-item">Participa en encuestas en vivo</span>
      </div>
    </div>
  </div>

  <div class="auth-card">
    <div class="auth-title">Ingresar</div>
    <div class="auth-sub">Accede con tu DNI o correo electrónico.</div>

    <form method="POST" action="{{ route('login') }}">
      @csrf
      <div class="mb-3">
        <input id="login" type="text" placeholder="DNI o email" class="form-control auth-input @error('login') is-invalid @enderror" name="login" value="{{ old('login') }}" required autofocus>
        @error('login')
          <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
          </span>
        @enderror
      </div>

      <div class="mb-3">
        <input id="password" type="password" class="form-control auth-input @error('password') is-invalid @enderror" name="password" placeholder="Contraseña" required autocomplete="current-password">
        @error('password')
          <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
          </span>
        @enderror
      </div>

      <button type="submit" class="auth-btn">Ingresar</button>

      @if (Route::has('password.request'))
        <a class="auth-link" href="{{ route('password.request') }}">
          ¿Olvidaste tu contraseña?
        </a>
      @endif
    </form>
  </div>
</div>

@endsection
