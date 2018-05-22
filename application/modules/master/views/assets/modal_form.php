<?php echo form_open(get_uri("master/assets/add"), array("id" => "assets-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

  

    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
            <div class="form-group">
                <label for="activa_code" class=" col-md-3">Assets Code</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_code",
                        "name" => "activa_code",
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
                <label for="npwp" class=" col-md-3">Assets Type</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_type",
                        "name" => "activa_type",
                        "class" => "form-control",
                        "placeholder" =>  'Activa Type',
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
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
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "Activa Pricing"
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="depreciated_method" class=" col-md-3">Depreciated Method</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "depreciated_method",
                        "name" => "depreciated_method",
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "Depreciated Method"
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="activa_account" class=" col-md-3">Assets Account </label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_account",
                        "name" => "activa_account",
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "Assets Account"
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="activa_depreciate_account" class=" col-md-3">Activa Depreciated Account</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_depreciate_account",
                        "name" => "activa_depreciate_account",
                        "class" => "form-control",
                        "placeholder" => 'Activa Depreciated Account'
                    ));
                    ?>
                </div>
            </div>
             <div class="form-group">
                <label for="activa_expense_depre_account" class=" col-md-3">Expense Depreciated Account</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "activa_expense_depre_account",
                        "name" => "activa_expense_depre_account",
                        "class" => "form-control",
                        "placeholder" => 'Expense Depreciated Account'
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

    });
</script>