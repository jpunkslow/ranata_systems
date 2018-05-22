<?php echo form_open(get_uri("projects/save_project_member"), array("id" => "project-member-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <input type="hidden" name="project_id" value="<?php echo $project_id; ?>" />
    <div class="form-group" style="min-height: 50px">
        <label for="user_id" class=" col-md-3"><?php echo lang('member'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("user_id", $users_dropdown, array($model_info->user_id), "class='select2'");
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
        $("#project-member-form").appForm({
            onSuccess: function(result) {
                if (result.id !== "exists") {
                    $("#project-member-table").appTable({newData: result.data, dataId: result.id});
                }
            }
        });
        $("#project-member-form .select2").select2();
    });
</script>    