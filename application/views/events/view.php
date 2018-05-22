<div class="modal-body">
    <div class="table-responsive mb15">
        <div class="col-md-12">
            <h4 class="mt0">
                <?php
                $share_title = lang("share_with") . ": ";
                if (!$model_info->share_with) {
                    $share_title .= lang("only_me");
                } else if ($model_info->share_with == "all") {
                    $share_title .= lang("all_team_members");
                } else {
                    $share_title .= lang("specific_members_and_teams");
                }

                echo "<span title='$share_title' style='color:" . $model_info->color . "' class='pull-left mr10'><i class='fa $event_icon'></i></span> " . $model_info->title;
                ?>
            </h4>

        </div>
        <div class="col-md-12 pb10 ">
            <i class="fa fa-clock-o"></i>
            <?php
            $this->load->view("events/event_time");
            ?>
        </div>

        <div class="col-md-12 pb10">
            <?php echo $labels; ?>
        </div>

        <div class="col-md-12">
            <blockquote class="font-14 text-justify" style="<?php echo "border-color:" . $model_info->color; ?>"><?php echo nl2br($model_info->description); ?></blockquote>
        </div>

        <?php if ($model_info->company_name) { ?>
            <div class="col-md-12 pb10 pt10 ">
                <i class="fa fa-briefcase"></i>
                <?php
                echo anchor("clients/view/" . $model_info->client_id, $model_info->company_name);
                ?>
            </div>
        <?php } ?>

        <?php if ($model_info->location) { ?>
            <div class="col-md-12 mt5">
                <div class="font-14"><i class="fa fa-map-marker"></i> <?php echo nl2br($model_info->location); ?></div>
            </div>
        <?php }
        ?>

        <div class="col-md-12 pt10">
            <?php
            $image_url = get_avatar($model_info->created_by_avatar);
            echo "<span class='avatar avatar-xs mr10'><img src='$image_url' alt=''></span><span>" . get_team_member_profile_link($model_info->created_by, $model_info->created_by_name, array("class" => "dark strong")) . "</span>";
            ?>
        </div>


    </div>
</div>

<div class="modal-footer">
    <?php
    if (isset($editable) && $editable === "1" && ($this->login_user->id == $model_info->created_by || $this->login_user->is_admin)) {
        echo js_anchor("<i class='fa fa-times-circle-o'></i> " . lang('delete_event'), array("class" => "btn btn-default pull-left", "id" => "delete_event", "data-encrypted_event_id" => $encrypted_event_id));
        echo modal_anchor(get_uri("events/modal_form/"), "<i class='fa fa-pencil'></i> " . lang('edit_event'), array("class" => "btn btn-default", "data-post-encrypted_event_id" => $encrypted_event_id, "title" => lang('edit_event')));
    }
    ?>
    <button type="button" class="btn btn-info close-modal" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
</div>


<script type="text/javascript">
    $(document).ready(function () {

        $('#delete_event').confirmation({
            title: "<?php echo lang('are_you_sure'); ?>",
            btnOkLabel: "<?php echo lang('yes'); ?>",
            btnCancelLabel: "<?php echo lang('no'); ?>",
            onConfirm: function () {
                $('.close-modal').trigger("click");
                $.ajax({
                    url: "<?php echo get_uri('events/delete') ?>",
                    type: 'POST',
                    dataType: 'json',
                    data: {encrypted_event_id: this.encrypted_event_id},
                    success: function (result) {
                        if (result.success) {
                            $("#event-calendar").fullCalendar('refetchEvents');
                            appAlert.warning(result.message, {duration: 10000});
                        } else {
                            appAlert.error(result.message);
                        }
                    }
                });

            }
        });

    });
</script>    