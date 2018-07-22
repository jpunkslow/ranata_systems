<!-- Styler -->
<style type="text/css">
.panel * {
	font-family: "Arial","​Helvetica","​sans-serif";
}
.fa {
	font-family: "FontAwesome";
}
.datagrid-header-row * {
	font-weight: bold;
}
.messager-window * a:focus, .messager-window * span:focus {
	color: blue;
	font-weight: bold;
}
.daterangepicker * {
	font-family: "Source Sans Pro","Arial","​Helvetica","​sans-serif";
	box-sizing: border-box;
}
.glyphicon	{font-family: "Glyphicons Halflings"}

	
</style>
<?php 
$periode_default = date("Y")."-01-01";
$periode_now = date("Y-m-d");
if(!empty($_GET['start']) && !empty($_GET['end'])){
    $periode_default = $_GET['start'];
    $periode_now = $_GET['end'];
}
?>
<div id="page-content" class="clearfix">
    <div style=" margin: 10px;">
        
        <div id="invoice-status-bar">
        	<div class="panel panel-default  p5 no-border m0">
            
            <span class="ml15" style="display: none">
                <form action="" method="GET" role="form" class="general-form">
               <table class="table table-bordered">
                   <tr>
                       <td><label>Start Date</label></td>
                       <td><input type="text" class="form-control" name="start" id="start" value="<?php echo $periode_default ?>" autocomplete="off"></td>
                        <td><label>End Date</label></td>
                       <td><input type="text" class="form-control" name="end" id="end" value="<?php echo $periode_now ?>" autocomplete="off"></td>
                        <td>
                            <button type="submit" name="search" class="btn btn-default" value="1"><i class=" fa fa-search"></i> Filter</button>
                            <button type="submit" name="print"  class="btn btn-default" value="2"><i class=" fa fa-print"></i> Print</button>

                        </td>
                   </tr>
               </table>
               </form>
                </span>

            </div>
        </div>

        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                

                <div class="table-responsive mt15 pl15 pr15">

<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Laba Rugi <br> Bulanan  Tahun <?php echo date('Y') ?></p>
	
	<hr>
	<h3> Pendapatan </h3>
	<div class="" style="width: 1100px;overflow: auto;height: 500px">

		<table class="table table-bordered">
			<tr>
				<th width="500" style="text-align:center">AKUN</th>
				<th width="100" style="text-align:center">JAN</th>
				<th width="100" style="text-align:center">FEB</th>
				<th width="100" style="text-align:center">MAR</th>
				<th width="100" style="text-align:center">APR</th>
				<th width="100" style="text-align:center">MAY</th>
				<th width="100" style="text-align:center">JUN</th>
				<th width="100" style="text-align:center">JUL</th>
				<th width="100" style="text-align:center">AUG</th>
				<th width="100" style="text-align:center">SEP</th>
				<th width="100" style="text-align:center">OCT</th>
				<th width="100" style="text-align:center">NOV</th>
				<th width="100" style="text-align:center">DEC</th>
				<th width="100" style="text-align:center">TOTAL</th>
			</tr>
			<tbody>
			<?php $jan = 0;$feb = 0;$mar = 0;$apr = 0;$may = 0;$jun = 0;$jul = 0;$aug = 0;$sep = 0;$oct = 0;$nov = 0;$dec = 0;$total = 0;?>
			<?php  foreach($profitloss_coa->result() as $row){ 
					if($row->parent == "Head"){
						// echo '<tr>';
				
						// echo '<td><strong>'.$row->akun.'</strong></td>';
						// echo '<td colspan="12"></td>';


						// echo '</tr>';
					}else{
					echo '<tr>';
				
					echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$row->akun.'</td>';
					echo '<td width="100" style="text-align:right">'.number_format($row->jan).'</td>';
					echo '<td style="text-align:right">'.number_format($row->feb).'</td>';
					echo '<td style="text-align:right">'.number_format($row->mar).'</td>';
					echo '<td style="text-align:right">'.number_format($row->apr).'</td>';
					echo '<td style="text-align:right">'.number_format($row->may).'</td>';
					echo '<td style="text-align:right">'.number_format($row->jun).'</td>';
					echo '<td style="text-align:right">'.number_format($row->jul).'</td>';
					echo '<td style="text-align:right">'.number_format($row->aug).'</td>';
					echo '<td style="text-align:right">'.number_format($row->sep).'</td>';
					echo '<td style="text-align:right">'.number_format($row->oct).'</td>';
					echo '<td style="text-align:right">'.number_format($row->nov).'</td>';
					echo '<td style="text-align:right">'.number_format($row->dec).'</td>';
					echo '<td style="text-align:right">'.number_format($row->total).'</td>';


					echo '</tr>';

					$jan += $row->jan;
					$feb += $row->feb;
					$mar += $row->mar;
					$apr += $row->apr;
					$may += $row->may;
					$jun += $row->jun;
					$jul += $row->jul;
					$aug += $row->aug;
					$sep += $row->sep;
					$oct += $row->oct;
					$nov += $row->nov;
					$dec += $row->dec;
					$total += $row->total;
					
					}

				} ?>

			</tbody>
			<tfoot>
				<tr >
					<th style="text-align:right">JUMLAH (Rp).</th>
					<th style="text-align:right"><?php echo number_format($jan); ?></th>
					<th style="text-align:right"><?php echo number_format($feb); ?></th>
					<th style="text-align:right"><?php echo number_format($mar); ?></th>
					<th style="text-align:right"><?php echo number_format($apr); ?></th>
					<th style="text-align:right"><?php echo number_format($may); ?></th>
					<th style="text-align:right"><?php echo number_format($jun); ?></th>
					<th style="text-align:right"><?php echo number_format($jul); ?></th>
					<th style="text-align:right"><?php echo number_format($aug); ?></th>
					<th style="text-align:right"><?php echo number_format($sep); ?></th>
					<th style="text-align:right"><?php echo number_format($oct); ?></th>
					<th style="text-align:right"><?php echo number_format($nov); ?></th>
					<th style="text-align:right"><?php echo number_format($dec); ?></th>
					<th style="text-align:right"><?php echo number_format($total); ?></th>
				</tr>
			</tfoot>
			
		</table>
		
	</div>

</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {

setDatePicker("#start");
   setDatePicker("#end");

});
</script>