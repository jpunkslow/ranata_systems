<div class="panel panel-sky">
    <div class="panel-body ">
        <div class="widget-icon">
            <i class="fa fa-tasks"></i>
        </div>
        <div class="widget-details">
            <h1><?php echo $total; ?></h1>
            <?php echo anchor(get_uri("projects/all_tasks"), lang("my_open_tasks"), array("class" => "white-link")); ?>
        </div>
    </div>
</div>