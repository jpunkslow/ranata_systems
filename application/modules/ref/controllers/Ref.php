<?php 


class Ref extends MY_Controller {

    function __construct() {
        parent::__construct();

    }



    function index(){

    }

    function getCountry(){

    }

    function getProvinsi(){

    	$data = $this->db->get("ref_provinsi")->result();

    	echo json_encode(array("success" => true , "data"=>$data));
    }
}