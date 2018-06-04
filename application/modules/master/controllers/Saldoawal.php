<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Saldoawal extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('master/Master_Saldoawal_model');
    }


    //load note list view
    function index() {

        $this->template->rander("saldoawal/index");
    }

    /* load item modal */

    function modal_form() {

        $view_data['coa_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop();

        $this->load->view('saldoawal/modal_form',$view_data);
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));

        $view_data['coa_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCoaDrop();
        $view_data['model_info'] = $this->Master_Saldoawal_model->get_one($this->input->post('id'));

        $this->load->view('saldoawal/modal_form_edit', $view_data);
    }

    /* add or edit an item */

     function add() {
        validate_submitted_data(array(
            "periode" => "numeric",
            "fid_coa" => "required"
        ));

        $item_data = array(
            "periode" => $this->input->post('periode'),
            "date" => $this->input->post("date"),
            "fid_coa" => $this->input->post('fid_coa'),
            "debet" => $this->input->post('debet'),
            "credit" => $this->input->post('credit')
           
        );

        $item_id = $this->Master_Saldoawal_model->save($item_data);
        if ($item_id) {
            $item_info = $this->Master_Saldoawal_model->get_details()->row();
            echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_row($item_info), 'message' => lang('record_saved')));
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
            "periode" => $this->input->post('periode'),
            "date" => $this->input->post("date"),
            "fid_coa" => $this->input->post('fid_coa'),
            "debet" => $this->input->post('debet'),
            "credit" => $this->input->post('credit')
        );

        $item_id = $this->Master_Saldoawal_model->save($item_data, $id);
        if ($item_id) {
            $options = array("id" => $item_id);
            $item_info = $this->Master_Saldoawal_model->get_details($options)->row();
            echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_row($item_info), 'message' => lang('record_saved')));
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
            if ($this->Master_Saldoawal_model->delete($id, true)) {
                $options = array("id" => $id);
                $item_info = $this->Master_Saldoawal_model->get_details($options)->row();
                echo json_encode(array("success" => true, "id" => $item_info->id, "data" => $this->_make_row($item_info), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Master_Saldoawal_model->delete($id)) {
                $item_info = $this->Master_Saldoawal_model->get_one($id);
                echo json_encode(array("success" => true, "id" => $item_info->id, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of items, prepared for datatable  */

    function list_data() {

        $list_data = $this->Master_Saldoawal_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* prepare a row of item list table */

    private function _make_row($data) {
        // $type = $data->unit_type ? $data->unit_type : "";
        $coa = $this->Master_Coa_Type_model->get_details(array("id" => $data->fid_coa))->row();
        return array(
            $data->periode,
            format_to_date($data->date),
            $coa->account_number." - ".$coa->account_name,
            to_currency($data->debet,false),
            to_currency($data->credit,false),
            modal_anchor(get_uri("master/saldoawal/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_item'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("master/saldoawal/delete"), "data-action" => "delete"))
        );
    }

}

/* End of file items.php */
/* Location: ./application/controllers/items.php */