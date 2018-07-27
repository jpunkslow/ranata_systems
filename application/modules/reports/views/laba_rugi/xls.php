<!-- Styler -->
<?php 
header("Content-Type:   application/vnd.ms-excel; charset=utf-8");
header("Content-type:   application/x-msexcel; charset=utf-8");
header("Content-Disposition: attachment; filename=laba_rugi.xls"); 
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private",false);

$periode_default = date("Y")."-01-01";
$periode_now = date("Y-m-d");
if(!empty($_GET['start']) && !empty($_GET['end'])){
    $periode_default = $_GET['start'];
    $periode_now = $_GET['end'];
}

$month=1;
$year=date('Y');
$type=$month;

if(!empty($_GET['month'])){
    $month = $_GET['month'];
}
if(!empty($_GET['year'])){
    $year = $_GET['year'];
}
if(!empty($_GET['type'])){
    $type = $_GET['type'];
}

if($type==1){
	$type=$month;
}
$loop=$type+$month;
if($loop>12)$loop=12;
$ararymonth=array(
			'',
            'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Augustus',
            'September',
            'Oktober',
            'November',
            'Desember',
        );
?>
<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Laba Rugi <br> Periode <?php echo $ararymonth[$month]." - ".$ararymonth[$loop];  ?> <?php echo $year?></p>
	
	

<table  border="1" class="tbl">
<tr><td colspan="<?php echo (($loop-$month)+2)?>"><b>Pendapatan</b> </td></tr>
	<tr style="background: lightgrey">
		<th style="width:5%; vertical-align: middle; text-align:center" > No. </th>
		<th style="width:75%; vertical-align: middle; text-align:center">Keterangan </th>
		<?php for ($i=$month; $i <=$loop ;$i++) { ?>
				<th style="width:20%; vertical-align: middle; text-align:center"><?php echo $ararymonth[$i]?> </th>
		<?php }	?> 

	</tr>
	

	<?php
	$no_dapat = 1;
	$jml_dapat =array(0,0,0,0,0,0,0,0,0,0,0,0,0);

	foreach ($data_dapat as $row) {
		echo '
				<tr>
					<td class="h_tengah"> '.$no_dapat.' </td>
		';
		if(strlen($row->account_number)==6){

			echo '<td><b>'.$row->account_name.'</b></td>';
				
			}else if(strlen($row->account_number)==9){
				echo '<td>-'.$row->account_name.'</td>';
			}
		for ($i=$month; $i <=$loop ;$i++) {

			$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year);
			$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit;
				if(strlen($row->account_number)==6){
					echo '<td class="h_kanan"><b>'.number_format(nsi_round($jumlah)).'</b></td>';
						$jml_dapat[$i] += $jumlah;
					}else{
						echo '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
					}
			}
			echo '</tr>';
			$no_dapat++;
		
	}
	//print_r($jml_dapat);exit();
	?>
	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"> <b>Jumlah Pendapatan</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = $jml_dapat[$i];
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>

<tr><td colspan="<?php echo (($loop-$month)+2)?>"><b>Beban pokok Penjualan</b></td></tr>


	

	<?php
	$no_beban = 1;
	$jml_beban =array(0,0,0,0,0,0,0,0,0,0,0,0,0);
	foreach ($data_beban_pokok as $row) {
		echo '
				<tr>
					<td class="h_tengah"> '.$no_beban.' </td>
		';
		
		if(strlen($row->account_number)==6){
			echo '<td><b>'.$row->account_name.'</b></td>';
				
			}else if(strlen($row->account_number)==9){
				echo '<td>-'.$row->account_name.'</td>';
			}
			for ($i=$month; $i <=$loop ;$i++) {
				$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year);
				if(strlen($row->account_number)==6){
					echo '<td class="h_kanan"><b>'.number_format(nsi_round($jumlah)).'</b></td>';
						$jml_beban[$i] += $jumlah;
					}else{
						echo '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
					}
		}
		echo '</tr>';
		$no_beban++;
	}
	?>
	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"> <b>Jumlah Beban Pokok Penjualan</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = $jml_beban[$i];
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>

	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"><b>Laba Kotor (Gross Profit)</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = ($jml_dapat[$i]-$jml_beban[$i]);
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>



<tr><td colspan="<?php echo (($loop-$month)+2)?>"><b>Biaya dan Beban</b></td></tr>

	<?php 
		$no=1;
		$jml_beban_operasional =array(0,0,0,0,0,0,0,0,0,0,0,0,0);
		foreach ($data_biaya as $row) {
			echo '
				<tr>
					<td class="h_tengah"> '.$no_beban.' </td>
		';
		
		if(strlen($row->account_number)==6){
			echo '<td><b>'.$row->account_name.'</b></td>';
				
			}else if(strlen($row->account_number)==9){
				echo '<td>-'.$row->account_name.'</td>';
			}
			for ($i=$month; $i <=$loop ;$i++) {
				$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year);
				$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit;
				if(strlen($row->account_number)==6){
					echo '<td class="h_kanan"><b>'.number_format(nsi_round($jumlah)).'</b></td>';
						$jml_beban_operasional[$i] += $jumlah;
					}else{
						echo '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
					}
		}
		echo '</tr>';
		$no_beban++;
	}
	?>
	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"><b>Jumlah Beban operasional</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = $jml_beban_operasional[$i];
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>
	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"><b>Pendapatan Operasi (Operating Profit)</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = ($jml_dapat[$i]-$jml_beban[$i]-$jml_beban_operasional[$i]);
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>
	<tr><td colspan="<?php echo (($loop-$month)+2)?>"><b>Pendapatan non Operasional</b></td></tr>



	

	<?php
	$no_dapat = 1;
	$jml_dapat_non =array(0,0,0,0,0,0,0,0,0,0,0,0,0);
	foreach ($dapat_non_op as $row) {
		echo '
				<tr>
					<td class="h_tengah"> '.$no_dapat.' </td>
		';
		if(strlen($row->account_number)==6){

			echo '<td><b>'.$row->account_name.'</b></td>';
				
			}else if(strlen($row->account_number)==9){
				echo '<td>-'.$row->account_name.'</td>';
			}
		for ($i=$month; $i <=$loop ;$i++) {

			$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year);
			$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit;
				if(strlen($row->account_number)==6){
					echo '<td class="h_kanan"><b>'.number_format(nsi_round($jumlah)).'</b></td>';
						$jml_dapat_non[$i] += $jumlah;
					}else{
						echo '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
					}
			}
			echo '</tr>';
			$no_dapat++;
		
	}
	//print_r($jml_dapat);exit();
	?>
	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"><b> Jumlah Pendapatan Non Operational</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = $jml_dapat_non[$i];
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>

<tr><td colspan="<?php echo (($loop-$month)+2)?>"><b>Beban Non Operasional</b></td></tr>
	<?php 
		$no=1;
		$jml_beban_non =array(0,0,0,0,0,0,0,0,0,0,0,0,0);
		foreach ($data_biaya_other as $row) {
			echo '
				<tr>
					<td class="h_tengah"> '.$no_beban.' </td>
		';
		
		if(strlen($row->account_number)==6){
			echo '<td><b>'.$row->account_name.'</b></td>';
				
			}else if(strlen($row->account_number)==9){
				echo '<td>-'.$row->account_name.'</td>';
			}
			for ($i=$month; $i <=$loop ;$i++) {
				$jml_akun = $this->Profitloss_model->get_jml_akun_month($row->id,$i,$year);
				$jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit;
				if(strlen($row->account_number)==6){
					echo '<td class="h_kanan"><b>'.number_format(nsi_round($jumlah)).'</b></td>';
						$jml_beban_non[$i] += $jumlah;
					}else{
						echo '<td class="h_kanan">'.number_format(nsi_round($jumlah)).'</td>';
					}
		}
		echo '</tr>';
		$no_beban++;
	}
	?>
	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"><b> Jumlah Beban Non Operational</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = $jml_beban_non[$i];
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>
	<tr style="background: lightgrey">
		<td colspan="2" class="h_kanan"><b>Net Profit</b></td>
		<?php for ($i=$month; $i <=$loop ;$i++) {?>
		<td class="h_kanan"><b><?php $jml_p = ($jml_dapat[$i]-$jml_beban[$i]-$jml_beban_operasional[$i])+($jml_dapat_non[$i]-$jml_beban_non[$i]);
		echo number_format(nsi_round($jml_p))   ?></b></td>
	<?php } ?>
	</tr>
</table>
