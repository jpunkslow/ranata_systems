<style type="text/css">
.panel * {
    font-family: "Arial","​Helvetica","​sans-serif";
}
</style>
<?php
    load_css(array(
        "assets/css/invoice.css",

        "assets/bootstrap/css/bootstrap.min.css",
        "assets/css/style.css"
    ));
    ?>
<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        
        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
            	<div>
            		<span style="text-align: center"><h3>Laporan Penjualan per Produk</h3>

					<p><strong><?php echo $date_range ?></strong></p>
					</span>
            		<table border="1">
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

