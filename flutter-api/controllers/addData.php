<?php error_reporting(0); ?>
<?php include_once('../config/dbcon.php'); ?>

<?php
$username = $_POST['username'];
$password = $_POST['password'];
$name = $_POST['name'];
$address = $_POST['address'];
$photo = $_POST['photo'];

if ($photo == "") {
    $photo = "nopic.png";
}
if(empty($username)|| empty($password)|| empty($name) || empty($address)){
    echo json_encode("null");
}
else
{
    $sql = "INSERT INTO users(username,password,name,photo,address)
        VALUES('$username','$password','$name','$photo','$address')";
    $result = mysqli_query($con, $sql);

    if ($result) {
        echo json_encode("done");
    }

}

?>