<?php

/**
 * use this to print link location
 *
 * @param string $uri
 * @return print url
 */

if (!function_exists('build_child')) {
    function build_child($oldID,$exclude = array()){
            $ci = get_instance();
            $tempTree = "";
            global $exclude, $depth;
            $child_query =  $ci->db->query("SELECT * FROM acc_coa_type WHERE parental = $oldID ORDER BY account_number ASC" );

            foreach($child_query->result() as $row){
                if($row->id != $row->parental){
                    for($c=0;$c<$depth;$c++ ){
                        $tempTree .= "<tr></td>OKE</td></tr>";
                    }
                   $tempTree .= "<tr><td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" . $row->account_name . "</td></tr>";
                   $depth++;          // Incriment depth b/c we're building this child's child tree  (complicated yet???)
                   $tempTree .= build_child($row->id);          // Add to the temporary local tree
                   $depth--;          // Decrement depth b/c we're done building the child's child tree.
                   // array_push($exclude, $row->id); 

                }
            }
             return $tempTree.""; 
    }

}
if (!function_exists('echo_uri')) {

    function echo_uri($uri = "") {
        echo get_uri($uri);
    }

}

/**
 * prepare uri
 * 
 * @param string $uri
 * @return full url 
 */
if (!function_exists('get_uri')) {

    function get_uri($uri = "") {
        $ci = get_instance();
        $index_page = $ci->config->item('index_page');
        return base_url($index_page . '/' . $uri);
    }

}

/**
 * use this to print file path
 * 
 * @param string $uri
 * @return full url of the given file path
 */
if (!function_exists('get_file_uri')) {

    function get_file_uri($uri = "") {
        return base_url($uri);
    }

}

/**
 * get the url of user avatar
 * 
 * @param string $image_name
 * @return url of the avatar of given image reference
 */
if (!function_exists('get_avatar')) {

    function get_avatar($image_name = "") {
        if ($image_name === "system_bot") {
            return base_url("assets/images/avatar-bot.jpg");
        } else if ($image_name) {
            return base_url(get_setting("profile_image_path")) . "/" . $image_name;
        } else {
            return base_url("assets/images/avatar.jpg");
        }
    }

}

/**
 * link the css files 
 * 
 * @param array $array
 * @return print css links
 */
if (!function_exists('load_css')) {

    function load_css(array $array) {
        foreach ($array as $uri) {
            echo "<link rel='stylesheet' type='text/css' href='" . base_url($uri) . "' />";
        }
    }

}


/**
 * link the javascript files 
 * 
 * @param array $array
 * @return print js links
 */
if (!function_exists('load_js')) {

    function load_js(array $array) {
        foreach ($array as $uri) {
            echo "<script type='text/javascript'  src='" . base_url($uri) . "'></script>";
        }
    }

}

/**
 * check the array key and return the value 
 * 
 * @param array $array
 * @return extract array value safely
 */
if (!function_exists('get_array_value')) {

    function get_array_value(array $array, $key) {
        if (array_key_exists($key, $array)) {
            return $array[$key];
        }
    }

}

/**
 * prepare a anchor tag for any js request
 * 
 * @param string $title
 * @param array $attributes
 * @return html link of anchor tag
 */
if (!function_exists('js_anchor')) {

    function js_anchor($title = '', $attributes = '') {
        $title = (string) $title;
        $html_attributes = "";

        if (is_array($attributes)) {
            foreach ($attributes as $key => $value) {
                $html_attributes .= ' ' . $key . '="' . $value . '"';
            }
        }

        return '<a href="#"' . $html_attributes . '>' . $title . '</a>';
    }

}


/**
 * prepare a anchor tag for modal 
 * 
 * @param string $url
 * @param string $title
 * @param array $attributes
 * @return html link of anchor tag
 */
if (!function_exists('modal_anchor')) {

    function modal_anchor($url, $title = '', $attributes = '') {
        $attributes["data-act"] = "ajax-modal";
        if (get_array_value($attributes, "data-modal-title")) {
            $attributes["data-title"] = get_array_value($attributes, "data-modal-title");
        } else {
            $attributes["data-title"] = get_array_value($attributes, "title");
        }
        $attributes["data-action-url"] = $url;

        return js_anchor($title, $attributes);
    }

}

if (!function_exists('modal_anchor_big')) {

    function modal_anchor_big($url, $title = '', $attributes = '') {
        $attributes["data-act"] = "ajax-modal";
        if (get_array_value($attributes, "data-modal-title")) {
            $attributes["data-title"] = get_array_value($attributes, "data-modal-title");
        } else {
            $attributes["data-title"] = get_array_value($attributes, "title");
        }
        $attributes["data-action-url"] = $url;

        return js_anchor($title, $attributes);
    }

}

/**
 * prepare a anchor tag for ajax request
 * 
 * @param string $url
 * @param string $title
 * @param array $attributes
 * @return html link of anchor tag
 */
if (!function_exists('ajax_anchor')) {

    function ajax_anchor($url, $title = '', $attributes = '') {
        $attributes["data-act"] = "ajax-request";
        $attributes["data-action-url"] = $url;
        return js_anchor($title, $attributes);
    }

}

/**
 * get the selected menu 
 * 
 * @param string $url
 * @param array $submenu
 * @return string "active" indecating the active page
 */
if (!function_exists('active_menu')) {

    function active_menu($menu = "", $submenu = array()) {
        $ci = & get_instance();
        $controller_name = strtolower(get_class($ci));

        //compare with controller name. if not found, check in submenu values
        if ($menu === $controller_name) {
            return "active";
        } else if (count($submenu)) {
            foreach ($submenu as $sub_menu) {
                if (get_array_value($sub_menu, "slug") === $controller_name) {
                    return "active";
                } else if (get_array_value($sub_menu, "category") === $controller_name) {
                    return "active";
                }
            }
        }
    }

}

/**
 * get the selected submenu
 * 
 * @param string $submenu
 * @param boolean $is_controller
 * @return string "active" indecating the active sub page
 */
if (!function_exists('active_submenu')) {

    function active_submenu($submenu = "", $is_controller = false) {
        $ci = & get_instance();
        //if submenu is a controller then compare with controller name, otherwise compare with method name
        if ($is_controller && $submenu === strtolower(get_class($ci))) {
            return "active";
        } else if ($submenu === strtolower($ci->router->method)) {
            return "active";
        }
    }

}

/**
 * get the defined config value by a key
 * @param string $key
 * @return config value
 */
if (!function_exists('get_setting')) {

    function get_setting($key = "") {
        $ci = get_instance();
        return $ci->config->item($key);
    }

}



/**
 * check if a string starts with a specified sting
 * 
 * @param string $string
 * @param string $needle
 * @return true/false
 */
if (!function_exists('starts_with')) {

    function starts_with($string, $needle) {
        $string = $string;
        return $needle === "" || strrpos($string, $needle, -strlen($string)) !== false;
    }

}

/**
 * check if a string ends with a specified sting
 * 
 * @param string $string
 * @param string $needle
 * @return true/false
 */
if (!function_exists('ends_with')) {

    function ends_with($string, $needle) {
        return $needle === "" || (($temp = strlen($string) - strlen($string)) >= 0 && strpos($string, $needle, $temp) !== false);
    }

}

/**
 * create a encoded id for sequrity pupose 
 * 
 * @param string $id
 * @param string $salt
 * @return endoded value
 */
if (!function_exists('encode_id')) {

    function encode_id($id, $salt) {
        $ci = get_instance();
        $id = $ci->encrypt->encode($id . $salt);
        $id = str_replace("=", "~", $id);
        $id = str_replace("+", "_", $id);
        $id = str_replace("/", "-", $id);
        return $id;
    }

}


/**
 * decode the id which made by encode_id()
 * 
 * @param string $id
 * @param string $salt
 * @return decoded value
 */
if (!function_exists('decode_id')) {

    function decode_id($id, $salt) {
        $ci = get_instance();
        $id = str_replace("_", "+", $id);
        $id = str_replace("~", "=", $id);
        $id = str_replace("-", "/", $id);
        $id = $ci->encrypt->decode($id);
        if ($id && strpos($id, $salt) !== false) {
            return str_replace($salt, "", $id);
        }
    }

}

/**
 * decode html data which submited using a encode method of encodeAjaxPostData() function
 * 
 * @param string $html
 * @return htmle
 */
if (!function_exists('decode_ajax_post_data')) {

    function decode_ajax_post_data($html) {
        $html = str_replace("~", "=", $html);
        $html = str_replace("^", "&", $html);
        return $html;
    }

}

/**
 * check if fields has any value or not. and generate a error message for null value
 * 
 * @param array $fields
 * @return throw error for bad value
 */
if (!function_exists('check_required_hidden_fields')) {

    function check_required_hidden_fields($fields = array()) {
        $has_error = false;
        foreach ($fields as $field) {
            if (!$field) {
                $has_error = true;
            }
        }
        if ($has_error) {
            echo json_encode(array("success" => false, 'message' => lang('something_went_wrong')));
            exit();
        }
    }

}

/**
 * convert simple link text to clickable link
 * @param string $text
 * @return html link
 */
if (!function_exists('link_it')) {

    function link_it($text) {
        return preg_replace('@(https?://([-\w\.]+[-\w])+(:\d+)?(/([\w/_\.#-]*(\?\S+)?[^\.\s])?)?)@', '<a href="$1" target="_blank">$1</a>', $text);
    }

}



/**
 * send mail
 * 
 * @param string $to
 * @param string $subject
 * @param string $message
 * @param array $optoins
 * @return true/false
 */
if (!function_exists('send_app_mail')) {

    function send_app_mail($to, $subject, $message, $optoins = array()) {
        $email_config = Array(
            'charset' => 'utf-8',
            'mailtype' => 'html'
        );

        //check mail sending method from settings
        if (get_setting("email_protocol") === "smtp") {
            $email_config["protocol"] = "smtp";
            $email_config["smtp_host"] = get_setting("email_smtp_host");
            $email_config["smtp_port"] = get_setting("email_smtp_port");
            $email_config["smtp_user"] = get_setting("email_smtp_user");
            $email_config["smtp_pass"] = get_setting("email_smtp_pass");
            $email_config["smtp_crypto"] = get_setting("email_smtp_security_type");
            if (!$email_config["smtp_crypto"]) {
                $email_config["smtp_crypto"] = "tls";
            }
        }

        $ci = get_instance();
        $ci->load->library('email', $email_config);
        $ci->email->clear();
        $ci->email->set_newline("\r\n");
        $ci->email->from(get_setting("email_sent_from_address"), get_setting("email_sent_from_name"));
        $ci->email->to($to);
        $ci->email->subject($subject);
        $ci->email->message($message);

        //add attachment
        $attachments = get_array_value($optoins, "attachments");
        if (is_array($attachments)) {
            foreach ($attachments as $value) {
                $file_path = get_array_value($value, "file_path");
                $file_name = get_array_value($value, "file_name");
                $ci->email->attach(trim($file_path), "attachment", $file_name);
            }
        }

        //check cc
        $cc = get_array_value($optoins, "cc");
        if ($cc) {
            $ci->email->cc($cc);
        }

        //check bcc
        $bcc = get_array_value($optoins, "bcc");
        if ($bcc) {
            $ci->email->bcc($bcc);
        }

        //send email
        if ($ci->email->send()) {
            return true;
        } else {
            //show error message in none production version
            if (ENVIRONMENT !== 'production') {
                show_error($ci->email->print_debugger());
            }
            return false;
        }
    }

}


/**
 * get users ip address
 * 
 * @return ip
 */
if (!function_exists('get_real_ip')) {

    function get_real_ip() {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }

}

/**
 * check if it's localhost
 * 
 * @return boolean
 */
if (!function_exists('is_localhost')) {

    function is_localhost() {
        $known_localhost_ip = array(
            '127.0.0.1',
            '::1'
        );
        if (in_array(get_real_ip(), $known_localhost_ip)) {
            return true;
        }
    }

}


/**
 * convert string to url
 * 
 * @param string $address
 * @return url
 */
if (!function_exists('to_url')) {

    function to_url($address = "") {
        if (strpos($address, 'http://') === false && strpos($address, 'https://') === false) {
            $address = "http://" . $address;
        }
        return $address;
    }

}

/**
 * validate post data using the codeigniter's form validation method
 * 
 * @param string $address
 * @return throw error if foind any inconsistancy
 */
if (!function_exists('validate_submitted_data')) {

    function validate_submitted_data($fields = array()) {
        $ci = get_instance();
        foreach ($fields as $field_name => $requirement) {
            $ci->form_validation->set_rules($field_name, $field_name, $requirement);
        }

        if ($ci->form_validation->run() == FALSE) {
            if (ENVIRONMENT === 'production') {
                $message = lang('something_went_wrong');
            } else {
                $message = validation_errors();
            }
            echo json_encode(array("success" => false, 'message' => $message));
            exit();
        }
    }

}

/**
 * team members profile anchor. only clickable to team members
 * client's will see a none clickable link
 * 
 * @param string $id
 * @param string $name
 * @param array $attributes
 * @return html link
 */
if (!function_exists('get_team_member_profile_link')) {

    function get_team_member_profile_link($id = 0, $name = "", $attributes = array()) {
        $ci = get_instance();
        if ($ci->login_user->user_type === "staff") {
            return anchor("employees/view/" . $id, $name, $attributes);
        } else {
            return js_anchor($name, $attributes);
        }
    }

}

if (!function_exists('get_vendor_profile_link')) {

    function get_vendor_profile_link($id = 0, $name = "", $attributes = array()) {
        $ci = get_instance();
        if ($ci->login_user->user_type === "staff") {
            return anchor("vendor/view/" . $id, $name, $attributes);
        } else {
            return js_anchor($name, $attributes);
        }
    }

}


/**
 * team members profile anchor. only clickable to team members
 * client's will see a none clickable link
 * 
 * @param string $id
 * @param string $name
 * @param array $attributes
 * @return html link
 */
if (!function_exists('get_client_contact_profile_link')) {

    function get_client_contact_profile_link($id = 0, $name = "", $attributes = array()) {
        return anchor("clients/contact_profile/" . $id, $name, $attributes);
    }

}


/**
 * return a colorful label accroding to invoice status
 * 
 * @param Object $invoice_info
 * @return html
 */
if (!function_exists('get_invoice_status_label')) {

    function get_invoice_status_label($invoice_info, $return_html = true) {
        $invoice_status_class = "label-default";
        $status = "not_paid";
        $now = get_my_local_time("Y-m-d");
        // if ($invoice_info->status != "draft" && $invoice_info->due_date < $now && $invoice_info->payment_received < $invoice_info->invoice_value) {
        //     $invoice_status_class = "label-danger";
        //     $status = "overdue";
        // } else if ($invoice_info->status !== "draft" && $invoice_info->payment_received <= 0) {
        //     $invoice_status_class = "label-warning";
        //     $status = "not_paid";
        // } else if ($invoice_info->payment_received * 1 && $invoice_info->payment_received >= $invoice_info->invoice_value) {
        //     $invoice_status_class = "label-success";
        //     $status = "fully_paid";
        // } else if ($invoice_info->payment_received > 0 && $invoice_info->payment_received < $invoice_info->invoice_value) {
        //     $invoice_status_class = "label-primary";
        //     $status = "partially_paid";
        // } else if ($invoice_info->status === "draft") {
        //     $invoice_status_class = "label-default";
        //     $status = "draft";
        // }

        $invoice_status = "<span class='label $invoice_status_class large'>" . lang($status) . "</span>";
        if ($return_html) {
            return $invoice_status;
        } else {
            return $status;
        }
    }

}

if (!function_exists('get_quotation_status_label')) {

    function get_quotation_status_label($invoice_info, $return_html = true) {
        $invoice_status_class = "label-warning";
        $status = "draft";
        $now = get_my_local_time("Y-m-d");
        // if ($invoice_info->status != "draft" && $invoice_info->exp_date < $now ) {
        //     $invoice_status_class = "label-danger";
        //     $status = "overdue";
        // } else if ($invoice_info->status !== "draft" && $invoice_info->payment_received <= 0) {
        //     $invoice_status_class = "label-warning";
        //     $status = "not_paid";
        // } else if ($invoice_info->payment_received * 1 && $invoice_info->payment_received >= $invoice_info->invoice_value) {
        //     $invoice_status_class = "label-success";
        //     $status = "fully_paid";
        // } else if ($invoice_info->payment_received > 0 && $invoice_info->payment_received < $invoice_info->invoice_value) {
        //     $invoice_status_class = "label-primary";
        //     $status = "partially_paid";
        // } else if ($invoice_info->status === "draft") {
        //     $invoice_status_class = "label-default";
        //     $status = "draft";
        // }
        if(is_array($invoice_info)){
            if ($invoice_info->status == "draft" ) {
                $invoice_status_class = "label-warning";
                $status = "Draft";
            } else if ($invoice_info->status == "sent") {
                $invoice_status_class   = "label-success";
                $status = "Sudah Terkirim";

            }
        }

        $invoice_status = "<span class='label $invoice_status_class large'>" . $status . "</span>";
        if ($return_html) {
            return $invoice_status;
        } else {
            return $status;
        }
    }

}

if (!function_exists('get_order_status_label')) {

    function get_order_status_label($invoice_info, $return_html = true) {
        $invoice_status_class = "label-default";
        $status = "draft";
        $now = get_my_local_time("Y-m-d");
       
        $invoice_status = "<span class='label $invoice_status_class large'>" . $status . "</span>";
        if ($return_html) {
            return $invoice_status;
        } else {
            return $status;
        }
    }

}



/**
 * get all data to make an invoice
 * 
 * @param Int $invoice_id
 * @return array
 */
if (!function_exists('get_invoice_making_data')) {

    function get_invoice_making_data($invoice_id) {
        $ci = get_instance();
        $invoice_info = $ci->Invoices_model->get_details(array("id" => $invoice_id))->row();
        if ($invoice_info) {
            $data['invoice_info'] = $invoice_info;
            $data['client_info'] = $ci->Clients_model->get_one($data['invoice_info']->client_id);
            $data['invoice_items'] = $ci->Invoice_items_model->get_details(array("invoice_id" => $invoice_id))->result();
            $data['invoice_status_label'] = get_invoice_status_label($invoice_info);
            $data["invoice_total_summary"] = $ci->Invoices_model->get_invoice_total_summary($invoice_id);

            $data['invoice_info']->custom_fields = $ci->Custom_field_values_model->get_details(array("related_to_type" => "invoices", "show_in_invoice" => true, "related_to_id" => $invoice_id))->result();
            $data['client_info']->custom_fields = $ci->Custom_field_values_model->get_details(array("related_to_type" => "clients", "show_in_invoice" => true, "related_to_id" => $data['invoice_info']->client_id))->result();
            return $data;
        }
    }

}

if (!function_exists('get_s_invoices_making_data')) {

    function get_s_invoices_making_data($invoice_id) {
        $ci = get_instance();
        $invoice_info = $ci->Sales_Invoices_model->get_details(array("id" => $invoice_id))->row();
        if ($invoice_info) {
            $data['invoice_info'] = $invoice_info;
            $data['order_info'] = $ci->Sales_Order_model->get_details(array("id" => $data['invoice_info']->fid_order))->row();
            
            $data['client_info'] = $ci->Master_Customers_model->get_one($data['invoice_info']->fid_cust);
            $data['invoice_items'] = $ci->Sales_InvoicesItems_model->get_details(array("fid_invoices" => $invoice_id))->result();
            // $data['invoice_status_label'] = get_invoices_status_label($invoice_info);
            $data["invoice_total_summary"] = $ci->Sales_Invoices_model->get_invoices_total_summary($invoice_id);
            return $data;
        }
    }

}

if (!function_exists('get_s_payment_making_data')) {

    function get_s_payment_making_data($invoice_id) {
        $ci = get_instance();
        $data['payment_info'] = $ci->Sales_Payments_model->get_details( array('id' => $invoice_id))->row();
        $invoice_info = $ci->Sales_Invoices_model->get_details(array("id" => $data['payment_info']->fid_inv))->row();
        if ($invoice_info) {
            $data['invoice_info'] = $invoice_info;
            $data['order_info'] = $ci->Sales_Order_model->get_details(array("id" => $data['invoice_info']->fid_order))->row();
            
            $data['client_info'] = $ci->Master_Customers_model->get_one($data['invoice_info']->fid_cust);
            $data['invoice_items'] = $ci->Sales_InvoicesItems_model->get_details(array("fid_invoices" => $data['payment_info']->fid_inv))->result();
            // $data['invoice_status_label'] = get_invoices_status_label($invoice_info);
            $data["invoice_total_summary"] = $ci->Sales_Invoices_model->get_invoices_total_summary($data['payment_info']->fid_inv);
            return $data;
        }
    }

}

if (!function_exists('get_p_payment_making_data')) {

    function get_p_payment_making_data($invoice_id) {
        $ci = get_instance();
        $data['payment_info'] = $ci->Purchase_Payments_model->get_details( array('id' => $invoice_id))->row();
        $invoice_info = $ci->Purchase_Invoices_model->get_details(array("id" => $data['payment_info']->fid_inv))->row();
        if ($invoice_info) {
            $data['invoice_info'] = $invoice_info;
            $data['order_info'] = $ci->Purchase_Order_model->get_details(array("id" => $data['invoice_info']->fid_order))->row();
            
            $data['client_info'] = $ci->Master_Vendors_model->get_one($data['invoice_info']->fid_cust);
            $data['invoice_items'] = $ci->Purchase_InvoicesItems_model->get_details(array("fid_invoices" => $data['payment_info']->fid_inv))->result();
            // $data['invoice_status_label'] = get_invoices_status_label($invoice_info);
            $data["invoice_total_summary"] = $ci->Purchase_Invoices_model->get_invoices_total_summary($data['payment_info']->fid_inv);
            return $data;
        }
    }

}

if (!function_exists('get_p_invoices_making_data')) {

    function get_p_invoices_making_data($invoice_id) {
        $ci = get_instance();
        $invoice_info = $ci->Purchase_Invoices_model->get_details(array("id" => $invoice_id))->row();
        if ($invoice_info) {
            $data['invoice_info'] = $invoice_info;
            $data["order_info"] = $ci->Purchase_Order_model->get_details(array("id" => $data['invoice_info']->fid_order ))->row();
            
            $data['client_info'] = $ci->Master_Vendors_model->get_one($data['invoice_info']->fid_cust);
            $data['invoice_items'] = $ci->Purchase_InvoicesItems_model->get_details(array("invoice_id" => $invoice_id))->result();
            // $data['invoice_status_label'] = get_invoices_status_label($invoice_info);
            $data["invoice_total_summary"] = $ci->Purchase_Invoices_model->get_invoices_total_summary($invoice_id);
            return $data;
        }
    }

}

if (!function_exists('get_quotation_making_data')) {

    function get_quotation_making_data($quotation_id) {
        $ci = get_instance();
        $quot_id = $ci->Sales_Quotation_model->get_details(array("id" => $quotation_id))->row();
        if ($quot_id) {
            $data['invoice_info'] = $quot_id;
            $data['client_info'] = $ci->Master_Customers_model->get_one($data['invoice_info']->fid_cust);
            $data['invoice_items'] = $ci->Sales_QuotationItems_model->get_details(array("fid_quotation" => $quotation_id))->result();
            $data['invoice_status_label'] = get_quotation_status_label($quotation_id);
            $data["invoice_total_summary"] = $ci->Sales_Quotation_model->get_quotation_total_summary($quotation_id);

            return $data;
        }
    }

}

if (!function_exists('get_request_making_data')) {

    function get_request_making_data($quotation_id) {
        $ci = get_instance();
        $quot_id = $ci->Purchase_Request_model->get_details(array("id" => $quotation_id))->row();
        if ($quot_id) {
            $data['invoice_info'] = $quot_id;
            $data['client_info'] = $ci->Master_Vendors_model->get_one($data['invoice_info']->fid_vendor);
            $data['invoice_items'] = $ci->Purchase_RequestItems_model->get_details(array("fid_quotation" => $quotation_id))->result();
            $data['invoice_status_label'] = get_quotation_status_label($quotation_id);
            $data["invoice_total_summary"] = $ci->Purchase_Request_model->get_request_total_summary($quotation_id);

            return $data;
        }
    }

}

if (!function_exists('get_order_making_data')) {

    function get_order_making_data($order_id) {
        $ci = get_instance();
        $quot_id = $ci->Sales_Order_model->get_details(array("id" => $order_id))->row();
        if ($quot_id) {
            $data['invoice_info'] = $quot_id;
            $data['quot_info'] = $ci->Sales_Quotation_model->get_details(array("id" => $data['invoice_info']->fid_quot))->row();
            $data['client_info'] = $ci->Master_Customers_model->get_one($data['invoice_info']->fid_cust);
            $data['invoice_items'] = $ci->Sales_OrderItems_model->get_details(array("fid_order" => $order_id))->result();
            $data['invoice_status_label'] = get_order_status_label($order_id);
            $data["invoice_total_summary"] = $ci->Sales_Order_model->get_order_total_summary($order_id);

            return $data;
        }
    }

}

if (!function_exists('get_p_order_making_data')) {

    function get_p_order_making_data($order_id) {
        $ci = get_instance();
        $quot_id = $ci->Purchase_Order_model->get_details(array("id" => $order_id))->row();
        if ($quot_id) {
            $data['invoice_info'] = $quot_id;
            $data["quot_info"] = $ci->Purchase_Request_model->get_details(array("id" => $data['invoice_info']->fid_quot ))->row();
            $data['client_info'] = $ci->Master_Vendors_model->get_one($data['invoice_info']->fid_cust);
            $data['invoice_items'] = $ci->Purchase_OrderItems_model->get_details(array("fid_order" => $order_id))->result();
            $data['invoice_status_label'] = get_order_status_label($order_id);
            $data["invoice_total_summary"] = $ci->Purchase_Order_model->get_order_total_summary($order_id);

            return $data;
        }
    }

}

/**
 * get all data to make an invoice
 * 
 * @param Invoice making data $invoice_data
 * @return array
 */
if (!function_exists('prepare_invoice_pdf')) {

    function prepare_invoice_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("invoices/invoice_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $pdf_file_name = lang("invoice") . "-" . $invoice_info->id . ".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}

if (!function_exists('prepare_report_pdf')) {

    function prepare_report_pdf($invoice_data,$view, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {


            $html = $ci->load->view($view, $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $pdf_file_name = "REPORT-" .date("Y-m-d") . ".pdf";

            // if ($mode === "download") {
            //     $ci->pdf->Output($pdf_file_name, "D");
            
            // } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            // } else if ($mode === "html") {
            //     return $html;
            // }
        }
    }

}

if (!function_exists('print_pdf')) {

    function print_pdf($views,$data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($data) {

            $data["mode"] = $mode;

            $html = $ci->load->view($views, $data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $pdf_file_name =  "report".date("Y-m-d").".pdf.";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}



if (!function_exists('prepare_s_invoice_pdf')) {

    function prepare_s_invoice_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("invoice/inv_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $pdf_file_name =  "INV#" . str_replace("/", "_", $invoice_info->code) . ".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}

if (!function_exists('prepare_s_payment_pdf')) {

    function prepare_s_payment_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("payments/payment_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $payment_info = get_array_value($invoice_data, "payment_info");
            $pdf_file_name =  "SALES_PAY#" . str_replace("/", "_", $payment_info->code) . ".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}

if (!function_exists('prepare_p_payment_pdf')) {

    function prepare_p_payment_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("payments/payment_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $payment_info = get_array_value($invoice_data, "payment_info");
            $pdf_file_name =  "PURCHASE_PAY#" . str_replace("/", "_", $payment_info->code) . ".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}

if (!function_exists('prepare_p_invoice_pdf')) {

    function prepare_p_invoice_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("invoice/inv_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $pdf_file_name =  "INV#" . str_replace("/", "_", $invoice_info->code) . ".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}

if (!function_exists('prepare_quotation_pdf')) {

    function prepare_quotation_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("quotation/quotation_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $pdf_file_name = "QUOT_". str_replace("/", "_", $invoice_info->code). ".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}



if (!function_exists('prepare_request_pdf')) {

    function prepare_request_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("request/request_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $pdf_file_name = "REQ". str_replace("/", "_", $invoice_info->code). ".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}

if (!function_exists('prepare_order_pdf')) {

    function prepare_order_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("order/order_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $pdf_file_name = "RAN_ORDERS#" .stripslashes($invoice_info->id).".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . stripslashes($pdf_file_name);
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

}
if (!function_exists('prepare_p_order_pdf')) {

    function prepare_p_order_pdf($invoice_data, $mode = "download") {
        $ci = get_instance();
        $ci->load->library('pdf');
        $ci->pdf->setPrintHeader(false);
        $ci->pdf->setPrintFooter(false);
        $ci->pdf->SetCellPadding(1.5);
        $ci->pdf->setImageScale(1.42);
        $ci->pdf->AddPage();
        $ci->pdf->SetFontSize(10);

        if ($invoice_data) {

            $invoice_data["mode"] = $mode;

            $html = $ci->load->view("order/order_pdf", $invoice_data, true);

            if ($mode != "html") {
                $ci->pdf->writeHTML($html, true, false, true, false, '');
            }

            $invoice_info = get_array_value($invoice_data, "invoice_info");
            $pdf_file_name = "ORDER#" .str_replace("/", "_", $invoice_info->code).".pdf";

            if ($mode === "download") {
                $ci->pdf->Output($pdf_file_name, "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . $pdf_file_name;
                $ci->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $ci->pdf->Output($pdf_file_name, "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }
}

/**
 * 
 * get invoice number
 * @param Int $invoice_id
 * @return string
 */
if (!function_exists('get_invoice_id')) {

    function get_invoice_id($invoice_id) {
        $prefix = get_setting("invoice_prefix");
        $prefix = $prefix ? $prefix : strtoupper(lang("invoice")) . " #";
        return $prefix . $invoice_id;
    }

}

if (!function_exists('get_quotation_id')) {

    function get_quotation_id($id) {
        $prefix = get_setting("quotation_prefix");
        $prefix = $prefix ? $prefix : strtoupper("") . " #";
        return $prefix . $id;
    }

}

if (!function_exists('get_order_id')) {

    function get_order_id($id) {
        $prefix = get_setting("order_prefix");
        $prefix = $prefix ? $prefix : strtoupper("") . " #";
        return $prefix . $id;
    }

}

if (!function_exists('get_request_id')) {

    function get_request_id($id) {
        $prefix = get_setting("request_prefix");
        $prefix = $prefix ? $prefix : strtoupper("") . " #";
        return $prefix . $id;
    }

}

/**
 * 
 * get estimate number
 * @param Int $estimate_id
 * @return string
 */
if (!function_exists('get_estimate_id')) {

    function get_estimate_id($estimate_id) {
        $prefix = get_setting("estimate_prefix");
        $prefix = $prefix ? $prefix : strtoupper(lang("estimate")) . " #";
        return $prefix . $estimate_id;
    }

}


/**
 * ger all data to make an estimate
 * 
 * @param Int $estimate_id
 * @return array
 */
if (!function_exists('get_estimate_making_data')) {

    function get_estimate_making_data($estimate_id) {
        $ci = get_instance();
        $estimate_info = $ci->Estimates_model->get_details(array("id" => $estimate_id))->row();
        if ($estimate_info) {
            $data['estimate_info'] = $estimate_info;
            $data['client_info'] = $ci->Clients_model->get_one($data['estimate_info']->client_id);
            $data['estimate_items'] = $ci->Estimate_items_model->get_details(array("estimate_id" => $estimate_id))->result();
            $data["estimate_total_summary"] = $ci->Estimates_model->get_estimate_total_summary($estimate_id);
            return $data;
        }
    }

}


/**
 * get team members and teams select2 dropdown data list
 * 
 * @return array
 */
if (!function_exists('get_team_members_and_teams_select2_data_list')) {

    function get_team_members_and_teams_select2_data_list() {
        $ci = get_instance();

        $team_members = $ci->Users_model->get_all_where(array("deleted" => 0, "user_type" => "staff"))->result();
        $members_and_teams_dropdown = array();

        foreach ($team_members as $team_member) {
            $members_and_teams_dropdown[] = array("type" => "member", "id" => "member:" . $team_member->id, "text" => $team_member->first_name . " " . $team_member->last_name);
        }

        $team = $ci->Team_model->get_all_where(array("deleted" => 0))->result();
        foreach ($team as $team) {
            $members_and_teams_dropdown[] = array("type" => "team", "id" => "team:" . $team->id, "text" => $team->title);
        }

        return $members_and_teams_dropdown;
    }

}

if(!function_exists('getMaxId')){

    function getMaxId($table,$prefix = ''){
        $ci = get_instance();

        $query = $ci->db->query("SELECT MAX(id) AS max_code from $table ")->row();

        $urut = (int) substr($query->max_code, 0);
        $urut++;
        $data = sprintf("%03s",$urut).'/RAN/'.$prefix.'/'.date('ymd');
        return $data;
    }
}




if(!function_exists('getCodeId')){

    function getCodeId($table,$prefix = ''){
        $ci = get_instance();

        $query = $ci->db->query("SELECT MAX(id) AS max_code from $table ")->row();

        $urut = (int) substr($query->max_code, 0);
        $urut++;
        $data = $prefix.date("y").date("m").sprintf("%03s",$urut);
        return $data;
    }
}





/**
 * submit data for notification
 * 
 * @return array
 */
if (!function_exists('log_notification')) {

    function log_notification($event, $options = array(), $user_id = 0) {

        $ci = get_instance();

        $url = get_uri("notification_processor/create_notification");

        $req = "event=" . encode_id($event, "notification");

        if ($user_id) {
            $req .= "&user_id=" . $user_id;
        } else if ($user_id === "0") {
            $req .= "&user_id=" . $user_id; //if user id is 0 (string) we'll assume that it's system bot 
        } else {
            $req .= "&user_id=" . $ci->login_user->id;
        }


        foreach ($options as $key => $value) {
            $value = urlencode($value);
            $req .= "&$key=$value";
        }


        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
        curl_setopt($ch, CURLOPT_TIMEOUT, 1);
        curl_exec($ch);
        curl_close($ch);
    }

}


/**
 * save custom fields for any context
 * 
 * @param Int $estimate_id
 * @return array
 */
if (!function_exists('save_custom_fields')) {

    function save_custom_fields($related_to_type, $related_to_id, $is_admin = 0, $user_type = "") {
        $ci = get_instance();
        $custom_fields = $ci->Custom_fields_model->get_combined_details($related_to_type, $related_to_id, $is_admin, $user_type)->result();

        //save custom fields
        foreach ($custom_fields as $field) {
            $field_name = "custom_field_" . $field->id;
            //save only submitted fields
            if (array_key_exists($field_name, $_POST)) {
                $value = $ci->input->post($field_name);

                $field_value_data = array(
                    "related_to_type" => $related_to_type,
                    "related_to_id" => $related_to_id,
                    "custom_field_id" => $field->id,
                    "value" => $value
                );
                $ci->Custom_field_values_model->upsert($field_value_data);
            }
        }
    }

}


if(!function_exists("terbilang")){
    function terbilang($x) {
      $angka = ["", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas"];
      if ($x < 12)
        return " " . $angka[$x];
      elseif ($x < 20)
        return terbilang($x - 10) . " belas";
      elseif ($x < 100)
        return terbilang($x / 10) . " puluh" . terbilang($x % 10);
      elseif ($x < 200)
        return "seratus" . terbilang($x - 100);
      elseif ($x < 1000)
        return terbilang($x / 100) . " ratus" . terbilang($x % 100);
      elseif ($x < 2000)
        return "seribu" . terbilang($x - 1000);
      elseif ($x < 1000000)
        return terbilang($x / 1000) . " ribu" . terbilang($x % 1000);
      elseif ($x < 1000000000)
        return terbilang($x / 1000000) . " juta" . terbilang($x % 1000000);
    }
}

function getCustInfo($id){
    $ci = get_instance();
    $ci->db->where("id",$id);
    $data = $ci->db->get('master_customers')->row();
    return $data->name." - " .$data->company_name;
}

function getVendorInfo($id){
    $ci = get_instance();
    $ci->db->where("id",$id);
    $data = $ci->db->get('master_vendor')->row();
    return $data->name." - " .$data->company_name;
}
