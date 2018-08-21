<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "company";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/company/save_company_settings"), array("id" => "company-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading">
                <h4><?php echo lang("company_settings"); ?></h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="company_name" class=" col-md-2"><?php echo lang('company_name'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "company_name",
                            "name" => "company_name",
                            "value" => get_setting("company_name"),
                            "class" => "form-control",
                            "placeholder" => lang('company_name'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required")
                        ));
                        ?>
                    </div>
                </div>

                <div class="form-group">
                    <label for="company_address" class=" col-md-2"><?php echo lang('address'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_textarea(array(
                            "id" => "company_address",
                            "name" => "company_address",
                            "value" => get_setting("company_address"),
                            "class" => "form-control",
                            "placeholder" => lang('address'),
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="company_phone" class=" col-md-2"><?php echo lang('phone'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "company_phone",
                            "name" => "company_phone",
                            "value" => get_setting("company_phone"),
                            "class" => "form-control",
                            "placeholder" => lang('phone')
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="company_email" class=" col-md-2"><?php echo lang('email'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "company_email",
                            "name" => "company_email",
                            "value" => get_setting("company_email"),
                            "class" => "form-control",
                            "placeholder" => lang('email')
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="company_website" class=" col-md-2"><?php echo lang('website'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "company_website",
                            "name" => "company_website",
                            "value" => get_setting("company_website"),
                            "class" => "form-control",
                            "placeholder" => lang('website')
                        ));
                        ?>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $("#company-settings-form").appForm({
            isModal: false,
            onSuccess: function(result) {
                appAlert.success(result.message, {duration: 10000});
            }
        });

    });
</script>