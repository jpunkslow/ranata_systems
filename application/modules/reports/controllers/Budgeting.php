<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Budgeting extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->load->model('reports/Profitloss_model');
        $this->load->model('master/Master_Project_model');
    }

    /* load clients list view */

    

    function index(){
        $view_data['budgeting'] = $this->db->get("labarugi_budgeting");
		
        $this->template->rander('laba_rugi/budgeting', $view_data, TRUE);
		
    }

    function save(){

        if(!$this->input->post()){
            echo "FAIL";

        }


        $input = $this->input->post();
        $data = array();
        if($input){

            for($i=0; $i < count($input['id']); $i++){
                $data['januari'] = unformat_currency($input['januari'][$i]);
                $data['februari'] = unformat_currency($input['februari'][$i]);
                $data['maret'] = unformat_currency($input['maret'][$i]);
                $data['april'] = unformat_currency($input['april'][$i]);
                $data['mei'] = unformat_currency($input['mei'][$i]);
                $data['juni'] = unformat_currency($input['juni'][$i]);
                $data['juli'] = unformat_currency($input['juli'][$i]);
                $data['agustus'] = unformat_currency($input['agustus'][$i]);
                $data['september'] = unformat_currency($input['september'][$i]);
                $data['oktober'] = unformat_currency($input['oktober'][$i]);
                $data['november'] = unformat_currency($input['november'][$i]);
                $data['desember'] = unformat_currency($input['desember'][$i]);

                $this->db->where('id',$input['id'][$i]);
                $this->db->update("labarugi_budgeting",$data);
            }

            header("Location:" .base_url('reports/budgeting?_og=success'));
        }else{
            header("Location:" .base_url('reports/budgeting?_og=error'));
        }
    }
}