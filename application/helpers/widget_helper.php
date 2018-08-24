<?php

/**
 * get clock in/ clock out widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('clock_widget')) {

    function clock_widget($return_as_data = false) {
        $ci = get_instance();
        $view_data["clock_status"] = $ci->Attendance_model->current_clock_in_record($ci->login_user->id);
        $ci->load->view("attendance/clock_widget", $view_data, $return_as_data);
    }

}


if (!function_exists('sales_today')) {

    function sales_today($return_as_data = false) {
        $ci = get_instance();
        $view_data["clock_status"] = $ci->Attendance_model->current_clock_in_record($ci->login_user->id);
        $ci->load->view("attendance/clock_widget", $view_data, $return_as_data);
    }

}


/**
 * activity logs widget for projects
 * @param array $params
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('activity_logs_widget')) {

    function activity_logs_widget($params = array(), $return_as_data = false) {
        $ci = get_instance();

        $limit = get_array_value($params, "limit");
        $limit = $limit ? $limit : "20";
        $offset = get_array_value($params, "offset");
        $offset = $offset ? $offset : "0";

        $params["user_id"] = $ci->login_user->id;
        $params["is_admin"] = $ci->login_user->is_admin;


        $logs = $ci->Activity_logs_model->get_details($params);
        $view_data["activity_logs"] = $logs->result;
        $view_data["result_remaining"] = $logs->found_rows - $limit - $offset;
        $view_data["next_page_offset"] = $offset + $limit;

        $view_data["log_for"] = get_array_value($params, "log_for");
        $view_data["log_for_id"] = get_array_value($params, "log_for_id");
        $view_data["log_type"] = get_array_value($params, "log_type");
        $view_data["log_type_id"] = get_array_value($params, "log_type_id");

        $view_data["result_remaining"] = $ci->load->view("activity_logs/activity_logs_widget", $view_data, $return_as_data);
    }

}


/**
 * get timeline widget
 * @param array $params
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('timeline_widget')) {

    function timeline_widget($params = array(), $return_as_data = false) {
        $ci = get_instance();

        $limit = get_array_value($params, "limit");
        $limit = $limit ? $limit : "20";
        $offset = get_array_value($params, "offset");
        $offset = $offset ? $offset : "0";

        $is_first_load = get_array_value($params, "is_first_load");
        if ($is_first_load) {
            $view_data["is_first_load"] = true;
        } else {
            $view_data["is_first_load"] = false;
        }

        $logs = $ci->Posts_model->get_details($params);
        $view_data["posts"] = $logs->result;
        $view_data["result_remaining"] = $logs->found_rows - $limit - $offset;
        $view_data["next_page_offset"] = $offset + $limit;

        $user_id = get_array_value($params, "user_id");
        if ($user_id && !count($logs->result)) {
            //show a no post found message to user's wall for empty post list
            $ci->load->view("timeline/no_post_message");
        } else {
            $ci->load->view("timeline/post_list", $view_data, $return_as_data);
        }
    }

}


/**
 * get announcement notice
 * @param boolean $return_as_data
 * @return html
 */


/**
 * get tasks widget of loged in user
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('my_open_tasks_widget')) {

    function my_open_tasks_widget($return_as_data = false) {
        $ci = get_instance();
        $view_data["total"] = $ci->Tasks_model->count_my_open_tasks($ci->login_user->id);
        $ci->load->view("projects/tasks/open_tasks_widget", $view_data, $return_as_data);
    }

}


/**
 * get tasks status widteg of loged in user
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('my_task_stataus_widget')) {

    function my_task_stataus_widget($return_as_data = false) {
        $ci = get_instance();
        $task_statuses = $ci->Tasks_model->get_task_statistics(array("user_id" => $ci->login_user->id));

        $view_data["task_to_do"] = 0;
        $view_data["task_in_progress"] = 0;
        $view_data["task_done"] = 0;
        foreach ($task_statuses as $status) {
            $view_data["task_" . $status->status] = $status->total;
        }
        $ci->load->view("projects/tasks/my_task_status_widget", $view_data, $return_as_data);
    }

}


/**
 * get todays event widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('events_today_widget')) {

    function events_today_widget($return_as_data = false) {
        $ci = get_instance();
        $view_data["total"] = $ci->Events_model->count_events_today($ci->login_user->id);
        $ci->load->view("events/events_today", $view_data, $return_as_data);
    }

}


/**
 * get new posts widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('new_posts_widget')) {

    function new_posts_widget($return_as_data = false) {
        $ci = get_instance();
        $view_data["total"] = $ci->Posts_model->count_new_posts();
        $ci->load->view("timeline/new_posts_widget", $view_data, $return_as_data);
    }

}


/**
 * get event list widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('events_widget')) {

    function events_widget($return_as_data = false) {
        $ci = get_instance();
        $today = date("Y-m-d", strtotime(convert_date_local_to_utc(date("Y-m-d H:i:s"))) + get_timezone_offset());

        $options = array("start_date" => $today, "user_id" => $ci->login_user->id, "limit" => 10, "team_ids" => $ci->login_user->team_ids);
        $view_data["events"] = $ci->Events_model->get_details($options)->result();
        $ci->load->view("events/events_widget", $view_data, $return_as_data);
    }

}


/**
 * get event icons based on event sharing 
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('get_event_icon')) {

    function get_event_icon($share_with = "") {
        $icon = "";
        if (!$share_with) {
            $icon = "fa-lock";
        } else if ($share_with == "all") {
            $icon = "fa-globe";
        } else {
            $icon = "fa-at";
        }
        return $icon;
    }

}


/**
 * get open timers widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('my_open_timers')) {

    function my_open_timers($return_as_data = false) {
        $ci = get_instance();
        $timers = $ci->Timesheets_model->get_open_timers($ci->login_user->id);
        $view_data["timers"] = $timers->result();
        $ci->load->view("projects/open_timers", $view_data, $return_as_data);
    }

}


/**
 * get income expense widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('income_vs_expenses_widget')) {

    function income_vs_expenses_widget($return_as_data = false) {
        $ci = get_instance();
        $info = $ci->Expenses_model->get_income_expenses_info();
        $view_data["income"] = $info->income ? $info->income : 0;
        $view_data["expenses"] = $info->expneses ? $info->expneses : 0;
        $ci->load->view("expenses/income_expenses_widget", $view_data, $return_as_data);
    }

}


/**
 * get ticket status widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('ticket_status_widget')) {

    function ticket_status_widget($return_as_data = false) {
        $ci = get_instance();
        $statuses = $ci->Tickets_model->get_ticket_status_info()->result();

        $view_data["new"] = 0;
        $view_data["open"] = 0;
        $view_data["closed"] = 0;
        foreach ($statuses as $status) {
            if ($status->status === "new") {
                $view_data["new"] = $status->total;
            } else if ($status->status === "closed") {
                $view_data["closed"] = $status->total;
            } else {
                $view_data["open"] += $status->total;
            }
        }

        $ci->load->view("tickets/ticket_status_widget", $view_data, $return_as_data);
    }

}


/**
 * get invoice statistics widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('invoice_statistics_widget')) {

    function invoice_statistics_widget($return_as_data = false) {
        $ci = get_instance();
        $info = $ci->Invoices_model->invoice_statistics();

        $payments = array();
        $payments_array = array();

        $invoices = array();
        $invoices_array = array();

        for ($i = 1; $i <= 12; $i++) {
            $payments[$i] = 0;
            $invoices[$i] = 0;
        }

        foreach ($info->payments as $payment) {
            $payments[$payment->month] = $payment->total;
        }
        foreach ($info->invoices as $invoice) {
            $invoices[$invoice->month] = $invoice->total;
        }

        foreach ($payments as $key => $payment) {
            $payments_array[] = array($key, $payment);
        }

        foreach ($invoices as $key => $invoice) {
            $invoices_array[] = array($key, $invoice);
        }

        $view_data["payments"] = json_encode($payments_array);
        $view_data["invoices"] = json_encode($invoices_array);

        $ci->load->view("widget/sales/invoice_statistics_widget", $view_data, $return_as_data);
    }

}


/**
 * get projects statustics widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('project_timesheet_statistics_widget')) {

    function project_timesheet_statistics_widget($return_as_data = false) {
        $ci = get_instance();

        $timesheets = array();
        $timesheets_array = array();

        $ticks = array();

        $today = get_my_local_time("Y-m-d");
        $start_date = date("Y-m-", strtotime($today)) . "01";
        $end_date = date("Y-m-t", strtotime($today));

        $timesheets_result = $ci->Timesheets_model->get_timesheet_statistics(array("start_date" => $start_date, "end_date" => $end_date, "user_id" => $ci->login_user->id))->result();
        $days_of_month = date("t", strtotime($today));

        for ($i = 0; $i <= $days_of_month; $i++) {
            $timesheets[$i] = 0;
        }

        foreach ($timesheets_result as $value) {
            $timesheets[$value->day * 1] = $value->total_sec / 60;
        }

        foreach ($timesheets as $key => $value) {
            $timesheets_array[] = array($key, $value);
        }

        for ($i = 0; $i <= $days_of_month; $i++) {
            $title = "";
            if ($i === 1) {
                $title = "01";
            } else if ($i === 5) {
                $title = "05";
            } else if ($i === 10) {
                $title = "10";
            } else if ($i === 15) {
                $title = "15";
            } else if ($i === 20) {
                $title = "20";
            } else if ($i === 25) {
                $title = "25";
            } else if ($i === 30) {
                $title = "30";
            }
            $ticks[] = array($i, $title);
        }

        $view_data["timesheets"] = json_encode($timesheets_array);
        $view_data["ticks"] = json_encode($ticks);
        $ci->load->view("projects/timesheets/timesheet_wedget", $view_data, $return_as_data);
    }

}


/**
 * get timecard statistics
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('timecard_statistics_widget')) {

    function timecard_statistics_widget($return_as_data = false) {
        $ci = get_instance();

        $timecards = array();
        $timecards_array = array();

        $ticks = array();

        $today = get_my_local_time("Y-m-d");
        $start_date = date("Y-m-", strtotime($today)) . "01";
        $end_date = date("Y-m-t", strtotime($today));
        $options = array("start_date" => $start_date, "end_date" => $end_date, "user_id" => $ci->login_user->id);
        $timesheets_result = $ci->Attendance_model->get_timecard_statistics($options)->result();
        $days_of_month = date("t", strtotime($today));

        for ($i = 0; $i <= $days_of_month; $i++) {
            $timecards[$i] = 0;
        }

        foreach ($timesheets_result as $value) {
            $timecards[$value->day * 1] = $value->total_sec / 60;
        }

        foreach ($timecards as $key => $value) {
            $timecards_array[] = array($key, $value);
        }

        for ($i = 0; $i <= $days_of_month; $i++) {
            $title = "";
            if ($i === 1) {
                $title = "01";
            } else if ($i === 5) {
                $title = "05";
            } else if ($i === 10) {
                $title = "10";
            } else if ($i === 15) {
                $title = "15";
            } else if ($i === 20) {
                $title = "20";
            } else if ($i === 25) {
                $title = "25";
            } else if ($i === 30) {
                $title = "30";
            }
            $ticks[] = array($i, $title);
        }

        $view_data["timecards"] = json_encode($timecards_array);
        $view_data["ticks"] = json_encode($ticks);
        $ci->load->view("attendance/timecard_statistics", $view_data, $return_as_data);
    }

}


/**
 * get count of clocked in /out users widget
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('count_clock_status_widget')) {

    function count_clock_status_widget($return_as_data = false) {
        $ci = get_instance();
        $info = $ci->Attendance_model->count_clock_status();
        $view_data["members_clocked_in"] = $info->members_clocked_in ? $info->members_clocked_in : 0;
        $view_data["members_clocked_out"] = $info->members_clocked_out ? $info->members_clocked_out : 0;
        $ci->load->view("attendance/count_clock_status_widget", $view_data, $return_as_data);
    }

}


/**
 * get project count status widteg
 * @param integer $user_id
 * @param boolean $return_as_data
 * @return html
 */


if (!function_exists('count_sales_widget')) {

    function count_sales_widget($user_id = 0, $return_as_data = false) {
        $ci = get_instance();
        
        $info = $ci->db->query("SELECT COUNT(*) as total FROM sales_payments WHERE paid = 'PAID' AND deleted = 0")->row();
        $amount = $ci->db->query("SELECT SUM(amount) as total FROM sales_payments WHERE paid = 'PAID' AND deleted = 0")->row();

        $invoices = $ci->db->query("SELECT COUNT(*) as total FROM sales_invoices WHERE deleted = 0")->row();
        $invoices_total = $ci->db->query("SELECT SUM(amount) as total FROM sales_invoices WHERE deleted = 0")->row();
        $view_data["total"] = $info->total;
        $view_data["total_amount"] = $amount->total;

        $view_data["inv_total"] = $invoices->total;
        $view_data["inv_total_amount"] = $invoices_total->total;
        $ci->load->view("widget/sales/total", $view_data, $return_as_data);
    }

}


if(!function_exists('pending_invoices')){

    function pending_invoices(){
        $CI = get_instance();

        $invoices = $CI->db->query("SELECT sales_invoices.code,sales_invoices.amount,sales_invoices.end_date,master_customers.name FROM sales_invoices  JOIN master_customers ON master_customers.id = sales_invoices.fid_cust  WHERE sales_invoices.paid = 'Not Paid' AND sales_invoices.status = 'posting' and sales_invoices.deleted = 0 LIMIT 5");

        $view_data['invoices'] = $invoices->result();
        $CI->load->view("widget/invoices/pending", $view_data);
    }
}



if(!function_exists('aging_receivable_widget')){

    function aging_receivable_widget(){
        $CI = get_instance();

        $start =  date("Y")."-01-01";
        $end = date("Y-m-d");

        if(isset($_GET['start']) && isset($_GET['end'])){

            $start = $_GET['start'];
            $end = $_GET['end'];
        }

        $view_data['date_range'] = format_to_date($start)." - ".format_to_date($end);
        $view_data['aging_report'] = $CI->db->query("SELECT
            *,
            '7day' AS type 
        FROM
            sales_invoices 
        WHERE
            end_date >= now( ) AND paid = 'Not Paid'
            AND end_date <= date_add( now( ), INTERVAL + 7 DAY ) UNION SELECT *, '7-14day' AS type FROM sales_invoices WHERE end_date > date_add( now( ), INTERVAL + 7 DAY ) AND paid = 'Not Paid'
            AND end_date <= date_add( now( ), INTERVAL + 14 DAY ) UNION SELECT *, '14-30day' AS type FROM sales_invoices WHERE end_date > date_add( now( ), INTERVAL + 14 DAY ) AND paid = 'Not Paid'

            AND end_date <= date_add( now( ), INTERVAL + 30 DAY ) UNION SELECT *, '>30day' AS type FROM sales_invoices WHERE end_date > date_add( now( ), INTERVAL + 30 DAY ) AND paid = 'Not Paid' AND inv_date >= ('$start') AND inv_date <= ('$end') LIMIT 3");
       
        
        $CI->load->view("widget/sales/aging_receivable_widget", $view_data);
    }
}


if(!function_exists('aging_payable_widget')){

    function aging_payable_widget(){
        $CI = get_instance();

        $start =  date("Y")."-01-01";
        $end = date("Y-m-d");

        if(isset($_GET['start']) && isset($_GET['end'])){

            $start = $_GET['start'];
            $end = $_GET['end'];
        }

        $view_data['date_range'] = format_to_date($start)." - ".format_to_date($end);
        $view_data['aging_report'] = $CI->db->query("SELECT
            *,
            '7day' AS type 
        FROM
            purchase_invoices 
        WHERE
            end_date >= now( ) AND paid = 'Not Paid'
            AND end_date <= date_add( now( ), INTERVAL + 7 DAY ) UNION SELECT *, '7-14day' AS type FROM purchase_invoices WHERE end_date > date_add( now( ), INTERVAL + 7 DAY )  AND paid = 'Not Paid'
            AND end_date <= date_add( now( ), INTERVAL + 14 DAY ) UNION SELECT *, '14-30day' AS type FROM purchase_invoices WHERE end_date > date_add( now( ), INTERVAL + 14 DAY )  AND paid = 'Not Paid'
            AND end_date <= date_add( now( ), INTERVAL + 30 DAY ) UNION SELECT *, '>30day' AS type FROM purchase_invoices WHERE end_date > date_add( now( ), INTERVAL + 30 DAY ) AND  paid = 'Not Paid' AND inv_date >= ('$start') AND inv_date <= ('$end') LIMIT 3");
       
        
        $CI->load->view("widget/sales/aging_payable_widget", $view_data);
    }
}






/**
 * count total time widget
 * @param integer $user_id
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('count_total_time_widget')) {

    function count_total_time_widget($user_id = 0, $return_as_data = false) {
        $ci = get_instance();
        $today = get_my_local_time("Y-m-d");
        $start_date = date("Y-m-", strtotime($today)) . "01";
        $end_date = date("Y-m-t", strtotime($today));
        $options = array("start_date" => $start_date, "end_date" => $end_date, "user_id" => $user_id ? $user_id : $ci->login_user->id);
        $info = $ci->Attendance_model->count_total_time($options);
        $view_data["total_hours_worked"] = to_decimal_format($info->timecard_total / 60 / 60);
        $view_data["total_project_hours"] = to_decimal_format($info->timesheet_total / 60 / 60);
        $ci->load->view("attendance/total_time_widget", $view_data, $return_as_data);
    }

}


/**
 * get social links widget
 * @param object $weblinks
 * @param boolean $return_as_data
 * @return html
 */
if (!function_exists('social_links_widget')) {

    function social_links_widget($weblinks, $return_as_data = false) {
        $ci = get_instance();
        $view_data["weblinks"] = $weblinks;

        $ci->load->view("users/social_links_widget", $view_data, $return_as_data);
    }

}


/**
 * count unread messages
 * @return number
 */
if (!function_exists('count_unread_message')) {

    function count_unread_message() {
        $ci = get_instance();
        return $ci->Messages_model->count_unread_message($ci->login_user->id);
    }

}


/**
 * count new tickets
 * @param string $ticket_types
 * @return number
 */
if (!function_exists('count_new_tickets')) {

    function count_new_tickets($ticket_types = "") {
        $ci = get_instance();
        return $ci->Tickets_model->count_new_tickets($ticket_types);
    }

}