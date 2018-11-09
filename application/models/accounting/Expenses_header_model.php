<?php

class Expenses_header_model extends Crud_model {

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
        $data = $this->db->query("SELECT *,(select sum(debet) as total from transaction_journal where fid_header=transaction_journal_header.id) as total FROM $this->table WHERE type = 'expenses' AND  deleted = 0 ".$where."  ");
        return $data;
    }

    function triggerDelete($id){

        $data = $this->db->query("UPDATE transaction_journal SET deleted = 1 WHERE fid_header = '$id'");

        return $data;
    }

}
