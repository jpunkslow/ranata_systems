<div class="panel panel-default  p15 no-border m0">
    <span><?php echo $invoice_status_label; ?></span>
    <span class="ml15">Vendors : <?php 
    echo (modal_anchor(get_uri("master/vendors/view/" . $invoice_info->fid_cust),$client_info->name." - ".$client_info->company_name, array("data-post-id" => $invoice_info->fid_cust,"title" => "Vendors Info")));
        ?>
    </span> 

    <span class="ml15"><?php
        echo lang("last_email_sent") . ": ";
        echo ($invoice_info->last_email_sent_date * 1) ? $invoice_info->last_email_sent_date : lang("never");
        ?>
    </span>
    <span class="ml15">
        #ORDER REF : 
        <?php if($invoice_info->fid_order > 0){
            echo anchor(get_uri('purchase/p_order/view/').$order_info->id,"#".$order_info->code);
        // print_r($order_info);
        } ?>
    </span>

</div>