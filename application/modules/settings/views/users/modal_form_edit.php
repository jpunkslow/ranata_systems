<?php echo form_open(get_uri("settings/users/save"), array("id" => "users-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>">
    <div class="form-group">
        <label for="first_name" class=" col-md-3">First Name</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "first_name",
                "name" => "first_name",
                "class" => "form-control",
                "placeholder" => "Fist Name",
                "value" => $model_info->first_name,
                "autofocus" => true,
                "data-rule-required" => true,
                'autocomplete' => "off",
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="last_name" class=" col-md-3">Last Name</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "last_name",
                "name" => "last_name",
                "class" => "form-control",
                "placeholder" => "Last Name",
                "value" => $model_info->first_name,
                "data-rule-required" => true,
                'autocomplete' => "off",
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="email" class=" col-md-3">Email Address</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "email",
                "name" => "email",
                "class" => "form-control",
                "placeholder" => "usermail@mail.com",
               "value" => $model_info->email,
                "data-rule-required" => true,
                'autocomplete' => "off",
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="user_type" class=" col-md-3">User Type</label>
        <div class=" col-md-9">
            <?php
            echo form_dropdown('user_type', array(
                "staff" => "STAFF",
                'acccounting' => "ACCOUNTING",
                'inventory' => "INVENTORY",
                'manager' => "MANAGER",
                'administrator' => "ADMINISTRATOR"
            ), $model_info->user_type ,"class='select2 mini'");
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="status" class=" col-md-3">Status</label>
        <div class=" col-md-9">
            <?php
            echo form_dropdown('status', array(
                "active" => "ACTIVE",
                'inactive' => "NOT ACTIVE"
            ), $model_info->status ,"class='select2 mini'");
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
    $(document).ready(function() {
        $("#users-form .select2").select2();
        $("#users-form").appForm({
            onSuccess: function(result) {
                $("#users-table").appTable({newData: result.data, dataId: result.id});
            }
        });
        $("#first_name").focus();
    });
</script>    