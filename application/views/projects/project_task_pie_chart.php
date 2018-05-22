<div class="panel">
    <div class="panel-body">
        <div id="task-status-pai" class="p15" style="width: 100%; height: 220px;"></div>
    </div>
</div>

<?php
load_js(array(
    "assets/js/flot/jquery.flot.min.js",
    "assets/js/flot/jquery.flot.pie.min.js",
    "assets/js/flot/jquery.flot.resize.min.js",
    "assets/js/flot/curvedLines.js",
    "assets/js/flot/jquery.flot.tooltip.min.js",
));
?>
<script>
    $(function () {
        var taskData = [
            {label: "<?php echo lang('to_do'); ?>", data: <?php echo $task_to_do; ?>, color: "#F9A52D"},
            {label: "<?php echo lang('in_progress'); ?>", data: <?php echo $task_in_progress; ?>, color: "#1672B9"},
            {label: "<?php echo lang('done'); ?>", data: <?php echo $task_done; ?>, color: "#00B393"}
        ];

        $.plot('#task-status-pai', taskData, {
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