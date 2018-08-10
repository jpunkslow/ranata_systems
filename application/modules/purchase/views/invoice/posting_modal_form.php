<?php echo form_open(get_uri("purchase/p_invoices/posting_save"), array("id" => "invoices-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

     <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
     <input type="hidden" name="fid_cust" value="<?php echo $model_info->fid_cust; ?>" />

     <input type="hidden" name="fid_tax" value="<?php echo $model_info->fid_tax; ?>" />


    <div class="form-group">
        <label for="code" class=" col-md-3">INVOICES ID</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "code",
                "name" => "code",
                "value"=> $model_info->code,
                "class" => "form-control validate-hidden",
                "readonly" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    
    <div class="form-group">
        <label for="currency" class=" col-md-3">Mata Uang</label>
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
     <div class="form-group">
        <label for="pay_type" class=" col-md-3">PAYMENT TYPE</label>
        <div class="col-md-9">
             <?php 
                echo form_dropdown(
                    "pay_type", array(
                        "CREDIT" => "CREDIT",
                        "DP" => "DOWN PAYMENT"
                        ), "", "class='select2 mini' id='pay_type'"
                    );
                        ?>
        </div>
    </div>
    <div class="form-group" id="cash">
        <label for="fid_bank" class="col-md-3">CASH / BANK</label>
        <div class=" col-md-9">
            <?php
            echo form_dropdown("fid_bank", $bank_dropdown, "", "class='select2 tax-select2'");
            
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="amount" class="col-md-3">Total Amount</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "amount",
                "name" => "amount",
                "value" => number_format($invoice_total_summary->invoice_total),
                "class" => "form-control",
                "readonly" => true,
                "placeholder" => "0",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")
            ));
            ?>
        </div>
    </div>
    <div class="form-group" id="dp_field" style="display: none;">
        <label for="dp" class="col-md-3">Down Payment</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "dp",
                "name" => "dp",
                "class" => "form-control",
                "placeholder" => "0",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")

            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="memo" class="col-md-3">Memo</label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "memo",
                "name" => "memo",
                "class" => "form-control"
            ));
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
        $('#invoice_item_rate').maskMoney(
            {precision:0 
        });
        $('#dp').maskMoney(
            {precision:0 
        });
        
        $('input[name=dp]').change(function() {
            var value = $(this).val();
            
        });
          RELOAD_VIEW_AFTER_UPDATE = false; //go to invoice page
        
        $("#invoices-form .select2").select2();
        setDatePicker("#inv_date");
        $("#invoices-form").appForm({
            onSuccess: function (result) {
                if (typeof RELOAD_VIEW_AFTER_UPDATE !== "undefined" && RELOAD_VIEW_AFTER_UPDATE) {
                    location.reload();
                } else {
                    location.reload();
                }
            }
        });
        $("#pay_type").select2().on("change", function () {
            var client_id = $(this).val();
            if ($(this).val()) {
                if(client_id == "DP"){
                    $("#dp_field").show();
                }else if(client_id == "CASH"){
                    $("#cash").show();
                }else{
                    $("#dp_field").hide();
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
    });
</script>