<!DOCTYPE html>
<html lang="en">
    <?php $this->load->view('includes/head'); ?>
    <body>
        <?php
        if ($topbar) {
            $this->load->view($topbar);
        }
        ?>
        <div id="content" class="box">
            <?php
            if ($left_menu) {
                $this->load->view($left_menu);
            }
            ?>
            <div id="page-container" class="box-content">
                <div id="pre-loader">
                    <div id="pre-loade" class="app-loader"><div class="loading"></div></div>
                </div>
                <div class="scrollable-page">
                    <?php
                    if (isset($content_view) && $content_view != "") {
                        $this->load->view($content_view);
                    }
                    ?>
                </div>
            </div>
        </div>
        <?php $this->load->view('modal/index'); ?>
        <?php $this->load->view('modal/confirmation'); ?>
        <div style='display: none;'>
            <script type='text/javascript'>
<?php
$error_message = $this->session->flashdata("error_message");
$success_message = $this->session->flashdata("success_message");
if (isset($error)) {
    echo 'appAlert.error("' . $error . '");';
}
if (isset($error_message)) {
    echo 'appAlert.error("' . $error_message . '");';
}
if (isset($success_message)) {
    echo 'appAlert.success("' . $success_message . '", {duration: 10000});';
}
?>

function tableToExcel(tableID, filename = ''){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}
    

            </script>
        </div>

    </body>
</html>