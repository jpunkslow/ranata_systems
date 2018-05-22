<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Purchase Invoices</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                </div>
                <?php
                    echo modal_anchor(get_uri("purchase/p_invoices/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Purchase Invoices", array("class" => "btn btn-primary", "title" => "Add Purchase Invoices"));
                
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="invoices-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#invoices-table").appTable({
            source: '<?php echo_uri("purchase/p_invoices/list_data") ?>',
            // invoices: [[1, "asc"]],
            columns: [
                {title: "INVOICES #"},
                {title: "VENDOR"},
                {title: "STATUS"},
                {title: "TUJUAN"},
                {title: "TANGGAL"},
                {title: "MATA UANG"},
                {title: "TOTAL"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ],
            printColumns: [0, 1, 2, 3, 4,5,6,7,8],
            xlsColumns: [0, 1, 2, 3, 4,5,6,7,8]

        });

    });
</script>    
