<?php if (isset($page_type) && $page_type === "full") { ?>
    <div id="page-content" class="m20 clearfix">
    <?php } ?>

    <div class="panel">
        <?php if (isset($page_type) && $page_type === "full") { ?>
            <div class="page-title clearfix">
                <h1><?php echo lang('payments'); ?></h1>
            </div>
        <?php } else { ?>
            <div class="tab-title clearfix">
                <h4><?php echo lang('payments'); ?></h4>
            </div>
        <?php } ?>

        <div class="table-responsive">
            <table id="invoice-payment-table" class="display" width="100%">
                <tfoot>
                    <tr>
                        <th colspan="4" class="text-right"><?php echo lang("total") ?>:</th>
                        <th class="text-right" data-current-page="4"></th>
                    </tr>
                    <tr data-section="all_pages">
                        <th colspan="4" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                        <th class="text-right" data-all-page="4"></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <?php if (isset($page_type) && $page_type === "full") { ?>
    </div>
<?php } ?>

<script type="text/javascript">
    $(document).ready(function() {
        var currencySymbol = "<?php echo $client_info->currency_symbol; ?>";
        $("#invoice-payment-table").appTable({
            source: '<?php echo_uri("invoice_payments/payment_list_data_of_client/" . $client_id) ?>',
            order: [[1, "desc"]],
            columns: [
                {title: '<?php echo lang("invoice_id") ?> ', "class": "w10p"},
                {title: '<?php echo lang("payment_date") ?> ', "class": "w15p"},
                {title: '<?php echo lang("payment_method") ?>', "class": "w15p"},
                {title: '<?php echo lang("note") ?>'},
                {title: '<?php echo lang("amount") ?>', "class": "text-right w15p"}
            ],
            printColumns: [0, 1, 2, 3, 4],
            xlsColumns: [0, 1, 2, 3, 4],
            summation: [{column: 4, dataType: 'currency', currencySymbol: currencySymbol}]
        });

    });
</script>