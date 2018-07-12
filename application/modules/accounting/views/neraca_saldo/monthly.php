<link rel="stylesheet" href="<?php echo base_url("assets/tree/") ?>jquery.treegrid.css">
<script type="text/javascript" src="<?php echo base_url("assets/tree/") ?>jquery.treegrid.js"></script>
<script type="text/javascript" src="<?php echo base_url("assets/tree/") ?>jquery.treegrid.bootstrap3.js"></script>

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
th.big-col{

    width:400px !important;
}

/*table thead th:first-child{
    width: 300px !important;
}*/
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
    <div style="">
        
        <div id="invoice-status-bar" style="display: none">
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
                

                <div class="table-responsive">

<p style="text-align:center; font-size: 15pt; font-weight: bold;"> Laporan Neraca Saldo  <br> Periode Tahun <?php echo date("Y") ?></p>
    
    <hr>
    
        <table id="example" class="table table-triped table-bordered tree" bordered="1" width="100%" >
            <thead>
                <tr >
                    <!-- <th rowspan="2" >Code</th> -->
                    <th rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Account Name <span style="width: 200px !important">&nbsp;</span></th>
                    <th colspan="2" style="text-align: center">January</th>
                    <th colspan="2" style="text-align: center">February</th>
                    <th colspan="2" style="text-align: center">March</th>
                    <th colspan="2" style="text-align: center">April</th>
                    <th colspan="2" style="text-align: center">May</th>
                    <th colspan="2" style="text-align: center">June</th>
                    <th colspan="2" style="text-align: center">July</th>
                    <th colspan="2" style="text-align: center">August</th>
                    <th colspan="2" style="text-align: center">September</th>
                    <th colspan="2" style="text-align: center">October</th>
                    <th colspan="2" style="text-align: center">November</th>
                    <th colspan="2" style="text-align: center">December</th>
                </tr>
                <tr>
                    <th>Debet</th>
                    <th>Credit</th> 
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                    <th>Debet</th>
                    <th>Credit</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $jum_jan_deb = 0;
                $jum_jan_cre = 0;
                $jum_feb_deb = 0;
                $jum_feb_cre = 0;
                $jum_mar_deb = 0;
                $jum_mar_cre = 0;
                $jum_apr_deb = 0;
                $jum_apr_cre = 0;
                $jum_may_deb = 0;
                $jum_may_cre = 0;
                $jum_jun_deb = 0;
                $jum_jun_cre = 0;
                $jum_jul_deb = 0;
                $jum_jul_cre = 0;
                $jum_aug_deb = 0;
                $jum_aug_cre = 0;
                $jum_sep_deb = 0;
                $jum_sep_cre = 0;
                $jum_oct_deb = 0;
                $jum_oct_cre = 0;
                $jum_nov_deb = 0;
                $jum_nov_cre = 0;
                $jum_dec_deb = 0;
                $jum_dec_cre = 0;
                ?>
                <?php foreach($neraca as $row){ ?>
                    <?php if($row->parent == "Head"){ ?>
                    <tr class="treegrid-<?php echo $row->id ?>">
                        <td colspan="24"><span class="treegrid-expander glyphicon glyphicon-chevron-right"></span><strong style=""><?php echo $row->account_name ?> </strong></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                        <td style="display: none;"></td>
                    </tr>
                <?php }else{ ?>
                    <tr class="treegrid-<?php echo $row->id ?> treegrid-parent-<?php echo $row->parental ?>">
                          <td style="width:400px;"><span class="treegrid-indent"></span><span class="treegrid-expander"></span><?php echo $row->account_name ?> </td>
                    
                        <td><?php echo number_format($row->jan_deb) ?></td>
                        <td><?php echo number_format($row->jan_cre) ?></td>
                        <td><?php echo number_format($row->feb_deb) ?></td>
                        <td><?php echo number_format($row->feb_cre) ?></td>
                        <td><?php echo number_format($row->mar_deb) ?></td>
                        <td><?php echo number_format($row->mar_cre) ?></td>
                        <td><?php echo number_format($row->apr_deb) ?></td>
                        <td><?php echo number_format($row->apr_cre) ?></td>
                        <td><?php echo number_format($row->may_deb) ?></td>
                        <td><?php echo number_format($row->may_cre) ?></td>
                        <td><?php echo number_format($row->jun_deb) ?></td>
                        <td><?php echo number_format($row->jun_cre) ?></td>
                        <td><?php echo number_format($row->jul_deb) ?></td>
                        <td><?php echo number_format($row->jul_cre) ?></td>
                        <td><?php echo number_format($row->aug_deb) ?></td>
                        <td><?php echo number_format($row->aug_cre) ?></td>
                        <td><?php echo number_format($row->sep_deb) ?></td>
                        <td><?php echo number_format($row->sep_cre) ?></td>
                        <td><?php echo number_format($row->oct_deb) ?></td>
                        <td><?php echo number_format($row->oct_cre) ?></td>
                        <td><?php echo number_format($row->nov_deb) ?></td>
                        <td><?php echo number_format($row->nov_cre) ?></td>
                        <td><?php echo number_format($row->dec_deb) ?></td>
                        <td><?php echo number_format($row->dec_cre) ?></td>
                        
                    </tr>
                <?php } ?>

                <?php  
                    $jum_jan_deb += $row->jan_deb; 
                    $jum_jan_cre += $row->jan_cre;
                    $jum_feb_deb += $row->feb_deb;
                    $jum_feb_cre += $row->feb_cre;
                    $jum_mar_deb += $row->mar_deb;
                    $jum_mar_cre += $row->mar_cre;
                    $jum_apr_deb += $row->apr_deb;
                    $jum_apr_cre += $row->apr_cre;
                    $jum_may_deb += $row->may_deb;
                    $jum_may_cre += $row->may_cre;
                    $jum_jun_deb += $row->jun_deb;
                    $jum_jun_cre += $row->jun_cre;
                    $jum_jul_deb += $row->jul_deb;
                    $jum_jul_cre += $row->jul_cre;
                    $jum_aug_deb += $row->aug_deb;
                    $jum_aug_cre += $row->aug_cre;
                    $jum_sep_deb += $row->sep_deb;
                    $jum_sep_cre += $row->sep_cre;
                    $jum_oct_deb += $row->oct_deb;
                    $jum_oct_cre += $row->oct_cre;
                    $jum_nov_deb += $row->nov_deb;
                    $jum_nov_cre += $row->nov_cre;
                    $jum_dec_deb += $row->dec_deb;
                    $jum_dec_cre += $row->dec_cre; 
                ?>
                <?php } ?>
                
            </tbody>
            <tfoot>
                <tr style="font-weight: bold">
                    <td style="text-align: right"><strong>TOTAL BALANCE</strong></td>
                    <td><strong><?php echo number_format($jum_jan_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_jan_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_feb_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_feb_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_mar_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_mar_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_apr_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_apr_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_may_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_may_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_jun_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_jun_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_jul_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_jul_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_aug_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_aug_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_sep_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_sep_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_oct_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_oct_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_nov_cre) ?></strong></td>
                    <td><strong><?php echo number_format($jum_nov_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_dec_deb) ?></strong></td>
                    <td><strong><?php echo number_format($jum_dec_cre) ?></strong></td>
                    
                </tr>
            </tfoot>
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
$(document).ready(function() {
    $('.tree').treegrid();
    $('#example').DataTable( {
        scrollY: "480px",
        scrollX: true,
        scrollCollapse: true,
        fixedColumns: true,
        columnDefs: [
            { width: "400px", targets: [0,1] }
        ],

        searching:false,
        ordering:false,
        info:false,
        paging:false
        // "autoWidth": true
    } );

   // $(".table").clone(true).appendTo('#table-scroll').addClass('clone');
} );

// requires jquery library
// jQuery(document).ready(function() {
//    jQuery(".table").clone(true).appendTo('#table-scroll').addClass('clone');   
//  });

</script>