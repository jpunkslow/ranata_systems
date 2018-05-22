<div id="page-content" class="clearfix p20">
    <div class="view-container">
        <div class="pt10 pb10 text-right"> &larr; <?php echo anchor("announcements", lang("announcements")); ?></div>
        <div class="panel panel-default no-border">
            <div class="panel-body p30">
                <h1 style="color: #555;" class="mt0">
                    <?php echo $announcement->title; ?>
                </h1>
                <div class="text-off mb15">
                    <?php echo format_to_date($announcement->start_date); ?>,&nbsp; 
                    <?php echo get_team_member_profile_link($announcement->created_by, $announcement->created_by_user); ?>
                </div>
                <div>
                    <?php
                    echo $announcement->description;
                    ?>
                </div>

            </div>
        </div>
    </div>

</div>