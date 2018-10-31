<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        <div class="page-title clearfix mt15">
            <a href="<?php echo get_uri("accounting/expenses/entry/").$this->uri->segment(4).'/'.$this->uri->segment(5) ?>" class="btn btn-default">
                    <h1> Preview #<?php echo $info_header->voucher_code ?></h1></a>
            <div class="title-button-group">
                <span class="dropdown inline-block">
                    <a href="<?php echo get_uri("accounting/expenses/download/").$this->uri->segment(4).'/'.$this->uri->segment(5) ?>" class="btn btn-default"><i class='fa fa-download'></i> DOWNLOAD PDF</a>
                    
                </span>

            </div>
        </div>

        

        <div class="mt15">
             
            <div class="panel panel-default p15 b-t clearfix">
                <div class="col-md-6">
                    <img src="<?php echo get_file_uri(get_setting("system_file_path") . get_setting("site_logo")); ?>">
                    <?php echo "<h3>".get_setting("company_name")."</h3><br>".get_setting("company_address")."<br>".get_setting("company_phone")."<br>".get_setting("company_email")."<br>".get_setting("company_website") ?>
                    
                </div>
                
                <div class="col-md-6 " style="font-size: 16px">
                <table class="table table-striped">
                    <tr>
                        <td width="150px">Transaction Code</td>
                        <td>:</td>
                        <td><?php echo $info_header->code ?></td>
                    </tr>
                    <tr>
                        <td>Received To</td>
                        <td>:</td>
                        <td><?php echo $info_coa->account_number." - ".$info_coa->account_name; ?></td>
                    </tr>
                    <tr>
                        <td>Payee</td>
                        <td>:</td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6" style="font-size: 16px">
                <table class="table table-striped">
                    <tr>
                        <td>Voucher No</td>
                        <td>:</td>
                        <td><?php echo $info_header->voucher_code ?></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td>:</td>
                        <td><?php echo format_to_date($info_header->date,false) ?></td>
                    </tr>
                    <tr>
                        <td>Memo</td>
                        <td>:</td>
                        <td><?php echo $info_header->description ?></td>
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


        

           
    </div>
</div>

<!-- 

<script type="text/javascript">
    var id = '<?php echo $this->uri->segment(4); ?>';
    $(document).ready(function () {

        $("#expenses-table").appTable({
            source: '<?php echo_uri("accounting/expenses/list_data_entry/") ?>'+id,
            // order: [[1, "asc"]],
            columns: [
                {title: "ACCOUNT NAME"},
                {title: "REF #"},
                {title: "DESCRIPTION"},
                {title: "DEBET"},
                {title: "CREDIT"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ],
            onDeleteSuccess: function (result) {
                    location.reload();
            },

        });


    });
</script>    
 -->
