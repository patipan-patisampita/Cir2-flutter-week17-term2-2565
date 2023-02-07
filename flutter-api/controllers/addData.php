<?php error_reporting(0); ?>
<?php include_once('../config/dbcon.php'); ?>

<?php
$username = $_POST['username'];
$password = $_POST['password'];
$name = $_POST['name'];
$address = $_POST['address'];

if($photo == ""){
    $photo = "nopic.png";
}

$sql = "INSERT INTO users (username, password, name, photo, address) 
    VALUES ('$username', '$password', '$name', '$photo', '$address' ";
$result = mysqli_query($con,$sql);

if($result){
    echo json_encode("done");
}
?>