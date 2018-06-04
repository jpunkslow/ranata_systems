<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1><?php echo lang('master_coa'); ?></h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default btn-sm active mr-1"  title="<?php echo lang('list_view'); ?>"><i class="fa fa-bars"></i></button>
                    
                </div>
                <?php
                if ($this->login_user->is_admin) {
                    // echo modal_anchor(get_uri("team_members/invitation_modal"), "<i class='fa fa-envelope-o'></i> " . lang('send_invitation'), array("class" => "btn btn-default", "title" => lang('send_invitation')));
                    echo modal_anchor(get_uri("master/coa/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('master_coa_add'), array("class" => "btn btn-primary", "title" => lang('master_coa_add')));
                }
                ?>
            </div>
        </div>
        

            <div class="table-responsive">
            <table id="master_coa-table" class="display" cellspacing="0" width="100%">         
            </table>
        </div>

       
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        

        var visibleDelete = false;
        if ("<?php echo $this->login_user->is_admin; ?>") {
            visibleDelete = true;
        }

        $("#master_coa-table").appTable({
            source: '<?php echo_uri("master/coa/list_data") ?>',
            // order: [[1, "asc"]],
            columns: [
                // {title: "ORDER"},
                {title: 'NO ACCOUNT'},
                {title: "ACCOUNT NAME"},
                {title: "IS PARENT"},
                {title: "NORMALLY"},
                {title: "ACCOUNT_TYPE"},
                {title: "REPORTING"},
                {title: "IN/OUT"},
                {visible: visibleDelete, title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            displayLength: 100,
            printColumns: [1, 2, 3, 4,5,6,7,8],
            xlsColumns: [ 1, 2, 3, 4,5,6,7,8]

        });

        
    });
</script>    
