<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-tasks"></i>&nbsp;<?php echo lang("task_status"); ?>
    </div>
    <div class="panel-body ">
        <div id="my-task-status-pai" style="width: 100%; height: 250px;"></div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var taskData = [
            {label: "<?php echo lang('to_do'); ?>", data: <?php echo $task_to_do; ?>, color: "#F9A52D"},
            {label: "<?php echo lang('in_progress'); ?>", data: <?php echo $task_in_progress; ?>, color: "#1672B9"},
            {label: "<?php echo lang('done'); ?>", data: <?php echo $task_done; ?>, color: "#00B393"}
        ];

        $.plot('#my-task-status-pai', taskData, {
            series: {
                pie: {
                    show: true,
                    innerRadius: 0.5
                }
            },
            legend: {
                show: true
            },
            grid: {
                hoverable: true
            },
            tooltip: {
                show: true,
                content: "%s: %p.0%, %n", // show percentages, rounding to 2 decimal places
                shifts: {
                    x: 20,
                    y: 0
                },
                defaultTheme: false
            }
        });
    });
</script>    