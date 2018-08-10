<div id="page-content" class="clearfix">
    <?php
    load_css(array(
        "assets/css/invoice.css"
    ));
    ?>
    <div style="max-width: 1000px; margin: auto;">
        
        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                <div>
                    <span style="text-align: center;"><h3>Laporan Rincian Umur Piutang</h3>

                    <p><strong><?php echo $date_range ?></strong></p>
                    </span>
                    <table border="1" cellpadding="5">
                        <tr>
                            <th style="text-align: center;">Invoice #</th>
                            <th style="text-align: center;">Customers</th>
                            <th style="text-align: center;">Tgl Invoice</th>
                            <th style="text-align: center;">Belum</th>
                            <th style="text-align: center;">1-7</th>
                            <th style="text-align: center;">7-14</th>
                            <th style="text-align: center;">14-30</th>

                        </tr>
                        <tbody>
                        <?php $jumlah = 0; $qty = 0; foreach($sales_report->result() as $row){ ?>
                        <tr>
                            <td><strong><?php echo $row->code; ?></strong></td>
                            <td><?php echo getCustInfo($row->fid_cust); ?></td>
                            <td style="text-align: center;"><?php echo format_to_date($row->inv_date); ?></td>
                            <td style="text-align: right;"><?php echo number_format($row->amount); ?></td>
                            <?php $jumlah += $row->amount; if($row->type == "7day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>"; }else{ echo "<td style='text-align: center;'>0</td>"; } ?>
                            <?php if($row->type == "7-14day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>";}else{ echo "<td style='text-align: center;'>0</td>"; } ?>
                            <?php if($row->type == "14-30day"){ echo "<td style='text-align: center;'>".number_format($row->amount)."</td>";}else{ echo "<td style='text-align: center;'>0</td>"; } ?>
                            
                            

                            
                        </tr>
                        <?php } ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="3" style="text-align: right;">TOTAL :</th>
                                <!-- <th style="text-align: center;"><?php echo $qty; ?></th> -->
                                <th style="text-align: right;"><?php  echo to_currency($jumlah,false); ?></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

