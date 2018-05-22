<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Customers</h1>
            <div class="title-button-group">
                <?php echo modal_anchor(get_uri("master/customers/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Customers", array("class" => "btn btn-primary", "title" => "Add Customers")); ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="master_customers-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        

        $("#master_customers-table").appTable({
            source: '<?php echo_uri("master/customers/list_data") ?>',
            columns: [
                {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                {title: "Name"},
                {title: "NPWP"},
                {title: "Address"},
                {title: "Email"},
                {title: "Mobile"},
                {title: "Memo"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ],
            printColumns: [0, 1, 2, 3, 4, 5,6,7],
            xlsColumns: [0, 1, 2, 3, 4, 5,6,7]
        });
    });
</script>