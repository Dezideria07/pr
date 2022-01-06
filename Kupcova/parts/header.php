<!DOCTYPE html>
<html lang="en">

<head>
    <title>Blog o cestovaní</title>
    <!--
    Conquer Template
    http://www.templatemo.com/tm-476-conquer
    -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<?php include_once "classes/DB.php";

use Classes\DB;
$db = new DB("localhost", "root", "", "projekt", "3306");
$menu = $db->getMenu();
?>

</html>