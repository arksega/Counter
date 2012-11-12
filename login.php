<?php
include "pg.php";

if(isset($_POST["user"]) && isset($_POST["pass"])){
    //echo "POST" . var_dump($_POST) . "<br/>";
    $user = pg_escape_string($_POST["user"]);
    $pass = pg_escape_string($_POST["pass"]);
    $pass = sha1($pass);
}else{
    die("Sin datos");
}
//Performing SQL query
$query = "SELECT * FROM users WHERE name = '$user' and pass = '$pass'; ";
$result = pg_query($query) or die('Query failed: ' . pg_last_error());
if($arr = pg_fetch_array($result, NULL, PGSQL_ASSOC)){
    $loged = true;
    session_start();
    $_SESSION['user'] = $arr['name'];
}
else{
    $loged = false;
}
echo json_encode(array("loged"=>$loged));
