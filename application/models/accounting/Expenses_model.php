<?php

class Expenses_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'transaction_journal';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $fid_header = get_array_value($options, "fid_header");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        if ($fid_header) {
            $where = " AND fid_header=$fid_header";
        }
        $data = $this->db->query("SELECT * FROM $this->table WHERE type = 'pengeluaran' $where AND  deleted = 0  ".$where." ORDER BY date DESC");
        return $data;
    }

}
