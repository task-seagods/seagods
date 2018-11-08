<?php

use PayPal\Api\Payer;
use PayPal\Api\Details;
use PayPal\Api\Amount;
use PayPal\Api\Transaction;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;

require 'config/configuration.php';
require 'config/configuration_paypal.php';

$loggedin = logged_in();

global $conn;
global $api;

$payer = new Payer();
$details = new Details();
$amount = new Amount();
$transaction = new Transaction();
$payment = new Payment();
$redirectURL = new RedirectUrls();

// Payer
$payer->setPaymentMethod('paypal');

// Details
$details->setShipping('2.00')
    ->setTax('0.00')
    ->setSubtotal('20.00');

// Amount
$amount->setCurrency('GBP')
    ->setTotal('22.00')
    ->setDetails($details);

// Transaction
$transaction->setAmount($amount)
    ->setDescription('Membership');

// Payment
$payment->setIntent('sale')
    ->setPayer($payer)
    ->setTransactions([$transaction]);

// Redirect URLs
$redirectURL->setReturnUrl('http://localhost/seagods/member/testing_payment_list.php?approval=true')
    ->setCancelUrl('http://localhost/seagods/member/testing_payment_list.php?approval=false');

$payment->setRedirectUrls($redirectURL);

try {

    $payment->create($api);

    $hash = md5($payment->getId());
    $_SESSION['paypal_hash'] = $hash;

    $store = mysql_query("INSERT INTO `transaction` (`id_transaction`, `kode_transaction`, `id_member`, `status`, `konfirm`, `total`, `date_add`, `date_upd`)
        VALUES(NULL, '$hash', '".$loggedin["id_member"]."', '', '', '', NOW(), NOW());", $conn) or die("<script>
            alert('gagal insert ke database');
        </script>");

} catch (\PayPal\Exception\PayPalConnectionException $exception) {
    header('location: paypal-error.php');
}

foreach ($payment->getLinks() as $link) {
    if ($link->getRel() == 'approval_url') {
        $redirectURL = $link->getHref();
    }
}

header('location: ' . $redirectURL);

dd($payment->getLinks());