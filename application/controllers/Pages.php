<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Pages extends CI_Controller {

    function __construct() {
        parent::__construct();
        
    }

    //show home pages
    function index() {
        $view_data['data'] = "data";
     
        $this->template->render_front("pages/index", $view_data);
    }

    function about() {
        $view_data['data'] = "data";
     
        $this->template->render_front("pages/about", $view_data);
    }

    function services() {
        $view_data['data'] = "data";
     
        $this->template->render_front("pages/services", $view_data);
    }

    function portfolio() {
        $view_data['data'] = "data";
     
        $this->template->render_front("pages/portfolio", $view_data);
    }

    function blogs() {
        $view_data['data'] = "data";
     
        $this->template->render_front("pages/blogs", $view_data);
    }

    function contact() {
        $view_data['data'] = "data";
     
        $this->template->render_front("pages/contact", $view_data);
    }
}