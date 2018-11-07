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

if(isset($_POST['nilai'])){
    $_SESSION['nilai_login'] = $_POST['nilai']+1;
}else{
    $_SESSION['nilai_login'] = 0;
}

if($loggedin = logged_inadmin()){ // Check if they are logged in

 $perhalaman = 10;

  if (isset($_GET['page'])){
    $page = (int)$_GET['page'];
    $start=($page - 1) * $perhalaman;
  }else{
    $start=0;
  }


//$loggedin = logged_inadmin();
$titlebar ="List Transaction";
$titlepage="List Transaction";
$menu="";
$user=  ''.$loggedin['firstname'].' '.$loggedin['lastname'].'';

$sql_transaction = mysql_query("SELECT * FROM `transaction`  ORDER BY `date_add` DESC LIMIT $start,$perhalaman");
$sql_total_data = mysql_num_rows(mysql_query("SELECT * FROM `transaction`  ORDER BY `date_add`"));
$row_transaction = mysql_fetch_array($sql_transaction);

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
                <div class="card-title">List Transaction 
                </div>
                <div class="pull-right">
                  
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="card-block">
                <table class="table table-hover demo-table-dynamic table-responsive-block" >
                  <thead>
                    <tr>
					<th style="width:20%">INVOICE</th>
                      <th style="width:10%">DATE</th>
                      <th style="width:10%">TOTAL</th>
                      <th style="width:15%">STATUS</th>
					  <th style="width:5%">Detail</th>
					  <th style="width:20%"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
					<td class="v-align-middle">
                        '.$row_transaction['kode_transaction'].'
                      </td>

                      <td class="v-align-middle">
                        <p>'.$row_transaction['date_add'].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_transaction['total'].'</p>
                      </td>
                      <td class="v-align-middle">
                        <p>'.$row_transaction['status'].'</p>
                      </td>
					  <td class="v-align-middle">
                        <a href="detail_transaction.php?id_transaction='.$row_transaction['id_transaction'].'">view</a>
                      </td>
					  <td>
					  <div class="btn-group">
                          <button type="button" class="btn btn-success"><i class="fa fa-save"></i>
                          </button>
                          <button type="button" class="btn btn-success"><i class="fa fa-pencil"></i>
                          </button>
                          <button type="button" class="btn btn-success"><i class="fa fa-trash-o"></i>
                          </button>
                        </div>
						</td>
						
                    </tr>
                    
                    
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