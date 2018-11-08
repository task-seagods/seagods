<?php

use PayPal\Api\Payer;
use PayPal\Api\Details;
use PayPal\Api\Amount;
use PayPal\Api\Transaction;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;

require 'config/configuration_paypal.php';

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
    ->setTransactions($transaction);

// Redirect URLs
$redirectURL->setReturnUrl('http://localhost/seagods/member/testing_payment_list.php?approval=true')
    ->setCancelUrl('http://localhost/seagods/member/testing_payment_list.php?approval=false');

$payment->setRedirectUrls($redirectURL);

try {
} catch (\PayPal\Exception\PayPalConnectionException $exception) {
    header('location: paypal-error.php');
}