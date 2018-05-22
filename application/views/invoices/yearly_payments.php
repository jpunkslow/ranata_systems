<table id="yearly-invoice-payment-table" class="display" width="100%">
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
<script type="text/javascript">
    $(document).ready(function () {
        loadPaymentsTable("#yearly-invoice-payment-table", "yearly");
    });
</script>