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

 $perhalaman = 10;

  if (isset($_GET['page'])){
    $page = (int)$_GET['page'];
    $start=($page - 1) * $perhalaman;
  }else{
    $start=0;
  }

$loggedin = logged_inadmin();
$titlebar ="List Products";
$titlepage="List Products";
$menu="";
$user=  ''.$loggedin['firstname'].' '.$loggedin['lastname'].'';


$simpan = isset($_POST["delete"]) ? $_POST["delete"] : '';
	if($simpan == "Delete"){
	    $id_item  = isset($_POST['id_item']) ? strip_tags(trim($_POST["id_item"])) : "";
		
	    
	    $queryitem =  "UPDATE `item` SET `level` = '1' WHERE `item`.`id_item` = '$id_item';";
										
										
	    //echo $querycategory ;
	mysql_query($queryitem) or die("<script language='JavaScript'>
			alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");
	
	echo "<script language='JavaScript'>
			alert('Data telah disimpan!');
			location.href = 'list_products.php';
            </script>";
	}

  if(isset($_GET['id'])){
  
      $id_item      = isset($_GET['id']) ? strip_tags(trim($_GET['id'])) : "";
      $query        = "SELECT `item`.* FROM `item` WHERE `item`.`level` = '0' AND `item`.`id_item` = '$id_item'  ORDER BY `item`.`id_item` DESC ;";
      $id           = mysql_query($query);
      $data_item    = mysql_fetch_array($id);
  }
	
$content = '

    <div class="page-container ">
      <!-- START PAGE CONTENT WRAPPER -->
      <div class="page-content-wrapper ">
        <!-- START PAGE CONTENT -->
        <div class="content ">
		


<div class=" container    container-fixed-lg">
            <!-- START card -->
            <div class="card card-transparent">
              <div class="card-header ">
                <div class="card-title">List Products
                </div>
                <div class="pull-right">
				<div class="col-xs-12">
                    <a href="form_products.php" id="show-modal" class="btn btn-primary btn-cons" style="color:white"><i class="fa fa-plus"></i> Add Products
                    </a>
					
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="card-block">
                <table class="table table-hover demo-table-dynamic table-responsive-block" >
				
				<thead>
                    <tr>
					<th style="width:5%"></th>
                      <th style="width:20%">Product Name</th>
                      <th style="width:15%">Categories</th>
                      <th style="width:15%">Sub </th>
                      <th style="width:15%">Price</th>
					  <th style="width:5%">Detail</th>
					  <th style="width:20%"></th>
                    </tr>
                  </thead>
                  <tbody>';
				  $sql_item = mysql_query("SELECT `item`.*, `category`.`category` FROM `item`,`category` WHERE `item`.`id_cat` = `category`.`id_cat` AND `item`.`level` = '0' ORDER BY `id_item` DESC LIMIT $start,$perhalaman  ;");
          $sql_total_data = mysql_num_rows(mysql_query("SELECT `item`.*, `category`.`category` FROM `item`,`category` WHERE `item`.`id_cat` = `category`.`id_cat` AND `item`.`level` = '0' ORDER BY `id_item`;"));
				  while ($row_item = mysql_fetch_array($sql_item)){
					$row_category = mysql_fetch_array(mysql_query("SELECT * FROM `category` WHERE `id_cat` = '".$row_item["id_cat"]."'"));
          $row_photo    = mysql_fetch_array(mysql_query("SELECT * FROM `photo` WHERE `id_item` = '".$row_item["id_item"]."' ORDER BY `id_item` "));
				  $content .='
				  <form action="" method="post" name="list_category">
                    <tr>
					<td class="v-align-middle">
                        <img src="images/product/150/thumb_'.$row_photo['photo'].'" width="30px">
						<input type="hidden" name="id_item" value="'.$row_item["id_item"].'">
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_item["title"].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_category["category"].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_item["category"].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>$'.$row_item["price"].'</p>
                      </td>
					  <td class="v-align-middle">
                        
                        <button type="button" data-toggle="modal" data-target="#view-modal" data-id="'.$row_item['id_item'].'" id="getUser" class="btn btn-sm btn-info"><i class="glyphicon glyphicon-eye-open"></i> View</button>
                      </td>
					  <td>
					  <div class="btn-group">
                          <a href="form_products.php?id='.$row_item["id_item"].'" type="button" class="btn btn-success"><i class="fa fa-pencil"></i>
                          </a>
                          <button type="submit" class="btn btn-success" name="delete" value="Delete"><i class="fa fa-trash-o"></i>
                          </button>
                        </div>
						</td>
						
                    </tr></form>';
					
				
				  }
				  
				  $content .='
                    
                    
                  </tbody>
                </table>
                '.(halaman($sql_total_data, $perhalaman, 1, '?')).'

               <div id="view-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        
                        <h4 class="modal-title">Detail Products</h4><br>
                      </div>
                      <div class="modal-body">

                         <div id="dynamic-content">

                            <div class="form-group form-group-default  ">
                                <label>Product Name</label>
                                <span id="title"></span>
                            </div>

                            <div class="form-group form-group-default  ">
                                <label>Category</label>
                                
                            </div>

                            <div class="form-group form-group-default  ">
                                <label>Price</label>
                                <span id="price"></span>
                            </div>

                            <div class="form-group form-group-default  ">
                                <label>Detail</label>
                                <span id="detail"></span>
                            </div>

                            <div class="form-group form-group-default  ">
                                <label>Description</label>
                                <span id="description"></span>
                            </div>

                         </div>
                        
                      </div>

                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                    </div>

                  </div>
                </div>


              </div>
            </div>
            <!-- END card -->
          </div>


		  </div></div></div>
		  
';

$plugin ='     
    <script>
$(document).ready(function(){
  
  $(document).on("click", "#getUser", function(e){
    
    e.preventDefault();
    
    var uid = $(this).data("id"); // get id of clicked row
    
    $("#dynamic-content").hide(); // hide dive for loader
    $("#modal-loader").show();  // load ajax loader
    
    $.ajax({
      url: "view.php",
      type: "POST",
      data: "id="+uid,
      dataType: "json"
    })
    .done(function(data){
      console.log(data);
      $("#dynamic-content").hide(); // hide dynamic div
      $("#dynamic-content").show(); // show dynamic div
      $("#title").html(data.title);
      $("#price").html(data.price);
      $("#detail").html(data.detail);
      $("#description").html(data.description);
      $("#modal-loader").hide();    // hide ajax loader
    })
    .fail(function(){
      $(".modal-body").html("<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...");
    });
    
  });
  
});

</script>
    <script src="assets/plugins/switchery/js/switchery.min.js" type="text/javascript"></script>
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