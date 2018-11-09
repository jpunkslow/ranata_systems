<?php 
$start = date("Y")."-01-01";
if(!empty($_GET['start'])){
    $start = $_GET['start'];
}

?>

<div id="page-content" class="clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>General Ledger</h1>
            <div class="title-button-group">
                
                <?php
                    echo modal_anchor(get_uri("accounting/general_ledger/print"), "<i class='fa fa-print'></i> " . "Print", array("class" => "btn btn-default", "title" => "Print"));
                
                ?>
            </div>
        
        </div>
        <div class="panel panel-default  p15 no-border m0">
            <form class="general-form" role="form">
                <div class="form-group">
                    <label for="start" class=" col-md-2">START DATE</label>
                    <div class="col-md-2">
                        <?php
                        echo form_input(array(
                            'id' => 'start',
                            'name' => 'start',
                            "value" => $start,
                            "class" => "form-control",
                            "placeholder" => 'Y-m-d'
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="end" class=" col-md-2">END DATE</label>
                    <div class="col-md-2">
                        <?php
                             echo form_input(array(
                                'id' => 'end',
                                'name' => 'end',
                                "class" => "form-control",
                                "placeholder" => 'Y-m-d',
                                "value" => date("Y-m-d")
                            ));
                        ?>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="code" class=" col-md-2">ACCOUNT</label>
                    <div class="col-md-4">    
                  <?php echo form_dropdown('fid_coa', $coa_dropdown, "", "class='select2 validate-hidden' style='' id='fid_coa'"); ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="code" class=" col-md-2"></label>
                    <div class="col-md-4">    
                        <button type="button" class="btn btn-primary"  onclick="showLedgerBtn();">SEARCH</button> <button type="button" class="btn btn-danger" onclick="clearFilter();">CLEAR</button>
                    </div>
                </div>
           
            </form>
            <hr>
                
        </div>

        <div class="table-responsive" style="min-height:400px;padding-left: 10px;padding-right: 10px;">
            <table id="generalledger-table" class="display dataTable" cellspacing="0" width="100%" style="border: 1px solid #ededed; ">  
                <thead ">
                    <tr>
                        <th>No</th>
                        <th>No Voucher</th>
                        <th>Date</th>
                        <th>Sumber</th>
                        <!-- <th>Description</th> -->
                        <!--<th>Account Number</th>
                        <th>Account Name</th>-->
                        <th>Deskripsi</th>
                        <th>Debet</th>
                        <th>Credit</th>
                        <th>Saldo</th>
                    </tr>
                </thead>
                <tbody id="showLedger" style="font-size:14px">
                    
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    function showLedgerBtn(){
             var client_id = $("#fid_coa").select2().val();

            var start = $("#start").val();
            var end = $("#end").val();
            // $("#master_coa-form").trigger('submit');
            // if ($(this).val()) {
                if(start == ""){
                    alert("Date Start is empty...");
                }else if(end == ""){
                    alert("Date Start is empty...");

                }else{
                showLedger(client_id,start,end);
                // alert("hallo");
                }
            // }
       }

       function clearFilter(){
            $("#start").val('');
            showLedger("","","");
       }

    $(document).ready(function () {
        $("#fid_coa").select2();
        $("#periode").select2();

       setDatePicker("#start");
       setDatePicker("#end");
       showLedger("","","");
       showLedgerBtn("","","");

       
       function clearFilter(){
        showLedger("","","");
       }

       $("#search").click(function() {
            var client_id = $(this).val();
            var start = $("#start").val();
            var end = $("#end").val();
            $("#master_coa-form").trigger('submit');
            if ($(this).val()) {
                if(start == ""){
                    alert("Date Start is empty...");
                }else if(end == ""){
                    alert("Date Start is empty...");

                }else{
                showLedger(client_id,start,end);
                // alert("hallo");
                }
            }
        });
        $("#fid_coa").select2().on("change", function () {
            var client_id = $(this).val();
            var start = $("#start").val();
            var end = $("#end").val();
            if ($(this).val()) {
                // $('#invoice_project_id').select2("destroy");
                // $("#invoice_project_id").hide();
                // appLoader.show({container: "#invoice-porject-dropdown-section"});
                showLedger(client_id,start,end);
            }
        });


         // function showLedger(client_id,start,end){
         //    $.ajax({
         //            url: "<?php echo get_uri("accounting/general_ledger/getReport") ?>" + "/" + client_id+"/"+start+'/'+end,
         //            dataType: "text",
         //            // data: data,
         //            type:'GET',
         //            success: function (data) {
         //                    $("#showLedger").empty();
         //                    $("#showLedger").html(data);
         //            }
         //        });
         // }
    });

    function showLedger(client_id,start,end){
        $('#pre-loader').delay(250).fadeOut(function () {
                $('#pre-loader').remove();
            });
        $(document).ready(function () {

            $.ajax({
                    url: "<?php echo get_uri("accounting/general_ledger/getReport?") ?>" + "id=" + client_id+"&start="+start+'&end='+end,
                    dataType: "text",
                    // data: data,
                    type:'GET',
                    success: function (data) {
                            $("#showLedger").empty();
                            $("#showLedger").html(data);
                    }
                });
        });
    }
</script>    
