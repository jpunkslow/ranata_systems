<?php echo form_open(get_uri("accounting/expenses/save"), array("id" => "master_coa-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id ?>">
    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
            
           
            <div class="form-group">
                <label for="code" class=" col-md-3">Transaction Code</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "code",
                        "name" => "code",
                        "class" => "form-control",
                        "value" => $model_info->code,
                        "readonly" => true,
                        "placeholder" =>  'Journal Code',
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
             <div class="form-group">
                <label for="fid_order" class=" col-md-3">REF PROJECT  #</label>
                    <div class=" col-md-9">
                        <?php
                           echo form_dropdown("fid_project", $project_dropdown, $model_info->fid_project, "class='select2 validate-hidden' id='fid_project' ");
                            ?>
                    </div>
            </div>
            <div class="form-group">
                <label for="voucher_code" class=" col-md-3">Voucher Code</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "voucher_code",
                        "name" => "voucher_code",
                        "value" => $model_info->voucher_code,
                        "class" => "form-control",
                        "readonly" => true,
                        "data-rule-required" => true,
                        "placeholder" => 'Voucher Number',
                        "data-msg-required" => lang("field_required")
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="date" class=" col-md-3">Date</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "date",
                        "name" => "date",
                        "class" => "form-control",
                        "placeholder" => 'Y-m-d',
                        "value" => $model_info->date,
                    ));
                    ?>
                </div>
            </div>
            
            <div class="form-group">
                <label for="description" class=" col-md-3">Description</label>
                <div class=" col-md-9">
                    <?php
                    echo form_textarea(array(
                        "id" => "description",
                        "name" => "description",
                        "class" => "form-control",
                        "value" => $model_info->description,
                        "data-rule-required" => true,
                        "placeholder" => 'Memo',
                        "data-msg-required" => lang("field_required")
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
    $(document).ready(function () {
        $("#master_coa-form .select2").select2();
        setDatePicker("#date");
        $("#master_coa-form").appForm({
            onSuccess: function (result) {
                 if (typeof RELOAD_VIEW_AFTER_UPDATE !== "undefined" && RELOAD_VIEW_AFTER_UPDATE) {
                    location.reload();
                } else {
                    location.reload();
                }
            },
        });
        $("#form-submit").click(function() {
            $("#master_coa-form").trigger('submit');
        });
        
        
    });
</script>