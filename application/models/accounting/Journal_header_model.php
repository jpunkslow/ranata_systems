<?php

class Journal_header_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'transaction_journal_header';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        $data = $this->db->query("SELECT * FROM $this->table WHERE type = 'jurnal_umum' AND  deleted = 0 ".$where."  ");
        return $data;
    }
    function get_details_by_id($options = array()){
        $id = get_array_value($options, "id");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        $data = $this->db->query("SELECT * FROM $this->table WHERE deleted = 0 ".$where."  ");
        return $data;
    }

    function triggerDelete($id){

        $data = $this->db->query("UPDATE transaction_journal SET deleted = 1 WHERE fid_header = '$id'");

        return $data;
    }

}
