<?php

class Master_Project_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'master_project';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        $data = $this->db->query("SELECT * FROM master_project WHERE  deleted = 0  ".$where." ORDER BY id DESC");
        return $data;
    }


}
