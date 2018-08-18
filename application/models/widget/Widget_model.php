<?php

class Widget_model extends CI_Model {

    private $table = null;

    function __construct() {

    }


    function sales_today(){

        $data = $this->db->query("select *,
(select sum(total) as total from sales_invoices_items a join sales_invoices b on a.fid_invoices=b.id where b.status = 'posting' AND a.deleted = 0 AND a.fid_items=master_items.id AND ('".$start."')<=b.end_date AND ('".$end."')>=b.end_date)  as total,
(select sum(quantity) as qty from sales_invoices_items a join sales_invoices b on a.fid_invoices=b.id where b.status = 'posting' AND a.deleted = 0 AND a.fid_items=master_items.id AND ('".$start."')<=b.end_date AND ('".$end."')>=b.end_date)  as qty
from master_items WHERE master_items.deleted = 0");
    }



}
