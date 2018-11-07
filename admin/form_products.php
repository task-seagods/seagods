<?php
/*
 * Project Name: SeaGods
 * Project URI: http://seagodswetsuit.com
 * Author: GlobalXtreme.net
 * Version: 1.0  | 1 Februari 2018
 * Email: adit@globalxtreme.net
 */
include ("config/configuration.php");
include ("config/fungsi_images.php");
//include ("config/fungsi_thumb.php");
session_start();
ob_start();

if($loggedin = logged_inadmin()){ // Check if they are logged in


if(isset($_POST['nilai'])){
    $_SESSION['nilai_login'] = $_POST['nilai']+1;
}else{
    $_SESSION['nilai_login'] = 0;
}

$loggedin = logged_inadmin();
$titlebar ="Add Product";
$titlepage="Add Product";
$menu="";
$user=  ''.$loggedin['firstname'].' '.$loggedin['lastname'].'';
	  
	  $folderTujuan = 'images/product/'; //folder dimana file akan di letakkan
      $folder1 = 'images/product/600/'; //folder dimana file 150px akan di letakkan
      $folder2 = 'images/product/150/'; //folder dimana file 600px akan di letakkan
      $lebarGambar1  = 600; //ukuran lebar gambar 600px hasil resize
      $lebarGambar2  = 150; //ukuran lebar gambar 150px resize

$simpan = isset($_POST["simpan"]) ? $_POST["simpan"] : '';
$update = isset($_POST["update"]) ? $_POST["update"] : '';

function randomString($length = 5) {
    $str = "";
    $characters = array_merge(range('A','Z'), range('a','z'), range('0','9'));
    $max = count($characters) - 1;
    for ($i = 0; $i < $length; $i++) {
        $rand = mt_rand(0, $max);
        $str  .= $characters[$rand];
    }
    return $str;
}

$file 			= array();
	if($simpan == "Simpan"){
	    $title  	= isset($_POST['title']) ? strip_tags(trim($_POST["title"])) : "";
		$category   = explode('-', isset($_POST['id_cat']) ? strip_tags(trim($_POST["id_cat"])) : "");
		$price  	= isset($_POST['price']) ? strip_tags(trim($_POST["price"])) : "";
		$detail  	= isset($_POST['detail']) ? $_POST["detail"] : "";
		$describe	= isset($_POST['describe']) ? $_POST["describe"] : "";
		$code		= isset($_POST['code']) ? $_POST["code"] : "";

		

		$id_cat = $category[0];
		$id_category = $category[1];

	    
	    $queryproduct =  "INSERT INTO `item` (`id_item`, `code`, `title`, `id_category` , `id_cat`, `price`, `detail`, `description`, `date_add`, `date_upd`, `level`) 
										VALUES (NULL, '$code', '$title', '$id_cat' ,'$id_category', '$price', '$detail', '$describe', NOW(), NOW(), '0');";
										
										
	    //echo $query ;
	mysql_query($queryproduct) or die("<script language='JavaScript'>
			alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");
			
	
	
	$tmpName = $_FILES['fileimage']['tmp_name'];
	
	
	for($i=0; $i < count($tmpName); $i++){
	  
	  $query_last = mysql_query("SELECT * FROM `item` ORDER BY `id_item` DESC LIMIT 0,1");
	  $last_data = mysql_fetch_array($query_last);
	  $last_id_item = $last_data["id_item"];
	  
	  
	  
	  if($tmpName[$i] !=""){
	    
	  $foto = $_FILES['fileimage']['name'][$i];
	  $fotoTmp = $_FILES['fileimage']['tmp_name'][$i];
	  //$fileFoto = $_FILES['fileimage']["name"]; //mengambil nilai file gambar
            
	    //$frontpage = ($i == "0" ? "0" : "1");
	    
	    
            $namaFileTujuan = namaFileTujuanProduk($foto, $folderTujuan); //cek file tujuan upload,
            $file[] = $namaFileTujuan;
            $pathFileTujuan = $folderTujuan . $namaFileTujuan; //membuat alamat file tujuan
            $prosesUpload = prosesUploadProduk($fotoTmp, $pathFileTujuan); //proses copy image to folder staff
            $prosesResized1 = resizeGambar1($pathFileTujuan, $lebarGambar1, $folder1, $namaFileTujuan, $prefix); //proses resize
            $prosesResized2 = resizeGambar2($pathFileTujuan, $lebarGambar2, $folder2, $namaFileTujuan, $prefix); //proses resize
            
			

	    
	    $query2 = "INSERT INTO `photo`(id_photo, id_item, photo, date_add, date_upd, level)
		   VALUES ('','$last_id_item','$namaFileTujuan', now(),now(),'0')";


//echo $sql.'<br>'.$query2;

            mysql_query($query2) or die(mysql_error());
	   }
	   }
		echo "<script language='JavaScript'>
			alert('Data telah disimpan!');
			location.href = 'list_products.php';
            </script>";
	
	}
	
	if($update == "Update"){
	    $id_items	= isset($_POST['id_item']) ? strip_tags(trim($_POST["id_item"])) : "";
	    $title  	= isset($_POST['title']) ? strip_tags(trim($_POST["title"])) : "";
		$category   = explode('-', isset($_POST['id_cat']) ? strip_tags(trim($_POST["id_cat"])) : "");
		$price  	= isset($_POST['price']) ? strip_tags(trim($_POST["price"])) : "";
		$detail  	= isset($_POST['detail']) ? $_POST["detail"] : "";
		$describe	= isset($_POST['describe']) ? $_POST["describe"] : "";
		$code		= isset($_POST['code']) ? $_POST["code"] : "";

		$id_cat = $category[0];
		$id_category = $category[1];
		
	    
	    $queryproduct =  "UPDATE `item` SET `title` = '$title', `code` = '$code', `id_category` = '$id_cat' , 
	    											  `id_cat` = '$id_category',  `price` = '$price',
													  `detail` = '$detail', `description` = '$describe',
													  `date_upd` = NOW()
												  WHERE `item`.`id_item` = '$id_items';";
										
										
	    //echo $query ;
	mysql_query($queryproduct) or die(mysql_error());
	
	echo "<script language='JavaScript'>
			alert('Data telah disimpan!');
			location.href = 'list_products.php';
            </script>";
	}
	
	if(isset($_GET["id"])){
		
        $id_item  		= isset($_GET['id']) ? strip_tags(trim($_GET['id'])) : "";
        $query          = "SELECT `item`.* FROM `item` WHERE `item`.`level` = '0' AND `item`.`id_item` = '$id_item'  ORDER BY `item`.`id_item` DESC ;";
		$id          	= mysql_query($query);
		$data_item		= mysql_fetch_array($id);
		

	}
	
	if(isset($_GET["id_photo"])){
		$id_photo 	= isset($_GET['id_photo']) ? strip_tags(trim($_GET['id_photo'])) : "";
		$query 		= "SELECT `photo`.* from `photo` where `id_photo` = '$id_photo';";
		$photo 		= mysql_query($query);

		$del 		= "UPDATE `photo` set `level` = '1' where `id_photo` = '$id_photo';";

		mysql_query($del) or die ("<script language='JavaScript'>
			alert('Maaf Data tidak bisa dihapus di dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");

		echo "<script language='JavaScript'>
			alert('Photo telah dihapus!');
			location.href = 'list_products.php';
            </script>";
	}

$content = '
 <div class=" container    container-fixed-lg">
<div class="row">
              <div class="col-lg-12">
   <div class="card card-default">
                  <div class="card-header ">	
                    <div class="card-title">
                      ADD NEW PRODUCTS					
                    </div>
                  </div>
                  <div class="card-block">
                    <form class="" method="post" name="product" id="product" role="form" enctype="multipart/form-data">';
                      if(isset($_GET['id'])){
                      	$content .='
                      		<input type="hidden" name="code" value="'.randomString().'">';
                      }	else {
                      	$content .='
                      		<input type="hidden" name="code" value="'.randomString().'">';
                      }
                      $content .='
                      <div class="form-group form-group-default required ">
                        <label>Product Name</label>
                        <input type="text" class="form-control" name="title" value="'.(isset($_GET['id']) ? strip_tags(trim($data_item["title"])) : "").'" required>
                        <input type="hidden" class="form-control" name="id_item" value="'.(isset($_GET['id']) ? $_GET['id'] : "").'">
                      </div>
					
					  <div class="form-group form-group-default form-group-default-select2 required">
                        <label class="">Category</label>
						<select class="full-width" data-placeholder="Select Category" name="id_cat" data-init-plugin="select2">';
						$sql_caregory = mysql_query("SELECT * FROM `category` WHERE `id_parent` = '0' AND `LEVEL` = '0' ORDER BY `id_cat` DESC  ;");
						while ($row_category = mysql_fetch_array($sql_caregory)){
							$content .='
	                          <optgroup label="'.$row_category["category"].'">
	                          ';
							$sql_subcaregory = mysql_query("SELECT * FROM `category` WHERE `id_parent` = '$row_category[id_cat]' AND `LEVEL` = '0' ORDER BY `id_cat` DESC  ;");
							while ($row_sucategory = mysql_fetch_array($sql_subcaregory)){
							  $content .='
	                            <option value="'.$row_category["id_cat"]."-".$row_sucategory["id_cat"].'" '.(isset($_GET['id']) && $data_item["id_cat"] == $row_sucategory["id_cat"]  ? "selected" : "").'>'.$row_sucategory["category"].'</option>
	                            ';
							}	
						$content .='
                               </optgroup>


                               ';
						}
						
						$content .='
						 
                        </select>
                      </div>
					  
					  <div class="form-group form-group-default required ">
                        <label>Price</label>
                        <input type="text" name="price" value="'.(isset($_GET['id']) ? strip_tags(trim($data_item["price"])) : "").'" class="form-control" required>
                      </div>
                     <div class="form-group form-group-default required ">';
                    if(isset($_GET["id"])){
                     $photo = mysql_query("SELECT `photo`.* from `photo` where `photo`.`id_item` = '$id_item' AND `photo`.`level` = '0';");
					 while ($rows = mysql_fetch_array($photo)){
                     	$content .=' 
	                     	<img style="height:200px" src="images/product/150/thumb_'.(isset($_GET['id']) ? strip_tags(trim($rows["photo"])) : "").'"><a href="form_products.php?id_photo='.(isset($_GET['id']) ? strip_tags(trim($rows["id_photo"])) : "").'">delete</a>
	                     	';

                     }
                    }
                    
                     $content .='
                      </div>
                       <div class="form-group form-group-default ">
                        <label>Upload Gambar</label><br/>
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
                         <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />
						
						</fieldset>
                      </div>
					
					
					
					<div class="form-group form-group-default required ">
                        <label>Detail</label>
						<textarea class="form-control" name="detail" required style="height:100px">'.(isset($_GET['id']) ? strip_tags(trim($data_item["detail"])) : "").'</textarea>
                      </div>
					  
					<div class="form-group form-group-default required ">
                        <label>Description</label>
						<textarea class="form-control" required name="describe" style="height:200px"> '.(isset($_GET['id']) ? strip_tags(trim($data_item["description"])) : "").'</textarea>
                      </div>
					  
					  <button class="btn btn-primary" type="submit" name="'.(isset($_GET['id']) ? "update"  : "simpan").'" value="'.(isset($_GET['id']) ? "Update"  : "Simpan").'">'.(isset($_GET['id']) ? "Update Product" : "Create a new Product").'</button>
					
					
                    </form>
                  </div>
                </div>
				</div>
				</div>
				</div>
		  
';

$plugin ='     <script src="assets/plugins/switchery/js/switchery.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-datatable/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-datatable/extensions/TableTools/js/dataTables.tableTools.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-datatable/media/js/dataTables.bootstrap.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-datatable/extensions/Bootstrap/jquery-datatable-bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/plugins/datatables-responsive/js/datatables.responsive.js"></script>
    <script type="text/javascript" src="assets/plugins/datatables-responsive/js/lodash.min.js"></script>
	    <!--  BEGIN PAGE LEVEL JS  -->
    <script src="assets/js/datatables.js" type="text/javascript"></script>
    <script src="assets/js/scripts.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL JS -->
	
	 <!-- upload -->

	<script language="javascript">
	jq = $.noConflict();
	jq(document).ready(function(){
		fields = 0;
		jq(\'.add_more\').click(function(e){
			e.preventDefault();
		
		if (fields != 4) {
			jq(".textADD").append(\'Gambar : <input type="file" value="" name="fileimage[]" style="height: 31px;" /> <br />\');
			fields += 1;
		} else {
			jq(".textADD").append(\'<br />Hanya 4 upload fields yang diijinkan.\');
			document.product.add_more.disabled= true;
		}
		});
	});
	</script>
		<!-- End upload -->
	
	';
$template = admin_template($content,$titlebar,$titlepage,$user,$menu,$plugin);
echo $template;

}else {
    header( 'Location: logout.php' ) ;
}

?>