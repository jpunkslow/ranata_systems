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
            <?php  //$this->load->view("order/order_status_bar"); ?>
        </div>

        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                

                <div class="table-responsive mt15 pl15 pr15">

<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Neraca Saldo  <br> Periode Tahun <?php  echo date("Y")?></p>
    
    <hr>


<h3> Pendapatan </h3>
<table  class="table table-bordered">
    <tr style="background: lightgrey">
        <th style="width:5%; vertical-align: middle; text-align:center" > CODE</th>
        <th style="width:55%; vertical-align: middle; text-align:center">Keterangan </th>
        <th style="width:20%; vertical-align: middle; text-align:center"> Debet  </th>
        <th style="width:20%; vertical-align: middle; text-align:center"> Credit  </th>
    </tr>
    

    <?php
    $no_dapat = 1;
    $jml_debet = 0;
    $jml_credit = 0;

    foreach ($getCoa->result() as $row) {
        echo '
                <tr>
                    <td class="h_tengah"> '.$row->account_number.' </td>
        ';
        $debet = $this->Accounting_model->getDebetKas($row->id);
        $credit = $this->Accounting_model->getCreditKas($row->id);
        // $jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit;
        echo '<td>'.$row->account_name.'</td>
                <td class="h_kanan">'.number_format($debet->debet).'</td>
                <td class="h_kanan">'.number_format($credit->credit).'</td>';
        // $jml_dapat += $jumlah;
        echo '</tr>';

        $jml_debet += $debet->debet;
        $jml_credit += $credit->credit;
        $no_dapat++;
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