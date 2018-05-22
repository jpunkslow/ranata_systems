<?php 


class Coa extends MY_Controller{


	function __construct() {
        parent::__construct();
        $this->access_only_admin();
        // $this->load->model('');
    }

	
    public function index() {


        $this->template->rander("coa/index");
    }


    function getId($id){

        if(!empty($id)){
            $options = array(
                "id" => $id,
            );
            $data = $this->Master_Coa_Type_model->get_details($options)->row();

            echo json_encode(array("success" => true,"data" => $data));
        }else{
            echo json_encode(array('success' => false,'message' => lang('error_occurred')));
        }
    }


    /* open new member modal */

    function modal_form() {
        
        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $view_data['head_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->get_dropdown_kas(array("account_name"));

        $this->load->view('coa/modal_form',$view_data);
    }

    function modal_form_edit() {
        $this->access_only_admin();

        validate_submitted_data(array(
            "id" => "numeric"
        ));


        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );
        $view_data['head_dropdown'] = array("" => "-") + $this->Master_Coa_Type_model->get_dropdown_kas(array("account_name"));


        $view_data['model_info'] = $this->Master_Coa_Type_model->get_details($options)->row();

        

        $this->load->view('coa/modal_form_edit', $view_data);
    }

    /* save new member */

    function add() {
       
        //check duplicate email address, if found then show an error message
        

        // validate_submitted_data(array(
        //     "kd_aktiva" => "required",
        //     "coa" => "required",
        //     "jns_trans" => "required"
        // ));

        // $user_data = array(
        //     "kd_aktiva" => $this->input->post('kd_aktiva'),
        //     "coa" => $this->input->post('coa'),
        //     "jns_trans" => $this->input->post('jns_trans'),
        //     "akun" => $this->input->post('akun'),
        //     "laba_rugi" => $this->input->post('laba_rugi'),
        //     "neraca" => $this->input->post('neraca'),
        //     "pemasukan" => $this->input->post('pemasukan'),
        //     "pengeluaran" => $this->input->post('pengeluaran'),
        //     "aktif" => $this->input->post('aktif'),
        //     "saldo_awal" => $this->input->post('saldo_awal')
        // );

        validate_submitted_data(array(
            "account_number" => "required",
            "account_name" => "required",
            "normally" => "required"
        ));
        $parent = $this->input->post('parent');
        if(empty($parent)){
            $parent = "Head";
        }else{
            $parent = null;
        }
        $user_data = array(
            "account_number" => $this->input->post('account_number'),
            "account_name" => $this->input->post('account_name'),
            "parent" => $parent,
            "normally" => $this->input->post('normally'),
            "account_type" => $this->input->post('account_type'),
            "reporting" => $this->input->post('reporting'),
            "akun" => $this->input->post('akun'),
            "parental" => $this->input->post('parent')
            
        );

        


        //add a new team member
        $coa = $this->Master_Coa_Type_model->save($user_data);
        

        if ($coa) {
            echo json_encode(array("success" => true, "data" => $this->_row_data($coa), 'id' => $coa, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save() {
        // $this->access_only_admin();

        //check duplicate email address, if found then show an error message
        $id = $this->input->post("id");

        validate_submitted_data(array(
            "account_number" => "required",
            "account_name" => "required",
            "normally" => "required"
        ));
        $parent = $this->input->post('parent');
        if(empty($parent)){
            $parent = "Head";
        }else{
            $parent = null;
        }
        $user_data = array(
            "account_number" => $this->input->post('account_number'),
            "account_name" => $this->input->post('account_name'),
            "parent" => $parent,
            "normally" => $this->input->post('normally'),
            "account_type" => $this->input->post('account_type'),
            "reporting" => $this->input->post('reporting'),
            "akun" => $this->input->post('akun'),
            "parental" => $this->input->post('parent')
            
        );



        $coa = $this->Master_Coa_Type_model->save($user_data,$id);
        

        if ($coa) {
            echo json_encode(array("success" => true, "data" => $this->_row_data($coa), 'id' => $coa, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* open invitation modal */

    

    //prepere the data for members list
    function list_data() {


        $list_data = $this->Master_Coa_Type_model->get_details()->result();
        $result = array();
        // $no = 1;
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }


    //get a row data for member list
    function _row_data($id) {
        // $custom_fields = $this->Custom_fields_model->get_available_fields_for_table("master_vendor", $this->login_user->is_admin, $this->login_user->user_type);
        $options = array(
            "id" => $id
        );

        $data = $this->Master_Coa_Type_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    //prepare team member list row
    private function _make_row($data) {
        // $image_url = get_avatar($data->image);
        // $user_avatar = "<span class='avatar avatar-xs'><img src='$image_url' alt='...'></span>";
        // $full_name = $data->first_name . " " . $data->last_name . " ";


        //check contact info view permissions
        
        if($data->parent == "Head"){
            // $number = "<strong>". $data->account_number."</strong>";
            $name = "<strong>". $data->account_name."</strong>";

        }else{
            $name = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$data->account_name;
            // $number = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$data->account_number;    
        }
    	// $no = 1;
        $row_data = array(
            // $user_avatar,
            // "no" => $no++,
    			$data->order_by,
    			 $data->account_number,
                 $name, 
    			 // $data->account_name,
    			 $data->parent,
    			 $data->normally,
    			 $data->account_type,
                 $data->reporting,
    			$data->akun
        );

        // foreach ($custom_fields as $field) {
        //     $cf_id = "cfv_" . $field->id;
        //     $row_data[] = $this->load->view("custom_fields/output_" . $field->field_type, array("value" => $data->$cf_id), true);
        // }
        
        $delete_link = "";
        if ($this->login_user->is_admin) {
            $delete_link = js_anchor("<i class='fa fa-trash'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("master/coa/delete"), "data-action" => "delete-confirmation"));
        }

        $row_data[] = modal_anchor(get_uri("master/coa/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit'), "data-post-id" => $data->id)).$delete_link;

        return $row_data;
    }

    //delete a team member
    function delete() {
        $this->access_only_admin();

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
      
        if ($id != $this->login_user->id && $this->Master_Coa_Type_model->delete($id)) {
            echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
        }
    }

    //show team member's details view
    function view($id = 0, $tab = "") {
        if ($id * 1) {
            //we have an id. view the team_member's profie
            $options = array("id" => $id, "user_type" => "staff");
            $user_info = $this->Master_Coa_Type_model->get_details($options)->row();
            if ($user_info) {

                //check which tabs are viewable for current logged in user
                $view_data['show_timeline'] = get_setting("module_timeline") ? true : false;

                // $can_update_team_members_info = $this->can_update_team_members_info($id);

                $view_data['show_general_info'] = $can_update_team_members_info;
                $view_data['show_job_info'] = false;

                $view_data['show_account_settings'] = false;

                $show_attendance = false;
                $show_leave = false;

                $expense_access_info = $this->get_access_info("expense");
                $view_data["show_expense_info"] = (get_setting("module_expense") == "1" && $expense_access_info->access_type == "all") ? true : false;

                //admin can access all members attendance and leave
                //none admin users can only access to his/her own information 

                if ($this->login_user->is_admin || $user_info->id === $this->login_user->id) {
                    $show_attendance = true;
                    $show_leave = true;
                    $view_data['show_job_info'] = true;
                    $view_data['show_account_settings'] = true;
                } else {
                    //none admin users but who has access to this team member's attendance and leave can access this info
                    $access_timecard = $this->get_access_info("attendance");
                    if ($access_timecard->access_type === "all" || in_array($user_info->id, $access_timecard->allowed_members)) {
                        $show_attendance = true;
                    }

                    $access_leave = $this->get_access_info("leave");
                    if ($access_leave->access_type === "all" || in_array($user_info->id, $access_leave->allowed_members)) {
                        $show_leave = true;
                    }
                }


                //check module availability
                $view_data['show_attendance'] = $show_attendance && get_setting("module_attendance") ? true : false;
                $view_data['show_leave'] = $show_leave && get_setting("module_leave") ? true : false;


                //check contact info view permissions
                // $show_cotact_info = $this->can_view_team_members_contact_info();
                // $show_social_links = $this->can_view_team_members_social_links();

                //own info is always visible
                if ($id == $this->login_user->id) {
                    $show_cotact_info = true;
                    $show_social_links = true;
                }

                $view_data['show_cotact_info'] = $show_cotact_info;
                $view_data['show_social_links'] = $show_social_links;


                //show projects tab to admin
                $view_data['show_projects'] = false;
                if ($this->login_user->is_admin) {
                    $view_data['show_projects'] = true;
                }


                $view_data['tab'] = $tab; //selected tab
                $view_data['user_info'] = $user_info;
                $view_data['social_link'] = $this->Social_links_model->get_one($id);
                $this->template->rander("team_members/view", $view_data);
            } else {
                show_404();
            }
        } else {
            //we don't have any specific id to view. show the list of team_member
            $view_data['team_members'] = $this->Users_model->get_details(array("user_type" => "staff", "status" => "active"))->result();
            $this->template->rander("team_members/profile_card", $view_data);
        }
    }

}

?>