<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>COA Balance</h1>
            <div class="title-button-group">
                <?php echo modal_anchor(get_uri("master/saldoawal/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add COA Balance", array("class" => "btn btn-primary", "title" => "Add COA Balance")); ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="saldoawal-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#saldoawal-table").appTable({
            source: '<?php echo_uri("master/saldoawal/list_data") ?>',
            order: [[0, 'desc']],
            columns: [
                {title: 'PERIODE'},
                {title: 'DATE'},
                {title: 'COA'},
                {title: 'DEBET'},
                {title: 'CREDIT'},
                // {title: 'Price'},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1, 2, 3, 4],
            xlsColumns: [0, 1, 2, 3, 4]
        });
    });


</script>