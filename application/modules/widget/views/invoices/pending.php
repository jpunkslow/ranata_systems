<table class="table table-bordered">
	<tr>
		<th>Invoices</th>
		<th>End Date</th>
		<th>Amount</th>
	</tr>
	<tbody>
		<?php foreach($invoices as $row){ ?>
		<tr>
			<td style="text-align: center;color:red;font-weight: bold"><?php echo $row->code ?> <br> <?php echo $row->name ?></td>
			<td style="text-align: center;color:red;"><?php echo format_to_date($row->end_date); ?></td>
			<td style="text-align: center;color:red;"><?php echo to_currency($row->amount,false); ?></td>
		</tr>
	<?php  } ?>
	</tbody>
</table>