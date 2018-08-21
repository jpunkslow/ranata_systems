<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Invoice extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    

    function index() {
        $this->template->rander("invoice/index");
    }

    function save_invoice_settings() {
        $settings = array("allow_partial_invoice_payment_from_clients", "invoice_color", "invoice_footer", "send_bcc_to", "invoice_prefix", "invoice_style", "invoice_logo");

        foreach ($settings as $setting) {
            $value = $this->input->post($setting);
            $saveable = true;

            if ($setting == "invoice_footer") {
                $value = decode_ajax_post_data($value);
            } else if ($setting === "invoice_logo" && $value) {
                $value = str_replace("~", ":", $value);
                $value = move_temp_file("invoice-logo.png", get_setting("system_file_path"), "", $value);
            }

            //don't save blank image
            if ($setting === "invoice_logo" && !$value) {
                $saveable = false;
            }

            if ($saveable) {
                $this->Settings_model->save_setting($setting, $value);
            }
        }
        echo json_encode(array("success" => true, 'message' => lang('settings_updated')));
    }

}

/* End of file general_settings.php */
    /* Location: ./application/controllers/general_settings.php */