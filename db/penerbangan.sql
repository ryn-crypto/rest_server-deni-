-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jan 2023 pada 15.30
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penerbangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'deni123', 1, 0, 0, NULL, 1),
(2, 2, 'rahasia', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:penumpang/index:get', 2, 1673692200, 'deni123'),
(2, 'uri:penumpang/index:get', 4, 1673692300, 'rahasia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbangan`
--

CREATE TABLE `penerbangan` (
  `id_penerbangan` int(11) NOT NULL,
  `id_penumpang` int(11) DEFAULT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `nomor_penerbangan` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `penerbangan`
--

INSERT INTO `penerbangan` (`id_penerbangan`, `id_penumpang`, `tujuan`, `nomor_penerbangan`, `tanggal`) VALUES
(1, 13, 'Pakistan', 'ESSU', '2022-04-06'),
(2, 6, 'Peru', 'RJAM', '2022-05-02'),
(3, 16, 'China', 'SSCL', '2022-05-24'),
(4, 2, 'Sweden', 'FEFW', '2022-04-26'),
(5, 1, 'Indonesia', 'WAPP', '2022-08-17'),
(6, 4, 'Kazakhstan', 'CZWL', '2022-03-18'),
(7, 6, 'Macedonia', 'CYGN', '2022-08-24'),
(8, 11, 'Russia', 'YCOD', '2022-02-21'),
(9, 15, 'Marshall Islands', 'SSMF', '2022-07-14'),
(10, 1, 'Ukraine', 'SVKA', '2022-04-14'),
(11, 4, 'Germany', 'UGSB', '2022-12-08'),
(12, 3, 'Colombia', 'CAM3', '2022-03-02'),
(13, 1, 'Madagascar', 'MUHG', '2022-04-07'),
(14, 20, 'Sweden', 'FSPP', '2022-08-11'),
(15, 5, 'China', 'KUNV', '2022-05-28'),
(16, 20, 'China', 'DFOO', '2022-03-20'),
(17, 19, 'France', 'SSSD', '2022-11-16'),
(18, 3, 'United States', 'HEGR', '2022-08-08'),
(19, 2, 'Russia', 'LSGS', '2022-07-30'),
(20, 15, 'United States', 'FEGF', '2022-03-06'),
(21, 15, 'Philippines', 'KAXA', '2022-11-14'),
(22, 10, 'Portugal', 'KMTJ', '2022-09-09'),
(23, 10, 'Thailand', 'BGUQ', '2022-09-17'),
(24, 11, 'Philippines', 'YKML', '2022-09-04'),
(25, 18, 'Thailand', 'SYKA', '2022-11-22'),
(26, 17, 'China', 'EFKE', '2022-01-06'),
(27, 6, 'Myanmar', 'SBPS', '2022-04-12'),
(28, 16, 'China', 'DFOO', '2022-11-05'),
(29, 1, 'Indonesia', 'SKFU', '2022-01-15'),
(30, 4, 'Japan', 'FACT', '2022-10-02'),
(31, 20, 'Indonesia', 'VTCC', '2022-12-12'),
(32, 20, 'Colombia', 'VGSH', '2022-03-11'),
(33, 8, 'Russia', 'YBUD', '2022-03-02'),
(34, 16, 'Ireland', 'AYPC', '2022-06-10'),
(35, 6, 'China', 'OABT', '2022-04-16'),
(36, 15, 'France', 'KSUS', '2022-07-13'),
(37, 2, 'Indonesia', 'UHWK', '2022-04-07'),
(38, 14, 'China', 'DNAK', '2022-07-10'),
(39, 18, 'Mexico', 'ZYDD', '2022-04-09'),
(40, 4, 'South Africa', 'PACR', '2022-04-18'),
(41, 9, 'China', 'FVCH', '2022-04-12'),
(42, 19, 'Indonesia', 'PANA', '2022-04-14'),
(43, 9, 'Dominican Republic', 'THXY', '2022-08-07'),
(44, 19, 'Indonesia', 'RPUV', '2022-06-10'),
(45, 2, 'Brazil', 'KTXK', '2022-01-20'),
(46, 12, 'Portugal', 'CYXE', '2022-01-14'),
(47, 9, 'Mexico', 'KSLK', '2022-03-22'),
(48, 10, 'Philippines', 'VI32', '2022-08-02'),
(49, 11, 'Russia', 'KRKW', '2022-12-13'),
(50, 7, 'Yemen', 'KSPS', '2022-05-27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penumpang`
--

CREATE TABLE `penumpang` (
  `id_penumpang` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `negara` varchar(255) DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `penumpang`
--

INSERT INTO `penumpang` (`id_penumpang`, `nama`, `negara`, `passport`) VALUES
(1, 'Leone', 'Portugal', '6334481577176567107'),
(2, 'Corena', 'Lithuania', '633434028073731478'),
(3, 'Silvie', 'Brazil', '6767054583036449377'),
(4, 'Glori', 'Armenia', '6334795300252581'),
(5, 'Martina', 'Central African Republic', '676767724009126777'),
(6, 'Susanetta', 'Portugal', '6334313870800050'),
(7, 'Dewain', 'Philippines', '676788008351662422'),
(8, 'Kiersten', 'China', '676779020600782381'),
(9, 'Ally', 'Indonesia', '6767181817879618953'),
(10, 'Ashlan', 'Greece', '6334441034899534'),
(11, 'Rock', 'Russia', '6334844824194903670'),
(12, 'Thom', 'Philippines', '676784393541493035'),
(13, 'Maurise', 'Nigeria', '6767613316738665303'),
(14, 'Stephie', 'Sweden', '6767174498962847'),
(15, 'Meriel', 'Indonesia', '633428541392027087'),
(16, 'Dixie', 'Tunisia', '6334882293337351770'),
(17, 'Reagan', 'China', '6334784815165915422'),
(18, 'Ulberto', 'United States', '633421234884489190'),
(19, 'Clifford', 'China', '6767997713672642684'),
(20, 'Etta', 'Canada', '6334103796600548');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penerbangan`
--
ALTER TABLE `penerbangan`
  ADD PRIMARY KEY (`id_penerbangan`) USING BTREE;

--
-- Indeks untuk tabel `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`id_penumpang`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penerbangan`
--
ALTER TABLE `penerbangan`
  MODIFY `id_penerbangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `penumpang`
--
ALTER TABLE `penumpang`
  MODIFY `id_penumpang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
