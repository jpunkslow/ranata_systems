<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Ip_restriction extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    

    function index() {
        $this->template->rander("ip_restriction/index");
    }

    function save_ip_settings() {
        $this->Settings_model->save_setting("allowed_ip_addresses", $this->input->post("allowed_ip_addresses"));

        echo json_encode(array("success" => true, 'message' => lang('settings_updated')));
    }


}

/* End of file general_settings.php */
    /* Location: ./application/controllers/general_settings.php */