<div id="page-content" class="m20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Customers Receipt</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                </div>
               
            </div>
        </div>
        <?php echo form_open(get_uri("sales/order/add"), array("id" => "invoices-form", "class" => "general-form", "role" => "form")); ?>
            <hr>
        <div class="col-xs-12 clearfix" style="font-size:14px;">
            
            <div class="form-group ">
                <label for="fid_cust" class="col-md-4">Nama Pelanggan</label>
                <div class=" col-md-7">
                    <?php
                    echo form_dropdown("fid_cust", $clients_dropdown, "", "class='select2 validate-hidden' id='fid_cust' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                    ?>
                </div>
            </div>
            
        
            
        </div>

        

        
        <div class="table-responsive" style="min-height: 500px">
            <table id="payments-table" class=" display dataTable no-footer" cellspacing="0" width="100%" >    
                <thead>
                    <tr>
                        <th>INVOICES ID #</th>
                        <th class="text-center">PAID</th>
                        <th class="text-center">TANGGAL</th>
                        <th class="text-center">TOTAL</th>
                        <th class="text-center"></th>
                    </tr> 
                </thead> 
                <tbody id="invoices-table" >
                    
                </tbody>           
            </table>
        </div>

</div>

        <?php echo form_close(); ?>

    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#invoices-form .select2").select2();
        setDatePicker("#pay_date");
        

        function showTable(client_id){
            
                        
        }

        $("#fid_cust").select2().on("change", function () {
            var client_id = $(this).val();
            if ($(this).val()) {

                $.ajax({
                    url: "<?php echo get_uri("sales/s_payments/list_data_receipt") ?>" + "/" + client_id,
                    dataType: "json",
                    // data: data,
                    type:'GET',
                    success: function (data) {

                         // $("#invoice-list").load("<?php echo get_uri("sales/s_payments/showTable/") ?>"+client_id);
                        // showTable(client_id);
                        $("#invoices-table").load("<?php echo get_uri("sales/s_payments/showTable/") ?>"+client_id);

                        
                        
                    }
                });
            }
        });

    });
</script>    
