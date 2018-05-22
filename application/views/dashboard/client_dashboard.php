<div id="page-content" class="p20 clearfix">
    <?php
    announcements_alert_widget();
    ?>
    <div class="row">
        <?php $this->load->view("clients/info_widgets"); ?>
    </div>

    <div class="">
        <?php $this->load->view("clients/projects/index"); ?>
    </div>
</div>

