<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <ul data-toggle="ajax-tab" class="nav nav-tabs bg-white title" role="tablist">
            <li class="title-tab"><h4 class="pl15 pt10 pr15"><?php echo lang("timesheets"); ?></h4></li>

            <li><a id="timesheet-details-button" class="active" role="presentation" href="javascript:;" data-target="#timesheet-details"><?php echo lang("details"); ?></a></li>
            <li><a role="presentation" href="<?php echo_uri("projects/all_timesheet_summary/"); ?>" data-target="#timesheet-summary"><?php echo lang('summary'); ?></a></li>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade" id="timesheet-details">
                <div class="table-responsive">
                    <table id="all-project-timesheet-table" class="display" width="100%">  
                        <tfoot>
                            <tr>
                                <th colspan="7" class="text-right"><?php echo lang("total") ?>:</th>
                                <th class="text-left" data-current-page="7"></th>
                                <th colspan="2"> </th>
                            </tr>
                            <tr data-section="all_pages">
                                <th colspan="7" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                                <th class="text-left" data-all-page="7"></th>
                                <th colspan="2"> </th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="timesheet-summary"></div>
        </div>
    </div>
</div>






<script type="text/javascript">
    $(document).ready(function () {
        $("#all-project-timesheet-table").appTable({
            source: '<?php echo_uri("projects/timesheet_list_data/") ?>',
            filterDropdown: [{name: "user_id", class: "w200", options: <?php echo $members_dropdown; ?>}, {name: "project_id", class: "w200", options: <?php echo $projects_dropdown; ?>}],
            rangeDatepicker: [{startDate: {name: "start_date", value: moment().format("YYYY-MM-DD")}, endDate: {name: "end_date", value: moment().format("YYYY-MM-DD")}, showClearButton: true}],
            columns: [
                {title: "<?php echo lang('member') ?>"},
                {title: "<?php echo lang('project') ?>"},
                {title: "<?php echo lang('task') ?>"},
                {visible: false, searchable: false},
                {title: "<?php echo lang('start_time') ?>", "iDataShort": 3},
                {visible: false, searchable: false},
                {title: "<?php echo lang('end_time') ?>", "iDataShort": 5},
                {title: "<?php echo lang('total') ?>"},
                {title: '<i class="fa fa-comment"></i>', "class": "text-center w50"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1, 2, 4, 6, 7],
            xlsColumns: [0, 1, 2, 4, 6, 7],
            summation: [{column: 7, dataType: 'time'}]
        });
    });
</script>