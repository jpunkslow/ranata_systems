<?php echo form_open(get_uri("master/customers/add_customers"), array("id" => "master_customers-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <div class="col-md-12">
            <div class="form-group">
                <label for="code" class=" col-md-3"> Kode Customer</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "code",
                        "name" => "code",
                        "class" => "form-control",
                        "placeholder" => 'Customers Name',
                        "value" => getCodeId('master_customers',"CS"),
                        "readonly" => true,
                        "autofocus" => true,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="name" class=" col-md-3"> Nama Customer</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "name",
                        "name" => "name",
                        "class" => "form-control",
                        "placeholder" => 'Customers Name / Company Name',
                        "autofocus" => true,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <!-- <div class="form-group">
                <label for="company_name" class=" col-md-3"> Nama Perusahaan</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "company_name",
                        "name" => "company_name",
                        "class" => "form-control",
                        "placeholder" =>  'Company Name',
                    ));
                    ?>
                </div>
            </div> -->
            <div class="form-group">
                <label for="npwp" class=" col-md-3">Nomor NPWP</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "npwp",
                        "name" => "npwp",
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
                        "30" => "1-30 Hari",
                        "60" => "1-60 Hari",
                        "90" => "1-90 Hari",
                        "120" => "1-120 Hari",
                        '150' => "1-150 Hari"
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
                        "class" => "form-control",
                        "placeholder" =>  'Mobile Number',
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
                        "class" => "form-control",
                        "placeholder" => 'Others Details'
                    ));
                    ?>
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