<?php
header('Content-Type: application/json; charset=utf-8');
ini_set('display_errors', 1);
error_reporting(~0);

$serverName = "localhost";
$userName = "pascerth_pmserver";
$userPassword = "vb319183";
$dbName = "pascerth_pmserver";
$conn = mysqli_connect($serverName,$userName,$userPassword,$dbName);


?>