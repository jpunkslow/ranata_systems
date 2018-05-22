<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class General_ledger extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model("accounting/General_ledger_model");
        //check permission to access this module
    }

    /* load clients list view */

    function index() {
    	$this->template->rander('general_ledger/index');
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