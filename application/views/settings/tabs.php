
<h4><i class="fa fa-wrench"></i> <?php echo lang("app_settings"); ?></h4>
<ul class="nav nav-tabs vertical" role="tablist">
    <li role="presentation" class="<?php echo ($active_tab == 'general') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/general"); ?>"><?php echo lang("general"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'company') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/company"); ?>"><?php echo lang("company"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'email') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/email"); ?>"><?php echo lang("email"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'users') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/users"); ?>"><?php echo lang("users"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'ip_restriction') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/ip_restriction"); ?>"><?php echo lang("ip_restriction"); ?></a></li>
    
    <li role="presentation" class="<?php echo ($active_tab == 'taxes') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/taxes"); ?>"><?php echo lang("taxes"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'invoice') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/invoice"); ?>"><?php echo lang("invoice"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'cron_job') ? 'active' : ''; ?>"><a href="<?php echo_uri("settings/cron_job"); ?>"><?php echo lang("cron_job"); ?></a></li>

</ul>