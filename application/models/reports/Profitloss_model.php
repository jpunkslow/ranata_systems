<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Profitloss_model extends CI_Model {


	

	function get_data_akun_dapat() {
		// $this->db->select('*');
		// $this->db->from('acc_coa');
		// $this->db->where('aktif', 'Y');
		// $this->db->where('laba_rugi', 'PENDAPATAN');
		// $this->db->where('CHAR_LENGTH(kd_aktiva) >', '1', FALSE);
		// // $this->db->_protect_identifiers = FALSE;
		// $this->db->order_by('LPAD(kd_aktiva, 1, 0) ASC, LPAD(kd_aktiva, 5, 1)', 'ASC');
		// $this->db->_protect_identifiers = TRUE;
		$query = $this->db->query("SELECT * FROM `acc_coa` WHERE `aktif` = 'Y' AND `laba_rugi` = 'PENDAPATAN' AND CHAR_LENGTH(kd_aktiva) >1 ORDER BY kd_aktiva ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}

		// $this->db->_protect_identifiers(FALSE)->select('*')->from('acc_coa')->where('aktif', 'Y')->where('laba_rugi', 'PENDAPATAN')->where('CHAR_LENGTH(kd_aktiva) >', '1', FALSE);
	}

	function get_data_akun_biaya() {
		// $this->db->select('*');
		// $this->db->from('acc_coa');
		// $this->db->where('aktif', 'Y');
		// $this->db->where('laba_rugi', 'BIAYA');
		// $this->db->where('CHAR_LENGTH(kd_aktiva) >', '1', FALSE);
		// // $this->db->_protect_identifiers = FALSE;
		// $this->db->order_by('LPAD(kd_aktiva, 1, 0) ASC, LPAD(kd_aktiva, 5, 1)', 'ASC');
		$query = $this->db->query("SELECT * FROM `acc_coa` WHERE `aktif` = 'Y' AND `laba_rugi` = 'BIAYA' AND CHAR_LENGTH(kd_aktiva) >1 ORDER BY kd_aktiva ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}


	function get_jml_akun($akun) {
			$this->db->select('SUM(debet) AS jum_debet, SUM(kredit) AS jum_kredit');
			$this->db->from('v_transaction');
			$this->db->where('transaksi', $akun);

		// 	if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
		// 	$tgl_dari = $_REQUEST['tgl_dari'];
		// 	$tgl_samp = $_REQUEST['tgl_samp'];
		// } else {
		// 	$tgl_dari = date('Y') . '-01-01';
		// 	$tgl_samp = date('Y') . '-12-31';
		// }
		// $this->db->where('DATE(tgl) >= ', ''.$tgl_dari.'');
		// $this->db->where('DATE(tgl) <= ', ''.$tgl_samp.'');

		$query = $this->db->get();
		return $query->row();
	}
}