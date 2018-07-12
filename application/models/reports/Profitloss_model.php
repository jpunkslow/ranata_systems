<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Profitloss_model extends CI_Model {


	

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


	function get_jml_akun($akun,$start,$end) {
			$this->db->select('SUM(debet) AS jum_debet, SUM(credit) AS jum_kredit');
			$this->db->from('transaction_journal');
			$this->db->where('fid_coa', $akun);

		// 	if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
		// 	$tgl_dari = $_REQUEST['tgl_dari'];
		// 	$tgl_samp = $_REQUEST['tgl_samp'];
		// } else {
		// 	$tgl_dari = date('Y') . '-01-01';
		// 	$tgl_samp = date('Y') . '-12-31';
		// }
		$this->db->where('DATE(date) >= ', ''.$start.'');
		$this->db->where('DATE(date) <= ', ''.$end.'');

		$query = $this->db->get();
		return $query->row();
	}
}