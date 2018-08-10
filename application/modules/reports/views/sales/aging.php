<div id="page-content" class="clearfix">
	<?php
    load_css(array(
        "assets/css/invoice.css"
    ));
    ?>
    <div style="max-width: 1000px; margin: auto;">
        
        <div id="invoice-status-bar" class="panel panel-default  p5 no-border m0" style="">

        	<form action="" method="GET" role="form" class="general-form">
               <table class="table table-bordered">
                   <tr>
                        <td>
                        	<input type="text" class="form-control" id="start_date" name="start" autocomplete="off" placeholder="START DATE" value="<?php echo $_GET['start'] ?>">
                        </td>

                       
                        	
						<td>
							<input type="text" class="form-control" id="end_date" name="end" autocomplete="off" placeholder="END DATE" value="<?php echo $_GET['end'] ?>">
                        </td>
                        <td>
                            <button type="submit" name="search" class="btn btn-default" value="1"><i class=" fa fa-search"></i> Filter</button>
                            <button type="submit" name="print"  class="btn btn-default" value="2"><i class=" fa fa-print"></i> Print</button>

                        </td>
                   </tr>
               </table>
               </form>
        </div>

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
            	<div>
            		<center><h3>Laporan Rincian Umur Piutang</h3>

					<p><strong><?php echo $date_range ?></strong></p>
					</center>
            		<table class="table table-bordered">
            			<tr>
            				<th style="text-align: center;">Invoice #</th>
                            <th style="text-align: center;">Customers</th>
            				<th style="text-align: center;">Tgl Invoice</th>
            				<th style="text-align: center;">Belum</th>
            				<th style="text-align: center;">1-7</th>
                            <th style="text-align: center;">7-14</th>
                            <th style="text-align: center;">14-30</th>

            			</tr>
            			<tbody>
            			<?php $jumlah = 0; $qty = 0; foreach($sales_report->result() as $row){ ?>
            			<tr>
                            <td><strong><?php echo $row->code; ?></strong></td>
                            <td><?php echo getCustInfo($row->fid_cust); ?></td>
                            <td style="text-align: center;"><?php echo format_to_date($row->inv_date); ?></td>
                            <td style="text-align: right;"><?php echo number_format($row->amount); ?></td>
                            <?php $jumlah += $row->amount; if($row->type == "7day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>"; }else{ echo "<td style='text-align: center;'>0</td>"; } ?>
                            <?php if($row->type == "7-14day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>";}else{ echo "<td style='text-align: center;'>0</td>"; } ?>
                            <?php if($row->type == "14-30day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>";}else{ echo "<td style='text-align: center;'>0</td>"; } ?>
                            
                            

            				
            			</tr>
            			<?php } ?>
            			</tbody>
            			<tfoot>
            				<tr>
            					<th colspan="3" style="text-align: right;">TOTAL :</th>
								<!-- <th style="text-align: center;"><?php echo $qty; ?></th> -->
								<th style="text-align: right;"><?php  echo to_currency($jumlah,false); ?></th>
            				</tr>
            			</tfoot>
            		</table>
            	</div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
	$(document).ready(function () {

        setDatePicker("#start_date");
        setDatePicker("#end_date");

    });
</script>