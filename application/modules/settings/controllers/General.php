<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class General extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    

    function index() {
        $tzlist = DateTimeZone::listIdentifiers(DateTimeZone::ALL);
        $view_data['timezone_dropdown'] = array();
        foreach ($tzlist as $zone) {
            $view_data['timezone_dropdown'][$zone] = $zone;
        }

        $view_data['language_dropdown'] = array();
        $dir = "./application/language/";
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if ($file && $file != "." && $file != ".." && $file != "index.html") {
                        $view_data['language_dropdown'][$file] = ucfirst($file);
                    }
                }
                closedir($dh);
            }
        }

        $view_data["currency_dropdown"] = get_international_currency_code_dropdown();
        $this->template->rander("general/index", $view_data);
    }

    function save_general_settings() {
        $settings = array("site_logo", "show_background_image_in_signin_page", "show_logo_in_signin_page", "app_title", "language", "timezone", "date_format", "time_format", "first_day_of_week", "default_currency", "currency_symbol", "currency_position", "decimal_separator", "accepted_file_formats", "rows_per_page", "item_purchase_code", "scrollbar");

        foreach ($settings as $setting) {
            $value = $this->input->post($setting);
            if ($value || $value === "0") {
                if ($setting === "site_logo") {
                    $value = str_replace("~", ":", $value);
                    $value = move_temp_file("site-logo.png", get_setting("system_file_path"), "", $value);
                }

                $this->Settings_model->save_setting($setting, $value);
            }
        }

        $file_names = $this->input->post('file_names');
        if ($file_names && count($file_names)) {
            move_temp_file($file_names["0"], get_setting("system_file_path"), "", NULL, "sigin-background-image.jpg");
        }


        if ($_FILES) {
            $site_logo_file = get_array_value($_FILES, "site_logo_file");
            $site_logo_file_name = get_array_value($site_logo_file, "tmp_name");
            if ($site_logo_file_name) {
                $site_logo = move_temp_file("site-logo.png", get_setting("system_file_path"));
                $this->Settings_model->save_setting("site_logo", $site_logo);
            }
        }

        echo json_encode(array("success" => true, 'message' => lang('settings_updated')));
    }

}

/* End of file general_settings.php */
    /* Location: ./application/controllers/general_settings.php */