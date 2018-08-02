<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Assets extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('master/Master_Assets_model');
    }


    //load note list view
    function index() {
        

        $this->template->rander("assets/index");
    }

    function getId($id){

        if(!empty($id)){
            $options = array(
                "id" => $id,
            );
            $data = $this->Master_Assets_model->get_details($options)->row();

            echo json_encode(array("success" => true,"data" => $data));
        }else{
            echo json_encode(array('success' => false,'message' => lang('error_occurred')));
        }
    }

    /* load item modal */

    function modal_form() {
        $view_data['activa_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop("account_number","161");
        $view_data['expenses_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop("account_number","600");
        $view_data['coa_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop("account_number","100");

        $this->load->view('assets/modal_form',$view_data);
    }


    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));
         $view_data['activa_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop("account_number","161");
        $view_data['expenses_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop("account_number","600");
        $view_data['coa_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop("account_number","100");

        $view_data['model_info'] = $this->Master_Assets_model->get_one($this->input->post('id'));

        $this->load->view('assets/modal_form_edit', $view_data);
    }

    /* add or edit an item */

    function add() {

        validate_submitted_data(array(
            "activa_type" => "required",
            "activa_age" => "required",
            "activa_pricing" => "required"
        ));

        $item_data = array(
            "activa_code" => $this->input->post('activa_code'),
            "asset_name" => $this->input->post('asset_name'),
            
            "activa_type" => $this->input->post('activa_type'),
            "activa_age" => $this->input->post('activa_age'),
            "asset_residu" => $this->input->post('asset_residu'),
            "activa_pricing" => $this->input->post('activa_pricing'),
            "depreciated_method" => "Garis_Lurus",
            "activa_account" => $this->input->post('activa_account'),
            "activa_depreciate_account" => $this->input->post('activa_depreciate_account'),
            "activa_expense_depre_account" => $this->input->post('activa_expense_depre_account'),
            "created_at" => get_current_utc_time(),
            "get_date" => $this->input->post('get_date')
            
        );

        $item_id = $this->Master_Assets_model->save($item_data);
        if ($item_id) {
            $item_info = $this->Master_Assets_model->get_details()->row();
            echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_item_row($item_info), 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save() {

        validate_submitted_data(array(
            "id" => "numeric",
            "activa_type" => "required",
            "activa_age" => "required",
            "activa_pricing" => "required"
        ));

        $id = $this->input->post('id');

        $item_data = array(
            "activa_code" => $this->input->post('activa_code'),
            
            "asset_name" => $this->input->post('asset_name'),
            "activa_type" => $this->input->post('activa_type'),
            "activa_age" => $this->input->post('activa_age'),
            "asset_residu" => $this->input->post('asset_residu'),
            "activa_pricing" => $this->input->post('activa_pricing'),
            // "depreciated_method" => $this->input->post('depreciated_method'),
            "activa_account" => $this->input->post('activa_account'),
            "activa_depreciate_account" => $this->input->post('activa_depreciate_account'),
            "activa_expense_depre_account" => $this->input->post('activa_expense_depre_account'),
            "get_date" => $this->input->post('get_date')
            
        );

        $item_id = $this->Master_Assets_model->save($item_data, $id);
        if ($item_id) {
            $options = array("id" => $item_id);
            $item_info = $this->Master_Assets_model->get_details($options)->row();
            echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_item_row($item_info), 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }


    /* delete or undo an item */

    function delete() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Master_Assets_model->delete($id, true)) {
                $options = array("id" => $id);
                $item_info = $this->Master_Assets_model->get_details($options)->row();
                echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_item_row($item_info), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Master_Assets_model->delete($id)) {
                $item_info = $this->Master_Assets_model->get_one($id);
                echo json_encode(array("success" => true, "id" => $item_info->id, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of items, prepared for datatable  */

    function list_data() {

        $list_data = $this->Master_Assets_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_item_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* prepare a row of item list table */

    private function _make_item_row($data) {
        $getDate = new DateTime($data->get_date);
        $today = new DateTime();
        $umur = $today->diff($getDate);
        $age = ($umur->y * 12) + $umur->m;
        $persentase = (100 / 100) * $data->activa_age;

        $residu = $data->asset_residu;
        // if($residu > 0){
        //     $annual = ($age!=0)?($data->activa_pricing / $residu / $age):0;
        // }
        $annual = $data->activa_pricing / $persentase - $residu;
        // $annual = $data->activa_pricing;
            
        $activa_acc = $this->Master_Coa_Type_model->get_details(array("id" => $data->activa_account))->row();
        $activa_depre_acc = $this->Master_Coa_Type_model->get_details(array("id" => $data->activa_depreciate_account))->row();
        $activa_exp_depre_acc = $this->Master_Coa_Type_model->get_details(array("id" => $data->activa_expense_depre_account))->row();
        return array(
            $data->activa_code,
            str_replace("_", " ", $data->activa_type),
            // $activa_acc->account_number." - ".$activa_acc->account_name,
            $data->asset_name,
            format_to_date($data->get_date,true),
         
            $data->activa_age." Year",
            to_currency($data->activa_pricing,false),
            to_currency($residu,false),
            to_currency($annual,false),
            to_currency($annual / 12),
            // $activa_depre_acc->account_number." - ".$activa_depre_acc->account_name,
            // $activa_exp_depre_acc->account_number." - ".$activa_exp_depre_acc->account_name,
            modal_anchor(get_uri("master/assets/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("master/assets/delete"), "data-action" => "delete"))
        );
    }

}

/* End of file items.php */
/* Location: ./application/controllers/items.php */