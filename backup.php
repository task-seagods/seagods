<?php 

$content = '<div id="Content">
            <div class="content_wrapper clearfix">
                <div class="sections_group">
                    <div class="entry-content">
                    	<table>';
while ($row_item = mysql_fetch_array($sql_item)){
	$id_item	= $row_item['id_item'];
	$row		= mysql_query("SELECT * FROM  `photo` WHERE `id_item` = '$id_item' order by `id_item`;");
	$row_photo 	= mysql_fetch_array($row);
	$rows		= mysql_num_rows($row); 
	if($i % 3 == 0){
		if($i > 0){
			$content.= '</tr>';
		}

		$content.= '<tr>';
	}

		$content.= '<td><img src="../images/product/150/thumb_'.$row_photo['photo'].'" alt="'.$row_item['title'].'"><br>
				  <center><a href="detail_product.php?id='.$row_item["id_item"].'">'.$row_item['title'].'</a></center><br><center>$'.$row_item['price'].'</center><br><br>
				  <center>
				  <form method="post" action="cart.php?code='.$row_item['code'].'">
				  		<input type="text" name="quantity" value="1" size="2">
				  		<input type="submit" value="add to chart">
				  </form>
				  <center>
			  </td>';

	$i++;
	 
}
$content .='			</table>
					</div>
				</div>
			</div>
			</div>';

?>