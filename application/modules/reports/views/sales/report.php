<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        
        <div id="invoice-status-bar" class="panel panel-default  p5 no-border m0">

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
            		<center><h3>Laporan Penjualan per Produk</h3>

					<p><strong><?php echo $date_range ?></strong></p>
					</center>
            		<table class="table table-bordered">
            			<tr>
            				<th>Nama Produk</th>
            				<th style="text-align: center;">Tipe</th>
            				<th style="text-align: center;">Kategori</th>
            				<th style="text-align: center;">Kuantitas</th>
            				<th style="text-align: center;">Jumlah</th>
            			</tr>
            			<tbody>
            			<?php $jumlah = 0; $qty = 0; foreach($sales_report->result() as $row){ ?>
            			<tr>
            				<td><?php  echo $row->title; ?></td>
            				<td style="text-align: center;"><?php  echo $row->unit_type; ?></td>
            				<td style="text-align: center;"><?php  echo $row->category; ?></td>
            				<td style="text-align: center;"><?php  echo $row->qty; $qty += $row->qty; ?></td>
            				<td style="text-align: right;"><?php  echo to_currency($row->total,false); $jumlah += $row->total; ?></td>

            				
            			</tr>
            			<?php } ?>
            			</tbody>
            			<tfoot>
            				<tr>
            					<th colspan="3" style="text-align: right;">TOTAL :</th>
								<th style="text-align: center;"><?php echo $qty; ?></th>
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