-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 02:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_karyawan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_absensi`
--

CREATE TABLE `tb_absensi` (
  `ID_Absensi` varchar(11) NOT NULL,
  `jam_masuk` time NOT NULL,
  `tanggal_kerja` date NOT NULL,
  `jam_istirahat` time NOT NULL,
  `ID_Pengajuan` varchar(11) NOT NULL,
  `ID_Pegawai` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gaji`
--

CREATE TABLE `tb_gaji` (
  `ID_Gaji` varchar(11) NOT NULL,
  `jumlah_gaji` int(9) NOT NULL,
  `total_gaji` int(9) NOT NULL,
  `Tanggal_gaji` date NOT NULL,
  `ID_Tunjangan` varchar(11) NOT NULL,
  `ID_Pegawai` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ijin`
--

CREATE TABLE `tb_ijin` (
  `ID_Ijin` varchar(11) NOT NULL,
  `alasan_ijin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `ID_pegawai` varchar(11) NOT NULL,
  `nama_pegawai` varchar(25) NOT NULL,
  `alamat_pegawai` varchar(25) NOT NULL,
  `nomor_handphone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pendidikan`
--

CREATE TABLE `tb_pendidikan` (
  `ID_Pendidikan` varchar(11) NOT NULL,
  `pendidikan_terakhir` varchar(20) NOT NULL,
  `asal_pendidikan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajuan`
--

CREATE TABLE `tb_pengajuan` (
  `ID_Pengajuan` varchar(11) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `tgl_mulaiizin` date NOT NULL,
  `tgl_selesaiizin` date NOT NULL,
  `ID_Ijin` varchar(11) NOT NULL,
  `ID_Pegawai` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengembangan`
--

CREATE TABLE `tb_pengembangan` (
  `ID_Pengembangan` varchar(11) NOT NULL,
  `nama_pengembangan` varchar(25) NOT NULL,
  `ID_Pendidikan` varchar(11) NOT NULL,
  `ID_Pegawai` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `ID_Pengguna` varchar(11) NOT NULL,
  `Password_pengguna` varchar(15) NOT NULL,
  `email_pengguna` varchar(30) NOT NULL,
  `ID_Pegawai` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tunjangan`
--

CREATE TABLE `tb_tunjangan` (
  `ID_Tunjangan` varchar(11) NOT NULL,
  `nama_tunjangan` varchar(25) NOT NULL,
  `nilai_tunjangan` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD PRIMARY KEY (`ID_Absensi`),
  ADD KEY `ID_Pengajuan` (`ID_Pengajuan`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indexes for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD PRIMARY KEY (`ID_Gaji`),
  ADD KEY `ID_Tunjangan` (`ID_Tunjangan`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indexes for table `tb_ijin`
--
ALTER TABLE `tb_ijin`
  ADD PRIMARY KEY (`ID_Ijin`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`ID_pegawai`);

--
-- Indexes for table `tb_pendidikan`
--
ALTER TABLE `tb_pendidikan`
  ADD PRIMARY KEY (`ID_Pendidikan`);

--
-- Indexes for table `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD PRIMARY KEY (`ID_Pengajuan`),
  ADD KEY `ID_Ijin` (`ID_Ijin`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indexes for table `tb_pengembangan`
--
ALTER TABLE `tb_pengembangan`
  ADD PRIMARY KEY (`ID_Pengembangan`),
  ADD KEY `ID_Pendidikan` (`ID_Pendidikan`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`ID_Pengguna`),
  ADD KEY `ID_Pegawai` (`ID_Pegawai`);

--
-- Indexes for table `tb_tunjangan`
--
ALTER TABLE `tb_tunjangan`
  ADD PRIMARY KEY (`ID_Tunjangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD CONSTRAINT `tb_absensi_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_absensi_ibfk_2` FOREIGN KEY (`ID_Pengajuan`) REFERENCES `tb_pengajuan` (`ID_Pengajuan`);

--
-- Constraints for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD CONSTRAINT `tb_gaji_ibfk_1` FOREIGN KEY (`ID_Tunjangan`) REFERENCES `tb_tunjangan` (`ID_Tunjangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_gaji_ibfk_2` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD CONSTRAINT `tb_pengajuan_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pengajuan_ibfk_2` FOREIGN KEY (`ID_Ijin`) REFERENCES `tb_ijin` (`ID_Ijin`);

--
-- Constraints for table `tb_pengembangan`
--
ALTER TABLE `tb_pengembangan`
  ADD CONSTRAINT `tb_pengembangan_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pengembangan_ibfk_2` FOREIGN KEY (`ID_Pendidikan`) REFERENCES `tb_pendidikan` (`ID_Pendidikan`);

--
-- Constraints for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD CONSTRAINT `tb_pengguna_ibfk_1` FOREIGN KEY (`ID_Pegawai`) REFERENCES `tb_pegawai` (`ID_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
