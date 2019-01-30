<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Stock extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('inventory/Master_Stock_model');
        $this->load->model('master/Master_Warehouse_model');
        $this->load->model('master/Master_Items_model');
    }


    //load note list view
    function index() {

        $this->template->rander("stock/index");
    }

    function getId($id){

        if(!empty($id)){
            $options = array(
                "id" => $id,
            );
            $data = $this->Master_Stock_model->get_details($options)->row();

            echo json_encode(array("success" => true,"data" => $data));
        }else{
            echo json_encode(array('success' => false,'message' => lang('error_occurred')));
        }
    }

    /* load item modal */

    function modal_form() {

        $view_data['data_warehouse'] = $this->Master_Warehouse_model->getWarehouseDrop();
        $view_data['data_items'] = $this->Master_Items_model->getItemsDrop();
        $this->load->view('stock/modal_form',$view_data);
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));
        $view_data['data_warehouse'] = $this->Master_Warehouse_model->getWarehouseDrop();
        $view_data['data_items'] = $this->Master_Items_model->getItemsDrop();
        $view_data['model_info'] = $this->Master_Stock_model->get_one($this->input->post('id'));

        $this->load->view('stock/modal_form_edit', $view_data);
    }

    /* add or edit an item */

     function add() {


        $item_data = array(
            "master_warehouse_id" => $this->input->post('master_warehouse_id'),
            "master_items_id" => $this->input->post('master_items_id'),
            "stock_on_hand" => $this->input->post('stock_on_hand'),
            "date_adjusment" => $this->input->post('date_adjusment'),
            "description" => $this->input->post('description'),
            "created_by" => $this->session->userdata('user_name'),
            "created_at" => get_current_utc_time(),
            "updated_by" => $this->session->userdata('user_name'),
            "updated_at" => get_current_utc_time(),
            "deleted" =>0
        );

        $data = $this->Master_Stock_model->save($item_data);
        if ($data) {
            $item_info = $this->Master_Stock_model->get_details()->row();
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
            "master_warehouse_id" => $this->input->post('master_warehouse_id'),
            "master_items_id" => $this->input->post('master_items_id'),
            "stock_on_hand" => $this->input->post('stock_on_hand'),
            "date_adjusment" => $this->input->post('date_adjusment'),
            "description" => $this->input->post('description'),
            "updated_by" => $this->session->userdata('user_name'),
            "updated_at" => get_current_utc_time(),
            "deleted" =>0
        );

         //print_r($item_data);exit();

        $data = $this->Master_Stock_model->save($item_data, $id);
        //echo $this->db->last_query();exit();
        if ($data) {
            $options = array("id" => $data);
            $item_info = $this->Master_Stock_model->get_details($options)->row();
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
            if ($this->Master_Stock_model->delete($id, true)) {
                $options = array("id" => $id);
                $item_info = $this->Master_Stock_model->get_details($options)->row();
                echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_item_row($item_info), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Master_Stock_model->delete($id)) {
                $item_info = $this->Master_Stock_model->get_one($id);
                echo json_encode(array("success" => true, "id" => $item_info->id, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of items, prepared for datatable  */

    function list_data() {

        $list_data = $this->Master_Stock_model->get_details()->result();
        $result = array();
        $before='';
        foreach ($list_data as $data) {
            $result[] = $this->_make_item_row($data,$before);
            $before=$data->name;
        }
        echo json_encode(array("data" => $result));
    }

    /* prepare a row of item list table */

    private function _make_item_row($data,$before) {
        // $type = $data->unit_type ? $data->unit_type : "";

        $name=$data->name;
        //$code=$data->code;
        if($data->name==$before){
            $name='';
        }


        return array(
            $data->code,
            $name,
            $data->title,
            $data->stock_on_hand,
            $data->description,
            $data->date_adjusment,
            modal_anchor(get_uri("inventory/stock/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_item'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("inventory/stock/delete"), "data-action" => "delete"))
        );
    }

}

/* End of file items.php */
/* Location: ./application/controllers/items.php */