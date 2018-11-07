<?php
/*
 * Project Name: SeaGods
 * Project URI: http://seagodswetsuit.com
 * Author: GlobalXtreme.net
 * Version: 1.0  | 1 Februari 2018
 * Email: adit@globalxtreme.net
 */
include("config/configuration.php");
session_start();
ob_start();

if ($loggedin = logged_inadmin()) { // Check if they are logged in

    global $conn;

    if (isset($_POST['nilai'])) {
        $_SESSION['nilai_login'] = $_POST['nilai'] + 1;
    } else {
        $_SESSION['nilai_login'] = 0;
    }

    $loggedin = logged_inadmin();
    $titlebar = "Detail Member";
    $titlepage = "Detail member";
    $menu = "";
    $user = '' . $loggedin['firstname'] . ' ' . $loggedin['lastname'] . '';

    if (isset($_GET["id"])) {

        $id_member = isset($_GET['id']) ? strip_tags(trim($_GET['id'])) : "";
        $query = "SELECT `member`.*, `users`.* FROM `member`,`users` WHERE `users`.`id_member` = `member`.`id_member` AND  `member`.`level` = '0' AND `member`.`id_member` = '$id_member' ORDER BY `member`.`id_member` DESC  ;";
        $id = mysql_query($query);
        $data_member = mysql_fetch_array($id);

    }

    $content = '
        <div class="container container-fixed-lg">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-default">
                        <div class="card-header ">
                            <div class="card-title">
                                <h4><b>DETAIL MEMBER <u>' . (isset($_GET['id']) ? $data_member["firstname"] . " " . $data_member["lastname"] : "") . '</u></b></h4>
                            </div>
                                <a href="list_member.php" class="btn btn-default pull-right" name="">Back to List</a>
                        </div>
                    </div>
                    
                    <div class="card card-default">
                        <div class="card-block">
                            <form class="" action="form_member.php" method="post"  enctype="multipart/form-data" role="form">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h5>Firs Name :</h5>
                                        <h5><b>' . (isset($_GET['id']) ? $data_member["firstname"] : "") . '</b></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>Last Name :</h5>
                                        <h5><b>' . (isset($_GET['id']) ? $data_member["lastname"] : "") . '</b></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>No Telephone :</h5>
                                        <h5><b>' . (isset($_GET['id']) ? $data_member["notelp"] : "") . '</b></h5>
                                    </div>
                                </div><br>
                                
                                <div class="row">
                                    <div class="col-md-4">
                                        <h5>Username :</h5>
                                        <h5><b>' . (isset($_GET['id']) ? $data_member["username"] : "") . '</b></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>E-mail :</h5>
                                        <h5><b>' . (isset($_GET['id']) ? $data_member["email"] : "") . '</b></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>Postal Code :</h5>
                                        <h5><b>' . (isset($_GET['id']) ? $data_member["kode_pos"] : "") . '</b></h5>
                                    </div>
                                </div><br>
                                
                                <div class="row">
                                    <div class="col-md-4">
                                        <h5>Address :</h5>
                                        <h5><b>' . (isset($_GET['id']) ? $data_member["alamat"] : "") . '</b></h5>
                                    </div>
                                    <div class="col-md-8">
                                        <h5>Photo :</h5>
                                        ' . (isset($_GET['id']) ?
                                            (file_exists('images/members/' . $data_member['foto']) ?
                                                '<img src="images/members/' . $data_member["foto"] . '"/>' : "<h5><b>Image does not exists</b></h5>") : "") . '
                                    </div>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>';

    $plugin = '';

    $template = admin_template($content, $titlebar, $titlepage, $user, $menu, $plugin);

    echo $template;
} else {
    header('Location: logout.php');
}

?>