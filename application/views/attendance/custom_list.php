<div class="table-responsive">
    <table id="custom-attendance-table" class="display" cellspacing="0" width="100%">            
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
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#custom-attendance-table").appTable({
            source: '<?php echo_uri("attendance/list_data/"); ?>',
            order: [[2, "desc"]],
            filterDropdown: [{name: "user_id", class: "w200", options: <?php echo $team_members_dropdown; ?>}],
            rangeDatepicker: [{startDate: {name: "start_date", value: moment().format("YYYY-MM-DD")}, endDate: {name: "end_date", value: moment().format("YYYY-MM-DD")}}],
            columns: [
                {title: "<?php echo lang("team_member"); ?>", "class": "w20p"},
                {visible: false, searchable: false},
                {title: "<?php echo lang("in_date"); ?>", "class": "w15p", iDataSort: 1},
                {title: "<?php echo lang("in_time"); ?>", "class": "w15p"},
                {visible: false, searchable: false},
                {title: "<?php echo lang("out_date"); ?>", "class": "w15p", iDataSort: 4},
                {title: "<?php echo lang("out_time"); ?>", "class": "w15p"},
                {title: "<?php echo lang("duration"); ?>"},
                {title: '<i class="fa fa-comment"></i>', "class": "text-center w50"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 2, 3, 5, 6, 7],
            xlsColumns: [0, 2, 3, 5, 6, 7],
            summation: [{column: 7, dataType: 'time'}]
        });
    });
</script>