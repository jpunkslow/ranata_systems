<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Accounting_model extends CI_Model {


	function getJenisKas() {
		$this->db->select('*');
		$this->db->from('acc_coa_type');
		$this->db->order_by('account_number', 'ASC');
		$query = $this->db->get();
		if($query->num_rows()>0){
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	function getAkun() {
		$sql = "SELECT * FROM acc_coa WHERE aktif = 'Y' ";
		$query = $this->db->query($sql);
		if($query->num_rows()>0){
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}



	//menghitung jumlah simpanan
	function get_jml_debet($jenis) {
		$this->db->select('SUM(debet) AS jml_total');
		$this->db->from('v_transaction');
		$this->db->where('untuk_kas', $jenis);

		// if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
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

	//menghitung jumlah penarikan
	function get_jml_kredit($jenis) {
		$this->db->select('SUM(kredit) AS jml_total');
		$this->db->from('v_transaction');
		$this->db->where('dari_kas', $jenis);

		// if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
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

	//panggil data jenis kas untuk laporan
	function lap_jenis_kas() {
		$this->db->select('*');
		$this->db->from('acc_nama_kas_tbl');
		$this->db->where('aktif','Y');
		$query = $this->db->get();

		if($query->num_rows()>0){
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	//panggil data akun


	function get_jml_akun($akun) {
		$this->db->select('SUM(debet) AS jum_debet, SUM(kredit) AS jum_kredit');
		$this->db->from('v_transaction');
		$this->db->where('transaksi', $akun);

		// if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
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



	function getCoaHead(){
		$data = $this->db->query("SELECT * FROM acc_coa_type WHERE deleted = 0 order by account_number ASC");
		return $data;
	}

	function getDebetKas($id,$start,$end){
		$data = $this->db->query("SELECT SUM(debet) as debet FROM transaction_journal WHERE  fid_coa = $id AND date >= '$start' AND date <= '$end' AND deleted = 0")->row();		
		return $data;
	}

	function getCreditKas($id,$start,$end){
		$data = $this->db->query("SELECT SUM(credit) as credit FROM transaction_journal WHERE  fid_coa = $id AND date >= '$start' AND date <= '$end' AND deleted = 0")->row();
		return $data;		
	}
}