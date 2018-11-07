<?php
include("config/configuration.php");
session_start();
ob_start();
if($loggedin = logged_in()){
  if(isset($_POST['nilai'])){
      $_SESSION['nilai_login'] = $_POST['nilai']+1;
  }else{
      $_SESSION['nilai_login'] = 0;
  }

  $user=  ''.$_SESSION['user'].'';
}

if (isset($GLOBALS["HTTP_RAW_POST_DATA"]))
{
  // Get the data
  $imageData=$GLOBALS['HTTP_RAW_POST_DATA'];
 
  // Remove the headers (data:,) part.
  // A real application should use them according to needs such as to check image type
  $filteredData=substr($imageData, strpos($imageData, ",")+1);
 
  // Need to decode before saving since the data we received is already base64 encoded
  $unencodedData=base64_decode($filteredData);
 
  $random_digit = md5(uniqid(mt_rand(),true));
  $img  = "Custom".$random_digit.".png";

  //echo "unencodedData".$unencodedData;
 
  // Save file. This example uses a hard coded filename for testing,
  // but a real application can specify filename in POST variable
  $fp = fopen( $img, 'wb' );
  fwrite( $fp, $unencodedData);
  fclose( $fp );

  
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

  


  $input = mysql_query("insert into custom_cart values(NULL,'".randomString()."', '".$loggedin["id_member"]."', '','','','' ,'$img')");

  $input2 = mysql_query("insert into custom_measure values(NULL,'".randomString()."', '".$loggedin["id_member"]."' ,'','','','','','','','','','',
                                                      '','','','','','','','','','',
                                                      '','','','','','','','','','',
                                                      '','','','','')");
  
}
?>