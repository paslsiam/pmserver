<?php
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: POST, GET, DELETE, PUT, PATCH, OPTIONS');
    header('Access-Control-Allow-Headers: token, Content-Type');
    header('Access-Control-Max-Age: 1728000');
    header('Content-Length: 0');
    header('Content-Type: text/plain');
    die();
}

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
include("lib/nusoap.php");
$wsdl = "http://pascerthai.online/WebServiceServer.php?wsdl";
$client = new nusoap_client($wsdl, 'wsdl');


if($_POST["callService"]=='getUserData'){
    $params = array(
        'strUsername' => $_POST["users"],
        'strPassword' => $_POST["pass"],
    );
    echo json_encode($client->call($_POST["callService"], $params));
}

if($_POST["callService"]=='createUser'){
    $params = array(
        'strUsername' => $_POST["users"],
        'strPassword' => $_POST["pass"],
    );
    echo json_encode($client->call($_POST["callService"], $params));
}