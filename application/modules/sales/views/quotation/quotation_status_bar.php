<div class="panel panel-default  p15 no-border m0">
    <span><?php echo $invoice_status_label; ?></span>
    <span class="ml15">Customers : <?php 
        echo (modal_anchor(get_uri("master/customers/view/" . $client_info->id),$client_info->code." - ".$client_info->name, array("data-post-id" => $client_info->id)));
        ?>
    </span> 

    <span class="ml15"><?php
        echo lang("last_email_sent") . ": ";
        echo ($invoice_info->last_email_sent_date * 1) ? $invoice_info->last_email_sent_date : lang("never");
        ?>
    </span>


</div>