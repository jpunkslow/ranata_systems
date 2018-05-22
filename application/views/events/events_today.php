<div class="panel panel-success">
    <div class="panel-body ">
        <div class="widget-icon">
            <i class="fa fa-calendar-check-o"></i>
        </div>
        <div class="widget-details">
            <h1><?php echo $total; ?></h1>
            <?php echo anchor(get_uri("events"), lang("events_today"), array("class" => "white-link")); ?>
        </div>
    </div>
</div>