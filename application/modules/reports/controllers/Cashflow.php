<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Cashflow extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->load->model('reports/Accounting_model');
        $this->load->model("reports/Cashflow_model");
        
    }

    /* load clients list view */

    function index() {


        $view_data['data_dapat'] = $this->Cashflow_model->get_data_akun_dapat();
        $view_data['data_beban_pokok'] = $this->Cashflow_model->getBebanPokokPenjualan();
        $view_data['hutang'] = $this->Cashflow_model->getHutangBeban();
        $view_data['beban_operasional'] = $this->Cashflow_model->getBebanOperasional();

        
        


    	$this->template->rander("cashflow/rpt_cashflow",$view_data); 


    }

}