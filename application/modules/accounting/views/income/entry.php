<div id="page-content" class="clearfix m20">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Income entry</h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                    <a href="<?php echo get_uri("accounting/income/download/").$this->uri->segment(4).'/'.$this->uri->segment(5) ?>" class="btn btn-default"><i class='fa fa-download'></i> DOWNLOAD PDF</a>
                    <a href="<?php echo get_uri("accounting/income/view/").$this->uri->segment(4).'/'.$this->uri->segment(5) ?>" class="btn btn-default"><i class='fa fa-print'></i> PRINT PREVIEW</a>
                    
                </div>
                <?php
                echo modal_anchor(get_uri("accounting/income/modal_form_edit"), "<i class='fa fa-pencil'></i> " . "Edit", array("class" => "btn btn-default", "title" => "Edit","data-post-id" => $info_header->id));
                ?>
            </div>
        </div>
        <div class="container">

            <div class="clearfix m20">
                
                <table class="table" style="font-size: 16px;font-weight: 500">
                    <tr>
                        <td width="200px">Received from To</td>
                        <td>:</td>
                        <td><?php echo $info_coa->account_number." - ".$info_coa->account_name; ?></td>
                    </tr>
                    <tr>
                        <td width="200px">Transaction Code</td>
                        <td>:</td>
                        <td><?php echo $info_header->code ?></td>
                    </tr>
                    <tr>
                        <td width="200px">Voucher Code</td>
                        <td>:</td>
                        <td><?php echo $info_header->voucher_code ?></td>
                    </tr>
                    <tr>
                        <td width="200px">Date</td>
                        <td>:</td>
                        <td><?php echo format_to_date($info_header->date,false) ?></td>
                    </tr>
                    <tr style="border-bottom: 1px solid #ddd; ">
                        <td width="200px">Description</td>
                        <td>:</td>
                        <td><?php echo $info_header->description ?></td>
                    </tr>
                </table>

            <?php echo modal_anchor(get_uri("accounting/income/modal_form_detail"), "<i class='fa fa-plus-circle'></i> " . "Add Row", array("class" => "btn btn-primary", "title" => "Add Row","data-post-id" => $info_header->id)); ?>
            </div>
        </div>
        
        <div class="table-responsive" style="border: 1px solid #ddd; ">

            <table id="income-table" class="display" cellspacing="0" width="100%"> 
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
    var id = '<?php echo $this->uri->segment(4); ?>';
    $(document).ready(function () {

        $("#income-table").appTable({
            source: '<?php echo_uri("accounting/income/list_data_entry/") ?>'+id,
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
