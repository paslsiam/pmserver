<html>
<head>
    <title>ThaiCreate.Com</title>
</head>
<body>

<form name="frmMain" method="post" action="">
    <h2>Search Customer</h2>

    <input type="text" name="txtUsername" value="<?php echo $_POST["txtUsername"];?>" placeholder="username">
    <input type="password" name="txtpassword" value="<?php echo $_POST["txtpassword"];?>" placeholder="password">
    <input type="submit" name="Submit" value="Submit">
</form>

<?php
if($_POST["txtUsername"] != "")
{
include("lib/nusoap.php");
// Create client object
$wsdl = "http://pascerthai.online/WebServiceServer.php?wsdl";
$client = new nusoap_client($wsdl, 'wsdl');
$err = $client->getError();
if ($err) {
    // Display the error
    echo '<h2>Constructor error</h2>' . $err;
    // At this point, you know the call that follows will fail
    exit();
}
$params = array(
    'strUsername' => $_POST["txtUsername"],
    'strPassword' => $_POST["txtpassword"],
);
$data = $client->call('getUserData', $params);

//echo '<pre>';
//var_dump($data);
//echo '</pre><hr />';
print_r($data);
exit;
if(count($data) == 0)
{
    echo "Not found data!";
}
else
{
?>
<table width="500" border="1">
    <tr>
        <td>CustomerID</td>
        <td>Name</td>
        <td>Email</td>
        <td>CountryCode</td>
        <td>Budget</td>
        <td>Used</td>
    </tr>
    <?php


    foreach ($data as $result) {
        ?>
        <tr>
            <td><?php echo $result["username"];?></td>
            <td><?php echo $result["Name"];?></td>
            <td><?php echo $result["Email"];?></td>
            <td><?php echo $result["CountryCode"];?></td>
            <td><?php echo $result["Budget"];?></td>
            <td><?php echo $result["Used"];?></td>
        </tr>
        <?php
    }
    }

    }
    ?>
</body>
</html>