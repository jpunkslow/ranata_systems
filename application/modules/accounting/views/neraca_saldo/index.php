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

/*#start{
    height: 30px;
    border: 1px solid #ddd
}
#end{
    height: 30px;
    border: 1px solid #ddd
}*/
td label{
    padding: 5px 10px;
    font-weight: bold;
}
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
                    <input type="hidden" value="<?php echo sha1(date("Y-m-d H:i:s")) ?>" name="_token">
               <table class="table table-bordered">
                   <tr>
                       <td><label>Start Date</label></td>
                       <td><input type="text" class="form-control" name="start" id="start" value="<?php echo $periode_default ?>" autocomplete="off"></td>
                        <td><label>End Date</label></td>
                       <td><input type="text" class="form-control" name="end" id="end" value="<?php echo $periode_now ?>" autocomplete="off"></td>
                       <td><select name="type" class="form-control"><option value="0">Default</option><option value="1">Monthly</option></select></td>
                        <td>
                            <button type="submit" name="search" class="btn btn-default" value="1"><i class=" fa fa-search"></i> Filter</button>
                            <button type="submit" name="print"  class="btn btn-default" value="2"><i class=" fa fa-file-pdf-o"></i> Pdf</button>
                            <button type="submit" name="print"  class="btn btn-default" value="3"><i class=" fa fa-file-excel-o"></i> Excel</button>

                        </td>
                   </tr>
               </table>
               </form>
                </span>

            </div>
        </div>

        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                

                <div class="table">

<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Neraca Saldo  <br> Periode <?php echo format_to_date($periode_default)." - ".format_to_date($periode_now);  ?> </p>
    
    <hr>


<table  class="table table-bordered" style="">
    <tr style="background: lightgrey"><!-- 
        <th style="width:10%; vertical-align: middle; text-align:center" ></th> -->
        <th style="width:55%; vertical-align: middle; text-align:center">NAMA AKUN </th>
        <th style="width:20%; vertical-align: middle; text-align:center"> DEBIT  </th>
        <th style="width:20%; vertical-align: middle; text-align:center"> KREDIT  </th>
    </tr>
    

    <?php
    $no_dapat = 1;
    $jml_debet = 0;
    $jml_credit = 0;

    foreach ($getCoa->result() as $row) {
        $debet = $this->Accounting_model->getDebetKas($row->id,$periode_default,$periode_now);
        $credit = $this->Accounting_model->getCreditKas($row->id,$periode_default,$periode_now);
        // $jumlah = $jml_akun->jum_debet + $jml_akun->jum_kredit;
        $html = "<tr>";
        if($row->parent == "Head"){
        	$html .= '<td class="" colspan="3"> <strong>'.$row->account_name.'</strong> </td>';
        	// $html .= "<td colspan='3' ><strong>".$row->account_name."</strong><td>";
        
        }else{
        	// $html .= '<td class="h_tengah"> '.$row->account_number.' </td>';
            if($row->account_type == "Kas/Bank"){
                $html .= "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row->account_name."</td>";
            $html .= '<td class="h_kanan">'.number_format($debet->debet - $credit->credit).'</td>';
            $html .= '<td class="h_kanan">'.number_format(0).'</td>';
            }else{
                $html .= "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row->account_name."</td>";
                $html .= '<td class="h_kanan">'.number_format($debet->debet).'</td>';
                $html .= '<td class="h_kanan">'.number_format($credit->credit).'</td>';


            }
        
        }
        // $jml_dapat += $jumlah;
        $html .= '</tr>';
        echo $html;
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
    <td  class="h_kanan" > SALDO </td>
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
$(document).ready(function () {

setDatePicker("#start");
   setDatePicker("#end");

});
</script>