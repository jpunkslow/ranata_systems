<?php if (isset($page_type) && $page_type === "full") { ?>
    <div id="page-content" class="m20 clearfix">
    <?php } ?>

    <div class="panel">
        <?php if (isset($page_type) && $page_type === "full") { ?>
            <div class="page-title clearfix">
                <h1><?php echo lang('estimates'); ?></h1>
                <?php if (isset($can_request_estimate) && $can_request_estimate) { ?>
                    <div class="title-button-group">
                        <?php echo modal_anchor(get_uri("estimate_requests/request_an_estimate_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('request_an_estimate'), array("class" => "btn btn-default", "title" => lang('request_an_estimate'))); ?>           
                    </div>
                <?php } ?>
            </div>
        <?php } else { ?>
            <div class="tab-title clearfix">
                <h4><?php echo lang('estimates'); ?></h4>
                <div class="title-button-group">
                    <?php echo modal_anchor(get_uri("estimates/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_estimate'), array("class" => "btn btn-default", "data-post-client_id" => $client_id, "title" => lang('add_estimate'))); ?>
                </div>
            </div>
        <?php } ?>

        <div class="table-responsive">
            <table id="estimate-table" class="display" width="100%">
                <tfoot>
                    <tr>
                        <th colspan="4" class="text-right"><?php echo lang("total") ?>:</th>
                        <th class="text-right" data-current-page="4"></th>
                        <th> </th>
                    </tr>
                    <tr data-section="all_pages">
                        <th colspan="4" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                        <th class="text-right" data-all-page="4"></th>
                        <th> </th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <?php if (isset($page_type) && $page_type === "full") { ?>
    </div>
<?php } ?>
<script type="text/javascript">
    $(document).ready(function () {
        var currencySymbol = "<?php echo $client_info->currency_symbol; ?>";
        $("#estimate-table").appTable({
            source: '<?php echo_uri("estimates/estimate_list_data_of_client/" . $client_id) ?>',
            order: [[0, "desc"]],
            columns: [
                {title: "<?php echo lang("estimate") ?>", "class": "w25p"},
                {visible: false, searchable: false},
                {visible: false, searchable: false},
                {title: "<?php echo lang("estimate_date") ?>", "iDataSort": 2, "class": "w25p"},
                {title: "<?php echo lang("amount") ?>", "class": "text-right w25p"},
                {title: "<?php echo lang("status") ?>", "class": "text-center w25p"},
                {visible: false}
            ],
            summation: [{column: 4, dataType: 'currency', currencySymbol: currencySymbol}]
        });
    });
</script>