<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Cron_job extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

   
    
    function index() {
        $this->template->rander("cron_job/index");
    }

}

/* End of file general_settings.php */
    /* Location: ./application/controllers/general_settings.php */