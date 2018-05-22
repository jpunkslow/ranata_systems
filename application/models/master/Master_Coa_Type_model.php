<?php

class Master_Coa_Type_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'acc_coa_type';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $parent = get_array_value($options, "parent");
        $no_parent = get_array_value($options, "no_parent");
        $kas_bank = get_array_value($options, "kas_bank");
        
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        if ($parent) {
            $where = " AND parent='$parent'";
        }

        if ($no_parent) {
            $where = " AND parent=$no_parent";
        }
        if($kas_bank){
            $where = " AND id in ($kas_bank)";
        }
        $data = $this->db->query("SELECT * FROM $this->table WHERE  deleted = 0  ".$where." ORDER BY order_by ASC");
        return $data;
    }

    function get_dropdown_kas() {
        // $where["deleted"] = 0;
        // $where["id"] = (2,3);
        $list_data = $this->db->query("SELECT * FROM $this->table WHERE parent = 'Head' AND deleted = 0")->result();
        $result = array();
        foreach ($list_data as $data) {
            // $text = "";
            $result[$data->id] = $data->account_number." - ".$data->account_name;
        }
        return $result;
    }

    function getKas() {
        // $where["deleted"] = 0;
        // $where["id"] = (2,3);
        $list_data = $this->db->query("SELECT * FROM $this->table WHERE id in(2,3,4,5,6,7,8,9,10) AND deleted = 0")->result();
        $result = array();
        foreach ($list_data as $data) {
            // $text = "";
            $result[$data->id] = $data->account_number." - ".$data->account_name;
        }
        return $result;
    }
    function getCoaDrop() {
        // $where["deleted"] = 0;
        // $where["id"] = (2,3);
        $list_data = $this->db->query("SELECT * FROM $this->table WHERE parent is NULL  AND deleted = 0")->result();
        $result = array();
        foreach ($list_data as $data) {
            // $text = "";
            $result[$data->id] = $data->account_number." - ".$data->account_name;
        }
        return $result;
    }


    function getCOA() {
        // $where["deleted"] = 0;
        // $where["id"] = (2,3);
        $list_data = $this->db->query("SELECT * FROM $this->table WHERE parent is NULL AND deleted = 0")->result();

        return $list_data;
    }




}
