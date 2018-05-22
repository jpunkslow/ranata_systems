
<h4><i class="fa fa-wrench"></i> <?php echo lang("app_settings"); ?></h4>
<ul class="nav nav-tabs vertical" role="tablist">
    <li role="presentation" class="<?php echo ($active_tab == 'general') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/general"); ?>"><?php echo lang("general"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'company') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/company"); ?>"><?php echo lang("company"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'email') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/email"); ?>"><?php echo lang("email"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'roles') ? 'active' : ''; ?>"><a href="<?php echo_uri("roles"); ?>"><?php echo lang("roles"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'ip_restriction') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/ip_restriction"); ?>"><?php echo lang("ip_restriction"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'client') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/client"); ?>"><?php echo lang("client"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'team') ? 'active' : ''; ?>"><a href="<?php echo_uri("team"); ?>"><?php echo lang("team"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'leave_types') ? 'active' : ''; ?>"><a href="<?php echo_uri("leave_types"); ?>"><?php echo lang("leave_types"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'ticket_types') ? 'active' : ''; ?>"><a href="<?php echo_uri("ticket_types"); ?>"><?php echo lang("ticket_types"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'expense_categories') ? 'active' : ''; ?>"><a href="<?php echo_uri("expense_categories"); ?>"><?php echo lang("expense_categories"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'taxes') ? 'active' : ''; ?>"><a href="<?php echo_uri("taxes"); ?>"><?php echo lang("taxes"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'invoice') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/invoice"); ?>"><?php echo lang("invoice"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'payment_methods') ? 'active' : ''; ?>"><a href="<?php echo_uri("payment_methods"); ?>"><?php echo lang("payment_methods"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'email_templates') ? 'active' : ''; ?>"><a href="<?php echo_uri("email_templates"); ?>"><?php echo lang("email_templates"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'notification') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/notification"); ?>"><?php echo lang("notification"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'modules') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/modules"); ?>"><?php echo lang("modules"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'custom_fields') ? 'active' : ''; ?>"><a href="<?php echo_uri("custom_fields"); ?>"><?php echo lang("custom_fields"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'cron_job') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/cron_job"); ?>"><?php echo lang("cron_job"); ?></a></li>

</ul>