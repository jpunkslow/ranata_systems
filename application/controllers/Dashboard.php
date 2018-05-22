<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    public function index() {

        if ($this->login_user->user_type === "staff") {
            //check which widgets are viewable to current logged in user

            $show_timeline = get_setting("module_timeline") ? true : false;
            $show_attendance = get_setting("module_attendance") ? true : false;
            $show_event = get_setting("module_event") ? true : false;
            $show_invoice = get_setting("module_invoice") ? true : false;
            $show_expense = get_setting("module_expense") ? true : false;
            $show_ticket = get_setting("module_ticket") ? true : false;

            $view_data["show_timeline"] = $show_timeline;
            $view_data["show_attendance"] = $show_attendance;
            $view_data["show_event"] = $show_event;

            $access_expense = $this->get_access_info("expense");
            $access_invoice = $this->get_access_info("invoice");

            $access_ticket = $this->get_access_info("ticket");
            $access_timecards = $this->get_access_info("attendance");

            $view_data["show_invoice_statistics"] = false;
            $view_data["show_ticket_status"] = false;
            $view_data["show_income_vs_expenses"] = false;
            $view_data["show_clock_status"] = false;

            //check module availability and access permission to show any widget

            if ($show_invoice && $show_expense && $access_expense->access_type === "all" && $access_invoice->access_type === "all") {
                $view_data["show_income_vs_expenses"] = true;
            }

            if ($show_invoice && $access_invoice->access_type === "all") {
                $view_data["show_invoice_statistics"] = true;
            }

            if ($show_ticket && $access_ticket->access_type === "all") {
                $view_data["show_ticket_status"] = true;
            }

            if ($show_attendance && $access_timecards->access_type === "all") {
                $view_data["show_clock_status"] = true;
            }

            $this->template->rander("dashboard/index", $view_data);
        } else {
            //client's dashboard    

            $options = array("id" => $this->login_user->client_id);
            $client_info = $this->Clients_model->get_details($options)->row();

            $view_data['show_invoice_info'] = get_setting("module_invoice") ? true : false;;
            $view_data['client_info'] = $client_info;
            $view_data['client_id'] = $client_info->id;
            $view_data['page_type'] = "dashboard";
            $view_data["custom_field_headers"] = $this->Custom_fields_model->get_custom_field_headers_for_table("projects", $this->login_user->is_admin, $this->login_user->user_type);

            $this->template->rander("dashboard/client_dashboard", $view_data);
        }
    }

    public function save_sticky_note() {
        $note_data = array("sticky_note" => $this->input->post("sticky_note"));
        $this->Users_model->save($note_data, $this->login_user->id);
    }

}

/* End of file dashboard.php */
/* Location: ./application/controllers/dashboard.php */