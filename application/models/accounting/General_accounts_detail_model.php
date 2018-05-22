<?php

class General_accounts_detail_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_transaction_detail';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        $data = $this->db->query("SELECT * FROM $this->table WHERE  deleted = 0  ".$where." ORDER BY id DESC");
        return $data;
    }

}
