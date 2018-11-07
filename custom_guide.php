<?php 
session_start();

include ("config/configuration.php");
include ("config/template_detail.php");


$query = mysql_query("Select custom from pages");
$data = mysql_fetch_assoc($query);
$about = $data['custom'];

$titlebar = "Custom Guide ";
$menu 	  = "";

$content ='<div id="Subheader" style="padding:50px 0px 30px;">
                <div class="container">
                    <div class="column one">
                        <h2 class="title">   Custom Guide </h2>
                    </div>
                </div>
            </div>
        </div>
        <div id="Content">
            <div class="content_wrapper clearfix">
                <div class="sections_group">
                    <div class="section">
                        <div class="section_wrapper clearfix">
                            <div class="items_group clearfix">
                                <div class="column one woocommerce-content">
                                    <div class="product has-post-thumbnail">
                                    
                                        <div class="post-content">
                                           '.$about.'
                                        </div>
              
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                ';

$plugin ='';
$template = admin_template($content,$titlebar,$menu,$plugin);
echo $template;           

?>