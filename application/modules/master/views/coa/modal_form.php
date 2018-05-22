<?php echo form_open(get_uri("master/coa/add"), array("id" => "master_coa-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
            <div class="form-group">
                <label for="parent" class=" col-md-3"> Head Accounts</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown("parent", $head_dropdown, "", "class='select2 validate-hidden' id='parent' ");
                                                    
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="account_number" class=" col-md-3">No Account</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "account_number",
                        "name" => "account_number",
                        "class" => "form-control",
                        "placeholder" =>  'Account',
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="account_name" class=" col-md-3">Account Name</label>
                <div class=" col-md-9">
                    <?php
                    echo form_textarea(array(
                        "id" => "account_name",
                        "name" => "account_name",
                        "class" => "form-control",
                        "data-rule-required" => true,
                        "placeholder" => 'Nama Akun',
                        "data-msg-required" => lang("field_required")
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="account_type" class=" col-md-3">TYPE</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown(
                                "account_type", array(
                            "Aktiva" => "Aktiva",
                            "Passiva" => "Passiva",
                            'Income' => "Income",
                            'Cost Of Good Sold' => "Cost Of Good Sold",
                            'Expenses' => "Expenses",
                            'Other Income' => "Other Income",
                            'Other Expenses' => "Other Expenses"
                                ), "", "class='select2 mini'"
                        );
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="normally" class=" col-md-3">Debit/Kredit</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown(
                                "normally", array(
                                    "Debet" => "Debet",
                            "Kredit" => "Kredit"
                                ), "", "class='select2 mini'"
                        );
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="reporting" class=" col-md-3">Reporting</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown(
                                "reporting", array(
                                    "" => "",
                            "Neraca" => "NERACA",
                            "Laba Rugi" => "LABA RUGI"
                                ), "", "class='select2 mini'"
                        );
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="akun" class=" col-md-3">ACCOUNT</label>
                <div class=" col-md-9">
                    <?php
                   echo form_dropdown(
                                "akun", array(
                            "pemasukan" => "PEMASUKAN",
                            "pengeluaran" => "PENGELUARAN"
                                ), "", "class='select2 mini'"
                        );
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

        $("#master_coa-form .select2").select2();
        $("#master_coa-form").appForm({
            onSuccess: function(result) {
                if (result.success) {
                    $("#master_coa-table").appTable({newData: result.data, dataId: result.id});
                }
            }
       });

        $("#master_coa-form input").keydown(function(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                      $("#master_coa-form").trigger('submit');
                
            }
        });
        $("#kd_aktiva").focus();
       

        $("#form-submit").click(function() {
            $("#master_coa-form").trigger('submit');
        });

    });
</script>