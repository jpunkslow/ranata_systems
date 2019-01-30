<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class General_ledger extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model("accounting/General_ledger_model");
        $this->load->model("master/Master_Saldoawal_model");
        //check permission to access this module
    }

    /* load clients list view */

    function index() {
        $view_data['periode_dropdown'] = $this->Master_Saldoawal_model->getPeriode();
        $view_data['coa_dropdown'] = array("" => "All COA") + $this->Master_Coa_Type_model->getCoaDrop();
    	$this->template->rander('general_ledger/index',$view_data);
    }


    function getReport(){
        $id = $_GET['id'];
        $start = $_GET['start'];
        $end = $_GET['end'];
        $saldo = 0;
        $periode = substr($start, 0,4);
        if(!isset($_GET['start'])||$_GET['start']=='')$start = date("Y")."-01-01";
        if(!isset($_GET['end'])||$_GET['end']=='')$end = date("Y-m-d");

        $start_sebelum=date("Y")."-01-01";
        $end_sebelum=$start;


        $where2='';
        $where3='';
        $where_coa = "";
        $where_coa_id = "";
         if(!empty($start) && !empty($end)){
            $where2 = " AND a.date >= '$start' AND  a.date <= '$end' ";
        }

        if(!empty($start) && !empty($end)){
            $where3 = " AND a.date >= '$start_sebelum' AND  a.date < '$end_sebelum' ";
        }

        $where_id='';
        if($id!='')$where_id= "AND fid_coa='".$id."'";

        $grouping_coa_query = $this->db->query("select distinct(fid_coa) no_coa,account_name,account_number from transaction_journal a join acc_coa_type b on a.fid_coa=b.id where 1=1 $where2 $where_id  order by b.account_number asc ");
        $html ='';

        //echo $this->db->last_query();exit();
        foreach($grouping_coa_query->result() as $coadb){
        $saldo=0;
        $html .="<tr ><td colspan='2' align='left' style='background-color:lightgrey;'><strong>".$coadb->account_number." </strong></td><td colspan='2' align='right' style='background-color:lightgrey;'><strong>".$coadb->account_name." </strong></td>";
         $html .= "<td align='right' style='background-color:lightgrey;'></td>";
        $html .= "<td align='right' style='background-color:lightgrey;'></td>";
        $html .= "<td align='right' style='background-color:lightgrey;'></td>";
        $html .= "<td align='right' style='background-color:lightgrey;'></td> </tr>";  

        //echo $coadb->account_name.' '.$coadb->account_number.' '.$coadb->no_coa;exit(); 

        //if(!empty($id)){
            $where_coa = "AND fid_coa = '$coadb->no_coa'  ";

            $sa_debet = $this->Master_Saldoawal_model->getDebit($coadb->no_coa,($periode-1));
            $sa_credit = $this->Master_Saldoawal_model->getCredit($coadb->no_coa,($periode-1));
       
            $data3 = $this->db->query("SELECT sum(debet) as total_debet,sum(credit) as total_credit FROM transaction_journal a JOIN acc_coa_type b ON b.id  = a.fid_coa WHERE  a.deleted = 0 $where_coa $where3 ORDER BY a.id ASC")->row();

        

        $saldo = $saldo + ($sa_debet+$data3->total_debet) - ($sa_credit+$data3->total_credit);



        $html .= "<tr ><td colspan='4' align='right' style='background-color:lightgrey;'><strong>Saldo Awal Sebelumnya </strong></td>";
        $html .= "<td align='right' style='background-color:lightgrey;'></td>";
        $html .= "<td align='right' style='background-color:lightgrey;'>".number_format(($sa_debet+$data3->total_debet), 0, 0, '.')."</td>";
        $html .= "<td align='right' style='background-color:lightgrey;'>".number_format(($sa_credit+$data3->total_credit), 0, 0, '.')."</td>";
        $html .= "<td align='right' style='background-color:lightgrey;'>".number_format($saldo, 0, 0, '.')."</td> </tr>";
        $where = '';
        if(!empty($start) && !empty($end)){
            $where = " AND date >= '$start' AND  date <= '$end' ";
        }
        

        $jml_deb = 0;
        $jml_cre = 0;
        
            
            $data = $this->db->query("SELECT a.*,b.account_number,b.account_name FROM transaction_journal a JOIN acc_coa_type b ON b.id  = a.fid_coa WHERE  a.deleted = 0 $where_coa $where ORDER BY a.date ASC");

            //echo $this->db->last_query();exit();
            $no=0;
            foreach($data->result() as $db){
                $originalDate = $db->date;
                $newDate = date("d-M-Y", strtotime($originalDate));
                $saldo = $saldo+$db->debet-$db->credit;

                $html .= "<tr>";
                $html .= "<td>".++$no."</td>";
                //$html .= "<td>".$db->journal_code."</td>";
                $html .= "<td>".$db->voucher_code."</td>";
                $html .= "<td>".$newDate."</td>";
                $html .= "<td>".$db->type."</td>";
                // $html .= "<td>".$db->description."</td>";
                // $html .= "<td>".$db->account_number."</td>";
                // $html .= "<td>".$db->account_name."</td>";
                $html .= "<td>".$db->description."</td>";
                $html .= "<td align='right' width='100'>".number_format($db->debet, 0, 0, '.')."</td>";
                $html .= "<td align='right' width='100'>".number_format($db->credit, 0, 0, '.')."</td>";
                $html .= "<td align='right' width='100'>".number_format($saldo, 0, 0, '.')."</td></tr>";

                $jml_deb = $jml_deb + $db->debet;
                $jml_cre = $jml_cre + $db->credit;
        }
    }

                echo $html;
        

        
        // echo json_encode(array("success" => true, "data" => $html,'message' => lang('record_saved')));






    }


    
    function modal_form() {
        //get custom fields

        // $view_data['model_info'] = $this->General_ledger_model->get_one($this->input->post('id'));
        // $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        
        $view_data['coa_dropdown'] = $this->Master_Coa_model->get_dropdown_list(array("jns_trans"));

        $this->load->view('general_ledger/modal_form',$view_data);
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );
        $view_data['coa_dropdown'] = $this->Master_Coa_model->get_dropdown_list(array("jns_trans"));


        $view_data['model_info'] = $this->General_ledger_model->get_details($options)->row();
         // $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Customers_model->get_dropdown_list(array("name"));

        

        $this->load->view('general_ledger/modal_form_edit', $view_data);
    }

    /* insert or update a client */

    function add() {
        validate_submitted_data(array(
            "code_voucher" => "required",
        ));
        $value = 0;
        $debit = 0;
        $credit = 0;
        $position = $this->input->post('position');
        if($position == 'debit'){
        	$debit = $this->input->post('value');
        	$credit = 0;
        }
        if($position == 'credit'){
        	$debit = 0;
        	$credit = $this->input->post('value');
        }

        $data = array(
            "code_voucher" => $this->input->post('code_voucher'),
            "date" => $this->input->post('date'),
            "description" => $this->input->post('description'),
            "account_number" => $this->input->post('account_number'),
            "account_name" => $this->input->post('account_name'),
            "debit" => $debit,
            "credit" => $credit,
            "value" => $this->input->post('value'),
            "status" => "1"
        );

        

        $save_id = $this->General_ledger_model->save($data);
        if ($save_id) {
            
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id ,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save() {
        $data_id = $this->input->post('id');


        validate_submitted_data(array(
            "code_voucher" => "required"
        ));

        $value = 0;
        $debit = 0;
        $credit = 0;
        $position = $this->input->post('position');
        if($position == 'debit'){
        	$debit = $this->input->post('value');
        	$credit = 0;
        }
        if($position == 'credit'){
        	$debit = 0;
        	$credit = $this->input->post('value');
        }

        $data = array(
            "code_voucher" => $this->input->post('code_voucher'),
            "date" => $this->input->post('date'),
            "description" => $this->input->post('description'),
            "account_number" => $this->input->post('account_number'),
            "account_name" => $this->input->post('account_name'),
            "debit" => $debit,
            "credit" => $credit,
           	"value" => $this->input->post('value'),
        );


        $save_id = $this->General_ledger_model->save($data, $data_id);
        if ($save_id) {

            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }


    /* delete or undo a client */

    function delete() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->General_ledger_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->General_ledger_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of clients, prepared for datatable  */

    function list_data() {

        $list_data = $this->General_ledger_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of client list  table */

    private function _row_data($id) {
        $options = array(
            "id" => $id
        );
        $data = $this->General_ledger_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of client list table */

    private function _make_row($data) {
        // $options = array(
        //     "id" => $data->id
        // );
        $status = '';
        if ($data->status == 1) {
        	$status = "Draft";
        }
        if ($data->status == 2) {
        	$status = "Posting";
        }

        // $query = $this->Master_Customers_model->get_details($options)->row();
        $value = $this->Master_Coa_model->get_details(array("account_number"=> $data->account_number))->row();
        $row_data = array(
        	$data->code_voucher,
            format_to_date($data->date, false),
            
            $value->coa." - ".$value->jns_trans,
            $data->description,
            to_currency($data->debit),
            to_currency($data->credit),
            to_currency($data->value),
            $status


        );

        if($data->status == 2){
        	$row_data[] = "";
        }else{
        	$row_data[] = anchor(get_uri("accounting/general_ledger/view/").$data->id, "<i class='fa fa-eye'></i>", array("class" => "view", "title" => lang('view'), "data-post-id" => $data->id)).modal_anchor(get_uri("accounting/general_ledger/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_client'), "data-post-id" => $data->id))
                . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_client'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("accounting/general_ledger/delete"), "data-action" => "delete"));
        }
        return $row_data;
    }

}