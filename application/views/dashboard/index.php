<div id="page-content" class="m20 clearfix">
    <?php
    announcements_alert_widget();
    ?>
    <div class="row">
        <?php
        $widget_column = "3"; //default bootstrap column class
        $total_hidden = 0;

        if (!$show_attendance) {
            $total_hidden+=1;
        }

        if (!$show_event) {
            $total_hidden+=1;
        }

        if (!$show_timeline) {
            $total_hidden+=1;
        }

        //set bootstrap class for column
        // if ($total_hidden == 1) {
        //     $widget_column = "4";
        // } else if ($total_hidden == 2) {
        //     $widget_column = "6";
        // } else if ($total_hidden == 3) {
        //     $widget_column = "12";
        // }
        ?>

        <!-- <?php   ?>
            <div class="col-md-<?php echo $widget_column; ?> col-sm-6 widget-container">
                <?php
                clock_widget();
                ?>
            </div>
        <?php ?>

        <div class="col-md-<?php echo $widget_column; ?> col-sm-6  widget-container">
            <?php
            my_open_tasks_widget();
            ?> 
        </div>

        <?php  ?>
            <div class="col-md-<?php echo $widget_column; ?> col-sm-6  widget-container">
                <?php
                events_today_widget();
                ?> 
            </div>
        <?php  ?>

        <?php  ?>
            <div class="col-md-<?php echo $widget_column; ?> col-sm-6  widget-container">
                <?php
                new_posts_widget();
                ?>  
            </div>
        <?php ?> -->

    </div>

    <div class="row">
        <div class="col-md-7">
            <div class="row">
                <div class="col-md-12 mb20 text-center">
                    <div class="bg-white">
                        <?php
                        count_sales_widget();
                        
                        ?> 
                    </div>
                </div>
            </div>

            <!-- <div class="row">
                <div class="col-md-12">
                    <?php
                        invoice_statistics_widget();
                    
                    ?> 
                </div>
            </div>


            <div class="row">
                <div class="col-md-12 mb15">
                    <?php
                    if ($show_ticket_status) {
                        ticket_status_widget();
                    } else if ($show_attendance) {
                        timecard_statistics_widget();
                    }
                    ?>                        
                </div>
            </div> -->

        </div>

        <div class="col-md-5 widget-container">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <i class="fa fa-clock-o"></i>&nbsp;  Not Paid Sales Invoices
                </div>
                <div id="" style="min-height: 250px">
                    <div class="panel-body"> 
                        <?php
                        pending_invoices();
                        ?>
                    </div>
                </div>
            </div>
        </div>


        
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="row">
            <?php aging_receivable_widget(); ?>
             
            </div>
        </div>
        <div class="col-md-6">
            <div class="row">
            
            <?php aging_payable_widget(); ?>
            </div>
        </div>
    </div>

</div>
<?php
load_js(array(
    "assets/js/flot/jquery.flot.min.js",
    "assets/js/flot/jquery.flot.pie.min.js",
    "assets/js/flot/jquery.flot.resize.min.js",
    "assets/js/flot/curvedLines.js",
    "assets/js/flot/jquery.flot.tooltip.min.js",
));
?>
<script type="text/javascript">
    $(document).ready(function () {
        var $stickyNote = $("#sticky-note");

        var saveStickyNote = function () {
            $.ajax({
                url: "<?php echo get_uri("dashboard/save_sticky_note") ?>",
                data: {sticky_note: $stickyNote.val()},
                cache: false,
                type: 'POST'
            });
        };

        $stickyNote.change(function () {
            saveStickyNote();
        });

        //save sticky not on window refresh
        $stickyNote.keydown(function () {
            window.onbeforeunload = saveStickyNote;
        });



        initScrollbar('#project-timeline-container', {
            setHeight: 955
        });

    });
</script>    

