<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Company extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    
    function index() {
        $this->template->rander("company/index");
    }

    function save_company_settings() {
        $settings = array("company_name", "company_address", "company_phone", "company_email", "company_website");

        foreach ($settings as $setting) {
            $this->Settings_model->save_setting($setting, $this->input->post($setting));
        }
        echo json_encode(array("success" => true, 'message' => lang('settings_updated')));
    }

   
}

/* End of file general_settings.php */
    /* Location: ./application/controllers/general_settings.php */