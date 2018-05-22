<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Jurnal Umum</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                </div>
                <?php
                    echo modal_anchor(get_uri("accounting/general_ledger/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Jurnal", array("class" => "btn btn-primary", "title" => "Add Jurnal"));
                
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="generalledger-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#generalledger-table").appTable({
            source: '<?php echo_uri("accounting/general_ledger/list_data") ?>',
            // order: [[1, "asc"]],
            columns: [
                {title: "Nomor Voucher"},
                {title: "Tanggal"},
                {title: "Nomor Akun"},
                {title: "Deskripsi"},
                {title: "Debit"},
                {title: "Kredit"},
                {title: "Jumlah"},
                {title: "Status"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ],
            printColumns: [0, 1, 2, 3, 4,5,6,7,8],
            xlsColumns: [0, 1, 2, 3, 4,5,6,7,8]

        });
    });
</script>    
