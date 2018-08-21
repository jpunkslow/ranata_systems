<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "users";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h4> <?php echo lang('users'); ?></h4>
                <div class="title-button-group">
                    <?php echo modal_anchor(get_uri("settings/users/modal_form"), "<i class='fa fa-plus-circle'></i> " . 'Add User', array("class" => "btn btn-default", "title" => 'Add User')); ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="users-table" class="display" cellspacing="0" width="100%">            
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#users-table").appTable({
            source: '<?php echo_uri("settings/users/list_data") ?>',
            columns: [
                {title: 'Name'},
                {title: 'Type'},
                {title: 'Email'},
                {title: 'Status'},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ]
        });
    });
</script>