<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Penerbangan_model extends CI_Model
{
    public function getPenerbangan($id_penerbangan = null)
    {
        if ($id_penerbangan === null) {
            return $this->db->get('penerbangan')->result_array();
        } else {
            return $this->db->get_where('penerbangan', ['id_penerbangan' => $id_penerbangan])->result_array();
        }
    }

    public function deletePenerbangan($id_penerbangan)
    {
        $this->db->delete('penerbangan', ['id_penerbangan' => $id_penerbangan]);
        return $this->db->affected_rows();
    }

    public function createPenerbangan($data)
    {
        $this->db->insert('penerbangan', $data);
        return $this->db->affected_rows();
    }

    public function updatePenerbangan($data, $id_penerbangan)
    {
        $this->db->update('penerbangan', $data, ['id_penerbangan' => $id_penerbangan]);
        return $this->db->affected_rows();
    }
}
