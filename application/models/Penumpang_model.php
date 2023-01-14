<?php

class Penumpang_model extends CI_Model
{
    public function getPenumpang($id_penumpang = null)
    {
        if ($id_penumpang === null) {
            return $this->db->get('penumpang')->result_array();
        } else {
            return $this->db->get_where('penumpang', ['id_penumpang' => $id_penumpang])->result_array();
        }
    }

    public function deletePenumpang($id_penumpang)
    {
        $this->db->delete('penumpang', ['id_penumpang' => $id_penumpang]);
        return $this->db->affected_rows();
    }

    public function createPenumpang($data)
    {
        $this->db->insert('penumpang', $data);
        return $this->db->affected_rows();
    }

    public function updatePenumpang($data, $id_penumpang)
    {
        $this->db->update('penumpang', $data, ['id_penumpang' => $id_penumpang]);
        return $this->db->affected_rows();
    }
}
