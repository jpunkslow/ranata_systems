<div><b><?php echo "INVOICE TO"; ?></b></div>
<div style="line-height: 2px; border-bottom: 1px solid #f2f2f2;"> </div>
<div style="line-height: 3px;"> </div>
<strong>    <span><?php echo $client_info->code.' - '.$client_info->name; ?></span>
 </strong>
<div style="line-height: 3px;"> </div>
<span class="invoice-meta" style="font-size: 90%; color: #666;">
    <?php if ($client_info->address) { ?>
        <div><?php echo nl2br($client_info->address); ?>
            <?php if ($client_info->city) { ?>
                <br /><?php echo $client_info->city; ?>
            <?php } ?>
            <?php if ($client_info->state) { ?>
                <br /><?php echo $client_info->state; ?>
            <?php } ?>
            <?php if ($client_info->zip) { ?>
                <br /><?php echo $client_info->zip; ?>
            <?php } ?>
            <?php if ($client_info->country) { ?>
                <br /><?php echo $client_info->country; ?>
            <?php }if ($client_info->mobile_number){
                echo "<br>".$client_info->mobile_number;
            } ?>
            


        </div>
<?php } ?>
</span>