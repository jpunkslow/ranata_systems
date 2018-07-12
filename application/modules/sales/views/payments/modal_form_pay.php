<?php echo form_open(get_uri("sales/s_payments/pay_save"), array("id" => "order-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    <input type="hidden" name="fid_cust" value="<?php echo $model_info->fid_cust; ?>" />
    <input type="hidden" name="fid_inv" value="<?php echo $model_info->id; ?>" />
    <input type="hidden" name="paid" value="<?php echo $model_info->paid; ?>" />



    <div class="form-group">
        <label for="voucher" class=" col-md-3">NO VOUCHER</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "voucher",
                "name" => "voucher",
                "value"=> getMaxId("sales_payments","PAY"),
                "class" => "form-control validate-hidden",
                "readonly" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="fid_bank" class="col-md-3">BANK</label>
        <div class=" col-md-9">
            <?php
            echo form_dropdown("fid_bank", $bank_dropdown, "", "class='select2 tax-select2'");
            
            ?>
        </div>
    </div>
   
   <!--  <div class="form-group">
        <label for="inv_date" class="col-md-3">Tanggal Invoices</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "inv_date",
                "name" => "inv_date",
                "class" => "form-control",
                "value" => format_to_date($model_info->inv_date),
                "placeholder" => "Y/m/d",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div> -->
    <div class="form-group">
        <label for="pay_date" class="col-md-3">PAY DATE</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "pay_date",
                "name" => "pay_date",
                "class" => "form-control",
                "value" => date("Y/m/d"),
                "placeholder" => "Y/m/d",
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
        <label for="currency" class=" col-md-3">CURRENCY</label>
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
    <?php //if($model_info->paid  == "Not Paid"){ ?>
    <!-- <div class="form-group">
        <label for="total" class="col-md-3">TOTAL AMOUNT</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "total",
                "name" => "total",
                "class" => "form-control",
                // "value" => $model_info->amount,

                "placeholder" => "",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div> -->
    <?php //} ?>
     <div class="form-group">
        <label for="residual" class="col-md-3">TOTAL PAID</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "residual",
                "name" => "residual",
                "class" => "form-control",
                "value" => $model_info->residual,
                "placeholder" => "",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
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
                
                "class" => "form-control",
                "placeholder" => ""
            ));
            ?>
        </div>
    </div>
    <!-- <div class="form-group">
        <label for="status" class=" col-md-3">Status order</label>
        <div class="col-md-9">
             <?php 
                echo form_dropdown(
                    "status", array(
                        "draft" => "Draft",
                        "sent" => "Sent"
                        ), $model_info->status, "class='select2 mini'"
                    );
                        ?>
        </div>
    </div> -->
    
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        RELOAD_VIEW_AFTER_UPDATE = false; //go to invoice page
        

        $("#order-form .select2").select2();
        setDatePicker("#inv_date");
        $("#order-form").appForm({
            onSuccess: function (result) {
                if (typeof RELOAD_VIEW_AFTER_UPDATE !== "undefined" && RELOAD_VIEW_AFTER_UPDATE) {
                    location.reload();
                } else {
                    window.location = "<?php echo site_url('sales/s_payments/prints/'); ?>"+ result.id ;
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
        
        
    });
</script>