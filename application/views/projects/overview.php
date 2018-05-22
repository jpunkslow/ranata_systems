<div class="clearfix bg-white">

    <div class="row" style="background-color:#E5E9EC;">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <?php $this->load->view("projects/project_progress_chart_info"); ?>
                </div>
                <div class="col-md-6 col-sm-12">
                    <?php $this->load->view("projects/project_task_pie_chart"); ?>
                </div>

                <?php
                if (count($custom_fields_list)) {
                    $fields = "";
                    foreach ($custom_fields_list as $data) {
                        if ($data->value) {
                            $fields.= "<div class='p10'><i class='fa fa-check-square'></i> $data->title </div>";
                            $fields.="<div class='p10 pt0 b-b ml15'>" . $this->load->view("custom_fields/output_" . $data->field_type, array("value" => $data->value), true) . "</div>";
                        }
                    }
                    if ($fields) {
                        ?>
                        <div class="col-md-12 col-sm-12 project-custom-fields">
                            <div class="panel">
                                <div class="pnel-body no-padding">
                                    <?php
                                    echo $fields;
                                    ?>
                                </div>
                            </div>
                        </div>
                        <?php
                    }
                }
                ?>

                <div class="col-md-12 col-sm-12">
                    <?php $this->load->view("projects/project_members/index"); ?>
                </div>  

                <div class="col-md-12 col-sm-12">
                    <?php $this->load->view("projects/project_description"); ?>
                </div>

            </div>
        </div>
        <div class="col-md-6">
            <div class="panel">
                <div class="tab-title clearfix">
                    <h4><?php echo lang('activity'); ?></h4>
                </div>
                <?php $this->load->view("projects/history/index"); ?>
            </div>
        </div>
    </div>
</div>


