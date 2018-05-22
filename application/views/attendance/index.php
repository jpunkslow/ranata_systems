<div id="page-content" class="p20 clearfix">

    <div class="panel panel-default">
        <ul data-toggle="ajax-tab" class="nav nav-tabs bg-white title" role="tablist">
            <li class="title-tab"><h4 class="pl15 pt10 pr15"><?php echo lang("attendance"); ?></h4></li>

            <li><a role="presentation" class="active" href="javascript:;" data-target="#daily-attendance"><?php echo lang("daily"); ?></a></li>
            <li><a role="presentation" href="<?php echo_uri("attendance/custom/"); ?>" data-target="#custom-attendance"><?php echo lang('custom'); ?></a></li>
            <li><a role="presentation" href="<?php echo_uri("attendance/summary/"); ?>" data-target="#summary-attendance"><?php echo lang('summary'); ?></a></li>

            <div class="tab-title clearfix no-border">
                <div class="title-button-group">
                    <?php echo modal_anchor(get_uri("attendance/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_attendance'), array("class" => "btn btn-default", "title" => lang('add_attendance'))); ?>
                </div>
            </div>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade" id="daily-attendance">
                <div class="table-responsive">
                    <table id="attendance-table" class="display" cellspacing="0" width="100%">            
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
            </div>
            <div role="tabpanel" class="tab-pane fade" id="custom-attendance"></div>
            <div role="tabpanel" class="tab-pane fade" id="summary-attendance"></div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $("#attendance-table").appTable({
            source: '<?php echo_uri("attendance/list_data/"); ?>',
            order: [[2, "desc"]],
            filterDropdown: [{name: "user_id", class: "w200", options: <?php echo $team_members_dropdown; ?>}],
            dateRangeType: "daily",
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
