<div id="page-content" class="m20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Vendors Receipt</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                    <?php
                    echo modal_anchor(get_uri("purchase/p_payments/add_receipt"), "<i class='fa fa-plus-circle'></i> " . "Add Vendor Receipt", array("class" => "btn btn-primary", "title" => "Add Vendor Receipt"));
                
                ?>
                </div>
               
            </div>
        </div>
       

        

        
        <div class="table-responsive" style="min-height: 500px">
            <table id="payments-table" class=" display dataTable no-footer" cellspacing="0" width="100%" >    
                       
            </table>
        </div>


    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#payments-table").appTable({
            source: '<?php echo_uri("purchase/p_payments/list_data") ?>',
            // order: [[1, "asc"]],
            columns: [
                {title: "NO VOUCHER #"},
                {title: "VENDORS"},
                {title: "STATUS","class": "text-center"},
                // {title: "KAS"},
                {title: "TANGGAL"},
                {title: "MEMO"},
                {title: "MATA UANG","class": "text-center"},
                {title: "TOTAL", "class": "text-right"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ],
            printColumns: [0, 1, 2, 3, 4,5,6,7,8],
            xlsColumns: [0, 1, 2, 3, 4,5,6,7,8]

        });

    });
</script>    
