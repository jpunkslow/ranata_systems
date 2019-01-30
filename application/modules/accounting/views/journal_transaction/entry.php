<div id="page-content" class="clearfix m20">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Journal Transaction</h1>
           
        </div>
          <div id="invoice-status-bar">
            <div class="panel panel-default  p5 no-border m0">
            
            <span class="ml15">
                <form action="" method="GET" role="form" class="general-form">
                    <input type="hidden" value="<?php echo sha1(date("Y-m-d H:i:s")) ?>" name="_token">
               <table class="table table-bordered">
                   <tr>
                       <td><label>Start Date</label></td>
                       <td><input type="text" class="form-control" name="start" id="start" value="<?php echo $start_date ?>" autocomplete="off"></td>
                        <td><label>End Date</label></td>
                       <td><input type="text" class="form-control" name="end" id="end" value="<?php echo $end_date ?>" autocomplete="off"></td>
                        <td>
                            <button type="submit" name="search" class="btn btn-default" value="1"><i class=" fa fa-search"></i> Filter</button>
                            
  
                      </td>
                                        </tr>
               </table>
               </form>
                </span>

            </div>
        </div>
        <div class="container">

        </div>
        
        <div class="table-responsive" style="border: 1px solid #ddd; ">

            <table id="journal-table" class="display" cellspacing="0" width="100%"> 
<!-- 
                <tfoot>
                    <tr>
                        <th colspan="4" style="text-align:right">Total:</th>
                        <th></th>
                    </tr>
                </tfoot>     -->       
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function () {

setDatePicker("#start");
   setDatePicker("#end");

});
</script>
<script type="text/javascript">
    var id = '<?php echo $this->uri->segment(4); ?>';
    $(document).ready(function () {

        $("#journal-table").appTable({
            source: '<?php echo_uri("accounting/Journal_transaction/list_data_entry/$start_date/$end_date") ?>',
            // order: [[1, "asc"]],
            columns: [
                {title: "DATE"},
                {title: "JOURNAL CODE"},
                {title: "ACCOUNT NAME"},
                {title: "ACCOUNT NUMBER"},
                {title: "VOUCHER CODE"},
                {title: "DESCRIPTION"},
                {title: "DEBET"},
                {title: "CREDIT"},
                {title: "CREATED BY"},
                {title: "CREATED AT"},
                {title: "UPDATED BY"},
                {title: "UPDATED AT"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w150"}
            ]

        });


    });
</script>    
