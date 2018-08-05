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
        		<?php if($_GET["_og"] == "success"){
        			echo '<div class="alert alert-success">
        			Data Berhasil di Simpan !
        		</div>';
        		} ?>
            
            <span class="ml15" style="display: none">
                <form action="" method="GET" role="form" class="general-form">
               <table class="table table-bordered">
                   <tr>
                       <td><label>Start Date</label></td>
                       <td><input type="text" class="form-control" placeholder="0" style="text-align:right;width:150px" class="form-control" name="start" id="start" value="<?php echo $periode_default ?>" autocomplete="off"></td>
                        <td><label>End Date</label></td>
                       <td><input type="text" class="form-control" placeholder="0" style="text-align:right;width:150px" class="form-control" name="end" id="end" value="<?php echo $periode_now ?>" autocomplete="off"></td>
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

<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Form Input Budgeting <br>  Tahun <?php echo date('Y') ?></p>
	
	<hr>
	<div class="" style="width: 1100px;overflow: auto;height: 500px">

		
	<form method="post" id="budgeting-form" action="<?php echo base_url('reports/budgeting/save') ?>" >
	<h4> Form </h4>
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
				<!-- <th width="100" style="text-align:center">TOTAL</th> -->
			</tr>
			<tbody>
			<?php  foreach($budgeting->result() as $row){ 
					
					echo '<tr>';
					echo '<input type="hidden" name="id[]" value="'.$row->id.'" />';
					echo '<input type="hidden" name="fid_coa[]" value="'.$row->fid_coa.'" />';
					echo '<td style="width:200px;"><input type="text" class="form-control" style="width:250px;border:none;" value="'.$row->coa_name.'" readonly/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="januari[]" value="'.number_format($row->januari).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="februari[]" value="'.number_format($row->februari).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="maret[]" value="'.number_format($row->maret).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="april[]" value="'.number_format($row->april).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="mei[]" value="'.number_format($row->mei).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="juni[]" value="'.number_format($row->juni).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="juli[]" value="'.number_format($row->juli).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="agustus[]" value="'.number_format($row->agustus).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="september[]" value="'.number_format($row->september).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="oktober[]" value="'.number_format($row->oktober).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="november[]" value="'.number_format($row->november).'"/></td>';
					echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:100px" name="desember[]" value="'.number_format($row->desember).'"/></td>';
					// echo '<td style="text-align:right"><input type="text" class="form-control" placeholder="0" style="text-align:right;width:150px" name="[]" value="'.number_format($row->total).'</td>';


					echo '</tr>';
					

				} ?>

			</tbody>
			
			
		</table>

		
	</div>
	<button type="submit" id="submit" class="btn btn-primary" style="float: right;width: 200px">SIMPAN</button>
	</form>

</div>
</div>
<script type="text/javascript">
var uri = '<?php echo base_url('reports/budgeting/save') ?>';
$(document).ready(function () {
	$("#submit").submit(function(event){

		var formData = $("form").serialize();

		$.ajax({
			type 	:'POST',
			url 	: uri,
			data 	: formData,
			dataType : json,
			encode : true
		}).done(function(data){
			console.log(data);
		});

		 event.preventDefault();
	});


	 // $("#budgeting-form").appForm({
  //           onSuccess: function (result) {
  //                   window.location = "<?php echo site_url('reports/budgeting'); ?>/" + result.id;
                
  //           }
            
  //       });
});
</script>