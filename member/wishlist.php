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

if($loggedin = logged_in()){
  if(isset($_POST['nilai'])){
      $_SESSION['nilai_login'] = $_POST['nilai']+1;
  }else{
      $_SESSION['nilai_login'] = 0;
  }

  $titlebar ="Wishlist";
  $titlepage="Wishlist";

  $menu="";
  $user=  ''.$_SESSION['user'].'';
  
  $sql_wishlist = mysql_query("SELECT * FROM `wishlist` where `id_member` ='".$loggedin["id_member"]."'");

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
                <div class="card-title">Wishlist
            
                </div>
                <div class="pull-right">
                  
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="card-block">
                <table class="table table-hover demo-table-dynamic table-responsive-block" >
                  <thead>
                    <tr>
                      <th >Product Name</th>
                      <th style="width:15%">Price</th>
					  
                    </tr>
                  </thead>
                  <tbody>';
                  while($row_wishlist = mysql_fetch_array($sql_wishlist)){

                        $content .='
                    <tr>
                      <td class="v-align-middle">
                        <p>'.$row_wishlist['title'].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>$'.$row_wishlist['price'].'</p>
                      </td>
					  
						
                    </tr>';
                        }

                      $content .='
					
                  </tbody>
                </table>
              </div>
            </div>
            <!-- END card -->
          </div>


		  </div></div></div>
		  
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

}else{
 header('location:../login.php');     
}

?>