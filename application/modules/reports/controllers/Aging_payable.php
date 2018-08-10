<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Aging_payable extends MY_Controller {

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
            header("Location:".base_url()."reports/aging_payable?start=".$start."&end=".$end);
        }

        $view_data['date_range'] = format_to_date($start)." - ".format_to_date($end);
        $view_data['sales_report'] = $this->db->query("SELECT
            *,
            '7day' AS type 
        FROM
            purchase_invoices 
        WHERE
            end_date >= now( ) 
            AND end_date <= date_add( now( ), INTERVAL + 7 DAY ) UNION SELECT *, '7-14day' AS type FROM purchase_invoices WHERE end_date > date_add( now( ), INTERVAL + 7 DAY ) 
            AND end_date <= date_add( now( ), INTERVAL + 14 DAY ) UNION SELECT *, '14-30day' AS type FROM purchase_invoices WHERE end_date > date_add( now( ), INTERVAL + 14 DAY ) 
            AND end_date <= date_add( now( ), INTERVAL + 30 DAY )");
        if(isset($_GET['print'])){
            print_pdf("purchase/aging_pdf",$view_data);
        }else{
        

            $this->template->rander("purchase/aging",$view_data);
        }

        
     }


}