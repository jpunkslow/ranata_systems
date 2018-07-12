<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Aging_receivable extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->load->model('reports/Reports_model');
    }

	function index() {


    	$view_data["customers"] = $this->db->query("SELECT * FROM sales_invoices WHERE deleted = 0 order by id ASC");
        $view_data["data"] = $this->Reports_model->getAgingReceivable();
    	// $view_data['data'] = $this->db->query("SELECT * FROM master_customers")->result();

    	$this->template->rander("aging/receivable",$view_data); 


    }
}