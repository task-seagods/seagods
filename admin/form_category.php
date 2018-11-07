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
    $titlebar = "Add Category";
    $titlepage = "Add Category";
    $menu = "";
    $user = '' . $loggedin['firstname'] . ' ' . $loggedin['lastname'] . '';

    $simpan = isset($_POST["simpan"]) ? $_POST["simpan"] : '';
    $update = isset($_POST["update"]) ? $_POST["update"] : '';

    if ($simpan == "Simpan") {
        $category = isset($_POST['category']) ? strip_tags(trim($_POST["category"])) : "";

        $querycat = "INSERT INTO `category` (`id_cat`, `id_parent`, `category`, `level`) 
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

    if ($update == "Update") {
        $idCategory = isset($_POST['idCategory']) ? strip_tags(trim($_POST["idCategory"])) : "";
        $category = isset($_POST['category']) ? strip_tags(trim($_POST["category"])) : "";

        $sqlCategoryUpdate = "UPDATE `category` SET `category` = '$category' WHERE `id_cat` = '$idCategory'";
        mysql_query($sqlCategoryUpdate, $conn) or die("<script language='JavaScript'>
			alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");

        echo "<script language='JavaScript'>
			alert('Data telah diupdate!');
			location.href = 'list_categories.php';
            </script>";
    }

    if (isset($_GET['id'])) {
        $idCategory = $_GET['id'];
        $queryCategory = mysql_query("SELECT * FROM `category` WHERE `id_cat` = '$idCategory' LIMIT 0,1;", $conn);
        $rowCategory = mysql_fetch_array($queryCategory);
    }

    $content = '
        <div class="container container-fixed-lg">
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
                                <input type="hidden" name="idCategory" value="' . (isset($_GET['id']) ? $rowCategory["id_cat"] : "") . '">
                                <div class="form-group form-group-default required ">
                                    <label>Category Name</label>
                                    <input type="text" class="form-control" required name="category" value="' . (isset($_GET['id']) ? $rowCategory["category"] : "") . '">
                                </div>
                                <button class="btn btn-primary" name="' . (isset($_GET['id']) ? "update" : "simpan") . '" value="' . (isset($_GET['id']) ? "Update" : "Simpan") . '" type="submit">' . (isset($_GET['id']) ? "Update Category" : "Create a New Category") . '</button>
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