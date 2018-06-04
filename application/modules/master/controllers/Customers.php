<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Customers extends MY_Controller {

    function __construct() {
        parent::__construct();

        //check permission to access this module
    }

    /* load clients list view */

    function index() {

        $view_data['data'] = "";
        $this->template->rander("customers/index", $view_data);
    }

    /* load client add/edit modal */

    function modal_form() {
        //get custom fields
        $this->db->select('nama');
        $view_data["provinsi_dropdown"] = $this->db->get("ref_provinsi")->result_array();
        $this->load->view('customers/modal_form',$view_data);
    }

    function getId($id){

        if(!empty($id)){
            $options = array(
                "id" => $id,
            );
            $data = $this->Master_Customers_model->get_details($options)->row();

            echo json_encode(array("success" => true,"data" => $data));
        }else{
            echo json_encode(array('success' => false,'message' => lang('error_occurred')));
        }
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );

        $view_data['model_info'] = $this->Master_Customers_model->get_details($options)->row();

        

        $this->load->view('customers/modal_form_edit', $view_data);
    }

    /* insert or update a client */

    function add_customers() {
        validate_submitted_data(array(
            "code" => "required",
            "name" => "required"

        ));

        $data = array(
            "code" => $this->input->post('code'),
            "name" => $this->input->post('name'),

            // "company_name" => $this->input->post('company_name'),
            "npwp" => $this->input->post('npwp'),
            "address" => $this->input->post('address'),
            "termin" => $this->input->post('termin'),
            "email" => $this->input->post('email'),
            "mobile" => $this->input->post('mobile'),
            "contact" => $this->input->post('contact'),
            "credit_limit" => $this->input->post('credit_limit'),
            "memo" => $this->input->post('memo'),
            "created_at" => get_current_utc_time()
        );

        

        $save_id = $this->Master_Customers_model->save($data);
        if ($save_id) {
            
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id ,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save() {
        $customers_id = $this->input->post('id');


        validate_submitted_data(array(
            "id" => "numeric",
            "name" => "required"
        ));

        $data = array(

            "code" => $this->input->post('code'),
            "name" => $this->input->post('name'),
            // "company_name" => $this->input->post('company_name'),
            "npwp" => $this->input->post('npwp'),
            "address" => $this->input->post('address'),
            "termin" => $this->input->post('termin'),
            "email" => $this->input->post('email'),
            "mobile" => $this->input->post('mobile'),
            "contact" => $this->input->post('contact'),
            "credit_limit" => $this->input->post('credit_limit'),
            "memo" => $this->input->post('memo')        
        );

        $save_id = $this->Master_Customers_model->save($data, $customers_id);
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
            if ($this->Master_Customers_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Master_Customers_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of clients, prepared for datatable  */

    function list_data() {

        $list_data = $this->Master_Customers_model->get_details()->result();
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
        $data = $this->Master_Customers_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of client list table */

    private function _make_row($data) {


        $row_data = array(
            $data->code,
            $data->name,
            $data->npwp,
            $data->address,
            $data->email,
            $data->mobile,
            $data->memo

        );


        $row_data[] = modal_anchor(get_uri("master/customers/view"), "<i class='fa fa-eye'></i>", array("class" => "view", "title" => lang('view'), "data-post-id" => $data->id)).modal_anchor(get_uri("master/customers/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => "Edit Customers", "data-post-id" => $data->id))
                . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => "Delete Customers", "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("master/customers/delete"), "data-action" => "delete"));

        return $row_data;
    }

    function view(){
        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );

        $view_data['model_info'] = $this->Master_Customers_model->get_details($options)->row();

        

        $this->load->view('customers/view', $view_data);
    }


}

/* End of file clients.php */
/* Location: ./application/controllers/clients.php */