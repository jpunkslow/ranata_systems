<?php echo form_open(get_uri("master/assets/save"), array("id" => "assets-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />

    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
            <div class="form-group">
                <label for="activa_code" class=" col-md-3">Assets Code</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_code",
                        "name" => "activa_code",
                        "value" => $model_info->activa_code,
                        "class" => "form-control",
                        "placeholder" => 'Activa Code',
                        "autofocus" => true,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
             <div class="form-group">
                <label for="asset_name" class=" col-md-3">Assets Name </label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "asset_name",
                        "name" => "asset_name",
                        "value" => $model_info->asset_name,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "Asset Name"
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="activa_type" class=" col-md-3">Assets Type</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown(
                                "activa_type", array(
                            "Peralatan_Toko" => "Peralatan Toko",
                            "Peralatan_Kantor" => "Peralatan Kantor",
                            "Kendaraan" => "Kendaraan",
                            "Bangunan" => "Bangunan",
                            "Tanah" => "Tanah",
                            "Lainnya" => "Lainnya"
                                ), $model_info->activa_type, "class='select2 mini' id='activa_type'"
                        );
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="activa_age" class=" col-md-3">Assets Age</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_age",
                        "name" => "activa_age",
                        "value" => $model_info->activa_age,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => 'Activa Age'
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="activa_pricing" class=" col-md-3">Assets Pricing </label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_pricing",
                        "name" => "activa_pricing",
                        "value" => $model_info->activa_pricing,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "Activa Pricing"
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="asset_residu" class=" col-md-3">Assets Residual </label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "asset_residu",
                        "name" => "asset_residu",
                        "class" => "form-control",
                        "value" => $model_info->asset_residu,
                        "data-rule-required" => true,
                        "placeholder" => "0"
                    ));
                    ?>
                </div>
            </div>
            
          
            <div class="form-group">
                <label for="activa_depreciate_account" class=" col-md-3">Activa Depreciated Account</label>
                <div class=" col-md-9">
                    <?php
                      echo form_dropdown("activa_depreciate_account", $activa_dropdown, $model_info->activa_depreciate_account, "class='select2 validate-hidden' id='activa_depreciate_account' ");
                    ?>
                </div>
            </div>
             <div class="form-group">
                <label for="activa_expense_depre_account" class=" col-md-3">Expense Depreciated Account</label>
                <div class=" col-md-9">
                    <?php
                   echo form_dropdown("activa_expense_depre_account", $expenses_dropdown, $model_info->activa_expense_depre_account, "class='select2 validate-hidden' id='activa_expense_depre_account' ");
            
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="get_date" class="col-md-3">GET DATE</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "get_date",
                        "name" => "get_date",
                        "class" => "form-control",
                        "placeholder" => "Y/m/d",
                        "value" => $model_info->get_date,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            
        </div>
    </div>

</div>


<div class="modal-footer">
    <button class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button id="form-submit" type="button" class="btn btn-primary "><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {
        $("#assets-form .select2").select2();
        setDatePicker("#get_date");
        $("#assets-form").appForm({
            onSuccess: function(result) {
                if (result.success) {
                    $("#assets-table").appTable({newData: result.data, dataId: result.id});
                }
            }
       });

        $("#assets-form input").keydown(function(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                      $("#assets-form").trigger('submit');
                
            }
        });
        $("#activa_code").focus();
       

        $("#form-submit").click(function() {
            $("#assets-form").trigger('submit');
        });
        $("#activa_type").select2().on("change", function () {
            var type = $(this).val();
            if ($(this).val()) {
                
                if(type == "Peralatan_Toko"){
                    
                    $("#activa_age").val(4);
                }
                if(type == "Peralatan_Kantor"){
                    $("#activa_age").val(4);
                }
                if(type == "Bangunan"){
                    $("#activa_age").val(20);
                }
                if(type == "Kendaraan"){
                    $("#activa_age").val(8);
                }

            }
        });

    });
</script>