 <table id="yearly-invoice-table" class="display" cellspacing="0" width="100%">   
                <tfoot>
                    <tr>
                        <th colspan="5" class="text-right"><?php echo lang("total") ?>:</th>
                        <th class="text-right" data-current-page="5"></th>
                        <th class="text-right" data-current-page="6"></th>
                        <th  colspan="2"> </th>
                    </tr>
                    <tr data-section="all_pages">
                        <th colspan="5" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                        <th class="text-right" data-all-page="5"></th>
                        <th class="text-right" data-all-page="6"></th>
                        <th colspan="2"> </th>
                    </tr>
                </tfoot>
            </table>
<script type="text/javascript">
    $(document).ready(function () {
        loadInvoicesTable("#yearly-invoice-table", "yearly");
    });
</script>