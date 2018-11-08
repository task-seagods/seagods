<?php

require "config/configuration_paypal.php";

if (isset($_GET['approved'])) {
    $approved = $_GET['approved'] === 'true';
    if ($approved) {

        $payerID = $_GET['payerID'];

        // Get payment_id from database
//        $paymentId =

    } else {
        header('location: paypal_canceled.php');
    }
}
?>