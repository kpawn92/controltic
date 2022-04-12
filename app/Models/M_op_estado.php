<?php

namespace App\Models;

use CodeIgniter\Model;

class M_op_estado extends Model
{
    protected $table      = 'tb_op_estado';
    // Uncomment below if you want add primary key
    protected $primaryKey = 'id';

    ///* PLACA MADRE (MotherBoard) *///
    function save_placa($idequipo, $equipo, $status_tec, $fecha)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('tb_op_estado');
        $data = [
            'idequipo' => $idequipo,
            'equipo' => $equipo,
            'estado' => $status_tec,
            'fecha' => $fecha
        ];
        return $builder->insert($data);
    }

    function save_inv($idequipo, $equipo, $status_tec, $date, $inventario)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('tb_op_estado');
        $data = [
            'idequipo' => $idequipo,
            'equipo' => $equipo,
            'estado' => $status_tec,
            'fecha' => $date,
            'inventario' => $inventario
        ];
        return $builder->insert($data);
    }

    function selectID($id, $equipo)
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT id FROM tb_op_estado WHERE tb_op_estado.idequipo = '$id' AND tb_op_estado.equipo = '$equipo'");
        return $query->getRowArray();
    }

    function update_st($idRow, $estado, $fecha)
    {
        $db = \Config\Database::connect();
        $query = $db->query("UPDATE tb_op_estado SET estado  = '$estado', fecha = '$fecha' WHERE tb_op_estado.id='$idRow'");
        return $query;
    }

    function update_inv($idRow, $estado, $fecha, $inventario)
    {
        $db = \Config\Database::connect();
        $query = $db->query("UPDATE tb_op_estado SET estado  = '$estado', fecha = '$fecha', inventario = '$inventario' WHERE tb_op_estado.id='$idRow'");
        return $query;
    }

    function eliminar($idRow)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('tb_op_estado');
        $builder->where('id', $idRow);
        return $builder->delete();
    }

    function bien()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(tb_op_estado.estado) as bien FROM tb_op_estado WHERE estado = 1");
        return $query->getRowArray();
    }

    function mal()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(tb_op_estado.estado) as mal FROM tb_op_estado WHERE estado = 2");
        return $query->getRowArray();
    }

    function regular()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(tb_op_estado.estado) as regular FROM tb_op_estado WHERE estado = 3");
        return $query->getRowArray();
    }

    function activo()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(tb_op_estado.inventario) as activo FROM tb_op_estado WHERE inventario = 1");
        return $query->getRowArray();
    }
    
    function inactivo()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(tb_op_estado.inventario) as inactivo FROM tb_op_estado WHERE inventario = 2");
        return $query->getRowArray();
    }

    function baja()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(tb_op_estado.inventario) as baja FROM tb_op_estado WHERE inventario = 3");
        return $query->getRowArray();
    }

    function count_cpu()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(tb_pc.id) as pcs FROM tb_pc");
        return $query->getRowArray();
    }

    function count_isp()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(id) as inspeccion FROM tb_inspeccion");
        return $query->getRowArray();
    }

    function count_rotura()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(id) as rotura FROM tb_rotura");
        return $query->getRowArray();
    }

    function count_incidencia()
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(id) as incidencia FROM tb_incidencia");
        return $query->getRowArray();
    }

    function mes($year_up)
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT FROM_UNIXTIME(tb_incidencia.fecha,'%M') as mes FROM tb_incidencia WHERE FROM_UNIXTIME(tb_incidencia.fecha,'%Y') = '$year_up' GROUP BY FROM_UNIXTIME(tb_incidencia.fecha,'%m')");
        return $query->getResultArray();
    }

    function cantidad_incidencias($year_up)
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(*) as cant FROM tb_incidencia WHERE FROM_UNIXTIME(tb_incidencia.fecha,'%Y') = '$year_up' GROUP BY FROM_UNIXTIME(tb_incidencia.fecha,'%m')");
        return $query->getResultArray();
    }
    
    function count_inspecciones($year_up)
    {
        $db = \Config\Database::connect();
        $query = $db->query("SELECT COUNT(*) as total FROM tb_inspeccion WHERE FROM_UNIXTIME(tb_inspeccion.fecha_inspeccion,'%Y') = '$year_up' GROUP BY FROM_UNIXTIME(tb_inspeccion.fecha_inspeccion,'%m')");
        return $query->getResultArray();
    }
}
