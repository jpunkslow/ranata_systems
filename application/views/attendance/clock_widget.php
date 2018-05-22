<div class="panel <?php echo (isset($clock_status->id)) ? 'panel-info' : 'panel-coral'; ?>">
    <div class="panel-body ">
        <div class="widget-icon">
            <i class="fa fa-clock-o"></i>
        </div>
        <div class="widget-details">
            <?php
            if (isset($clock_status->id)) {
                $in_time = format_to_time($clock_status->in_time);
                $in_datetime = format_to_datetime($clock_status->in_time);
                echo "<div class='mb15' title='$in_datetime'>" . lang('clock_started_at') . " : $in_time</div>";
                echo ajax_anchor(get_uri("attendance/log_time"), "<i class='fa fa-sign-out'></i> " . lang('clock_out'), array("class" => "btn btn-default no-border", "title" => lang('clock_out'), "data-inline-loader" => "1", "data-closest-target" => ".widget-container"));
            } else {
                echo "<div class='mb15'>" . lang('you_are_currently_clocked_out') . "</div>";
                echo ajax_anchor(get_uri("attendance/log_time"), "<i class='fa fa-sign-in'></i> " . lang('clock_in'), array("class" => "btn btn-default no-border", "title" => lang('clock_in'), "data-inline-loader" => "1", "data-closest-target" => ".widget-container"));
            }
            ?>
        </div>
    </div>
</div>