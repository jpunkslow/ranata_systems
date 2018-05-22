<div class="panel">
    <div class="tab-title clearfix">
        <h4><?php echo lang('tasks'); ?></h4>
        <div class="title-button-group">
            <?php
            if ($can_create_tasks) {
                echo modal_anchor(get_uri("projects/task_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_task'), array("class" => "btn btn-default", "title" => lang('add_task'), "data-post-project_id" => $project_id));
            }
            ?>
        </div>
    </div>
    <div class="table-responsive">
        <table id="task-table" class="display" width="100%">            
        </table>
    </div>    
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var userType = "<?php echo $this->login_user->user_type; ?>";

        var optionVisibility = false;
        if ("<?php echo ($can_edit_tasks || $can_delete_tasks); ?>") {
            optionVisibility = true;
        }

        if (userType === "client") {
            //don't show assignee and options to clients
            $("#task-table").appTable({
                source: '<?php echo_uri("projects/tasks_list_data/" . $project_id) ?>',
                order: [[1, "desc"]],
                filterDropdown: [{name: "milestone_id", class: "w200", options: <?php echo $milestone_dropdown; ?>}],
                checkBoxes: [
                    {text: '<?php echo lang("to_do") ?>', name: "status", value: "to_do", isChecked: false},
                    {text: '<?php echo lang("in_progress") ?>', name: "status", value: "in_progress", isChecked: false},
                    {text: '<?php echo lang("done") ?>', name: "status", value: "done", isChecked: false}
                ],
                columns: [
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("id") ?>'},
                    {title: '<?php echo lang("title") ?>'},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("start_date") ?>', "iDataSort": 3},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("deadline") ?>', "iDataSort": 5},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("status") ?>'}
                    <?php echo $custom_field_headers; ?>,
                    {title: '<i class="fa fa-bars"></i>', visible: optionVisibility, "class": "text-center option w100"}
                ],
                printColumns: combineCustomFieldsColumns([1, 2, 4, 7], '<?php echo $custom_field_headers; ?>'),
                xlsColumns: combineCustomFieldsColumns([1, 2, 4, 7], '<?php echo $custom_field_headers; ?>'),
                rowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    $('td:eq(0)', nRow).addClass(aData[0]);
                }
            });
        } else {
            $("#task-table").appTable({
                source: '<?php echo_uri("projects/tasks_list_data/" . $project_id) ?>',
                order: [[1, "desc"]],
                filterDropdown: [
                    {name: "milestone_id", class: "w200", options: <?php echo $milestone_dropdown; ?>},
                    {name: "assigned_to", class: "w200", options: <?php echo $assigned_to_dropdown; ?>}],
                singleDatepicker: [{name: "deadline", defaultText: "<?php echo lang('deadline') ?>",
                        options: [
                        {value: "expired", text: "<?php echo lang('expired') ?>"},
                        {value: moment().format("YYYY-MM-DD"), text: "<?php echo lang('today') ?>"},
                        {value: moment().add(1, 'days').format("YYYY-MM-DD"), text: "<?php echo lang('tomorrow') ?>"},
                        {value: moment().add(7, 'days').format("YYYY-MM-DD"), text: "<?php echo sprintf(lang('in_number_of_days'), 7); ?>"},
                        {value: moment().add(15, 'days').format("YYYY-MM-DD"), text: "<?php echo sprintf(lang('in_number_of_days'), 15); ?>"}
                    ]}],
                checkBoxes: [
                    {text: '<?php echo lang("to_do") ?>', name: "status", value: "to_do", isChecked: true},
                    {text: '<?php echo lang("in_progress") ?>', name: "status", value: "in_progress", isChecked: true},
                    {text: '<?php echo lang("done") ?>', name: "status", value: "done", isChecked: false}
                ],
                columns: [
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("id") ?>'},
                    {title: '<?php echo lang("title") ?>'},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("start_date") ?>', "iDataSort": 3},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("deadline") ?>', "iDataSort": 5},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("assigned_to") ?>', "class": "min-w150"},
                    {title: '<?php echo lang("collaborators") ?>'},
                    {title: '<?php echo lang("status") ?>'}
                    <?php echo $custom_field_headers; ?>,
                    {title: '<i class="fa fa-bars"></i>', visible: optionVisibility, "class": "text-center option w100"}
                ],
                printColumns: combineCustomFieldsColumns([1, 2, 4, 6, 8, 9, 10], '<?php echo $custom_field_headers; ?>'),
                xlsColumns: combineCustomFieldsColumns([1, 2, 4, 6, 8, 9, 10], '<?php echo $custom_field_headers; ?>'),
                rowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    $('td:eq(0)', nRow).addClass(aData[0]);
                }
            });
        }
    });
</script>

<?php $this->load->view("projects/tasks/update_task_script"); ?>