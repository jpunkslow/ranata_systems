<link rel="stylesheet" href="<?php echo base_url("assets/tree/") ?>jquery.treegrid.css">
<script type="text/javascript" src="<?php echo base_url("assets/tree/") ?>jquery.treegrid.js"></script>
<script type="text/javascript" src="<?php echo base_url("assets/tree/") ?>jquery.treegrid.bootstrap3.js"></script>


<div id="page-content" class="clearfix">
    <div class="panel panel-default" style="width: 1000px;margin:auto;">
        <div class="page-title clearfix">
            <h1><?php echo lang('master_coa'); ?></h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default btn-sm active mr-1"  title="<?php echo lang('list_view'); ?>"><i class="fa fa-bars"></i></button>
                    
                </div>
                <?php
                if ($this->login_user->is_admin) {
                    // echo modal_anchor(get_uri("team_members/invitation_modal"), "<i class='fa fa-envelope-o'></i> " . lang('send_invitation'), array("class" => "btn btn-default", "title" => lang('send_invitation')));
                    echo modal_anchor(get_uri("master/coa/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('master_coa_add'), array("class" => "btn btn-primary", "title" => lang('master_coa_add')));
                }
                ?>
            </div>
        </div>

        <?php 

         $sql = $this->db->query("SELECT * FROM acc_coa_type WHERE deleted = 0 ORDER BY account_number  ASC ");

        // $tree = "";
        // $depth = 1;
        // $top_level_on = 1;
        // $exclude = array();
        // array_push($exclude, 0);

        // foreach($sql->result() as $row){
        //     $goOn = 1;
        //     for($x = 0; $x< count($exclude); $x++){
        //         if($exclude[$x] == $row->id){

        //             $goOn = 0;
        //             break;

        //         }

        //     }
        //     if($goOn == 1){
        //         array_push($exclude, $row->id);
        //         // print_r($exclude);
        //         if($row->parental < 2){
        //             $top_level_on = $row->id;
        //         }
        //         // $tree .= "<tr></td>".$row->account_name."</td><tr>";
                
        //         $tree .= build_child($row->id,$exclude);
        //     }
        // }-

        


       
        ?>
            <div class="table-responsive" style="height: 630px;overflow-y: auto;">
            <table class="table tree">
                <thead>
                    <tr>
                        
                        <th>ACCOUNT NAME</th>
                        <th>NO ACCOUNT</th>
                        <th>NORMALLY</th>
                        <th>ACCOUNT TYPE</th>
                        <th>REPORTING</th>
                        <th>IN/OUT</th>
                        <th class="text-center"><i class="fa fa-cogs "></i></th>
                    </tr>

                </thead>
                <tbody>
    <?php foreach($sql->result() as $row){ ?>
        <?php if($row->parent == "Head"){ ?>
                <tr class="treegrid-<?php echo $row->id ?>">
                    
                    <td><span class="treegrid-expander glyphicon glyphicon-chevron-right"></span><strong><?php echo $row->account_name; ?></strong></td>
                    <td><?php echo $row->account_number; ?></td>
                    <td><?php echo $row->normally; ?></td>
                    <td><?php echo $row->account_type; ?></td>
                    <td><?php echo $row->reporting; ?></td>
                    <td><?php echo $row->akun; ?></td>
                    <td><?php echo modal_anchor(get_uri("master/coa/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "btn btn-sm btn-default", "title" => lang('edit'), "data-post-id" => $row->id)); ?></td>
                    
                </tr>
            <?php } ?>
            <?php ?>
                <tr class="treegrid-<?php echo $row->id ?> treegrid-parent-<?php echo $row->parental ?>" style="display: none;">
                    
                    <td><span class="treegrid-indent"></span><span class="treegrid-expander"></span><?php echo $row->account_name ?></td>
                    <td><?php echo $row->account_number; ?></td>
                    <td><?php echo $row->normally; ?></td>
                    <td><?php echo $row->account_type; ?></td>
                    <td><?php echo $row->reporting; ?></td>
                    <td><?php echo $row->akun; ?></td>
                     <td><?php echo modal_anchor(get_uri("master/coa/modal_form_edit"), "<i class='fa fa-pencil'></i>", array("class" => "btn btn-sm btn-default", "title" => lang('edit'), "data-post-id" => $row->id)); ?></td>
                   
                    
                </tr>
              
            <?php } ?>
            </tbody>
        </table>
        </div>
           

       
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('.tree').treegrid();

        var visibleDelete = false;
        if ("<?php echo $this->login_user->is_admin; ?>") {
            visibleDelete = true;
        }

        // $("#master_coa-table").appTable({
        //     source: '<?php echo_uri("master/coa/list_data") ?>',
        //     // order: [[1, "asc"]],
        //     columns: [
        //         // {title: "ORDER"},
        //         {title: 'NO ACCOUNT'},
        //         {title: "ACCOUNT NAME"},
        //         {title: "IS PARENT"},
        //         {title: "NORMALLY"},
        //         {title: "ACCOUNT_TYPE"},
        //         {title: "REPORTING"},
        //         {title: "IN/OUT"},

        //         {visible: visibleDelete, title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
        //     ],
        //     displayLength: 100,
        //     printColumns: [1, 2, 3, 4,5,6,7,8],
        //     xlsColumns: [ 1, 2, 3, 4,5,6,7,8]

        // });

        
    });
</script>    
