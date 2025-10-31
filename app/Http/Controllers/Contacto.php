<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Http;
use Session;
use DB;
use DatePeriod;
use DateTime;
use DateInterval;
use PDF;
use Response;
//use App\User;
use Carbon\Carbon;
use \Mpdf\Mpdf;
use Illuminate\Support\Facades\Mail;

//modelos
use App\Models\Actividad;
use App\Models\Evento;
use App\Models\EventoDetalle;
use App\Models\EventoUserAsistenteDetalle;
use App\Models\Invitado;
use App\Models\TipoUsuario;
use App\Models\Ponente;
use App\Models\Contact;
use App\Models\StaffDetalle;
use App\Models\User;


class Contacto extends Controller{


    public function contactanos(){        
        return view('contacto.contacto');
    }


    public function contactanos_post(Request $request){
        $contacto = new Contact();
        $contacto->nombre = trim(mb_strtoupper($request->name));
        $contacto->celular = $request->phone;
        $contacto->correo = $request->email;
        $contacto->detalle = $request->message;
        $contacto->save();

        Session::flash('exito', 'Tu mensaje se registro de forma exitosa. En el transcurso de las proximas horas nos comunicaremos contigo.');
        return redirect('/contactanos');


    }

    public function detalle($url_personalizado){
        $evento = Evento::where("url_personalizado",$url_personalizado)->first();
        //si es evento, ingresar al landing page del evento
        if($evento){
            $evento->det = EventoDetalle::where('id_evento',$evento->id)->get();
                if($evento->det){
                    foreach($evento->det as $e){
                        $e->actividades = Actividad::where('id_evento_detalle',$e->id)->get();
                        if($e->actividades){
                            foreach($e->actividades as $a){
                                if($a->tipo_actividad =='1'){
                                    $a->nombre_tipo = 'Ponencia';
                                }elseif($a->tipo_actividad =='2'){
                                    $a->nombre_tipo = 'Panel';
                                }else{
                                    $a->nombre_tipo = '';
                                }
                                
                                $a->ponentes = StaffDetalle::where('id_actividad',$a->id)->get();
                                if($a->ponentes){
                                    
                                    foreach($a->ponentes as $p){
                                        if($p->tipo_ponente == 1){
                                            $p->nombre_tponente = 'Presentador';
                                        }elseif($p->tipo_ponente == 2){
                                            $p->nombre_tponente = 'Moderador';
                                        }elseif($p->tipo_ponente == 3){
                                            $p->nombre_tponente = 'Ponente';
                                        }elseif($p->tipo_ponente == 4){
                                            $p->nombre_tponente = 'Panelista';
                                        }
                                        if(isset($p->id_user_ponente)){
                                            
                                            $ponente = User::find($p->id_user_ponente);
                                            $p->dato_ponente = $ponente;
                                        }else{
                                            $p->dato_ponente = '';
                                        }
                                        
                                    }
                                    
                                }

                            }
                        }
                    }
                }
            return view('evento.detalle', compact('evento'));
        }else{
            //si es url de asistencia de evento del inicio (debe de ir un código diferente, para que no copien el url y lo utilicen para los otros días)
            $evento = EventoDetalle::where("url_inicio",$url_personalizado)->first();
            if($evento){
                $evento->evento = Evento::find($evento->id_evento)->first();
                $evento->tipo_ingreso = 'inicio';
                return view('evento.asistencia', compact('evento'));
            }else{
                $evento = EventoDetalle::where("url_fin",$url_personalizado)->first();
                if($evento){
                    $evento->evento = Evento::find($evento->id_evento)->first();
                    $evento->tipo_ingreso = 'fin';
                    return view('evento.asistencia', compact('evento'));
                }else{
                    //certificado de participación
                    $participante = User::where("nro_documento",$url_personalizado)->first();
                    if($participante){
                        $certificado = 'si';
                        $fin = 'si';
                        //CORREGIR
                        //$dias = EventoDetalle::where('id_evento',$dia->id_evento)->get();
                        $dias = EventoDetalle::where('id_evento','1')->get();
                        $evento = Evento::find('1')->first();
                        $i = 0;
                        if($dias){
                            $i++;
                            foreach($dias as $d){
                                if($d->tomar_asistencia_inicio == 'si'){
                                    $res = EventoUserAsistenteDetalle::where('id_evento',$d->id_evento)->where('id_evento_detalle',$d->id)->where('id_user_asistencia',$participante->id)->where('tipo_marcado','inicio')->first();
                                    if($res){
                                    }else{
                                        $certificado = 'no';
                                    }
                                }
                                if($d->tomar_asistencia_fin == 'si'){
                                    $res = EventoUserAsistenteDetalle::where('id_evento',$d->id_evento)->where('id_evento_detalle',$d->id)->where('id_user_asistencia',$participante->id)->where('tipo_marcado','fin')->first();
                                    if($res){
                                    }else{
                                        $certificado = 'no';
                                    }
                                }
                            }
                        }

                        $mensaje = 'Por haber participado en '.$evento->nombre;
                        return view('evento.certificado_inicio', compact('mensaje','url_personalizado','certificado'));
                    }else{

                        $certificado = 'si';
                        $fin = 'si';
                        //CORREGIR
                        //$dias = EventoDetalle::where('id_evento',$dia->id_evento)->get();
                        $dias = EventoDetalle::where('id_evento','1')->get();
                        $evento = Evento::find('1')->first();
                        $i = 0;
                        if($dias){
                            $i++;
                            foreach($dias as $d){
                                if($d->tomar_asistencia_inicio == 'si'){
                                    $res = EventoUserAsistenteDetalle::where('id_evento',$d->id_evento)->where('id_evento_detalle',$d->id)->where('nro_doc',$url_personalizado)->where('tipo_marcado','inicio')->first();
                                    if($res){
                                    }else{
                                        $certificado = 'no';
                                    }
                                }
                                if($d->tomar_asistencia_fin == 'si'){
                                    $res = EventoUserAsistenteDetalle::where('id_evento',$d->id_evento)->where('id_evento_detalle',$d->id)->where('nro_doc',$url_personalizado)->where('tipo_marcado','fin')->first();
                                    if($res){
                                    }else{
                                        $certificado = 'no';
                                    }
                                }
                            }
                        }

                        $evento = Evento::find('1')->first();
                        $participante = EventoUserAsistenteDetalle::where("nro_doc",$url_personalizado)->first();
                        //return redirect('/evento');
                        return view('evento.correo_asistencia', compact('participante','evento'));

                        

                        if($certificado=='no'){
                            //gracias por participar
                            $mensaje = 'Por haber participado en '.$evento->nombre;
                            return view('evento.certificado_inicio', compact('mensaje','url_personalizado','certificado'));
                        }else{
                            //no se le pide correo se le manda PDF (mensaje de que le enviaremos luego)
                            $evento = Evento::find('1')->first();
                            $participante = EventoUserAsistenteDetalle::where("nro_doc",$url_personalizado)->first();
                            //return redirect('/evento');
                            return view('evento.correo_asistencia', compact('participante','evento'));
                        }

                        

                       
                    }

                    
                }
            }
        }

    }

    public function descarga_constancia($DNI){
        $participante = User::where("nro_documento",$DNI)->first();
        date_default_timezone_set('America/Lima');
        setlocale(LC_TIME,"es_PE");

        date_default_timezone_set('America/Lima');
        setlocale(LC_TIME,"es_PE");

        //$c = Certificados::find($id);
        //$capa = CertificadosPonentes::find($c->id_capa);
        //$fecha_ =Carbon::parse($capa->fecha_capa);

        if(trim($participante->apellidos)){
            $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
        }

        // == ENVIANDO certificado a participante
        $nombre_part = trim(mb_strtoupper($participante->name));
            $cant_text = 43;
            $top_text = 330;
            if(strlen($nombre_part)<=33){
                $cant_text = 43;
            }else{
                if(strlen($nombre_part)>=80){
                    $cant_text=15;
                    $top_text = 360;
                }elseif(strlen($nombre_part)>=70){
                    $cant_text=20;
                    $top_text = 355;
                }elseif(strlen($nombre_part)>=60){
                    $cant_text=25;
                    $top_text = 350;
                }elseif(strlen($nombre_part)>=50){
                    $cant_text=30;
                    $top_text = 340;
                }elseif(strlen($nombre_part)>=40){
                    $cant_text=35;
                    $top_text = 335;
                }
            }

            $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
            ob_start();
            $mpdf_participante->WriteHtml('
                <html>
                <head>
                <meta charset="UTF-8">
                <title>'.$nombre_part.'</title>
                <link type="image/x-icon" href="/assets/img/essalud_logo.png" rel="icon">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                </head>
                <body>
                <div style= "position:absolute; top:0px; left:0px;" ><img src = "/image/fondo_participante.png"/></div>
                <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                </body>
            </html>
            ',\Mpdf\HTMLParserMode::HTML_BODY); 
        $pdf_participante=$mpdf_participante->Output('', 'S');
        $mpdf_participante->Output()->header('Content-Type', 'application/pdf')->header('Content-Disposition', 'attachment; filename="nombre-del-archivo.pdf"');
        //$content = chunk_split(base64_encode($pdf));
    }
    
    public function grabarcorreo_post(Request $request){
        $participante = EventoUserAsistenteDetalle::where('nro_doc',$request->nro_doc)->where('tipo_doc',$request->tip_doc)->get();
        $correo =$request->correo;
        $evento= Evento::find('1')->first();
        foreach($participante as $p){
            $p->correo = $correo;
            $p->save();
        }

        $mensaje = 'Por haber participado en '.$evento->nombre;
        $url_personalizado = $request->nro_doc;
        $certificado = 'no';
        return view('evento.certificado_inicio', compact('mensaje','url_personalizado','certificado'));

    }

    public function detalle_post(Request $request){
        $nro_doc = $request->nro_doc;
        $tip_doc = $request->tip_doc;
        $tipo_asis = $request->tipo_asis;
        $dia = $request->dia;
        $dia = EventoDetalle::find($dia);
        $evento = Evento::find($dia->id_evento);
        //EVENTO DISPONIBLE AÚN
        if($evento->estado == '0'){
            $asistente = User::where("nro_documento",$nro_doc)->where("tipo_documento",$tip_doc)->first();

            //INICIO
            if($tipo_asis=='inicio'){
                if($asistente){
                    $validar = EventoUserAsistenteDetalle::where('id_evento',$dia->id_evento)->where('id_evento_detalle',$dia->id)->where('id_user_asistencia',$asistente->id)->where('tipo_marcado',$tipo_asis)->first();
                    if($validar){
                        //dd('ya existe');
                        return redirect('/'.$evento->url_personalizado.'#schedule');
                    }else{
                        $asistencia = new EventoUserAsistenteDetalle();
                        $asistencia->id_evento = $dia->id_evento;
                        $asistencia->id_evento_detalle = $dia->id;
                        $asistencia->id_user_asistencia = $asistente->id;
                        $asistencia->tipo_marcado = $tipo_asis;
                        $asistencia->save();
                        return redirect('/'.$evento->url_personalizado.'#schedule');
                    }
    
                }else{
                    $asistencia = new EventoUserAsistenteDetalle();
                    $asistencia->id_evento = $dia->id_evento;
                    $asistencia->id_evento_detalle = $dia->id;
                    //$asistencia->id_user_asistencia = $asistente->id;
                    $asistencia->tipo_doc = $tip_doc;
                    $asistencia->nro_doc = $nro_doc;
                    $asistencia->tipo_marcado = $tipo_asis;
                    $asistencia->save();
                    return redirect('/'.$evento->url_personalizado.'#schedule');
                    //dd('USUARO NO EXISTE, REGISTRESE');
                }
            }else{
                //FIN. VALIDAR SI YA LE TOCARÍA SU PDF
                if($asistente){
                    $validar = EventoUserAsistenteDetalle::where('id_evento',$dia->id_evento)->where('id_evento_detalle',$dia->id)->where('id_user_asistencia',$asistente->id)->where('tipo_marcado',$tipo_asis)->first();
                    if($validar){
                        return redirect('/'.$nro_doc);
                        //return redirect('/'.$evento->url_personalizado.'#schedule');
                    }else{
                        $asistencia = new EventoUserAsistenteDetalle();
                        $asistencia->id_evento = $dia->id_evento;
                        $asistencia->id_evento_detalle = $dia->id;
                        $asistencia->id_user_asistencia = $asistente->id;
                        $asistencia->tipo_marcado = $tipo_asis;
                        $asistencia->save();
                        return redirect('/'.$nro_doc);
                        //return redirect('/'.$evento->url_personalizado.'#schedule');
                    }
    
                }else{
                    $asistencia = new EventoUserAsistenteDetalle();
                    $asistencia->id_evento = $dia->id_evento;
                    $asistencia->id_evento_detalle = $dia->id;
                    //$asistencia->id_user_asistencia = $asistente->id;
                    $asistencia->tipo_doc = $tip_doc;
                    $asistencia->nro_doc = $nro_doc;
                    $asistencia->tipo_marcado = $tipo_asis;
                    $asistencia->save();
                    return redirect('/'.$nro_doc);
                    //return redirect('/'.$evento->url_personalizado.'#schedule');
                    //dd('USUARO NO EXISTE, REGISTRESE');
                }
            }
        }else{
            //EVENTO NO DISPONIBLE
            return redirect('/evento');
        }
        
            

        
    }


    public function ejemplo($url_personalizado){
        $evento = Evento::where("url_personalizado",$url_personalizado)->first();
        if($evento){
            return view('evento.asistencia', compact('evento'));
        }else{
            return redirect('/evento');
        }
    }
    /*
        public function asistencia($url_evento){
            dd('2');
            $evento = Evento::where("url_personalizado",$url_evento)->first();
            if($evento){
                return view('evento.asistencia', compact('evento'));
            }else{
                return redirect('/evento');
            }
        }
    */
    public function crear_post(Request $request){

        //redirigir luego de crear
        return redirect('/home');
    }

    public function editar(){
        return view('evento.editar');
    }


    public function cargararchivo(Request $request){
        
		//$request->validate(['file' => 'required|mimes:csv,txt,xlx,xls|max:80096']);
        $cantidad_creados = 0;
        $cantidad_existen = 0;
        $cant_detalle = '';
        $cantidad_capas_creados =0;
        $capas_no = 0;

        //verificar file
        if($request->file()) {
            $file = $request->file('file');
            $dataimport = $this->csvToArray($file,',');
           
            //dd($dataimport);
            foreach ($dataimport as $dato) {
                $data = json_decode(json_encode($dato),true);
                $capas = CertificadosPonentes::where('nombre_capa', trim(mb_strtoupper($dato['nombre_capa'])))
                ->where('fecha_capa', date('Y-m-d',strtotime($dato['fecha_capa'])))
                ->where('capa_estado','!=','3')
                ->first();

                if(isset($capas)) {
                    $capas_no++;
                }else{
                    
                    $capacitacion = new CertificadosPonentes();
                    $capacitacion->nombre_capa = trim(mb_strtoupper($dato['nombre_capa']));
                    $capacitacion->fecha_capa = date('Y-m-d',strtotime($dato['fecha_capa']));
                    $capacitacion->ponente = trim(mb_strtoupper($dato['ponente']));
                    $capacitacion->correo_ponente = trim(mb_strtoupper($dato['correo_ponente']));
                    $capacitacion->save();
                    $cantidad_capas_creados++;
                }
            }

            
            foreach ($dataimport as $dato) {
                $data = json_decode(json_encode($dato),true);
                $capa = CertificadosPonentes::where('nombre_capa', trim(mb_strtoupper($dato['nombre_capa'])))
                ->where('fecha_capa', date('Y-m-d',strtotime($dato['fecha_capa'])))
                ->where('capa_estado','!=','3')
                ->first();
                
                $certificados = Certificados::where('id_capa', $capa->id)
                ->where('nombre_asistente', trim(mb_strtoupper($dato['nombre_asistente'])))
                ->where('correo_asistente', trim(mb_strtoupper($dato['correo_asistente'])))
                ->where('estado_envio','!=','3')
                ->first();
                
                if(isset($certificados)) {
                    $cant_detalle = $cant_detalle.','.$certificados->id;
                    $cantidad_existen++;
                    
                }else{
                    
                    $certificado = new Certificados();
                    $certificado->id_capa = $capa->id;
                    $certificado->nombre_asistente = trim(mb_strtoupper($dato['nombre_asistente']));
                    $certificado->correo_asistente = trim(mb_strtoupper($dato['correo_asistente']));
                    $certificado->save();
                    $capa->capa_estado = '99';
                    $capa->save();
                    $cantidad_creados++;
                }
                
            }
            
        }
        
        if($cantidad_existen > 0 && $cantidad_creados==0){
            Session::flash('error', 'No se registraron '.$cantidad_existen.'('.$cant_detalle.')'.' certificados, por ser registros ya antes ingresados.');
        }

        if($cantidad_existen > 0 && $cantidad_creados >0){
            Session::flash('exito', 'No se registraron '.$cantidad_existen.'('.$cant_detalle.')'.' certificados, por ser registros ya antes ingresados. Pero si se lograron ingresar '.$cantidad_creados.' a quienes si se les enviará el certificado que le corresponde.');
        }

        if($cantidad_existen == 0 && $cantidad_creados >0){
            Session::flash('exito', 'Se logró registrar '.$cantidad_creados.' pendientes, a quienes se les enviará el certificado que le corresponde.');
        }

        return redirect('/home');
    }

    public function participantes($id) {

        $capa = CertificadosPonentes::find($id);
        $cant = 0;
        
        if(isset($capa)){
            $participantes = Certificados::where('id_capa',$id)->whereIn('estado_envio',['0','1','2','3','9','99','999'])->orderby('nombre_asistente','ASC')->get();
            if(isset($participantes)){
                $capa->participantes= $participantes;
                $capa->enviada= Certificados::where('id_capa',$id)->whereIn('estado_envio',['1'])->orderby('nombre_asistente','ASC')->count();
                $capa->no_enviada= Certificados::where('id_capa',$id)->whereIn('estado_envio',['0'])->orderby('nombre_asistente','ASC')->count();
                $capa->error= Certificados::where('id_capa',$id)->whereIn('estado_envio',['9'])->orderby('nombre_asistente','ASC')->count();
                $capa->error_correo= Certificados::where('id_capa',$id)->whereIn('estado_envio',['999'])->orderby('nombre_asistente','ASC')->count();
                $capa->estado_inicial= Certificados::where('id_capa',$id)->whereIn('estado_envio',['99'])->orderby('nombre_asistente','ASC')->count();
                $capa->proceso= Certificados::where('id_capa',$id)->whereIn('estado_envio',['2'])->orderby('nombre_asistente','ASC')->count();
                $capa->eliminada = Certificados::where('id_capa',$capa->id)->where('estado_envio','3')->count();
            }
        }
        return view('participantes', compact('participantes','capa'));
    }

    public function cancelar($id) {
        $capa = CertificadosPonentes::find($id);
        $cant = 0;
        $eliminar = Certificados::where('id_capa',$id)->whereIn('estado_envio',['0','99'])->get();
        foreach($eliminar as $e){
            $e->estado_envio = '3';
            $e->save();
            $cant++;
        }
        $capa->estado_envio_ponente = '3';
        $capa->capa_estado = '3';
        $capa->save();
        Session::flash('error', 'Se eliminaron con éxito '.$cant.' registros.');
        return redirect('/home');
    }

    public function enviar($id) {
        //CAPACITACION Y PONENTE
        $capa = CertificadosPonentes::where('id',$id)->whereIn('capa_estado',['99'])->first();
        $cant = 0;

        //PARTICIPANTES
        $eliminar = Certificados::where('id_capa',$id)->whereIn('estado_envio',['99'])->get();
        foreach($eliminar as $e){
            $e->estado_envio = '0';
            $e->save();
            $cant++; //cantidad de participantes
        }
        $capa->capa_estado = '0';
        $capa->save();
        Session::flash('exito', 'Se registro el envío de '.$cant.' capacitaciones.');
        return redirect('/home');
    }

    public function enviar_constancia($id) {
        //CAPACITACION Y PONENTE
        $capa = CertificadosPonentes::where('id',$id)->whereIn('estado_envio_ponente',['99'])->first();

        $capa->estado_envio_ponente = '0';
        $capa->save();
        Session::flash('exito', 'Se registro el envío de 1 capacitación.');
        return redirect('/home');
    }

    private function csvToArray($filename = '', $delimiter = ','){
	    if (!file_exists($filename) || !is_readable($filename))
	        return false;

	    $header = null;
	    $data = array();
	    if (($handle = fopen($filename, 'r')) !== false)
	    {
	        while (($row = fgetcsv($handle, 1000, $delimiter)) !== false)
	        {
	            if (!$header)
	                $header = $row;
	            else
	                $data[] = array_combine($header, $row);
	        }
	        fclose($handle);
	    }

	    return $data;
	}

    public function envio(){
        date_default_timezone_set('America/Lima');
        $hoy = getdate();
        $err =0; 
        $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");

        if( $hoy['hours'] >= 7 && $hoy['hours'] <= 18 ){

		}else{

            $ponencias = CertificadosPonentes::whereIn('capa_estado',['0','2'])->get();
            if(isset($ponencias)){
                foreach($ponencias as $p){
                    $certificados_enviar = Certificados::where('id_capa',$p->id)->whereIn('estado_envio',['0','2','9'])->get()->take(1);
                    setlocale(LC_TIME,"es_PE");
                    foreach($certificados_enviar as $c){

                        $capa = CertificadosPonentes::find($p->id);
                        $fecha_ = Carbon::parse($capa->fecha_capa);

                        //SI ES UN ESTADO 2 QUE LLEVA MÁS DE 2 DÍAS EN ESTADO 2 TAMBIÉN SE ENVÍA
                        if($c->estado_envio == '2'){
                            $fecha_actual = date("Y-m-d");
                            
                            if($c->updated_at < date("Y-m-d",strtotime($fecha_actual."-2 days"))){
                                $c->estado_envio = '2';
                                $c->save();


                                // == ENVIANDO certificado a participante
                                $nombre_part = trim(mb_strtoupper($c->nombre_asistente));
                                $detalles = [
                                    'subject' => 'Constancia de asistencia a Telecapacitación - CENATE',
                                ];

                                    $cant_text = 43;
                                    $top_text = 340;
                                    if(strlen($nombre_part)<=33){
                                        $cant_text = 43;
                                    }else{
                                        if(strlen($nombre_part)>=80){
                                            $cant_text=15;
                                            $top_text = 370;
                                        }elseif(strlen($nombre_part)>=70){
                                            $cant_text=20;
                                            $top_text = 365;
                                        }elseif(strlen($nombre_part)>=60){
                                            $cant_text=25;
                                            $top_text = 360;
                                        }elseif(strlen($nombre_part)>=50){
                                            $cant_text=30;
                                            $top_text = 350;
                                        }elseif(strlen($nombre_part)>=40){
                                            $cant_text=35;
                                            $top_text = 345;
                                        }
                                    }
                        
                                    $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                                    ob_start();
                                    $mpdf_participante->WriteHtml('
                                    <html>
                                    <head>
                                    <meta charset="UTF-8">
                                    <title></title>
                                    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                                    </head>
                                    <body>
                                    <div style= "position:absolute; top:0px; left:0px;" ><img src = "/img/fondo_participante.png"/></div>
                                    <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#183D70; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                                    <div style= "position:absolute; font-size:18; top:405px; left:190px; width:750px; text-align:center;" >
                                    Por su participación como <b>ASISTENTE</b> en la Telecapacitación: <br/>
                                    <b>“'.$capa->nombre_capa.'”,</b><br/>
                                    organizada por el Centro Nacional de Telemedicina el día '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                                    <div style= "position:absolute; font-size:16; top:530px; left:665px; width:350px; text-align:center;" >
                                    Lima, '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                                    </body>
                                    </html>
                                    ',\Mpdf\HTMLParserMode::HTML_BODY); 
                                $pdf_participante=$mpdf_participante->Output('', 'S');
                                //$mpdf_2->Output();
                                //$content = chunk_split(base64_encode($pdf));
                                $now = new \DateTime();
                                $actual=$now->format('Y-m-d H:i:s');
                        
                                $filename = "constancia.pdf";
                                $nombrep = $nombre_part;
                                $correop = $c->correo_asistente;

                                try {
                                    Mail::send('mail.mail',$detalles, function($message) use($pdf_participante,$filename,$nombrep,$correop,$c){
                                        $message ->from('telemedicina.cenate@essalud.gob.pe','Telemedicina');
                                        $message ->to($correop);
                                        //$message ->cc('alfredoenriquericciale@gmail.com');
                                        $message ->subject('Constancia de asistencia a Telecapacitación - CENATE');
                                        $message ->attachData($pdf_participante, $nombrep.'_constancia_participante.pdf', [
                                            'mime' => 'application/pdf',
                                        ]);
                                    });
                                } catch (\Exception $e) {

                                    if($e->getCode()){
                                        $c->estado_envio = '999';
                                        $c->save();
                                        // ERROR AL ENVIAR CERTIFICADO PARTICIPANTE (CORREO NO EXISTE)
                                    }else{
                                        $c->estado_envio = '9';
                                        $c->save();
                                        $err++;
                                        dd($c);
                                         // ERROR AL ENVIAR CERTIFICADO PARTICIPANTE (ERROR SERVIDOR CORREO)
                                    }
                                }

                                if($c->estado_envio != '9' && $c->estado_envio != '999'){
                                    $c->estado_envio = '1';
                                    $c->save();
                                }else{ 
                                }


                                //== DECIDIENDO SI EL ENVÍO DE TODOS LOS CERTIFICADOS DE ESA CAPACITACIÓN YA SE ENVIARON O AÚN NO
                                $no_enviado = Certificados::where('id_capa',$c->id_capa)->whereIn('estado_envio',['0','2','9'])->count();
                                if($no_enviado == 0){
                                    $capa->capa_estado = '1';
                                    $capa->save();
                                }else{
                                    $capa->capa_estado = '2';
                                    $capa->save();
                                }
                                
                            }
                        }else{

                            $c->estado_envio = '2';
                            $c->save();

                            // == ENVIANDO certificado a participante
                            $nombre_part = trim(mb_strtoupper($c->nombre_asistente));
                            $detalles = [
                                'subject' => 'CERTIFICADO DE CAPACITACIÓN',
                            ];

                                $cant_text = 43;
                                $top_text = 340;
                                if(strlen($nombre_part)<=33){
                                    $cant_text = 43;
                                }else{
                                    if(strlen($nombre_part)>=80){
                                        $cant_text=15;
                                        $top_text = 370;
                                    }elseif(strlen($nombre_part)>=70){
                                        $cant_text=20;
                                        $top_text = 365;
                                    }elseif(strlen($nombre_part)>=60){
                                        $cant_text=25;
                                        $top_text = 360;
                                    }elseif(strlen($nombre_part)>=50){
                                        $cant_text=30;
                                        $top_text = 350;
                                    }elseif(strlen($nombre_part)>=40){
                                        $cant_text=35;
                                        $top_text = 345;
                                    }
                                }
                    
                                $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                                ob_start();
                                $mpdf_participante->WriteHtml('
                                <html>
                                <head>
                                <meta charset="UTF-8">
                                <title></title>
                                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                                </head>
                                <body>
                                <div style= "position:absolute; top:0px; left:0px;" ><img src = "/img/fondo_participante.png"/></div>
                                <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#183D70; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                                <div style= "position:absolute; font-size:18; top:405px; left:190px; width:750px; text-align:center;" >
                                Por su participación como <b>ASISTENTE</b> en la Telecapacitación: <br/>
                                <b>“'.$capa->nombre_capa.'”,</b><br/>
                                organizada por el Centro Nacional de Telemedicina el día '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                                <div style= "position:absolute; font-size:16; top:530px; left:665px; width:350px; text-align:center;" >
                                Lima, '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                                </body>
                                </html>
                                ',\Mpdf\HTMLParserMode::HTML_BODY); 
                            $pdf_participante=$mpdf_participante->Output('', 'S');
                            //$mpdf_2->Output();
                            //$content = chunk_split(base64_encode($pdf));
                            $now = new \DateTime();
                            $actual=$now->format('Y-m-d H:i:s');
                    
                            $filename = "constancia.pdf";
                            $nombrep = $nombre_part;
                            $correop = $c->correo_asistente;

                            try {
                                
                                Mail::send('mail.mail',$detalles, function($message) use($pdf_participante,$filename,$nombrep,$correop,$c){
                                    $message ->from('telemedicina.cenate@essalud.gob.pe','Telemedicina');
                                    $message ->to($correop);
                                    //$message ->cc('alfredoenriquericciale@gmail.com');
                                    $message ->subject('Constancia de asistencia a Telecapacitación - CENATE');
                                    $message ->attachData($pdf_participante, $nombrep.'_constancia_participante.pdf', [
                                        'mime' => 'application/pdf',
                                    ]);
                                });
                            } catch (\Exception $e) {

                                if($e->getCode()){
                                    $c->estado_envio = '999';
                                    $c->save();
                                    // ERROR AL ENVIAR CERTIFICADO PARTICIPANTE (CORREO NO EXISTE)
                                }else{
                                    $c->estado_envio = '9';
                                    $c->save();
                                    $err++;
                                    dd($c);
                                     // ERROR AL ENVIAR CERTIFICADO PARTICIPANTE (ERROR SERVIDOR CORREO)
                                }
                               
                            }

                            if($c->estado_envio != 9 && $c->estado_envio != 999){
                                $c->estado_envio = 1;
                                $c->save();
                            }else{
                                
                            }

                            //dd($c->estado_envio);

                            //== DECIDIENDO SI EL ENVÍO DE TODOS LOS CERTIFICADOS DE ESA CAPACITACIÓN YA SE ENVIARON O AÚN NO
                            $no_enviado = Certificados::where('id_capa',$c->id_capa)->whereIn('estado_envio',['0','2','9'])->count();
                            if($no_enviado == 0){
                                $capa->capa_estado = '1';
                                $capa->save();
                            }else{
                                $capa->capa_estado = '2';
                                $capa->save();
                            }

                        }

                    }
                    $capa = CertificadosPonentes::find($p->id);
                    $no_enviado = Certificados::where('id_capa',$p->id)->whereIn('estado_envio',['0','2','9'])->count();
                    if($no_enviado == 0){
                        $capa->capa_estado = '1';
                        $capa->save();
                        //dd('ejemplo');
                    }else{
                        $capa->capa_estado = '2';
                        $capa->save();
                    }
                }
            }

            $ponentes_enviar = CertificadosPonentes::whereIn('estado_envio_ponente',['0','9','2'])->get()->take(1);
            if(isset($ponentes_enviar)){
                foreach($ponentes_enviar as $p){
                    $capa = CertificadosPonentes::find($p->id);
                    $fecha_ = Carbon::parse($capa->fecha_capa);

                    if($capa->estado_envio_ponente == '0' || $capa->estado_envio_ponente == '9' || ($capa->estado_envio_ponente == '2' && $capa->updated_at < date("Y-m-d",strtotime($fecha_actual."-2 days")))){
                        $capa->estado_envio_ponente = 2;
                        $capa->save();

                        $nombre_ponente = trim(mb_strtoupper($capa->ponente));
                        $detalles = [
                            'subject' => 'CERTIFICADO DE CAPACITACIÓN',
                        ];

                            $cant_text = 43;
                            $top_text = 340;
                            if(strlen($nombre_ponente)<=33){
                                $cant_text = 43;
                            }else{
                                if(strlen($nombre_ponente)>=80){
                                    $cant_text=15;
                                    $top_text = 370;
                                }elseif(strlen($nombre_ponente)>=70){
                                    $cant_text=20;
                                    $top_text = 365;
                                }elseif(strlen($nombre_ponente)>=60){
                                    $cant_text=25;
                                    $top_text = 360;
                                }elseif(strlen($nombre_ponente)>=50){
                                    $cant_text=30;
                                    $top_text = 350;
                                }elseif(strlen($nombre_ponente)>=40){
                                    $cant_text=35;
                                    $top_text = 345;
                                }
                            }
                
                            $mpdf_ponente = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                            ob_start();
                            $mpdf_ponente->WriteHtml('
                            <html>
                            <head>
                            <meta charset="UTF-8">
                            <title></title>
                            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                            </head>
                            <body>
                            <div style= "position:absolute; top:0px; left:0px;" ><img src = "/img/fondo_ponente.png"/></div>
                            <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#183D70; width:100%; text-align:center;" ><b>'.$nombre_ponente.'</b></div>
                            <div style= "position:absolute; font-size:18; top:405px; left:190px; width:750px; text-align:center;" >
                            Por su participación como <b>PONENTE</b> en la Telecapacitación: <br/>
                            <b>“'.$capa->nombre_capa.'”,</b><br/>
                            organizada por el Centro Nacional de Telemedicina el día '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                            <div style= "position:absolute; font-size:16; top:530px; left:665px; width:350px; text-align:center;" >
                            Lima, '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                            </body>
                            </html>
                            ',\Mpdf\HTMLParserMode::HTML_BODY); 
                        $pdf_ponente=$mpdf_ponente->Output('', 'S');
                        //$mpdf_2->Output();
                        //$content = chunk_split(base64_encode($pdf));
                        $now = new \DateTime();
                        $actual=$now->format('Y-m-d H:i:s');
                
                        $filename = "constancia.pdf";
                        $nombrep = $nombre_ponente;
                        $correop = $capa->correo_ponente;

                        try {
                            Mail::send('mail.mail_ponente',$detalles, function($message) use($pdf_ponente,$filename,$nombrep,$correop,$capa){
                                $message ->from('telemedicina.cenate@essalud.gob.pe','Telemedicina');
                                $message ->to($correop);
                                //$message ->cc('alfredoenriquericciale@gmail.com');
                                $message ->subject('CERTIFICADO DE CAPACITACIÓN COMO PONENTE');
                                $message ->attachData($pdf_ponente, $nombrep.'_constancia_ponente.pdf', [
                                    'mime' => 'application/pdf',
                                ]);

                            });

                        } catch (\Exception $e) {

                            if($e->getCode()){
                                $capa->estado_envio_ponente = '999';
                                $capa->save();
                                // ERROR AL ENVIAR CERTIFICADO PONENTE (CORREO NO EXISTE)
                            }else{
                                $capa->estado_envio_ponente = '9';
                                $capa->save();
                                $err++;
                                
                                 // ERROR AL ENVIAR CERTIFICADO PONENTE (ERROR SERVIDOR CORREO)
                            }
                        }
                        if($capa->estado_envio_ponente != '9' && $capa->estado_envio_ponente != '999'){
                            $capa->estado_envio_ponente = '1';
                            $capa->save();
                        }else{
                        
                        }
                    }
                }
            }
            //dd($ponentes_enviar);


        }

        $capacitaciones= CertificadosPonentes::whereIn('capa_estado', ['0','1','2','99'])->orderby('fecha_capa','DESC')->get();
        $total_porenviar= 0;
        $total_enviadas= 0;
        if(isset($capacitaciones)){
            foreach($capacitaciones as $capa){
                $capa->fecha = date('d-m-Y', strtotime($capa->fecha_capa));
                $capa->asistentes_enviada = Certificados::where('id_capa',$capa->id)->where('estado_envio','1')->count();
                $capa->asistentes_noenviada = Certificados::where('id_capa',$capa->id)->where('estado_envio','0')->count();
                $capa->error = Certificados::where('id_capa',$capa->id)->where('estado_envio','9')->count(); 
                $capa->error_correo = Certificados::where('id_capa',$capa->id)->where('estado_envio','999')->count(); 
                $capa->estado_inicial = Certificados::where('id_capa',$capa->id)->where('estado_envio','99')->count(); 
                $capa->asistentes_proceso = Certificados::where('id_capa',$capa->id)->where('estado_envio','2')->count();
                $capa->asistentes_eliminada = Certificados::where('id_capa',$capa->id)->where('estado_envio','3')->count();
                $total_porenviar = $capa->asistentes_noenviada+$capa->asistentes_proceso+$capa->error + $capa->estado_inicial+$total_porenviar;
                $total_enviadas = $capa->asistentes_enviada +$total_enviadas;

            }
        }

        $data[0]= $capacitaciones;
        $data[1]= $total_porenviar;
        $data[2]= $err;
        $data[3]= $total_enviadas;
        return json_encode($data);
    }


    public function certificado_PDF($tipo, $id){
        date_default_timezone_set('America/Lima');
        setlocale(LC_TIME,"es_PE");

        date_default_timezone_set('America/Lima');
        setlocale(LC_TIME,"es_PE");

        $c = Certificados::find($id);
        $capa = CertificadosPonentes::find($c->id_capa);
        $fecha_ =Carbon::parse($capa->fecha_capa);

        // == ENVIANDO certificado a participante
        $nombre_part = trim(mb_strtoupper($c->nombre_asistente));
            $cant_text = 43;
            $top_text = 340;
            if(strlen($nombre_part)<=33){
                $cant_text = 43;
            }else{
                if(strlen($nombre_part)>=80){
                    $cant_text=15;
                    $top_text = 370;
                }elseif(strlen($nombre_part)>=70){
                    $cant_text=20;
                    $top_text = 365;
                }elseif(strlen($nombre_part)>=60){
                    $cant_text=25;
                    $top_text = 360;
                }elseif(strlen($nombre_part)>=50){
                    $cant_text=30;
                    $top_text = 350;
                }elseif(strlen($nombre_part)>=40){
                    $cant_text=35;
                    $top_text = 345;
                }
            }

            $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
            ob_start();
            $mpdf_participante->WriteHtml('
                <html>
                <head>
                <meta charset="UTF-8">
                <title>'.$nombre_part.'</title>
                <link type="image/x-icon" href="/assets/img/essalud_logo.png" rel="icon">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                </head>
                <body>
                <div style= "position:absolute; top:0px; left:0px;" ><img src = "/img/fondo_participante.png"/></div>
                <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#183D70; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                <div style= "position:absolute; font-size:18; top:405px; left:190px; width:750px; text-align:center;" >
                Por su participación como <b>ASISTENTE</b> en la Telecapacitación: <br/>
                <b>“'.$capa->nombre_capa.'”,</b><br/>
                organizada por el Centro Nacional de Telemedicina el día '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                <div style= "position:absolute; font-size:16; top:530px; left:665px; width:350px; text-align:center;" >
                Lima, '.strftime("%d", strtotime($capa->fecha_capa)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($capa->fecha_capa)).'.</div>
                </body>
            </html>
            ',\Mpdf\HTMLParserMode::HTML_BODY); 
        $pdf_participante=$mpdf_participante->Output('', 'S');
        $mpdf_participante->Output();
        //$content = chunk_split(base64_encode($pdf));

    }


}
