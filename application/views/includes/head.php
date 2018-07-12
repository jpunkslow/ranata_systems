<head>
    <?php $this->load->view('includes/meta'); ?>
    <?php $this->load->view('includes/helper_js'); ?>
    <?php $this->load->view('includes/plugin_language_js'); ?>

    <?php
    load_css(array(
        "assets/bootstrap/css/bootstrap.min.css",
        "assets/js/font-awesome/css/font-awesome.min.css",
        "assets/js/datatable/css/jquery.dataTables.min.css",
        "assets/js/datatable/TableTools/css/dataTables.tableTools.min.css",
        "assets/js/select2/select2.css",
        "assets/js/select2/select2-bootstrap.min.css",
        "assets/js/bootstrap-datepicker/css/datepicker3.css",
        "assets/js/bootstrap-timepicker/css/bootstrap-timepicker.min.css",
        "assets/js/x-editable/css/bootstrap-editable.css",
        "assets/js/dropzone/dropzone.min.css",
        "assets/js/magnific-popup/magnific-popup.css",
        "assets/js/malihu-custom-scrollbar/jquery.mCustomScrollbar.min.css",
        "assets/js/awesomplete/awesomplete.css",
        "assets/css/font.css",
        "assets/css/style.css",
        "assets/css/custom-style.css",
       
    ));

    if(isset($css_files)){
        foreach($css_files as $file) { 
            echo '<link type="text/css" rel="stylesheet" href="'.$file.'" />';
        }
    }

    load_js(array(
        "assets/js/jquery-1.11.3.min.js",
        "assets/bootstrap/js/bootstrap.min.js",
        "assets/js/jquery-validation/jquery.validate.min.js",
        "assets/js/jquery-validation/jquery.form.js",
        "assets/js/malihu-custom-scrollbar/jquery.mCustomScrollbar.concat.min.js",
        "assets/js/datatable/js/jquery.dataTables.min.js",
        "assets/js/select2/select2.js",
        "assets/js/datatable/TableTools/js/dataTables.tableTools.min.js",
        "assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js",
        "assets/js/bootstrap-timepicker/js/bootstrap-timepicker.min.js",
        "assets/js/x-editable/js/bootstrap-editable.min.js",
        "assets/js/fullcalendar/moment.min.js",
        "assets/js/dropzone/dropzone.min.js",
        "assets/js/magnific-popup/jquery.magnific-popup.min.js",
        "assets/js/notificatoin_handler.js",
        "assets/js/general_helper.js",
        "assets/js/jquery.maskMoney.js",
        "assets/js/app.min.js",
    ));
    ?>

    <?php 
    if(isset($css_files)){
    
        foreach($js_files as $file) { ?>
            <script src="<?php echo $file; ?>"></script>
    <?php 
        } 
    }
    ?>

    <!-- <link rel="stylesheet" type="text/css" href="https://adminlte.io/themes/AdminLTE/dist/css/AdminLTE.min.css"> -->
</head>