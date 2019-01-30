<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Tickets extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->init_permission_checker("ticket");
    }

    // load ticket list view
    function index() {
        $this->check_module_availability("module_ticket");

        $view_data["custom_field_headers"] = $this->Custom_fields_model->get_custom_field_headers_for_table("tickets", $this->login_user->is_admin, $this->login_user->user_type);

        if ($this->login_user->user_type === "staff") {

            //prepare ticket label filter list
            $label_suggestions = array(array("id" => "", "text" => "- " . lang("label") . " -"));
            $labels = explode(",", $this->Tickets_model->get_label_suggestions());
            $temp_labels = array();

            foreach ($labels as $label) {
                if ($label && !in_array($label, $temp_labels)) {
                    $temp_labels[] = $label;
                    $label_suggestions[] = array("id" => $label, "text" => $label);
                }
            }

            $view_data['ticket_labels_dropdown'] = json_encode($label_suggestions);

            //prepare assign to filter list

            $assigned_to_dropdown = array(array("id" => "", "text" => "- " . lang("assigned_to") . " -"));

            $assigned_to_list = $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("deleted" => 0, "user_type" => "staff"));
            foreach ($assigned_to_list as $key => $value) {
                $assigned_to_dropdown[] = array("id" => $key, "text" => $value);
            }

            $view_data['assigned_to_dropdown'] = json_encode($assigned_to_dropdown);

            $this->template->rander("tickets/index", $view_data);
        } else {
            $view_data['client_id'] = $this->login_user->client_id;
            $view_data['page_type'] = "full";
            $this->template->rander("clients/tickets/index", $view_data);
        }
    }

    //load new tickt modal 
    function modal_form() {
        validate_submitted_data(array(
            "id" => "numeric"
        ));

        //client should not be able to edit ticket
        if ($this->login_user->user_type === "client" && $this->input->post('id')) {
            redirect("forbidden");
        }



        $view_data['ticket_types_dropdown'] = $this->Ticket_types_model->get_dropdown_list(array("title"), "id");

        $view_data['model_info'] = $this->Tickets_model->get_one($this->input->post('id'));
        $view_data['client_id'] = $this->input->post('client_id');
        if ($this->login_user->user_type == "client") {
            $view_data['client_id'] = $this->login_user->client_id;
        } else {
            $view_data['clients_dropdown'] = $this->Clients_model->get_dropdown_list(array("company_name"));
        }


        //prepare assign to list
        $assigned_to_dropdown = array("" => "-") + $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("deleted" => 0, "user_type" => "staff"));
        $view_data['assigned_to_dropdown'] = $assigned_to_dropdown;

        //prepare label suggestions
        $labels = explode(",", $this->Tickets_model->get_label_suggestions());
        $label_suggestions = array();
        foreach ($labels as $label) {
            if ($label && !in_array($label, $label_suggestions)) {
                $label_suggestions[] = $label;
            }
        }
        if (!count($label_suggestions)) {
            $label_suggestions = array("0" => "");
        }
        $view_data['label_suggestions'] = $label_suggestions;


        $view_data["custom_fields"] = $this->Custom_fields_model->get_combined_details("tickets", $view_data['model_info']->id, $this->login_user->is_admin, $this->login_user->user_type)->result();

        $this->load->view('tickets/modal_form', $view_data);
    }

    // add a new ticket
    function save() {
        $id = $this->input->post('id');

        if ($id) {
            validate_submitted_data(array(
                "ticket_type_id" => "required|numeric"
            ));
        } else {
            validate_submitted_data(array(
                "client_id" => "required|numeric",
                "ticket_type_id" => "required|numeric"
            ));
        }


        $client_id = $this->input->post('client_id');

        $this->access_only_allowed_members_or_client_contact($client_id);

        $ticket_type_id = $this->input->post('ticket_type_id');
        $assigned_to = $this->input->post('assigned_to');

        //if this logged in user is a client then overwrite the client id
        if ($this->login_user->user_type === "client") {
            $client_id = $this->login_user->client_id;
            $assigned_to = 0;
        }


        $now = get_current_utc_time();
        $ticket_data = array(
            "title" => $this->input->post('title'),
            "client_id" => $client_id,
            "ticket_type_id" => $ticket_type_id,
            "created_by" => $this->login_user->id,
            "created_at" => $now,
            "last_activity_at" => $now,
            "labels" => $this->input->post('labels'),
            "assigned_to" => $assigned_to ? $assigned_to : 0
        );

        if ($id) {
            //client can't update ticket
            if ($this->login_user->user_type === "client") {
                redirect("forbidden");
            }

            //remove not updateable fields
            unset($ticket_data['client_id']);
            unset($ticket_data['created_by']);
            unset($ticket_data['created_at']);
            unset($ticket_data['last_activity_at']);
        }


        $ticket_id = $this->Tickets_model->save($ticket_data, $id);

        $target_path = get_setting("timeline_file_path");
        $files_data = move_files_from_temp_dir_to_permanent_dir($target_path, "ticket");


        if ($ticket_id) {

            save_custom_fields("tickets", $ticket_id, $this->login_user->is_admin, $this->login_user->user_type);

            //ticket added. now add a comment in this ticket
            if (!$id) {
                $comment_data = array(
                    "description" => $this->input->post('description'),
                    "ticket_id" => $ticket_id,
                    "created_by" => $this->login_user->id,
                    "created_at" => $now,
                    "files" => $files_data
                );
                $ticket_comment_id = $this->Ticket_comments_model->save($comment_data);

                if ($ticket_id && $ticket_comment_id) {
                    log_notification("ticket_created", array("ticket_id" => $ticket_id, "ticket_comment_id" => $ticket_comment_id));
                }
            }

            echo json_encode(array("success" => true, "data" => $this->_row_data($ticket_id), 'id' => $ticket_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* upload a file */

    function upload_file() {
        upload_file_to_temp();
    }

    /* check valid file for ticket */

    function validate_ticket_file() {
        return validate_post_file($this->input->post("file_name"));
    }

    // list of tickets, prepared for datatable 
    function list_data() {
        $this->access_only_allowed_members();

        $custom_fields = $this->Custom_fields_model->get_available_fields_for_table("tickets", $this->login_user->is_admin, $this->login_user->user_type);

        $status = $this->input->post("status");
        $ticket_label = $this->input->post("ticket_label");
        $assigned_to = $this->input->post("assigned_to");
        $options = array("status" => $status,
            "access_type" => $this->access_type,
            "ticket_label" => $ticket_label,
            "assigned_to" => $assigned_to,
            "custom_fields" => $custom_fields
        );

        $list_data = $this->Tickets_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data, $custom_fields);
        }
        echo json_encode(array("data" => $result));
    }

    // list of tickets of a specific client, prepared for datatable 
    function ticket_list_data_of_client($client_id) {
        $this->access_only_allowed_members_or_client_contact($client_id);

        $custom_fields = $this->Custom_fields_model->get_available_fields_for_table("tickets", $this->login_user->is_admin, $this->login_user->user_type);

        $options = array(
            "client_id" => $client_id,
            "access_type" => $this->access_type,
            "custom_fields" => $custom_fields
        );

        $list_data = $this->Tickets_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data, $custom_fields);
        }
        echo json_encode(array("data" => $result));
    }

    // return a row of ticket list table 
    private function _row_data($id) {
        $custom_fields = $this->Custom_fields_model->get_available_fields_for_table("tickets", $this->login_user->is_admin, $this->login_user->user_type);

        $options = array(
            "id" => $id,
            "access_type" => $this->access_type,
            "custom_fields" => $custom_fields
        );

        $data = $this->Tickets_model->get_details($options)->row();
        return $this->_make_row($data, $custom_fields);
    }

    //prepare a row of ticket list table
    private function _make_row($data, $custom_fields) {
        $ticket_status_class = "label-danger";
        if ($data->status === "new") {
            $ticket_status_class = "label-warning";
        } else if ($data->status === "closed") {
            $ticket_status_class = "label-success";
        } else if ($data->status === "client_replied" && $this->login_user->user_type === "client") {
            $data->status = "open"; //don't show client_replied status to client
        }

        $ticket_status = "<span class='label $ticket_status_class large'>" . lang($data->status) . "</span> ";


        $title = anchor(get_uri("tickets/view/" . $data->id), $data->title);

        //show labels fild to team members only
        $ticket_labels = "";
        if ($data->labels && $this->login_user->user_type == "staff") {
            $labels = explode(",", $data->labels);
            foreach ($labels as $label) {
                $ticket_labels.="<span class='label label-info'  title='$label'>" . $label . "</span> ";
            }
        }
        if ($ticket_labels) {
            $title.="<span class='pull-right'>" . $ticket_labels . "</span>";
        }

        //show assign to field to team members only
        $assigned_to = "-";
        if ($data->assigned_to && $this->login_user->user_type == "staff") {
            $image_url = get_avatar($data->assigned_to_avatar);
            $assigned_to_user = "<span class='avatar avatar-xs mr10'><img src='$image_url' alt='...'></span> $data->assigned_to_user";
            $assigned_to = get_team_member_profile_link($data->assigned_to, $assigned_to_user);
        }

        $row_data = array(
            $data->id,
            $title,
            $data->company_name ? anchor(get_uri("clients/view/" . $data->client_id), $data->company_name) : "-",
            $data->ticket_type,
            $assigned_to,
            $data->last_activity_at,
            format_to_relative_time($data->last_activity_at),
            $ticket_status
        );

        foreach ($custom_fields as $field) {
            $cf_id = "cfv_" . $field->id;
            $row_data[] = $this->load->view("custom_fields/output_" . $field->field_type, array("value" => $data->$cf_id), true);
        }

        return $row_data;
    }

    // load ticket details view 
    function view($ticket_id = 0) {


        if ($ticket_id) {
            $options = array("id" => $ticket_id);
            $options["access_type"] = $this->access_type;

            $ticket_info = $this->Tickets_model->get_details($options)->row();
            $this->access_only_allowed_members_or_client_contact($ticket_info->client_id);


            if ($ticket_info) {
                $view_data['ticket_info'] = $ticket_info;

                $comments_options = array("ticket_id" => $ticket_id);
                $view_data['comments'] = $this->Ticket_comments_model->get_details($comments_options)->result();

                $view_data['custom_fields_list'] = $this->Custom_fields_model->get_combined_details("tickets", $ticket_info->id, $this->login_user->is_admin, $this->login_user->user_type)->result();

                $this->template->rander("tickets/view", $view_data);
            } else {
                show_404();
            }
        }
    }

    function save_comment() {
        $ticket_id = $this->input->post('ticket_id');
        $now = get_current_utc_time();

        $target_path = get_setting("timeline_file_path");
        $files_data = move_files_from_temp_dir_to_permanent_dir($target_path, "ticket");

        $comment_data = array(
            "description" => $this->input->post('description'),
            "ticket_id" => $ticket_id,
            "created_by" => $this->login_user->id,
            "created_at" => $now,
            "files" => $files_data
        );

        validate_submitted_data(array(
            "description" => "required",
            "ticket_id" => "required|numeric"
        ));

        $comment_id = $this->Ticket_comments_model->save($comment_data);
        if ($comment_id) {
            //update ticket status;
            if ($this->login_user->user_type === "client") {
                $ticket_data = array(
                    "status" => "client_replied",
                    "last_activity_at" => $now
                );
            } else {
                $ticket_data = array(
                    "status" => "open",
                    "last_activity_at" => $now
                );
            }
            $this->Tickets_model->save($ticket_data, $ticket_id);

            $comments_options = array("id" => $comment_id);
            $view_data['comment'] = $this->Ticket_comments_model->get_details($comments_options)->row();
            $comment_view = $this->load->view("tickets/comment_row", $view_data, true);
            echo json_encode(array("success" => true, "data" => $comment_view, 'message' => lang('comment_submited')));

            log_notification("ticket_commented", array("ticket_id" => $ticket_id, "ticket_comment_id" => $comment_id));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save_ticket_status($ticket_id = 0, $status = "closed") {

        $status = ($status == "closed") ? "closed" : "open";

        $data = array(
            "status" => $status
        );

        $save_id = $this->Tickets_model->save($data, $ticket_id);
        if ($save_id) {
            $options = array("id" => $ticket_id, "access_type" => $this->access_type);

            $ticket_info = $this->Tickets_model->get_details($options)->row();

            $this->access_only_allowed_members_or_client_contact($ticket_info->client_id);

            $view_data['ticket_info'] = $ticket_info;
            $title_view = $this->load->view("tickets/ticket_sub_title", $view_data, true);
            echo json_encode(array("success" => true, "data" => $title_view, "message" => lang('record_saved')));

            if ($status == "open") {
                log_notification("ticket_reopened", array("ticket_id" => $ticket_id));
            } else if ($status == "closed") {
                log_notification("ticket_closed", array("ticket_id" => $ticket_id));
            }
        } else {
            echo json_encode(array("success" => false, lang('error_occurred')));
        }
    }

    /* download files by zip */

    function download_comment_files($id) {

        $files = $this->Ticket_comments_model->get_one($id)->files;
        download_app_files(get_setting("timeline_file_path"), $files);
    }

}

/* End of file tickets.php */
/* Location: ./application/controllers/tickets.php */