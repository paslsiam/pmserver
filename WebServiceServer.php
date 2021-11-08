<?php

require_once('lib/nusoap.php');

$server = new soap_server();
$server->configureWSDL('PmServer', 'urn:PmServer');
$server->wsdl->schemaTargetNamespace = 'urn:PmServer';
$server->wsdl->addComplexType(
    'Person',
    'complexType',
    'struct',
    'all',
    '',
    array('id_user' => array('name' => 'id_user',
        'type' => 'xsd:int'))
);

//########### Register
$server->register('getUserData',
    array('strUsername' => 'xsd:string','strPassword' => 'xsd:string'),   // parameter
    array('return' => 'xsd:string'),     // output
    'urn:PmServer',                        // namespace
    'urn:PmServer#GetUserData',            // soapaction
    'rpc',                               // style
    'encoded',                           // use
    'Get user information');                   // description

$server->register('createUser',
    array('strUsername' => 'xsd:string','strPassword' => 'xsd:string'),   // parameter
    array('return' => 'xsd:string'),     // output
    'urn:PmServer',                        // namespace
    'urn:PmServer#CreateUser',            // soapaction
    'rpc',                               // style
    'encoded',                           // use
    'Create user data');                   // description

function getUserData($username,$password) {
    require ('db_connect.php');
    $sql = "CALL PR_getUser('".$username."','".$password."')";
    $query = mysqli_query($conn,$sql);
    $rowcount=mysqli_num_rows($query);
    if($rowcount!=0){
        $data['status']='succress';
    }else{
        $data['status']='nosuccress';
    }
    return json_encode($data);
    //preview : {"status":"nosuccress"} from return json_encode($data) ;
}

function createUser($username,$password) {
    require ('db_connect.php');
    $sql = "CALL PR_createUser('".$username."','".$password."')";
    $query = mysqli_query($conn,$sql);
    $rowcount=mysqli_num_rows($query);
    if($rowcount!=0){
        $data['status']='succress';
    }else{
        $data['status']='nosuccress';
    }
    return json_encode($data);
    //preview : {"status":"nosuccress"} from return json_encode($data) ;
}
$HTTP_RAW_POST_DATA = isset($HTTP_RAW_POST_DATA)
    ? $HTTP_RAW_POST_DATA : '';
@$server->service(file_get_contents("php://input"));
?>