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
use App\Models\StaffDetalle;
use App\Models\User;
use App\Models\Certi;
use App\Models\cargac;
use App\Models\mejores_p;


class Certificado extends Controller{

    //
    public function crear(){
        return view('evento.certificado.certificate-designer');
    }

    public function ver($tipo, $id_evento, $id_user){
        $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");


        /*
            $mejores_p = mejores_p::all();

            $countno =0;
            foreach($mejores_p as $m){
                $encuentra = EventoUserAsistenteDetalle::where('id_user_asistencia',$m->id_user)->get();
                
                if($encuentra->isEmpty()){
                    //no existen
                    $countno++;
                    $nuevo = new EventoUserAsistenteDetalle();
                    $nuevo->id_evento = '1';
                    $nuevo->id_evento_detalle = '1';
                    $nuevo->id_user_asistencia = $m->id_user;
                    $nuevo->tipo_marcado = 'm_inicio';
                    $nuevo->save();

                }else{
                //si existen
                }
                
            }
            
            dd($countno);
        */

        $participante = User::find($id_user);
        if(isset($participante)){
            if($tipo == '3' || $tipo == '2' ||  $tipo == '4' || $tipo == '1' ){
                $actividad = Actividad::find($id_evento);
                $evento_detalle = EventoDetalle::find($actividad->id_evento_detalle);
                $evento = Evento::find($actividad->id_evento);
                $participante_staff = StaffDetalle::where('id_evento',$evento->id)->where('id_actividad',$actividad->id)->where('id_user_ponente',$participante->id)->first();
            }else{
                $evento = Evento::find($id_evento); //se deben considerar solo los eventos que han terminado (una vez que se termine el evento recién podrían recibir sus certificados?)
                $ruta_fondo = '';
                $participante_staff = StaffDetalle::where('id_evento',$evento->id)->where('id_user_ponente',$participante->id)->first();
            }
            
            if(isset($evento)){
                if($tipo == '1'){ // (listo) urgente presentador
                    //certificado como presentador

                    if(isset($participante_staff)){
                        $actividad_detalle = EventoDetalle::find($actividad->id_evento_detalle);
                        $participante_staff->actividad = $actividad;
                    }else{     
                        $participante->certificado = 'no';
                    }

                    $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado1;

                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    //$c = Certificados::find($id);
                    //$capa = CertificadosPonentes::find($c->id_capa);
                    //$fecha_ =Carbon::parse($capa->fecha_capa);
            
                    // == ENVIANDO certificado a participante
                    $nombre_part = trim(mb_strtoupper($participante->name));

                    if(trim($participante->apellidos)){
                        $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                    }
                    
                    $cant_text = 43;
                    $top_text = 300;
                    if(strlen($nombre_part)<=33){
                        $cant_text = 43;
                    }else{
                        if(strlen($nombre_part)>=80){
                            $cant_text=15;
                            $top_text = 330;
                        }elseif(strlen($nombre_part)>=70){
                            $cant_text=20;
                            $top_text = 325;
                        }elseif(strlen($nombre_part)>=60){
                            $cant_text=25;
                            $top_text = 320;
                        }elseif(strlen($nombre_part)>=50){
                            $cant_text=30;
                            $top_text = 310;
                        }elseif(strlen($nombre_part)>=40){
                            $cant_text=35;
                            $top_text = 305;
                        }
                    }

                    $fecha_ = Carbon::parse($actividad->created_at);


                    $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                    ob_start();
                    $mpdf_participante->WriteHtml('
                    <html>
                        <head>
                        <meta charset="UTF-8">
                        <link type="image/x-icon" href="/image/icono.png" rel="icon">
                        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                        </head>
                        <body>
                        <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                        <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                        <div style="color:gray; position:absolute; font-family:greatvibes-regular; font-size:25; top:'.($top_text+55).'px; left:3px; width:100%; text-align:center;" >'.$participante_staff->institucion.'</div>
                        <div style= "position:absolute; font-size:21; top:415px; left:65px; width:1000px; text-align:center;" >
                            Por haber participado en calidad de <b>PRESENTADOR</b> de: <br/>
                            <b>“'.$actividad->nombre_actividad.'”,</b><br/>
                            <b> '.$evento->nombre.',</b> realizado el '.strftime("%d", strtotime($actividad_detalle->fecha_hora_inicio)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad_detalle->fecha_hora_inicio)).'.</div>
                            <div style= "position:absolute; font-size:23; top:530px; left:720px; width:350px; text-align:center;" >
                        Lima, '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($evento->fecha_inicio)).'.</div>
                        </body>
                    </html>
                    ',\Mpdf\HTMLParserMode::HTML_BODY); 
                    $pdf_participante=$mpdf_participante->Output('', 'S');
                    ob_end_clean();

                    $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                    //$content = chunk_split(base64_encode($pdf));

                    
                }elseif($tipo == '2'){ // (listo) urgente moderador
                    //certificado como moderador

                    if(isset($participante_staff)){
                        $actividad_detalle = EventoDetalle::find($actividad->id_evento_detalle);
                        $participante_staff->actividad = $actividad;
                    }else{     
                        $participante->certificado = 'no';
                    }

                    $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado2;

                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    //$c = Certificados::find($id);
                    //$capa = CertificadosPonentes::find($c->id_capa);
                    //$fecha_ =Carbon::parse($capa->fecha_capa);
            
                    // == ENVIANDO certificado a participante
                    $nombre_part = trim(mb_strtoupper($participante->name));

                    if(trim($participante->apellidos)){
                        $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                    }
                    
                    $cant_text = 43;
                    $top_text = 300;
                    if(strlen($nombre_part)<=33){
                        $cant_text = 43;
                    }else{
                        if(strlen($nombre_part)>=80){
                            $cant_text=15;
                            $top_text = 330;
                        }elseif(strlen($nombre_part)>=70){
                            $cant_text=20;
                            $top_text = 325;
                        }elseif(strlen($nombre_part)>=60){
                            $cant_text=25;
                            $top_text = 320;
                        }elseif(strlen($nombre_part)>=50){
                            $cant_text=30;
                            $top_text = 310;
                        }elseif(strlen($nombre_part)>=40){
                            $cant_text=35;
                            $top_text = 305;
                        }
                    }

                    $fecha_ = Carbon::parse($actividad->created_at);


                    $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                    ob_start();
                    $mpdf_participante->WriteHtml('
                    <html>
                        <head>
                        <meta charset="UTF-8">
                        <link type="image/x-icon" href="/image/icono.png" rel="icon">
                        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                        </head>
                        <body>
                        <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                        <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                        <div style="color:gray; position:absolute; font-family:greatvibes-regular; font-size:25; top:'.($top_text+55).'px; left:3px; width:100%; text-align:center;" >'.$participante_staff->institucion.'</div>
                        <div style= "position:absolute; font-size:21; top:415px; left:65px; width:1000px; text-align:center;" >
                            Por haber participado en calidad de <b>MODERADOR</b> en el panel: <br/>
                            <b>“'.$actividad->nombre_actividad.'”,</b><br/>
                            <b> '.$evento->nombre.',</b> realizado el '.strftime("%d", strtotime($actividad_detalle->fecha_hora_inicio)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad_detalle->fecha_hora_inicio)).'.</div>
                            <div style= "position:absolute; font-size:23; top:530px; left:720px; width:350px; text-align:center;" >
                        Lima, '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($evento->fecha_inicio)).'.</div>
                        </body>
                    </html>
                    ',\Mpdf\HTMLParserMode::HTML_BODY); 
                    $pdf_participante=$mpdf_participante->Output('', 'S');
                    ob_end_clean();

                    $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                    //$content = chunk_split(base64_encode($pdf));
                        
        
                }elseif($tipo == '3'){ // (listo) urgente ponente
                    //certificado como ponente
                    //evento si entrega certificado al marcar al menos una asistencia en todo el evento
                    if(isset($participante_staff)){
                        $actividad_detalle = EventoDetalle::find($actividad->id_evento_detalle);
                        $participante_staff->actividad = $actividad;
                    }else{     
                        $participante->certificado = 'no';
                    }

                    $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado3;

                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    //$c = Certificados::find($id);
                    //$capa = CertificadosPonentes::find($c->id_capa);
                    //$fecha_ =Carbon::parse($capa->fecha_capa);
            
                    // == ENVIANDO certificado a participante
                    $nombre_part = trim(mb_strtoupper($participante->name));

                    if(trim($participante->apellidos)){
                        $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                    }
                    
                    $cant_text = 43;
                    $top_text = 300;
                    if(strlen($nombre_part)<=33){
                        $cant_text = 43;
                    }else{
                        if(strlen($nombre_part)>=80){
                            $cant_text=15;
                            $top_text = 330;
                        }elseif(strlen($nombre_part)>=70){
                            $cant_text=20;
                            $top_text = 325;
                        }elseif(strlen($nombre_part)>=60){
                            $cant_text=25;
                            $top_text = 320;
                        }elseif(strlen($nombre_part)>=50){
                            $cant_text=30;
                            $top_text = 310;
                        }elseif(strlen($nombre_part)>=40){
                            $cant_text=35;
                            $top_text = 305;
                        }
                    }

                    $fecha_ = Carbon::parse($actividad_detalle->fecha_hora_inicio);


                    $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                    ob_start();
                    $mpdf_participante->WriteHtml('
                    <html>
                        <head>
                        <meta charset="UTF-8">
                        <link type="image/x-icon" href="/image/icono.png" rel="icon">
                        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                        </head>
                        <body>
                        <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                        <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                        <div style="color:gray; position:absolute; font-family:greatvibes-regular; font-size:25; top:'.($top_text+55).'px; left:3px; width:100%; text-align:center;" >'.$participante_staff->institucion.'</div>
                        <div style= "position:absolute; font-size:21; top:415px; left:65px; width:1000px; text-align:center;" >
                            Por haber participado en calidad de <b>PONENTE</b> con el tema: <br/>
                            <b>“'.$actividad->nombre_actividad.'”,</b><br/>
                            <b>'.$evento->nombre.',</b> realizado el '.strftime("%d", strtotime($actividad_detalle->fecha_hora_inicio)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad_detalle->fecha_hora_inicio)).'.</div>
                            <div style= "position:absolute; font-size:23; top:530px; left:720px; width:350px; text-align:center;" >
                        Lima, '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($evento->fecha_inicio)).'.</div>
                        </body>
                    </html>
                    ',\Mpdf\HTMLParserMode::HTML_BODY); 
                    $pdf_participante=$mpdf_participante->Output('', 'S');
                    ob_end_clean();

                    $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                    //$content = chunk_split(base64_encode($pdf));
                        
                }elseif($tipo == '4'){ // (listo) urgente panelista
                    //certificado como panelista
                    if(isset($participante_staff)){
                        $actividad_detalle = EventoDetalle::find($actividad->id_evento_detalle);
                        $participante_staff->actividad = $actividad;
                    }else{     
                        $participante->certificado = 'no';
                    }

                    $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado4;

                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    //$c = Certificados::find($id);
                    //$capa = CertificadosPonentes::find($c->id_capa);
                    //$fecha_ =Carbon::parse($capa->fecha_capa);
            
                    // == ENVIANDO certificado a participante
                    $nombre_part = trim(mb_strtoupper($participante->name));

                    if(trim($participante->apellidos)){
                        $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                    }
                    
                    $cant_text = 43;
                    $top_text = 300;
                    if(strlen($nombre_part)<=33){
                        $cant_text = 43;
                    }else{
                        if(strlen($nombre_part)>=80){
                            $cant_text=15;
                            $top_text = 330;
                        }elseif(strlen($nombre_part)>=70){
                            $cant_text=20;
                            $top_text = 325;
                        }elseif(strlen($nombre_part)>=60){
                            $cant_text=25;
                            $top_text = 320;
                        }elseif(strlen($nombre_part)>=50){
                            $cant_text=30;
                            $top_text = 310;
                        }elseif(strlen($nombre_part)>=40){
                            $cant_text=35;
                            $top_text = 305;
                        }
                    }

                    $fecha_ = Carbon::parse($actividad_detalle->fecha_hora_inicio);


                    $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                    ob_start();
                    $mpdf_participante->WriteHtml('
                    <html>
                        <head>
                        <meta charset="UTF-8">
                        <link type="image/x-icon" href="/image/icono.png" rel="icon">
                        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                        </head>
                        <body>
                        <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                        <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                        <div style="color:gray; position:absolute; font-family:greatvibes-regular; font-size:25; top:'.($top_text+55).'px; left:3px; width:100%; text-align:center;" >'.$participante_staff->institucion.'</div>
                        <div style= "position:absolute; font-size:21; top:415px; left:65px; width:1000px; text-align:center;" >
                            Por haber participado en calidad de <b>PANELISTA</b> en: <br/>
                            <b>“'.$actividad->nombre_actividad.'”,</b><br/>
                            <b>'.$evento->nombre.',</b> realizado el '.strftime("%d", strtotime($actividad_detalle->fecha_hora_inicio)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad_detalle->fecha_hora_inicio)).'.</div>
                            <div style= "position:absolute; font-size:23; top:530px; left:720px; width:350px; text-align:center;" >
                        Lima, '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($evento->fecha_inicio)).'.</div>
                        </body>
                    </html>
                    ',\Mpdf\HTMLParserMode::HTML_BODY); 
                    $pdf_participante=$mpdf_participante->Output('', 'S');
                    ob_end_clean();

                    $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                    //$content = chunk_split(base64_encode($pdf));
                }elseif($tipo == '7'){ // ==>> (listo) urgente asistente evento
                    //certificado como participante
                    if($evento->certificado == '0'){
                        //este evento no entre certificado
                        dd('aún no hay estos eventos');
    
                    }elseif($evento->certificado == '1'){
                        //evento si entrega certificado al marcar todas las asistencias
                        dd('aún no hay estos eventos');
                        
                    }elseif($evento->certificado == '2'){
                         //evento si entrega certificado al marcar al menos una asistencia por día
                        dd('aún no hay estos eventos');
                        
                    }elseif($evento->certificado == '3'){
                        
                         //evento si entrega certificado al marcar al menos una asistencia en todo el evento
                        $certi = Certi::where('id_evento',$evento->id)->where('id_user',$participante->id)->where('tipo','7')->first();
                        if(isset($certi)){
                            $certi->visita = $certi->visita+1;
                            $certi->save();
                        }else{
                            $ulti_certi = Certi::where('id_evento',$evento->id)->where('tipo','7')->orderby('nro_certificado','DESC')->first();
                            if(isset($ulti_certi)){
                                $nro_certi = ($ulti_certi->nro_certificado)+1;
                            }else{
                                $nro_certi = ($evento->starnum_certi7)+1;
                            }               
                            
                            $certi = new Certi();
                            $certi->id_evento = $evento->id;
                            $certi->id_user = $participante->id;
                            $certi->tipo = 7;
                            $certi->visita = 1;
                            $certi->nro_certificado = $nro_certi;
                            $certi->save();
                        }

                        // Cuenta el número de caracteres '$' en el registro base
                        $num_dolares = substr_count($evento->numeracion_certi7, '$');
                        // Formatea el número con ceros a la izquierda (4 dígitos en este caso)
                        $numero_formateado = str_pad($certi->nro_certificado, $num_dolares, '0', STR_PAD_LEFT);
                        // Reemplaza los símbolos '$$$$' con el número formateado
                        $registro_final = str_replace(str_repeat('$', $num_dolares), $numero_formateado, $evento->numeracion_certi7);

                        $res = EventoUserAsistenteDetalle::where('id_evento',$evento->id)->where('id_user_asistencia',$participante->id)->first();
                        if(isset($res)){
                            $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado7;
    
                            date_default_timezone_set('America/Lima');
                            setlocale(LC_TIME,"es_PE");
                    
                            date_default_timezone_set('America/Lima');
                            setlocale(LC_TIME,"es_PE");
                    
                            //$c = Certificados::find($id);
                            //$capa = CertificadosPonentes::find($c->id_capa);
                            //$fecha_ =Carbon::parse($capa->fecha_capa);
                    
                            // == ENVIANDO certificado a participante
                            $nombre_part = trim(mb_strtoupper($participante->name));

                            if(trim($participante->apellidos)){
                                $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                            }
                            
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

/*
                            $user = cargac::all();
                            if($user){
                                foreach($user as $u){

                                    $re = new EventoUserAsistenteDetalle();
                                    $re->id_evento = 2;
                                    $re->id_user_asistencia = $u->id_user;
                                    $re->tipo_marcado ='inicio';
                                    $re->save();

                                    $u->e2 = 1;
                                    $u->save();

                                }
                            }
 */

                            /*
                            $evento = cargac::whereNotNull('id_user')->get();
                            if($evento){
                                foreach($evento as $e){
                                    $re = EventoUserAsistenteDetalle::where('id_user_asistencia',$e->id_user)->first();
                                    if($re){

                                    }else{
                                        $re = new EventoUserAsistenteDetalle();
                                        $re->id_evento = 1;
                                        $re->id_evento_detalle = 1;
                                        $re->id_user_asistencia = $e->id_user;
                                        $re->tipo_marcado ='inicio';
                                        $re->save();
                                    }
                                }
                            }
                            */

                            $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                            ob_start();
                            $mpdf_participante->WriteHtml('
                            <html>
                                <head>
                                <meta charset="UTF-8">
                                <link type="image/x-icon" href="/image/icono.png" rel="icon">
                                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                                </head>
                                <body>
                                <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                                <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                                <div style="position:absolute; top:760px; left:20px; font-family:\'Great Vibes\', cursive; font-size:10px; color:#FFF;"><b>' . $registro_final . '</b> </div>
                                </body>
                            </html>
                            ',\Mpdf\HTMLParserMode::HTML_BODY); 
                            $pdf_participante=$mpdf_participante->Output('', 'S');
                            ob_end_clean();

                            $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                            //$content = chunk_split(base64_encode($pdf));
                            
                        }else{
                            return view('evento.asistencia.mensaje');
                            dd('No hay asistencia registrada');
                            
                        }
                    }
        
                }elseif($tipo == '8'){// ==>> (listo) urgente asistente parte de organizador

                    //certificado como participante que ha sido parte de organización
                    if($evento->certificado == '0'){
                        //este evento no entre certificado
                        dd('aún no hay estos eventos');
    
                    }elseif($evento->certificado == '1'){
                        //evento si entrega certificado al marcar todas las asistencias
                        dd('aún no hay estos eventos');
                        
                    }elseif($evento->certificado == '2'){
                         //evento si entrega certificado al marcar al menos una asistencia por día
                        dd('aún no hay estos eventos');
                        
                    }elseif($evento->certificado == '3'){
                         //evento si entrega certificado al marcar al menos una asistencia en todo el evento
                        $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado7;

                        date_default_timezone_set('America/Lima');
                        setlocale(LC_TIME,"es_PE");
                
                        date_default_timezone_set('America/Lima');
                        setlocale(LC_TIME,"es_PE");
                
                        //$c = Certificados::find($id);
                        //$capa = CertificadosPonentes::find($c->id_capa);
                        //$fecha_ =Carbon::parse($capa->fecha_capa);
                
                        // == ENVIANDO certificado a participante
                        $nombre_part = trim(mb_strtoupper($participante->name));

                        if(trim($participante->apellidos)){
                            $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                        }
                        
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
                            <link type="image/x-icon" href="/image/icono.png" rel="icon">
                            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                            </head>
                            <body>
                            <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                            <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                            </body>
                        </html>
                        ',\Mpdf\HTMLParserMode::HTML_BODY); 
                        $pdf_participante=$mpdf_participante->Output('', 'S');
                        ob_end_clean();

                        $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                        //$content = chunk_split(base64_encode($pdf));
                            
                    }
        
                }elseif($tipo == '10'){//pendiente organizador
                    //certificado como organizador

                    $participante_staff = StaffDetalle::where('id_evento',$evento->id)->where('id_user_ponente',$participante->id)->first();
                    if(isset($participante_staff)){
                        $actividad = Actividad::find($participante_staff->id_actividad);
                        $participante_staff->actividad = $actividad;
                    }else{     
                        $participante->certificado = 'no';
                    }

                    $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado10;

                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    //$c = Certificados::find($id);
                    //$capa = CertificadosPonentes::find($c->id_capa);
                    //$fecha_ =Carbon::parse($capa->fecha_capa);
            
                    // == ENVIANDO certificado a participante
                    $nombre_part = trim(mb_strtoupper($participante->name));

                    if(trim($participante->apellidos)){
                        $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                    }
                    
                    $cant_text = 43;
                    $top_text = 300;
                    if(strlen($nombre_part)<=33){
                        $cant_text = 43;
                    }else{
                        if(strlen($nombre_part)>=80){
                            $cant_text=15;
                            $top_text = 330;
                        }elseif(strlen($nombre_part)>=70){
                            $cant_text=20;
                            $top_text = 325;
                        }elseif(strlen($nombre_part)>=60){
                            $cant_text=25;
                            $top_text = 320;
                        }elseif(strlen($nombre_part)>=50){
                            $cant_text=30;
                            $top_text = 310;
                        }elseif(strlen($nombre_part)>=40){
                            $cant_text=35;
                            $top_text = 305;
                        }
                    }

                    $fecha_ = Carbon::parse($actividad->created_at);


                    $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                    ob_start();
                    $mpdf_participante->WriteHtml('
                    <html>
                        <head>
                        <meta charset="UTF-8">
                        <link type="image/x-icon" href="/image/icono.png" rel="icon">
                        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                        </head>
                        <body>
                        <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                        <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                        <div style="color:gray; position:absolute; font-family:greatvibes-regular; font-size:25; top:'.($top_text+55).'px; left:3px; width:100%; text-align:center;" >'.$participante_staff->institucion.'</div>
                        <div style= "position:absolute; font-size:21; top:415px; left:65px; width:1000px; text-align:center;" >
                            Por haber participado en calidad de <b>ORGANIZADOR</b> en el:<br/>
                            <b>V Congreso Internacional de Telesalud 2023,</b> realizado el '.strftime("%d", strtotime($actividad->created_at)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad->created_at)).'.</div>
                        <div style= "position:absolute; font-size:23; top:530px; left:720px; width:350px; text-align:center;" >
                        Lima, '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad->created_at)).'.</div>
                        </body>
                    </html>
                    ',\Mpdf\HTMLParserMode::HTML_BODY); 
                    $pdf_participante=$mpdf_participante->Output('', 'S');
                    ob_end_clean();

                    $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                    //$content = chunk_split(base64_encode($pdf));
                        
        
                }elseif($tipo == '11'){//pendiente colaborador
                    //certificado como colaborador

                    $participante_staff = StaffDetalle::where('id_evento',$evento->id)->where('id_user_ponente',$participante->id)->first();
                    if(isset($participante_staff)){
                        $actividad = Actividad::find($participante_staff->id_actividad);
                        $participante_staff->actividad = $actividad;
                    }else{     
                        $participante->certificado = 'no';
                    }

                    $ruta_fondo = '/image/eventos/formato_certificado/'.$evento->fondo_certificado11;

                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    date_default_timezone_set('America/Lima');
                    setlocale(LC_TIME,"es_PE");
            
                    //$c = Certificados::find($id);
                    //$capa = CertificadosPonentes::find($c->id_capa);
                    //$fecha_ =Carbon::parse($capa->fecha_capa);
            
                    // == ENVIANDO certificado a participante
                    $nombre_part = trim(mb_strtoupper($participante->name));

                    if(trim($participante->apellidos)){
                        $nombre_part = mb_strtoupper($participante->name.' '.$participante->apellidos);
                    }
                    
                    $cant_text = 43;
                    $top_text = 300;
                    if(strlen($nombre_part)<=33){
                        $cant_text = 43;
                    }else{
                        if(strlen($nombre_part)>=80){
                            $cant_text=15;
                            $top_text = 330;
                        }elseif(strlen($nombre_part)>=70){
                            $cant_text=20;
                            $top_text = 325;
                        }elseif(strlen($nombre_part)>=60){
                            $cant_text=25;
                            $top_text = 320;
                        }elseif(strlen($nombre_part)>=50){
                            $cant_text=30;
                            $top_text = 310;
                        }elseif(strlen($nombre_part)>=40){
                            $cant_text=35;
                            $top_text = 305;
                        }
                    }

                    $fecha_ = Carbon::parse($actividad->created_at);


                    $mpdf_participante = new \Mpdf\Mpdf(['tempDir' => __DIR__ . '/custom/temp/dir/path','orientation' => 'L']);
                    ob_start();
                    $mpdf_participante->WriteHtml('
                    <html>
                        <head>
                        <meta charset="UTF-8">
                        <link type="image/x-icon" href="/image/icono.png" rel="icon">
                        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Great+Vibes">
                        </head>
                        <body>
                        <div style= "position:absolute; top:0px; left:0px;" ><img src = "'.$ruta_fondo.'"/></div>
                        <div style= "position:absolute; font-family:greatvibes-regular; font-size:'.$cant_text.'; top:'.$top_text.'px; left:3px; color:#000; width:100%; text-align:center;" ><b>'.$nombre_part.'</b></div>
                        <div style="color:gray; position:absolute; font-family:greatvibes-regular; font-size:25; top:'.($top_text+55).'px; left:3px; width:100%; text-align:center;" >'.$participante_staff->institucion.'</div>
                        <div style= "position:absolute; font-size:21; top:415px; left:65px; width:1000px; text-align:center;" >
                            Por haber participado en calidad de <b>COLABORADOR</b> en el:<br/>
                            <b>'.$evento->nombre.',</b> realizado el '.strftime("%d", strtotime($actividad->created_at)).' de '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad->created_at)).'.</div>
                        <div style= "position:absolute; font-size:23; top:530px; left:720px; width:350px; text-align:center;" >
                        Lima, '.$meses[($fecha_->month - 1)].' de '.strftime("%Y", strtotime($actividad->created_at)).'.</div>
                        </body>
                    </html>
                    ',\Mpdf\HTMLParserMode::HTML_BODY); 
                    $pdf_participante=$mpdf_participante->Output('', 'S');
                    ob_end_clean();

                    $mpdf_participante->Output()->header('Content-Type: application/pdf')->header('Content-Disposition: attachment; filename="nombre-del-archivo.pdf"');
                    //$content = chunk_split(base64_encode($pdf));
                        
        
                }
    
            }else{
                dd('evento no existe');
                return view('evento.asistencia.mensaje');
                
            }
        }else{
            dd('Participante no existe');
            return view('evento.asistencia.mensaje');
           
        }
        
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
