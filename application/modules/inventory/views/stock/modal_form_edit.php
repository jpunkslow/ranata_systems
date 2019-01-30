<?php echo form_open(get_uri("inventory/stock/save"), array("id" => "stock-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />

    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
           
            <div class="form-group">
                <label for="master_warehouse_id" class=" col-md-3"> Warehouse</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown("master_warehouse_id", $data_warehouse, $model_info->master_warehouse_id, "class='select2 validate-hidden' id='master_warehouse_id' ");
                                                    
                    ?>
                </div>
            </div>
            
            <div class="form-group">
                <label for="master_items_id" class=" col-md-3">Product Item</label>
                <div class=" col-md-9">
                    <?php
                    echo form_dropdown("master_items_id", $data_items, $model_info->master_items_id, "class='select2 validate-hidden' id='master_items_id' ");
                                                    
                    ?>
                </div>
            </div>
              <div class="form-group">
                <label for="npwp" class=" col-md-3">Stock</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "stock_on_hand",
                        "name" => "stock_on_hand",
                        "class" => "form-control",
                        "value" => $model_info->stock_on_hand,
                        "placeholder" =>  'Stock on hand',
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class=" col-md-3">Description</label>
                <div class=" col-md-9">
                    <?php
                    echo form_textarea(array(
                        "id" => "description",
                        "name" => "description",
                        "value" => $model_info->description,
                        "class" => "form-control",
                        "placeholder" => 'Description'
                    ));
                    ?>
                </div>
            </div>
           <div class="form-group">
        <label for="date" class="col-md-3">Date Adjustment</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "date",
                "name" => "date_adjusment",
                "value" => $model_info->date_adjusment,
                "class" => "form-control",
                "placeholder" => "Y-m-d"
            ));
            ?>
        </div>
    </div>
            
        </div>


    </div>

</div>


<div class="modal-footer">
    <button class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button id="form-submit" type="button" class="btn btn-primary "><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {
        $("#stock-form .select2").select2();
        setDatePicker("#date");
        $("#stock-form").appForm({
            onSuccess: function(result) {
                if (result.success) {
                    $("#stock-table").appTable({newData: result.data, dataId: result.id});
                }
            }
       });

        $("#stock-form input").keydown(function(e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                      $("#stock-form").trigger('submit');
                
            }
        });
        $("#name").focus();
       

        $("#form-submit").click(function() {
            $("#stock-form").trigger('submit');
        });

    });
</script>