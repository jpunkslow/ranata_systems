<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    public function index() {

        if ($this->login_user->user_type === "staff") {
            //check which widgets are viewable to current logged in user


            $this->template->rander("dashboard/index");
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