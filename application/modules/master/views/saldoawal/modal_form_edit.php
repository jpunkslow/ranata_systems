<?php echo form_open(get_uri("master/saldoawal/save"), array("id" => "item-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />

    

    <div class="form-group">
        <label for="periode" class=" col-md-3">PERIODE</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "periode",
                "name" => "periode",
                "value" => $model_info->periode,
                "class" => "form-control validate-hidden",
                "placeholder" => lang('title'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="fid_coa" class="col-md-3">Chart Of Account</label>
        <div class=" col-md-9">
            <?php
            echo form_dropdown("fid_coa", $coa_dropdown, $model_info->fid_coa, "class='select2 validate-hidden' id='fid_coa' ");
                   
            ?>
        </div>
    </div>
  
    <div class="form-group">
        <label for="amount" class="col-md-3">Amount</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "amount",
                "name" => "amount",

                "value" => ($model_info->debet? $model_info->debet : $model_info->credit),
                "class" => "form-control",
                "placeholder" => "0"
            ));
            ?>
        </div>
    </div>

    <input type="hidden" id="dk" name="dk" value="<?php echo $model_info_coa->normally ?>">
  
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        setDatePicker("#date");
        $("#item-form .select2").select2();
        $("#item-form").appForm({
            onSuccess: function (result) {
                $("#saldoawal-table").appTable({newData: result.data, dataId: result.id});
            }
        });
        $("#fid_coa").select2().on("change", function () {
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
                            $("#dk").val("")
                            $("#dk").val(element.normally);
                         });
                    }
                });
            }
        });
    });
</script>