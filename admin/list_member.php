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
$titlebar ="List Member";
$titlepage="List Member";
$menu="";
$user=  ''.$loggedin['firstname'].' '.$loggedin['lastname'].'';


$simpan = isset($_POST["delete"]) ? $_POST["delete"] : '';
	if($simpan == "Delete"){
	    $id_member  = isset($_POST['id_member']) ? strip_tags(trim($_POST["id_member"])) : "";
		
	    
	    $querymember =  "UPDATE `member` SET `level` = '1' WHERE `member`.`id_member` = '$id_member';";
										
										
	    //echo $querymember ;
	mysql_query($querymember) or die("<script language='JavaScript'>
			alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");
	

	
	$queryuser =  "UPDATE `users` SET `blokir` = 'ya' WHERE `users`.`id_member` = '$id_member';";
										
										
	    //echo $query ;
	mysql_query($queryuser) or die("<script language='JavaScript'>
			alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");
			
	
	
	echo "<script language='JavaScript'>
			alert('Data telah disimpan!');
			location.href = 'list_member.php';
            </script>";
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
                <div class="card-title">List Member 
                </div>
                <div class="pull-right">
                  <div class="col-xs-12">
                    <a href="form_member.php" id="show-modal" class="btn btn-primary btn-cons" style="color:white"><i class="fa fa-plus"></i> Add Member
                    </a>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="card-block">
                <table class="table table-hover demo-table-dynamic table-responsive-block" id="tableWithDynamicRows">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th width="200px">Address</th>
                      <th>Email</th>
                      <th>Phone</th>
					  <th>Detail</th>
					  <th></th>
                    </tr>
                  </thead>
                  <tbody>';
				  $sql_member = mysql_query("SELECT `member`.*, `users`.`email` FROM `member`,`users` WHERE `users`.`id_member` = `member`.`id_member` AND  `member`.`level` = '0' ORDER BY `member`.`id_member` DESC LIMIT $start,$perhalaman  ;");
          $sql_total_data = mysql_num_rows(mysql_query("SELECT `member`.*, `users`.`email` FROM `member`,`users` WHERE `users`.`id_member` = `member`.`id_member` AND  `member`.`level` = '0' ORDER BY `member`.`id_member`;"));
				  while ($row_member = mysql_fetch_array($sql_member)){
				  $content .='<form action="" method="post" name="list_member">
                    <tr>
                      <td class="v-align-middle">
                        <p>'.$row_member["firstname"].' '.$row_member["lastname"].'</p>
						<input type="hidden" name="id_member" value="'.$row_member["id_member"].'">
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_member["alamat"].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_member["email"].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_member["notelp"].'</p>
                      </td>
					  <td class="v-align-middle">
                        <a href="detail_member.php?id='.$row_member['id_member'].'">view</a>
                      </td>
					  <td>
					  <div class="btn-group">
                          
                          <a href="form_member.php?id='.$row_member["id_member"].'" type="button" class="btn btn-success"><i class="fa fa-pencil"></i>
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

}else {
    header( 'Location: logout.php' ) ;
}

?>