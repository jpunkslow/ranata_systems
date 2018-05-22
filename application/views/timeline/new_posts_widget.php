<div class="panel panel-primary">
    <div class="panel-body ">
        <div class="widget-icon">
            <i class="fa fa-comments"></i>
        </div>
        <div class="widget-details">
            <h1><?php echo $total; ?></h1>
            <?php echo anchor(get_uri("timeline"), lang("new_posts"), array("class" => "white-link")); ?>
        </div>
    </div>
</div>