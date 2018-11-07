<?php
/*
 * Project Name: SeaGods
 * Project URI: http://seagodswetsuit.com
 * Author: GlobalXtreme.net
 * Version: 1.0  | 1 Februari 2018
 * Email: adit@globalxtreme.net
 */
include ("config/configuration.php");
session_start();
ob_start();

if($loggedin = logged_inadmin()){ // Check if they are logged in


if(isset($_POST['nilai'])){
    $_SESSION['nilai_login'] = $_POST['nilai']+1;
}else{
    $_SESSION['nilai_login'] = 0;
}


$loggedin = logged_inadmin();
$titlebar ="Add Category";
$titlepage="Add Category";
$menu="";
$user=  ''.$loggedin['firstname'].' '.$loggedin['lastname'].'';

$simpan = isset($_POST["simpan"]) ? $_POST["simpan"] : '';
	if($simpan == "Simpan"){
	    $category  = isset($_POST['category']) ? strip_tags(trim($_POST["category"])) : "";

	    
	    $querycat =  "INSERT INTO `category` (`id_cat`, `id_parent`, `category`, `level`) 
		VALUES (NULL, '0', '$category', '0');";
										
										
	    //echo $query ;
	mysql_query($querycat) or die("<script language='JavaScript'>
			alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");
										
				echo "<script language='JavaScript'>
			alert('Data telah disimpan!');
			location.href = 'list_categories.php';
            </script>";
	}


$content = '
 <div class=" container    container-fixed-lg">
<div class="row">
              <div class="col-lg-12">
   <div class="card card-default">
                  <div class="card-header ">
                    <div class="card-title">
                      ADD NEW CATEGORY
                    </div>
                  </div>
                  <div class="card-block">
                    <form class="" action="form_category.php" method="post" role="form">
                      <div class="form-group form-group-default required ">
                        <label>Category Name</label>
                        <input type="text" class="form-control" required name="category">
                      </div>
					
					   
					  
					  
					  
					  <button class="btn btn-primary" name="simpan" value="Simpan" type="submit">Create New Category</button>
					
					
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
	    <!-- BEGIN PAGE LEVEL JS -->
    <script src="assets/js/datatables.js" type="text/javascript"></script>
    <script src="assets/js/scripts.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL JS -->
	
	
	
	';
$template = admin_template($content,$titlebar,$titlepage,$user,$menu,$plugin);
echo $template;

}else {
    header( 'Location: logout.php' ) ;
}

?>