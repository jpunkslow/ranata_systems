<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Request extends MY_Controller {

    function __construct() {
        parent::__construct();

        $this->load->model('purchase/Purchase_Request_model');
    }

    function index() {

        $this->template->rander("request/index");
    }

    /* load client add/edit modal */

    function modal_form() {
        //get custom fields

        $view_data['model_info'] = $this->Purchase_Request_model->get_one($this->input->post('id'));
        $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        
        $view_data['vendor_dropdown'] = array("" => "-") + $this->Master_Vendors_model->get_dropdown_list(array("name"));

        $this->load->view('request/modal_form',$view_data);
    }

    function modal_form_edit() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );

        $view_data['model_info'] = $this->Purchase_Request_model->get_details($options)->row();
         $view_data['vendor_dropdown'] = array("" => "-") + $this->Master_Vendors_model->get_dropdown_list(array("name"));

        

        $this->load->view('request/modal_form_edit', $view_data);
    }

    /* insert or update a client */

    function add() {
        validate_submitted_data(array(
            "code" => "required",
            "fid_vendor" => "required"
        ));

        $data = array(
            "code" => $this->input->post('code'),
            "fid_vendor" => $this->input->post('fid_vendor'),
            "inv_address" => $this->input->post('inv_address'),
            "delivery_address" => $this->input->post('delivery_address'),
            "status" => 'draft',
            "email_to" => $this->input->post('email_to'),
            // "exp_date" => "",
            "fid_tax" => $this->input->post('fid_tax'),

            "currency" => $this->input->post('currency'),
            "created_at" => get_current_utc_time()
        );

        

        $save_id = $this->Purchase_Request_model->save($data);
        if ($save_id) {
            
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id ,'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save() {
        $customers_id = $this->input->post('id');


        validate_submitted_data(array(
            "code" => "required",
            "fid_vendor" => "required"
        ));

        $data = array(
            "code" => $this->input->post('code'),
            "fid_vendor" => $this->input->post('fid_vendor'),
            "inv_address" => $this->input->post('inv_address'),
            "delivery_address" => $this->input->post('delivery_address'),
            // "status" => $this->input->post('status'),
            "email_to" => $this->input->post('email_to'),
            // "exp_date" => $this->input->post('exp_date'),
            "currency" => $this->input->post('currency')
        );


        $save_id = $this->Purchase_Request_model->save($data, $customers_id);
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
            if ($this->Purchase_Request_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Purchase_Request_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of clients, prepared for datatable  */

    function list_data() {

        $list_data = $this->Purchase_Request_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of client list  table */

    private function _row_data($id) {
        $options = array(
            "id" => $id
        );
        $data = $this->Purchase_Request_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of client list table */

    private function _make_row($data) {
        $options = array(
            "id" => $data->fid_vendor
        );

        $query = $this->Master_Vendors_model->get_details($options)->row();
        $value = $this->Purchase_Request_model->get_request_total_summary($data->id);
        
        $row_data = array(
        
            anchor(get_uri("purchase/request/view/" . $data->id), "#00".$data->id.$data->code),
            modal_anchor(get_uri("master/vendors/view/" . $data->fid_vendor), $query->name, array("class" => "view", "title" => "Customers ".$query->name, "data-post-id" => $data->fid_vendor)),
            $data->status,
            $data->email_to,
            // format_to_date($data->exp_date, false),
            $data->currency,
            to_currency($value->invoice_subtotal)

        );


        $row_data[] = anchor(get_uri("purchase/request/view/").$data->id, "<i class='fa fa-eye'></i>", array("class" => "view", "title" => lang('view'), "data-post-id" => $data->id)).modal_anchor(get_uri("purchase/request/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_client'), "data-post-id" => $data->id))
                . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_client'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("purchase/request/delete"), "data-action" => "delete"));

        return $row_data;
    }

    function view($id= 0){
        
        if ($id) {
            $view_data = get_request_making_data($id);

            if ($view_data) {
                $view_data['invoice_status_label'] = $this->_get_quotation_status_label($view_data["invoice_info"], true);

                $this->template->rander("request/view", $view_data);
            } else {
                show_404();
            }
        }else{
            show_404();
        }
    }

     //prepare invoice status label 
    private function _get_quotation_status_label($invoice_info, $return_html = true) {
        $invoice_status_class = "label-warning";
        $status = "draft";
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


    function item_modal_form() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));

        $invoice_id = $this->input->post('invoice_id');

        $view_data['model_info'] = $this->Purchase_RequestItems_model->get_one($this->input->post('id'));
        if (!$invoice_id) {
            $invoice_id = $view_data['model_info']->fid_quotation;
        }
        $view_data['request_id'] = $invoice_id;
        $this->load->view('request/item_modal_form', $view_data);
    }

    /* add or edit an invoice item */

    function save_item() {

        validate_submitted_data(array(
            "id" => "numeric",
            "request_id" => "required|numeric"
        ));

        $invoice_id = $this->input->post('request_id');

        $id = $this->input->post('id');
        $rate = unformat_currency($this->input->post('invoice_item_rate'));
        $quantity = unformat_currency($this->input->post('invoice_item_quantity'));

        $invoice_item_data = array(
            "fid_quotation" => $invoice_id,
            "title" => $this->input->post('invoice_item_title'),
            "description" => $this->input->post('description'),
            "category" => $this->input->post('category'),
            "quantity" => $quantity,
            "unit_type" => $this->input->post('unit_type'),
            "rate" => unformat_currency($this->input->post('invoice_item_rate')),
            "total" => $rate * $quantity,
        );

        $invoice_item_id = $this->Purchase_RequestItems_model->save($invoice_item_data, $id);
        if ($invoice_item_id) {

            //check if the add_new_item flag is on, if so, add the item to libary. 
            $add_new_item_to_library = $this->input->post('add_new_item_to_library');
            if ($add_new_item_to_library) {
                $library_item_data = array(
                    "title" => $this->input->post('invoice_item_title'),
                    "category" => $this->input->post('category'),
                    "unit_type" => $this->input->post('unit_type'),
                    "rate" => unformat_currency($this->input->post('invoice_item_rate'))
                );
                $this->Master_Items_model->save($library_item_data);
            }

            $options = array("id" => $invoice_item_id);
            $item_info = $this->Purchase_RequestItems_model->get_details($options)->row();
            echo json_encode(array("success" => true, "invoice_id" => $item_info->fid_quotation, "data" => $this->_make_item_row($item_info), "invoice_total_view" => $this->_get_invoice_total_view($item_info->fid_quotation), 'id' => $invoice_item_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete or undo an invoice item */

    function delete_item() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Purchase_RequestItems_model->delete($id, true)) {
                $options = array("id" => $id);
                $item_info = $this->Purchase_RequestItems_model->get_details($options)->row();
                echo json_encode(array("success" => true, "invoice_id" => $item_info->fid_quotation, "data" => $this->_make_item_row($item_info), "invoice_total_view" => $this->_get_invoice_total_view($item_info->fid_quotation), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Purchase_RequestItems_model->delete($id)) {
                $item_info = $this->Purchase_RequestItems_model->get_one($id);
                echo json_encode(array("success" => true, "invoice_id" => $item_info->fid_quotation, "invoice_total_view" => $this->_get_invoice_total_view($item_info->fid_quotation), 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of invoice items, prepared for datatable  */

    function item_list_data($invoice_id = 0) {

        $list_data = $this->Purchase_RequestItems_model->get_details(array("fid_quotation" => $invoice_id))->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_item_row($data);
        }
        echo json_encode(array("data" => $result));
        // $this->output->enable_profiler(TRUE);
        // print_r($list_data);

    }

    /* prepare a row of invoice item list table */

    private function _make_item_row($data) {
        $item = "<b>$data->title</b>";
        if ($data->description) {
            $item.="<br /><span>" . nl2br($data->description) . "</span><br><span style='float:right;'>".$data->category."<span>";
        }
        $type = $data->unit_type ? $data->unit_type : "";

        return array(
            $item,
            to_decimal_format($data->quantity) . " " . $type,
            to_currency($data->rate),
            to_currency($data->total),
            modal_anchor(get_uri("purchase/request/item_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_invoice'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("purchase/request/delete_item"), "data-action" => "delete"))
        );
    }

    function get_item_suggestion() {
        $key = $this->input->get('q');
        $suggestion = array();

        $items = $this->Purchase_RequestItems_model->get_item_suggestion($key);

        foreach ($items as $item) {
            $suggestion[] = array("id" => $item->title, "text" => $item->title, "price" => $item->price , "category" => $item->category,"unit_type" => $item->unit_type);
        }

        $suggestion[] = array("id" => "+", "text" => "+ " . lang("create_new_item"));

        echo json_encode($suggestion);
    }

    function get_item_info_suggestion() {
        $item = $this->Purchase_RequestItems_model->get_item_info_suggestion($this->input->post("item_name"));
        if ($item) {
            echo json_encode(array("success" => true, "item_info" => $item));
        } else {
            echo json_encode(array("success" => false));
        }
    }

    private function _get_invoice_total_view($invoice_id = 0) {
        $view_data["invoice_total_summary"] = $this->Purchase_Request_model->get_request_total_summary($invoice_id);
        return $this->load->view('request/request_total_section', $view_data, true);
    }

    function get_invoice_status_bar($invoice_id = 0) {

        $view_data["invoice_info"] = $this->Purchase_Request_model->get_details(array("id" => $invoice_id))->row();
        
        $view_data["client_info"] = $this->Master_Vendors_model->get_details(array("id" => $view_data["invoice_info"]->fid_vendor))->row();
        $view_data['invoice_status_label'] = $this->_get_quotation_status_label($view_data["invoice_info"],true);
        $this->load->view('request/request_status_bar', $view_data);
    }

     function preview($invoice_id = 0, $show_close_preview = false) {




        if ($invoice_id) {
            $view_data = get_request_making_data($invoice_id);


            $view_data['invoice_preview'] = prepare_request_pdf($view_data, "html");

            //show a back button
            $view_data['show_close_preview'] = true;

            $view_data['invoice_id'] = $invoice_id;
            $view_data['payment_methods'] = "";

            $this->template->rander("request/request_preview", $view_data);
        } else {
            show_404();
        }
    }

    function download_pdf($invoice_id = 0) {

        if ($invoice_id) {
            $invoice_data = get_request_making_data($invoice_id);
            // $this->_check_invoice_access_permission($invoice_data);

            prepare_request_pdf($invoice_data, "download");
        } else {
            show_404();
        }
    }


    function send_request_modal_form($invoice_id) {


        if ($invoice_id) {
            $options = array("id" => $invoice_id);
            $invoice_info = $this->Purchase_Request_model->get_details($options)->row();
            $view_data['invoice_info'] = $invoice_info;
            $contacts_options = array("id" => $invoice_info->fid_vendor);
            $contacts = $this->Master_Vendors_model->get_details($contacts_options)->result();
            $contact_first_name = "";
            $contact_last_name = "";
            $contacts_dropdown = array();
            foreach ($contacts as $contact) {
                $contacts_dropdown[$contact->id] = $contact->name. " (" . lang("primary_contact") . ")";
                
            }


            $view_data['contacts_dropdown'] = $contacts_dropdown;

            $email_template = $this->Email_templates_model->get_final_template("send_invoice");

            $invoice_total_summary = $this->Purchase_Request_model->get_request_total_summary($invoice_id);

            $parser_data["INVOICE_ID"] = $invoice_info->id;
            $parser_data["CONTACT_FIRST_NAME"] = $contact->name;
            // $parser_data["CONTACT_LAST_NAME"] = $contact_last_name;
            $parser_data["BALANCE_DUE"] = to_currency($invoice_total_summary->balance_due, $invoice_total_summary->currency_symbol);
            $parser_data["DUE_DATE"] = $invoice_info->exp_date;
            $parser_data["PROJECT_TITLE"] = $invoice_info->code;
            $parser_data["INVOICE_URL"] = get_uri("purchase/preview/" . $invoice_info->id);
            $parser_data['SIGNATURE'] = $email_template->signature;

            $view_data['message'] = $this->parser->parse_string($email_template->message, $parser_data, TRUE);
            $view_data['subject'] = $email_template->subject;

            $this->load->view('request/send_request_modal_form', $view_data);
        } else {
            show_404();
        }
    }

    function send_request() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $invoice_id = $this->input->post('id');

        $contact_id = $this->input->post('contact_id');
        $cc = $this->input->post('invoice_cc');

        $custom_bcc = $this->input->post('invoice_bcc');
        $subject = $this->input->post('subject');
        $message = decode_ajax_post_data($this->input->post('message'));

        $contact = $this->Master_Customers_model->get_one($contact_id);

        $invoice_data = get_request_making_data($invoice_id);
        $attachement_url = prepare_request_pdf($invoice_data, "send_email");

        $default_bcc = get_setting('send_bcc_to'); //get default settings
        $bcc_emails = "";

        if ($default_bcc && $custom_bcc) {
            $bcc_emails = $default_bcc . "," . $custom_bcc;
        } else if ($default_bcc) {
            $bcc_emails = $default_bcc;
        } else if ($custom_bcc) {
            $bcc_emails = $custom_bcc;
        }

        if (send_app_mail($contact->email, $subject, $message, array("attachments" => array(array("file_path" => $attachement_url)), "cc" => $cc, "bcc" => $bcc_emails))) {
            // change email status
            $status_data = array("status" => "sent", "last_email_sent_date" => get_my_local_time());
            if ($this->Purchase_Request_model->save($status_data, $invoice_id)) {
                echo json_encode(array('success' => true, 'message' => lang("invoice_sent_message"), "invoice_id" => $invoice_id));
            }
            // delete the temp invoice
            if (file_exists($attachement_url)) {
                unlink($attachement_url);
            }
        } else {
            echo json_encode(array('success' => false, 'message' => lang('error_occurred')));
        }
    }


}

/* End of file clients.php */
/* Location: ./application/controllers/clients.php */