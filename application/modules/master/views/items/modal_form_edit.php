<?php echo form_open(get_uri("master/items/save"), array("id" => "item-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />

    

    <div class="form-group">
        <label for="title" class=" col-md-3">Nama Produk</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "title",
                "name" => "title",
                "value" => $model_info->title,
                "class" => "form-control validate-hidden",
                "placeholder" => lang('title'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="code" class="col-md-3">Kode Pajak</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "code",
                "name" => "code",
                "value" => $model_info->code,
                "class" => "form-control",
                "placeholder" => "Kode Pajak Produk"
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
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
    </div>
    <div class="form-group">
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
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {

        $("#item-form .select2").select2();
        $("#item-form").appForm({
            onSuccess: function (result) {
                $("#item-table").appTable({newData: result.data, dataId: result.id});
            }
        });
    });
</script>