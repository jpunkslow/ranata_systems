<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Items extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('master/Master_Items_model');
        $this->load->model('master/Master_Coa_Type_model');
    }


    //load note list view
    function index() {
       
        $this->template->rander("items/index");
    }

    function test(){
        $item_info = $this->Master_Items_model->get_details()->result();
        print_r($item_info);
    }

    /* load item modal */

    function modal_form() {


        $view_data['sales_journal'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','400');
        $view_data['sales_journal_lawan'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','110001');
        $view_data['hpp_journal'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','500');
        $view_data['lawan_hpp'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','150');

        $this->load->view('items/modal_form', $view_data);
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));

         $view_data['sales_journal'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','400');
         $view_data['sales_journal_lawan'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','110001');
        
        $view_data['hpp_journal'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','500');
         $view_data['lawan_hpp'] = $this->Master_Coa_Type_model->getCoaDrop('account_number','150');
        $view_data['model_info'] = $this->Master_Items_model->get_one($this->input->post('id'));

        $this->load->view('items/modal_form_edit', $view_data);
    }

    /* add or edit an item */

     function add() {


        $item_data = array(
            "title" => $this->input->post('title'),
            "code" => $this->input->post('code'),
            "category" => $this->input->post('category'),
            "sales_journal" => $this->input->post('sales_journal'),
            "sales_journal_lawan" => $this->input->post('sales_journal_lawan'),
            "hpp_journal" => $this->input->post('hpp_journal'),
            "lawan_hpp" => $this->input->post('lawan_hpp'),
            "unit" => $this->input->post('unit'),
            "unit_type" => $this->input->post('unit_type')
        );

        $item_id = $this->Master_Items_model->save($item_data);
        if ($item_id) {

            $item_info = $this->Master_Items_model->get_details(array("id"=>$item_id))->row();
            echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_item_row($item_info), 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));

        $id = $this->input->post('id');

        $item_data = array(
            "title" => $this->input->post('title'),
            "code" => $this->input->post('code'),
            "category" => $this->input->post('category'),
            "sales_journal" => $this->input->post('sales_journal'),
            "sales_journal_lawan" => $this->input->post('sales_journal_lawan'),
            "unit" => $this->input->post('unit'),
            
            "hpp_journal" => $this->input->post('hpp_journal'),
            "lawan_hpp" => $this->input->post('lawan_hpp'),
            "unit_type" => $this->input->post('unit_type')

            // "price" => $this->input->post('price')
        );

        $item_id = $this->Master_Items_model->save($item_data, $id);
        if ($item_id) {
            $options = array("id" => $item_id);
            $item_info = $this->Master_Items_model->get_details($options)->row();
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
            if ($this->Master_Items_model->delete($id, true)) {
                $options = array("id" => $id);
                $item_info = $this->Master_Items_model->get_details($options)->row();
                echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_item_row($item_info), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Master_Items_model->delete($id)) {
                $item_info = $this->Master_Items_model->get_one($id);
                echo json_encode(array("success" => true, "id" => $item_info->id, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of items, prepared for datatable  */

    function list_data() {

        $list_data = $this->Master_Items_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_item_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* prepare a row of item list table */

    private function _make_item_row($data) {
        // $type = $data->unit_type ? $data->unit_type : "";

        return array(
            $data->title,
            // $data->code,
            $data->category,
            $data->unit_type,
            $data->unit,
            $data->sales_journal_name,
            $data->sales_journal_lawan_name,
            $data->hpp_journal_name,
            $data->hpp_journal_lawan,
            modal_anchor(get_uri("master/items/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_item'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("master/items/delete"), "data-action" => "delete"))
        );
    }

}

/* End of file items.php */
/* Location: ./application/controllers/items.php */