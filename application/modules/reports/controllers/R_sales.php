<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class R_sales extends MY_Controller {

    function __construct() {
        parent::__construct();

     }


     function index(){


     	$start =  date("Y")."-01-01";
     	$end = date("Y-m-d");

     	if(isset($_GET['start']) && isset($_GET['end'])){

     		$start = $_GET['start'];
     		$end = $_GET['end'];
     	}else{
     		header("Location:".base_url()."reports/r_sales?start=".$start."&end=".$end);
     	}

     	$view_data['date_range'] = format_to_date($start)." - ".format_to_date($end);


     	$view_data['sales_report'] = $this->db->query("select *,
(select sum(total) as total from sales_invoices_items a join sales_invoices b on a.fid_invoices=b.id where b.status = 'posting' AND a.deleted = 0 AND a.fid_items=master_items.id AND ('".$start."')<=b.end_date AND ('".$end."')>=b.end_date)  as total,
(select sum(quantity) as qty from sales_invoices_items a join sales_invoices b on a.fid_invoices=b.id where b.status = 'posting' AND a.deleted = 0 AND a.fid_items=master_items.id AND ('".$start."')<=b.end_date AND ('".$end."')>=b.end_date)  as qty
from master_items WHERE master_items.deleted = 0 ");

     	$this->template->rander("sales/report",$view_data);
     }


}