<?php
$koneksi = new mysqli('localhost', 'root','', 'wilzz')
or die(mysqli_error($koneksi));


if (isset($_POST['simpan'])){
    $idPasien=$_POST['idPasien'];
    $nmPasien=$_POST['nmPasien'];
    $jk=$_POST['jk'];
    $alamat=$_POST['alamat'];
    $koneksi->query("INSERT INTO pasien (idPasien, nmPasien, jk, alamat) values ('$idPasien', '$nmPasien', '$jk', '$alamat')");

    header('location:pasien.php');
}

if (isset($_GET['idPasien'])){
    $idPasien=$_GET['idPasien'];
    $koneksi->query("DELETE FROM pasien where idPasien = '$idPasien'");
    
    header('location:pasien.php');
}

if (isset($_POST['edit'])){
    $idPasien=$_POST['idPasien'];
    $nmPasien=$_POST['nmPasien'];
    $jk=$_POST['jk'];
    $alamat=$_POST['alamat'];
    $koneksi->query("UPDATE pasien SET idPasien='$idPasien',nmPasien='$nmPasien',jk='$jk',alamat='$alamat'");

    header('location:pasien.php');
}
//koneksi user

if (isset($_POST['simpanuser'])){
    $id=$_POST['id'];
    $username=$_POST['username'];
    $password=$_POST['password'];
    $level=$_POST['level'];
    $koneksi->query("INSERT INTO user (id, username, password, level) values ('$id', '$username', '$password', '$level')");

    header('location:user.php');
}

if (isset($_GET['id'])){
    $id=$_GET['id'];
    $koneksi->query("DELETE FROM user where id = '$id'");
    
    header('location:user.php');
}

if (isset($_POST['edituser'])){
    $id=$_POST['id'];
    $username=$_POST['username'];
    $password=$_POST['password'];
    $level=$_POST['level'];
    $koneksi->query("UPDATE user SET id='$id',username='$username',password='$password',level='$level'");

    header('location:user.php');
}
?>