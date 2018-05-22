<?php echo form_open(get_uri("sales/order/save_item_quot"), array("id" => "order-item-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <div class="form-group">
        <input type="hidden" name="order_id" value="<?php echo $model_info->id ?>">
        <label for="quot" class=" col-md-3"> QUOTATION ID #</label>
            <div class=" col-md-9">
                <?php
                   echo form_dropdown("quot", $quot_dropdown, "", "class='select2 validate-hidden' id='quot' ");
                    ?>
            </div>
    </div>    
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo "Add" ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {

        $("#order-item-form .select2").select2();
        $("#order-item-form").appForm({
            onSuccess: function (result) {
                $("#order-item-table").appTable({newData: result.data, dataId: result.id});
                $("#order-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            }
        });

       updateInvoiceStatusBar = function (invoiceId) {
        $.ajax({
            url: "<?php echo get_uri("sales/order/get_invoice_status_bar"); ?>/" + invoiceId,
            success: function (result) {
                if (result) {
                    $("#invoice-status-bar").html(result);
                }
            }
        });
    };
    });





</script>