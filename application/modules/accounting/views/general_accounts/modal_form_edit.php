<?php echo form_open(get_uri("accounting/general_accounts/save"), array("id" => "generalledger-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

        <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />


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
                "readonly"  => true,
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
                "value"  => $model_info->date
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
                "value"  => $model_info->description
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

        $("#generalledger-form .select2").select2();
        setDatePicker("#date");
        $("#generalledger-form").appForm({
            onSuccess: function (result) {
                $("#generalledger-table").appTable({newData: result.data, dataId: result.id});
            }
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