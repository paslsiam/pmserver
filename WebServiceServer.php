<?php
// Pull in the NuSOAP code
require_once('lib/nusoap.php');

// Create the server instance
$server = new soap_server();
$server->configureWSDL('PmServer', 'urn:PmServer');
$server->wsdl->schemaTargetNamespace = 'urn:PmServer';
// SOAP complex type return type (an array/struct)
$server->wsdl->addComplexType(
    'Person',
    'complexType',
    'struct',
    'all',
    '',
    array('id_user' => array('name' => 'id_user',
        'type' => 'xsd:int'))
);

// Register the "hello" method to expose it
$server->register('getUserData',
    array('strUsername' => 'xsd:string','strPassword' => 'xsd:string'),   // parameter
    array('return' => 'xsd:string'),     // output
    'urn:server',                        // namespace
    'urn:server#helloServer',            // soapaction
    'rpc',                               // style
    'encoded',                           // use
    'Just say hello');                   // description

// Implement the "getUserData" method as a PHP function
function getUserData($username,$password) {
    require ('db_connect.php');
    $sql = "CALL PR_getUser('".$username."','".$password."')";
    $query = mysqli_query($conn,$sql);
    $rowcount=mysqli_num_rows($query);
    if($rowcount!=0){
        $data["statu"]='succress';
    }else{
        $data["statu"]='nonsuccress';
    }
    return json_encode($data);
}

// Use the request to invoke the service
$HTTP_RAW_POST_DATA = isset($HTTP_RAW_POST_DATA)
    ? $HTTP_RAW_POST_DATA : '';
@$server->service(file_get_contents("php://input"));
?>