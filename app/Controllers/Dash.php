<?php

namespace App\Controllers;

use App\Models\M_op_estado;





class Dash extends BaseController
{
    public function index()
    {
        /* Status */
        $tb_estado = new M_op_estado();
        $bien = $tb_estado->bien();
        $dato['bien'] = $bien['bien'];
        $mal = $tb_estado->mal();
        $dato['mal'] = $mal['mal'];
        $regular = $tb_estado->regular();
        $dato['regular'] = $regular['regular'];
        /* Status inventarios */
        $activo = $tb_estado->activo();
        $dato['activo'] = $activo['activo'];
        $inactivo = $tb_estado->inactivo();
        $dato['inactivo'] = $inactivo['inactivo'];
        $baja = $tb_estado->baja();
        $dato['baja'] = $baja['baja'];

        $pcs = $tb_estado->count_cpu();
        $dato['pcs'] = $pcs['pcs'];
        $inspeccion = $tb_estado->count_isp();
        $dato['insp'] = $inspeccion['inspeccion'];
        $rotura = $tb_estado->count_rotura();
        $dato['rotura'] = $rotura['rotura'];
        $incide = $tb_estado->count_incidencia();
        $dato['incide'] = $incide['incidencia'];

        /*$dat1 = $tb_estado->grafica();
        $dat2 = $tb_estado->grafica2();
        //print_r($dat2);
        $grafica = array_merge($dat1,$dat2);
        $dato['grafica'] = $grafica;
        //print_r($grafica);*/
        $year_up = date('Y', time());
        $dato['meses'] = $tb_estado->mes($year_up);
        $dato['cant'] = $tb_estado->cantidad_incidencias($year_up);
        $dato['total'] = $tb_estado->count_inspecciones($year_up);

        
        return view('paginas/dash', $dato);
    }
}
