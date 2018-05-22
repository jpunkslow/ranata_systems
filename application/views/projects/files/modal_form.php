<?php echo form_open(get_uri("projects/save_file"), array("id" => "file-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="project_id" value="<?php echo $project_id; ?>" />
    <div class="form-group">
        <div class="col-sm-12">
            <div id="project-file-dropzone" class="dropzone mb15">

            </div>
            <div id="project-file-dropzone-scrollbar">
                <div id="project-file-previews">
                    <div id="project-file-upload-row" class="box">
                        <div class="preview box-content pr15" style="width:100px;">
                            <img data-dz-thumbnail class="upload-thumbnail-sm" />
                            <div class="progress progress-striped upload-progress-sm active mt5" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
                            </div>
                        </div>
                        <div class="box-content">
                            <p class="name" data-dz-name></p>
                            <p class="clearfix">
                                <span class="size pull-left" data-dz-size></span>
                                <span data-dz-remove class="btn btn-default btn-sm border-circle pull-right mt-5 mr10">
                                    <i class="fa fa-times"></i>
                                </span>
                            </p>
                            <strong class="error text-danger" data-dz-errormessage></strong>
                            <input class="file-count-field" type="hidden" name="files[]" value="" />
                            <input class="form-control description-field" type="text" style="cursor: auto;" placeholder="<?php echo lang("description") ?>" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="project-file-modal-footer" class="modal-footer">
    <button type="button" class="btn btn-default cancel-upload" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button id="project-file-save-button" type="submit" disabled="disabled" class="btn btn-primary start-upload"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        fileSerial = 0;
        $("#file-form").appForm({
            onSuccess: function (result) {
                $("#project-file-table").appTable({reload: true});
            }
        });
        $("#title").focus();

        setDatePicker("#start_date, #end_date");

        // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
        var previewNode = document.querySelector("#project-file-upload-row");
        previewNode.id = "";
        var previewTemplate = previewNode.parentNode.innerHTML;
        previewNode.parentNode.removeChild(previewNode);

        var projectFilesDropzone = new Dropzone("#project-file-dropzone", {
            url: "<?php echo get_uri("projects/upload_file"); ?>",
            thumbnailWidth: 80,
            thumbnailHeight: 80,
            parallelUploads: 20,
            maxFilesize: 3000,
            previewTemplate: previewTemplate,
            dictDefaultMessage: '<?php echo lang("file_upload_instruction"); ?>',
            autoQueue: true,
            previewsContainer: "#project-file-previews",
            clickable: true,
            accept: function (file, done) {

                if (file.name.length > 200) {
                    done("Filename is too long.");
                    $(file.previewTemplate).find(".description-field").remove();
                }

                //validate the file?
                $.ajax({
                    url: "<?php echo get_uri("projects/validate_project_file"); ?>",
                    data: {file_name: file.name, file_size: file.size},
                    cache: false,
                    type: 'POST',
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            fileSerial++;
                            $(file.previewTemplate).find(".description-field").attr("name", "description_" + fileSerial);
                            $(file.previewTemplate).append("<input type='hidden' name='file_name_" + fileSerial + "' value='" + file.name + "' />\n\
                                <input type='hidden' name='file_size_" + fileSerial + "' value='" + file.size + "' />");
                            $(file.previewTemplate).find(".file-count-field").val(fileSerial);
                            done();
                        } else {
                            $(file.previewTemplate).find("input").remove();
                            done(response.message);
                        }
                    }
                });
            },
            processing: function () {
                $("#project-file-save-button").prop("disabled", true);
            },
            queuecomplete: function () {
                $("#project-file-save-button").prop("disabled", false);
            },
            fallback: function () {
                //add custom fallback;
                $("body").addClass("dropzone-disabled");
                $('.modal-dialog').find('[type="submit"]').removeAttr('disabled');

                $("#project-file-dropzone").hide();
                $("#project-file-modal-footer").prepend("<button id='add-more-file-button' type='button' class='btn  btn-default pull-left'><i class='fa fa-plus-circle'></i> " + "<?php echo lang("add_more"); ?>" + "</button>");

                $("#project-file-modal-footer").on("click", "#add-more-file-button", function () {
                    var newFileRow = "<div class='file-row pb10 pt10 b-b mb10'>"
                            + "<div class='pb10 clearfix '><button type='button' class='btn btn-xs btn-danger pull-left mr10 remove-file'><i class='fa fa-times'></i></button> <input class='pull-left' type='file' name='manualFiles[]' /></div>"
                            + "<div class='mb5 pb5'><input class='form-control description-field'  name='description[]'  type='text' style='cursor: auto;' placeholder='<?php echo lang("description") ?>' /></div>"
                            + "</div>";
                    $("#project-file-previews").prepend(newFileRow);
                });
                $("#add-more-file-button").trigger("click");
                $("#project-file-previews").on("click", ".remove-file", function () {
                    $(this).closest(".file-row").remove();
                });
            },
            success: function (file) {
                setTimeout(function () {
                    $(file.previewElement).find(".progress-striped").removeClass("progress-striped").addClass("progress-bar-success");
                }, 1000);
            }
        });

        document.querySelector(".start-upload").onclick = function () {
            projectFilesDropzone.enqueueFiles(projectFilesDropzone.getFilesWithStatus(Dropzone.ADDED));
        };
        document.querySelector(".cancel-upload").onclick = function () {
            projectFilesDropzone.removeAllFiles(true);
        };
        initScrollbar("#project-file-dropzone-scrollbar", {setHeight: 280});

    });



</script>    
