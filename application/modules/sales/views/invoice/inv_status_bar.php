<div class="panel panel-default  p15 no-border m0">
    <span><?php echo $invoice_status_label; ?></span>
    <span class="ml15">Customers : <?php 
        echo (modal_anchor(get_uri("master/customers/view/" . $client_info->id),$client_info->code." - ".$client_info->name, array("data-post-id" => $client_info->id,"title" => "Vendors Info")));
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
            echo anchor(get_uri('sales/order/view/').$order_info->id."/".str_replace("/", "-", $order_info->code),"#".$order_info->code);
        // print_r($order_info);
        } ?>
    </span>
    
    

</div>