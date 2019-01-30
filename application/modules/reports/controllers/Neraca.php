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
        $this->load->model('master/Master_Saldoawal_model');
    }

    /* load clients list view */

    function index() {

            $year=date('Y');
           
            //$start_awal== date("Y")."-01-01";

            $month=1;

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

 $start_awal=$year."-01-01";
            $periode_default = $year."-01-01";
            $periode_now = $year;
            if(!empty($_GET['start']) && !empty($_GET['end'])){
                $periode_default = $_GET['start'];
                $periode_now = $_GET['end'];
            }

if(!empty($_GET['project'])){
    $project = $_GET['project'];
}
if($project=='')$project=false;

$type2=$type;
if($type==1){
    $type2=$month;
}else{
    $type2=($month+$type)-1;
}
$loop=$type2;
if($loop>12)$loop=12;
            $ararymonth=array(
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



        $month_start_berjalan=$year.'-'.$month.'-01';
        $month_end_berjalan=$year.'-'.$month.'-31';

        $view_data['getDebetTotalPL'] = $this->Profitloss_model->get_debet_total($month_start_berjalan,$month_end_berjalan);
        $view_data['getKreditTotalPL'] = $this->Profitloss_model->get_kredit_total($month_start_berjalan,$month_end_berjalan);

        

        if($month==1){
            $view_data['getDebetTotalPLD']=0;
            $view_data['getKreditTotalPLD']=0;
        }else{

             //$month_start_berjalan=$year.'-'.($month-1).'-01';
             $month_end_berjalan=$year.'-'.($month-1).'-31';
             $q=$this->Profitloss_model->get_debet_total($start_awal,$month_end_berjalan);
             $q2=$this->Profitloss_model->get_kredit_total($start_awal,$month_end_berjalan);
             //echo $start_awal;exit();
            $view_data['getDebetTotalPLD'] = $q->jumlah;
            $view_data['getKreditTotalPLD'] =$q2->jumlah ;
        }

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