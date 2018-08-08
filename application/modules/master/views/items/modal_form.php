<?php echo form_open(get_uri("master/items/add"), array("id" => "item-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    

    <div class="form-group">
        <label for="title" class=" col-md-3">Item Name</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "title",
                "name" => "title",
                "class" => "form-control validate-hidden",
                "placeholder" => lang('title'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <!-- <div class="form-group">
        <label for="code" class="col-md-3">Tax Code</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "code",
                "name" => "code",
                "class" => "form-control",
                "placeholder" => "Kode Pajak Produk"
            ));
            ?>
        </div>
    </div> -->
    <div class="form-group">
        <label for="category" class=" col-md-3">Category</label>
        <div class="col-md-9">
             <?php 
                echo form_dropdown(
                    "category", array(
                        "Akomodasi" => "Akomodasi",
                        "Transport" => "Transport"
                        ), "", "class='select2 mini'"
                    );
                        ?>
        </div>
    </div>
    <div class="form-group">
        <label for="unit_type" class=" col-md-3">Type</label>
        <div class="col-md-9">
             <?php 
                echo form_dropdown(
                    "unit_type", array(
                        "Domestic" => "Domestic",
                        "International" => "International",
                        "Umrah" => "Umrah",
                        "Maize" => "Maize",
                        "lainnya" => "Lain - lain"
                        ), "", "class='select2 mini'"
                    );
                        ?>
        </div>
    </div>

     <div class="form-group">
        <label for="category" class=" col-md-3">Sales Journal</label>
        <div class="col-md-9">
             <?php
                   echo form_dropdown("sales_journal", $sales_journal, "", "class='select2 validate-hidden' id='fid_quot' ");
                    ?>
        </div>
    </div>
    <div class="form-group">
        <label for="sales_journal_lawan" class=" col-md-3">Sales Journal Lawan</label>
        <div class="col-md-9">
             <?php
                   echo form_dropdown("sales_journal_lawan", $sales_journal_lawan, "", "class='select2 validate-hidden' id='fid_quot' ");
                    ?>
        </div>
    </div>

    <div class="form-group">
        <label for="category" class=" col-md-3">HPP Journal</label>
        <div class="col-md-9">
             <?php
                   echo form_dropdown("hpp_journal", $hpp_journal, "", "class='select2 validate-hidden' id='fid_quot' ");
                    ?>
        </div>
    </div>
     <div class="form-group">
        <label for="category" class=" col-md-3">HPP Journal Lawan</label>
        <div class="col-md-9">
             <?php
                   echo form_dropdown("lawan_hpp", $lawan_hpp, "", "class='select2 validate-hidden' id='fid_quot' ");
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