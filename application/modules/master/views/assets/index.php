<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Master Assets</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                </div>
                <?php
                    echo modal_anchor(get_uri("master/assets/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_assets'), array("class" => "btn btn-primary", "title" => lang('add_assets')));
                
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="assets-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#assets-table").appTable({
            source: '<?php echo_uri("master/assets/list_data") ?>',
            // order: [[1, "asc"]],
            columns: [
                {title: "CODE"},
                {title: "TYPE"},
                {title: "ASSET NAME"},
                {title: "GET DATE"},
                {title: "AGE"},
                {title: "COST"},
                // {title: "METHOD"},
                
                {title: "RESIDUAL VALUE", "class": "text-right"},
                {title: "YEARLY <br> DEPRECIATION", "class": "text-right"},
                {title: "MONTHLY <br> DEPRECIATION", "class": "text-right"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1, 2, 3, 4,5,6,7,8],
            xlsColumns: [0, 1, 2, 3, 4,5,6,7,8]

        });
    });
</script>    
