<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1><?php echo lang('announcements'); ?></h1>
            <div class="title-button-group">
                <?php
                if ($show_add_button) {
                    echo anchor(get_uri("announcements/form"), "<i class='fa fa-plus-circle'></i> " . lang('add_announcement'), array("class" => "btn btn-default", "data-modal-lg" => "1", "title" => lang('add_announcement')));
                };
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="announcement-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        var showUserInfo = true;
        if ("<?php echo $this->login_user->user_type; ?>" === "client") {
            showUserInfo = false;
        }

        $("#announcement-table").appTable({
            source: '<?php echo_uri("announcements/list_data") ?>',
            order: [[2, "desc"]],
            columns: [
                {title: '<?php echo lang("title") ?>'},
                {visible: showUserInfo, title: '<?php echo lang("created_by") ?>'},
                {title: '<?php echo lang("start_date") ?>'},
                {title: '<?php echo lang("end_date") ?>'},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1, 2, 3]
        });
    });
</script>