<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Profitloss_model extends CI_Model {


	

	function get_data_akun_dapat() {
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Pendapatan' AND parent IS NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}

	}


	function get_debet_total($start_date,$end_date) {
		$query = $this->db->query("SELECT sum(debet+credit) as jumlah from transaction_journal a LEFT JOIN acc_coa_type b on a.fid_coa=b.id WHERE a.`deleted` = 0 AND fid_coa in(SELECT id FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type in ('Pendapatan','Pendapatan Lain-lain') AND parent IS NULL ORDER BY account_number ASC) AND (date>='".$start_date."' AND date<='".$end_date."')")->row();
		return $query;

	}

	function get_kredit_total($start_date,$end_date) {
		$query = $this->db->query("SELECT sum(debet+credit) as jumlah from transaction_journal a LEFT JOIN acc_coa_type b on a.fid_coa=b.id WHERE a.`deleted` = 0 AND fid_coa in(SELECT id FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type in ('Harga Pokok Penjualan','Beban Penjualan','Beban Administrasi Umum','Beban Lain-lain') AND parent IS NULL ORDER BY account_number ASC) AND (date>='".$start_date."' AND date<='".$end_date."')")->row();
		return $query;

	}

	function getBebanPokokPenjualan_total($date) {
		$query = $this->db->query("SELECT sum(debet+credit) as jumlah FROM `acc_coa_type` WHERE `deleted` = 0 AND account_type = 'Harga Pokok Penjualan' AND parent IS NULL ORDER BY account_number ASC")->row();
		return $query;

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

	function get_data_akun_biaya() {
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND `account_type` in('Beban Penjualan','Beban Administrasi Umum') AND parent is NULL ORDER BY account_number ASC");
		if($query->num_rows() > 0) {
			$out = $query->result();
			return $out;
		} else {
			return array();
		}
	}

	function get_data_akun_biaya_other() {
		$query = $this->db->query("SELECT * FROM `acc_coa_type` WHERE `deleted` = 0 AND `account_type` = 'Beban Lain-lain' AND parent is NULL ORDER BY account_number ASC");
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

		public function get_child($parent)
		{
		    $query = $this->db->query("select * from acc_coa_type where parental = '$parent' or id='$parent' AND deleted=0");

		    $result = $query->result();

		    $roles = array();       

		    foreach($result as $key => $val) {

		        if($result[$key]->parental == $parent) {
		            $role = array();

		            $role['id'] = $result[$key]->id;

		            $children = $this->get_child($result[$key]->id);

		            if( !empty($children) ) {                   

		            	foreach ($children as $w) {
		            	$roles[] = array('id'=>$w['id']);
		            	}
		                
		            }
		            $roles[] = $role;
		        }
		    }
		    //print_r($roles);

		    return $roles;

		}	
	function get_jml_akun($akun,$start,$end) {
			

			$this->db->select('SUM(debet) AS jum_debet, SUM(credit) AS jum_kredit');
			$this->db->from('transaction_journal');
			

		// 	if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
		// 	$tgl_dari = $_REQUEST['tgl_dari'];
		// 	$tgl_samp = $_REQUEST['tgl_samp'];
		// } else {
		// 	$tgl_dari = date('Y') . '-01-01';
		// 	$tgl_samp = date('Y') . '-12-31';
		// }
		$this->db->where('DATE(date) >= ', ''.$start.'');
		$this->db->where('DATE(date) <= ', ''.$end.'');
		$this->db->where('deleted ', '0');

		$query = $this->db->get();
		return $query->row();
	}


	function get_jml_akun_month($akun,$month,$year,$project=false,$akun_number=false) {
		$start=$year.'-'.$month.'-01';
		$end=$year.'-'.$month.'-31';

			$total_akun=array();
			$total_akun[]=$akun;
			$get_akun=$this->get_child($akun);

			//print_r($get_akun);exit();

			foreach ($get_akun as $rw) {
				$total_akun[]=$rw['id'];
				
			}
			


			$this->db->select('SUM(debet) AS jum_debet, SUM(credit) AS jum_kredit');
			$this->db->from('transaction_journal');
			$this->db->join('acc_coa_type','transaction_journal.fid_coa=acc_coa_type.id');
			$this->db->where('DATE(date) >= ', ''.$start.'');
			$this->db->where('DATE(date) <= ', ''.$end.'');
			$this->db->where('transaction_journal.deleted ', '0');
			$this->db->where_in('fid_coa', $total_akun);
			if($project!=false){
				$this->db->where('project_id ', ''.$project.'');
			}
			//$this->db->or_where('parental', $akun);
			//$this->db->where('fid_coa', $akun)

		// 	if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
		// 	$tgl_dari = $_REQUEST['tgl_dari'];
		// 	$tgl_samp = $_REQUEST['tgl_samp'];
		// } else {
		// 	$tgl_dari = date('Y') . '-01-01';
		// 	$tgl_samp = date('Y') . '-12-31';
		// }
		

		$query = $this->db->get();
		return $query->row();
	}
}