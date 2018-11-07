$content ='<div class="sections_group">
                    <div class="section">
                        <div class="section_wrapper clearfix">
                            <div class="items_group clearfix">
                                <div class="column one woocommerce-content">
                                    <div class="product has-post-thumbnail">
                                        <div class="column one post-nav minimal">
                                            <!--<a class="prev" href="product_page.html"><i class="icon icon-left-open-big"></i></a>
                                            </li><a class="next" href="product_page.html"><i class="icon icon-right-open-big"></i></a>
                                            </li>-->	
                                        </div>
                                        <div class="product_wrapper clearfix">
                                            <div class="column one-second product_image_wrapper">
                                                <span class="onsale"><i class="icon-star"></i></span>
                                                <div class="woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-4 images" data-columns="4" style="opacity: 0; transition: opacity .25s ease-in-out;">
                                                    <figure class="woocommerce-product-gallery__wrapper">
                                                        <div class="woocommerce-product-gallery__image">
                                                            <a href="../images/product/'.(isset($_GET['id']) ? strip_tags(trim($rows["photo"])) : "").'">
                                                            	<img src="../images/product/'.(isset($_GET['id']) ? strip_tags(trim($rows["photo"])) : "").'" class="attachment-shop_single size-shop_single wp-post-image">
                                                            </a>
                                                        </div>
                                                    </figure>
                                                </div>
                                            </div>
                                            <div class="summary entry-summary column one-second">
                                                <div class="woocommerce-product-rating">
                                                    <div class="star-rating">
                                                        <span style="width:80%">Rated <strong class="rating">4.00</strong> out of 5 based on <span class="rating">4</span> customer ratings</span>
                                                    </div>
                                                    
                                                </div>
                                                <p class="price">
                                                    <del><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>15.00</span></del><ins><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>'.(isset($_GET['id']) ? strip_tags(trim($data_item["price"])) : "").'</span></ins>
                                                </p><br><br>
                                                
                                               <form method="post" action="cart.php?code='.$data_item['code'].'">
                                                    <div class="quantity">
                                                        <label class="screen-reader-text" for="quantity_5a12b05791970">Quantity</label>
                                                        <input type="number" id="quantity_5a12b05791970" class="input-text qty text" step="1" min="1" max="" name="quantity" value="1" title="Qty" size="4"  pattern="[0-9]*" inputmode="numeric" />
                                                    </div>
                                                    <button type="submit" name="add-to-cart" value="70" class="single_add_to_cart_button button alt">
                                                        Add to cart
                                                    </button>
                                                </form>
                                                <!--<div class="product_meta">
                                                    <span class="posted_in">Categories: <a href="for-her.html" rel="tag">For her</a>, <a href="category_page.html" rel="tag">Shoes</a></span>
                                                </div>-->
                                            </div>
                                        </div>
                                        <div class="jq-tabs tabs_wrapper">
                                            
                                            <div id="tab-description">
                                                
                                                <hr class="" style="margin: 0 auto 30px">
                                                <div class="column one-second">
                                                    </p>
                                                    <h3>CARE</h3>
                                                    <p><img class="alignnone size-full wp-image-161" src="images/denim-product-icon-1.png">   Praesent nec magna ac pede auris
                                                    </p>
                                                    <p><img class="alignnone size-full wp-image-164" src="images/denim-product-icon-4.png">     Phasellus at nibh nulla nulla
                                                    </p>
                                                    <p><img class="alignnone size-full wp-image-163" src="images/denim-product-icon-3.png">  Egestas quam eu tortor orci, id eros.
                                                    </p>
                                                    <p><img class="alignnone size-full wp-image-162" src="images/denim-product-icon-2.png">    Mauris neque
                                                    </p>
                                                    <p>
                                                </div>
                                                <div class="column one-second">
                                                    </p>
                                                    <h3>DESCRIPTION
														</h3>
                                                    <p>
                                                        '.(isset($_GET['id']) ? strip_tags(trim($data_item["description"])) : "").'
                                                </div>
                                                </p>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>';