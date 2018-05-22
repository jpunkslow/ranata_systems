<div id="page-content" class="clearfix p20">
    <div class="panel clearfix">
        <ul data-toggle="ajax-tab" class="nav nav-tabs bg-white title" role="tablist">
            <li class="title-tab"><h4 class="pl15 pt10 pr15"><?php echo lang("invoices"); ?></h4></li>
            <li><a id="monthly-expenses-button"  role="presentation" class="active" href="javascript:;" data-target="#monthly-invoices"><?php echo lang("monthly"); ?></a></li>
            <li><a role="presentation" href="<?php echo_uri("invoices/yearly/"); ?>" data-target="#yearly-invoices"><?php echo lang('yearly'); ?></a></li>
            <li><a role="presentation" href="<?php echo_uri("invoices/recurring/"); ?>" data-target="#recurring-invoices"><?php echo lang('recurring'); ?></a></li>
            <div class="tab-title clearfix no-border">
                <div class="title-button-group">
                    <?php echo modal_anchor(get_uri("invoices/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_invoice'), array("class" => "btn btn-default mb0", "title" => lang('add_invoice'))); ?>
                </div>
            </div>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade" id="monthly-invoices">
                <div class="table-responsive">
                    <table id="monthly-invoice-table" class="display" cellspacing="0" width="100%">   
                        <tfoot>
                            <tr>
                                <th colspan="5" class="text-right"><?php echo lang("total") ?>:</th>
                                <th class="text-right" data-current-page="5"></th>
                                <th class="text-right" data-current-page="6"></th>
                                <th  colspan="2"> </th>
                            </tr>
                            <tr data-section="all_pages">
                                <th colspan="5" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                                <th class="text-right" data-all-page="5"></th>
                                <th class="text-right" data-all-page="6"></th>
                                <th colspan="2"> </th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="yearly-invoices"></div>
            <div role="tabpanel" class="tab-pane fade" id="recurring-invoices"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    loadInvoicesTable = function (selector, dateRange) {
        $(selector).appTable({
            source: '<?php echo_uri("invoices/list_data") ?>',
            dateRangeType: dateRange,
            order: [[0, "desc"]],
            filterDropdown: [{name: "status", class: "w150", options: <?php $this->load->view("invoices/invoice_statuses_dropdown"); ?>}],
            columns: [
                {title: "<?php echo lang("invoice_id") ?>", "class": "w10p"},
                {title: "<?php echo lang("client") ?>", "class": ""},
                {title: "<?php echo lang("project") ?>", "class": "w15p"},
                {title: "<?php echo lang("bill_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("due_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("invoice_value") ?>", "class": "w10p text-right"},
                {title: "<?php echo lang("payment_received") ?>", "class": "w10p text-right"},
                {title: "<?php echo lang("status") ?>", "class": "w10p text-center"}
                <?php echo $custom_field_headers; ?>,
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: combineCustomFieldsColumns([0, 1, 2, 3, 4, 5, 6, 7], '<?php echo $custom_field_headers; ?>'),
            xlsColumns: combineCustomFieldsColumns([0, 1, 2, 3, 4, 5, 6, 7], '<?php echo $custom_field_headers; ?>'),
            summation: [{column: 5, dataType: 'currency', currencySymbol: "none"}, {column: 6, dataType: 'currency', currencySymbol: "none"}]
        });

    };

    $(document).ready(function () {
        $("#monthly-invoice-table").trigger("click");
        loadInvoicesTable("#monthly-invoice-table", "monthly");
    });
</script>