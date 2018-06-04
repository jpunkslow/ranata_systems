<div style="font-size:14px">
	<span>INVOICE NO :  <?php echo $invoice_info->code; ?></span>
	<br>
	<span>SALES ORDER :  <?php echo $order_info->code; ?></span>

</div>
<div style="line-height: 10px;"></div><?php
if (isset($invoice_info->custom_fields) && $invoice_info->custom_fields) {
    foreach ($invoice_info->custom_fields as $field) {
        if ($field->value) {
            echo "<span>" . $field->custom_field_title . ": " . $this->load->view("custom_fields/output_" . $field->custom_field_type, array("value" => $field->value), true) . "</span><br />";
        }
    }
}
?>
<span><?php // echo lang("bill_date") . ": " . format_to_date($invoice_info->created_at, false); ?></span><br />
 <span><?php echo "Pay Date" . ": " . format_to_date($payment_info->pay_date, false); ?></span> 
 