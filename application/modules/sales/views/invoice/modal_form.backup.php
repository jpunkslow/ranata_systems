<?php echo form_open(get_uri("sales/s_invoices/add"), array("id" => "invoices-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    <input type="hidden" name="add_new_item_to_library" value="" id="add_new_item_to_library" />

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
                "value" => getMaxId('sales_invoices',"INV"),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <input type="hidden" name="order_id" value="<?php echo $model_info->id ?>">
        <label for="fid_order" class=" col-md-3">REF ORDER  #</label>
            <div class=" col-md-9">
                <?php
                   echo form_dropdown("fid_order", $order_dropdown, "", "class='select2 validate-hidden' id='fid_order' ");
                    ?>
            </div>
    </div>
    <input type="hidden" name="fid_cust" id="fid_cust" value="0">  
    <div class="form-group">
        <label for="fid_cust" class="col-md-3">Customers Name</label>
        <div class=" col-md-9">
            <?php
            // echo form_dropdown("fid_cust", $clients_dropdown, "", "class='select2 validate-hidden' id='fid_cust' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
             echo form_input(array(
                "id" => "customers_id",
                "name" => "customers_name",
                "class" => "form-control validate-hidden",
                "placeholder" => lang('select_or_create_new_customers'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
            <a id="customer_dropdown_id" tabindex="-1" href="javascript:void(0);" style="color: #B3B3B3;float: right; padding: 5px 7px; margin-top: -35px; font-size: 18px;"><span>×</span></a>
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
                "placeholder" => "client@example.com"
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="inv_address" class=" col-md-3">Address</label>
        <div class="col-md-9">
             <?php 
                echo form_textarea(array(
                "id" => "inv_address",
                "name" => "inv_address",
                "class" => "form-control",
                "placeholder" => "Address ",
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
                "placeholder" => "Y/m/d",
                "value" => date("Y-m-d"),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
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
                        ), "", "class='select2 mini'"
                    );
                        ?>
        </div>
    </div>

    
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {

        $("#invoices-form .select2").select2();
        setDatePicker("#inv_date");
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
        // $("#fid_cust").select2().on("change", function () {
        //     var client_id = $(this).val();
        //     if ($(this).val()) {
        //         // $('#invoice_project_id').select2("destroy");
        //         // $("#invoice_project_id").hide();
        //         // appLoader.show({container: "#invoice-porject-dropdown-section"});
        //         $.ajax({
        //             url: "<?php echo get_uri("master/customers/getId") ?>" + "/" + client_id,
        //             dataType: "json",
        //             // data: data,
        //             type:'GET',
        //             success: function (data) {

        //                  $.each(data, function(index, element) {

        //                     $("#email_to").val(element.email);
        //                     $("#inv_address").val(element.address);
        //                     $("#delivery_address").val(element.address);
        //                  });
        //             }
        //         });
        //     }
        // });
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
                            $("#fid_cust").val(element.id);
                            $("#customers_id").val(element.name);
                            
                            $("#email_to").val(element.email);
                            $("#inv_address").val(element.address);
                            $("#delivery_address").val(element.address);
                         });
                    }
                });
            }
        });

        $("#customer_dropdown_id").click(function () {
            applySelect2OnItemTitle();
        })
    });

    function applySelect2OnItemTitle() {
        $("#customers_id").select2({
            showSearchBox: true,
            ajax: {
                url: "<?php echo get_uri("master/customers/get_customer_suggestion"); ?>",
                dataType: 'json',
                quietMillis: 250,
                data: function (term, page) {
                    return {
                        q: term // search term
                    };
                },
                results: function (data, page) {
                    return {results: data};
                }
            }
        }).change(function (e) {
            if (e.val === "+") {
                //show simple textbox to input the new item
                $("#customers_id").select2("destroy").val("").focus();
                $("#add_new_item_to_library").val(1); //set the flag to add new item in library
            } else if (e.val) {
                //get existing item info
                $("#add_new_item_to_library").val(""); //reset the flag to add new item in library
                $.ajax({
                    url: "<?php echo get_uri("master/customers/get_info_suggestion"); ?>",
                    data: {item_name: e.val},
                    cache: false,
                    type: 'POST',
                    dataType: "json",
                    success: function (response) {

                        //auto fill the description, unit type and rate fields.
                        if (response && response.success) {

                            $("#email_to").val(response.cust.email);
                            $("#inv_address").val(response.cust.address);
                        }
                    }
                });
            }

        });
    }
</script>