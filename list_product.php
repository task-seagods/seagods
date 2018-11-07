<?php 
session_start();

include ("config/configuration.php");

include("config/template.php");

$perhalaman = 10;

if (isset($_GET['page'])){
  $page = (int)$_GET['page'];
  $start=($page - 1) * $perhalaman;
}else{
  $start=0;
}

$titlebar = "List Product";
$menu = "";

$sql_item 	= mysql_query("SELECT *  FROM `item` WHERE `item`.`level` = '0' 
						    Order by `item`.`id_item`  DESC LIMIT $start,$perhalaman;");
						    
$sql_total_data = mysql_num_rows(mysql_query( "SELECT * FROM `item` WHERE `item`.`level` = '0' order by `item`.`id_item`"));

if(isset($_GET['id_cat'])){
    $id_cat      = isset($_GET['id_cat']) ? strip_tags(trim($_GET['id_cat'])) : "";
    $query       = mysql_query("SELECT * FROM `item` where `item`.`id_cat` = '$id_cat' order by `id_item`;");
    $rows        = mysql_num_rows($query);  
}  

if(isset($_GET['id_cats'])){
    $id_cats      = isset($_GET['id_cats']) ? strip_tags(trim($_GET['id_cats'])) : "";
    $query       = mysql_query("SELECT * FROM `item` where `item`.`id_category` = '$id_cats' order by `id_item`;");
    $rows        = mysql_num_rows($query);  
}    

$content = '<div class="sections_group">
                    <div class="section">
                        <div class="section_wrapper clearfix">
                            <div class="items_group clearfix">
                                <div class="column one woocommerce-content">
                                    <div class="shop-filters">
                                        <!--<p class="woocommerce-result-count">
                                            Showing all 6 results
                                        </p>
                                        <form class="woocommerce-ordering" method="get">
                                            <select name="orderby" class="orderby">
                                                <option value="menu_order" selected="selected">Default sorting</option>
                                                <option value="popularity">Sort by popularity</option>
                                                <option value="rating">Sort by average rating</option>
                                                <option value="date">Sort by newness</option>
                                                <option value="price">Sort by price: low to high</option>
                                                <option value="price-desc">Sort by price: high to low</option>
                                            </select>
                                        </form>-->  
                                    </div>
                                    <div class="products_wrapper isotope_wrapper">
                                    <p class="woocommerce-result-count">
                                            Showing all '.(isset($_GET['id_cat']) ? strip_tags(trim($rows)) : "").' results
                                        </p>
                                        <ul class="products isotope grid">';

                                        if(isset($_GET['id_cat'])){
                                            $id_cat      = isset($_GET['id_cat']) ? strip_tags(trim($_GET['id_cat'])) : "";
                                            $query        = mysql_query("SELECT * FROM `item` where `item`.`id_cat` = '$id_cat' order by `id_item`;");

                                            while ($row_item = mysql_fetch_array($query)){
                                                $id_item    = $row_item['id_item'];
                                                $row        = mysql_query("SELECT * FROM  `photo` WHERE `id_item` = '$id_item' order by `id_item`;");
                                                $row_photo  = mysql_fetch_array($row);
                                                $rows       = mysql_num_rows($row); 
                                                $photo      = $row_photo["photo"];

                                                $content .='
                                                    <li class="isotope-item product has-post-thumbnail">
                                                        <div class="image_frame scale-with-grid product-loop-thumb" ontouchstart="this.classList.toggle("hover");">
                                                            <div class="image_wrapper">
                                                                <a href="detail_product.php?id='.$row_item["id_item"].'">
                                                                    <div class="mask"></div>';
                                                                    if($photo == ""){
                                                                        $content.='<img src="../admin/images/no-images.jpg" alt="'.$row_item['title'].'" class="scale-with-grid wp-post-image">'; 
                                                                    } else {
                                                                        $content .='
                                                                    <img src="../admin/images/product/150/thumb_'.$row_photo['photo'].'" alt="'.$row_item['title'].'" class="scale-with-grid wp-post-image">';
                                                                    }
                                                                    
                                                                    $content .='
                                                                </a>
                                                                <div class="image_links double">
                                                                    <a rel="nofollow" href="for-her.html" data-quantity="1" data-product_id="76" class="add_to_cart_button ajax_add_to_cart product_type_simple"><i class="icon-basket"></i></a><a class="link" href="product_page.html"><i class="icon-link"></i></a>
                                                                </div>
                                                            </div><a href="detail_product.php?id='.$row_item["id_item"].'"><span class="product-loading-icon added-cart"></span></a>
                                                        </div>
                                                        <div class="desc">
                                                            <h4><a href="detail_product.php?id='.$row_item["id_item"].'">'.$row_item['title'].'</a></h4>
                                                            <div class="star-rating">
                                                                <span style="width:80%">Rated <strong class="rating">4.00</strong> out of 5</span>
                                                            </div>
                                                            <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>'.$row_item['price'].'</span>
                                                            </span>
                                                        </div>
                                                        <div class="desc">
                                                            <form method="post" action="cart.php?code='.$row_item['code'].'">
                                                                <input type="text" name="quantity" value="1" size="2">
                                                                <input type="submit" value="add to chart">
                                                            </form>
                                                        </div>
                                                    </li>';
                                                    }

                                        } else if(isset($_GET['id_cats'])) {

                                            $id_cats      = isset($_GET['id_cats']) ? strip_tags(trim($_GET['id_cats'])) : "";
                                            $query        = mysql_query("SELECT * FROM `item` where `item`.`id_category` = '$id_cats' order by `id_item`;");

                                            while ($row_item = mysql_fetch_array($query)){
                                                $id_item    = $row_item['id_item'];
                                                $row        = mysql_query("SELECT * FROM  `photo` WHERE `id_item` = '$id_item' order by `id_item`;");
                                                $row_photo  = mysql_fetch_array($row);
                                                $rows       = mysql_num_rows($row); 
                                                $photo      = $row_photo["photo"];

                                                $content .='
                                                    <li class="isotope-item product has-post-thumbnail">
                                                        <div class="image_frame scale-with-grid product-loop-thumb" ontouchstart="this.classList.toggle("hover");">
                                                            <div class="image_wrapper">
                                                                <a href="detail_product.php?id='.$row_item["id_item"].'">
                                                                    <div class="mask"></div>';
                                                                    if($photo == ""){
                                                                        $content.='<img src="../admin/images/no-images.jpg" alt="'.$row_item['title'].'" class="scale-with-grid wp-post-image">'; 
                                                                    } else {
                                                                        $content .='
                                                                    <img src="../admin/images/product/150/thumb_'.$row_photo['photo'].'" alt="'.$row_item['title'].'" class="scale-with-grid wp-post-image">';
                                                                    }
                                                                    
                                                                    $content .='
                                                                </a>
                                                                <div class="image_links double">
                                                                    <a rel="nofollow" href="for-her.html" data-quantity="1" data-product_id="76" class="add_to_cart_button ajax_add_to_cart product_type_simple"><i class="icon-basket"></i></a><a class="link" href="product_page.html"><i class="icon-link"></i></a>
                                                                </div>
                                                            </div><a href="detail_product.php?id='.$row_item["id_item"].'"><span class="product-loading-icon added-cart"></span></a>
                                                        </div>
                                                        <div class="desc">
                                                            <h4><a href="detail_product.php?id='.$row_item["id_item"].'">'.$row_item['title'].'</a></h4>
                                                            <div class="star-rating">
                                                                <span style="width:80%">Rated <strong class="rating">4.00</strong> out of 5</span>
                                                            </div>
                                                            <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>'.$row_item['price'].'</span>
                                                            </span>
                                                        </div>
                                                        <div class="desc">
                                                            <form method="post" action="cart.php?code='.$row_item['code'].'">
                                                                <input type="text" name="quantity" value="1" size="2">
                                                                <input type="submit" value="add to chart">
                                                            </form>
                                                        </div>
                                                    </li>';
                                            }
                                        }  else {
                                            
                                            while ($row_item = mysql_fetch_array($sql_item)){
                                                $id_item    = $row_item['id_item'];
                                                $row        = mysql_query("SELECT * FROM  `photo` WHERE `id_item` = '$id_item' order by `id_item`;");
                                                $row_photo  = mysql_fetch_array($row);
                                                $rows       = mysql_num_rows($row); 
                                                $photo      = $row_photo["photo"];

                                                $content .='
                                                    <li class="isotope-item product has-post-thumbnail">
                                                        <div class="image_frame scale-with-grid product-loop-thumb" ontouchstart="this.classList.toggle("hover");">
                                                            <div class="image_wrapper">
                                                                <a href="detail_product.php?id='.$row_item["id_item"].'">
                                                                    <div class="mask"></div>';
                                                                    if($photo == ""){
                                                                        $content.='<img src="../admin/images/no-images.jpg" alt="'.$row_item['title'].'" class="scale-with-grid wp-post-image">'; 
                                                                    } else {
                                                                        $content .='
                                                                    <img src="../admin/images/product/150/thumb_'.$row_photo['photo'].'" alt="'.$row_item['title'].'" class="scale-with-grid wp-post-image">';
                                                                    }
                                                                    
                                                                    $content .='
                                                                </a>
                                                                <div class="image_links double">
                                                                    <a rel="nofollow" href="for-her.html" data-quantity="1" data-product_id="76" class="add_to_cart_button ajax_add_to_cart product_type_simple"><i class="icon-basket"></i></a><a class="link" href="product_page.html"><i class="icon-link"></i></a>
                                                                </div>
                                                            </div><a href="detail_product.php?id='.$row_item["id_item"].'"><span class="product-loading-icon added-cart"></span></a>
                                                        </div>
                                                        <div class="desc">
                                                            <h4><a href="detail_product.php?id='.$row_item["id_item"].'">'.$row_item['title'].'</a></h4>
                                                            <div class="star-rating">
                                                                <span style="width:80%">Rated <strong class="rating">4.00</strong> out of 5</span>
                                                            </div>
                                                            <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>'.$row_item['price'].'</span>
                                                            </span>
                                                        </div>
                                                        <div class="desc">
                                                            <form method="post" action="cart.php?code='.$row_item['code'].'">
                                                                <input type="text" name="quantity" value="1" size="2">
                                                                <input type="submit" value="add to chart">
                                                            </form>
                                                        </div>
                                                    </li>';
                                            }
                                        }

                                        $content .='
                                        </ul>
                                    </div>
                                    ';

                                    if(isset($_GET['id_cat']) || isset($_GET['id_cats'])){
                                        $content .='';
                                    } else {
                                        $content .=''.(halaman($sql_total_data, $perhalaman, 1, '?')).'';
                                    }

                                    $content .='
                                </div>
                            </div>
                        </div>
                    </div>
                </div>';
$plugin ='';
$template = admin_template($content,$titlebar,$menu,$plugin);
echo $template;

?>
