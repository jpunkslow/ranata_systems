<?php

class General_accounts_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_transaction';
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


    function getDetailTransaksi($id){
        $this->db->select('tbl_transaction_detail.*,acc_coa_type.*');
                $this->db->from('tbl_transaction_detail');
                $this->db->join('acc_coa_type', 'acc_coa_type.id=tbl_transaction_detail.coa','left');
                $this->db->where("tbl_transaction_detail.fid_transaction",$id);
                $this->db->order_by("debet","DESC");
                $this->db->order_by("account_name");
                $query=$this->db->get();
                return $query->result();
    }

}
