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



require ('db_connect.php');
if(isset($_POST["users"])) {
    $username = $_POST["users"];
}
if(isset($_POST["pass"])) {
    $password = $_POST["pass"];
}
$sql = "CALL PR_getUser('".$username."','".$password."')";
$query = mysqli_query($conn,$sql);
$rowcount=mysqli_num_rows($query);
//while($row = mysqli_fetch_array($query)){
//$datauser=$row['username'];
//}
if($rowcount!=0){
    $data["statu"]='succress';
}else{
    $data["statu"]='nonsuccress';
}

echo json_encode($data);


?>