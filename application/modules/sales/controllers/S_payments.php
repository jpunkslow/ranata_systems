<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class S_payments extends MY_Controller {

    function __construct() {
        parent::__construct();

        $this->load->model('sales/Sales_Payments_model');

        $this->load->model('sales/Sales_Invoices_model');
        $this->load->model('sales/Sales_Order_model');
        $this->load->model('sales/Sales_InvoicesItems_model');
    }

    function index() {

         // $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Customers_model->get_dropdown_list(array("name"));


        $this->template->rander("payments/index");
    }



    function add_receipt(){
        $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Customers_model->get_dropdown_list(array("code","name"));

        $this->load->view("payments/add_receipt",$view_data);
    }

    function showTable($id){
            $view_data["id"] = $id;
            
            $view_data["query"] = $this->Sales_Payments_model->getInvoicesCust($id)->result();
             $this->load->view("payments/item_modal_form",$view_data);   
    }

    /* load client add/edit modal */

    function modal_form() {
        //get custom fields

        $view_data['model_info'] = $this->Sales_Payments_model->get_one($this->input->post('id'));
        $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        
        $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Customers_model->get_dropdown_list(array("name"));

        $this->load->view('payments/modal_form',$view_data);
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );
         $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
       

        $view_data['model_info'] = $this->Sales_Payments_model->get_details($options)->row();
         $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Customers_model->get_dropdown_list(array("name"));

        

        $this->load->view('payments/modal_form_edit', $view_data);
    }

    function modal_form_pay() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );
        $view_data['bank_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getCashCoa();
       
        $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        $view_data['model_info_total'] = $this->Sales_Payments_model->getInvoicesTotal($id)->row();


        $view_data['model_info'] = $this->Sales_Invoices_model->get_details($options)->row();
         $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Customers_model->get_dropdown_list(array("code","name"));

        

        $this->load->view('payments/modal_form_pay', $view_data);
    }

    function pay_save(){
        validate_submitted_data(array(
            "voucher" => "required",

            "fid_cust" => "required",
           "fid_inv" => "required"
             
        ));
        $pay_type = $this->input->post('paid');

        $amount = $this->input->post('total');
        $residual = $this->input->post('residual');
        
        
        $code = $this->input->post('voucher');
        $fid_cust = $this->input->post('fid_cust');
        $fid_inv = $this->input->post('fid_inv');
        $paid = "PAID";
        $pay_date = $this->input->post('pay_date');
        $fid_bank = $this->input->post('fid_bank');
        $currency = $this->input->post('currency');
        $fid_tax = $this->input->post('fid_tax');
        $amount = $residual;
        $memo = $this->input->post('memo');
        $voucher_code = "";
        $type = "sales";

        $data = array(
            "code" => $code,
            "fid_cust" => $fid_cust,
            "fid_inv" => $fid_inv,
            "paid" => "PAID",
            "pay_date" => $pay_date,
            "fid_bank" => $fid_bank,
            "currency" => $currency,
            "fid_tax" => $fid_tax,
            "amount" => $amount,
            "memo" => $memo,
            "created_at" => get_current_utc_time()
        );
        $piutang = 12;
        if($currency == "IDR"){
            $piutang = 12;
        }
        if($currency == "USD"){
            $piutang = 13;
        }
        


        // $save_id = $this->Sales_Payments_model->save($data);
        
            // $status_data = array("paid" => "Paid", "status" => "paid");
            // if ($this->Sales_Invoices_model->save($status_data, $fid_inv)) {
                if($pay_type == "Not Paid"){
                     $this->_insertTransaction($code,$voucher_code,$pay_date,"sales",$memo,$fid_bank,$amount,0);
                    $this->_insertTransaction($code,$voucher_code,$pay_date,"sales",$memo,$piutang,0,$amount);


                    $data = array(
                            "code" => getMaxId("sales_payments","PAY"),
                            "fid_cust" => $fid_cust,
                            "fid_inv" => $fid_inv,
                            "paid" => "PAID",
                            "pay_date" => $pay_date,
                            "fid_bank" => $fid_bank,
                            "currency" => $currency,
                            "fid_tax" => $fid_tax,
                            "amount" => $amount,
                            "residu" => 0,
                            "memo" => $memo,
                            "created_at" => get_current_utc_time()
                        );

                        
                        $status_data = array("status" => "posting" ,"PAID" => "PAID", "residual" => 0,"amount" => $amount);
                        $this->Sales_Invoices_model->save($status_data, $fid_inv);

                        $save_id = $this->Sales_Payments_model->save($data);

                }
                if($pay_type == "CREDIT"){
                    
                    $sisa = $amount - $residual;

                    $uang_muka_penjualan = 29;
                    $penjualan_barang = 44;


                    // $kas = $this->_insertTransaction($code,$voucher_code,$date,$type,$memo,$curr,$residual,0);
                    // $lawan = $this->_insertTransaction($code,$voucher_code,$date,$type,$memo,44,0,$amount);
                    $this->_insertTransaction($code,$voucher_code,$pay_date,$type,$memo,$fid_bank,$residual,0);
                    $this->_insertTransaction($code,$voucher_code,$pay_date,$type,$memo,$uang_muka_penjualan,$sisa,0);
                    $this->_insertTransaction($code,$voucher_code,$pay_date,$type,$memo,$piutang,0,$residual);
                    $this->_insertTransaction($code,$voucher_code,$pay_type,$type,$memo,$penjualan_barang,0,$sisa);

                        $status_data = array("status" => "posting" ,"PAID" => "CREDIT", "residual" => 0);
                        $this->Sales_Invoices_model->save($status_data, $fid_inv);

                       $data = array(
                            "code" => getMaxId("sales_payments","PAY"),
                            "fid_cust" => $fid_cust,
                            "fid_inv" => $fid_inv,
                            "paid" => "PAID",
                            "pay_date" => $pay_date,
                            "fid_bank" => $fid_bank,
                            "currency" => $currency,
                            "fid_tax" => $fid_tax,
                            "amount" => $amount,
                            "residu" => 0,
                            "memo" => $memo,
                            "created_at" => get_current_utc_time()
                        );

                        

                        $save_id = $this->Sales_Payments_model->save($data);

                }
                if ($save_id) {
               
                echo json_encode(array('success' => true, 'message' => lang("invoice_sent_message"), "id" => $save_id));
            
            
            
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }


    private function _insertTransaction($code,$voucher_code,$date,$type,$description,$fid_coa,$debet,$credit){

        $kas = array(
                "journal_code" => $code,
                "voucher_code" => $voucher_code,
                "date" => $date,
                "type" => $type,
                "description" => $description,
                "fid_coa" => $fid_coa,
                "fid_header" => "",
                "debet" => $debet,
                "credit" => $credit,
                "username" => "admin"
            );

           $insert_kas = $this->db->insert("transaction_journal",$kas);

           return $insert_kas;

    }

    /* insert or update a client */

    function add() {
        validate_submitted_data(array(
            "code" => "required",
            "fid_cust" => "required"
        ));

        $data = array(
            "code" => $this->input->post('code'),
            "fid_cust" => $this->input->post('fid_cust'),
            "inv_address" => $this->input->post('inv_address'),
            "delivery_address" => $this->input->post('delivery_address'),
            "status" => 'draft',
            "email_to" => $this->input->post('email_to'),
            "exp_date" => $this->input->post('exp_date'),
            "currency" => $this->input->post('currency'),
            "fid_tax" => $this->input->post('fid_tax'),
            "created_at" => get_current_utc_time()
        );

        

        $save_id = $this->Sales_Payments_model->save($data);
        if ($save_id) {
            
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id ,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function add_payments() {
        // validate_submitted_data(array(
        //     "code" => "required",
        //     "fid_cust" => "required"
        // ));  

        // $inv = array();
        // $add['inv'] = "";
        $data = array(
            "code" => $this->input->post('code'),
            "fid_cust" => $this->input->post('fid_cust'),
            "pay_date" => $this->input->post('pay_date'),
            // "currency" => $this->input->post('currency'),
            // "amount" => $this->input->post('amount'),
            "created_at" => get_current_utc_time()
        );

      

            
        
        

        $save_id = $this->Sales_Payments_model->save($data);
        if ($save_id) {

            
            echo json_encode(array("success" => true, "data" => ($save_id), 'id' => $save_id ,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function payload(){
        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Sales_Payments_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Sales_Payments_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
        
    }

    function save() {
        $customers_id = $this->input->post('id');


        validate_submitted_data(array(
            "code" => "required",
            "fid_cust" => "required"
        ));

        $data = array(
            "code" => $this->input->post('code'),
            "fid_cust" => $this->input->post('fid_cust'),
            "inv_address" => $this->input->post('inv_address'),
            "delivery_address" => $this->input->post('delivery_address'),
            // "status" => $this->input->post('status'),
            "email_to" => $this->input->post('email_to'),
            "exp_date" => $this->input->post('exp_date'),
            "fid_tax" => $this->input->post('fid_tax'),
            "currency" => $this->input->post('currency')
        );


        $save_id = $this->Sales_Payments_model->save($data, $customers_id);
        if ($save_id) {


            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }


    /* delete or undo a client */

    function delete() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Sales_Payments_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Sales_Payments_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of clients, prepared for datatable  */

    function list_data() {

        $list_data = $this->Sales_Payments_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }
    function list_data_receipt($id) {

        $list_data = $this->Sales_Payments_model->getInvoicesCust($id)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row_inv($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of client list  table */

    private function _row_data($id) {
        $options = array(
            "id" => $id
        );
        $data = $this->Sales_Payments_model->get_details($id)->row();
        return $this->_make_row($data);
    }

    private function _row_data_inv($id) {
        $options = array(
            "id" => $id
        );
        $data = $this->Sales_Payments_model->get_details($id)->row();
        return $this->_make_row_inv($data);
    }

    /* prepare a row of client list table */

    private function _make_row($data) {
        $options = array(
            "id" => $data->fid_cust
        );

        $query = $this->Master_Customers_model->get_details($options)->row();
        $total = $data->amount + $data->residu;
        // $value = $this->Sales_Payments_model->get_payments_total_summary($data->id);
        $row_data = array(
            anchor(get_uri("sales/s_payments/prints/").$data->id."/".str_replace("/", "-", $data->code), $data->code),
            // $data->fid_inv,
            $query->code." - ".$query->name,
            $data->paid,
            // $data->fid_bank,
            format_to_date($data->pay_date),
            $data->memo,
            $data->currency,
            to_currency($data->amount),
            to_currency($data->residu),
            
            to_currency($total)
            // anchor(get_uri("sales/s_payments/view/" . $data->id), "#".$data->code),
            // modal_anchor(get_uri("master/customers/view/" . $data->fid_cust), $query->name, array("class" => "view", "title" => "Customers ".$query->name, "data-post-id" => $data->fid_cust)),
            // // $this->_get_payments_status_label($data),
            
            // // $data->email_to,
            // format_to_date($data->pay_date, false)
            // $data->currency,
            // to_currency($value->invoice_subtotal)

        );


        $row_data[] = anchor(get_uri("sales/s_payments/prints/").$data->id."/".str_replace("/", "-", $data->code), "<i class='fa fa-print'></i>", array("class" => "view", "title" => lang('view'), "data-post-id" => $data->id));
                

        return $row_data;
    }

     private function _make_row_inv($data) {
        $options = array(
            "id" => $data->fid_cust
        );

        $row_data = array(
        
            $data->code,
            $this->_get_payments_status_label($data),
            format_to_date($data->inv_date),
            to_currency($data->sub_total)
        );


        $row_data[] = modal_anchor(get_uri("sales/s_payments/modal_form_pay"), "<i class='fa fa-money'></i>", array("class" => "edit", "title" => "Pay", "data-post-id" => $data->id));

        return $row_data;
    }

    function view($id= 0){
        
        if ($id) {
            $view_data = get_payments_making_data($id);

            if ($view_data) {
                $view_data['invoice_status'] = $this->_get_payments_status_label($view_data["invoice_info"], true);
                
                $view_data['invoice_status_label'] = $this->_get_payments_status_label($view_data["invoice_info"]);

                $this->template->rander("payments/view", $view_data);
            } else {
                show_404();
            }
        }else{
            show_404();
        }
    }

     //prepare invoice status label 
     private function _get_payments_status_label($invoice_info, $return_html = true) {
        // return get_payments_status_label($data, $return_html);
        $invoice_status_class = "label-default";
        $status = "draft";
        $now = get_my_local_time("Y-m-d");
        if ($invoice_info->status == "draft" ) {
            $invoice_status_class = "label-warning";
            $status = "Draft";
        } else if ($invoice_info->status == "sent") {
            $invoice_status_class   = "label-success";
            $status = "Sudah Terkirim";

        }
        else if ($invoice_info->status == "paid") {
            $invoice_status_class   = "label-primary";
            $status = "Dibayar";

        }
        $invoice_status = "<span class='label $invoice_status_class large'>" . $status . "</span>";
        if ($return_html) {
            return $invoice_status;
        } else {
            return $status;
        }
    }
    
    function prints($invoice_id = 0, $show_close_preview = false) {




        if ($invoice_id) {
            $view_data = get_s_payment_making_data($invoice_id);


            $view_data['invoice_preview'] = prepare_s_payment_pdf($view_data, "html");

            //show a back button
            $view_data['show_close_preview'] = true;

            $view_data['invoice_id'] = $invoice_id;
            $view_data['payment_methods'] = "";

            $view_data['invoice_status_label'] = $this->_get_payments_status_label($view_data["invoice_info"]);

            $this->template->rander("payments/payment_preview", $view_data);
        } else {
            show_404();
        }
    }

    function download_pdf($invoice_id = 0) {

        if ($invoice_id) {
            $invoice_data = get_s_payment_making_data($invoice_id);
            // $this->_check_invoice_access_permission($invoice_data);

            prepare_s_payment_pdf($invoice_data, "download");
        } else {
            show_404();
        }
    }

}

/* End of file clients.php */
/* Location: ./application/controllers/clients.php */