<?php

function init_settings() {
    $ci = & get_instance();

    $settings = $ci->Settings_model->get_all()->result();
    foreach ($settings as $setting) {
        $ci->config->set_item($setting->setting_name, $setting->setting_value);
    }

    $language = get_setting("language");

    $ci->lang->load('default', $language);
    $ci->lang->load('custom', $language); //load custom after loading the default. because custom will overwrite the default file.
}
