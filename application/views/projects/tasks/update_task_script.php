<script type="text/javascript">
    $(document).ready(function() {
        $('body').on('click', '[data-act=update-task-status]', function() {
            $(this).editable({
                type: "select2",
                pk: 1,
                name: 'status',
                ajaxOptions: {
                    type: 'post',
                    dataType: 'json'
                },
                value: $(this).attr('data-value'),
                url: '<?php echo_uri("projects/save_task_status") ?>/' + $(this).attr('data-id'),
                showbuttons: false,
                source: [
                    {value: "to_do", text: "<?php echo lang('to_do'); ?>"},
                    {value: "in_progress", text: "<?php echo lang('in_progress'); ?>"},
                    {value: "done", text: "<?php echo lang('done'); ?>"}
                ],
                success: function(response, newValue) {
                    if (response.success) {
                        $("#task-table").appTable({newData: response.data, dataId: response.id});
                    }
                }
            });
            $(this).editable("show");
        });

        $('body').on('click', '[data-act=update-task-status-checkbox]', function() {
            $(this).find("span").addClass("inline-loader");
            $.ajax({
                url: '<?php echo_uri("projects/save_task_status") ?>/' + $(this).attr('data-id'),
                type: 'POST',
                dataType: 'json',
                data: {value: $(this).attr('data-value')},
                success: function(response) {
                    if (response.success) {
                        $("#task-table").appTable({newData: response.data, dataId: response.id});
                    }
                }
            });
        });
    });
</script>