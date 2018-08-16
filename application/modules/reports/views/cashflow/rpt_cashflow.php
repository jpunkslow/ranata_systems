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
<?php 
$periode_default = date("Y")."-01-01";
$periode_now = date("Y-m-d");
if(!empty($_GET['start']) && !empty($_GET['end'])){
    $periode_default = $_GET['start'];
    $periode_now = $_GET['end'];
}

$month=1;
$year=date('Y');
$type=$month;
$project=false;

if(!empty($_GET['month'])){
    $month = $_GET['month'];
}
if(!empty($_GET['year'])){
    $year = $_GET['year'];
}


?>
<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        
        <div id="invoice-status-bar">
            <?php  //$this->load->view("order/order_status_bar"); ?>
        </div>

        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                 <form action="" method="GET" role="form" class="general-form">
               <table class="table table-bordered">
                   <tr>
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
                         <td>
                            <button type="submit" name="search" class="btn btn-default" value="1"><i class=" fa fa-search"></i> Filter</button>
                            <button type="submit" name="print"  class="btn btn-default" value="2"><i class=" fa fa-print"></i> Print</button>

                        </td>
                    </tr>
                </table>
            </form>
                

                <div class="table-responsive mt15 pl15 pr15">

<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Arus Kas  <br> Periode Tahun <br> <?php  echo date("Y")?></p>
    
    <hr>


    <div>
        
        <table class="table table-bordered ">
            <tr>
                <th>KODE AKUN</th>
                <th>AKTIVITAS OPERASI</th>
                <th>JUMLAH</th>
            </tr>

            <tbody>
                <tr>
                    <td></td>
                    <td colspan="2"><b><i>Arus Kas Masuk</i></b></td>
                </tr>
                <?php $jml_dapat = 0; $jml_keluar = 0; $jml_investasi = 0; $jml_pendanaan = 0; ?>
                <?php foreach($data_dapat as $row){ 
                $jml_akun = $this->Cashflow_model->get_jml_akun($row->id,$month,$year);
                $value_masuk = $jml_akun->jum_debet+$jml_akun->jum_kredit;
                    ?>

                
                <tr>
                   <td><?=$row->account_number ?></td>
                   <td><?=$row->account_name ?></td> 
                   <td style="text-align: right;"><?php echo number_format(nsi_round($value_masuk))  ?></td>
                   
                </tr>
               <?php $jml_dapat += $value_masuk; ?>



            <?php } ?>
            <?php foreach($data_piutang as $row){ 
                $jml_akun = $this->Cashflow_model->get_jml_akun($row->id,$month,$year);
                $value_masuk_piutang = $jml_akun->jum_debet+$jml_akun->jum_kredit;
                    ?>

                
                <tr>
                   <td><?=$row->account_number ?></td>
                   <td><?=$row->account_name ?></td> 
                   <td style="text-align: right;"><?php echo number_format(nsi_round($value_masuk_piutang))  ?></td>
                   
                </tr>
               <?php $jml_dapat += $value_masuk + $value_masuk_piutang; ?>



            <?php } ?>
                <tr>
                    <td></td>
                    <td><b><i>Total Arus Kas Masuk</i></b></td>
                    <td style="text-align: right;font-weight: bold;"><?php echo number_format($jml_dapat); ?></td>
                    
                </tr>

                 <tr>
                    <td></td>
                    <td colspan="2"><b><i>Arus Kas Keluar</i></b></td>
                </tr>

                <?php foreach($data_beban_pokok as $row){ 
                $jml_akun_k = $this->Cashflow_model->get_jml_akun($row->id,$month,$year);
                $value_keluar = $jml_akun_k->jum_debet+$jml_akun_k->jum_kredit
                    ?>

                
                <tr>
                   <td><?=$row->account_number ?></td>
                   <td><?=$row->account_name ?></td> 
                   <td style="text-align: right;"><?php echo number_format(nsi_round($value_keluar))  ?></td>
                
                </tr>
                    
            <?php $jml_keluar += $value_keluar; ?>

            <?php } ?>
            <?php foreach($beban_operasional as $row){ 
                $jml_akun_k = $this->Cashflow_model->get_jml_akun($row->id,$month,$year);
                $value_keluar_beban = $jml_akun_k->jum_debet+$jml_akun_k->jum_kredit
                    ?>

                
                <tr>
                   <td><?=$row->account_number ?></td>
                   <td><?=$row->account_name ?></td> 
                   <td style="text-align: right;"><?php echo number_format(nsi_round($value_keluar_beban))  ?></td>
                
                </tr>
               
               <?php $jml_keluar += $value_keluar_beban; ?>
    


            <?php } ?>
             <tr>
                    <td></td>
                    <td><b><i>Total Arus Kas Pengeluaran</i></b></td>
                    <td style="text-align: right;font-weight: bold;"><?php echo number_format($jml_keluar) ?></td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td><b><i>Arus kas dari aktifitas operasi</i></b></td>
                    <td style="text-align: right;font-weight: bold;"><?php echo number_format($jml_dapat - $jml_keluar) ?></td>
                </tr>
                 <tr>
                    <td></td>
                    <td colspan="2"><b><i>Aktivitas Investasi</i></b></td>
                </tr>
                <?php foreach($data_investasi as $row){ 
                $jml_akun_k = $this->Cashflow_model->get_jml_akun($row->id,$month,$year);
                $value_investasi = $jml_akun_k->jum_debet+$jml_akun_k->jum_kredit
                    ?>

                
                <tr>
                   <td><?=$row->account_number ?></td>
                   <td><?=$row->account_name ?></td> 
                   <td style="text-align: right;"><?php echo number_format(nsi_round($value_investasi))  ?></td>
                
                </tr>
               
               <?php $jml_investasi += $value_investasi; ?>
    


            <?php } ?>
                <tr>
                    <td></td>
                    <td><b><i>Arus kas dari aktivitas Investasi</i></b></td>
                    <td style="text-align: right;font-weight: bold;"><?php echo number_format($jml_investasi) ?></td>
                    
                </tr>

                 <tr>
                    <td></td>
                    <td colspan="2"><b><i>Aktivitas Pendanaan</i></b></td>
                </tr>

                <?php foreach($data_pendanaan as $row){ 
                $jml_akun_k = $this->Cashflow_model->get_jml_akun($row->id,$month,$year);
                $value_pendanaan = $jml_akun_k->jum_debet+$jml_akun_k->jum_kredit
                    ?>

                
                <tr>
                   <td><?=$row->account_number ?></td>
                   <td><?=$row->account_name ?></td> 
                   <td style="text-align: right;"><?php echo number_format(nsi_round($value_pendanaan))  ?></td>
                
                </tr>
               
               <?php $jml_pendanaan += $value_pendanaan; ?>
    


            <?php } ?>
            <tr>
                    <td></td>
                    <td><b><i>Arus kas dari aktivitas pendanaan</i></b></td>
                    <td style="text-align: right;font-weight: bold;"><?php echo number_format($jml_pendanaan) ?></td>
                    
                </tr>


            </tbody>
            
        </table>
    </div>
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