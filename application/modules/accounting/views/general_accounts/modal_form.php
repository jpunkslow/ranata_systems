<?php echo form_open(get_uri("accounting/general_accounts/add"), array("id" => "generalledger-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    

    <div class="form-group">
        <label for="code_voucher" class=" col-md-3">KODE VOUCHER</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "code_voucher",
                "name" => "code_voucher",
                "class" => "form-control validate-hidden",
                "autofocus" => true,
                "value" => "R00".date("ymd").date("His"),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    
    <div class="form-group">
        <label for="date" class="col-md-3">Tanggal</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "date",
                "name" => "date",
                "class" => "form-control",
                "placeholder" => "",
                "value"  => date("Y-m-d")
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="description" class=" col-md-3">Deskripsi</label>
        <div class="col-md-9">
             <?php 
                echo form_input(array(
                "id" => "description",
                "name" => "description",
                "class" => "form-control",
                "placeholder" => "",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")

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
        RELOAD_VIEW_AFTER_UPDATE = false;
        $("#generalledger-form .select2").select2();
        setDatePicker("#date");
        $("#generalledger-form").appForm({
            onSuccess: function (result) {
                if (typeof RELOAD_VIEW_AFTER_UPDATE !== "undefined" && RELOAD_VIEW_AFTER_UPDATE) {
                    location.reload();
                } else {
                    window.location = "<?php echo site_url('accounting/general_accounts/jurnal_input/'); ?>" + result.id;
                }
            },
        });
        
        $("#account_number").select2().on("change", function () {
            var client_id = $(this).val();
            if ($(this).val()) {
                // $('#invoice_project_id').select2("destroy");
                // $("#invoice_project_id").hide();
                // appLoader.show({container: "#invoice-porject-dropdown-section"});
                $.ajax({
                    url: "<?php echo get_uri("master/coa/getId") ?>" + "/" + client_id,
                    dataType: "json",
                    // data: data,
                    type:'GET',
                    success: function (data) {

                         $.each(data, function(index, element) {

                            $("#account_name").val(element.coa+" "+element.jns_trans);
                            // $("#inv_address").val(element.address);
                            // $("#delivery_address").val(element.address);
                         });
                    }
                });
            }
        });
    });
</script>