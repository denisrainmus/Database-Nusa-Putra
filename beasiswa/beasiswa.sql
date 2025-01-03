-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2022 at 07:33 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `beasiswa`
--

CREATE TABLE `beasiswa` (
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beasiswa`
--

INSERT INTO `beasiswa` (`kd_beasiswa`, `nama`) VALUES
(5, 'Beasiswa Akademik'),
(6, 'Beasiswa non Akademik');

-- --------------------------------------------------------

--
-- Table structure for table `bobot_kriteria`
--

CREATE TABLE `bobot_kriteria` (
  `kd_bobot_kriteria` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `bobot` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bobot_kriteria`
--

INSERT INTO `bobot_kriteria` (`kd_bobot_kriteria`, `kd_beasiswa`, `kd_kriteria`, `bobot`) VALUES
(25, 5, 17, '76');

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `kd_hasil` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nis` char(9) NOT NULL,
  `nilai` float DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`kd_hasil`, `kd_beasiswa`, `nis`, `nilai`, `tahun`) VALUES
(13, 5, '125610036', 0.925, '2017'),
(14, 5, '125610080', 0.65, '2017'),
(15, 5, '125610076', 0.55, '2017'),
(20, 5, '125610098', 0.9, '2017'),
(21, 5, '125610036', 0.925, '2017'),
(22, 5, '125610098', 0.9, '2017'),
(23, 5, '125610080', 0.65, '2017'),
(24, 5, '125610076', 0.55, '2017'),
(25, 5, '125610036', 0.925, '2017'),
(26, 5, '125610098', 0.9, '2017'),
(27, 5, '125610080', 0.65, '2017'),
(28, 5, '125610076', 0.55, '2017'),
(29, 5, '125610036', 0.925, '2022'),
(30, 5, '123456', 76, '2022'),
(31, 6, '123456', 0, '2022');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `kd_kriteria` int(11) NOT NULL,
  `kd_beasiswa` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sifat` enum('min','max') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`kd_kriteria`, `kd_beasiswa`, `nama`, `sifat`) VALUES
(17, 5, 'Nilai', 'max'),
(18, 6, 'Nilai', 'min');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kd_nilai` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `nis` char(9) NOT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kd_nilai`, `kd_beasiswa`, `kd_kriteria`, `nis`, `nilai`) VALUES
(84, 5, 17, '123456', 76),
(85, 6, 18, '123456', 0),
(86, 5, 17, '159426846', 76);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `kd_pengguna` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varbinary(256) NOT NULL,
  `status` enum('petugas','puket','mahasiswa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`kd_pengguna`, `username`, `password`, `status`) VALUES
(1, 'petugas', 0x1494b7e424a2db910ef66bf88ece4d34, 'petugas'),
(2, 'puket', 0x215afb755745d7976c9e005a146b1191, 'puket'),
(3, 'admin', 0x0d141e960579050ec4e1327784d2cd07, '');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` char(9) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tahun_mengajukan` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `alamat`, `jenis_kelamin`, `tahun_mengajukan`) VALUES
('123456', 'caesar', 'semarang', 'Laki-laki', '2022'),
('125610036', 'Sakti', 'Jogja', 'Laki-laki', '2022'),
('125610076', 'Heni Nurhidayati', 'palembang', 'Perempuan', '2017'),
('125610080', 'Nur Afifah Safitri', 'Medan', 'Perempuan', '2017'),
('125610098', 'Tri Septa Kurnia', 'Kalimantan', 'Perempuan', '2017'),
('159426846', 'Felix Christian Denis Rainmus', 'Semarang', 'Laki-laki', '2022');

-- --------------------------------------------------------

--
-- Table structure for table `sub_kriteria`
--

CREATE TABLE `sub_kriteria` (
  `kd_sub_kriteria` int(11) NOT NULL,
  `kd_beasiswa` int(11) DEFAULT NULL,
  `kd_kriteria` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `bobot` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_kriteria`
--

INSERT INTO `sub_kriteria` (`kd_sub_kriteria`, `kd_beasiswa`, `kd_kriteria`, `keterangan`, `bobot`) VALUES
(109, 5, 17, 'Nilai Raport Genap 2', 76);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beasiswa`
--
ALTER TABLE `beasiswa`
  ADD PRIMARY KEY (`kd_beasiswa`);

--
-- Indexes for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD PRIMARY KEY (`kd_bobot_kriteria`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`kd_hasil`),
  ADD KEY `fk_mahasiswa` (`nis`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`kd_kriteria`),
  ADD KEY `kd_beasiswa` (`kd_beasiswa`),
  ADD KEY `kd_beasiswa_2` (`kd_beasiswa`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kd_nilai`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_mahasiswa` (`nis`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`kd_pengguna`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD PRIMARY KEY (`kd_sub_kriteria`),
  ADD KEY `fk_kriteria` (`kd_kriteria`),
  ADD KEY `fk_beasiswa` (`kd_beasiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beasiswa`
--
ALTER TABLE `beasiswa`
  MODIFY `kd_beasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  MODIFY `kd_bobot_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
  MODIFY `kd_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `kd_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `kd_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `kd_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  MODIFY `kd_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `fk_beasiswa` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`kd_kriteria`) REFERENCES `kriteria` (`kd_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_kriteria_ibfk_2` FOREIGN KEY (`kd_beasiswa`) REFERENCES `beasiswa` (`kd_beasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
