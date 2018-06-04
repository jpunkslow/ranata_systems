<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Laba_rugi extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->load->model('reports/Profitloss_model');
    }

    /* load clients list view */

    

    function index(){
    	$this->load->library("pagination");

		$this->data['judul_browser'] = 'Laporan';
		$this->data['judul_utama'] = 'Laporan';
		$this->data['judul_sub'] = 'Laba Rugi';

		// #include tanggal
		// $this->data['css_files'][] = base_url() . 'assets/extra/bootstrap_date_time/css/bootstrap-datetimepicker.min.css';
		// $this->data['js_files'][] = base_url() . 'assets/extra/bootstrap_date_time/js/bootstrap-datetimepicker.min.js';
		// $this->data['js_files'][] = base_url() . 'assets/extra/bootstrap_date_time/js/locales/bootstrap-datetimepicker.id.js';

		// 	#include seach
		// $this->data['css_files'][] = base_url() . 'assets/theme_admin/css/daterangepicker/daterangepicker-bs3.css';
		// $this->data['js_files'][] = base_url() . 'assets/theme_admin/js/plugins/daterangepicker/daterangepicker.js';

		
		$this->data['data_dapat'] = $this->Profitloss_model->get_data_akun_dapat();
		$this->data['dapat_non_op'] = $this->Profitloss_model->getPendNonOp();
		$this->data['data_biaya'] = $this->Profitloss_model->get_data_akun_biaya();
		$this->data['data_biaya_other'] = $this->Profitloss_model->get_data_akun_biaya_other();

		
		$this->template->rander('v_profitloss', $this->data, TRUE);
		// $this->load->view('themes/layout_utama_v', $this->data);
    }
}