<?php
if ($notification->task_id && $notification->task_title) {
    echo "<div>" . lang("task") . ": #$notification->task_id - " . $notification->task_title . "</div>";
}

if ($notification->activity_log_changes !== "") {
    $changes = unserialize($notification->activity_log_changes);
    if (is_array($changes)) {
        echo "<ul>";
        foreach ($changes as $field => $value) {
            ?>
            <li><?php echo get_change_logs($notification->activity_log_type, $field, $value); ?></li>
            <?php
        } echo "</ul>";
    }
}

if ($notification->payment_invoice_id) {
    echo "<div>" . to_currency($notification->payment_amount, $notification->client_currency_symbol) . "  -  " . get_invoice_id($notification->payment_invoice_id) . "</div>";
}

if ($notification->ticket_id && $notification->ticket_title) {
    echo "<div>" . lang("ticket") . ": #" . $notification->ticket_id . " - " . $notification->ticket_title . "</div>";
}

if ($notification->leave_id && $notification->leave_start_date) {
    $leave_date = format_to_date($notification->leave_start_date, FALSE);
    if ($notification->leave_start_date != $notification->leave_end_date) {
        $leave_date = sprintf(lang('start_date_to_end_date_format'), format_to_date($notification->leave_start_date, FALSE), format_to_date($notification->leave_end_date, FALSE));
    }
    echo "<div>" . lang("date") . ": " . $leave_date . "</div>";
}

if ($notification->project_comment_id && $notification->project_comment_title) {
    echo "<div>" . lang("comment") . ": " . nl2br($notification->project_comment_title) . "</div>";
}

if ($notification->project_file_id && $notification->project_file_title) {
    echo "<div>" . lang("file") . ": " . remove_file_prefix($notification->project_file_title) . "</div>";
}


if ($notification->project_id && $notification->project_title) {
    echo "<div>" . lang("project") . ": " . $notification->project_title . "</div>";
}

if ($notification->estimate_id) {
    echo "<div>" . lang("estimate") . " #" . $notification->estimate_id . "</div>";
}
