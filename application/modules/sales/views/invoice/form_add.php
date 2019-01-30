<div id="page-content" class="clearfix" style="width: 1000px;margin:  auto">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Add Invoices</h1>
            <div class="title-button-group">
              
            </div>
        </div>
        <div class="panel panel-default">

            <?php echo form_open(get_uri("sales/s_invoices/update"), array("id" => "invoices-form", "class" => "general-form", "role" => "form")); ?>
        <div class="col-md-6 modal-body clearfix">

            <input type="hidden" name="id" value="<?php echo $model_info->id ?>">

            <div class="form-group">
                <label for="code" class=" col-md-3">INVOICES ID</label>
                <div class="col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "code",
                        "name" => "code",
                        "class" => "form-control validate-hidden",
                        "autofocus" => true,
                        // "value" => "/RAN/TT/".date("Y")."/".date('d'),
                        "value" => $model_info->code,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
             <div class="form-group">
                <input type="hidden" name="order_id" value="<?php echo $model_info->id ?>">
                <label for="fid_order" class=" col-md-3">PROJECT #</label>
                    <div class=" col-md-8">
                        <?php
                           echo form_dropdown("fid_project", $project_dropdown, $model_info->fid_project, "class='select2 validate-hidden' id='fid_project' ");
                            ?>
                    </div>
                    <div class="col-md-1">
                         <?php echo modal_anchor(get_uri("sales/s_invoices/proj_modal_form"), "<i class='fa fa-plus-circle'></i> " , array("class" => "btn btn-default", "title" => "Add Projects")); ?>
                    </div>
            </div>  
            <div class="form-group">
                <input type="hidden" name="order_id" value="<?php echo $model_info->id ?>">
                <label for="fid_order" class=" col-md-3">ORDER #</label>
                    <div class=" col-md-9">
                        <?php
                           echo form_dropdown("fid_order", $order_dropdown, $model_info->fid_order, "class='select2 validate-hidden' id='fid_order' ");
                            ?>
                    </div>
            </div>  
            <div class="form-group">
                <label for="fid_cust" class="col-md-3">Customers Name</label>
                <div class=" col-md-8">
                    <?php
                    echo form_dropdown("fid_cust", $clients_dropdown, $model_info->fid_cust, "class='select2 validate-hidden' id='fid_cust' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                    ?>
                </div>
                <div class="col-md-1">
                     <?php echo modal_anchor(get_uri("sales/s_invoices/cust_modal_form"), "<i class='fa fa-plus-circle'></i> " , array("class" => "btn btn-default", "title" => "Add Customers")); ?>
                </div>
            </div>
            <div class="form-group">
                <label for="email_to" class="col-md-3">Email To</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "email_to",
                        "name" => "email_to",
                        "class" => "form-control",
                        "placeholder" => "client@example.com",
                        "value" => $model_info->email_to
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="currency" class=" col-md-3">Currency</label>
                <div class="col-md-9">
                     <?php 
                        echo form_dropdown(
                            "currency", array(
                                "IDR" => "IDR",
                                "USD" => "USD",
                                "EUR" => "EUR",
                                "JPY" => "JPY"
                                ), $model_info->currency, "class='select2 mini'"
                            );
                                ?>
                </div>
            </div>
            

            
        </div>
        <div class="col-md-6 modal-body clearfix">
            <div class="form-group">
                <label for="inv_address" class=" col-md-3">Address</label>
                <div class="col-md-9">
                     <?php 
                        echo form_textarea(array(
                        "id" => "inv_address",
                        "name" => "inv_address",
                        "class" => "form-control",
                        "placeholder" => "Address ",
                        "value" => $model_info->inv_address
                        ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="delivery_address" class=" col-md-3">Delivery Address</label>
                <div class="col-md-9">
                     <?php 
                        echo form_textarea(array(
                        "id" => "delivery_address",
                        "name" => "delivery_address",
                        "class" => "form-control",
                        "placeholder" => "Delivery Address",
                        "value" => $model_info->delivery_address
                        // "data-rule-required" => true,
                        // "data-msg-required" => lang("field_required"),
                    ));
                                ?>
                </div>
            </div>
            <div class="form-group">
                <label for="inv_date" class="col-md-3">Invoices Date</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "inv_date",
                        "name" => "inv_date",
                        "class" => "form-control",
                        "autocomplete" => "off",
                        "placeholder" => "Y/m/d",
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                        "value" => $model_info->inv_date
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="end_date" class="col-md-3">End Date</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "end_date",
                        "name" => "end_date",
                        "class" => "form-control",
                        "autocomplete" => "off",
                        "placeholder" => "Y/m/d",
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                        "value" => $model_info->end_date
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="fid_tax" class=" col-md-3"><?php echo lang('tax'); ?></label>
                <div class="col-md-9">
                    <?php
                    echo form_dropdown("fid_tax", $taxes_dropdown, array($model_info->fid_tax), "class='select2 tax-select2'");
                    ?>
                </div>
            </div>

            
            
        </div>
        <div class="col-md-12">
             <div class="table-responsive mt15 pl15 pr15">
                <?php echo modal_anchor(get_uri("sales/s_invoices/item_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_item'), array("class" => "btn btn-primary", "title" => lang('add_item'), "data-post-invoice_id" => $invoice_info->id)); ?>
                    <table id="invoice-item-table" class="display" width="100%">            
                    </table>
                </div>
            
        </div>

        <div style="border: 1px solid #000"></div>

        <div class="modal-footer" style="border-top: 1px solid #000">
            <button type="button" class="btn btn-default" onclick="window.history.go(-1); return false;"><span class="fa fa-arrow-left"></span> Draft</button>
            <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
        </div>
<?php echo form_close(); ?>

<script type="text/javascript">
    RELOAD_VIEW_AFTER_UPDATE = true;
    $(document).ready(function () {
        $("#invoice-item-table").appTable({
            source: '<?php echo_uri("sales/s_invoices/item_list_data/". $invoice_info->id) ?>',
            
            order: [[0, "asc"]],
            hideTools: true,
            columns: [

                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"},
                {title: '<?php echo lang("item") ?> '},
                {title: '<?php echo lang("quantity") ?>', "class": "text-right w15p"},
                {title: '<?php echo lang("rate") ?>', "class": "text-right w15p"},
                {title: '<?php echo lang("total") ?>', "class": "text-right w15p"}
            ],
            onDeleteSuccess: function (result) {
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            },
            onUndoSuccess: function (result) {
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            }
        });

        
    });

    updateInvoiceStatusBar = function (invoiceId) {
        $.ajax({
            url: "<?php echo get_uri("sales/s_invoices/get_invoice_status_bar"); ?>/" + invoiceId,
            success: function (result) {
                if (result) {
                    $("#invoice-status-bar").html(result);
                }
            }
        });
    };
    $(document).ready(function () {

        $("#invoices-form .select2").select2();
        setDatePicker("#inv_date");
        setDatePicker("#end_date");
        // $("#invoices-form").appForm({
        //     onSuccess: function (result) {
        //         $("#invoices-table").appTable({newData: result.data, dataId: result.id});
        //     }
        // });
            RELOAD_VIEW_AFTER_UPDATE = false; //go to invoice page
        
        $("#invoices-form").appForm({
            onSuccess: function (result) {
                if (typeof RELOAD_VIEW_AFTER_UPDATE !== "undefined" && RELOAD_VIEW_AFTER_UPDATE) {
                    location.reload();
                } else {
                    window.location = "<?php echo site_url('sales/s_invoices/view'); ?>/" + result.id;
                }
            },
            onAjaxSuccess: function (result) {
                if (!result.success && result.next_recurring_date_error) {
                    $("#next_recurring_date").val(result.next_recurring_date_value);
                    $("#next_recurring_date_container").removeClass("hide");

                    $("#invoice-form").data("validator").showErrors({
                        "next_recurring_date": result.next_recurring_date_error
                    });
                }
            }
        });
        $("#fid_cust").select2().on("change", function () {
            var client_id = $(this).val();
            if ($(this).val()) {
                // $('#invoice_project_id').select2("destroy");
                // $("#invoice_project_id").hide();
                // appLoader.show({container: "#invoice-porject-dropdown-section"});
                $.ajax({
                    url: "<?php echo get_uri("master/customers/getId") ?>" + "/" + client_id,
                    dataType: "json",
                    // data: data,
                    type:'GET',
                    success: function (data) {

                         $.each(data, function(index, element) {

                            $("#email_to").val(element.email);
                            $("#inv_address").val(element.address);
                            $("#delivery_address").val(element.address);
                         });
                    }
                });
            }
        });
        $("#fid_order").select2().on("change", function () {
            var client_id = $(this).val();
            if ($(this).val()) {
                // $('#invoice_project_id').select2("destroy");
                // $("#invoice_project_id").hide();
                // appLoader.show({container: "#invoice-porject-dropdown-section"});
                $.ajax({
                    url: "<?php echo get_uri("sales/s_invoices/getOrderId") ?>" + "/" + client_id,
                    dataType: "json",
                    // data: data,
                    type:'GET',
                    success: function (data) {

                         $.each(data, function(index, element) {
                            $("#fid_cust").val(element.id).select2();
                            
                            $("#email_to").val(element.email);
                            $("#inv_address").val(element.address);
                            $("#delivery_address").val(element.address);
                         });
                    }
                });
                $.ajax({
                    url: "<?php echo get_uri("sales/s_invoices/getOrderId") ?>" + "/" + client_id,
                    dataType: "json",
                    // data: data,
                    type:'GET',
                    success: function (data) {

                         $.each(data, function(index, element) {
                            $("#fid_cust").val(element.id).select2();
                            
                            $("#email_to").val(element.email);
                            $("#inv_address").val(element.address);
                            $("#delivery_address").val(element.address);
                         });
                    }
                });
            }
        });
    });
</script>
           
        </div>
    </div>
</div>


