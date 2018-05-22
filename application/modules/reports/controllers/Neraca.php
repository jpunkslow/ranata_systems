<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Neraca extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->load->model('reports/Accounting_model');
    }

    /* load clients list view */

    function index() {


    	$view_data['getJenisKas'] = $this->Accounting_model->getJenisKas();

    	$view_data['getAkun'] = $this->Accounting_model->getAkun();


    	$this->template->rander("reports/r_neraca",$view_data); 


    }

}