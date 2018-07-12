<?php echo form_open(get_uri("master/vendors/save"), array("id" => "vendor-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />

    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
           
            <div class="form-group">
                <label for="name" class=" col-md-3">Vendor Name</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "name",
                        "name" => "name",
                        "value" => $model_info->name,
                        "class" => "form-control",
                        "placeholder" => 'Vendor Name / Company Name',
                        "autofocus" => true,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            
            <div class="form-group">
                <label for="npwp" class=" col-md-3">NPWP Number</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "npwp",
                        "name" => "npwp",
                        "value" => $model_info->npwp,
                        "class" => "form-control",
                        "placeholder" =>  'NPWP Number',
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class=" col-md-3">Email</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "email",
                        "name" => "email",
                        "value" => $model_info->email,
                        "class" => "form-control",
                        "placeholder" =>  'mail@example.com'
                        // "data-rule-required" => true,
                        // "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class=" col-md-3">Address</label>
                <div class=" col-md-9">
                    <?php
                    echo form_textarea(array(
                        "id" => "address",
                        "name" => "address",
                        "value" => $model_info->address,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => 'Address details'
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="termin" class=" col-md-3">Termin</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown(
                    "termin", array(
                         "7" => "7 Hari",
                        "14" => "14 Hari",
                        "30" => "30 Hari",
                        "120" => "> 30 Hari"
                        ), $model_info->termin, "class='select2 mini'"
                    );
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="contact" class=" col-md-3">Phone/Contact</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "contact",
                        "name" => "contact",
                        "value" => $model_info->contact,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "08XXXXXXXXXX"
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="mobile_number" class=" col-md-3">Mobile Number</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "mobile_number",
                        "name" => "mobile_number",
                        "value" => $model_info->mobile_number,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "08XXXXXXXXXX"
                    ));
                    ?>
                </div>
            </div>
            <!-- <div class="form-group">
                <label for="credit_limit" class=" col-md-3">Credits Limit </label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "credit_limit",
                        "name" => "credit_limit",
                        "value" => $model_info->credit_limit,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "1000000"
                    ));
                    ?>
                </div>
            </div> -->
            <div class="form-group">
                <label for="memo" class=" col-md-3">Memo</label>
                <div class=" col-md-9">
                    <?php
                    echo form_textarea(array(
                        "id" => "memo",
                        "name" => "memo",
                        "value" => $model_info->memo,
                        "class" => "form-control",
                        "placeholder" => 'Memo or Description'
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
        $("#vendor-form .select2").select2();
        $("#vendor-form").appForm({
            onSuccess: function(result) {
                if (result.success) {
                    $("#vendor-table").appTable({newData: result.data, dataId: result.id});
                }
            }
       });

        $("#vendor-form input").keydown(function(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                      $("#vendor-form").trigger('submit');
                
            }
        });
        $("#name").focus();
       

        $("#form-submit").click(function() {
            $("#vendor-form").trigger('submit');
        });

    });
</script>