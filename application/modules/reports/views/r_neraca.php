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
// buaat tanggal sekarang
// if(isset($_REQUEST['tgl_dari']) && isset($_REQUEST['tgl_samp'])) {
//     $tgl_dari = $_REQUEST['tgl_dari'];
//     $tgl_samp = $_REQUEST['tgl_samp'];
// } else {
//     $tgl_dari = date('Y') . '-01-01';
//     $tgl_samp = date('Y') . '-12-31';
// }
// $tgl_dari_txt = jin_date_ina($tgl_dari, 'p');
// $tgl_samp_txt = jin_date_ina($tgl_samp, 'p');
// $tgl_periode_txt = $tgl_dari_txt . ' - ' . $tgl_samp_txt;
?>

<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        
        <div id="invoice-status-bar">
            <?php  //$this->load->view("order/order_status_bar"); ?>
        </div>

        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                

                <div class="table-responsive mt15 pl15 pr15">
                    <p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Neraca Saldo </p>

    <table class="table table-bordered">
        <tr class="header_kolom">
            <th style="text-align:center; width:5%"> </th>
            <th style="text-align:center; width:55%"> Nama Akun</th>
            <th style="text-align:center; width:20%"> Debet </th>
            <th style="text-align:center; width:20%"> Kredit </th>
        </tr>
        <tr>
            <td class="h_tengah"> &nbsp; <i class="fa fa-folder-open-o"></i> </td>
            <td><strong> A. Aktiva Lancar </strong></td>
            <td></td>
        </tr>
        <?php
            $jum_debet = 0;
            $jum_kredit = 0;
            
            //ambil data kass
            $no_kas = 1;
            foreach ($getJenisKas as $jenis) {
                $nilai_debet = $this->Accounting_model->get_jml_debet($jenis->id);
                $nilai_kredit = $this->Accounting_model->get_jml_kredit($jenis->id);

                $debet_row = $nilai_debet->jml_total; 
                $kredit_row = $nilai_kredit->jml_total;
                $saldo_row = $debet_row - $kredit_row;
                echo'
                    <tr>
                        <td></td>
                        <td>A'.$no_kas.'. '. $jenis->nama.'</td>
                        <td class="h_kanan"> '.number_format(nsi_round($saldo_row)).' </td>
                        <td class="h_kanan"> 0 </td>
                  </tr>';
                $jum_debet += $saldo_row;
                $no_kas++;
            }
                        
            foreach ($getAkun as $nama) {
                echo '<tr>';
                if (strlen($nama->kd_aktiva) != 1) {
                    echo '<td> &nbsp; </td>
                            <td>'.$nama->kd_aktiva.'. '.$nama->jns_trans.'</td>';
                } else {
                    echo'<td class="h_tengah"> &nbsp; <i class="fa fa-folder-open-o"></i> </td>
                          <td> <strong>'.$nama->kd_aktiva.'. '.$nama->jns_trans.'</strong></td>';
                }

                $jml_akun = $this->Accounting_model->get_jml_akun($nama->id);
                $akun_d = $jml_akun->jum_debet;
                $akun_k = $jml_akun->jum_kredit;

                if ($nama->akun == 'Aktiva') {
                    $lancar_j = $akun_k - $akun_d;
                    echo '
                    <td class="h_kanan">'.number_format($lancar_j).'</td>
                    <td class="h_kanan">0</td>';
                    $jum_debet += $lancar_j;
                }

                if ($nama->akun == 'Pasiva') {
                    $pasiva_j = $akun_d - $akun_k;
                    echo '
                    <td class="h_kanan">0</td>
                    <td class="h_kanan">'.number_format($pasiva_j).'</td>';
                    $jum_kredit += $pasiva_j;
                }
                echo '</tr>';
            }
        ?>
        <tr class="header_kolom" >
            <td colspan="2"> JUMLAH </td>
            <td><?php echo number_format($jum_debet); ?></td>
            <td><?php echo number_format($jum_kredit); ?></td>
        </tr>
    </table>
                </div>

                <div class="clearfix">
                    <div class="col-sm-8">

                    </div>
                    <div class="col-sm-4" id="order-total-section">
                    </div>
                </div>
            

            </div>
        </div>

        

           
    </div>
</div>



<script type="text/javascript">
    // window.onload = updateInvoiceStatusBar();
    


</script>

<?php
//required to send email 

load_css(array(
    "assets/js/summernote/summernote.css",
));
load_js(array(
    "assets/js/summernote/summernote.min.js",
));
?>

