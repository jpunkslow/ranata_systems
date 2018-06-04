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
.glyphicon  {font-family: "Glyphicons Halflings"}

.form-control {
    height: 20px;
    padding: 4px;
}   
</style>
<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        
        <div id="invoice-status-bar">
        </div>

        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                

                <div class="table-responsive mt15 pl15 pr15">

<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Neraca Saldo  <br> Periode Tahun <?php  echo date("Y")?></p>
    
    <hr>


<table  class="table table-bordered" style="border: 1px solid #ddd;">
    <tr style="background: lightgrey">
        <th style="width:10%; vertical-align: middle; text-align:center" > KODE AKUN</th>
        <th style="width:55%; vertical-align: middle; text-align:center">NAMA AKUN </th>
        <th style="width:20%; vertical-align: middle; text-align:center"> DEBIT  </th>
        <th style="width:20%; vertical-align: middle; text-align:center"> KREDIT  </th>
    </tr>
    

    <?php
    $no_dapat = 1;
    $jml_debet = 0;
    $jml_credit = 0;

    foreach ($getCoa->result() as $row) {
        $debet = $this->Accounting_model->getDebetKas($row->id);
        $credit = $this->Accounting_model->getCreditKas($row->id);
        // $jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit;
        $html = "<tr>";
        if($row->parent == "Head"){
        	$html .= '<td class="h_tengah"> '.$row->account_number.' </td>';
        	$html .= "<td colspan='2'><strong>".$row->account_name."</strong><td>";
        
        }else{
        	$html .= '<td class="h_tengah"> '.$row->account_number.' </td>';
        
        	$html .= "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row->account_name."</td>";
        	$html .= '<td class="h_kanan">'.number_format($debet->debet).'</td>';
       		$html .= '<td class="h_kanan">'.number_format($credit->credit).'</td>';
        
        }
        // $jml_dapat += $jumlah;
        $html .= '</tr>';
        echo $html;
        $jml_debet += $debet->debet;
        $jml_credit += $credit->credit;
        // $no_dapat++;
    }
    ?>
   <!--  <tr style="background: lightgrey">
        <td colspan="2" class="h_kanan"> Jumlah Pendapatan</td>
        <td class="h_kanan"><?php $jml_p = $jml_dapat;
        echo number_format(nsi_round($jml_p))   ?></td>
    </tr> -->
<tr style="background-color: lightgrey; font-weight: bold">
    <td colspan="2" class="h_kanan" > SALDO </td>
        <td class="h_kanan"><?php echo number_format($jml_debet); ?></td>
        <td class="h_kanan"><?php echo number_format($jml_credit); ?></td>
    </tr>
</table>



<!-- <table width="100%" class="table">
    <tr style="background-color: lightgrey;">

        <td colspan="1" class="h_kanan"> SALDO </td>
        <td class="h_kanan"></td>
        <td class="h_kanan"></td>
    </tr>
</table>  -->
</div>
</div>
<script type="text/javascript">
</script>