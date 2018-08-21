<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Users extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    function index() {
        $this->template->rander("users/index");
    }

    function modal_form() {

        

        $this->load->view('users/modal_form', $view_data);
    }
     function modal_form_edit() {

        

        $view_data['model_info'] = $this->User_model->get_one($this->input->post('id'));
        $this->load->view('users/modal_form_edit', $view_data);
    }

     function modal_form_edit_password() {

        

        $view_data['model_info'] = $this->User_model->get_one($this->input->post('id'));
        $this->load->view('users/modal_form_edit_password', $view_data);
    }

    function add() {

        validate_submitted_data(array(
            "first_name" => "required",
            "last_name" => "required",
            'email' => "required",
            'password' => 'required'
        ));

        $first_name = $this->input->post('first_name');
        $last_name = $this->input->post('last_name');
        $email = $this->input->post('email');
        $user_type = $this->input->post('user_type');
        $status = $this->input->post('status');
        $password = $this->input->post('password');

        $data = array(
            'first_name' => trim($first_name),
            'last_name' => trim($last_name),
            'email' => trim($email),
            'user_type' => $user_type,
            'status' => $status,
            'password' => md5(trim($password))
        );
        $save_id = $this->User_model->save($data);
        if($password === $this->input->post('repassword')){
            if ($save_id) {
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            }
        }else{
               echo json_encode(array("success" => false, 'message' => "Password Not Match, Please Try Again"));
        }
    }
    function save() {

        validate_submitted_data(array(
            "first_name" => "required",
            "last_name" => "required",
            'email' => "required",
            'id' => 'required'
        ));
        $id = $this->input->post('id');


        $first_name = $this->input->post('first_name');
        $last_name = $this->input->post('last_name');
        $email = $this->input->post('email');
        $user_type = $this->input->post('user_type');
        $status = $this->input->post('status');

        $data = array(
            'first_name' => trim($first_name),
            'last_name' => trim($last_name),
            'email' => trim($email),
            'user_type' => $user_type,
            'status' => $status
        );
        $save_id = $this->User_model->save($data,$id);
        if ($save_id) {
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save_password() {

        validate_submitted_data(array(
            "password" => "required",
            "repassword" => "required",
            'id' => 'required'
        ));
        $id = $this->input->post('id');


        $password = $this->input->post('password');

        $data = array(
            'password' => md5(trim($password)),
        );
        $save_id = $this->User_model->save($data,$id);
        if($password === $this->input->post('repassword')){
            if ($save_id) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
                } else {
                    echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            }
        }else{
             echo json_encode(array("success" => false, 'message' => "Password Not Match, Please Retype Password Again."));
        }
    }

    function delete() {
        validate_submitted_data(array(
            "id" => "numeric|required"
        ));


        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->User_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->User_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    function list_data() {
        $list_data = $this->User_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    private function _row_data($id) {
        $options = array("id" => $id);
        $data = $this->User_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    private function _make_row($data) {
        return array(
        	$data->first_name." ".$data->last_name,
        	$data->user_type,
        	$data->email,
            $data->status,
            modal_anchor(get_uri("settings/users/modal_form_edit_password"), "<i class='fa fa-lock'></i>", array("class" => "edit", "title" => "Set New Password", "data-post-id" => $data->id)).modal_anchor(get_uri("settings/users/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => "Edit User", "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_tax'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("settings/users/delete"), "data-action" => "delete"))
        );
    }

}

/* End of file taxes.php */
/* Location: ./application/controllers/taxes.php */