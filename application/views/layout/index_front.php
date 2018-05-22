<!DOCTYPE html>
<html lang="en-US">
    <?php $this->load->view('includes/head_front'); ?>
    <body>
     <!-- Preloader Area Start 
    ====================================================== -->
    <div id="mask">
        <div id="loader">      
        </div>
    </div>
    <!-- =================================================
    Preloader Area End -->
    
    
    <!-- Header Area Start 
    ====================================================== -->
    <header class="header-area">
        <div class="container clearfix">
        
            <!-- Start: Logo Area -->
            <div class="logo-area">
                <a href="#" class="logo"><!-- <img src="img/logo.png" alt=""> --> <span style="color:white;"><b>NugaSoft Studio </b></span></a>
                <span class="phone">+6285778805131</span>
                <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            </div>
            <!-- End: Logo Area -->
            
            <!-- Start: Navigation Area -->
            <nav class="nav-main">
                <ul class="menu-cont">
                    <li class="active"><a href="<?php echo base_url() ?>">Home</a></li>
                    <li><a href="<?php echo base_url('pages/about') ?>">About</a></li>
                    <li><a href="<?php echo base_url('pages/services') ?>">Services</a></li>
                    <li><a href="<?php echo base_url('pages/portfolio') ?>">Portfolio</a></li>
                    <li><a href="<?php echo base_url('pages/blogs') ?>">Blog</a></li>
                    <!-- <li><a href="#">Pages</a>
                        <ul class="sub-menu">
                            <li><a href="order-now.html">Get a Quote</a></li>
                            <li><a href="pricing.html">Pricing</a></li>
                            <li><a href="team.html">Team</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="blog-single.html">Blog Single</a></li>
                            <li><a href="coming-soon.html">Coming Soon</a></li>
                            <li><a href="404.html">404</a></li>
                        </ul>
                    </li> -->
                    <li><a href="<?php echo base_url('pages/contact') ?>">Contact</a></li>
                    <li><a class="nav-order-btn" href="<?php echo base_url('signin') ?>">Login</a></li>
                </ul>
            </nav>
            <!-- End: Navigation Area -->
        
        </div>
    </header>    
        
    <?php
        if (isset($content_view) && $content_view != "") {
            $this->load->view($content_view);
        }
    ?>
    <?php $this->load->view('includes/footer_front'); ?>


    <?php 
    load_js(array(
        "assets_front/js/jquery-1.11.1.min.js",
        "assets_front/js/bootstrap.js",
        "assets_front/js/jquery.particleground.js",
        "assets_front/js/particle.js",
        "assets_front/js/jquery.flexslider.js",
        "assets_front/js/flexslider-settings.js",
        "assets_front/js/jquery.easytabs.min.js",
        "assets_front/js/easytabs-settings.js",
        "assets_front/js/testimonialcarousel.js",
        "assets_front/js/responsiveCarousel.js",
        "assets_front/js/jquery.magnific-popup.js",
        "assets_front/js/jquery.appear.js",
        "assets_front/js/settings.js"

    ));
    ?>

    <?php $this->load->view('includes/helper_js_front'); ?>
    <?php $this->load->view('includes/plugin_language_js_front'); ?>
    </body>

</html>