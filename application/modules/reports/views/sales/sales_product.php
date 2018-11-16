<div id="page-content" class="clearfix">
	<?php
    load_css(array(
        "assets/css/invoice.css"
    ));
    ?>
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
                            <a href="#" name="print"  class="btn btn-default" onclick="tableToExcel('table-print', 'sales')"><i class=" fa fa-file-excel-o"></i> Excel</a>

                        </td>
                   </tr>
               </table>
               </form>
        </div>

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
            	<div>
            		<table class="table table-bordered" id="table-print">
                         <tr>
                            <th colspan="5">
                              <center><h3>Laporan Penjualan per Produk</h3>

                    <p><strong><?php echo $date_range ?></strong></p>
                            </th>

                        </tr>
            			<tr>
            				<th>Nama Produk</th>
            				<th style="text-align: center;">Tipe</th>
            				<th style="text-align: center;">Kategori</th>
            				<th style="text-align: center;">Jumlah</th>
            				<th style="text-align: center;">Total Rupiah</th>
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