<?php error_reporting(0); ?>

<?php include_once('../config/dbcon.php'); ?>

<?php
$sql = "SELECT * FROM users";
$result = mysqli_query($con, $sql);
$data = array();

while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}
echo json_encode($data);

// echo "<pre>";
// print_r($data);
// echo "</pre>";

?>