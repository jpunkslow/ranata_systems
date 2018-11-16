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

<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        
        <div id="invoice-status-bar">
        	<div class="panel panel-default  p5 no-border m0">
            
            <span class="ml15">
                <form action="" method="GET" role="form" class="general-form">
               <table class="table table-bordered">
                   <tr>
                       <!--<td><label>Start Date</label></td>
                       <td><input type="text" class="form-control" name="start" id="start" value="<?php echo $periode_default ?>" autocomplete="off">
                       </td>
                        <td><label>End Date</label></td>
                       <td><input type="text" class="form-control" name="end" id="end" value="<?php echo $periode_now ?>" autocomplete="off"></td>-->
                       <td><select class="form-control" name="month" >
		                <option value="1" <?php if ($month == 1) echo 'selected' ?>>January</option>
		                <option value="2" <?php if ($month == 2) echo 'selected' ?>>February</option>
		                <option value="3" <?php if ($month == 3) echo 'selected' ?>>March</option>
		                <option value="4" <?php if ($month == 4) echo 'selected' ?>>April</option>
		                <option value="5" <?php if ($month == 5) echo 'selected' ?>>May</option>
		                <option value="6" <?php if ($month == 6) echo 'selected' ?>>June</option>
		                <option value="7" <?php if ($month == 7) echo 'selected' ?>>July</option>
		                <option value="8" <?php if ($month == 8) echo 'selected' ?>>August</option>
		                <option value="9" <?php if ($month == 9) echo 'selected' ?>>September</option>
		                <option value="10" <?php if ($month == 10) echo 'selected' ?>>October</option>
		                <option value="11" <?php if ($month == 11) echo 'selected' ?>>November</option>
		                <option value="12" <?php if ($month == 12) echo 'selected' ?>>December</option>
		            </select></td></td>
                        <td>
                        	<select class="form-control" name="year">
                        		<?php for($a=date('Y');$a>=2017;$a--){?>

                        			<option value="<?php echo $a?>"><?php echo $a?></option>
                        		<?php } ?>

                        	</select>

                        </td>

                        <td><select name="type" class="form-control"><option value="1" <?php if ($type == 1) echo 'selected' ?>>1 Month</option><option value="3" <?php if ($type == 3) echo 'selected' ?>>3 Month</option><option value="6" <?php if ($type == 6) echo 'selected' ?>>6 Month</option><option value="12" <?php if ($type == 12) echo 'selected' ?>>12 Month</option></select></td>
                     <td>
                            <button type="submit" name="search" class="btn btn-default" value="1"><i class=" fa fa-search"></i> Filter</button>
                              <a href="#" name="print"  class="btn btn-default" onclick="tableToExcel('table-print', 'Neraca')"><i class=" fa fa-file-excel-o"></i> Excel</a>

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



<table  class="table table-bordered" id="table-print" style="">
    <tr>
        <th colspan="<?php echo (($loop-$month)+2)?>"><?php if(empty($_GET['type']) || $_GET["type"] == 1){ ?>
<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Neraca <br> Periode <?php echo $ararymonth[$month]." ".$year?></p>
<?php }else{ ?>
	<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Neraca <br> Periode <?php echo $ararymonth[$month]." - ".$ararymonth[$loop];  ?> <?php echo $year?></p>
	<?php } ?>
</th>
<tr><td colspan="<?php echo (($loop-$month)+2)?>"><b>Pendapatan</b> </td></tr>
	<tr style="background: lightgrey">
		<th style="width:5%; vertical-align: middle; text-align:center" > No. </th>
		<th style="width:75%; vertical-align: middle; text-align:center">Keterangan </th>
		<?php for ($i=$month; $i <=$loop ;$i++) { ?>
				<th style="width:20%; vertical-align: middle; text-align:center"><?php echo $ararymonth[$i]?> </th>
		<?php }	?> 

	</tr>
	
	<?php
	$periode = $year;
	// $saldo = 0;
	$currentAssets='';
	$no_act_lancar = 1;
	$jml_act_lancar =array(0,0,0,0,0,0,0,0,0,0,0,0,0);

	foreach ($getCurrentAssets as $row) {
		 
        
        $sa_debet = $this->Master_Saldoawal_model->getDebit($row->id,$periode);
        $sa_credit = $this->Master_Saldoawal_model->getCredit($row->id,$periode);

        $saldo = $sa_debet + $sa_credit;
		$currentAssets .='
				<tr>
					<td class="h_tengah"> '.$no_act_lancar.' </td>
		';
				$currentAssets .= '<td>&nbsp;'.$row->account_name.'</td>';
		for ($i=$month; $i <=$loop ;$i++) {

			$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year,$project);
			$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit + $saldo;
			
					$currentAssets .= '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
						$jml_act_lancar[$i] += $jumlah;
					
			}
			$currentAssets .= '</tr>';
			$no_act_lancar++;
		
	}
	
	$currentNoAssets='';
	$no_act_nolancar = 1;
	$jml_act_nolancar =array(0,0,0,0,0,0,0,0,0,0,0,0,0);

	foreach ($getCurrentNonAssets as $row) {

		$sa_debet = $this->Master_Saldoawal_model->getDebit($row->id,$periode);
        $sa_credit = $this->Master_Saldoawal_model->getCredit($row->id,$periode);

        $saldo = $sa_debet + $sa_credit;
		$currentNoAssets .= '
				<tr>
					<td class="h_tengah"> '.$no_act_nolancar.' </td>
		';
				$currentNoAssets .= '<td>&nbsp;'.$row->account_name.'</td>';
		for ($i=$month; $i <=$loop ;$i++) {

			$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year,$project);
			$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit + $saldo;
					$currentNoAssets .= '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
						$jml_act_nolancar[$i] += $jumlah;
					
			}
			$currentNoAssets .= '</tr>';
			$no_act_nolancar++;
		
	}
	
	$currentLiabilities='';
	$no_kwj_lancar = 1;
	$jml_kwj_lancar =array(0,0,0,0,0,0,0,0,0,0,0,0,0);

	foreach ($getCurrentLiabilities as $row) {
		$sa_debet = $this->Master_Saldoawal_model->getDebit($row->id,$periode);
        $sa_credit = $this->Master_Saldoawal_model->getCredit($row->id,$periode);

        $saldo =  $sa_debet + $sa_credit;
		$currentLiabilities .='
				<tr>
					<td class="h_tengah"> '.$no_kwj_lancar.' </td>';
				$currentLiabilities .= '<td>&nbsp'.$row->account_name.'</td>';
		for ($i=$month; $i <=$loop ;$i++) {

			$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year,$project);
			$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit+$saldo;
		
					$currentLiabilities .= '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
						$jml_kwj_lancar[$i] += $jumlah;
					
			}
			$currentLiabilities .= '</tr>';
			$no_kwj_lancar++;
		
	}


	$currentNoLiabilities='';
	$no_kwj_nolancar = 1;
	$jml_kwj_nolancar =array(0,0,0,0,0,0,0,0,0,0,0,0,0);

	foreach ($getLongTermPayable as $row) {
		$sa_debet = $this->Master_Saldoawal_model->getDebit($row->id,$periode);
        $sa_credit = $this->Master_Saldoawal_model->getCredit($row->id,$periode);

        $saldo = $sa_debet + $sa_credit;
		$currentNoLiabilities .='
				<tr>
					<td class="h_tengah"> '.$no_kwj_nolancar.' </td>
		';
				$currentNoLiabilities .= '<td>&nbsp;'.$row->account_name.'</td>';
		for ($i=$month; $i <=$loop ;$i++) {

			$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year,$project);
			$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit + $saldo;
					$currentNoLiabilities .= '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
						$jml_kwj_lancar[$i] += $jumlah;
					
			}
			$currentNoLiabilities .= '</tr>';
			$no_kwj_nolancar++;
		
	}


	$ekuitas='';
	$no_ekuitas = 1;
	$jml_ekuitas =array(0,0,0,0,0,0,0,0,0,0,0,0,0);

	foreach ($getEquity as $row) {
		$sa_debet = $this->Master_Saldoawal_model->getDebit($row->id,$periode);
        $sa_credit = $this->Master_Saldoawal_model->getCredit($row->id,$periode);

        $saldo = $sa_debet + $sa_credit;
		$ekuitas .='
				<tr>
					<td class="h_tengah"> '.$no_ekuitas.' </td>
		';
		$ekuitas .= '<td>&nbsp;'.$row->account_name.'</td>';
		for ($i=$month; $i <=$loop ;$i++) {

			$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year,$project);
			$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit +$saldo;
				
						$ekuitas .='<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
			}
			$ekuitas .= '</tr>';
			$no_ekuitas++;
		
	}
	
	$activa_total =array(0,0,0,0,0,0,0,0,0,0,0,0,0);
	$kwj_total =array(0,0,0,0,0,0,0,0,0,0,0,0,0);
	$activa_lancar='';
	$activa_no_lancar='';
	$kwj_lancar='';
	$kwj_no_lancar='';
	$laba_rugi_ditahan='';
	$laba_rugi_berjalan='';
	

	$activa_lancar .='<tr style="background: lightgrey">
		<td colspan="2" > <b>Aktiva Lancar</b></td>';
		for ($i=$month; $i <=$loop ;$i++) {
		$activa_lancar .='<td class="h_kanan"><b>';
		$jml_p = $jml_act_lancar[$i];
		$activa_lancar .=number_format(nsi_round($jml_p)).'</b></td>';
		$activa_total[$i] +=$jml_p;
	 }
	$activa_lancar .='</tr>';


	$activa_no_lancar .='<tr style="background: lightgrey">
		<td colspan="2" > <b>Aktiva Tidak Lancar</b></td>';
		for ($i=$month; $i <=$loop ;$i++) {
		$activa_no_lancar .='<td class="h_kanan"><b>';
		$jml_p = $jml_act_nolancar[$i];
		$activa_no_lancar .=number_format(nsi_round($jml_p)).'</b></td>';
		$activa_total[$i] +=$jml_p;
	 }
	$activa_no_lancar .='</tr>';


	$kwj_lancar .='<tr style="background: lightgrey">
		<td colspan="2" > <b>Kewajiban Lancar</b></td>';
		for ($i=$month; $i <=$loop ;$i++) {
		$kwj_lancar .='<td class="h_kanan"><b>';
		$jml_p = $jml_kwj_lancar[$i];
		$kwj_lancar .=number_format(nsi_round($jml_p)).'</b></td>';
		$kwj_total[$i] +=$jml_p;
	 }
	$kwj_lancar .='</tr>';

	$kwj_no_lancar .='<tr style="background: lightgrey">
		<td colspan="2" > <b>Kewajiban Tidak Lancar</b></td>';
		for ($i=$month; $i <=$loop ;$i++) {
		$kwj_no_lancar .='<td class="h_kanan"><b>';
		$jml_p = $jml_kwj_nolancar[$i];
		$kwj_no_lancar .=number_format(nsi_round($jml_p)).'</b></td>';
		$kwj_total[$i] +=$jml_p;
	 }
	$kwj_no_lancar .='</tr>';

	$laba_rugi_ditahan .='<tr >
		<td>2<td > Laba (Rugi) Ditahan</td>';
		for ($i=$month; $i <=$loop ;$i++) {
		$laba_rugi_ditahan .='<td class="h_kanan"><b>';
		
		$laba_rugi_ditahan .=number_format(nsi_round(0)).'</b></td>';
	 }
	$laba_rugi_ditahan .='</tr>';

	$laba_rugi_berjalan .='<tr >
		<td>2<td > Laba (Rugi) Tahun Berjalan</td>';
		for ($i=$month; $i <=$loop ;$i++) {
		$laba_rugi_berjalan .='<td class="h_kanan"><b>';
		$laba_rugi_berjalan .=number_format(nsi_round(0)).'</b></td>';
	 }
	$laba_rugi_berjalan .='</tr>';



	?>

		<tr style="background: lightgrey">
		<td colspan="2" > <b>Aktiva</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = $activa_total[$i];
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>
	<?php echo $activa_lancar ?>
	<?php echo $currentAssets?>
	<?php echo $activa_no_lancar ?>
	<?php echo $currentNoAssets?>
	<tr style="background: lightgrey">
		<td colspan="2" > <b>Kewajiban Dan Ekuitas</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = $kwj_total[$i];
		echo number_format(nsi_round($jml_p));   ?></b></td>
		<?php } ?>
	</tr>
	<?php echo $kwj_lancar?>
	<?php echo $currentLiabilities?>
	<?php echo $kwj_no_lancar?>
	<?php echo $currentNoLiabilities?>

	<tr style="background: lightgrey">
		<td colspan="2" > <b>Ekuitas</b></td>
		
	</tr>
	<?php echo $ekuitas?>
	<?php echo $laba_rugi_ditahan?>
	<?php echo $laba_rugi_berjalan?>
	

	





</table>



</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {

setDatePicker("#start");
   setDatePicker("#end");

});
</script>