<table id="weekly-attendance-table" class="display" cellspacing="0" width="100%">            
    <tfoot>
        <tr>
            <th colspan="7" class="text-right"><?php echo lang("total") ?>:</th>
            <th data-current-page="7"></th>
            <th colspan="2"> </th>
        </tr>
        <tr data-section="all_pages">
            <th colspan="7" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
            <th data-all-page="7"></th>
            <th colspan="2"> </th>
        </tr>
    </tfoot>
</table>
<script type="text/javascript">
    $(document).ready(function () {
        loadMembersAttendanceTable("#weekly-attendance-table", "weekly");
    });
</script>