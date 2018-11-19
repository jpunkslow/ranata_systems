<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Expenses extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model("accounting/Expenses_model");
        $this->load->model("accounting/Expenses_header_model");
        //check permission to access this module
    }

    /* load clients list view */

    function index() {
    	$this->template->rander('expenses/index');
    }



    
    function modal_form() {
        //get custom fields

        // $view_data['model_info'] = $this->Expenses_model->get_one($this->input->post('id'));
        // $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        $view_data['kas_dropdown'] = $this->Master_Coa_Type_model->getCoaDrop('account_number',"100");
        $view_data['project_dropdown'] = array(0 => "-") + $this->Master_Project_model->get_dropdown_list(array("project_name","company_name"));

        
        $this->load->view('expenses/modal_form',$view_data);
    }

    function modal_form_detail() {
            validate_submitted_data(array(
                "id" => "numeric"
            ));
            $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );
        $view_data['info_header'] = $this->Expenses_header_model->get_details($options)->row();

        $view_data['acc_dropdown'] = $this->Master_Coa_Type_model->getCoaExpenses();

        $this->load->view('expenses/modal_form_detail',$view_data);
    }

    function modal_form_detail_edit() {
            validate_submitted_data(array(
                "id" => "numeric"
            ));
            $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );
        $view_data['model_info'] = $this->Expenses_model->get_details(array('id'=>$id))->row();

        $view_data['info_header'] = $this->Expenses_header_model->get_details(array('id' => $view_data['model_info']->fid_header))->row();
        $view_data['acc_dropdown'] = $this->Master_Coa_Type_model->getCoaExpenses();

        $this->load->view('expenses/modal_form_detail_edit',$view_data);
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );
        $view_data['kas_dropdown'] = $this->Master_Coa_Type_model->getCashCoa();
        $view_data['project_dropdown'] = array(0 => "-") + $this->Master_Project_model->get_dropdown_list(array("project_name","company_name"));

        $view_data['model_info'] = $this->Expenses_header_model->get_details($options)->row();
         // $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Customers_model->get_dropdown_list(array("name"));

        

        $this->load->view('expenses/modal_form_edit', $view_data);
    }

    /* insert or update a client */

    function add() {
        validate_submitted_data(array(
            "code" => "required",

        ));

        $fid_coa = $this->input->post('fid_coa');
        
        $data = array(
            "code" => $this->input->post('code'),
            "voucher_code" => $this->input->post('voucher_code'),
            "fid_coa" => $this->input->post('fid_coa'),
            "fid_project" => $this->input->post('fid_project'),
            "date" => $this->input->post('date'),
            "description" => $this->input->post('description'),
            "status" => 1,
            "created_by" => $this->session->userdata('user_name'),
            "type" => "expenses"

        );

        

        $save_id = $this->Expenses_header_model->save($data);
        
        if ($save_id) {

            $data_detail = array(
                "journal_code" => $this->input->post('code'),
                "voucher_code" => $this->input->post('voucher_code'),
                "date" => $this->input->post('date'),
                "type" => "pengeluaran",
                "description" => $this->input->post('description'),
                "fid_coa" => $this->input->post('fid_coa'),
                "fid_header" => $save_id,
                "debet" => 0,
                "credit" => 0,
                "username" =>$this->session->userdata('user_name'),
                "created_at" => get_current_utc_time()
            );

            $this->Expenses_model->save($data_detail);

            
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id,'fid_coa' => $fid_coa ,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred'), 'print' => print_r($save_id)));
        }
    }

    function add_detail() {
        validate_submitted_data(array(
            "fid_coa" => "required",

        ));
        $data_id = $this->input->post('id');

        $fid_coa = $this->input->post('fid_coa_header');

        $data = array(
            "journal_code" => $this->input->post('journal_code'),
            "voucher_code" => $this->input->post('voucher_code'),
            "date" => $this->input->post('date'),
            "type" => "pengeluaran",
            "description" => $this->input->post('description'),
            "fid_coa" => $this->input->post('fid_coa'),
            "fid_header" => $data_id,
            "project_id" => $this->input->post('fid_project'),
            "debet" => unformat_currency($this->input->post("debet")),
            "credit" => 0,
            "username" => "admin",
            "created_at" => get_current_utc_time()
        );


        

        $save_id = $this->Expenses_model->save($data);
        if ($save_id) {
            $this->_triggerUpdate($data_id,$fid_coa,$this->input->post('fid_project'));
            // $data = $this->db->query("SELECT SUM(debet) AS debet,fid_header FROM transaction_journal WHERE fid_header = $data_id AND deleted = 0 ")->row();
            // $this->db->query("UPDATE transaction_journal SET credit = $data->debet WHERE fid_header = $data->fid_header AND fid_coa = '$fid_coa' ");
            
            echo json_encode(array("success" => true, "data" => $this->_row_data_entry($save_id), 'id' => $data_id ,'fid_coa' => $fid_coa,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred'), 'print' => print_r($save_id)));
        }
    }

    function save_detail() {
        validate_submitted_data(array(
            "fid_coa" => "required",

        ));
        $data_id = $this->input->post('id');

        $fid_header = $this->input->post('fid_header');
        $fid_coa = $this->input->post('fid_coa_header');
        $fid_project =  $this->input->post('fid_project');
        $data = array(
            "description" => $this->input->post('description'),
            "fid_coa" => $this->input->post('fid_coa'),

            "debet" => unformat_currency($this->input->post("debet"))        
        );


        

        $save_id = $this->Expenses_model->save($data,$data_id);
        if ($save_id) {
            $this->_triggerUpdate($fid_header,$fid_coa);

            // $data = $this->db->query("SELECT SUM(debet) AS debet,fid_header FROM transaction_journal WHERE fid_header = $data_id AND deleted = 0 ")->row();
            // $this->db->query("UPDATE transaction_journal SET credit = $data->debet WHERE fid_header = $data->fid_header AND fid_coa = '$fid_coa' ");
            
            echo json_encode(array("success" => true, "data" => $this->_row_data_entry($save_id), 'id' => $fid_header,'fid_coa' => $fid_coa ,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred'), 'print' => print_r($save_id)));
        }
    }

     function _triggerUpdate($fid_header,$fid_coa){

        // $check = $this->db->query("SELECT * FROM transaction_journal WHERE fid_header = '$fid_header' AND fid_coa = '$fid_coa' ");
        // if($check){
        //     return false;
        // }
            $data = $this->db->query("SELECT SUM(a.debet) AS debet,a.fid_header,b.* FROM transaction_journal a JOIN transaction_journal_header b ON a.fid_header = b.id  WHERE a.fid_header = $fid_header AND a.deleted = 0 AND a.type = 'pengeluaran' ")->row();

                if($data == true){
                    $query = $this->db->query("UPDATE transaction_journal SET credit = $data->debet WHERE fid_header = $data->fid_header AND fid_coa = $fid_coa ");
                }
            if($query == true){
                return true;
            }else{
                return false;
            }
    }

    function _triggerUpdateProject($fid_header,$fid_project = 0,$date){
        $query = $this->db->query("UPDATE transaction_journal SET project_id = $fid_project,`date`='".$date."' WHERE fid_header = $fid_header ");
        
        if($query == true){
            return true;
        }else{
            return false;
        }   
    }


    function save() {
        $data_id = $this->input->post('id');


        validate_submitted_data(array(
            "id" => 'numeric'
            // "journal_code" => "required"
        ));
        $fid_project = $this->input->post('fid_project');
        $fid_header = $this->input->post('fid_header');
        $fid_coa = $this->input->post('fid_coa');
         $data = array(
            "code" => $this->input->post('code'),
            "voucher_code" => $this->input->post('voucher_code'),
            "fid_project" => $this->input->post('fid_project'),
            "date" => $this->input->post('date'),
            "update_by" => $this->session->userdata('user_name'),
            "update_at" => date('Y-m-d H:i:s'),
            "description" => $this->input->post('description')
        );

         //print_r($this->session);exit();

        $save_id = $this->Expenses_header_model->save($data,$data_id);
        if ($save_id) {

            $this->_triggerUpdateProject($data_id,$fid_project,$this->input->post('date'));
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $data_id,'message' => lang('record_saved')));
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
            if ($this->Expenses_header_model->delete($id, true)) {

                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Expenses_header_model->delete($id)) {
                $this->Expenses_header_model->triggerDelete($id);
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

     function delete_detail() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Expenses_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data_entry($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Expenses_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of clients, prepared for datatable  */

    function list_data() {

        $list_data = $this->Expenses_header_model->get_details()->result();
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
        $data = $this->Expenses_header_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of client list table */

    private function _make_row($data) {
        // $options = array(
        //     "id" => $data->id
        // );
        
        // $query = $this->Master_Customers_model->get_details($options)->row();
        $value = $this->Master_Coa_Type_model->get_details(array("id"=> $data->fid_coa))->row();
        $row_data = array(
        	anchor(get_uri('accounting/expenses/entry/').$data->id.'/'.$data->fid_coa, $data->code),
            $data->voucher_code,
            $value->account_number." - ".$value->account_name,
            format_to_date($data->date, false),
            number_format($data->total),
            $data->description,
            $data->created_by,
            $data->update_by// $status


        );

        	$row_data[] = anchor(get_uri("accounting/expenses/entry/").$data->id.'/'.$data->fid_coa, "<i class='fa fa-plus'></i>", array("class" => "edit", "title" => "Add Entry", "data-post-id" => $data->id)).modal_anchor(get_uri("accounting/expenses/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_expenses'), "data-post-id" => $data->id))
                . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_client'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("accounting/expenses/delete"), "data-action" => "delete"));
        
        return $row_data;
    }


     function list_data_entry($id) {

        $list_data = $this->Expenses_model->get_details(array('fid_header' => $id))->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row_entry($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of client list  table */

    private function _row_data_entry($id) {
        $options = array(
            "id" => $id
        );
        $data = $this->Expenses_model->get_details($options)->row();
        return $this->_make_row_entry($data);
    }

    /* prepare a row of client list table */

    private function _make_row_entry($data) {
        // $options = array(
        //     "id" => $data->id
        // );
        // $query = $this->Master_Customers_model->get_details($options)->row();
        $kas = $this->Master_Coa_Type_model->getCoaKas("100");
        $value = $this->Master_Coa_Type_model->get_details(array("id"=> $data->fid_coa))->row();
        $row_data = array(
            $value->account_name,
            $value->account_number,
            $data->description,
            number_format($data->debet),
            number_format($data->credit),



        );
        // print_r($kas);
            if(!in_array($value->account_number, $kas)){
            $row_data[] = modal_anchor(get_uri("accounting/expenses/modal_form_detail_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => "Edit Entry", "data-post-id" => $data->id))
                . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_client'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("accounting/expenses/delete_detail"), "data-action" => "delete"));
            }else{
                $row_data[] = "";
            }
        return $row_data;
    }

    function list_view_entry($id) {

        $list_data = $this->Expenses_model->get_details(array('fid_header' => $id))->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_view_entry($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of client list  table */

    private function _row_view_entry($id) {
        $options = array(
            "id" => $id
        );
        $data = $this->Expenses_model->get_details($options)->row();
        return $this->_make_view_entry($data);
    }

    /* prepare a row of client list table */

    private function _make_view_entry($data) {
        // $options = array(
        //     "id" => $data->id
        // );
        // $query = $this->Master_Customers_model->get_details($options)->row();
        $kas = $this->Master_Coa_Type_model->getCoaKas("100");
        $value = $this->Master_Coa_Type_model->get_details(array("id"=> $data->fid_coa))->row();
        // $row_data = array();
        if(!in_array($value->account_number, $kas)){
            $row_data = array(
                $value->account_number,
                $value->account_name,

                number_format($data->debet + $data->credit),
                // number_format(),

            );
            return $row_data;

            
        }else{
            return [];
        }
       
        
    }


    public function entry($id = 0,$fid_coa = 0){
        if($id){
            // echo $id;
            $this->_triggerUpdate($id,$fid_coa);
            $project = $this->db->query("SELECT fid_project,date FROM transaction_journal_header WHERE id = '$id' ")->row();
            $this->_triggerUpdateProject($id,$project->fid_project,$project->date);
            
            $view_data['info_header'] = $this->Expenses_header_model->get_details(array("id" => $id))->row();
            // print_r($view_data['info_header']);
            // exit();
            
            $view_data['info_coa'] = $this->Master_Coa_Type_model->get_details(array("id"=> $view_data['info_header']->fid_coa))->row();
            $view_data['kas_dropdown'] = $this->Master_Coa_Type_model->getCashCoa();


            $this->template->rander("expenses/entry", $view_data);
  
        } else{
            show_404();
        }

    }


    public function view($id = 0,$fid_coa = 0){
        if($id){
            // echo $id;
            
            $view_data['info_header'] = $this->Expenses_header_model->get_details(array("id" => $id))->row();
            // print_r($view_data['info_header']);
            // exit();
            $kas = $this->Master_Coa_Type_model->getCoaKas("100");
            $view_data['listing'] = $this->db->query("SELECT
                                                t.voucher_code,
                                                t.debet + t.credit as amount,
                                                t.description,
                                                a.account_number,
                                                a.account_name
                                            FROM
                                                transaction_journal t
                                            JOIN acc_coa_type a ON t.fid_coa = a.id
                                            WHERE
                                                t.type = 'pengeluaran' 
                                                AND t.fid_header = $id 
                                                AND t.fid_coa != $fid_coa 
                                                AND t.deleted = 0");
            
            
            $view_data['info_coa'] = $this->Master_Coa_Type_model->get_details(array("id"=> $view_data['info_header']->fid_coa))->row();
            $view_data['kas_dropdown'] = $this->Master_Coa_Type_model->getCashCoa();


            $this->template->rander("expenses/view", $view_data);
  
        } else{
            show_404();
        }

    }

    public function download($id = 0,$fid_coa = 0){
        if($id){
            // echo $id;
            $this->load->library('pdf');
            $this->pdf->setPrintHeader(false);
            $this->pdf->setPrintFooter(false);
            $this->pdf->SetCellPadding(1.5);
            $this->pdf->setImageScale(1.42);
            $this->pdf->AddPage();
            $this->pdf->SetFontSize(10);

            
            $view_data['info_header'] = $this->Expenses_header_model->get_details(array("id" => $id))->row();
            // print_r($view_data['info_header']);
            // exit();
            $kas = $this->Master_Coa_Type_model->getCoaKas("100");
            $view_data['listing'] = $this->db->query("SELECT
                                                t.voucher_code,
                                                t.debet + t.credit as amount,
                                                t.description,
                                                a.account_number,
                                                a.account_name
                                            FROM
                                                transaction_journal t
                                            JOIN acc_coa_type a ON t.fid_coa = a.id
                                            WHERE
                                                t.type = 'pengeluaran' 
                                                AND t.fid_header = $id 
                                                AND t.fid_coa != $fid_coa 
                                                AND t.deleted = 0");
            $data = $this->Expenses_model->get_details(array("id"=> $fid_coa));
        
            
            $view_data['info_coa'] = $this->Master_Coa_Type_model->get_details(array("id"=> $view_data['info_header']->fid_coa))->row();
            $view_data['kas_dropdown'] = $this->Master_Coa_Type_model->getCashCoa();


            // $this->template->rander("expenses/download", $view_data);
            $html = $this->load->view("expenses/download", $view_data, true);

            $this->pdf->writeHTML($html, true, false, true, false, '');
            $pdf_file_name = "Expenses_".$view_data['info_header']->voucher_code."_".date("d-M-Y").".pdf";
            $this->pdf->Output($pdf_file_name, "D");
  
        } else{
            show_404();
        }

    }

}