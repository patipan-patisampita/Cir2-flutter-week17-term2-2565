<?php 
// $hostname = "localhost";
// $username = "root";
// $password = "12345678";
// $database = "project_api";
//$con = mysqli_connect("$hostname", "$username", "$password", "$database");

$con = mysqli_connect("localhost","root","12345678","project_api");
mysqli_set_charset($con,'utf8');

if(!$con){
    print("Not connected");
}
?>