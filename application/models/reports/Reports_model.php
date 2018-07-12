<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reports_model extends CI_Model {



	function getAgingReceivable(){

		$query = $this->db->query('SELECT
									a.id,
									a.fid_cust,
									a.inv_date,
									a.currency,
									a.code,
									b.name,
									b.code as code_name,
									b.termin,
									a.amount,
									a.residual,
									DATEDIFF( CURDATE(), a.inv_date) AS jumlah 
								FROM
									sales_invoices a
									JOIN master_customers b ON a.fid_cust = b.id 
								WHERE
									a.status = "posting" 
									AND a.paid IN("Not Paid", "Credit") 
									AND a.deleted = 0 
									AND a.inv_date <= CURDATE() 
								GROUP BY
									a.code')->result();

		return $query;
	}


	function getNeracaMonthly(){
		$query = $this->db->query("SELECT
								id,
								account_name,
								parent,
								parental,
								( SELECT SUM( IF ( MONTH ( date ) = 1, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS jan_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 1, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS jan_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 2, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS feb_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 2, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS feb_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 3, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS mar_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 3, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS mar_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 4, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS apr_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 4, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS apr_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 5, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS may_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 5, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS may_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 6, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS jun_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 6, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS jun_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 7, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS jul_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 7, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS jul_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 8, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS aug_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 8, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS aug_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 9, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS sep_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 9, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS sep_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 10, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS oct_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 10, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS oct_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 11, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS nov_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 11, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS nov_cre,
								( SELECT SUM( IF ( MONTH ( date ) = 12, debet, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS dec_deb,
								( SELECT SUM( IF ( MONTH ( date ) = 12, credit, 0 ) ) FROM transaction_journal WHERE fid_coa = a.id ) AS dec_cre 
							FROM
								acc_coa_type a 
							WHERE
								a.deleted = 0 AND a.reporting = 'Neraca'
							ORDER BY
								a.account_number ASC")->result();

		return $query;
	}



}