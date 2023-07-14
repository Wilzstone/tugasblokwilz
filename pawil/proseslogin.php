<?php
// Lakukan validasi pada username dan password yang diterima dari form login
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Lakukan validasi tambahan seperti verifikasi database, enkripsi password, dan sebagainya
    // Contoh sederhana untuk validasi username dan password
    if ($username === 'admin' && $password === 'admin123') {
        // Jika login berhasil, atur session dan arahkan pengguna ke halaman selanjutnya
        session_start();
        $_SESSION['username'] = $username;
        header('Location: admin/pasien.php');
        exit();
    } else if ($username === 'user' && $password === 'user123') {
        session_start();
        $_SESSION['username'] = $username;
        header('Location: admin/userpage.php');
        exit();
    }
} else {
    // Jika username atau password tidak diterima, arahkan pengguna kembali ke halaman login dengan pesan kesalahan
    header('Location: login.php?error=2');
    exit();
}
?>