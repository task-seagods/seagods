<?php



function admin_template($content="",$titlebar="",$titlepage="",$user="",$menu="",$plugin=""){

	$titlebar      = ($titlebar!="") ? $titlebar : "";
	$titlepage     = ($titlepage!="") ? $titlepage : "";
    $plugin	    = ($plugin!="") ? $plugin : "";
    $menu	    = ($menu!="") ? $menu : "";
    $content	= ($content!="") ? $content : "";
  

$menu = '<div class="column one">
			<div class="top_bar_left clearfix">
            	<div class="logo">
                	<a id="logo" href="index-denim.html" title="Sea Gods" data-height="60" data-padding="0"><img class="logo-main scale-with-grid" src="images/logo.png" data-retina="images/logo.png" data-height="21" alt="sea gods"><img class="logo-sticky scale-with-grid" src="images/logo.png" data-retina="images/logo.png" data-height="21" alt="sea gods"><img class="logo-mobile scale-with-grid" src="images/logo.png" data-retina="images/logo.png" data-height="21" alt="sea gods"><img class="logo-mobile-sticky scale-with-grid" src="images/logo.png" data-retina="images/logo.png" data-height="21" alt="sea gods">
                	</a>
            	</div>
            	<div class="menu_wrapper">
                	<nav id="menu">
                    	<ul id="menu-main-menu" class="menu menu-main">
                        	<li class="current-menu-item"><a href="index.php"><span>Home</span></a></li>
                                            <li><a href="about_us.php"><span>About Us</span></a></li>
                                            <li><a href="buyers_guide.php"><span>Guide</span></a></li>
                                            <li><a href="list_product.php"><span>Collection</span></a></li>
                                            <li><a href="custom/"><span>Custom</span></a></li>
                                            <li><a href="contact_us.php"><span>Contact</span></a></li>
                                            <li><a href="member/index.php" target="_blank"><span>Memberpage</span></a></li>
                    	</ul>
                	</nav>
                	<a class="responsive-menu-toggle" href="#"><i class="icon-menu-fine"></i></a>
            	</div>
        	</div>
            <div class="top_bar_right">
                <div class="top_bar_right_wrapper"><a id="header_cart" href="cart.php"><i class="icon-bag-fine"></i><span>0</span></a>
                </div>
            </div>
        </div>';


$template ='<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8 lt-ie7 "> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie10 lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie10 lt-ie9"> <![endif]-->
<!--[if IE 9]><html class="no-js lt-ie10"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>

    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>'.$titlebar.'</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- FONTS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Patua+One:100,300,400,400italic,700">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic,900">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Montserrat:100,300,400,400italic,500,700,700italic">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Asap+Condensed:100,300,400,400italic,500,700,700italic">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,400italic,500,700,700italic">

    <!-- CSS -->
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/structure.css">
    <link rel="stylesheet" href="css/denim.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" type="text/css" href="css/paging.css">
    '.$plugin.'
</head>

<body class="woocommerce woocommerce-page with_aside aside_left color-custom style-simple button-flat layout-full-width if-zoom if-border-hide no-shadows header-classic minimalist-header sticky-header sticky-tb-color ab-hide subheader-both-center menu-link-color menuo-no-borders menuo-right mobile-tb-hide mobile-side-slide mobile-mini-mr-ll tablet-sticky mobile-sticky be-reg-2062">
    <div id="Wrapper">
    <div id="Header_wrapper">
            <header id="Header">
                <div class="header_placeholder"></div>
                <div id="Top_bar">
                    <div class="container">
                        '.$menu.'
                            
                    </div>
                </div>
                
            </header>
    	'.$content.'
    	<div class="sidebar four columns">
                    <div class="widget-area clearfix">
                        <aside class="widget woocommerce widget_product_categories">
                            <h3>CATEEGORIES</h3>
                            <ul class="product-categories">';
                                $sql_caregory = mysql_query("SELECT * FROM `category` WHERE `id_parent` = '0' ORDER BY `id_cat` DESC  ;");
                                while ($row_category = mysql_fetch_array($sql_caregory)){
                                    $template .='
                                      <li>'.$row_category["category"].'';
                                    $sql_subcaregory = mysql_query("SELECT * FROM `category` WHERE `id_parent` = '$row_category[id_cat]' ORDER BY `id_cat` DESC  ;");
                                    while ($row_sucategory = mysql_fetch_array($sql_subcaregory)){
                                      $template .='
                                        <ul><li><a href="list_product.php?id_cat='.$row_sucategory['id_cat'].'">'.$row_sucategory["category"].'</a></li></ul>';
                                    }   
                                $template .='
                                       </li>';
                                }

                            $template .='
                            </ul>
                        </aside>
                        
                        <aside class="widget_text widget widget_custom_html">
                            <div class="textwidget custom-html-widget">
                                <div style="text-align:center; padding:20px 10px; border:2px solid #e9c445;">
                                    <h3>SIGN UP FOR
                                        <br>
                                        NEWSLETTER</h3>
                                    <p>
                                        Aenean ligula nibh, mole stie id viverra a, dapibus ante lobortis
                                    </p>
                                    <a class="button button_size_2 button_js" href="#" style=" background-color:#e9c445 !important; color:#000;"><span class="button_label">Subscribe</span></a>
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
     		</div>
        </div>
        <footer id="Footer" class="clearfix">
            <div class="widgets_wrapper" style="padding:70px 0">
                <div class="container">
                    <div class="column one-fourth">
                        <aside class="widget_text widget widget_custom_html">
                            <div class="textwidget custom-html-widget">
                                <h3>Have a question?<br> Or maybe you want<br> to cooperate?</h3>
                                <br> <a class="button button_size_2 button_js" href="contact.html" style=" background-color:#45b5e9 !important; color:#000;"><span class="button_label">Contact with us</span></a>
                            </div>
                        </aside>
                    </div>
                    <div class="column one-fourth">
                        <aside class="widget_text widget widget_custom_html">
                            <h4>Sea Gods Wet Suit</h4>
                            <div class="textwidget custom-html-widget">
                                <ul class="list-footer">
                                     <li><i class="icon-dot themecolor"></i><a href="about_us.php">Company Profile</a>
                                    </li>
                                    <li><i class="icon-dot themecolor"></i><a href="production.php">Production</a>
                                    </li>
                                    <li><i class="icon-dot themecolor"></i><a href="buyers_guide.php">Buyers Guide</a>
                                    </li>
                                    <li><i class="icon-dot themecolor"></i><a href="payment_guide.php">Payment Guide</a>
                                    </li>
                                </ul>
                            </div>
                        </aside>
                    </div>
                    <div class="column one-fourth">
                        <aside class="widget_text widget widget_custom_html">
                            <h4>Office & Store</h4>
                            <div class="textwidget custom-html-widget">
                                <p>By Pass Ngurah Rai lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>
                                <a href="about.html"><b>Read more</b></a>
                            </div>
                        </aside>
                    </div>
                    <div class="column one-fourth">
                        <aside id="media_image-2" class="widget widget_media_image">
                            <h4>About Us</h4>
                            <img src="images/blog1.jpg" class="image wp-image-126  attachment-full size-full" style="max-width: 100%; height: auto;">
                        </aside>
                    </div>
                </div>
            </div>
            <div class="footer_copy">
                <div class="container">
                    <div class="column one">
                         <a id="back_to_top" class="button button_js" href="#"><i class="icon-up-open-big"></i></a>
                        <div class="copyright"> &copy; 2018. Sea Gods Wetsuit <!-- HTML by <a target="_blank" rel="nofollow" href="http://bit.ly/1M6lijQ">BeantownThemes</a>
                        --></div>

                    </div>
                </div>
            </div>
        </footer>
    </div>

        <!-- mobile menu -->
    <div id="Side_slide" class="right dark" data-width="250">
        <div class="close-wrapper"><a href="#" class="close"><i class="icon-cancel-fine"></i></a>
        </div>
        <div class="extras">
            <div class="extras-wrapper">
                <a class="icon cart" id="slide-cart" href="content/denim/cart.html"><i class="icon-bag-fine"></i><span>0</span></a>
            </div>
        </div>
        <div class="menu_wrapper"></div>
    </div>
    <div id="body_overlay"></div>

    <!-- JS -->
    <script src="js/jquery-2.1.4.min.js"></script>

    <script src="js/mfn.menu.js"></script>
    <script src="js/jquery.plugins.js"></script>
    <script src="js/jquery.jplayer.min.js"></script>
    <script src="js/animations/animations.js"></script>
    <script src="js/translate3d.js"></script>
    <script src="js/scripts.js"></script>


</body>

</html>
';

return $template;
}

?>



        

           
    
