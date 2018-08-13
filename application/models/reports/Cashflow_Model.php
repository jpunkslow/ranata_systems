<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cashflow_model extends CI_Model {

	function get_data_akun_dapat() {
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Pendapatan' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}

	}
	function getPendNonOp(){
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Pendapatan Lain-lain' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	function getBebanPokokPenjualan(){
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Harga Pokok Penjualan' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}
	function getBebanOperasional(){
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Beban Administrasi Umum' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	function getHutangBeban(){
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Hutang Lancar' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}
	function get_jml_akun($akun,$month,$year) {
		$start=$year.'-'.$month.'-01';
		$end=$year.'-'.$month.'-31';
			$this->db->select('SUM(debet) AS jum_debet, SUM(credit) AS jum_kredit');
			$this->db->from('transaction_journal');
			$this->db->where('fid_coa', $akun);

		$this->db->where('DATE(date) >= ', ''.$start.'');
		$this->db->where('DATE(date) <= ', ''.$end.'');

		$query = $this->db->get();
		return $query->row();
	}
}