<div class="clearfix">
     <?php if ($show_invoice_info) { ?>
        <div class="col-md-3 col-sm-6 widget-container">
            <div class="panel panel-sky">
                <div class="panel-body ">
                    <div class="widget-icon">
                        <i class="fa fa-th-large"></i>
                    </div>
                    <div class="widget-details">
                        <h1><?php echo to_decimal_format($client_info->total_projects); ?></h1>
                        <?php echo lang("projects"); ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6  widget-container">
            <div class="panel panel-primary">
                <div class="panel-body ">
                    <div class="widget-icon">
                        <i class="fa fa-file-text"></i>
                    </div>
                    <div class="widget-details">
                        <h1><?php echo to_currency($client_info->invoice_value, $client_info->currency_symbol); ?></h1>
                        <?php echo lang("invoice_value"); ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6  widget-container">
            <div class="panel panel-success">
                <div class="panel-body ">
                    <div class="widget-icon">
                        <i class="fa fa-check-square"></i>
                    </div>
                    <div class="widget-details">
                        <h1><?php echo to_currency($client_info->payment_received, $client_info->currency_symbol); ?></h1>
                        <?php echo lang("payments"); ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6  widget-container">
            <div class="panel panel-coral">
                <div class="panel-body ">
                    <div class="widget-icon">
                        <i class="fa fa-money"></i>
                    </div>
                    <div class="widget-details">
                        <h1><?php echo to_currency($client_info->invoice_value - $client_info->payment_received, $client_info->currency_symbol); ?></h1>
                        <?php echo lang("due"); ?>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</div>