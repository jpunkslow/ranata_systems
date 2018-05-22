<span style="font-size:20px; font-weight: bold;background-color: <?php echo $color; ?>; color: #fff;"><?php echo get_quotation_id($invoice_info->code); ?>&nbsp;</span>
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
<span><?php echo "Expiration Date" . ": " . format_to_date($invoice_info->exp_date, false); ?></span>
<br>
<span>#REQUEST REF : 
        <?php if($invoice_info->fid_quot > 0){
            echo "<strong>#".$quot_info->code ."</strong>";
        
        } ?></span>