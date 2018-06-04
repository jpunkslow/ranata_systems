<?php echo form_open(get_uri("sales/order/save_item"), array("id" => "order-item-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
    <input type="hidden" name="add_new_item_to_library" value="" id="add_new_item_to_library" />
    <div class="form-group">
        <label for="invoice_item_title" class=" col-md-3"><?php echo lang('item'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_item_title",
                "name" => "invoice_item_title",
                "value" => $model_info->title,
                "class" => "form-control validate-hidden",
                "placeholder" => lang('select_or_create_new_item'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
            <a id="invoice_item_title_dropdwon_icon" tabindex="-1" href="javascript:void(0);" style="color: #B3B3B3;float: right; padding: 5px 7px; margin-top: -35px; font-size: 18px;"><span>×</span></a>
        </div>
    </div>
    <div class="form-group">
        <label for="description" class=" col-md-3">Description</label>
        <div class="col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "value" => $model_info->description,
                "class" => "form-control",
                "placeholder" => "Deskripsi",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <!-- <div class="form-group">
        <label for="category" class=" col-md-3">Kategori Produk</label>
        <div class="col-md-9">
             <?php 
                echo form_dropdown(
                    "category", array(
                        "Akomodasi" => "Akomodasi",
                        "Transport" => "Transport"
                        ), $model_info->category, "class='select2 mini'"
                    );
                        ?>
        </div>
    </div> -->
    <div class="form-group">
        <label for="category" class=" col-md-3">Category</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_item_category",
                "name" => "category",
                "value" => $model_info->category,
                "class" => "form-control",
                "readonly" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <!-- <div class="form-group">
        <label for="unit_type" class=" col-md-3">Tipe Produk</label>
        <div class="col-md-9">
             <?php 
                echo form_dropdown(
                    "unit_type", array(
                        "Domestic" => "Domestic",
                        "International" => "International",
                        "Umrah" => "Umrah",
                        "Maize" => "Maize",
                        "lainnya" => "Lain - lain"
                        ), $model_info->unit_type, "class='select2 mini'"
                    );
                        ?>
        </div>
    </div> -->
    <div class="form-group">
        <label for="unit_type" class=" col-md-3">Type</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_unit_type",
                "name" => "unit_type",
                "value" => $model_info->unit_type,
                "class" => "form-control",
                "readonly" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="invoice_item_quantity" class=" col-md-3"><?php echo lang('quantity'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_item_quantity",
                "name" => "invoice_item_quantity",
                "value" => $model_info->quantity ? to_decimal_format($model_info->quantity) : "",
                "class" => "form-control",
                "placeholder" => lang('quantity'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    
    <div class="form-group">
        <label for="invoice_item_basic" class=" col-md-3">Basic Price</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_item_basic",
                "name" => "invoice_item_basic",
                "value" => $model_info->basic_price ? to_decimal_format($model_info->basic_price) : "",
                "class" => "form-control",
                "placeholder" => lang('rate'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="invoice_item_rate" class=" col-md-3">Sell Price</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_item_rate",
                "name" => "invoice_item_rate",
                "value" => $model_info->rate ? to_decimal_format($model_info->rate) : 0,
                "class" => "form-control",
                "placeholder" => lang('rate'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $('input[name=invoice_item_rate]').change(function() {
            var value = $(this).val();
            ;
        });
        $("#order-item-form .select2").select2();
        $("#order-item-form").appForm({
            onSuccess: function (result) {
                $("#order-item-table").appTable({newData: result.data, dataId: result.id});
                $("#order-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            }
        });

        //show item suggestion dropdown when adding new item
        var isUpdate = "<?php echo $model_info->id; ?>";
        if (!isUpdate) {
            applySelect2OnItemTitle();
        }

        //re-initialize item suggestion dropdown on request
        $("#invoice_item_title_dropdwon_icon").click(function () {
            applySelect2OnItemTitle();
        })

    });

    function applySelect2OnItemTitle() {
        $("#invoice_item_title").select2({
            showSearchBox: true,
            ajax: {
                url: "<?php echo get_uri("sales/order/get_item_suggestion"); ?>",
                dataType: 'json',
                quietMillis: 250,
                data: function (term, page) {
                    return {
                        q: term // search term
                    };
                },
                results: function (data, page) {
                    return {results: data};
                }
            }
        }).change(function (e) {
            if (e.val === "+") {
                //show simple textbox to input the new item
                $("#invoice_item_title").select2("destroy").val("").focus();
                $("#add_new_item_to_library").val(1); //set the flag to add new item in library
            } else if (e.val) {
                //get existing item info
                $("#add_new_item_to_library").val(""); //reset the flag to add new item in library
                $.ajax({
                    url: "<?php echo get_uri("sales/order/get_item_info_suggestion"); ?>",
                    data: {item_name: e.val},
                    cache: false,
                    type: 'POST',
                    dataType: "json",
                    success: function (response) {

                        //auto fill the description, unit type and rate fields.
                        if (response && response.success) {

                                $("#invoice_item_category").val(response.item_info.category);
                            

                                $("#invoice_unit_type").val(response.item_info.unit_type);
                                $("#invoice_item_quantity").val("1");

                                $("#invoice_item_basic").val(response.item_info.price);
                        }
                    }
                });
            }

        });
    }




</script>