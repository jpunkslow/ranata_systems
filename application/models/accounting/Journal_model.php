<?php

class Journal_model extends Crud_model {

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
        $data = $this->db->query("SELECT * FROM $this->table WHERE type = 'jurnal_umum' $where AND  deleted = 0  ".$where." ORDER BY id DESC");
        return $data;
    }


     function get_details_by_date($options = array()){
        $start_date = get_array_value($options, "start_date");
        $end_date = get_array_value($options, "end_date");
        
            $where = " AND (date >='".$start_date."'AND  date <='".$end_date."')";

        $data = $this->db->query("SELECT * FROM $this->table WHERE deleted = 0  ".$where." ORDER BY id DESC");
        return $data;
    }
    function get_details_by_id($options = array()){
        $id = get_array_value($options, "id");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        $data = $this->db->query("SELECT * FROM $this->table WHERE deleted = 0   $where  ".$where." ORDER BY id DESC");
        return $data;
    }

}
