<div class="d-flex justify-content-between align-items-center mb-3">
  <div>
    <button type="button" id="btnCalendario" class="btn btn-sm btn-primary me-2">Vista Calendario</button>
    <button type="button" id="btnLista" class="btn btn-sm btn-outline-secondary">Vista Lista</button>
  </div>
</div>

<div id="calendarContainer" class="border rounded-4 shadow-sm p-3 bg-white mb-3" style="width:100%;"></div>
<div class="mb-3 d-flex justify-content-end">
  <button id="agregarActividadBtn" class="btn btn-sm btn-success">
    + Agregar Actividad
  </button>
</div>

<div id="listaContainer" class="d-none"></div>



<script>
document.addEventListener('DOMContentLoaded', function() {
  const calendarEl = document.getElementById('calendarContainer');
  const listaEl = document.getElementById('listaContainer');
  const start = document.getElementById('fecha_inicio');
  const end = document.getElementById('fecha_fin');
  let calendar;
  let eventsData = JSON.parse(document.getElementById('dias_json').value || '[]');
  let actividadModal = new bootstrap.Modal(document.getElementById('modalActividad'));
  let actividadEditId = null;
  let actividadSelectRange = null;

  // CSS para mobile header
  const style = document.createElement('style');
  style.innerHTML = `
    .fc .fc-toolbar {
      padding: 0.5rem 0.25rem !important;
    }
    .fc-toolbar-title {
      font-size: 1.1rem !important;
    }
    .fc .fc-button {
      padding: 0.25rem 0.5rem !important;
      font-size: 0.95rem !important;
    }
    @media (max-width: 600px) {
      #calendarContainer, .fc {
        width: 100% !important;
        min-width: 0 !important;
      }
      .fc .fc-toolbar {
        flex-direction: column !important;
        gap: 0.2rem;
      }
      .fc .fc-toolbar-chunk {
        margin-bottom: 0.1rem;
      }
    }
  `;
  document.head.appendChild(style);

  function validarFechas() {
    if (!start.value || !end.value) {
      calendarEl.innerHTML = '<div class="text-center text-muted py-5">Seleccione fechas para ver el calendario</div>';
      return false;
    }
    return true;
  }

  function initCalendar() {
    if (!validarFechas()) return;
    const oldEvents = [...eventsData];
    if (calendar) calendar.destroy();

    calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'timeGridThreeDay',
      views: {
        timeGridThreeDay: {
          type: 'timeGrid',
          duration: { days: 3 },
        }
      },
      slotMinTime: '00:00:00',
      slotMaxTime: '24:00:00',
      allDaySlot: false,
      locale: 'es',
      editable: true,
      eventDurationEditable: true,
      selectable: true,
      selectMirror: true,
      height: 'auto',
      expandRows: true,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: ''
      },
      validRange: {
        start: start.value,
        end: new Date(new Date(end.value).getTime() + 86400000).toISOString().split('T')[0]
      },
      visibleRange: function(currentDate) {
        // Show 3 days from start date, or from today if within range
        let startDate = new Date(start.value);
        let endDate = new Date(startDate);
        endDate.setDate(startDate.getDate() + 2);
        let maxEnd = new Date(end.value);
        if (endDate > maxEnd) endDate = maxEnd;
        return {
          start: startDate,
          end: new Date(endDate.getTime() + 86400000)
        };
      },
      events: eventsData,
      select: function(info) {
        actividadEditId = null;
        actividadSelectRange = info;
        abrirModalActividad({
          id: null,
          title: '',
          start: info.start,
          end: info.end,
          requiere_asistencia: false
        });
      },
      eventClick: function(info) {
        actividadEditId = info.event.id;
        actividadSelectRange = null;
        abrirModalActividad({
          id: info.event.id,
          title: info.event.title,
          start: info.event.start,
          end: info.event.end,
          requiere_asistencia: info.event.extendedProps.requiere_asistencia || false
        });
      },
      eventDrop: function(info) {
        updateEvent(info.event);
      },
      eventResize: function(info) {
        updateEvent(info.event);
      }
    });

    calendar.render();
    // Responsive fix: ensure width 100%
    calendarEl.style.width = '100%';
  }

  function abrirModalActividad(actividad) {
    // Rellenar campos
    document.getElementById('actividadId').value = actividad.id || '';
    document.getElementById('actividadTitulo').value = actividad.title || '';
    const fechaObj = actividad.start ? new Date(actividad.start) : new Date(start.value);
    document.getElementById('actividadFecha').value = fechaObj.toISOString().split('T')[0];
    document.getElementById('actividadHoraInicio').value = actividad.start ? fechaObj.toTimeString().slice(0,5) : '09:00';
    if (actividad.end) {
      const endObj = new Date(actividad.end);
      document.getElementById('actividadHoraFin').value = endObj.toTimeString().slice(0,5);
    } else {
      document.getElementById('actividadHoraFin').value = '10:00';
    }
    document.getElementById('actividadAsistencia').checked = !!actividad.requiere_asistencia;
    actividadModal.show();
  }

  document.getElementById('guardarActividadBtn').addEventListener('click', function() {
    const id = document.getElementById('actividadId').value || Date.now().toString();
    const title = document.getElementById('actividadTitulo').value.trim();
    const fecha = document.getElementById('actividadFecha').value;
    const horaInicio = document.getElementById('actividadHoraInicio').value;
    const horaFin = document.getElementById('actividadHoraFin').value;
    const asistencia = document.getElementById('actividadAsistencia').checked;
    if (!title || !fecha || !horaInicio || !horaFin) return;
    const startDate = new Date(`${fecha}T${horaInicio}`);
    const endDate = new Date(`${fecha}T${horaFin}`);
    if (endDate <= startDate) {
      alert('La hora de fin debe ser posterior a la de inicio.');
      return;
    }
    if (actividadEditId) {
      // Editar existente
      const idx = eventsData.findIndex(e => e.id === actividadEditId);
      if (idx > -1) {
        eventsData[idx] = {
          ...eventsData[idx],
          title,
          start: startDate,
          end: endDate,
          requiere_asistencia: asistencia
        };
        const ev = calendar.getEventById(actividadEditId);
        if (ev) {
          ev.setProp('title', title);
          ev.setStart(startDate);
          ev.setEnd(endDate);
          ev.setExtendedProp('requiere_asistencia', asistencia);
        }
      }
    } else {
      // Nuevo
      const newEvent = {
        id: id,
        title,
        start: startDate,
        end: endDate,
        requiere_asistencia: asistencia
      };
      eventsData.push(newEvent);
      calendar.addEvent(newEvent);
    }
    updateHiddenField();
    renderLista();
    actividadModal.hide();
    actividadEditId = null;
    actividadSelectRange = null;
  });

  function updateEvent(event) {
    const idx = eventsData.findIndex(e => e.id === event.id);
    if (idx > -1) {
      eventsData[idx] = {
        ...eventsData[idx],
        title: event.title,
        start: event.start,
        end: event.end,
        requiere_asistencia: event.extendedProps.requiere_asistencia || false
      };
      updateHiddenField();
      renderLista();
    }
  }

  function renderLista() {
    // Limpiar solo la lista de actividades, no el botón
    const actividadesDiv = document.createElement('div');
    actividadesDiv.id = 'listaActividades';
    listaEl.querySelector('#listaActividades')?.remove(); // elimina si existe
    listaEl.appendChild(actividadesDiv);
    // Agrupar por fecha
    const agrupados = {};
    eventsData.forEach(e => {
      const fecha = new Date(e.start).toLocaleDateString('es-PE');
      if (!agrupados[fecha]) agrupados[fecha] = [];
      agrupados[fecha].push(e);
    });
    for (const [fecha, acts] of Object.entries(agrupados)) {
      const div = document.createElement('div');
      div.className = "mb-4";
      div.innerHTML = `<h6 class="fw-semibold text-primary mb-2">${fecha}</h6>`;
      acts.forEach(a => {
        div.innerHTML += `
          <div class="border rounded p-2 mb-1 d-flex justify-content-between align-items-center actividad-list-item" data-actividad-id="${a.id}">
            <div class="actividad-list-data">
              <strong class="actividad-titulo" tabindex="0">${a.title}</strong> 
              <small class="text-muted">(<span class="actividad-hora-inicio">${new Date(a.start).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})}</span> - <span class="actividad-hora-fin">${new Date(a.end).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})}</span>)</small>
              ${a.requiere_asistencia ? '<span class="badge bg-success ms-2">Asistencia</span>' : ''}
            </div>
            <button class="btn btn-sm btn-outline-danger eliminar-actividad-btn" data-actividad-id="${a.id}"><i class='bi bi-trash'></i></button>
          </div>`;
      });
      listaActividades.appendChild(div);
    }
    // Inline edit handlers
    listaEl.querySelectorAll('.actividad-list-item .actividad-list-data').forEach(el => {
      el.addEventListener('click', function(ev) {
        const actividadId = this.parentElement.getAttribute('data-actividad-id');
        const actividad = eventsData.find(e => e.id === actividadId);
        if (!actividad) return;
        // Inline edit: replace with inputs
        this.innerHTML = `
          <input type="text" class="form-control form-control-sm mb-1 actividad-titulo-edit" value="${actividad.title}">
          <div class="d-flex align-items-center gap-2 mb-1">
            <input type="time" class="form-control form-control-sm actividad-hora-inicio-edit" value="${new Date(actividad.start).toTimeString().slice(0,5)}">
            <span>-</span>
            <input type="time" class="form-control form-control-sm actividad-hora-fin-edit" value="${new Date(actividad.end).toTimeString().slice(0,5)}">
          </div>
          <div class="form-check">
            <input class="form-check-input actividad-asistencia-edit" type="checkbox" ${actividad.requiere_asistencia ? 'checked' : ''} id="asist-${actividad.id}">
            <label class="form-check-label" for="asist-${actividad.id}">Asistencia</label>
          </div>
          <button class="btn btn-sm btn-primary guardar-actividad-inline-btn mt-2">Guardar</button>
        `;
        this.querySelector('.guardar-actividad-inline-btn').addEventListener('click', (e) => {
          const title = this.querySelector('.actividad-titulo-edit').value.trim();
          const horaInicio = this.querySelector('.actividad-hora-inicio-edit').value;
          const horaFin = this.querySelector('.actividad-hora-fin-edit').value;
          const asistencia = this.querySelector('.actividad-asistencia-edit').checked;
          if (!title || !horaInicio || !horaFin) return;
          const fecha = new Date(actividad.start).toISOString().split('T')[0];
          const startDate = new Date(`${fecha}T${horaInicio}`);
          const endDate = new Date(`${fecha}T${horaFin}`);
          if (endDate <= startDate) {
            alert('La hora de fin debe ser posterior a la de inicio.');
            return;
          }
          actividad.title = title;
          actividad.start = startDate;
          actividad.end = endDate;
          actividad.requiere_asistencia = asistencia;
          // Update event in calendar
          const ev = calendar.getEventById(actividad.id);
          if (ev) {
            ev.setProp('title', title);
            ev.setStart(startDate);
            ev.setEnd(endDate);
            ev.setExtendedProp('requiere_asistencia', asistencia);
          }
          updateHiddenField();
          renderLista();
        });
      });
    });
    // Eliminar handlers
    listaEl.querySelectorAll('.eliminar-actividad-btn').forEach(btn => {
      btn.addEventListener('click', function(e) {
        e.stopPropagation();
        const id = this.getAttribute('data-actividad-id');
        eventsData = eventsData.filter(e => e.id !== id);
        const event = calendar.getEventById(id);
        if (event) event.remove();
        updateHiddenField();
        renderLista();
      });
    });

  }

  document.getElementById('agregarActividadBtn').addEventListener('click', () => {
    actividadEditId = null;
    actividadSelectRange = null;
    const fecha = start.value || new Date().toISOString().split('T')[0];
    abrirModalActividad({
        id: null,
        title: '',
        start: new Date(`${fecha}T09:00`),
        end: new Date(`${fecha}T10:00`),
        requiere_asistencia: false
    });
    });

  window.eliminarActividad = function(id) {
    eventsData = eventsData.filter(e => e.id !== id);
    const event = calendar.getEventById(id);
    if (event) event.remove();
    updateHiddenField();
    renderLista();
  };

  document.getElementById('btnCalendario').addEventListener('click', () => {
    calendarEl.classList.remove('d-none');
    listaEl.classList.add('d-none');
  });
  document.getElementById('btnLista').addEventListener('click', () => {
    calendarEl.classList.add('d-none');
    listaEl.classList.remove('d-none');
    renderLista();
  });

  // Inicializar modal agregar desde lista
  // (el botón se renderiza dinámicamente en renderLista)
  // document.getElementById('agregarActividadBtn').addEventListener('click', ...);

  start.addEventListener('change', initCalendar);
  end.addEventListener('change', initCalendar);
  // Inicializar calendar si fechas ya presentes
  if (start.value && end.value) initCalendar();

    // --- Siempre mantener sincronizado el JSON ---
    function updateHiddenField() {
    const diasInput = document.getElementById('dias_json');
    if (diasInput) diasInput.value = JSON.stringify(eventsData);
    }

    // Actualiza al iniciar, agregar, editar o eliminar
    updateHiddenField();

    // --- Antes de enviar el formulario ---
    const formEvento = document.getElementById('formEvento');
    if (formEvento) {
    formEvento.addEventListener('submit', function (e) {
        updateHiddenField();
        console.log("🔹 Enviando JSON:", document.getElementById('dias_json').value);
    });
    }
});
</script>

