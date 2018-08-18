<?php echo form_open(get_uri("accounting/journal_entry/add_detail"), array("id" => "master_coa-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $info_header->id ?>">
    <input type="hidden" name="journal_code" value="<?php echo $info_header->code ?>">
    <input type="hidden" name="voucher_code" value="<?php echo $info_header->voucher_code ?>">
    <input type="hidden" name="fid_coa_header" value="<?php echo $info_header->fid_coa ?>">
    <input type="hidden" name="date" value="<?php echo $info_header->date ?>">
    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
            
            <div class="form-group">
                <label for="fid_coa" class=" col-md-3"> Entry Accounts</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown("fid_coa", $acc_dropdown, "", "class='select2 validate-hidden' id='fid_coa' ");
                                                    
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="debet" class=" col-md-3">Debet</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "debet",
                        "name" => "debet",
                        "class" => "form-control",
                        "autocomplete" => "off",
                        "placeholder" => '0',
                    ));
                    ?>
                </div>
            </div>
             <div class="form-group">
                <label for="credit" class=" col-md-3">Credit</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "credit",
                        "name" => "credit",
                        "class" => "form-control",
                        "autocomplete" => "off",
                        "placeholder" => '0',
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

        RELOAD_VIEW_AFTER_UPDATE = false; //go to invoice page
        $("#master_coa-form .select2").select2();
        setDatePicker("#date");
         $('#debet').maskMoney(
            {precision:0 
        });
        
        $('input[id=debet]').change(function() {
            var value = $(this).val();
            
        });
         $('#credit').maskMoney(
            {precision:0 
        });
        
        $('input[id=credit]').change(function() {
            var value = $(this).val();
            
        });
        $("#master_coa-form").appForm({
            onSuccess: function (result) {
                
                $("#journal-table").appTable({newData: result.data, dataId: result.id});
                // if (typeof RELOAD_VIEW_AFTER_UPDATE !== "undefined" && RELOAD_VIEW_AFTER_UPDATE) {
                //     location.reload();
                // } else {
                //     // location.reload();

                //     // window.location = "<?php echo site_url('accounting/journal_entry/entry'); ?>/" + result.id+ "/"+result.fid_coa;
                // }
            },
        });
        $("#form-submit").click(function() {
            $("#master_coa-form").trigger('submit');
        });
        
        
    });
</script>