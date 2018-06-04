<?php echo form_open(get_uri("master/saldoawal/add"), array("id" => "item-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    

    <div class="form-group">
        <label for="periode" class=" col-md-3">PERIODE</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "periode",
                "name" => "periode",
                "value" => date("Y"),
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
            echo form_dropdown("fid_coa", $coa_dropdown, "", "class='select2 validate-hidden' id='fid_coa' ");
                   
            ?>
        </div>
    </div>
  
    <div class="form-group">
        <label for="debet" class="col-md-3">DEBET</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "debet",
                "name" => "debet",
                "class" => "form-control",
                "placeholder" => "0"
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="credit" class="col-md-3">CREDIT</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "credit",
                "name" => "credit",
                "class" => "form-control",
                "placeholder" => "0"
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="date" class="col-md-3">DATE</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "date",
                "name" => "date",
                "value" => date("Y-m-d"),
                "class" => "form-control",
                "placeholder" => "Y-m-d"
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
        setDatePicker("#date");
        $("#item-form .select2").select2();
        $("#item-form").appForm({
            onSuccess: function (result) {
                $("#item-table").appTable({newData: result.data, dataId: result.id});
            }
        });
    });
</script>