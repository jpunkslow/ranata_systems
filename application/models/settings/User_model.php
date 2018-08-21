<?php

class User_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'users';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $table = $this->db->dbprefix('users');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $table.id=$id";
        }

        $sql = "SELECT $table.*
        FROM $table
        WHERE $table.deleted=0 AND client_id = 0  $where";
        return $this->db->query($sql);
    }

}
