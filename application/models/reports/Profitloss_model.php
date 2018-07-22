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

	function getMonthlyBack(){

		$query = $this->db->query("SELECT coa_sales ,acc_coa_type.account_name as akun,
									SUM(IF(MONTH(inv_date) = 1, amount, 0)) AS jan,
									SUM(IF(MONTH(inv_date) = 2, amount, 0)) AS feb,
									SUM(IF(MONTH(inv_date) = 3, amount, 0)) AS mar,
									SUM(IF(MONTH(inv_date) = 4, amount, 0)) AS apr,
									SUM(IF(MONTH(inv_date) = 5, amount, 0)) AS may,
									SUM(IF(MONTH(inv_date) = 6, amount, 0)) AS jun,
									SUM(IF(MONTH(inv_date) = 7, amount, 0)) AS jul,
									SUM(IF(MONTH(inv_date) = 8, amount, 0)) AS aug,
									SUM(IF(MONTH(inv_date) = 8, amount, 0)) AS sep,
									SUM(IF(MONTH(inv_date) = 8, amount, 0)) AS oct,
									SUM(IF(MONTH(inv_date) = 8, amount, 0)) AS nov,
									SUM(IF(MONTH(inv_date) = 8, amount, 0)) AS 'dec',
									SUM(amount) AS total
									FROM sales_invoices JOIN acc_coa_type ON acc_coa_type.id = sales_invoices.coa_sales
									GROUP BY coa_sales;");

		return $query;
	}

	function getMonthly($account_number = array()){
		$query = $this->db->query("SELECT
								acc_coa_type.id,
								acc_coa_type.account_number,
								acc_coa_type.account_name as akun,
								acc_coa_type.parent,
								acc_coa_type.parental,
								SUM( IF ( MONTH ( date ) = 1, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS jan, 
								SUM( IF ( MONTH ( date ) = 2, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS feb,
								SUM( IF ( MONTH ( date ) = 3, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS mar,
								SUM( IF ( MONTH ( date ) = 4, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS apr,
								SUM( IF ( MONTH ( date ) = 5, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS may,
								SUM( IF ( MONTH ( date ) = 6, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS jun,
								SUM( IF ( MONTH ( date ) = 7, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS jul,
								SUM( IF ( MONTH ( date ) = 8, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS aug,
								SUM( IF ( MONTH ( date ) = 9, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS sep,
								SUM( IF ( MONTH ( date ) = 10, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS oct,
								SUM( IF ( MONTH ( date ) = 11, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS nov,
								SUM( IF ( MONTH ( date ) = 12, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS 'dec',
								SUM(transaction_journal.debet + transaction_journal.credit) as total
							FROM
								acc_coa_type
								LEFT JOIN transaction_journal ON acc_coa_type.id = transaction_journal.fid_coa 
							WHERE
								acc_coa_type.reporting = 'Laba Rugi'  AND acc_coa_type.deleted = 0
								GROUP BY acc_coa_type.account_number ORDER BY acc_coa_type.account_number ASC");

		return $query;
	}
	function getMonthlyCoa($account_number){
		$query = $this->db->query("SELECT
								acc_coa_type.id,
								acc_coa_type.account_number,
								acc_coa_type.account_name as akun,
								acc_coa_type.parent,
								acc_coa_type.parental,
								SUM( IF ( MONTH ( date ) = 1, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS jan, 
								SUM( IF ( MONTH ( date ) = 2, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS feb,
								SUM( IF ( MONTH ( date ) = 3, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS mar,
								SUM( IF ( MONTH ( date ) = 4, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS apr,
								SUM( IF ( MONTH ( date ) = 5, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS may,
								SUM( IF ( MONTH ( date ) = 6, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS jun,
								SUM( IF ( MONTH ( date ) = 7, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS jul,
								SUM( IF ( MONTH ( date ) = 8, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS aug,
								SUM( IF ( MONTH ( date ) = 9, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS sep,
								SUM( IF ( MONTH ( date ) = 10, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS oct,
								SUM( IF ( MONTH ( date ) = 11, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS nov,
								SUM( IF ( MONTH ( date ) = 12, transaction_journal.debet + transaction_journal.credit, 0 ) ) AS 'dec',
								SUM(transaction_journal.debet + transaction_journal.credit) as total
							FROM
								acc_coa_type
								LEFT JOIN transaction_journal ON acc_coa_type.id = transaction_journal.fid_coa 
							WHERE
								acc_coa_type.reporting = 'Laba Rugi'  AND acc_coa_type.deleted = 0 AND acc_coa_type.account_number LIKE '$account_number%' GROUP BY acc_coa_type.account_number ORDER BY acc_coa_type.account_number ASC");

		return $query;
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