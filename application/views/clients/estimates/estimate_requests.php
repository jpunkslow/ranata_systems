<?php if (isset($page_type) && $page_type === "full") { ?>
    <div id="page-content" class="m20 clearfix">
    <?php } ?>

    <div class="panel">
        <?php if (isset($page_type) && $page_type === "full") { ?>
            <div class="page-title clearfix">
                <h1><?php echo lang('estimate_requests'); ?></h1>
            </div>
        <?php } else { ?>
            <div class="tab-title clearfix">
                <h4><?php echo lang('estimate_requests'); ?></h4>
            </div>
        <?php } ?>

        <div class="table-responsive">
            <table id="estimate-request-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
    <?php if (isset($page_type) && $page_type === "full") { ?>
    </div>
<?php } ?>


<script type="text/javascript">
    $(document).ready(function () {
        $("#estimate-request-table").appTable({
            source: '<?php echo_uri("estimate_requests/estimate_requests_list_data_of_client/" . $client_id) ?>',
            order: [[0, 'asc']],
            columns: [
                {title: "<?php echo lang('id'); ?>"},
                {visible: false, searchable: false},
                {title: "<?php echo lang('title'); ?>"},
                {title: "<?php echo lang('assigned_to'); ?>"},
                {visible: false, searchable: false},
                {title: '<?php echo lang("created_date") ?>', "iDataSort": 3},
                {title: "<?php echo lang('status'); ?>"},
                {title: "<i class='fa fa-bars></i>'", "class": "text-center option w100"}
            ],
            printColumns: [0, 2, 3, 5, 6]
        });
    });
</script>