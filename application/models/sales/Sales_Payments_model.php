<?php

class Sales_Payments_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'sales_payments';
        parent::__construct($this->table);
    }


    function get_details($options = array()){
        $id = get_array_value($options, "id");
        $where = "";
        if ($id) {
            $where = " AND id=$id";
        }
        $data = $this->db->query("SELECT * FROM $this->table WHERE  deleted = 0  ".$where." ORDER BY id DESC");
        return $data;
    }

    function getInvoicesCust($id){
        $data = $this->db->query("SELECT
                                b.*,
                                a.total,
                                c.percentage,
                                SUM(a.total + ( a.total * ( c.percentage / 100 ) ) ) AS sub_total 
                            FROM
                                sales_invoices_items a,
                                sales_invoices b,
                                taxes c 
                            WHERE
                                a.fid_invoices = b.id 
                                AND b.fid_tax = c.id
                                AND b.fid_cust = $id AND b.paid in('Not Paid','CREDIT') AND b.status = 'posting' AND a.deleted = 0 AND b.deleted = 0 GROUP BY b.id DESC");
        return $data;
    }

    function getInvoicesTotal($id){
        $data = $this->db->query("SELECT 
                                SUM(a.total + ( a.total * ( c.percentage / 100 ) ) ) AS invoice_subtotal 
                            FROM
                                sales_invoices_items a,
                                sales_invoices b,
                                taxes c 
                            WHERE
                                a.fid_invoices = $id 
                                AND b.fid_tax = c.id
                                AND b.paid in('Not Paid','CREDIT') AND b.status = 'posting' AND a.deleted = 0 AND b.deleted = 0 GROUP BY b.id DESC");
        return $data;
    }

    function get_total_invoices($invoice_id){

        $invoice_items_table = $this->db->dbprefix('sales_invoices_items');
        $invoices_table = $this->db->dbprefix('sales_invoices');
        $data = $this->db->query("SELECT
                                            SUM( $invoice_items_table.total ) AS invoice_subtotal 
                                        FROM
                                            $invoice_items_table
                                            LEFT JOIN $invoices_table ON $invoices_table.id = $invoice_items_table.fid_invoices 
                                        WHERE
                                            $invoice_items_table.deleted = 0 
                                            AND $invoice_items_table.fid_invoices = $invoice_id
                                            AND $invoices_table.deleted =0 ");
        return $data;
    } 

    // function get_order_total_summary($invoice_id = 0) {
    //     $invoice_items_table = $this->db->dbprefix('sales_order_items');
    //     $invoices_table = $this->db->dbprefix('sales_order');
    //     $clients_table = $this->db->dbprefix('master_customers');
    //     $taxes_table = $this->db->dbprefix('taxes');

    //     $item_sql = "SELECT SUM($invoice_items_table.total) AS invoice_subtotal
    //     FROM $invoice_items_table
    //     LEFT JOIN $invoices_table ON $invoices_table.id= $invoice_items_table.fid_order    
    //     WHERE $invoice_items_table.deleted=0 AND $invoice_items_table.fid_order=$invoice_id AND $invoices_table.deleted=0";
    //     $item = $this->db->query($item_sql)->row();


    //     $invoice_sql = "SELECT $invoices_table.*, tax_table.percentage AS tax_percentage, tax_table.title AS tax_name
    //     FROM $invoices_table
    //     LEFT JOIN (SELECT $taxes_table.* FROM $taxes_table) AS tax_table ON tax_table.id = $invoices_table.fid_tax
    //     WHERE $invoices_table.deleted=0 AND $invoices_table.id=$invoice_id";

    //     $invoice = $this->db->query($invoice_sql)->row();


    //     $result = new stdClass();

    //     $result->invoice_subtotal = $item->invoice_subtotal;
    //     $result->tax_percentage = $invoice->tax_percentage;
    //     $result->tax_name = $invoice->tax_name;
    //     $result->tax = 0;
    //     if ($invoice->tax_percentage) {
            // $result->tax = $result->invoice_subtotal * ($invoice->tax_percentage / 100);
    //     }
        
    //     $result->invoice_total = $item->invoice_subtotal + $result->tax;

    //     $result->grand_total = $item->invoice_subtotal + $result->tax;
    //     // $result->total_paid = $payment->total_paid;

    //     $result->balance_due = number_format($result->invoice_total, 2, ".", "") ;


    //     $result->currency_symbol = get_setting("currency_symbol");
    //     $result->currency =  get_setting("default_currency");
    //     return $result;
    // }

    // function get_order_value($invoice_id = 0){

    //     $query = $this->db->query("SELECT
    //                                         SUM( $invoice_items_table.total ) AS invoice_subtotal 
    //                                     FROM
    //                                         $invoice_items_table
    //                                         LEFT JOIN $invoices_table ON $invoices_table.id = $invoice_items_table.fid_order 
    //                                     WHERE
    //                                         $invoice_items_table.deleted = 0 
    //                                         AND $invoice_items_table.fid_order = $invoice_id
    //                                         AND i$nvoices_table.deleted =0 ");

    //     return $query;
    // }


}
