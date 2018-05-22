<?php

class Vendor_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'master_vendor';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        $data = $this->db->query("SELECT * FROM master_vendor WHERE  deleted = 0  ".$where." ORDER BY id DESC");
        return $data;
    }

    // function get_details($options = array()) {
    //     $clients_table = $this->db->dbprefix('clients');
    //     $projects_table = $this->db->dbprefix('projects');
    //     $users_table = $this->db->dbprefix('users');
    //     $invoices_table = $this->db->dbprefix('invoices');
    //     $invoice_payments_table = $this->db->dbprefix('invoice_payments');
    //     $invoice_items_table = $this->db->dbprefix('invoice_items');
    //     $taxes_table = $this->db->dbprefix('taxes');

    //     $where = "";
    //     $id = get_array_value($options, "id");
    //     if ($id) {
    //         $where = " AND $clients_table.id=$id";
    //     }
        
        
    //     //prepare custom fild binding query
    //     $custom_fields = get_array_value($options, "custom_fields");
    //     $custom_field_query_info = $this->prepare_custom_field_query_string("clients", $custom_fields, $clients_table);
    //     $select_custom_fieds = get_array_value($custom_field_query_info, "select_string");
    //     $join_custom_fieds = get_array_value($custom_field_query_info, "join_string");

        
        
    //     $this->db->query('SET SQL_BIG_SELECTS=1'); 
        
    //     $sql = "SELECT $clients_table.*, contacts_table.primary_contact, contacts_table.primary_contact_id,  project_table.total_projects, IFNULL(invoice_details.invoice_value,0) AS invoice_value, IFNULL(invoice_details.payment_received,0) AS payment_received $select_custom_fieds
    //     FROM $clients_table
    //     LEFT JOIN (SELECT $users_table.client_id, $users_table.id AS primary_contact_id, CONCAT($users_table.first_name, ' ', $users_table.last_name) AS primary_contact FROM $users_table WHERE $users_table.deleted=0 AND $users_table.is_primary_contact=1 GROUP BY $users_table.client_id, primary_contact_id) AS contacts_table ON contacts_table.client_id= $clients_table.id
    //     LEFT JOIN (SELECT client_id, COUNT(id) AS total_projects FROM $projects_table WHERE deleted=0 GROUP BY client_id) AS project_table ON project_table.client_id= $clients_table.id
    //     LEFT JOIN (SELECT client_id, SUM(payments_table.payment_received) as payment_received, SUM(items_table.invoice_value + IFNULL(items_table.invoice_value*tax_table.percentage/100,0) + IFNULL(items_table.invoice_value*tax_table2.percentage/100,0)) as invoice_value FROM $invoices_table
    //                LEFT JOIN (SELECT $taxes_table.* FROM $taxes_table) AS tax_table ON tax_table.id = $invoices_table.tax_id
    //                LEFT JOIN (SELECT $taxes_table.* FROM $taxes_table) AS tax_table2 ON tax_table2.id = $invoices_table.tax_id2 
    //                LEFT JOIN (SELECT invoice_id, SUM(amount) AS payment_received FROM $invoice_payments_table WHERE deleted=0 GROUP BY invoice_id) AS payments_table ON payments_table.invoice_id=$invoices_table.id AND $invoices_table.deleted=0 AND $invoices_table.status='not_paid'
    //                LEFT JOIN (SELECT invoice_id, SUM(total) AS invoice_value FROM $invoice_items_table WHERE deleted=0 GROUP BY invoice_id) AS items_table ON items_table.invoice_id=$invoices_table.id AND $invoices_table.deleted=0 AND $invoices_table.status='not_paid'
    //                GROUP BY $invoices_table.client_id    
    //                ) AS invoice_details ON invoice_details.client_id= $clients_table.id
    //     $join_custom_fieds               
    //     WHERE $clients_table.deleted=0 $where";
    //     return $this->db->query($sql);
    // }


}
