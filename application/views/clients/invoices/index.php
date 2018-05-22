<?php if (isset($page_type) && $page_type === "full") { ?>
    <div id="page-content" class="m20 clearfix">
    <?php } ?>

    <div class="panel">
        <?php if (isset($page_type) && $page_type === "full") { ?>
            <div class="page-title clearfix">
                <h1><?php echo lang('invoices'); ?></h1>
            </div>
        <?php } else { ?>
            <div class="tab-title clearfix">
                <h4><?php echo lang('invoices'); ?></h4>
                <div class="title-button-group">
                    <?php echo modal_anchor(get_uri("invoices/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_invoice'), array("class" => "btn btn-default mb0", "data-post-client_id" => $client_id, "title" => lang('add_invoice'))); ?>
                </div>
            </div>
        <?php } ?>

        <div class="table-responsive">
            <table id="invoice-table" class="display" width="100%">
                <tfoot>
                    <tr>
                        <th colspan="5" class="text-right"><?php echo lang("total") ?>:</th>
                        <th class="text-right" data-current-page="5"></th>
                        <th class="text-right" data-current-page="6"></th>
                        <th> </th>
                    </tr>
                    <tr data-section="all_pages">
                        <th colspan="5" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                        <th class="text-right" data-all-page="5"></th>
                        <th class="text-right" data-all-page="6"></th>
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
        $("#invoice-table").appTable({
            source: '<?php echo_uri("invoices/invoice_list_data_of_client/" . $client_id) ?>',
            order: [[0, "desc"]],
            filterDropdown: [{name: "status", class: "w150", options: <?php $this->load->view("invoices/invoice_statuses_dropdown"); ?>}],
            columns: [
                {title: '<?php echo lang("id") ?>', "class": "w10p"},
                {targets: [1], visible: false, searchable: false},
                {title: "<?php echo lang("project") ?>"},
                {title: "<?php echo lang("bill_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("due_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("invoice_value") ?>", "class": "w10p text-right"},
                {title: "<?php echo lang("payment_received") ?>", "class": "w10p text-right"},
                {title: '<?php echo lang("status") ?>', "class": "w10p text-center"}
                <?php echo $custom_field_headers; ?>
            ],
            printColumns: combineCustomFieldsColumns([0, 2, 3, 4, 5, 6, 7], '<?php echo $custom_field_headers; ?>'),
            xlsColumns: combineCustomFieldsColumns([0, 2, 3, 4, 5, 6, 7], '<?php echo $custom_field_headers; ?>'),
            summation: [{column: 5, dataType: 'currency', currencySymbol: currencySymbol}, {column: 6, dataType: 'currency', currencySymbol: currencySymbol}]
        });
    });
</script>