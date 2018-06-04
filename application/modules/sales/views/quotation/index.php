<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Sales Quotation</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                </div>
                <?php
                    echo modal_anchor(get_uri("sales/quotation/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Quotation", array("class" => "btn btn-primary", "title" => "Add Quotation"));
                
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="quotation-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#quotation-table").appTable({
            source: '<?php echo_uri("sales/quotation/list_data") ?>',
            // order: [[1, "asc"]],
            columns: [
                {title: "QUOTATION CODE"},
                {title: "CUSTOMERS"},
                {title: "STATUS"},
                {title: "EMAIL"},
                {title: "EXPIRED"},
                {title: "CURRENCY"},
                {title: "TOTAL"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ],
            printColumns: [0, 1, 2, 3, 4,5,6,7,8],
            xlsColumns: [0, 1, 2, 3, 4,5,6,7,8]

        });
    });
</script>    
