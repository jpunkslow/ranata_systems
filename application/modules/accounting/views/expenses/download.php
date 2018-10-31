<div class="mt15">
             
            <div class="panel panel-default p15 b-t clearfix">
                <div class="col-md-6">
                    <img src="<?php echo get_file_uri(get_setting("system_file_path") . get_setting("site_logo")); ?>">
                    <?php echo "<h3>".get_setting("company_name")."</h3><br>".get_setting("company_address")."<br>".get_setting("company_phone")."<br>".get_setting("company_email")."<br>".get_setting("company_website") ?>
                    
                </div>
                
                <div class="col-md-12 " style="font-size: 16px">
                <table class="table table-striped">
                    <tr>
                        <td width="150px">Transaction Code</td>
                        <td>: <?php echo $info_header->code ?></td>
                    </tr>
                    <tr>
                        <td>Received To</td>
                        <td>: <?php echo $info_coa->account_number." - ".$info_coa->account_name; ?></td>
                    </tr>
                    <tr>
                        <td>Payee</td>
                        
                        <td>: </td>
                    </tr>
                    <tr>
                        <td width="150px">Voucher No</td>
                        <td>: <?php echo $info_header->voucher_code ?></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td>: <?php echo format_to_date($info_header->date,false) ?></td>
                    </tr>
                    <tr>
                        <td>Memo</td>
                        <td>: <?php echo $info_header->description ?></td>
                    </tr>
                </table>
            </div>
                <hr>

                    <table class="display dataTable" border="1" style="font-size: 15px">
                        <thead>
                            <tr>
                                
                            <th>Account No</th>
                            <th>Account Name</th>
                            <th>Memo</th>
                            <th>Amount</th>
                            
                            </tr>
                        </thead>
                        <tbody>
                            <?php $amount = 0 ?>
                            <?php foreach($listing->result() as $row){ ?>
                            <tr>
                                <td align="center"><?php echo $row->account_number ?></td>
                                <td><?php echo $row->account_name ?></td>

                                <td><?php echo $row->description; ?></td>
                                <td align="right"><?php echo to_currency($row->amount); ?></td>
                            </tr>
                            <?php $amount += $row->amount;  ?>

                            <?php } ?>
                        </tbody>
                        <tfoot>
                            <tr>

                                <td colspan="3" align="right">Total</td>
                                <td align="right"> <b><?php echo to_currency($amount); ?></b></td>
                            </tr>
                        </tfoot>
                    </table>
                    
                    <table class="display dataTable" style="font-size: 16px">
                        <tr>
                            
                                <td  align="right">Terbilang :</td>
                                <td><b><i><?php echo terbilang($amount); ?> rupiah</i></b></td>
                        </tr>
                    </table>

                

            </div>
        </div>