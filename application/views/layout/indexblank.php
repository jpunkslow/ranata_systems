4<!DOCTYPE html>
<html lang="en">
    <body>
     
                    <?php
                    if (isset($content_view) && $content_view != "") {
                        $this->load->view($content_view);
                    }
                    ?>
               
    </body>
</html>