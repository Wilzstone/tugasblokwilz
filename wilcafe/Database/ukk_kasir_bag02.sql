-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 06:50 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_kasir_bag02`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis_menu`
--

CREATE TABLE `tbl_jenis_menu` (
  `id_jenis_menu` int(11) NOT NULL,
  `jenis_menu` varchar(200) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jenis_menu`
--

INSERT INTO `tbl_jenis_menu` (`id_jenis_menu`, `jenis_menu`, `id_pegawai`) VALUES
(40, 'Makanan', 1),
(41, 'Minuman', 1),
(42, 'Paket Hemat 1', 1);

--
-- Triggers `tbl_jenis_menu`
--
DELIMITER $$
CREATE TRIGGER `tJenisMenuDelete` BEFORE DELETE ON `tbl_jenis_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - Menghapus nama pegawai : ', old.jenis_menu ));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuTambah` AFTER INSERT ON `tbl_jenis_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - menanbah jenis menu : ', new.jenis_menu));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuUpdate` BEFORE UPDATE ON `tbl_jenis_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Jenis menu - mengubah jenis menu : ', old.jenis_menu, ' menjadi ', new.jenis_menu));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id_log` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aksi` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id_login` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id_login`, `id_pegawai`, `username`, `password`, `id_admin`) VALUES
(93, 1, 'manajer', '69b731ea8f289cf16a192ce78a37b4f0', 2),
(94, 2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2),
(113, 18, 'kasir', 'c7911af3adbd12a035b289556d96470a', 2),
(114, 17, 'kasir1', '29c748d4d8f4bd5cbc0f3f60cb7ed3d0', 2);

--
-- Triggers `tbl_login`
--
DELIMITER $$
CREATE TRIGGER `tLoginHapus` BEFORE DELETE ON `tbl_login` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Login : menghapus username ', old.username));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginTambah` AFTER INSERT ON `tbl_login` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_admin, nm_peg, jbt, CONCAT('Login : menambahkan username : ', new.username));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginUpdate` BEFORE UPDATE ON `tbl_login` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_admin, nm_peg, jbt, CONCAT('Login : merubah username : ', old.username, ' menjadi ', new.username));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `id_jenis_menu` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `img` varchar(150) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `id_jenis_menu`, `harga`, `img`, `id_pegawai`) VALUES
(46, 'Nasi Liwet', 40, 25000, '27042022183918nasi liwet2-min.jpg', 1),
(47, 'Telor Dadar', 40, 3500, '27042022184012telur dadar1-min.jpg', 1),
(48, 'Es Jeruk', 41, 10000, '27042022184031es jeruk-min.jpg', 1),
(49, 'Es Campur', 41, 15000, '27042022184055Es-Campur1-min.jpg', 1),
(50, 'Tahu + Tempe ', 42, 3000, '27042022184131tahu-tempe1-min.jpg', 1);

--
-- Triggers `tbl_menu`
--
DELIMITER $$
CREATE TRIGGER `tMenuDelete` BEFORE DELETE ON `tbl_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - Menghapus nama menu : ', old.nama_menu ));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuTambah` AFTER INSERT ON `tbl_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 DECLARE jm VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;
 SELECT jenis_menu INTO jm FROM tbl_jenis_menu WHERE id_jenis_menu = new.id_jenis_menu;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - menanbah nama menu : ', new.nama_menu, ', jenis menu : ', jm, ' dan harga : Rp. ', new.harga));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuUpdate` BEFORE UPDATE ON `tbl_menu` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 DECLARE jm VARCHAR(100);
 DECLARE jm1 VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_pegawai;
 SELECT jenis_menu INTO jm FROM tbl_jenis_menu WHERE id_jenis_menu = new.id_jenis_menu;
  SELECT jenis_menu INTO jm1 FROM tbl_jenis_menu WHERE id_jenis_menu = old.id_jenis_menu;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Nama menu - mengubah nama menu : ', old.nama_menu, ' menjadi ', new.nama_menu, ', jenis menu : ', jm1, ' menjadi ', jm, ' dan harga dari Rp. ', old.harga, ' menjadi Rp. ', new.harga));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(100) NOT NULL,
  `jabatan` enum('Kasir','Manajer','Admin') NOT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id_pegawai`, `nama_pegawai`, `jenis_kelamin`, `alamat`, `telp`, `jabatan`, `photo`, `id_admin`) VALUES
(1, 'Manager Baru', 'Perempuan', 'Jl. Jakarta', '081', 'Manajer', NULL, 1),
(2, 'Administrator', 'Laki-laki', 'Jl. Subang', '081', 'Admin', NULL, 1),
(17, 'Siswa', 'Perempuan', 'Jl. Banda No. 1', '081', 'Kasir', '', 1),
(18, 'Edi Kribo', 'Laki-laki', 'Jl. Sunda No. 1', '081234', 'Kasir', '', 1);

--
-- Triggers `tbl_pegawai`
--
DELIMITER $$
CREATE TRIGGER `tPegawaiHapus` BEFORE DELETE ON `tbl_pegawai` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - Menghapus nama pegawai : ', old.nama_pegawai ));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiTambah` AFTER INSERT ON `tbl_pegawai` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - menanbah nama pegawai : ', new.nama_pegawai, ' dan jabatan sebagai ', new.jabatan));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiUpdate` BEFORE UPDATE ON `tbl_pegawai` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = old.id_admin;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, nm_peg, jbt, CONCAT('Pegawai - Mengubah nama pegawai : ', old.nama_pegawai, ' menjadi ', new.nama_pegawai, ', jenis kelamin : ', old.jenis_kelamin, ' menjadi ', new.jenis_kelamin,', alamat : ', old.alamat, ' menjadi ', new.alamat, ', telp : ', old.telp, ' menjadi ', new.telp ));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `id_detail` int(11) NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `tbl_transaksi_detail`
--
DELIMITER $$
CREATE TRIGGER `tTransaksiTambah` AFTER INSERT ON `tbl_transaksi_detail` FOR EACH ROW BEGIN
 DECLARE nm_peg VARCHAR(100);
 DECLARE jbt VARCHAR(100);
 DECLARE nmMenu VARCHAR(100);
 SELECT nama_pegawai, jabatan INTO nm_peg, jbt FROM tbl_pegawai WHERE id_pegawai = new.id_pegawai;
 SELECT nama_menu INTO nmMenu FROM tbl_menu WHERE id_menu = new.id_menu;
 INSERT INTO tbl_log(id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, nm_peg, jbt, CONCAT('Transaksi detail - menjual ', nmMenu, ' sebanyak ', new.qty, ' dengan harga Rp. ', new.harga));
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  ADD PRIMARY KEY (`id_jenis_menu`),
  ADD UNIQUE KEY `jenis_menu` (`jenis_menu`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_jenis_menu_2` (`id_jenis_menu`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `no_transaksi` (`no_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  MODIFY `id_jenis_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=648;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD CONSTRAINT `tbl_transaksi_detail_ibfk_2` FOREIGN KEY (`no_transaksi`) REFERENCES `tbl_transaksi` (`no_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
