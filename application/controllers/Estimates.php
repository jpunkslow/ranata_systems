<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Estimates extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->init_permission_checker("estimate");
    }

    /* load estimate list view */

    function index() {
        $this->check_module_availability("module_estimate");
        $view_data['can_request_estimate'] = false;

        if ($this->login_user->user_type === "staff") {
            $this->access_only_allowed_members();

            $this->template->rander("estimates/index");
        } else {
            //client view
            $view_data["client_info"] = $this->Clients_model->get_one($this->login_user->client_id);
            $view_data['client_id'] = $this->login_user->client_id;
            $view_data['page_type'] = "full";


            if (get_setting("module_estimate_request") == "1") {
                $view_data['can_request_estimate'] = true;
            }

            $this->template->rander("clients/estimates/estimates", $view_data);
        }
    }

    /* load new estimate modal */

    function modal_form() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric",
            "client_id" => "numeric"
        ));

        $client_id = $this->input->post('client_id');
        $view_data['model_info'] = $this->Estimates_model->get_one($this->input->post('id'));


        $project_client_id = $client_id;
        if ($view_data['model_info']->client_id) {
            $project_client_id = $view_data['model_info']->client_id;
        }

        //make the drodown lists
        $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        $view_data['clients_dropdown'] = array("" => "-") + $this->Clients_model->get_dropdown_list(array("company_name"));

        $view_data['client_id'] = $client_id;

        $this->load->view('estimates/modal_form', $view_data);
    }

    /* add or edit an estimate */

    function save() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric",
            "estimate_client_id" => "required|numeric",
            "estimate_date" => "required",
            "valid_until" => "required"
        ));

        $client_id = $this->input->post('estimate_client_id');
        $id = $this->input->post('id');

        $estimate_data = array(
            "client_id" => $client_id,
            "estimate_date" => $this->input->post('estimate_date'),
            "valid_until" => $this->input->post('valid_until'),
            "tax_id" => $this->input->post('tax_id'),
            "tax_id2" => $this->input->post('tax_id2'),
            "note" => $this->input->post('estimate_note')
        );

        $estimate_id = $this->Estimates_model->save($estimate_data, $id);
        if ($estimate_id) {
            echo json_encode(array("success" => true, "data" => $this->_row_data($estimate_id), 'id' => $estimate_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //update estimate status
    function update_estimate_status($estimate_id, $status) {
        if ($estimate_id && $status) {
            $estmate_info = $this->Estimates_model->get_one($estimate_id);
            $this->access_only_allowed_members_or_client_contact($estmate_info->client_id);


            if ($this->login_user->user_type == "client") {
                //updating by client
                //client can only update the status once and the value should be either accepted or declined
                if ($estmate_info->status == "sent" && ($status == "accepted" || $status == "declined")) {

                    $estimate_data = array("status" => $status);
                    $estimate_id = $this->Estimates_model->save($estimate_data, $estimate_id);

                    //create notification
                    if ($status == "accepted") {
                        log_notification("estimate_accepted", array("estimate_id" => $estimate_id));
                    } else if ($status == "declined") {
                        log_notification("estimate_rejected", array("estimate_id" => $estimate_id));
                    }
                }
            } else {
                //updating by team members

                if ($status == "sent" || $status == "accepted" || $status == "declined") {
                    $estimate_data = array("status" => $status);
                    $estimate_id = $this->Estimates_model->save($estimate_data, $estimate_id);

                    //create notification
                    if ($status == "sent") {
                        log_notification("estimate_sent", array("estimate_id" => $estimate_id));
                    }
                }
            }
        }
    }

    /* delete or undo an estimate */

    function delete() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Estimates_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Estimates_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of estimates, prepared for datatable  */

    function list_data() {
        $this->access_only_allowed_members();

        $options = array(
            "status" => $this->input->post("status"),
            "start_date" => $this->input->post("start_date"),
            "end_date" => $this->input->post("end_date")
        );

        $list_data = $this->Estimates_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }

        echo json_encode(array("data" => $result));
    }

    /* list of estimate of a specific client, prepared for datatable  */

    function estimate_list_data_of_client($client_id) {
        $this->access_only_allowed_members_or_client_contact($client_id);

        $options = array("client_id" => $client_id, "status" => $this->input->post("status"));

        if ($this->login_user->user_type == "client") {
            //don't show draft estimates to clients.
            $options["exclude_draft"] = true;
        }

        $list_data = $this->Estimates_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of estimate list table */

    private function _row_data($id) {
        $options = array("id" => $id);
        $data = $this->Estimates_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of estimate list table */

    private function _make_row($data) {
        $estimate_url = "";
        if ($this->login_user->user_type == "staff") {
            $estimate_url = anchor(get_uri("estimates/view/" . $data->id), get_estimate_id($data->id));
        } else {
            //for client client
            $estimate_url = anchor(get_uri("estimates/preview/" . $data->id), get_estimate_id($data->id));
        }

        return array(
            $estimate_url,
            anchor(get_uri("clients/view/" . $data->client_id), $data->company_name),
            $data->estimate_date,
            format_to_date($data->estimate_date, false),
            to_currency($data->estimate_value, $data->currency_symbol),
            $this->_get_estimate_status_label($data),
            modal_anchor(get_uri("estimates/modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_estimate'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_estimate'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("estimates/delete"), "data-action" => "delete"))
        );
    }

    //prepare estimate status label 
    private function _get_estimate_status_label($estimate_info, $return_html = true) {
        $estimate_status_class = "label-default";

        //don't show sent status to client, change the status to 'new' from 'sent'

        if ($this->login_user->user_type == "client") {
            if ($estimate_info->status == "sent") {
                $estimate_info->status = "new";
            } else if ($estimate_info->status == "declined") {
                $estimate_info->status = "rejected";
            }
        }

        if ($estimate_info->status == "draft") {
            $estimate_status_class = "label-default";
        } else if ($estimate_info->status == "declined" || $estimate_info->status == "rejected") {
            $estimate_status_class = "label-danger";
        } else if ($estimate_info->status == "accepted") {
            $estimate_status_class = "label-success";
        } else if ($estimate_info->status == "sent") {
            $estimate_status_class = "label-primary";
        } else if ($estimate_info->status == "new") {
            $estimate_status_class = "label-warning";
        }

        $estimate_status = "<span class='label $estimate_status_class large'>" . lang($estimate_info->status) . "</span>";
        if ($return_html) {
            return $estimate_status;
        } else {
            return $estimate_info->status;
        }
    }

    /* load estimate details view */

    function view($estimate_id = 0) {
        $this->access_only_allowed_members();

        if ($estimate_id) {
            $options = array("id" => $estimate_id);
            $estimate_info = $this->Estimates_model->get_details($options)->row();
            if ($estimate_info) {
                $view_data['estimate_info'] = $estimate_info;
                $view_data['client_info'] = $this->Clients_model->get_one($view_data['estimate_info']->client_id);
                $estimate_items_options = array("estimate_id" => $estimate_id);
                $view_data['estimate_items'] = $this->Estimate_items_model->get_details($estimate_items_options)->result();
                $view_data['estimate_status_label'] = $this->_get_estimate_status_label($estimate_info);
                $view_data['estimate_status'] = $this->_get_estimate_status_label($estimate_info, false);
                $view_data["estimate_total_summary"] = $this->Estimates_model->get_estimate_total_summary($estimate_id);

                $access_info = $this->get_access_info("invoice");
                $view_data["show_invoice_option"] = (get_setting("module_invoice") && $access_info->access_type == "all") ? true : false;

                $this->template->rander("estimates/view", $view_data);
            } else {
                show_404();
            }
        }
    }

    /* estimate total section */

    private function _get_estimate_total_view($estimate_id = 0) {
        $view_data["estimate_total_summary"] = $this->Estimates_model->get_estimate_total_summary($estimate_id);
        return $this->load->view('estimates/estimate_total_section', $view_data, true);
    }

    /* load item modal */

    function item_modal_form() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric"
        ));

        $estimate_id = $this->input->post('estimate_id');

        $view_data['model_info'] = $this->Estimate_items_model->get_one($this->input->post('id'));
        if (!$estimate_id) {
            $estimate_id = $view_data['model_info']->estimate_id;
        }
        $view_data['estimate_id'] = $estimate_id;
        $this->load->view('estimates/item_modal_form', $view_data);
    }

    /* add or edit an estimate item */

    function save_item() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric",
            "estimate_id" => "required|numeric"
        ));

        $estimate_id = $this->input->post('estimate_id');

        $id = $this->input->post('id');
        $rate = unformat_currency($this->input->post('estimate_item_rate'));
        $quantity = unformat_currency($this->input->post('estimate_item_quantity'));

        $estimate_item_data = array(
            "estimate_id" => $estimate_id,
            "title" => $this->input->post('estimate_item_title'),
            "description" => $this->input->post('estimate_item_description'),
            "quantity" => $quantity,
            "unit_type" => $this->input->post('estimate_unit_type'),
            "rate" => unformat_currency($this->input->post('estimate_item_rate')),
            "total" => $rate * $quantity,
        );

        $estimate_item_id = $this->Estimate_items_model->save($estimate_item_data, $id);
        if ($estimate_item_id) {


            //check if the add_new_item flag is on, if so, add the item to libary. 
            $add_new_item_to_library = $this->input->post('add_new_item_to_library');
            if ($add_new_item_to_library) {
                $library_item_data = array(
                    "title" => $this->input->post('estimate_item_title'),
                    "description" => $this->input->post('estimate_item_description'),
                    "unit_type" => $this->input->post('estimate_unit_type'),
                    "rate" => unformat_currency($this->input->post('estimate_item_rate'))
                );
                $this->Items_model->save($library_item_data);
            }



            $options = array("id" => $estimate_item_id);
            $item_info = $this->Estimate_items_model->get_details($options)->row();
            echo json_encode(array("success" => true, "estimate_id" => $item_info->estimate_id, "data" => $this->_make_item_row($item_info), "estimate_total_view" => $this->_get_estimate_total_view($item_info->estimate_id), 'id' => $estimate_item_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete or undo an estimate item */

    function delete_item() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Estimate_items_model->delete($id, true)) {
                $options = array("id" => $id);
                $item_info = $this->Estimate_items_model->get_details($options)->row();
                echo json_encode(array("success" => true, "estimate_id" => $item_info->estimate_id, "data" => $this->_make_item_row($item_info), "estimate_total_view" => $this->_get_estimate_total_view($item_info->estimate_id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Estimate_items_model->delete($id)) {
                $item_info = $this->Estimate_items_model->get_one($id);
                echo json_encode(array("success" => true, "estimate_id" => $item_info->estimate_id, "estimate_total_view" => $this->_get_estimate_total_view($item_info->estimate_id), 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of estimate items, prepared for datatable  */

    function item_list_data($estimate_id = 0) {
        $this->access_only_allowed_members();

        $list_data = $this->Estimate_items_model->get_details(array("estimate_id" => $estimate_id))->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_item_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* prepare a row of estimate item list table */

    private function _make_item_row($data) {
        $item = "<b>$data->title</b>";
        if ($data->description) {
            $item.="<br /><span>" . nl2br($data->description) . "</span>";
        }
        $type = $data->unit_type ? $data->unit_type : "";

        return array(
            $item,
            to_decimal_format($data->quantity) . " " . $type,
            to_currency($data->rate, $data->currency_symbol),
            to_currency($data->total, $data->currency_symbol),
            modal_anchor(get_uri("estimates/item_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_estimate'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("estimates/delete_item"), "data-action" => "delete"))
        );
    }

    /* prepare suggestion of estimate item */

    function get_estimate_item_suggestion() {
        $key = $_REQUEST["q"];
        $suggestion = array();

        $items = $this->Invoice_items_model->get_item_suggestion($key);

        foreach ($items as $item) {
            $suggestion[] = array("id" => $item->title, "text" => $item->title);
        }

        $suggestion[] = array("id" => "+", "text" => "+ " . lang("create_new_item"));

        echo json_encode($suggestion);
    }

    function get_estimate_item_info_suggestion() {
        $item = $this->Invoice_items_model->get_item_info_suggestion($this->input->post("item_name"));
        if ($item) {
            echo json_encode(array("success" => true, "item_info" => $item));
        } else {
            echo json_encode(array("success" => false));
        }
    }

    //view html is accessable to client only.
    function preview($estimate_id = 0, $show_close_preview = false) {


        $view_data = array();

        if ($estimate_id) {

            $view_data['estimate_preview'] = $this->_prepare_estimate($estimate_id, "html", $view_data);

            //show a back button
            $view_data['show_close_preview'] = $show_close_preview && $this->login_user->user_type === "staff" ? true : false;

            $view_data['estimate_id'] = $estimate_id;
            $view_data['payment_methods'] = $this->Payment_methods_model->get_available_online_payment_methods();

            $this->load->library("paypal");
            $view_data['paypal_url'] = $this->paypal->get_paypal_url();

            $this->template->rander("estimates/estimate_preview", $view_data);
        } else {
            show_404();
        }
    }

    function download_pdf($estimate_id = 0) {

        if ($estimate_id) {
            $this->_prepare_estimate($estimate_id, "download");
        } else {
            show_404();
        }
    }

    private function _prepare_estimate($estimate_id, $mode = "download", &$data = array()) {
        $this->load->library('pdf');
        $this->pdf->setPrintHeader(false);
        $this->pdf->setPrintFooter(false);
        $this->pdf->SetCellPadding(1.5);
        $this->pdf->setImageScale(1.42);
        $this->pdf->AddPage();

        if ($estimate_id) {

            $view_data = get_estimate_making_data($estimate_id);

            //check for valid estimate
            if (!$view_data) {
                show_404();
            }

            //check for security
            $estimate_info = get_array_value($view_data, "estimate_info");
            if ($this->login_user->user_type == "client") {
                if ($this->login_user->client_id != $estimate_info->client_id) {
                    redirect("forbidden");
                }
            } else {
                $this->access_only_allowed_members();
            }

            $view_data["mode"] = $mode;

            $view_data['estimate_status_label'] = $this->_get_estimate_status_label($estimate_info);

            if (@ob_get_length())
                @ob_clean();
            //so, we have a valid estimate data. Prepare the view.

            $html = $this->load->view("estimates/estimate_pdf", $view_data, true);
            if ($mode != "html") {
                $this->pdf->writeHTML($html, true, false, true, false, '');
            }

            $data = $view_data; //return back the data
            $pdf_file_name = lang("estimate") . "-$estimate_id.pdf";

            if ($mode === "download") {
                $this->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $this->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $this->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

    function get_estimate_status_bar($estimate_id = 0) {
        $this->access_only_allowed_members();

        $view_data["estimate_info"] = $this->Estimates_model->get_details(array("id" => $estimate_id))->row();
        $view_data['estimate_status_label'] = $this->_get_estimate_status_label($view_data["estimate_info"]);
        $this->load->view('estimates/estimate_status_bar', $view_data);
    }

}

/* End of file estimates.php */
/* Location: ./application/controllers/estimates.php */