<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Neraca_model extends CI_Model {


	

	function get_data_akun_dapat() {
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Income' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}

	}
	function getPendNonOp(){
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Other Income' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	function getBebanPokokPenjualan(){
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Cost Of Good Sold' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	function get_data_akun_biaya() {
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND `account_type` = 'Expenses' AND parent is NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	function get_data_akun_biaya_other() {
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND `account_type` = 'Other Expenses' AND parent is NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	
}