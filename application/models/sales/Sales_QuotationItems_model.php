<?php

class Sales_QuotationItems_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'sales_quotation_items';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $quot_id = get_array_value($options,"fid_quotation");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        if($quot_id){
            $where = " AND fid_quotation = $quot_id";
        }
        $data = $this->db->query("SELECT * FROM sales_quotation_items WHERE  deleted = 0  ".$where." ORDER BY category ASC");
        return $data;
    }
    function get_item_suggestion($keyword = "") {
        $items_table = $this->db->dbprefix('master_items');
        

        $sql = "SELECT *
        FROM $items_table
        WHERE $items_table.deleted=0  AND $items_table.title LIKE '%$keyword%'
        GROUP BY $items_table.title LIMIT 10 
        ";
        return $this->db->query($sql)->result();
    }

    function get_item_info_suggestion($id = "") {
        // $estimate_items_table = $this->db->dbprefix('estimate_items');
        $invoice_items_table = $this->db->dbprefix('master_items');

        $sql = "SELECT *
        FROM $invoice_items_table
        WHERE $invoice_items_table.deleted=0 AND $invoice_items_table.id = '$id'
        ORDER BY id DESC LIMIT 1";
        $result = $this->db->query($sql);

        if ($result->num_rows()) {
            return $result->row();
        }
    }
}