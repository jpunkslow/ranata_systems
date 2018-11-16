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
    <div style="max-width: 1000px; margin: auto;">
        
        <div id="invoice-status-bar">
        	<div class="panel panel-default  p5 no-border m0">
            
            <span class="ml15">
                <form action="" method="GET" role="form" class="general-form">
               <table class="table table-bordered">
                   <tr>
                       <td><label>Start Date</label></td>
                       <td><input type="text" class="form-control" name="start" id="start" value="<?php echo $periode_default ?>" autocomplete="off"></td>
                        <td><label>End Date</label></td>
                       <td><input type="text" class="form-control" name="end" id="end" value="<?php echo $periode_now ?>" autocomplete="off"></td>
                        <td>
                            <button type="submit" name="search" class="btn btn-default" value="1"><i class=" fa fa-search"></i> Filter</button>
                              <a href="#" name="print"  class="btn btn-default" onclick="tableToExcel('table-print', 'Aging')"><i class=" fa fa-file-excel-o"></i> Excel</a>

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

				
	
				<hr>
	
				<table id="table" class="display dataTable" >
					<tr>
						<th colspan="6">
							<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Rincian Umur Piutang <br> Periode <?php echo format_to_date($periode_default)." - ".format_to_date($periode_now);  ?></p>
						</th>

					</tr>
					<thead>
						<th>Faktur Code</th>
						<th>Customers</th>
						<th>Date</th>
						<th>Currency</th>
						<th>Termin</th>
						<th>Amount</th>

					</thead>
					<tbody>
						<?php foreach($data as $row){ ?>
						<tr>
							<td><?php echo $row->code ?></td>
							<td><?php echo $row->code_name." - ".$row->name ?></td>
							<td><?php echo format_to_date($row->inv_date) ?></td>
							<td><?php echo $row->currency ?></td>
							<td><?php echo $row->termin ?> Days</td>
							
							<td align="right"><?php echo to_currency($row->residual,false) ?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function () {

setDatePicker("#start");
   setDatePicker("#end");

   $("#table").appTable(
   		filterParams:{ datatable:true }
   	);

});
</script>