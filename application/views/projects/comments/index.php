<div class="panel">
    <?php
    if (isset($customer_feedback_id)) {
        //customer feedback is only available for clients
        if ($this->login_user->user_type === "client") {
            $this->load->view("projects/comments/comment_form");
        }else{
            echo "<br />";
        }
    } else {
        $this->load->view("projects/comments/comment_form");
    }
    ?>
    <?php $this->load->view("projects/comments/comment_list"); ?>
</div>
