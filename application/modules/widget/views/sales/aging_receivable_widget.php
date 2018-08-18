<div class="box" >
	<div class="panel panel-sky" style="min-height: 200px;">
		<div class="panel-heading"><strong>Aging Receivable</strong> - <?php echo $date_range; ?></div>
		<table class="table table-bordered">
		<tr>
			<th style="text-align: center;">Invoice #</th>
			<th style="text-align: center;">1-7</th>
	        <th style="text-align: center;">7-14</th>
	        <th style="text-align: center;">14-30</th>
	        <th style="text-align: center;"> > 30</th>

		</tr>
		<tbody>
		<?php $jumlah = 0; $qty = 0; foreach($aging_report->result() as $row){ ?>
		<tr>
	        <td style="text-align: center"><strong><?php echo $row->code; ?> <br><?php echo getCustInfo($row->fid_cust); ?></strong></td>
	       
	        <?php $jumlah += $row->amount; if($row->type == "7day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>"; }else{ echo "<td style='text-align: center;'>0</td>"; } ?>
	        <?php if($row->type == "7-14day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>";}else{ echo "<td style='text-align: center;'>0</td>"; } ?>
	        <?php if($row->type == "14-30day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>";}else{ echo "<td style='text-align: center;'>0</td>"; } ?>
	        <?php if($row->type == ">30day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>";}else{ echo "<td style='text-align: center;'>0</td>"; } ?>
	        
	        

			
		</tr>
		<?php } ?>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="4" style="text-align: right;">TOTAL :</th>
				<!-- <th style="text-align: center;"><?php echo $qty; ?></th> -->
				<th style="text-align: right;"><?php  echo to_currency($jumlah,false); ?></th>
			</tr>
		</tfoot>
	</table>
	</div>
</div>