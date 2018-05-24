<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class P_payments extends MY_Controller {

    function __construct() {
        parent::__construct();

        $this->load->model('purchase/Purchase_Payments_model');

        $this->load->model('purchase/Purchase_Invoices_model');
    }

    function index() {

         // $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Vendors_model->get_dropdown_list(array("name"));


        $this->template->rander("payments/index");
    }



    function add_receipt(){
        $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Vendors_model->get_dropdown_list(array("name"));

        $this->load->view("payments/add_receipt",$view_data);
    }

    function showTable($id){
            $view_data["id"] = $id;
            
            $view_data["query"] = $this->Purchase_Payments_model->getInvoicesCust($id)->result();
             $this->load->view("payments/item_modal_form",$view_data);   
    }

    /* load client add/edit modal */

    function modal_form() {
        //get custom fields

        $view_data['model_info'] = $this->Purchase_Payments_model->get_one($this->input->post('id'));
        $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        
        $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Vendors_model->get_dropdown_list(array("name"));

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
       

        $view_data['model_info'] = $this->Purchase_Payments_model->get_details($options)->row();
         $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Vendors_model->get_dropdown_list(array("name"));

        

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
        $view_data['bank_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->getKas();
       
        $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        $view_data['model_info_total'] = $this->Purchase_Payments_model->getInvoicesTotal($id)->row();


        $view_data['model_info'] = $this->Purchase_Invoices_model->get_details($options)->row();
         $view_data['clients_dropdown'] = array("" => "-") + $this->Master_Vendors_model->get_dropdown_list(array("name"));

        

        $this->load->view('payments/modal_form_pay', $view_data);
    }

    function pay_save(){
        validate_submitted_data(array(
            "voucher" => "required",

            "fid_cust" => "required",
           "fid_inv" => "required"
             
        ));

        $data = array(
            "code" => $this->input->post('voucher'),
            "fid_cust" => $this->input->post('fid_cust'),
            "fid_inv" => $this->input->post('fid_inv'),
            "paid" => "PAID",
            "pay_date" => $this->input->post('pay_date'),
            "fid_bank" => $this->input->post('fid_bank'),
            "currency" => $this->input->post('currency'),
            "fid_tax" => $this->input->post('fid_tax'),
            "amount" => $this->input->post('total'),
            "memo" => $this->input->post('memo'),
            "created_at" => get_current_utc_time()
        );

        

        $save_id = $this->Purchase_Payments_model->save($data);
        if ($save_id) {
            $status_data = array("paid" => "Paid", "status" => "paid");
            if ($this->Purchase_Invoices_model->save($status_data, $this->input->post('fid_inv'))) {
                echo json_encode(array('success' => true, 'message' => lang("invoice_sent_message"), "id" => $save_id));
            }
            
            
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
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

        

        $save_id = $this->Purchase_Payments_model->save($data);
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

        // if(count($this->input->post('inv')) > 0){
        //     foreach($this->input->post('inv') as $key => $value ){
        //         $inv[] = $value; 
        //     }
        // }
        // // echo $add['inv'] = implode(",", $inv);

        // if($this->input->post()){
        //     $data = array();
        //     $id = $this->input->post('inv');
        //     if($id){
        //         foreach ($id as $key => $value) {
        //             $table = array(
        //                 "id" => $value
        //             );
        //             $data[] = implode(",", $table);
        //         }
        //     }
        //     // print_r($data);
        //     // exit();

        // }

            
        
        

        $save_id = $this->Purchase_Payments_model->save($data);
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
            if ($this->Purchase_Payments_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Purchase_Payments_model->delete($id)) {
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


        $save_id = $this->Purchase_Payments_model->save($data, $customers_id);
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
            if ($this->Purchase_Payments_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Purchase_Payments_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of clients, prepared for datatable  */

    function list_data() {

        $list_data = $this->Purchase_Payments_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }
    function list_data_receipt($id) {

        $list_data = $this->Purchase_Payments_model->getInvoicesCust($id)->result();
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
        $data = $this->Purchase_Payments_model->get_details($id)->row();
        return $this->_make_row($data);
    }

    private function _row_data_inv($id) {
        $options = array(
            "id" => $id
        );
        $data = $this->Purchase_Payments_model->get_details($id)->row();
        return $this->_make_row_inv($data);
    }

    /* prepare a row of client list table */

    private function _make_row($data) {
        $options = array(
            "id" => $data->fid_cust
        );

        $query = $this->Master_Vendors_model->get_details($options)->row();
        // $value = $this->Purchase_Payments_model->get_payments_total_summary($data->id);
        $row_data = array(
            anchor(get_uri("purchase/p_payments/view/" . $data->id), "#".$data->code),
            // $data->fid_inv,
            $query->name." - ".$query->company_name,
            $data->paid,
            // $data->fid_bank,
            format_to_date($data->pay_date),
            $data->memo,
            $data->currency,
            to_currency($data->amount)
            // anchor(get_uri("purchase/s_payments/view/" . $data->id), "#".$data->code),
            // modal_anchor(get_uri("master/customers/view/" . $data->fid_cust), $query->name, array("class" => "view", "title" => "Customers ".$query->name, "data-post-id" => $data->fid_cust)),
            // // $this->_get_payments_status_label($data),
            
            // // $data->email_to,
            // format_to_date($data->pay_date, false)
            // $data->currency,
            // to_currency($value->invoice_subtotal)

        );


        $row_data[] = anchor(get_uri("purchase/p_payments/nota/").$data->id, "<i class='fa fa-print'></i>", array("class" => "view", "title" => lang('view'), "data-post-id" => $data->id)).modal_anchor(get_uri("purchase/p_payments/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_client'), "data-post-id" => $data->id));
                

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


        $row_data[] = modal_anchor(get_uri("purchase/p_payments/modal_form_pay"), "<i class='fa fa-money'></i>", array("class" => "edit", "title" => "Pay", "data-post-id" => $data->id));

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
        $invoice_status = "<span class='label $invoice_status_class large'>" . $status . "</span>";
        if ($return_html) {
            return $invoice_status;
        } else {
            return $status;
        }
    }
    


    /* add or edit an invoice item */

    /* list of invoice items, prepared for datatable  */

   

    /* prepare a row of invoice item list table */

    // private function _make_item_row($data) {
    //     $item = "<b>$data->title</b>";
    //     if ($data->description) {
    //         $item.="<br /><span>" . nl2br($data->description) . "</span>";
    //     }
    //     $type = $data->unit_type ? $data->unit_type : "";

    //     return array(
    //         $item,
    //         to_decimal_format($data->quantity) . " " . $type,
    //         to_currency($data->rate),
    //         to_currency($data->total),
    //         modal_anchor(get_uri("purchase/payments/item_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_invoice'), "data-post-id" => $data->id))
    //         . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("purchase/payments/delete_item"), "data-action" => "delete"))
    //     );
    // }

    // function get_item_suggestion() {
    //     $key = $this->input->get('q');
    //     $suggestion = array();

    //     $items = $this->Sales_PaymentsItems_model->get_item_suggestion($key);

    //     foreach ($items as $item) {
    //         $suggestion[] = array("id" => $item->title, "text" => $item->title, "price" => $item->price , "category" => $item->category,"unit_type" => $item->unit_type);
    //     }

    //     $suggestion[] = array("id" => "+", "text" => "+ " . lang("create_new_item"));

    //     echo json_encode($suggestion);
    // }

    // function get_item_info_suggestion() {
    //     $item = $this->Sales_PaymentsItems_model->get_item_info_suggestion($this->input->post("item_name"));
    //     if ($item) {
    //         echo json_encode(array("success" => true, "item_info" => $item));
    //     } else {
    //         echo json_encode(array("success" => false));
    //     }
    // }

    // private function _get_invoice_total_view($invoice_id = 0) {
    //     $view_data["invoice_total_summary"] = $this->Purchase_Payments_model->get_payments_total_summary($invoice_id);
    //     return $this->load->view('payments/payments_total_section', $view_data, true);
    // }

    // function get_invoice_status_bar($invoice_id = 0) {

    //     $view_data["invoice_info"] = $this->Purchase_Payments_model->get_details(array("id" => $invoice_id))->row();
    //     $view_data["client_info"] = $this->Master_Vendors_model->get_details(array("id" => $view_data["invoice_info"]->fid_cust))->row();
    //     $view_data['invoice_status_label'] = $this->_get_payments_status_label($view_data["invoice_info"]);
    //     $this->load->view('payments/payments_status_bar', $view_data);
    // }

    //  function preview($invoice_id = 0, $show_close_preview = false) {




    //     if ($invoice_id) {
    //         $view_data = get_payments_making_data($invoice_id);


    //         $view_data['invoice_preview'] = prepare_payments_pdf($view_data, "html");

    //         //show a back button
    //         $view_data['show_close_preview'] = true;

    //         $view_data['invoice_id'] = $invoice_id;
    //         $view_data['payment_methods'] = "";

    //         $view_data['invoice_status_label'] = $this->_get_payments_status_label($view_data["invoice_info"]);

    //         $this->template->rander("payments/payments_preview", $view_data);
    //     } else {
    //         show_404();
    //     }
    // }

    // function download_pdf($invoice_id = 0) {

    //     if ($invoice_id) {
    //         $invoice_data = get_payments_making_data($invoice_id);
    //         // $this->_check_invoice_access_permission($invoice_data);

    //         prepare_payments_pdf($invoice_data, "download");
    //     } else {
    //         show_404();
    //     }
    // }


    // function send_payments_modal_form($invoice_id) {


    //     if ($invoice_id) {
    //         $options = array("id" => $invoice_id);
    //         $invoice_info = $this->Purchase_Payments_model->get_details($options)->row();
    //         $view_data['invoice_info'] = $invoice_info;
    //         $contacts_options = array("id" => $invoice_info->fid_cust);
    //         $contacts = $this->Master_Vendors_model->get_details($contacts_options)->result();
    //         $contact_first_name = "";
    //         $contact_last_name = "";
    //         $contacts_dropdown = array();
    //         foreach ($contacts as $contact) {
    //             $contacts_dropdown[$contact->id] = $contact->name. " (" . lang("primary_contact") . ")";
                
    //         }


    //         $view_data['contacts_dropdown'] = $contacts_dropdown;

    //         $email_template = $this->Email_templates_model->get_final_template("send_invoice");

    //         $invoice_total_summary = $this->Purchase_Payments_model->get_payments_total_summary($invoice_id);

    //         $parser_data["INVOICE_ID"] = $invoice_info->id;
    //         $parser_data["CONTACT_FIRST_NAME"] = $contact->name;
    //         // $parser_data["CONTACT_LAST_NAME"] = $contact_last_name;
    //         $parser_data["BALANCE_DUE"] = to_currency($invoice_total_summary->balance_due, $invoice_total_summary->currency_symbol);
    //         $parser_data["DUE_DATE"] = $invoice_info->exp_date;
    //         $parser_data["PROJECT_TITLE"] = $invoice_info->code;
    //         $parser_data["INVOICE_URL"] = get_uri("invoices/preview/" . $invoice_info->id);
    //         $parser_data['SIGNATURE'] = $email_template->signature;

    //         $view_data['message'] = $this->parser->parse_string($email_template->message, $parser_data, TRUE);
    //         $view_data['subject'] = $email_template->subject;

    //         $this->load->view('payments/send_payments_modal_form', $view_data);
    //     } else {
    //         show_404();
    //     }
    // }

    // function send_payments() {

    //     validate_submitted_data(array(
    //         "id" => "required|numeric"
    //     ));

    //     $invoice_id = $this->input->post('id');

    //     $contact_id = $this->input->post('contact_id');
    //     $cc = $this->input->post('invoice_cc');

    //     $custom_bcc = $this->input->post('invoice_bcc');
    //     $subject = $this->input->post('subject');
    //     $message = decode_ajax_post_data($this->input->post('message'));

    //     $contact = $this->Master_Vendors_model->get_one($contact_id);

    //     $invoice_data = get_payments_making_data($invoice_id);
    //     $attachement_url = prepare_payments_pdf($invoice_data, "send_email");

    //     $default_bcc = get_setting('send_bcc_to'); //get default settings
    //     $bcc_emails = "";

    //     if ($default_bcc && $custom_bcc) {
    //         $bcc_emails = $default_bcc . "," . $custom_bcc;
    //     } else if ($default_bcc) {
    //         $bcc_emails = $default_bcc;
    //     } else if ($custom_bcc) {
    //         $bcc_emails = $custom_bcc;
    //     }

    //     if (send_app_mail($contact->email, $subject, $message, array("attachments" => array(array("file_path" => $attachement_url)), "cc" => $cc, "bcc" => $bcc_emails))) {
    //         // change email status
    //         $status_data = array("status" => "sent", "last_email_sent_date" => get_my_local_time());
    //         if ($this->Purchase_Payments_model->save($status_data, $invoice_id)) {
    //             echo json_encode(array('success' => true, 'message' => lang("invoice_sent_message"), "invoice_id" => $invoice_id));
    //         }
    //         // delete the temp invoice
    //         if (file_exists($attachement_url)) {
    //             unlink($attachement_url);
    //         }
    //     } else {
    //         echo json_encode(array('success' => false, 'message' => lang('error_occurred')));
    //     }
    // }


}

/* End of file clients.php */
/* Location: ./application/controllers/clients.php */