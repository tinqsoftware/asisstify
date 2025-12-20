@extends('layouts.event_app')

@section('title', 'Asistencia QR - ' . ($actividad->titulo ?? ''))

@section('content')
<style>
  .qr-check {
    max-width: 520px;
    margin: 2rem auto;
    background: rgba(15,23,42,.85);
    border: 1px solid rgba(148,163,184,.4);
    border-radius: 20px;
    padding: 2rem;
    box-shadow: 0 20px 50px rgba(0,0,0,.4);
  }
  .qr-check h3 {
    color: #f8fafc;
  }
  .qr-check .sub {
    color: #cbd5f5;
  }
  .qr-check select,
  .qr-check input {
    background: rgba(2,6,23,.9);
    color: #f8fafc;
    border: 1px solid rgba(148,163,184,.5);
    border-radius: 10px;
    padding: 10px 12px;
  }
  .qr-check button {
    width: 100%;
    margin-top: 1rem;
    background: linear-gradient(90deg, rgba(251,191,36,.95), rgba(59,130,246,.85));
    color: #0f172a;
    border: none;
    border-radius: 12px;
    padding: 10px 14px;
    font-weight: 700;
    letter-spacing: .04em;
  }
  .qr-msg {
    margin-top: 1rem;
    color: #fbbf24;
    min-height: 1.2rem;
  }
</style>

<div class="qr-check">
  <h3 class="fw-semibold mb-2">{{ $actividad->titulo }}</h3>
  <div class="sub mb-3">{{ $evento->titulo ?? 'Evento' }}</div>

  <div class="d-flex gap-2">
    <select id="qrTipoDoc">
      <option value="1" selected>DNI</option>
      <option value="2">CE</option>
      <option value="3">PST</option>
      <option value="4">RUC</option>
    </select>
    <input type="text" id="qrNroDoc" placeholder="Numero de documento">
  </div>

  <button type="button" id="qrSubmit">Marcar asistencia</button>
  <div id="qrMensaje" class="qr-msg"></div>
</div>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('qrSubmit');
  const tipo = document.getElementById('qrTipoDoc');
  const nro = document.getElementById('qrNroDoc');
  const msg = document.getElementById('qrMensaje');

  async function submit() {
    const nroVal = nro.value.trim();
    if (!nroVal) {
      msg.textContent = 'Ingresa tu numero de documento.';
      return;
    }
    msg.textContent = 'Registrando...';

    try {
      const res = await fetch(@json(route('api.marcarAsistencia')), {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-TOKEN': @json(csrf_token()),
        },
        body: JSON.stringify({
          actividad_id: @json($actividad->id),
          tipo_documento: tipo.value,
          nro_documento: nroVal,
          metodo_entrada: 'qr'
        })
      });
      const data = await res.json();
      if (data.error) {
        msg.textContent = data.error;
        return;
      }
      msg.textContent = data.mensaje || 'Asistencia registrada.';
      nro.value = '';
    } catch (err) {
      console.error(err);
      msg.textContent = 'Error al registrar.';
    }
  }

  btn.addEventListener('click', submit);
  nro.addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      submit();
    }
  });
});
</script>
@endsection
