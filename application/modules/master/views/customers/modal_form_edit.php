<?php echo form_open(get_uri("master/customers/save"), array("id" => "master_customers-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />

    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
             <div class="form-group">
                <label for="code" class=" col-md-3">Customer Code</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "code",
                        "name" => "code",
                        "class" => "form-control",
                        "placeholder" => 'Customers Name',
                        "value" => $model_info->code,
                        "readonly" => true,
                        "autofocus" => true,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
             <div class="form-group">
                <label for="name" class=" col-md-3"> Customer Name</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "name",
                        "name" => "name",
                        "value" => $model_info->name,
                        "class" => "form-control",
                        "placeholder" => 'Customers Name / Company Name',
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
                        "placeholder" =>  'mail@example.com',
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
                        "placeholder" => 'Customer Detail Address',
                        "data-msg-required" => lang("field_required")
                    ));
                    ?>
                </div>
            </div>
             <div class="form-group">
                <label for="termin" class=" col-md-3">Term Of Payment</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown(
                    "termin", array(
                        "7" => "7 Hari",
                        "14" => "14 Hari",
                        "30" => "30 Hari",
                        "120" => "> 30 Hari"
                        ), "", "class='select2 mini'"
                    );
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="contact" class=" col-md-3">Phone Number</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "contact",
                        "name" => "contact",
                        "value" => $model_info->contact,
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => "Ex: 02XXXXXXXXXX"
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="mobile" class=" col-md-3">Mobile Number</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "mobile",
                        "name" => "mobile",
                        "value" => $model_info->mobile,
                        "class" => "form-control",
                        "placeholder" =>  'Ex: 085xxxxxxxxxx',
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="pemasukan" class=" col-md-3">Credit Limit</label>
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
            </div>
            <div class="form-group">
                <label for="memo" class=" col-md-3">Memo</label>
                <div class=" col-md-9">
                    <?php
                    echo form_textarea(array(
                        "id" => "memo",
                        "name" => "memo",
                        "value" => $model_info->memo,
                        "class" => "form-control",
                        "placeholder" => 'Others Details'
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
        $("#master_customers-form .select2").select2();
        $("#master_customers-form").appForm({
            onSuccess: function(result) {
                if (result.success) {
                    $("#master_customers-table").appTable({newData: result.data, dataId: result.id});
                }
            }
       });

        $("#master_customers-form input").keydown(function(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                      $("#master_customers-form").trigger('submit');
                
            }
        });
        $("#name").focus();
       

        $("#form-submit").click(function() {
            $("#master_customers-form").trigger('submit');
        });

    });
</script>