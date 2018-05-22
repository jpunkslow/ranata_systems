<div class="panel clearfix">
    <div class="table-responsive">
        <table id="sub-invoice-table" class="display" cellspacing="0" width="100%">   
            <tfoot>
                <tr>
                    <th colspan="5" class="text-right"><?php echo lang("total") ?>:</th>
                    <th class="text-right" data-current-page="5"></th>
                    <th class="text-right" data-current-page="6"></th>
                    <th colspan="1" > </th>
                </tr>
                <tr data-section="all_pages">
                    <th colspan="5" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                    <th class="text-right" data-all-page="5"></th>
                    <th class="text-right" data-all-page="6"></th>
                    <th colspan="1" > </th>
                </tr>
            </tfoot>
        </table>
    </div>

</div>

<script type="text/javascript">

    $(document).ready(function () {

        $("#sub-invoice-table").appTable({
            source: '<?php echo_uri("invoices/sub_invoices_list_data/" . $recurring_invoice_id) ?>',
            order: [[0, "desc"]],
            columns: [
                {title: "<?php echo lang("invoice_id") ?>", "class": "w10p"},
                {visible: false},
                {visible: false},
                {title: "<?php echo lang("bill_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("due_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("invoice_value") ?>", "class": "w10p text-right"},
                {title: "<?php echo lang("payment_received") ?>", "class": "w10p text-right"},
                {title: "<?php echo lang("status") ?>", "class": "w10p text-center"}
            ],
            summation: [{column: 5, dataType: 'currency', currencySymbol: "none"}, {column: 6, dataType: 'currency', currencySymbol: "none"}]
        });

    });
</script>