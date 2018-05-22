<table id="estimate-item-table" class="table display dataTable text-right strong table-responsive">     
    <tr>
        <td><?php echo lang("sub_total"); ?></td>
        <td><?php echo to_currency($estimate_total_summary->estimate_subtotal, $estimate_total_summary->currency_symbol); ?></td>
    </tr>
    <?php if ($estimate_total_summary->tax) { ?>
        <tr>
            <td><?php echo $estimate_total_summary->tax_name; ?></td>
            <td><?php echo to_currency($estimate_total_summary->tax, $estimate_total_summary->currency_symbol); ?></td>
        </tr>
    <?php } ?>
    <?php if ($estimate_total_summary->tax2) { ?>
        <tr>
            <td><?php echo $estimate_total_summary->tax_name2; ?></td>
            <td><?php echo to_currency($estimate_total_summary->tax2, $estimate_total_summary->currency_symbol); ?></td>
        </tr>
    <?php } ?>
    <tr>
        <td><?php echo lang("total"); ?></td>
        <td><?php echo to_currency($estimate_total_summary->estimate_total, $estimate_total_summary->currency_symbol); ?></td>
    </tr>
</table>