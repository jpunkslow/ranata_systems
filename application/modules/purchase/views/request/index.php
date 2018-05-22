<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Purchase Request</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                </div>
                <?php
                    echo modal_anchor(get_uri("purchase/request/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Request", array("class" => "btn btn-primary", "title" => "Add Request"));
                
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="request-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#request-table").appTable({
            source: '<?php echo_uri("purchase/request/list_data") ?>',
            // order: [[1, "asc"]],
            columns: [
                {title: "REQ NUMBER"},
                {title: "VENDOR"},
                {title: "STATUS"},
                {title: "TUJUAN"},
                {title: "MATA UANG"},
                {title: "VALUE"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ],
            printColumns: [0, 1, 2, 3, 4,5,6,7,8],
            xlsColumns: [0, 1, 2, 3, 4,5,6,7,8]

        });
    });
</script>    
