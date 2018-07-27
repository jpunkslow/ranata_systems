<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Laba_rugi extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->load->model('reports/Profitloss_model');
        $this->load->model('master/Master_Project_model');
    }

    /* load clients list view */

    

    function index(){

		$periode_default = date("Y")."-01-01";
        $periode_now = date("Y-m-d");
        if(!empty($_GET['start']) && !empty($_GET['end'])){
            $periode_default = $_GET['start'];
            $periode_now = $_GET['end'];

        }
		
		$view_data['data_dapat'] = $this->Profitloss_model->get_data_akun_dapat();
        $view_data['data_beban_pokok'] = $this->Profitloss_model->getBebanPokokPenjualan();
		$view_data['dapat_non_op'] = $this->Profitloss_model->getPendNonOp();
		$view_data['data_biaya'] = $this->Profitloss_model->get_data_akun_biaya();
		$view_data['data_biaya_other'] = $this->Profitloss_model->get_data_akun_biaya_other();

        $view_data['data_project'] = $this->Master_Project_model->get_details();

        // $view_data['laba_rugi_monthly'] = $this->Profitloss_model->getMonthly();

        $view_data['profitloss_coa'] = $this->Profitloss_model->getMonthlyCoa("400");
        $view_data['profitloss_hpp'] = $this->Profitloss_model->getMonthlyCoa("5");
        
		if(isset($_GET['print'])){
            
            $this->template->render_view("laba_rugi/xls",$view_data, TRUE);
        }
        /*if(isset($_GET['type']) == 1){
            $this->template->rander('laba_rugi/monthly',$view_data);
        }

        else{*/
			$this->template->rander('laba_rugi/index', $view_data, TRUE);
		//}
		// $this->load->view('themes/layout_utama_v', $this->data);
    }
}