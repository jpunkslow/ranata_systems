<?php

class Signin extends MY_Controller {

    function __construct() {
        parent::__construct();
        // $this->load->helper('email');
    }

    function index() {
        if ($this->Users_model->login_user_id()) {
            redirect('users/dashboard');
        } else {

            $redirect = "";
            if (isset($_REQUEST["redirect"])) {
                $redirect = $_REQUEST["redirect"];
            }

            // $this->form_validation->set_rules('email', '', 'callback_authenticate');
            $this->form_validation->set_error_delimiters('<span>', '</span>');
            if ($this->form_validation->run() == FALSE) {

                $view_data["redirect"] = $redirect;
                $this->load->view('signin/index', $view_data);
            } else {

                if ($redirect) {
                    redirect($redirect);
                } else {
                    redirect('users/dashboard');
                }
            }
        }
    }

    // check authentication
    function authenticate($email) {
        $password = $this->input->post("password");
        if (!$this->Users_model->authenticate($email, $password)) {
            $this->form_validation->set_message('authenticate', lang("authentication_failed"));
            return false;
        }
        return true;
    }

    function sign_out() {
        $this->Users_model->sign_out();
    }

    //send an email to users mail with reset password link
    function send_reset_password_mail() {
        validate_submitted_data(array(
            "email" => "required|valid_email"
        ));

        $email = $this->input->post("email");
        $existing_user = $this->Users_model->is_email_exists($email);

        //send reset password email if found account with this email
        if ($existing_user) {
            $email_template = $this->Email_templates_model->get_final_template("reset_password");

            $parser_data["ACCOUNT_HOLDER_NAME"] = $existing_user->first_name . " " . $existing_user->last_name;
            $parser_data["SIGNATURE"] = $email_template->signature;
            $parser_data["SITE_URL"] = get_uri();
            $key = encode_id($this->encrypt->encode($existing_user->email . '|' . (time() + (24 * 60 * 60))), "reset_password");
            $parser_data['RESET_PASSWORD_URL'] = get_uri("signin/new_password/" . $key);

            $message = $this->parser->parse_string($email_template->message, $parser_data, TRUE);
            if (send_app_mail($email, $email_template->subject, $message)) {
                echo json_encode(array('success' => true, 'message' => lang("reset_info_send")));
            } else {
                echo json_encode(array('success' => false, 'message' => lang('error_occurred')));
            }
        } else {
            echo json_encode(array("success" => false, 'message' => lang("no_acount_found_with_this_email")));
            return false;
        }
    }

    //show forgot password recovery form
    function request_reset_password() {
        $view_data["form_type"] = "request_reset_password";
        $this->load->view('signin/index', $view_data);
    }

    //when user clicks to reset password link from his/her email, redirect to this url
    function new_password($key) {
        $valid_key = $this->is_valid_reset_password_key($key);

        if ($valid_key) {
            $email = get_array_value($valid_key, "email");

            if ($this->Users_model->is_email_exists($email)) {
                $view_data["key"] = $key;
                $view_data["form_type"] = "new_password";
                $this->load->view('signin/index', $view_data);
                return false;
            }
        }

        //else show error
        $view_data["heading"] = "Invalid Request";
        $view_data["message"] = "The key has expaired or something went wrong!";
        $this->load->view("errors/html/error_general", $view_data);
    }

    //finally reset the old password and save the new password
    function do_reset_password() {

        validate_submitted_data(array(
            "key" => "required",
            "password" => "required"
        ));


        $key = $this->input->post("key");
        $password = $this->input->post("password");
        $valid_key = $this->is_valid_reset_password_key($key);

        if ($valid_key) {
            $email = get_array_value($valid_key, "email");
            $user = $this->Users_model->is_email_exists($email);
            $user_data = array("password" => md5($password));
            if ($user->id && $this->Users_model->save($user_data, $user->id)) {
                echo json_encode(array("success" => true, 'message' => lang("password_reset_successfully") . " " . anchor("signin", lang("signin"))));
                return true;
            }
        }
        echo json_encode(array("success" => false, 'message' => lang("error_occurred")));
    }

    //check valid key
    private function is_valid_reset_password_key($key = "") {

        if ($key) {
            $key = decode_id($key, "reset_password");
            $key = $this->encrypt->decode($key);
            $key = explode('|', $key);

            $email = get_array_value($key, "0");
            $expire_time = get_array_value($key, "1");

            if ($email && valid_email($email) && $expire_time && $expire_time > time()) {
                return array("email" => $email);
            }
        }
    }

}
