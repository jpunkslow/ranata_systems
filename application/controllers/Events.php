<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Events extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->access_only_team_members();
    }

    //load calendar view
    function index() {
        $this->check_module_availability("module_event");

        $this->template->rander("events/index");
    }

    private function can_share_events() {
        return get_array_value($this->login_user->permissions, "disable_event_sharing") == "1" ? false : true;
    }

    //show add/edit event modal form
    function modal_form() {
        $event_id = decode_id($this->input->post('encrypted_event_id'), "event_id");
        $model_info = $this->Events_model->get_one($event_id);

        $model_info->start_date = $model_info->start_date ? $model_info->start_date : $this->input->post('start_date');
        $model_info->end_date = $model_info->end_date ? $model_info->end_date : $this->input->post('end_date');
        $model_info->start_time = $model_info->start_time ? $model_info->start_time : $this->input->post('start_time');
        $model_info->end_time = $model_info->end_time ? $model_info->end_time : $this->input->post('end_time');

        $view_data['client_id'] = $this->input->post('client_id');

        $view_data['model_info'] = $model_info;
        $view_data['members_and_teams_dropdown'] = json_encode(get_team_members_and_teams_select2_data_list());
        $view_data['time_format_24_hours'] = get_setting("time_format") == "24_hours" ? true : false;


        //prepare clients dropdown, check if user has permission to access the client
        $client_access_info = $this->get_access_info("client");
        $view_data['clients_dropdown'] = array();
        if ($this->login_user->is_admin || $client_access_info->access_type == "all") {
            $view_data['clients_dropdown'] = array("" => "-") + $this->Clients_model->get_dropdown_list(array("company_name"));
        }

        $view_data["can_share_events"] = $this->can_share_events();

        //prepare label suggestion dropdown
        $labels = explode(",", $this->Events_model->get_label_suggestions());
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

        $this->load->view('events/modal_form', $view_data);
    }

    //save an event
    function save() {
        validate_submitted_data(array(
            "title" => "required",
            "description" => "required",
            "start_date" => "required",
            "end_date" => "required"
        ));

        $id = $this->input->post('id');

        //convert to 24hrs time format
        $start_time = $this->input->post('start_time');
        $end_time = $this->input->post('end_time');

        if (get_setting("time_format") != "24_hours") {
            $start_time = convert_time_to_24hours_format($start_time);
            $end_time = convert_time_to_24hours_format($end_time);
        }


        //prepare share with data

        $share_with = $this->input->post('share_with');
        if ($share_with == "specific") {
            $share_with = $this->input->post('share_with_specific');
        }

        $data = array(
            "title" => $this->input->post('title'),
            "description" => $this->input->post('description'),
            "start_date" => $this->input->post('start_date'),
            "end_date" => $this->input->post('end_date'),
            "start_time" => $start_time,
            "end_time" => $end_time,
            "location" => $this->input->post('location'),
            "labels" => $this->input->post('labels'),
            "color" => $this->input->post('color'),
            "created_by" => $this->login_user->id,
            "share_with" => $share_with
        );

        if (!$this->can_share_events()) {
            $data["share_with"] = "";
        }


        if ($this->input->post('client_id')) {
            $data["client_id"] = $this->input->post('client_id');
        }


        //only admin can edit other team members events
        //non-admin team members can edit only their own events
        if ($id && !$this->login_user->is_admin) {
            $event_info = $this->Events_model->get_one($id);
            if ($event_info->created_by != $this->login_user->id) {
                redirect("forbidden");
            }
        }

        $save_id = $this->Events_model->save($data, $id);
        if ($save_id) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //delete/undo an event
    function delete() {
        validate_submitted_data(array(
            "encrypted_event_id" => "required"
        ));

        $id = decode_id($this->input->post('encrypted_event_id'), "event_id"); //to make is secure we'll use the encrypted id
        //only admin can delete other team members events
        //non-admin team members can delete only their own events
        if ($id && !$this->login_user->is_admin) {
            $event_info = $this->Events_model->get_one($id);
            if ($event_info->created_by != $this->login_user->id) {
                redirect("forbidden");
            }
        }


        if ($this->Events_model->delete($id)) {
            echo json_encode(array("success" => true, 'message' => lang('event_deleted')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
        }
    }

    //get calendar event
    function calendar_events($client_id = 0) {
        $options = array("user_id" => $this->login_user->id, "team_ids" => $this->login_user->team_ids, "client_id" => $client_id);
        $list_data = $this->Events_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_calendar_event($data);
        }
        echo json_encode($result);
    }

    //prepare calendar event
    private function _make_calendar_event($data) {
        return array(
            "title" => $data->title,
            "icon" => get_event_icon($data->share_with),
            "start" => $data->start_date . " " . $data->start_time,
            "end" => $data->end_date . " " . $data->end_time,
            "encrypted_event_id" => encode_id($data->id, "event_id"), //to make is secure we'll use the encrypted id
            "backgroundColor" => $data->color,
            "borderColor" => $data->color,
        );
    }

    //view an evnet
    function view() {
        $encrypted_event_id = $this->input->post('id');
        $event_id = decode_id($encrypted_event_id, "event_id");
        validate_submitted_data(array(
            "id" => "required"
        ));

        $model_info = $this->Events_model->get_details(array("id" => $event_id))->row();

        if ($model_info->id) {

            $view_data['encrypted_event_id'] = $encrypted_event_id; //to make is secure we'll use the encrypted id 
            $view_data['editable'] = $this->input->post('editable');
            $view_data['model_info'] = $model_info;
            $view_data['event_icon'] = get_event_icon($model_info->share_with);

            $event_labels = "";
            if ($model_info->labels) {
                $labels = explode(",", $model_info->labels);
                foreach ($labels as $label) {
                    $event_labels.="<span class='label large' style='background-color:$model_info->color;' title='Label'>" . $label . "</span> ";
                }
            }

            $view_data['labels'] = $event_labels;

            $this->load->view('events/view', $view_data);
        } else {
            show_404();
        }
    }

}

/* End of file events.php */
    /* Location: ./application/controllers/events.php */