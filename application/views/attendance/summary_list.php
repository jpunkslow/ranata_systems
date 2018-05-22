<div class="table-responsive">
    <table id="attendance-summary-table" class="display" cellspacing="0" width="100%">            
        <tfoot>
            <tr>
                <th colspan="1" class="text-right"><?php echo lang("total") ?>:</th>
                <th data-current-page="1"></th>
                <th data-current-page="2"></th>

            </tr>
            <tr data-section="all_pages">
                <th colspan="1" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                <th data-all-page="1"></th>
                <th data-all-page="2"></th>
            </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#attendance-summary-table").appTable({
            source: '<?php echo_uri("attendance/summary_list_data/"); ?>',
            order: [[0, "desc"]],
            filterDropdown: [{name: "user_id", class: "w200", options: <?php echo $team_members_dropdown; ?>}],
            rangeDatepicker: [{startDate: {name: "start_date", value: moment().format("YYYY-MM-DD")}, endDate: {name: "end_date", value: moment().format("YYYY-MM-DD")}}],
            columns: [
                {title: "<?php echo lang("team_member"); ?>"},
                {title: "<?php echo lang("duration"); ?>", "class": "w20p"},
                {title: "<?php echo lang("hours"); ?>", "class": "w20p"}
            ],
            printColumns: [0, 1, 2],
            xlsColumns: [0, 1, 2],
            summation: [{column: 1, dataType: 'time'}, {column: 2, dataType: 'number'}]
        });
    });
</script>