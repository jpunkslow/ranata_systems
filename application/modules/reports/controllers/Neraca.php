<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Neraca extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->load->model('reports/Accounting_model');
        $this->load->model('reports/Neraca_model');
        $this->load->model('reports/Profitloss_model');
    }

    /* load clients list view */

    function index() {

            $periode_default = date("Y")."-01-01";
            $periode_now = date("Y-m-d");
            if(!empty($_GET['start']) && !empty($_GET['end'])){
                $periode_default = $_GET['start'];
                $periode_now = $_GET['end'];
            }

            $month=1;
            $year=date('Y');
            $type=$month;
            $project=false;

            if(!empty($_GET['month'])){
                $month = $_GET['month'];
            }
            if(!empty($_GET['year'])){
                $year = $_GET['year'];
            }
            if(!empty($_GET['type'])){
                $type = $_GET['type'];
            }

            if(!empty($_GET['project'])){
                $project = $_GET['project'];
            }
            if($project=='')$project=false;

            if($type==1){
                $type=$month;
            }
            $loop=$type+$month;
            if($loop>12)$loop=12;
            $ararymonth=array(
                        '',
                        'Januari',
                        'Februari',
                        'Maret',
                        'April',
                        'Mei',
                        'Juni',
                        'Juli',
                        'Augustus',
                        'September',
                        'Oktober',
                        'November',
                        'Desember',
                    );


        $view_data['month']=$month;
        $view_data['type']=$type;
        $view_data['year']=$year;
        $view_data['project']=$project;
        $view_data['ararymonth']=$ararymonth;
        $view_data['loop']=$loop;


        $view_data['getCurrentAssets'] = $this->Neraca_model->getCurrentAssets();

        $view_data['getCurrentNonAssets'] = $this->Neraca_model->getCurrentNonAssets();

        $view_data['getCurrentLiabilities'] = $this->Neraca_model->getCurrentLiabilities();

        $view_data['getLongTermPayable'] = $this->Neraca_model->getLongTermPayable();

        $getDataEquity=$this->Neraca_model->getEquity();
        


        $view_data['getEquity'] = $getDataEquity;
        //print_r($getDataEquity);exit();


        //$view_data['data_project'] = $this->Master_Project_model->get_details();


    if(isset($_GET['print'])){
            
            $this->template->render_view("neraca/xls",$view_data, TRUE);
        }
        /*if(isset($_GET['type']) == 1){
            $this->template->rander('laba_rugi/monthly',$view_data);
        }

        else{*/
            $this->template->rander('neraca/index', $view_data, TRUE);


    }


    

}