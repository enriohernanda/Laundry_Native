<?php
$host_koneksi = "localhost";
$username_koneksi = "root";
$password_koneksi = "";
$database_name = "db_laundry_enrio";

$config = mysqli_connect($host_koneksi, $username_koneksi, $password_koneksi, $database_name);

// if(!$config){
//     echo "koneksi gagal!";
// }

if(!$config) echo "koneksi gagal!";

?>