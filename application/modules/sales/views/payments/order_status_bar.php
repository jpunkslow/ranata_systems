<div class="panel panel-default  p15 no-border m0">
    <span><?php echo $invoice_status_label; ?></span>
    <span class="ml15">Customers : <?php 
        echo (modal_anchor(get_uri("master/customers/view/" . $invoice_info->fid_cust),$client_info->company_name, array("data-post-id" => $invoice_info->fid_cust)));
        ?>
    </span> 

    <span class="ml15"><?php
        echo lang("last_email_sent") . ": ";
        echo ($invoice_info->last_email_sent_date * 1) ? $invoice_info->last_email_sent_date : lang("never");
        ?>
    </span>
    

</div>