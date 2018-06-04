<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        <div class="page-title clearfix mt15">
            <h1> Quotation : <strong><?php echo get_quotation_id($invoice_info->code); ?></strong>
                
            </h1>
            <div class="title-button-group">
                <span class="dropdown inline-block">
                    <button class="btn btn-info dropdown-toggle  mt0 mb0" type="button" data-toggle="dropdown" aria-expanded="true">
                        <i class='fa fa-cogs'></i> <?php echo lang('actions'); ?>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        
                        <li role="presentation"><?php echo anchor(get_uri("sales/quotation/download_pdf/" . $invoice_info->id), "<i class='fa fa-download'></i> " . lang('download_pdf'), array("title" => lang('download_pdf'))); ?> </li>
                        <li role="presentation"><?php echo anchor(get_uri("sales/quotation/preview/" . $invoice_info->id), "<i class='fa fa-search'></i> " . "Quotation Preview", array("title" => "Quotation Preview"), array("target" => "_blank")); ?> </li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><?php echo modal_anchor(get_uri("sales/quotation/modal_form_edit"), "<i class='fa fa-edit'></i> " . "Edit Quotation", array("title" => "Edit Quotation", "data-post-id" => $invoice_info->id, "role" => "menuitem", "tabindex" => "-1")); ?> </li>

                        
                    </ul>
                </span>
                <?php echo modal_anchor(get_uri("sales/quotation/item_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_item'), array("class" => "btn btn-default", "title" => lang('add_item'), "data-post-invoice_id" => $invoice_info->id)); ?>
                <?php  echo modal_anchor(get_uri("sales/quotation/send_quotation_modal_form/" . $invoice_info->id), "<i class='fa fa-envelope-o'></i> " . "Send Email Quotation", array("class" => "btn btn-primary","title" => "Send Email Quotation", "data-post-id" => $invoice_info->id, "role" => "menuitem", "tabindex" => "-1")); ?>
            </div>
        </div>

        <div id="invoice-status-bar">
            <?php $this->load->view("quotation/quotation_status_bar"); ?>
        </div>

        

        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                
                <div class="clearfix p20">
                    <div class="col-sm-6">
                        <table style="font-size:14px;">
                            <tr>
                                <td width="160">Quotation Code</td>
                                <td width="20">:</td>
                                <td> <strong>#<?php echo $invoice_info->code ?></strong></td>
                            </tr>
                            <tr>
                                <td>Created Date</td>
                                <td>:</td>
                                <td> <?php echo format_to_date($invoice_info->created_at,true) ?></td>
                            </tr>
                            <tr>
                                <td>Expired Date</td>
                                <td>:</td>
                                <td> <?php echo format_to_date($invoice_info->exp_date,false) ?></td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-6">
                        <table style="font-size:14px;" class="display">
                            <tr>
                                <td width="200">Customer</td>
                                <td width="20">:</td>
                                <td><strong><?php echo $client_info->code." - ".$client_info->name ?></strong></td>
                            </tr>
                            <tr>
                                <td>Contacts</td>
                                <td>:</td>
                                <td > <?php echo ($client_info->mobile ? $client_info->mobile : $client_info->contact) ?></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>:</td>
                                <td> <?php echo $invoice_info->email_to ?></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr>
                <div class="table-responsive mt15 pl15 pr15">
                    <table id="quotation-item-table" class="display" width="100%">            
                    </table>
                </div>

                <div class="clearfix">
                    <div class="col-sm-8">

                    </div>
                    <div class="col-sm-4" id="quotation-total-section">
                        <?php $this->load->view("quotation/quotation_total_section"); ?>
                    </div>
                </div>

            </div>
        </div>


        

           
    </div>
</div>



<script type="text/javascript">
    RELOAD_VIEW_AFTER_UPDATE = true;
    $(document).ready(function () {
        $("#quotation-item-table").appTable({
            source: '<?php echo_uri("sales/quotation/item_list_data/". $invoice_info->id) ?>',
            quotation: [[0, "asc"]],
            hideTools: true,
            columns: [

                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"},
                {title: '<?php echo lang("item") ?> '},
                {title: '<?php echo lang("quantity") ?>', "class": "text-right w15p"},
                {title: '<?php echo lang("rate") ?>', "class": "text-right w15p"},
                {title: '<?php echo lang("total") ?>', "class": "text-right w15p"}
            ],
            onDeleteSuccess: function (result) {
                $("#quotation-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            },
            onUndoSuccess: function (result) {
                $("#quotation-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            }
        });

        
    });

    updateInvoiceStatusBar = function (invoiceId) {
        $.ajax({
            url: "<?php echo get_uri("sales/quotation/get_invoice_status_bar"); ?>/" + invoiceId,
            success: function (result) {
                if (result) {
                    $("#invoice-status-bar").html(result);
                }
            }
        });
    };

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

