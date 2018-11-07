<?php
//db details
$dbHost = 'localhost';
$dbUsername = 'allabout_sea';
$dbPassword = 'backupweb';
$dbName = 'allabout_sea';

//Connect and select the database
$db = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
}
?>