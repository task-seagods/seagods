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
    $titlebar = "Add Sub Category";
    $titlepage = "Add Sub Category";
    $menu = "";
    $user = '' . $loggedin['firstname'] . ' ' . $loggedin['lastname'] . '';

    $simpan = isset($_POST["save"]) ? $_POST["save"] : '';
    $update = isset($_POST["update"]) ? $_POST["update"] : '';

    if ($simpan == "Save") {
        $category = isset($_POST['category']) ? strip_tags(trim($_POST["category"])) : "";
        $id_parent = isset($_POST['id_parent']) ? strip_tags(trim($_POST["id_parent"])) : "";

        $querycategory = "INSERT INTO `category` (`id_cat`, `id_parent`, `category`, `level`) 
										VALUES (NULL, '$id_parent', '$category', '0');";


        //echo $query ;
        mysql_query($querycategory, $conn) or die("<script language='JavaScript'>
			alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
			window.history.go(-1);
            </script>");

        echo "<script language='JavaScript'>
			alert('Data telah disimpan!');
			location.href = 'list_sub_categories.php';
            </script>";
    }

    if ($update == "Update") {
        $category = isset($_POST['category']) ? strip_tags(trim($_POST["category"])) : "";
        $id_parent = isset($_POST['id_parent']) ? strip_tags(trim($_POST["id_parent"])) : "";
        $id_catte = isset($_POST['id_cate']) ? strip_tags(trim($_POST["id_cate"])) : "";

        $querycategory = "UPDATE `category` SET `id_parent` = '$id_parent', `category` = '$category' WHERE `id_cat` = '$id_catte';";

        //echo $querycategory ;
        mysql_query($querycategory, $conn) or die("<script language='JavaScript'>
                alert('Maaf Data tidak bisa diupdate ke dalam Database, Ada kesalahan!');
                window.history.go(-1);
            </script>");

        echo "<script language='JavaScript'>
			alert('Data telah diupdate!');
			location.href = 'list_sub_categories.php';
        </script>";
    }

    if (isset($_GET["id"])) {

        $id_cat = isset($_GET['id']) ? strip_tags(trim($_GET['id'])) : "";
        $query = "SELECT * FROM `category` WHERE `category`.`id_cat` = '$id_cat' AND `level` = '0' ORDER BY `category`.`id_cat` DESC  ;";
        $id = mysql_query($query, $conn);
        $data_cat = mysql_fetch_array($id);

    }
    $content = '
        <div class=" container    container-fixed-lg">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-default">
                        <div class="card-header ">
                            <div class="card-title">
                                ADD NEW SUB CATEGORY
                            </div>
                        </div>
                        <div class="card-block">
                            <form class="" method="post" role="form">
                                <div class="form-group form-group-default required ">
                                    <label>Category Name</label>
                                    <input type="text" name="category" class="form-control" value="' . (isset($_GET['id']) ? strip_tags(trim($data_cat["category"])) : "") . '" required>
                                    <input type="hidden" name="id_cate" class="form-control" value="' . (isset($_GET['id']) ? $_GET['id'] : "") . '" >
                                </div>
                                
					            <div class="form-group form-group-default form-group-default-select2 required">
                                    <label class="">Select Category</label>
                                    <select class="full-width" data-placeholder="Select Country" name="id_parent" data-init-plugin="select2">
						                <optgroup label="Select One">';

    $sql_caregory = mysql_query("SELECT * FROM `category` WHERE `id_parent` = '0' AND `level` = '0';");

    while ($row_category = mysql_fetch_array($sql_caregory)) {
        $content .= '<option value="' . $row_category["id_cat"] . '" ' . (isset($_GET['id']) && $data_cat["id_parent"] == $row_category["id_cat"] ? "selected" : "") . '>' . $row_category["category"] . '</option>';
    }

    $content .= '
                                        </optgroup>
                                    </select>
                                </div>
					            <button class="btn btn-primary" name="' . (isset($_GET['id']) ? "update" : "save") . '" value="' . (isset($_GET['id']) ? "Update" : "Save") . '" type="submit">' . (isset($_GET['id']) ? "Update Sub Category" : "Create New Sub Category") . '</button>
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