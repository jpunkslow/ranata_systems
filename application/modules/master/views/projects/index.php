<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1> Master Proyek</h1>
            <div class="title-button-group">
                <?php echo modal_anchor(get_uri("master/projects/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Proyek", array("class" => "btn btn-primary", "title" => "Add Proyek")); ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="projects-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#projects-table").appTable({
            source: '<?php echo_uri("master/projects/list_data") ?>',
            order: [[0, 'desc']],
            columns: [
                {title: 'Project Name'},
                {title: 'Description'},
                {title: 'Owners'},
                {title: 'Company'},
                
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1],
            xlsColumns: [0, 1]
        });
    });


</script>