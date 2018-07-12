-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 12, 2018 at 07:05 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_ranata`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_coa`
--

CREATE TABLE `acc_coa` (
  `id` bigint(20) NOT NULL,
  `kd_aktiva` varchar(5) DEFAULT NULL,
  `coa` varchar(7) NOT NULL,
  `jns_trans` varchar(50) NOT NULL,
  `akun` enum('Aktiva','Pasiva') DEFAULT NULL,
  `laba_rugi` enum('','PENDAPATAN','BIAYA') NOT NULL DEFAULT '',
  `neraca` enum('Y','N') DEFAULT NULL,
  `pemasukan` enum('Y','N') DEFAULT NULL,
  `pengeluaran` enum('Y','N') DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `saldo_awal` double NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_coa`
--

INSERT INTO `acc_coa` (`id`, `kd_aktiva`, `coa`, `jns_trans`, `akun`, `laba_rugi`, `neraca`, `pemasukan`, `pengeluaran`, `aktif`, `saldo_awal`, `deleted`) VALUES
(5, 'A4', '100.202', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(6, 'A5', '100.203', 'Pinjaman Pembiayaan', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(7, 'A6', '100.201', 'Pinjaman', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(8, 'A7', '100.204', 'Pinjaman Investasi', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(9, 'A8', '100.301', 'Persediaan Barang', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0),
(10, 'A9', '100.401', 'Biaya Dibayar Dimuka', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0),
(11, 'A10', '', 'Perlengkapan Usaha', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0),
(17, 'C', '', 'Aktiva Tetap Berwujud', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(18, 'C1', '', 'Peralatan Kantor', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0),
(21, 'C2', '', 'Aktiva Tetap Lainnya', 'Aktiva', '', 'Y', 'Y', 'N', 'Y', 0, 0),
(26, 'E', '', 'Modal Pribadi', 'Aktiva', '', 'Y', NULL, NULL, 'N', 0, 0),
(27, 'E1', '', 'Prive', 'Aktiva', '', 'Y', 'Y', 'Y', 'N', 0, 0),
(28, 'F', '', 'Utang', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(29, 'F1', '200.102', 'Utang Usaha', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(31, 'K3', '', 'Pengeluaran Lainnya', 'Aktiva', '', 'Y', 'N', 'Y', 'N', 0, 0),
(32, 'F4', '200.103', 'Simpanan Sukarela', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(33, 'F5', '200.103', 'Utang Pajak', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(36, 'H', '', 'Utang Jangka Panjang', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(37, 'H1', '', 'Utang Bank', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(38, 'H2', '', 'Obligasi', 'Pasiva', '', 'Y', 'Y', 'Y', 'N', 0, 0),
(39, 'I', '', 'Modal', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(40, 'I1', '300.101', 'Simpanan Pokok', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(41, 'I2', '200.108', 'Simpanan Wajib', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(42, 'I3', '', 'Modal Awal', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(43, 'I4', '', 'Modal Penyertaan', 'Pasiva', '', 'Y', 'Y', 'Y', 'N', 0, 0),
(44, 'I5', '300.105', 'Modal Sumbangan', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(45, 'I6', '300.106', 'Modal Cadangan', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(47, 'J', '400.101', 'Pendapatan Blanko', 'Pasiva', 'PENDAPATAN', 'Y', 'N', 'N', 'Y', 0, 0),
(48, 'J1', '', 'Pembayaran Angsuran', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0),
(49, 'J2', '400.199', 'Pendapatan Lainnya', 'Pasiva', 'PENDAPATAN', 'Y', 'Y', 'N', 'Y', 0, 0),
(50, 'K', '500.100', 'Beban', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0),
(52, 'K2', '500.101', 'Beban Gaji Karyawan', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0),
(53, 'K3', '500.102', 'Biaya Listrik dan Air', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0),
(54, 'K4', '500.103', 'Biaya Transportasi', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0),
(60, 'K10', '500.199', 'Biaya Lainnya', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0),
(110, 'TRF', '', 'Transfer Antar Kas', NULL, '', 'Y', NULL, NULL, 'N', 0, 0),
(111, 'A11', '', 'Permisalan', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(112, 'F6', '200.109', 'Hutang Suspend', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(113, 'J3', '400.103', 'Pendapatan Pembiayaan', 'Pasiva', 'PENDAPATAN', 'Y', 'N', 'N', 'Y', 0, 0),
(114, 'K5', '500.104', 'Biaya Admin Bank', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0),
(115, 'K6', '500.105', 'Biaya Perizinan', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0),
(116, 'A4', '100.202', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0),
(117, 'A4', '100.202', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acc_coa_type`
--

CREATE TABLE `acc_coa_type` (
  `id` int(11) NOT NULL,
  `account_number` varchar(11) DEFAULT NULL COMMENT 'Nomor Akun',
  `account_name` varchar(100) DEFAULT NULL COMMENT 'Nama Akun',
  `parent` varchar(50) DEFAULT NULL COMMENT 'Tipe Akun',
  `normally` varchar(50) DEFAULT NULL COMMENT 'Saldo Normal',
  `account_type` varchar(50) DEFAULT NULL COMMENT 'Jenis Akun',
  `reporting` varchar(100) DEFAULT NULL COMMENT 'Jenis Laporan',
  `akun` varchar(20) NOT NULL,
  `parental` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc_coa_type`
--

INSERT INTO `acc_coa_type` (`id`, `account_number`, `account_name`, `parent`, `normally`, `account_type`, `reporting`, `akun`, `parental`, `deleted`) VALUES
(1, '100.000', 'KAS DAN BANK', 'Head', 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 0, 0),
(2, '140.000', 'HUTANG BIAYA', 'Head', 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 0, 0),
(3, '140.001', 'Hutang Beban Gaji', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 2, 0),
(4, '100.004', 'Bank Central Asia (IDR)-5170505001', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(5, '100.005', 'Bank Mandiri (IDR)-1300010012857', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(6, '100.006', 'Bank Mandiri (IDR)-1300011823930', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(7, '100.007', 'Bank Mandiri (USD)-1300011823948', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(8, '100.008', 'Bank Mandiri (USD)-1300009554422', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(9, '100.009', 'Bank Jabar Banten-0005427592001', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(10, '100.010', 'Deposito BPR Arthaguna Mandiri', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(11, '120.000', 'PIUTANG USAHA', 'Head', 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 0, 0),
(12, '120.001', 'Piutang Usaha (IDR)', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 11, 0),
(13, '120.002', 'Piutang Usaha (USD)', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 11, 0),
(14, '170.000', 'UANG MUKA PEMBELIAN', 'Head', 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 0, 0),
(15, '170.001', 'Uang Muka Pembelian', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 14, 0),
(16, '180.101', 'PERSEDIAAN BARANG', 'Head', 'Debet', 'Aktiva', 'Neraca', 'pengeluaran', 0, 0),
(17, '180.102', 'Persediaan Barang (Deposit Tiket)', NULL, 'Debet', 'Aktiva', 'Neraca', 'pengeluaran', 16, 0),
(18, '500.000', 'BIAYA DIBAYAR DIMUKA', 'Head', 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 0, 0),
(19, '500.001', 'Sewa dibayar dimuka', NULL, 'Debet', 'Aktiva', 'Neraca', 'pengeluaran', 18, 0),
(20, '600.000', 'AKTIVA TETAP', 'Head', 'Debet', 'Aktiva', 'Neraca', 'pengeluaran', 0, 0),
(21, '600.001', 'Gedung', NULL, 'Debet', 'Aktiva', 'Neraca', 'pengeluaran', 20, 0),
(22, '600.002', 'Peralatan Kantor', NULL, 'Debet', 'Aktiva', 'Neraca', 'pengeluaran', 20, 0),
(23, '700.000', 'AKUMULASI PENYUSUTAN', 'Head', 'Kredit', 'Aktiva', 'Neraca', 'pengeluaran', 0, 0),
(24, '700.001', 'Akumulasi Penyusutan Bangunan', NULL, 'Kredit', 'Aktiva', 'Neraca', 'pemasukan', 23, 0),
(25, '800.000', 'PIUTANG LAIN-LAIN', 'Head', 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 0, 0),
(26, '900.000', 'HUTANG USAHA', 'Head', 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 0, 0),
(27, '900.001', 'Hutang Usaha (IDR)', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 26, 0),
(28, '130.000', 'UANG MUKA PENJUALAN', 'Head', 'Kredit', 'Passiva', 'Neraca', 'pemasukan', 0, 0),
(29, '130.001', 'Uang Muka Penjualan (IDR)', NULL, 'Kredit', 'Passiva', 'Neraca', 'pemasukan', 28, 0),
(30, '140.002', 'Hutang Beban Listrik dan Air', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 2, 0),
(31, '140.003', 'Hutang Beban Telpon dan Fax', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 2, 0),
(32, '150.000', 'HUTANG JANGKA PANJANG', 'Head', 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 0, 0),
(33, '150.001', 'Hutang Bank (IDR)', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 32, 0),
(34, '150.002', 'Hutang Leasing (IDR)', NULL, 'Kredit', 'Passiva', 'Neraca', 'pemasukan', 32, 0),
(35, '160.000', 'HUTANG LAIN-LAIN', 'Head', 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 0, 0),
(37, '160.001', 'Hutang Kepada Pemegang Saham', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 35, 0),
(38, '200.000', 'MODAL', 'Head', 'Kredit', 'Passiva', 'Neraca', 'pemasukan', 0, 0),
(39, '200.001', 'Modal Saham', NULL, 'Kredit', 'Passiva', 'Neraca', 'pemasukan', 38, 0),
(40, '200.002', 'Deviden', NULL, 'Kredit', 'Passiva', 'Neraca', 'pemasukan', 38, 0),
(42, '200.003', 'Laba Ditahan', NULL, 'Kredit', 'Passiva', 'Neraca', 'pemasukan', 38, 0),
(43, '300.100', 'PENDAPATAN', 'Head', 'Kredit', 'Income', 'Laba Rugi', 'pemasukan', 0, 0),
(44, '300.101', 'Penjualan Barang', NULL, 'Kredit', 'Income', 'Laba Rugi', 'pemasukan', 43, 0),
(45, '300.200', 'Pendapatan Jasa', NULL, 'Kredit', 'Income', 'Laba Rugi', 'pemasukan', 43, 0),
(46, '400.000', 'HARGA POKOK PENJUALAN', 'Head', 'Debet', 'Cost Of Good Sold', 'Laba Rugi', 'pengeluaran', 0, 0),
(47, '400.001', 'Harga Pokok Penjualan (HPP)', NULL, 'Debet', 'Cost Of Good Sold', 'Laba Rugi', 'pengeluaran', 46, 0),
(48, '400.002', 'Biaya Angkut Pembelian', NULL, 'Debet', 'Cost Of Good Sold', 'Laba Rugi', 'pengeluaran', 46, 0),
(50, '600.100', 'BEBAN USAHA', 'Head', 'Debet', 'Expenses', 'Laba Rugi', 'pengeluaran', 0, 0),
(51, '600.101', 'Beban Gaji Karyawan', NULL, 'Debet', 'Expenses', 'Laba Rugi', 'pengeluaran', 50, 0),
(52, '600.102', 'Beban Listrik dan Air', NULL, 'Debet', 'Expenses', 'Laba Rugi', 'pengeluaran', 50, 0),
(53, '700.100', 'PENDAPATAN NON OPERASIONAL', 'Head', 'Kredit', 'Other Income', 'Laba Rugi', 'pemasukan', 0, 0),
(54, '600.003', 'Kendaraan', NULL, 'Debet', 'Aktiva', 'Neraca', 'pengeluaran', 20, 0),
(55, '800.100', 'BEBAN NON OPERASIONAL', 'Head', 'Debet', 'Other Expenses', 'Laba Rugi', 'pengeluaran', 0, 0),
(56, '800.101', 'Biaya Administrasi Bank', NULL, 'Debet', 'Other Expenses', 'Laba Rugi', 'pengeluaran', 55, 0),
(64, '700.101', 'Pendapatan Bunga Bank ( Jasa Giro )', NULL, 'Kredit', 'Other Income', 'Laba Rugi', 'pemasukan', 53, 0),
(65, '100.011', 'Bank BRI', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(66, '100.001', 'Kas (IDR)', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(67, '100.002', 'Kas (USD)', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(68, '100.003', 'Bank Central Asia (IDR)-5170505001', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 1, 0),
(69, '700.002', 'Akumulasi Penyusutan Peralatan Kantor', NULL, 'Kredit', 'Aktiva', 'Neraca', 'pemasukan', 23, 0),
(70, '700.003', 'Akumulasi Penyusutan Kendaraan', NULL, 'Kredit', 'Aktiva', 'Neraca', 'pemasukan', 23, 0),
(71, '800.001', 'Piutang Pemegang Saham (IDR)', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 25, 0),
(72, '900.002', 'Hutang Usaha (USD)', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 26, 0),
(73, '600.103', 'Beban Telepon dan Air', NULL, 'Debet', 'Expenses', 'Laba Rugi', 'pengeluaran', 50, 0),
(74, '700.102', 'Pendapatan Lain-lain', NULL, 'Kredit', 'Other Income', 'Laba Rugi', 'pemasukan', 53, 0),
(75, '800.102', 'Beban Lain-lain', NULL, 'Debet', 'Other Expenses', 'Laba Rugi', 'pengeluaran', 55, 0),
(76, '800.002', 'Piutang Lain-lain', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 25, 0),
(77, '180.103', 'Deposit Jaminan', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 16, 0),
(78, '160.002', 'Hutang Lain-lain', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 35, 0),
(79, '600.104', 'Beban Penyusutan Gedung', NULL, 'Debet', 'Expenses', 'Laba Rugi', 'pengeluaran', 50, 0),
(80, '600.105', 'Beban Penyusutan Peralatan Kantor', NULL, 'Debet', 'Expenses', 'Laba Rugi', 'pengeluaran', 50, 0),
(81, '600.106', 'Beban Penyusutan Kendaraan', NULL, 'Debet', 'Expenses', 'Laba Rugi', 'pengeluaran', 50, 0),
(82, '800004', 'Bala', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 55, 1),
(83, '300.102', 'Tiket Domestik', NULL, 'Kredit', 'Income', 'Laba Rugi', 'pemasukan', 44, 1),
(84, '80002', 'Beban Hidup', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 75, 1),
(85, '80002', 'BEBAN HIDUP', NULL, 'Debet', 'Aktiva', 'Neraca', 'pemasukan', 75, 1),
(88, '300.102', 'Online Ticketing', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 43, 0),
(89, '300.103', 'Ticket Pesawat (Domestik)', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 88, 0),
(90, '300.104', 'Ticket pesawat (International)', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 88, 0),
(91, '300.106', 'Tour Package', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 43, 0),
(92, '300.107', 'Tour & Travel ke Jepang', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 91, 0),
(93, '300.109', 'Hotel Reservation', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 43, 0),
(94, '300.110', 'Voucher Hotel (Domestik)', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 93, 0),
(95, '160.003', 'PPH Keluaran', NULL, 'Kredit', 'Passiva', 'Neraca', 'pengeluaran', 35, 0),
(96, '300.111', 'Voucher Hotel (International)', NULL, 'Debet', 'Aktiva', 'Laba Rugi', 'pemasukan', 93, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acc_general_ledger`
--

CREATE TABLE `acc_general_ledger` (
  `id` int(11) NOT NULL,
  `code_voucher` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(250) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `debit` double NOT NULL,
  `credit` double NOT NULL,
  `value` double NOT NULL,
  `status` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc_general_ledger`
--

INSERT INTO `acc_general_ledger` (`id`, `code_voucher`, `date`, `description`, `account_number`, `account_name`, `debit`, `credit`, `value`, `status`, `deleted`) VALUES
(1, 'R00180521223007', '2018-05-21', 'dssdgsdg', '', '', 0, 0, 0, 1, 1),
(3, 'R00180521223142', '2018-05-21', 'ini deskripsi', '', '', 0, 0, 0, 1, 0),
(4, 'R00180510105035', '2018-05-09', 'ini deskripsi', '8', '100.204 Pinjaman Investasi', 10250000, 0, 10250000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acc_nama_kas_tbl`
--

CREATE TABLE `acc_nama_kas_tbl` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(225) CHARACTER SET latin1 NOT NULL,
  `aktif` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_simpan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_penarikan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pinjaman` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_bayar` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pemasukan` enum('Y','T') NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') NOT NULL,
  `tmpl_transfer` enum('Y','T') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_nama_kas_tbl`
--

INSERT INTO `acc_nama_kas_tbl` (`id`, `nama`, `aktif`, `tmpl_simpan`, `tmpl_penarikan`, `tmpl_pinjaman`, `tmpl_bayar`, `tmpl_pemasukan`, `tmpl_pengeluaran`, `tmpl_transfer`) VALUES
(1, 'Kas Tunai', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'Kas Besar', 'Y', 'T', 'T', 'T', 'T', 'Y', 'Y', 'Y'),
(3, 'Bank BRI', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `acc_saldo_awal`
--

CREATE TABLE `acc_saldo_awal` (
  `periode` year(4) NOT NULL,
  `date` date NOT NULL,
  `no_rek` char(10) NOT NULL,
  `debet` double NOT NULL DEFAULT '0',
  `kredit` double NOT NULL DEFAULT '0',
  `tgl_insert` date NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acc_sources`
--

CREATE TABLE `acc_sources` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(225) CHARACTER SET latin1 NOT NULL,
  `aktif` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_simpan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_penarikan` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pinjaman` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_bayar` enum('Y','T') CHARACTER SET latin1 NOT NULL,
  `tmpl_pemasukan` enum('Y','T') NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') NOT NULL,
  `tmpl_transfer` enum('Y','T') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_sources`
--

INSERT INTO `acc_sources` (`id`, `nama`, `aktif`, `tmpl_simpan`, `tmpl_penarikan`, `tmpl_pinjaman`, `tmpl_bayar`, `tmpl_pemasukan`, `tmpl_pengeluaran`, `tmpl_transfer`) VALUES
(1, 'Kas Tunai', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'Kas Besar', 'Y', 'T', 'T', 'T', 'T', 'Y', 'Y', 'Y'),
(3, 'Bank BRI', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `acc_transaction`
--

CREATE TABLE `acc_transaction` (
  `id` bigint(20) NOT NULL,
  `tgl_catat` datetime NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `akun` enum('Pemasukan','Pengeluaran','Transfer') NOT NULL,
  `dari_kas_id` bigint(20) DEFAULT NULL,
  `untuk_kas_id` bigint(20) DEFAULT NULL,
  `jns_trans` bigint(20) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `update_data` datetime NOT NULL,
  `user_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_transaction`
--

INSERT INTO `acc_transaction` (`id`, `tgl_catat`, `jumlah`, `keterangan`, `akun`, `dari_kas_id`, `untuk_kas_id`, `jns_trans`, `dk`, `update_data`, `user_name`) VALUES
(1, '2016-09-30 20:38:00', 500000000, 'Modal Awal Koperasi', 'Pemasukan', NULL, 1, 42, 'D', '0000-00-00 00:00:00', 'admin'),
(2, '2016-10-05 19:35:00', 200000000, 'Dana Suspend Bulan Oktober 2016', 'Pemasukan', NULL, 3, 112, 'D', '0000-00-00 00:00:00', 'admin'),
(3, '2016-10-05 19:40:00', 1000000, 'Pengambilan Dana Simpanan', 'Pengeluaran', 3, NULL, 112, 'K', '2018-05-20 09:08:00', ''),
(4, '2016-10-07 14:11:00', 140000, 'AG0001 Pinjaman Pembiayaan', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin'),
(5, '2016-10-07 14:18:00', 100000, 'AG0001  Pinjaman Pembiayaan ID : AG0001', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin'),
(6, '2016-10-07 14:22:00', 100000, 'AG0001 Pinjaman', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin'),
(7, '2016-10-07 14:25:00', 80000, 'AG0001 Pinjaman', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin'),
(8, '2016-10-08 14:05:00', 200000, 'Pendapatan Admin', 'Pemasukan', NULL, 3, 49, 'D', '0000-00-00 00:00:00', 'admin'),
(9, '2016-10-08 14:10:00', 120000, 'Pinjaman Butuh', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin'),
(10, '2016-10-08 14:48:00', 150000000, 'Gaji Karyawan', 'Pemasukan', NULL, 3, 112, 'D', '0000-00-00 00:00:00', 'admin'),
(11, '2016-10-08 15:18:00', 100000000, 'Modal Dari Rs Permata Cibubur', 'Pemasukan', NULL, 3, 44, 'D', '0000-00-00 00:00:00', 'admin'),
(12, '2016-10-08 15:21:00', 238989300, 'Dana Suspend', 'Pemasukan', NULL, 3, 112, 'D', '0000-00-00 00:00:00', 'admin'),
(13, '2018-03-15 18:47:00', 100000, 'A', 'Pemasukan', NULL, 1, 29, 'D', '0000-00-00 00:00:00', 'admin'),
(14, '2018-04-28 07:49:00', 100000, 'Jasa', 'Pemasukan', NULL, 1, 21, 'D', '0000-00-00 00:00:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `action` enum('created','updated','deleted') COLLATE utf8_unicode_ci NOT NULL,
  `log_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `log_type_title` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `log_type_id` int(11) NOT NULL DEFAULT '0',
  `changes` mediumtext COLLATE utf8_unicode_ci,
  `log_for` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int(11) NOT NULL DEFAULT '0',
  `log_for2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_for_id2` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `created_at`, `created_by`, `action`, `log_type`, `log_type_title`, `log_type_id`, `changes`, `log_for`, `log_for_id`, `log_for2`, `log_for_id2`, `deleted`) VALUES
(1, '2017-08-16 11:18:57', 1, 'created', 'task', 'Input Data Tahap 1', 1, NULL, 'project', 1, '', 0, 0),
(2, '2017-08-16 11:19:40', 1, 'created', 'milestone', 'Input data Tahap 1', 1, NULL, 'project', 1, '', 0, 0),
(3, '2017-08-17 12:19:00', 2, 'created', 'task_comment', 'Oke Mantap', 1, NULL, 'project', 1, 'task', 1, 0),
(4, '2017-08-21 09:29:18', 1, 'created', 'project_file', '_file599aa7ee8258c-ayo-bayar-zakat.jpg', 1, NULL, 'project', 1, '', 0, 0),
(5, '2017-09-11 10:20:33', 1, 'created', 'task', 'UI Design HTML Pages', 2, NULL, 'project', 2, '', 0, 0),
(6, '2017-09-11 10:21:09', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:2:{s:11:\"assigned_to\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"3\";}s:13:\"collaborators\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:1:\"3\";}}', 'project', 2, '', 0, 0),
(7, '2017-09-11 10:22:37', 1, 'created', 'task', 'Responsive Devices On All Pages', 3, NULL, 'project', 2, '', 0, 0),
(8, '2017-09-11 10:23:38', 1, 'created', 'task', 'CMS Module and Backend', 4, NULL, 'project', 2, '', 0, 0),
(9, '2017-09-11 10:24:49', 1, 'created', 'milestone', 'Design UI/UX HTML', 2, NULL, 'project', 2, '', 0, 0),
(10, '2017-09-11 10:25:39', 1, 'created', 'milestone', 'Database Design', 3, NULL, 'project', 2, '', 0, 0),
(11, '2017-09-11 10:27:05', 1, 'created', 'milestone', 'Backend Procedure Design Administrator Pages', 4, NULL, 'project', 2, '', 0, 0),
(12, '2017-09-11 10:27:32', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"2\";}}', 'project', 2, '', 0, 0),
(13, '2017-09-11 10:27:40', 1, 'updated', 'task', 'Responsive Devices On All Pages', 3, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"2\";}}', 'project', 2, '', 0, 0),
(14, '2017-09-11 10:27:47', 1, 'updated', 'task', 'CMS Module and Backend', 4, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"4\";}}', 'project', 2, '', 0, 0),
(15, '2017-09-11 10:30:22', 1, 'created', 'project_file', '_file59b665be62cab-PROPOSAL-PENAWARAN.docx', 2, NULL, 'project', 2, '', 0, 0),
(16, '2017-09-11 10:32:18', 1, 'updated', 'milestone', 'Backend Procedure Design Administrator Pages', 4, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:44:\"Backend Procedure Design Administrator Pages\";s:2:\"to\";s:23:\"Backend And Admin Panel\";}}', 'project', 2, '', 0, 0),
(17, '2017-09-11 10:33:55', 1, 'created', 'milestone', 'Front End Including', 5, NULL, 'project', 2, '', 0, 0),
(18, '2017-09-11 10:35:02', 1, 'created', 'task', 'Front End Integration', 5, NULL, 'project', 2, '', 0, 0),
(19, '2017-09-11 10:35:31', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:1:{s:6:\"status\";a:2:{s:4:\"from\";s:5:\"to_do\";s:2:\"to\";s:11:\"in_progress\";}}', 'project', 2, '', 0, 0),
(20, '2017-09-11 10:37:56', 1, 'created', 'task', 'Database Design System', 6, NULL, 'project', 2, '', 0, 0),
(21, '2017-09-11 10:38:42', 1, 'updated', 'milestone', 'Backend And Admin Panel', 4, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2017-09-15\";s:2:\"to\";s:10:\"2017-09-16\";}}', 'project', 2, '', 0, 0),
(22, '2017-09-11 10:39:20', 1, 'updated', 'task', 'CMS Module and Backend', 4, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2017-09-15\";s:2:\"to\";s:10:\"2017-09-16\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-16\";s:2:\"to\";s:10:\"2017-09-17\";}}', 'project', 2, '', 0, 0),
(23, '2017-09-11 10:40:02', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:1:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"4\";}}', 'project', 2, '', 0, 0),
(24, '2017-09-11 10:40:15', 1, 'updated', 'task', 'CMS Module and Backend', 4, 'a:1:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"5\";}}', 'project', 2, '', 0, 0),
(25, '2017-09-11 10:40:22', 1, 'updated', 'task', 'Front End Integration', 5, 'a:1:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"5\";}}', 'project', 2, '', 0, 0),
(26, '2017-09-11 10:40:36', 1, 'updated', 'task', 'Database Design System', 6, 'a:2:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-15\";s:2:\"to\";s:10:\"2017-09-16\";}}', 'project', 2, '', 0, 0),
(27, '2017-09-11 10:41:56', 1, 'created', 'milestone', 'Unit Testing', 6, NULL, 'project', 2, '', 0, 0),
(28, '2017-09-11 10:42:43', 1, 'created', 'task', 'User Checked Unit Testing', 7, NULL, 'project', 2, '', 0, 0),
(29, '2017-09-11 10:43:08', 1, 'updated', 'task', 'User Checked Unit Testing', 7, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2017-09-21\";s:2:\"to\";s:10:\"2017-09-22\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-22\";s:2:\"to\";s:10:\"2017-09-23\";}}', 'project', 2, '', 0, 0),
(30, '2017-09-11 10:43:23', 1, 'updated', 'milestone', 'Unit Testing', 6, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2017-09-21\";s:2:\"to\";s:10:\"2017-09-23\";}}', 'project', 2, '', 0, 0),
(31, '2017-09-11 10:43:44', 1, 'updated', 'task', 'User Checked Unit Testing', 7, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2017-09-22\";s:2:\"to\";s:10:\"2017-09-21\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-23\";s:2:\"to\";s:10:\"2017-09-22\";}}', 'project', 2, '', 0, 0),
(32, '2017-09-11 10:44:01', 1, 'updated', 'milestone', 'Unit Testing', 6, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2017-09-23\";s:2:\"to\";s:10:\"2017-09-21\";}}', 'project', 2, '', 0, 0),
(33, '2018-03-18 17:11:49', 1, 'created', 'milestone', 'Analisa Kebutuhan', 7, NULL, 'project', 3, '', 0, 0),
(34, '2018-03-18 17:13:27', 1, 'created', 'milestone', 'Analisa Perancangan', 8, NULL, 'project', 3, '', 0, 0),
(35, '2018-03-18 17:13:45', 1, 'created', 'milestone', 'Implementasi Modul', 9, NULL, 'project', 3, '', 0, 0),
(36, '2018-03-18 17:14:30', 1, 'created', 'milestone', 'Implementasi Laporan', 10, NULL, 'project', 3, '', 0, 0),
(37, '2018-03-18 17:15:37', 1, 'created', 'task', 'Mengumpulkan Data', 8, NULL, 'project', 3, '', 0, 0),
(38, '2018-03-18 17:15:58', 1, 'updated', 'task', 'Mengumpulkan Data', 8, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"0000-00-00\";s:2:\"to\";s:10:\"2018-03-19\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"0000-00-00\";s:2:\"to\";s:10:\"2018-03-21\";}}', 'project', 3, '', 0, 0),
(39, '2018-03-18 17:16:52', 1, 'created', 'task', 'Desain Database', 9, NULL, 'project', 3, '', 0, 0),
(40, '2018-03-18 17:17:19', 1, 'updated', 'task', 'Desain Database', 9, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-03-23\";s:2:\"to\";s:10:\"2018-03-22\";}}', 'project', 3, '', 0, 0),
(41, '2018-03-18 17:21:02', 1, 'created', 'task', 'Modul Master Data', 10, NULL, 'project', 3, '', 0, 0),
(42, '2018-03-18 17:21:46', 1, 'created', 'task', 'Modul Reference Data', 11, NULL, 'project', 3, '', 0, 0),
(43, '2018-03-18 17:22:21', 1, 'created', 'task', 'Modul Master Report COA', 12, NULL, 'project', 3, '', 0, 0),
(44, '2018-03-18 17:23:37', 1, 'created', 'task', 'Desain Skema Laporan', 13, NULL, 'project', 3, '', 0, 0),
(45, '2018-03-18 17:24:22', 1, 'created', 'task', 'Desain Skema Purchase & Sales', 14, NULL, 'project', 3, '', 0, 0),
(46, '2018-03-18 17:25:35', 1, 'updated', 'task', 'Desain Database', 9, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-03-24\";s:2:\"to\";s:10:\"2018-03-25\";}}', 'project', 3, '', 0, 0),
(47, '2018-03-18 17:26:34', 1, 'updated', 'task', 'Desain Skema Laporan', 13, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-03-28\";s:2:\"to\";s:10:\"2018-03-26\";}}', 'project', 3, '', 0, 0),
(48, '2018-03-18 17:26:55', 1, 'updated', 'task', 'Desain Skema Purchase & Sales', 14, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-03-30\";s:2:\"to\";s:10:\"2018-03-28\";}}', 'project', 3, '', 0, 0),
(49, '2018-03-18 17:27:18', 1, 'updated', 'task', 'Modul Master Data', 10, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-04-02\";s:2:\"to\";s:10:\"2018-04-01\";}}', 'project', 3, '', 0, 0),
(50, '2018-03-18 17:28:07', 1, 'created', 'milestone', 'Implementasi Fitur', 11, NULL, 'project', 3, '', 0, 0),
(51, '2018-03-18 17:28:20', 1, 'updated', 'milestone', 'Implementasi Laporan', 10, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:20:\"Implementasi Laporan\";s:2:\"to\";s:18:\"Implementasi Fitur\";}}', 'project', 3, '', 0, 0),
(52, '2018-03-18 17:28:33', 1, 'updated', 'milestone', 'Implementasi Fitur', 11, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:18:\"Implementasi Fitur\";s:2:\"to\";s:20:\"Implementasi Laporan\";}}', 'project', 3, '', 0, 0),
(53, '2018-03-18 17:29:07', 1, 'created', 'milestone', 'Bugs & Testing (FIXING)', 12, NULL, 'project', 3, '', 0, 0),
(54, '2018-03-18 17:29:24', 1, 'updated', 'milestone', 'Bugs & Testing (FIXING)', 12, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2018-04-23\";s:2:\"to\";s:10:\"2018-04-28\";}}', 'project', 3, '', 0, 0),
(55, '2018-03-18 17:30:55', 1, 'created', 'task', 'Implementasi Sistem Travel', 15, NULL, 'project', 3, '', 0, 0),
(56, '2018-03-18 17:33:21', 1, 'created', 'task', 'Vendor Sistem', 16, NULL, 'project', 3, '', 0, 0),
(57, '2018-03-18 17:34:08', 1, 'created', 'task', 'CRUD Customers', 17, NULL, 'project', 3, '', 0, 0),
(58, '2018-03-18 17:35:36', 1, 'created', 'task', 'Fitur Purchase Order', 18, NULL, 'project', 3, '', 0, 0),
(59, '2018-03-18 17:36:31', 1, 'created', 'task', 'Sales Order', 19, NULL, 'project', 3, '', 0, 0),
(60, '2018-03-18 17:37:03', 1, 'updated', 'task', 'Sales Order', 19, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:11:\"Sales Order\";s:2:\"to\";s:17:\"Fitur Sales Order\";}}', 'project', 3, '', 0, 0),
(61, '2018-03-18 17:37:54', 1, 'created', 'task', 'Fitur Sales Quotation', 20, NULL, 'project', 3, '', 0, 0),
(62, '2018-03-18 17:39:04', 1, 'created', 'task', 'Fitur Purchase Request', 21, NULL, 'project', 3, '', 0, 0),
(63, '2018-03-18 17:40:13', 1, 'created', 'task', 'Fitur Invoice ', 22, NULL, 'project', 3, '', 0, 0),
(64, '2018-03-18 17:41:13', 1, 'updated', 'task', 'Fitur Invoice ', 22, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-04-24\";s:2:\"to\";s:10:\"2018-04-23\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-25\";s:2:\"to\";s:10:\"2018-04-24\";}}', 'project', 3, '', 0, 0),
(65, '2018-03-18 17:41:24', 1, 'created', 'task', 'Fitur Tax (Pajak)', 23, NULL, 'project', 3, '', 0, 0),
(66, '2018-03-18 17:41:35', 1, 'updated', 'task', 'Fitur Tax (Pajak)', 23, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-26\";s:2:\"to\";s:10:\"2018-04-25\";}}', 'project', 3, '', 0, 0),
(67, '2018-03-18 17:42:19', 1, 'created', 'task', 'Fitur AP & AR', 24, NULL, 'project', 3, '', 0, 0),
(68, '2018-03-18 17:43:17', 1, 'created', 'task', 'Modul Master Asset (Fix)', 25, NULL, 'project', 3, '', 0, 0),
(69, '2018-03-18 17:44:01', 1, 'updated', 'task', 'Modul Master Asset (Fix)', 25, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-07\";s:2:\"to\";s:10:\"2018-04-05\";}}', 'project', 3, '', 0, 0),
(70, '2018-03-18 17:46:20', 1, 'created', 'task', 'Modul Master Produk', 26, NULL, 'project', 3, '', 0, 0),
(71, '2018-03-18 17:47:11', 1, 'updated', 'task', 'Implementasi Sistem Travel', 15, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-27\";s:2:\"to\";s:10:\"2018-04-23\";}}', 'project', 3, '', 0, 0),
(72, '2018-03-18 17:48:28', 1, 'updated', 'milestone', 'Implementasi Laporan', 11, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2018-04-16\";s:2:\"to\";s:10:\"2018-04-30\";}}', 'project', 3, '', 0, 0),
(73, '2018-03-18 17:48:47', 1, 'updated', 'milestone', 'Bugs & Testing (FIXING)', 12, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2018-04-28\";s:2:\"to\";s:10:\"2018-05-07\";}}', 'project', 3, '', 0, 0),
(74, '2018-03-18 17:49:34', 1, 'created', 'task', 'Laporan NERACA SALDO', 27, NULL, 'project', 3, '', 0, 0),
(75, '2018-03-18 17:50:05', 1, 'created', 'task', 'Laporan LABA RUGI', 28, NULL, 'project', 3, '', 0, 0),
(76, '2018-03-18 17:50:37', 1, 'created', 'task', 'Laporan Arus Kas', 29, NULL, 'project', 3, '', 0, 0),
(77, '2018-03-18 17:52:26', 1, 'created', 'task', 'Laporan Kas Penjualan', 30, NULL, 'project', 3, '', 0, 0),
(78, '2018-03-18 17:53:10', 1, 'created', 'task', 'Laporan Penyusutan Aset', 31, NULL, 'project', 3, '', 0, 0),
(79, '2018-03-18 17:53:52', 1, 'created', 'task', 'Laporan Perubahan Modal', 32, NULL, 'project', 3, '', 0, 0),
(80, '2018-03-18 17:54:32', 1, 'created', 'task', 'Laporan LABA RUGI per Projects', 33, NULL, 'project', 3, '', 0, 0),
(81, '2018-03-18 17:54:58', 1, 'created', 'task', 'Laporan per Produk', 34, NULL, 'project', 3, '', 0, 0),
(82, '2018-03-18 17:55:27', 1, 'updated', 'task', 'Laporan NERACA SALDO', 27, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-05-06\";s:2:\"to\";s:10:\"2018-05-05\";}}', 'project', 3, '', 0, 0),
(83, '2018-03-18 17:55:53', 1, 'updated', 'task', 'Laporan LABA RUGI', 28, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0),
(84, '2018-03-18 17:56:05', 1, 'updated', 'task', 'Laporan LABA RUGI per Projects', 33, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0),
(85, '2018-03-18 17:56:14', 1, 'updated', 'task', 'Laporan per Produk', 34, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0),
(86, '2018-03-18 17:56:39', 1, 'updated', 'task', 'Modul Master Produk', 26, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"9\";}}', 'project', 3, '', 0, 0),
(87, '2018-03-18 17:56:58', 1, 'updated', 'task', 'Laporan Perubahan Modal', 32, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `description`, `start_date`, `end_date`, `created_by`, `share_with`, `created_at`, `read_by`, `deleted`) VALUES
(1, 'Pemberitahuan Maintenance Nugastudio', '<p>Pemberitahuan Maintenance Mengenai Server Kami....</p>', '2017-08-20', '2017-08-21', 1, 'all_members,all_clients', '2017-08-17 12:45:29', '0,2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `status` enum('incomplete','pending','approved','rejected','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int(11) NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime DEFAULT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `checked_at` datetime DEFAULT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `status`, `user_id`, `in_time`, `out_time`, `checked_by`, `note`, `checked_at`, `reject_reason`, `deleted`) VALUES
(1, 'pending', 1, '2017-08-17 12:20:13', '2017-08-17 12:39:28', NULL, NULL, NULL, NULL, 0),
(2, 'pending', 1, '2017-08-17 12:39:30', '2017-08-17 12:39:33', NULL, NULL, NULL, NULL, 0),
(3, 'pending', 1, '2017-08-17 12:40:03', '2017-08-18 00:52:36', NULL, NULL, NULL, NULL, 0),
(4, 'pending', 3, '2017-08-17 13:22:00', '2017-08-17 14:12:21', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('l5rupjem0o2sgudbf9ttmlbhk921pgas', '::1', 1528548926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383534383337363b757365725f69647c733a313a2231223b),
('7v7jsn3elc53f7u1c2hof13p04kihk15', '::1', 1528546453, ''),
('5gfhihmapua4o82ri1pdq9de66h2bsjr', '::1', 1528549257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383534383935393b757365725f69647c733a313a2231223b),
('v76cgrqmru0ssb5m0laklji8a5m8assm', '::1', 1528549593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383534393237303b757365725f69647c733a313a2231223b),
('8pd6v8bpufsuiho1pj2f6eosdih87pdj', '::1', 1528549896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383534393631323b757365725f69647c733a313a2231223b),
('e9d5jhiarntihjkrs5n1lb2nnlg2jnsm', '::1', 1528550307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383534393931353b757365725f69647c733a313a2231223b),
('urpj1l95479iqfnjnrrt7697bmr2os0j', '::1', 1528550692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535303334303b757365725f69647c733a313a2231223b),
('fqbq4kd1hd8pj3gqoofa5qdmv7qmi95g', '::1', 1528551263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535303730393b757365725f69647c733a313a2231223b),
('0rvpjhliop8ih7v7vi25k6b8f6rgfm7b', '::1', 1528551535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535313237373b757365725f69647c733a313a2231223b),
('hbd0mu285kodtpgfm0gfg51ut6e8b6ol', '::1', 1528551880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535313538343b757365725f69647c733a313a2231223b),
('a5vkuf0sn0amvdumdi2ek4c3kohu5717', '::1', 1528552227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535313932383b757365725f69647c733a313a2231223b),
('3lj66lf66kqc68f6q4uaq7deqhhnmtd9', '::1', 1528552553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535323233333b757365725f69647c733a313a2231223b),
('i1nor008li3tfptmnflrgb42avlbbp07', '::1', 1528552889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535323538393b757365725f69647c733a313a2231223b),
('irnnk84et11ppulmhjua5l0a07gtj3el', '::1', 1528553200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535323930303b757365725f69647c733a313a2231223b),
('vg9h5qiubhsfr8tjaerpk9pdcva6m8vt', '::1', 1528553482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535333230363b757365725f69647c733a313a2231223b),
('ma5fug1r48ea9bnk85od02o2vfok4c4i', '::1', 1528553803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535333531363b757365725f69647c733a313a2231223b),
('7dulfbvgpqqrev159e6sidnu2ltimets', '::1', 1528554134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535333834393b757365725f69647c733a313a2231223b),
('u02ita5rooa82cgpd1i5mn0grqkff6cj', '::1', 1528554432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535343135373b757365725f69647c733a313a2231223b),
('hd6r133h1kvlpbdrgeok3rp9nh8ha231', '::1', 1528554718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535343436303b757365725f69647c733a313a2231223b),
('ttt33kc71cs2nf3alatpo0g03d480j3e', '::1', 1528555301, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535343736333b757365725f69647c733a313a2231223b),
('ss9soj4rp4p7tda33h4af8j9fj0vnfvs', '::1', 1528555651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535353331393b757365725f69647c733a313a2231223b),
('ap9gkcs1dmo509inkf61nid1jpn30lr8', '::1', 1528556231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535353637313b757365725f69647c733a313a2231223b),
('n4ng0f5ucggrag2kmuo4sj4n224u862q', '::1', 1528559774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535363235383b757365725f69647c733a313a2231223b),
('46kp5340t50blhae8skil2lbhqdk7nqu', '::1', 1528560147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383535393830383b757365725f69647c733a313a2231223b),
('88dltvg7j6vet8pau80ts9q0l3u9q8sc', '::1', 1528560422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383536303137333b757365725f69647c733a313a2231223b),
('078etlasgasfajug74niljbbqreqi735', '::1', 1528560581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383536303438313b757365725f69647c733a313a2231223b),
('iadsjp8lhie4i6ivfni2i8culhqt5r23', '::1', 1528562222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383536313236353b757365725f69647c733a313a2231223b),
('ap9q5lfsfto09b6o7dor4m9n4t6rmrl2', '::1', 1528562906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383536323235363b757365725f69647c733a313a2231223b),
('qa8pu3r32t3e1h47v5b7o4gbvv2ifbrl', '::1', 1528563337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383536323931303b757365725f69647c733a313a2231223b),
('fsqdttvqp26lpf61pqfboq6150aj2g87', '::1', 1528563659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383536333333383b757365725f69647c733a313a2231223b),
('f1c8lhn55mv74o8icoiuq991p825re2s', '::1', 1528563775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383536333731323b757365725f69647c733a313a2231223b),
('6bb0ckglfg74hupqvbcrj7mqje9db8gj', '::1', 1528621039, ''),
('h86kcbgjuo9sl11fk5ckfl3lfriepitl', '::1', 1528621152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383632313135323b),
('vqe7itdkbdd979gibrrrhhd0jerpt6s8', '::1', 1528649638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383634393139383b757365725f69647c733a313a2231223b),
('glk5oculieppseaq9ip17qf23ibd25v3', '::1', 1528651325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383634393636363b757365725f69647c733a313a2231223b),
('rclhsttsjfdajtnfa1ru53pid90nd66i', '::1', 1528652395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383635313333313b757365725f69647c733a313a2231223b),
('0p8634iuhhmfdkt95qh83vmsr8mglnsj', '::1', 1528723903, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383732333533343b757365725f69647c733a313a2231223b),
('2gbn7qrko46q5fb4vfhij4vt2e3g9cct', '::1', 1528724223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383732333932343b757365725f69647c733a313a2231223b),
('pq3unqqu2jo3f48d2a0idiiq8vj3mj43', '::1', 1528724565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383732343232363b757365725f69647c733a313a2231223b),
('qh8b2hut8ss78ev22t2e9hic58uobkhd', '::1', 1528725178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383732343537313b757365725f69647c733a313a2231223b),
('lt7ioef48tjc06ur9po00jhtsbr6vqnv', '::1', 1528731435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383732353232353b757365725f69647c733a313a2231223b),
('246siju98tquk9egvtn58f3jdchurua9', '::1', 1528731619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532383733313433353b757365725f69647c733a313a2231223b),
('4dg67nh8scs6ojp71cjp05nfonihsh57', '192.168.8.103', 1529836062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393833333139313b757365725f69647c733a313a2231223b),
('jp07bv8if46hh2dil7as59aaggsfgrm1', '192.168.8.102', 1529912107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393931323130373b),
('pdniaqqofmvrj6pmre905fotvvvb9u3f', '::1', 1529942643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393934323132303b757365725f69647c733a313a2231223b),
('41sj35p38i4gelq7abjkju81gec4lqn2', '::1', 1529942705, ''),
('99k69eld4nq0v2togb0nnaudrno4sc4v', '::1', 1529943147, ''),
('8olphavdrdefucfdq9rg213cgukqml2d', '::1', 1529943166, ''),
('ed6gqtc1dfdmp30jujifoppvgkaovffr', '::1', 1529943560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393934333535393b),
('pqk3nq7n04lhrdtt68642dt69no9h73b', '::1', 1529943573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393934333537333b757365725f69647c733a313a2231223b),
('gjqikv3c24741au7rc7p5svgqblveh18', '::1', 1529943634, ''),
('f4ijea5bo42491886hbeu78aivu34fm2', '::1', 1529943634, ''),
('hl1mm2lfidgp04cts8h5g4amu28l9afk', '::1', 1530857790, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303835373430353b757365725f69647c733a313a2231223b),
('ese3gsu99u1bf72brge6ocmq2f0dkvcd', '::1', 1530858392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303835373739303b757365725f69647c733a313a2231223b),
('m2tuc05f8koqelgunc7e11fg78je6cr0', '::1', 1530858688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303835383339333b757365725f69647c733a313a2231223b),
('kpi27k7tk90rar9mtrpburc1ssh2i33t', '::1', 1530859004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303835383730363b757365725f69647c733a313a2231223b),
('pa71s3t89ud1rsl55o81793pr4bcjgpo', '::1', 1530859547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303835393031373b757365725f69647c733a313a2231223b),
('5uve58ekdvmnm5tbnrpmtr3t0remfv0b', '::1', 1530860034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303835393538303b757365725f69647c733a313a2231223b),
('sp2doo2ne0aen17i4bhq1c367soginhm', '::1', 1530860352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303836303037303b757365725f69647c733a313a2231223b),
('4n5kirhvn8u6qp74a11rv18d0tjfrs7r', '::1', 1530860400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303836303338333b757365725f69647c733a313a2231223b),
('q8vut9j7fksr1rp86bsuk54tacfmhb0h', '::1', 1531281261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313238313236303b),
('49be8r14qhe1s9q487pf5eragjv2qnlj', '::1', 1531281514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313238313236313b757365725f69647c733a313a2231223b),
('edfklbott29p7i94948hg0tnt9lg46pb', '::1', 1531292353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313238313536353b757365725f69647c733a313a2231223b),
('r6b0pfqfp2917qvavbn5s2uis7vbukn5', '::1', 1531292832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239323339303b757365725f69647c733a313a2231223b),
('8fl9d4v86qfi7pfs0h51e81ss8mf47bk', '::1', 1531293247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239323833363b757365725f69647c733a313a2231223b),
('47sltomtqfd0igunh2631pd30r8mkp4b', '::1', 1531294438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239333238373b757365725f69647c733a313a2231223b),
('bnu4duampi075pvdg3h7bln2l8t3ketj', '::1', 1531294795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239343439323b757365725f69647c733a313a2231223b),
('ej6fjcsslnq34jef6or58pqo8g108lht', '::1', 1531295082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239343831383b757365725f69647c733a313a2231223b),
('vhh9lf0hl1pccmo3oquto5amr4ekp6ev', '::1', 1531295410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239353132313b757365725f69647c733a313a2231223b),
('04q25crgspbspiacq7684vnfnjln237d', '::1', 1531295958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239353432343b757365725f69647c733a313a2231223b),
('j287mcgfnpkttm4do2r3gc5b2tbo3hak', '::1', 1531296294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239353936313b757365725f69647c733a313a2231223b),
('pb8vd6nc7at83p71vqojjcguv4i3enc1', '::1', 1531296806, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239363330303b757365725f69647c733a313a2231223b),
('rki008okce6pv7td1bc7dfmbna0s851a', '::1', 1531297740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239363831353b757365725f69647c733a313a2231223b),
('1fieqesed9u7fl8182l2q8e930uhqls2', '::1', 1531299197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239373735353b757365725f69647c733a313a2231223b),
('jjhf5o8ur0jp5lrqdqj7iqf6ieivde6k', '::1', 1531299563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239393233303b757365725f69647c733a313a2231223b),
('j3rev1h19g4ce6l7mrqtbukck7o2luft', '::1', 1531300329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313239393537303b757365725f69647c733a313a2231223b),
('oo5m9rkhbjc8a7gd4k24v4jcne77o7c5', '::1', 1531300654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330303332393b757365725f69647c733a313a2231223b),
('b4g20ska0juotj2vagf6q9mb5f0ja3tn', '::1', 1531300962, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330303636313b757365725f69647c733a313a2231223b),
('4d9bbskavq6r9vfedmrm822hgb2voh6q', '::1', 1531301256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330303936323b757365725f69647c733a313a2231223b),
('839qvagltr831mm8n4tgdqfv4kei0kma', '::1', 1531301880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330313237393b757365725f69647c733a313a2231223b),
('c75bnbm6ptg8lvm1ibh7hhij0ndr18p4', '::1', 1531302162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330313838323b757365725f69647c733a313a2231223b),
('emluis8l0ikpc8gfhb1atcudn4m72ni6', '::1', 1531302609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330323139323b757365725f69647c733a313a2231223b),
('2018ooho4o61qdisefr80khp23sr6fib', '::1', 1531302902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330323630393b757365725f69647c733a313a2231223b),
('r23t4fhr5h50jfqg0nib07ufi8go8j1v', '::1', 1531303289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330323931323b757365725f69647c733a313a2231223b),
('fkj5kqn1e7i5eb1jceljrjgbn6mk3j3g', '::1', 1531303567, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330333239333b757365725f69647c733a313a2231223b),
('csi5ro13s5n9r6l223mb6fqovp6pc5bk', '::1', 1531303916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330333632333b757365725f69647c733a313a2231223b),
('eca73gdakifk2us6b0or7lao9tcbc21d', '::1', 1531304416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330333934313b757365725f69647c733a313a2231223b),
('arqe4mjba0o50bqk7e8r98ihsc923r0e', '::1', 1531305084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330343436393b757365725f69647c733a313a2231223b),
('ael5bdnc470ioc7237nn1b7jr8te6204', '::1', 1531312468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313330353038373b757365725f69647c733a313a2231223b),
('92ai4m8nqpjl9qhvebvk5sv4nm1hbu8h', '::1', 1531312871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331323531303b757365725f69647c733a313a2231223b),
('qco4o28eekod03aotdv6eg9jmmnu1j17', '::1', 1531313184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331323837313b757365725f69647c733a313a2231223b),
('ofgq4s0upo9n77m0161ta3aua3obl19v', '::1', 1531313489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331333138343b757365725f69647c733a313a2231223b),
('4rc1968mv764n32584lavhqc05of0sm7', '::1', 1531313797, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331333439313b757365725f69647c733a313a2231223b),
('uf8jj1778h9uth12vgpvmt21eatvde8i', '::1', 1531314103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331333739373b757365725f69647c733a313a2231223b),
('n83f526rs9vk85shcs9vmqtvfl044uod', '::1', 1531314436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331343130333b757365725f69647c733a313a2231223b),
('9oh1e9tpb5j81h3ijkop51qvqke3vgpg', '::1', 1531315006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331343433363b757365725f69647c733a313a2231223b),
('pgf4n390i2j5b5ahjd7lv7gam8i5dpet', '::1', 1531315389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331353031353b757365725f69647c733a313a2231223b),
('0r6dr9n19osv27hj65s5bo8sak22oojd', '::1', 1531316003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331353432363b757365725f69647c733a313a2231223b),
('9th0h6m9bgr7m5caqs32dalbh03scm4t', '::1', 1531316365, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331363030333b757365725f69647c733a313a2231223b),
('4rnlf48seid3mein1m9qt6jc4f9kc9i1', '::1', 1531316655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331363338313b757365725f69647c733a313a2231223b),
('0a25avqj7mbncjpp1ogiqrsm15ktbh4h', '::1', 1531317160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331363638333b757365725f69647c733a313a2231223b),
('4o27jbhjo9snuvn3m61kbndbab1ho981', '::1', 1531326969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313331373137323b757365725f69647c733a313a2231223b),
('iidhljcl185n20ohl22ihiju3a9u39g6', '::1', 1531327096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313332363937353b757365725f69647c733a313a2231223b),
('qltpmc6fc349fkuudg8btnl1h3ssir4d', '::1', 1531353673, ''),
('dohdanonqufh1aa4d6asmrkckcvs5l5g', '::1', 1531371935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533313336303438343b757365725f69647c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `company_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text COLLATE utf8_unicode_ci,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `starred_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `vat_number` text COLLATE utf8_unicode_ci,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `company_name`, `address`, `city`, `state`, `zip`, `country`, `created_date`, `website`, `phone`, `currency_symbol`, `starred_by`, `deleted`, `vat_number`, `currency`, `disable_online_payment`) VALUES
(1, 'PT Kamardagang Indonesia', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Tangerang Selatan', 'Tangerang', '15415', 'Indonesia', '2018-05-03', '', '85710433300', '', '', 0, '', '', 1),
(2, 'PT Askara Internal', 'Bla bla bla', 'Bekasi', 'Jakarta Timur', '20000', 'Indonesia', '2017-09-11', 'askara-int.com', '0999993333', '', '', 0, '', '', 1),
(3, 'PT Ranata Tours', '', '', '', '', '', '2018-03-18', '', '', '', '', 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` text COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_admins_only` tinyint(1) NOT NULL DEFAULT '0',
  `hide_from_clients` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL,
  `related_to_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `deleted`) VALUES
(1, 'login_info', 'Login details', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(2, 'reset_password', 'Reset password', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '', 0),
(3, 'team_member_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(4, 'send_invoice', 'New invoice', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', 0),
(5, 'signature', 'Signature', 'Powered By: <a href=\"http://fairsketch.com/\" target=\"_blank\">fairsketch </a>', '<br>', 0),
(6, 'client_contact_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', '', 0),
(8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', '', 0),
(9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', '', 0),
(10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', '', 0),
(11, 'general_notification', '{EVENT_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', '', 0),
(12, 'invoice_payment_confirmation', 'Payment received', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\">\r\n                                        <tbody><tr>\r\n                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Payment Confirmation</h2>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </td>\r\n                                                            </tr>\r\n                                                        </tbody>\r\n                                                    </table>\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    Hello,<br>\r\n                                                                                    We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_ID} <br>\r\n                                                                                    Thank you for your business cooperation.\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr>\r\n                                                                                                <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                        <tbody>\r\n                                                                                                            <tr>\r\n                                                                                                                <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                                    <a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a>\r\n                                                                                                                </td>\r\n                                                                                                            </tr>\r\n                                                                                                        </tbody>\r\n                                                                                                    </table>\r\n                                                                                                </td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n                                                                                    \r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n  {SIGNATURE}\r\n  </td>\r\n </tr>\r\n </tbody>\r\n  </table>\r\n  </td>\r\n  </tr>\r\n  </tbody>\r\n </table>\r\n  </td>\r\n </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n </tr>\r\n </tbody>\r\n </table>\r\n </td>\r\n </tr>\r\n </tbody>\r\n  </table>', NULL, 0),
(13, 'message_received', '{SUBJECT}', '<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"> <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\"> <style type=\"text/css\"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id=\"message-container\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;\"> <tbody> <tr> <td valign=\"top\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"50\" width=\"600\">&nbsp;</td> </tr> <tr> <td style=\"background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; \" width=\"600\"><h2 style=\"color:#fff; text-align:center;\">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor=\"whitesmoke\" style=\"background:#fff; font-family:Helvetica,Arial,sans-serif\" valign=\"top\" width=\"600\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> <tr> <td width=\"560\"><p><span style=\"background-color: transparent;\">{MESSAGE_CONTENT}</span></p> <p style=\"display:inline-block; padding: 10px 15px; background-color: #00b393;\"><a href=\"{MESSAGE_URL}\" style=\"text-decoration: none; color:#fff;\" target=\"_blank\">Reply Message</a></p> </td> </tr> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height=\"60\" width=\"600\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL DEFAULT '0',
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `tax_id2` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `estimates`
--

INSERT INTO `estimates` (`id`, `client_id`, `estimate_request_id`, `estimate_date`, `valid_until`, `note`, `last_email_sent_date`, `status`, `tax_id`, `tax_id2`, `deleted`) VALUES
(1, 1, 0, '2017-08-20', '2017-09-03', 'ryryer  ery', NULL, 'draft', 0, 0, 0),
(2, 2, 0, '2017-09-11', '2017-09-18', 'Web Company Profiles', NULL, 'draft', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_forms`
--

CREATE TABLE `estimate_forms` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `enable_attachment` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

CREATE TABLE `estimate_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `estimate_items`
--

INSERT INTO `estimate_items` (`id`, `title`, `description`, `quantity`, `unit_type`, `rate`, `total`, `estimate_id`, `deleted`) VALUES
(1, 'Web Design HTML Templates', '', 5, 'pages', 250000, 1250000, 1, 0),
(2, 'Web Company Profiles', 'Web Company Profiles', 1, 'Module', 6400000, 6400000, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_requests`
--

CREATE TABLE `estimate_requests` (
  `id` int(11) NOT NULL,
  `estimate_form_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `location` mediumtext COLLATE utf8_unicode_ci,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `color` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `start_date`, `end_date`, `start_time`, `end_time`, `created_by`, `location`, `client_id`, `labels`, `share_with`, `deleted`, `color`) VALUES
(1, 'Annual Meeting Monthly', 'Meeting', '2017-08-25', '2017-08-25', '09:00:00', '11:00:00', 1, 'Kantor', 0, 'Meetings', 'all', 0, '#2d9cdb');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expense_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `amount` double NOT NULL,
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `title`, `deleted`) VALUES
(1, 'Miscellaneous expense', 0),
(2, 'Transportation', 0),
(3, 'Acomodations', 0),
(4, 'Listrik', 0),
(5, 'Payroll', 0),
(6, 'Sewa', 0),
(7, 'Kebutuhan Harian', 0);

-- --------------------------------------------------------

--
-- Table structure for table `help_articles`
--

CREATE TABLE `help_articles` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `total_views` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `help_articles`
--

INSERT INTO `help_articles` (`id`, `title`, `description`, `category_id`, `created_by`, `created_at`, `status`, `total_views`, `deleted`) VALUES
(1, 'Clients Pages', '<div class=\"page-header\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\"><h3 style=\"margin: 18px 0px 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 26px; vertical-align: baseline;\">Clients</h3><hr class=\"notop\" style=\"line-height: 0px; border-bottom: 1px solid rgb(255, 255, 255); border-top-color: rgb(212, 212, 212); margin: 0px 0px 16px; padding: 0px; clear: both; float: none;\"></div><p style=\"margin-top: 18px; margin-bottom: 18px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\">You can create and manage your customers in clients section.&nbsp;</p><p style=\"margin-top: 18px; margin-bottom: 18px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\">Images</p><h5 style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 100; font-size: 16px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\">List of Clients</h5><ol style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\"><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Create new client using the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Add client</span>&nbsp;button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Search the existing clients which already added in this application.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To see the details information of the client click on the Company name link.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">If you need to edit the client\'s information you can do it using the edit button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To delete the client use the delete button. Once you click on the button, the system will delete the client and you will have a chance to undo the action within 10 seconds. If you don\'t undo the action, the system will delete the client permanently&nbsp;and you will not be able to revert the client anyway!</li></ol><h5 style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 100; font-size: 16px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\">Add new client</h5><ol style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\"><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">The company name is an organization you or your organization works for. Even if your client is a person you have to add the information as a company. After creating any client you can add contacts of that client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">&nbsp;You can define different currency for different clients. It\'s useful when you are working with a foreign client which currency symbol is different from your default currency symbol. By default the invoices of the client will be generated using the default currency symbol if you don\'t define any currency symbol with that specific client.</li></ol><h5 style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 100; font-size: 16px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\">Client Details</h5><div>Images</div><div><br></div><div><ol style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\"><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Click on the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Edit&nbsp;</span>button to edit any information of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">The contacts tab contains the list of contacts of the client. You can add one or more contact by clicking on the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Add contact&nbsp;</span>button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To send an invitation to any user for the client, use the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Send invitation</span>&nbsp;button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Projects tab contains all projects of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Invoices tab contains all invoices of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Payments tab contains all payments of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Tickets tab contains all tickets of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To delete any contact from the client, use the delete button. Once you delete any contact you can undo the action within 10 seconds. If you don\'t undo the action the contact will be deleted from the client permanently&nbsp;and the contact will not be able to login in the client portal.</li></ol></div>', 1, 1, '2017-08-17 19:17:54', 'active', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `help_categories`
--

CREATE TABLE `help_categories` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('help','knowledge_base') COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `help_categories`
--

INSERT INTO `help_categories` (`id`, `title`, `description`, `type`, `sort`, `status`, `deleted`) VALUES
(1, 'Documentation', 'Documentation Of Nugastudio Projects Management', 'help', 1, 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','not_paid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `tax_id2` int(11) NOT NULL DEFAULT '0',
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recurring_invoice_id` int(11) NOT NULL DEFAULT '0',
  `repeat_every` int(11) NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_cycles` int(11) NOT NULL DEFAULT '0',
  `next_recurring_date` date NOT NULL DEFAULT '0000-00-00',
  `no_of_cycles_completed` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `client_id`, `project_id`, `bill_date`, `due_date`, `note`, `last_email_sent_date`, `status`, `tax_id`, `tax_id2`, `recurring`, `recurring_invoice_id`, `repeat_every`, `repeat_type`, `no_of_cycles`, `next_recurring_date`, `no_of_cycles_completed`, `deleted`) VALUES
(1, 1, 1, '2017-08-20', '2017-08-27', 'Pembayaran Pertama', NULL, 'not_paid', 0, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0),
(2, 2, 0, '2017-09-05', '2017-09-06', 'DP Pembuatan Web Site 50%', NULL, 'draft', 0, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0),
(3, 2, 2, '2017-09-06', '2017-09-08', '', NULL, 'not_paid', 0, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0),
(4, 2, 2, '2018-04-27', '2018-04-29', 'eryeyer', NULL, 'not_paid', 1, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0),
(5, 1, 1, '2018-05-08', '2018-05-09', 'aksdfsdg', '2018-05-08', 'not_paid', 1, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0),
(6, 2, 2, '2018-05-17', '2018-05-18', 'dsf', NULL, 'draft', 1, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `title`, `description`, `quantity`, `unit_type`, `rate`, `total`, `invoice_id`, `deleted`) VALUES
(1, 'Transportation', 'Transportation', 1, 'days', 100000, 100000, 1, 0),
(2, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 3, 0),
(3, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 4, 0),
(4, 'Web Company Profiles', 'Web Company Profiles', 1, 'Module', 6400000, 6400000, 4, 0),
(5, 'Example Items', '', 3, '', 100000, 300000, 5, 0),
(6, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 1, 0),
(7, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 6, 0),
(8, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 13, 0),
(9, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` tinytext COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `amount`, `payment_date`, `payment_method_id`, `note`, `invoice_id`, `deleted`, `transaction_id`, `created_by`, `created_at`) VALUES
(1, 100000, '2017-08-16', 4, 'Payment 1', 1, 0, NULL, 1, '2017-08-16 11:27:32'),
(2, 3200000, '2017-09-06', 4, 'Pembayaran DP 50% Proyek Company Profile', 3, 0, NULL, 1, '2017-09-11 11:25:50'),
(3, 1560000, '2018-05-07', 1, 'sdg', 4, 0, NULL, 1, '2018-05-07 09:45:47'),
(4, 100000, '2018-05-08', 4, 'Termin 1', 5, 0, NULL, 1, '2018-05-07 10:22:18'),
(5, 230000, '2018-05-08', 4, 'Done', 5, 0, NULL, 1, '2018-05-07 10:23:04');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7,2) NOT NULL,
  `total_days` decimal(5,2) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `reason` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `checked_at` datetime DEFAULT NULL,
  `checked_by` int(11) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `title`, `status`, `color`, `description`, `deleted`) VALUES
(1, 'Casual Leave', 'active', '#83c340', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_assets`
--

CREATE TABLE `master_assets` (
  `id` int(11) NOT NULL,
  `activa_code` varchar(100) NOT NULL,
  `activa_type` varchar(100) NOT NULL,
  `activa_age` int(11) NOT NULL,
  `activa_pricing` double NOT NULL,
  `asset_residu` double NOT NULL,
  `depreciated_method` varchar(100) NOT NULL,
  `activa_account` int(11) NOT NULL,
  `activa_depreciate_account` int(11) NOT NULL,
  `activa_expense_depre_account` int(11) NOT NULL,
  `get_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_assets`
--

INSERT INTO `master_assets` (`id`, `activa_code`, `activa_type`, `activa_age`, `activa_pricing`, `asset_residu`, `depreciated_method`, `activa_account`, `activa_depreciate_account`, `activa_expense_depre_account`, `get_date`, `created_at`, `deleted`) VALUES
(1, 'AS18001', 'Bangunan', 20, 14500000, 0, 'Garis_Lurus', 21, 24, 51, '2017-12-28', '2018-05-04 07:18:48', 0),
(2, 'AS18002', 'Bangunan', 20, 1000000, 100000, 'Garis_Lurus', 21, 24, 51, '2017-12-28', '2018-05-27 16:05:51', 0),
(3, 'AS18003', 'Tanah', 20, 430000000, 0, 'Garis_Lurus', 22, 24, 51, '2014-07-24', '2018-05-30 01:20:50', 0),
(4, 'AS18004', 'Tanah', 20, 150000000, 1000000, 'Garis_Lurus', 6, 7, 51, '2018-05-30', '2018-05-30 04:11:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_customers`
--

CREATE TABLE `master_customers` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `credit_limit` double NOT NULL,
  `memo` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_customers`
--

INSERT INTO `master_customers` (`id`, `code`, `name`, `company_name`, `npwp`, `address`, `city`, `state`, `zip`, `country`, `termin`, `email`, `mobile`, `contact`, `credit_limit`, `memo`, `created_at`, `deleted`) VALUES
(1, 'CS18001', 'DIan Nugraha', '', 'DIan Nugraha', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', '', '', '', '', '30', 'nugashare@gmail.com', '85710433300', '085710433300', 100000, '', '2018-05-25 12:37:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_items`
--

CREATE TABLE `master_items` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_items`
--

INSERT INTO `master_items` (`id`, `title`, `code`, `unit_type`, `category`, `price`, `deleted`) VALUES
(1, 'Tiket Pesawat Garuda', '1241242', 'Domestic', 'Akomodasi', 700000, 0),
(2, 'Tiket Pesawat ', '82322', 'Umrah', 'Akomodasi', 1000000, 0),
(3, 'Tiket Kereta', '12125', 'Domestic', 'Transport', 300000, 0),
(4, 'Shuttle Bus', '', 'lainnya', 'Transport', 500000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_project`
--

CREATE TABLE `master_project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_project`
--

INSERT INTO `master_project` (`id`, `project_name`, `created_at`, `deleted`) VALUES
(1, 'Trip To Bali', '2018-05-08 04:21:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_saldo_awal`
--

CREATE TABLE `master_saldo_awal` (
  `id` int(11) NOT NULL,
  `fid_coa` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `date` date NOT NULL,
  `debet` double NOT NULL,
  `credit` double NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_saldo_awal`
--

INSERT INTO `master_saldo_awal` (`id`, `fid_coa`, `periode`, `date`, `debet`, `credit`, `deleted`) VALUES
(2, 4, 2018, '2018-05-30', 250818491, 0, 1),
(3, 5, 2018, '2018-05-30', 158412586, 0, 1),
(4, 39, 2018, '2018-05-30', 0, 409231077, 1),
(5, 66, 2013, '2013-06-30', 4587179, 0, 0),
(6, 4, 2013, '2013-06-30', 121880384, 0, 0),
(7, 12, 2013, '2013-06-30', 264040350, 0, 0),
(8, 76, 2013, '2013-06-30', 1021031906, 0, 0),
(9, 15, 2013, '2013-06-30', 199493898, 0, 0),
(10, 19, 2013, '2013-06-30', 3000000, 0, 0),
(11, 77, 2013, '2013-06-30', 59269910, 0, 0),
(12, 22, 2013, '2013-06-30', 248852000, 0, 0),
(13, 69, 2013, '2013-06-30', 0, 139936600, 0),
(14, 71, 2013, '2013-06-30', 45000000, 0, 1),
(15, 27, 2013, '2013-06-30', 0, 93265009, 1),
(16, 33, 2013, '2013-06-30', 0, 100000000, 0),
(17, 34, 2013, '2013-06-30', 0, 99692000, 0),
(18, 78, 2013, '2013-06-30', 0, 465000000, 0),
(19, 37, 2013, '2013-06-30', 0, 255000000, 0),
(20, 39, 2013, '2013-06-30', 0, 880000000, 0),
(21, 42, 2013, '2013-06-30', 65737982, 0, 0),
(22, 69, 2018, '2018-06-09', 0, 100000, 0),
(23, 44, 2018, '2018-06-09', 0, 20000, 0),
(24, 44, 2018, '2018-06-09', 0, 0, 1),
(25, 7, 2018, '2018-06-09', 100000, 0, 0),
(26, 3, 2018, '2018-07-11', 0, 330000, 0),
(27, 3, 2018, '2018-07-11', 0, 24000, 1),
(28, 3, 2018, '2018-07-11', 0, 330000, 1),
(29, 9, 2018, '2018-07-11', 330000, 0, 0),
(30, 3, 2018, '2018-07-11', 0, 330000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_vendor`
--

CREATE TABLE `master_vendor` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `npwp` varchar(30) NOT NULL,
  `address` varchar(250) NOT NULL,
  `termin` varchar(100) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `credit_limit` double NOT NULL,
  `memo` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_vendor`
--

INSERT INTO `master_vendor` (`id`, `code`, `name`, `company_name`, `npwp`, `address`, `termin`, `contact`, `city`, `state`, `zip`, `country`, `email`, `mobile_number`, `credit_limit`, `memo`, `image`, `deleted`, `created_at`) VALUES
(1, 'VD18001', 'Vendor Dian Nugraha', '', '111111111111', 'Parung Bogor', '30', '085710433300', '', '', '', '', 'nugashare@gmail.com', '85710433300', 100000, '', '', 0, '2018-05-25 12:35:57'),
(2, 'VD18002', 'Qwash Indonesia Jaya', '', '12425253636', 'Ruko Parakan 8E, Jl parakan pamulang 2', '30', '085778805131', '', '', '', '', 'qwash.indonesia@gmail.com', '85778805131', 1000000, '', '', 0, '2018-06-05 16:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` enum('unread','read') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int(11) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted_by_users` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `subject`, `message`, `created_at`, `from_user_id`, `to_user_id`, `status`, `message_id`, `deleted`, `files`, `deleted_by_users`) VALUES
(1, 'Testing', 'Mas Ini Sudah Mulai Kah ????', '2017-08-17 12:06:17', 2, 1, 'read', 0, 0, 'a:0:{}', ''),
(2, '', 'Iya Mas Sudah', '2017-08-17 12:06:47', 1, 2, 'read', 1, 0, 'a:0:{}', ''),
(3, '', 'Oke Mas Terima Kasih :D', '2017-08-17 12:10:02', 2, 1, 'read', 1, 0, 'a:0:{}', ''),
(4, 'Test', 'Data', '2018-04-27 12:48:01', 5, 1, 'read', 0, 0, 'a:0:{}', '');

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `title`, `project_id`, `due_date`, `description`, `deleted`) VALUES
(1, 'Input data Tahap 1', 1, '2017-08-20', 'proses input data tahap 1', 0),
(2, 'Design UI/UX HTML', 2, '2017-09-11', 'Design ALL Pages and User Interfacing', 0),
(3, 'Database Design', 2, '2017-09-13', 'Database Management and design table', 0),
(4, 'Backend And Admin Panel', 2, '2017-09-16', 'Deploy Web Administration and Integration Data Master Of All CRUD', 0),
(5, 'Front End Including', 2, '2017-09-17', 'Front End Integration With Database And Scratching Data UI/UX', 0),
(6, 'Unit Testing', 2, '2017-09-21', 'Unit Acceptance Testing', 0),
(7, 'Analisa Kebutuhan', 3, '2018-03-19', '', 0),
(8, 'Analisa Perancangan', 3, '2018-03-26', '', 0),
(9, 'Implementasi Modul', 3, '2018-04-02', '', 0),
(10, 'Implementasi Fitur', 3, '2018-04-09', '', 0),
(11, 'Implementasi Laporan', 3, '2018-04-30', '', 0),
(12, 'Bugs & Testing (FIXING)', 3, '2018-05-07', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `created_by`, `created_at`, `title`, `description`, `project_id`, `client_id`, `user_id`, `labels`, `deleted`) VALUES
(1, 1, '2017-08-17 12:39:12', ' test notes', 'ini isi notes nya', 0, 0, 0, 'data', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `notify_to` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `project_comment_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `ticket_comment_id` int(11) NOT NULL,
  `project_file_id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL,
  `actual_message_id` int(11) NOT NULL,
  `parent_message_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `description`, `created_at`, `notify_to`, `read_by`, `event`, `project_id`, `task_id`, `project_comment_id`, `ticket_id`, `ticket_comment_id`, `project_file_id`, `leave_id`, `post_id`, `to_user_id`, `activity_log_id`, `client_id`, `invoice_payment_id`, `invoice_id`, `estimate_id`, `estimate_request_id`, `actual_message_id`, `parent_message_id`, `deleted`) VALUES
(1, 1, '', '2017-08-16 11:18:58', '', '', 'project_task_created', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '', '2017-08-17 12:19:00', '1', ',1', 'project_task_commented', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, '', '2017-08-17 13:21:04', '3', '', 'project_member_added', 1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, '', '2017-08-21 09:29:18', '3', '', 'project_file_added', 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, '', '2017-09-11 10:20:33', '', '', 'project_task_created', 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '', '2017-09-11 10:20:50', '3', '', 'project_member_added', 2, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, '', '2017-09-11 10:21:09', '3', '', 'project_task_updated', 2, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 1, '', '2017-09-11 10:22:37', '3', '', 'project_task_created', 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 1, '', '2017-09-11 10:23:38', '3', '', 'project_task_created', 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 1, '', '2017-09-11 10:27:32', '3', '', 'project_task_updated', 2, 2, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 1, '', '2017-09-11 10:27:40', '3', '', 'project_task_updated', 2, 3, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, '', '2017-09-11 10:27:47', '3', '', 'project_task_updated', 2, 4, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 1, '', '2017-09-11 10:30:22', '3', '', 'project_file_added', 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 1, '', '2017-09-11 10:35:02', '3', '', 'project_task_created', 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 1, '', '2017-09-11 10:37:56', '3', '', 'project_task_created', 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 1, '', '2017-09-11 10:39:04', '3', '', 'project_task_updated', 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 1, '', '2017-09-11 10:39:20', '3', '', 'project_task_updated', 2, 4, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 1, '', '2017-09-11 10:40:03', '3', '', 'project_task_updated', 2, 2, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 1, '', '2017-09-11 10:40:15', '3', '', 'project_task_updated', 2, 4, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 1, '', '2017-09-11 10:40:22', '3', '', 'project_task_updated', 2, 5, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 1, '', '2017-09-11 10:40:36', '3', '', 'project_task_updated', 2, 6, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 1, '', '2017-09-11 10:42:43', '3', '', 'project_task_created', 2, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 1, '', '2017-09-11 10:43:08', '3', '', 'project_task_updated', 2, 7, 0, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 1, '', '2017-09-11 10:43:44', '3', '', 'project_task_updated', 2, 7, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 1, '', '2018-03-18 17:15:37', '', '', 'project_task_created', 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 1, '', '2018-03-18 17:15:58', '', '', 'project_task_updated', 3, 8, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 1, '', '2018-03-18 17:16:52', '', '', 'project_task_created', 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 1, '', '2018-03-18 17:17:19', '', '', 'project_task_updated', 3, 9, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 1, '', '2018-03-18 17:21:02', '', '', 'project_task_created', 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 1, '', '2018-03-18 17:21:46', '', '', 'project_task_created', 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 1, '', '2018-03-18 17:22:22', '', '', 'project_task_created', 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 1, '', '2018-03-18 17:23:37', '', '', 'project_task_created', 3, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 1, '', '2018-03-18 17:24:23', '', '', 'project_task_created', 3, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 1, '', '2018-03-18 17:25:35', '', '', 'project_task_updated', 3, 9, 0, 0, 0, 0, 0, 0, 0, 46, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 1, '', '2018-03-18 17:26:34', '', '', 'project_task_updated', 3, 13, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 1, '', '2018-03-18 17:26:55', '', '', 'project_task_updated', 3, 14, 0, 0, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 1, '', '2018-03-18 17:27:18', '', '', 'project_task_updated', 3, 10, 0, 0, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 1, '', '2018-03-18 17:30:56', '', '', 'project_task_created', 3, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 1, '', '2018-03-18 17:33:21', '', '', 'project_task_created', 3, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 1, '', '2018-03-18 17:34:08', '', '', 'project_task_created', 3, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 1, '', '2018-03-18 17:35:36', '', '', 'project_task_created', 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 1, '', '2018-03-18 17:36:32', '', '', 'project_task_created', 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 1, '', '2018-03-18 17:37:03', '', '', 'project_task_updated', 3, 19, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 1, '', '2018-03-18 17:37:54', '', '', 'project_task_created', 3, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 1, '', '2018-03-18 17:39:04', '', '', 'project_task_created', 3, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 1, '', '2018-03-18 17:40:13', '', '', 'project_task_created', 3, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 1, '', '2018-03-18 17:41:13', '', '', 'project_task_updated', 3, 22, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 1, '', '2018-03-18 17:41:25', '', '', 'project_task_created', 3, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 1, '', '2018-03-18 17:41:35', '', '', 'project_task_updated', 3, 23, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 1, '', '2018-03-18 17:42:19', '', '', 'project_task_created', 3, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 1, '', '2018-03-18 17:43:18', '', '', 'project_task_created', 3, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 1, '', '2018-03-18 17:44:02', '', '', 'project_task_updated', 3, 25, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 1, '', '2018-03-18 17:46:20', '', '', 'project_task_created', 3, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 1, '', '2018-03-18 17:47:11', '', '', 'project_task_updated', 3, 15, 0, 0, 0, 0, 0, 0, 0, 71, 0, 0, 0, 0, 0, 0, 0, 0),
(55, 1, '', '2018-03-18 17:49:34', '', '', 'project_task_created', 3, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(56, 1, '', '2018-03-18 17:50:05', '', '', 'project_task_created', 3, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(57, 1, '', '2018-03-18 17:50:38', '', '', 'project_task_created', 3, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, 1, '', '2018-03-18 17:52:26', '', '', 'project_task_created', 3, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(59, 1, '', '2018-03-18 17:53:10', '', '', 'project_task_created', 3, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, 1, '', '2018-03-18 17:53:52', '', '', 'project_task_created', 3, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, 1, '', '2018-03-18 17:54:32', '', '', 'project_task_created', 3, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(62, 1, '', '2018-03-18 17:54:58', '', '', 'project_task_created', 3, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(63, 1, '', '2018-03-18 17:55:27', '', '', 'project_task_updated', 3, 27, 0, 0, 0, 0, 0, 0, 0, 82, 0, 0, 0, 0, 0, 0, 0, 0),
(64, 1, '', '2018-03-18 17:55:53', '', '', 'project_task_updated', 3, 28, 0, 0, 0, 0, 0, 0, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0),
(65, 1, '', '2018-03-18 17:56:05', '', '', 'project_task_updated', 3, 33, 0, 0, 0, 0, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0),
(66, 1, '', '2018-03-18 17:56:14', '', '', 'project_task_updated', 3, 34, 0, 0, 0, 0, 0, 0, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0),
(67, 1, '', '2018-03-18 17:56:27', '', '', 'project_task_updated', 3, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, 1, '', '2018-03-18 17:56:39', '', '', 'project_task_updated', 3, 26, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0),
(69, 1, '', '2018-03-18 17:56:58', '', '', 'project_task_updated', 3, 32, 0, 0, 0, 0, 0, 0, 0, 87, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` int(11) NOT NULL,
  `event` varchar(250) NOT NULL,
  `category` varchar(50) NOT NULL,
  `enable_email` int(1) NOT NULL DEFAULT '0',
  `enable_web` int(1) NOT NULL DEFAULT '0',
  `notify_to_team` text NOT NULL,
  `notify_to_team_members` text NOT NULL,
  `notify_to_terms` text NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `event`, `category`, `enable_email`, `enable_web`, `notify_to_team`, `notify_to_team_members`, `notify_to_terms`, `sort`, `deleted`) VALUES
(1, 'project_created', 'project', 0, 0, '', '', '', 1, 0),
(2, 'project_deleted', 'project', 0, 0, '', '', '', 2, 0),
(3, 'project_task_created', 'project', 0, 1, '', '', 'project_members,task_assignee', 3, 0),
(4, 'project_task_updated', 'project', 0, 1, '', '', 'task_assignee', 4, 0),
(5, 'project_task_assigned', 'project', 0, 1, '', '', 'task_assignee', 5, 0),
(7, 'project_task_started', 'project', 0, 0, '', '', '', 7, 0),
(8, 'project_task_finished', 'project', 0, 0, '', '', '', 8, 0),
(9, 'project_task_reopened', 'project', 0, 0, '', '', '', 9, 0),
(10, 'project_task_deleted', 'project', 0, 1, '', '', 'task_assignee', 10, 0),
(11, 'project_task_commented', 'project', 0, 1, '', '', 'task_assignee', 11, 0),
(12, 'project_member_added', 'project', 0, 1, '', '', 'project_members', 12, 0),
(13, 'project_member_deleted', 'project', 0, 1, '', '', 'project_members', 13, 0),
(14, 'project_file_added', 'project', 0, 1, '', '', 'project_members', 14, 0),
(15, 'project_file_deleted', 'project', 0, 1, '', '', 'project_members', 15, 0),
(16, 'project_file_commented', 'project', 0, 1, '', '', 'project_members', 16, 0),
(17, 'project_comment_added', 'project', 0, 1, '', '', 'project_members', 17, 0),
(18, 'project_comment_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 18, 0),
(19, 'project_customer_feedback_added', 'project', 0, 1, '', '', 'project_members', 19, 0),
(20, 'project_customer_feedback_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 20, 0),
(21, 'client_signup', 'client', 0, 0, '', '', '', 21, 0),
(22, 'invoice_online_payment_received', 'invoice', 1, 1, '', '1', '', 22, 0),
(23, 'leave_application_submitted', 'leave', 0, 0, '', '', '', 23, 0),
(24, 'leave_approved', 'leave', 0, 1, '', '', 'leave_applicant', 24, 0),
(25, 'leave_assigned', 'leave', 0, 1, '', '', 'leave_applicant', 25, 0),
(26, 'leave_rejected', 'leave', 0, 1, '', '', 'leave_applicant', 26, 0),
(27, 'leave_canceled', 'leave', 0, 0, '', '', '', 27, 0),
(28, 'ticket_created', 'ticket', 0, 0, '', '', '', 28, 0),
(29, 'ticket_commented', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 29, 0),
(30, 'ticket_closed', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 30, 0),
(31, 'ticket_reopened', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 31, 0),
(32, 'estimate_request_received', 'estimate', 0, 0, '', '', '', 32, 0),
(33, 'estimate_sent', 'estimate', 0, 0, '', '', '', 33, 0),
(34, 'estimate_accepted', 'estimate', 0, 0, '', '', '', 34, 0),
(35, 'estimate_rejected', 'estimate', 0, 0, '', '', '', 35, 0),
(36, 'new_message_sent', 'message', 0, 0, '', '', '', 36, 0),
(37, 'message_reply_sent', 'message', 0, 0, '', '', '', 37, 0),
(38, 'invoice_payment_confirmation', 'invoice', 0, 0, '', '', '', 22, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT '0',
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_payment_amount` double NOT NULL DEFAULT '0',
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `type`, `description`, `online_payable`, `available_on_invoice`, `minimum_payment_amount`, `settings`, `deleted`) VALUES
(1, 'Cash', 'custom', 'Cash payments', 0, 0, 0, 'a:0:{}', 0),
(2, 'Stripe', 'stripe', 'Stripe online payments', 1, 0, 0, 'a:3:{s:15:\"pay_button_text\";s:6:\"Stripe\";s:10:\"secret_key\";s:6:\"\";s:15:\"publishable_key\";s:6:\"\";}', 0),
(3, 'PayPal Payments Standard', 'paypal_payments_standard', 'PayPal Payments Standard Online Payments', 1, 0, 0, 'a:4:{s:15:\"pay_button_text\";s:6:\"PayPal\";s:5:\"email\";s:4:\"\";s:11:\"paypal_live\";s:1:\"0\";s:5:\"debug\";s:1:\"0\";}', 0),
(4, 'Bank Transfers', 'custom', 'BCA A/n Dian Nugraha', 0, 0, 0, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL,
  `transaction_id` tinytext COLLATE utf8_unicode_ci,
  `ipn_hash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ipn_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `share_with` text COLLATE utf8_unicode_ci,
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `created_by`, `created_at`, `description`, `post_id`, `share_with`, `files`, `deleted`) VALUES
(1, 1, '2017-08-17 12:21:12', 'Nice To Meet You', 0, '', 'a:0:{}', 0),
(2, 1, '2017-08-18 01:09:27', 'Tour And Travels', 0, '', 'a:1:{i:0;a:2:{s:9:\"file_name\";s:75:\"timeline_post_file59963e470f9e3-Khazzanah-Tour-Travel-Umroh-Haji-banner.jpg\";s:9:\"file_size\";s:6:\"151123\";}}', 0),
(3, 1, '2018-05-19 22:16:01', ',lll', 0, '', 'a:0:{}', 0),
(4, 1, '2018-05-19 22:16:10', 'l;;;', 0, '', 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `status` enum('open','completed','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text COLLATE utf8_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `starred_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `start_date`, `deadline`, `client_id`, `created_date`, `created_by`, `status`, `labels`, `price`, `starred_by`, `deleted`) VALUES
(1, 'Kamardagang Content Input Data', 'Mengisi Data Form Bisnis ', '2017-08-21', '2017-12-31', 1, '2017-08-16', 1, 'open', 'KDG', 4000000, ',:3:', 0),
(2, 'Proyek Web Company Profiles Askara Int', 'Pembuatan Website Profil Perusahaan PT Askara Internal\nhttp://demo.bitsolution.web.id/askarainternal', '2017-09-11', '2017-09-21', 2, '2017-09-11', 1, 'open', 'Company Profile', 6400000, '', 0),
(3, 'Management Travel Advanced', 'Sistem Aplikasi Website Management Travel Advanced Dengan Laporan Akuntansi', '2018-03-19', '2018-05-01', 3, '2018-03-18', 1, 'open', '', 30000000, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

CREATE TABLE `project_comments` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `customer_feedback_id` int(11) NOT NULL DEFAULT '0',
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_comments`
--

INSERT INTO `project_comments` (`id`, `created_by`, `created_at`, `description`, `project_id`, `comment_id`, `task_id`, `file_id`, `customer_feedback_id`, `files`, `deleted`) VALUES
(1, 2, '2017-08-17 12:19:00', 'Oke Mantap', 1, 0, 1, 0, 0, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` int(11) NOT NULL,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_files`
--

INSERT INTO `project_files` (`id`, `file_name`, `description`, `file_size`, `created_at`, `project_id`, `uploaded_by`, `deleted`) VALUES
(1, '_file599aa7ee8258c-ayo-bayar-zakat.jpg', '', 13525, '2017-08-21 09:29:18', 1, 1, 0),
(2, '_file59b665be62cab-PROPOSAL-PENAWARAN.docx', '', 145053, '2017-09-11 10:30:22', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_leader` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_members`
--

INSERT INTO `project_members` (`id`, `user_id`, `project_id`, `is_leader`, `deleted`) VALUES
(1, 1, 1, 1, 0),
(2, 3, 1, 0, 0),
(3, 1, 2, 1, 0),
(4, 3, 2, 0, 0),
(5, 1, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_settings`
--

CREATE TABLE `project_settings` (
  `project_id` int(11) NOT NULL,
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_time`
--

CREATE TABLE `project_time` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` enum('open','logged','approved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logged',
  `note` text COLLATE utf8_unicode_ci,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_time`
--

INSERT INTO `project_time` (`id`, `project_id`, `user_id`, `start_time`, `end_time`, `status`, `note`, `task_id`, `deleted`) VALUES
(1, 1, 3, '2017-08-17 13:22:38', '2017-08-17 14:12:04', 'logged', 'sdf', 1, 0),
(2, 1, 3, '2017-08-17 13:23:00', '2017-08-17 15:00:00', 'logged', 'input data sudah selesai', 1, 0),
(3, 2, 1, '2017-09-11 10:30:00', '2018-03-18 17:06:25', 'logged', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoices`
--

CREATE TABLE `purchase_invoices` (
  `id` int(11) NOT NULL,
  `fid_order` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `inv_address` varchar(250) NOT NULL,
  `delivery_address` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL,
  `paid` varchar(100) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `inv_date` datetime NOT NULL,
  `currency` varchar(10) NOT NULL,
  `amount` double NOT NULL,
  `residual` double NOT NULL,
  `last_email_sent_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_invoices`
--

INSERT INTO `purchase_invoices` (`id`, `fid_order`, `code`, `fid_cust`, `inv_address`, `delivery_address`, `status`, `paid`, `fid_tax`, `email_to`, `inv_date`, `currency`, `amount`, `residual`, `last_email_sent_date`, `created_at`, `deleted`) VALUES
(1, 1, '001/RAN/INV/180605', 2, 'Ruko Parakan 8E, Jl parakan pamulang 2', 'Ruko Parakan 8E, Jl parakan pamulang 2', 'posting', 'PAID', 1, 'qwash.indonesia@gmail.com', '2018-06-05 00:00:00', 'IDR', 330000, 0, NULL, '2018-06-05 18:42:16', 0),
(2, 1, '004/RAN/INV/180711', 2, 'Ruko Parakan 8E, Jl parakan pamulang 2', 'Ruko Parakan 8E, Jl parakan pamulang 2', 'draft', 'Not Paid', 0, 'qwash.indonesia@gmail.com', '2018-07-11 00:00:00', 'IDR', 0, 0, NULL, '2018-07-11 07:51:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoices_items`
--

CREATE TABLE `purchase_invoices_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_invoices` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_invoices_items`
--

INSERT INTO `purchase_invoices_items` (`id`, `title`, `description`, `category`, `quantity`, `unit_type`, `rate`, `total`, `fid_invoices`, `deleted`) VALUES
(1, 'Tiket Kereta', 'ini deskripsi', 'Akomodasi', 1, 'Domestic', 300000, 300000, 1, 0),
(2, 'Tiket Kereta', 'ini deskripsi', 'Akomodasi', 1, 'Domestic', 300000, 300000, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `fid_quot` int(11) NOT NULL,
  `inv_address` varchar(250) NOT NULL,
  `delivery_address` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `exp_date` date NOT NULL,
  `currency` varchar(10) NOT NULL,
  `last_email_sent_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`id`, `code`, `fid_cust`, `fid_quot`, `inv_address`, `delivery_address`, `status`, `fid_tax`, `email_to`, `exp_date`, `currency`, `last_email_sent_date`, `created_at`, `deleted`) VALUES
(1, '003/RAN/ORD/180605', 2, 1, 'Ruko Parakan 8E, Jl parakan pamulang 2', 'Ruko Parakan 8E, Jl parakan pamulang 2', 'draft', 1, 'qwash.indonesia@gmail.com', '2018-06-05', 'IDR', NULL, '2018-06-05 16:08:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_order` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `title`, `description`, `category`, `quantity`, `unit_type`, `rate`, `total`, `fid_order`, `deleted`) VALUES
(1, 'Tiket Kereta', 'ini deskripsi', 'Akomodasi', 1, 'Domestic', 300000, 300000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` int(11) NOT NULL,
  `code` varchar(250) NOT NULL,
  `fid_inv` int(11) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `paid` varchar(50) NOT NULL,
  `pay_date` datetime NOT NULL,
  `fid_bank` int(11) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `residu` double NOT NULL,
  `memo` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `code`, `fid_inv`, `fid_cust`, `paid`, `pay_date`, `fid_bank`, `fid_tax`, `currency`, `amount`, `residu`, `memo`, `created_at`, `deleted`) VALUES
(1, '001/RAN/PAY/180605', 1, 2, 'PAID', '2018-06-05 00:00:00', 66, 1, 'IDR', 330000, 0, 'dfj', '2018-06-05 18:42:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request`
--

CREATE TABLE `purchase_request` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `fid_vendor` int(11) NOT NULL,
  `inv_address` varchar(250) NOT NULL,
  `delivery_address` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `exp_date` datetime NOT NULL,
  `currency` varchar(10) NOT NULL,
  `last_email_sent_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase_request`
--

INSERT INTO `purchase_request` (`id`, `code`, `fid_vendor`, `inv_address`, `delivery_address`, `status`, `fid_tax`, `email_to`, `exp_date`, `currency`, `last_email_sent_date`, `created_at`, `deleted`) VALUES
(1, '001/RAN/REQ/180605', 2, 'Ruko Parakan 8E, Jl parakan pamulang 2', 'Ruko Parakan 8E, Jl parakan pamulang 2', 'draft', 1, 'qwash.indonesia@gmail.com', '0000-00-00 00:00:00', 'IDR', NULL, '2018-06-05 16:06:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request_items`
--

CREATE TABLE `purchase_request_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_quotation` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `purchase_request_items`
--

INSERT INTO `purchase_request_items` (`id`, `title`, `description`, `category`, `quantity`, `unit_type`, `rate`, `total`, `fid_quotation`, `deleted`) VALUES
(1, 'Tiket Kereta', 'ini deskripsi', 'Akomodasi', 1, 'Domestic', 300000, 300000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ref_items_category`
--

CREATE TABLE `ref_items_category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_items_category`
--

INSERT INTO `ref_items_category` (`id`, `category`, `deleted`) VALUES
(1, 'Akomodasi', 0),
(2, 'Transportasi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ref_jenis`
--

CREATE TABLE `ref_jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_jenis`
--

INSERT INTO `ref_jenis` (`id_jenis`, `nama`) VALUES
(1, 'kabupaten'),
(2, 'kota'),
(3, 'kelurahan'),
(4, 'desa');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kabupaten`
--

CREATE TABLE `ref_kabupaten` (
  `id_kab` char(4) NOT NULL,
  `id_prov` char(2) NOT NULL,
  `nama` tinytext NOT NULL,
  `id_jenis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kabupaten`
--

INSERT INTO `ref_kabupaten` (`id_kab`, `id_prov`, `nama`, `id_jenis`) VALUES
('1101', '11', 'KAB. ACEH SELATAN', 1),
('1102', '11', 'KAB. ACEH TENGGARA', 1),
('1103', '11', 'KAB. ACEH TIMUR', 1),
('1104', '11', 'KAB. ACEH TENGAH', 1),
('1105', '11', 'KAB. ACEH BARAT', 1),
('1106', '11', 'KAB. ACEH BESAR', 1),
('1107', '11', 'KAB. PIDIE', 1),
('1108', '11', 'KAB. ACEH UTARA', 1),
('1109', '11', 'KAB. SIMEULUE', 1),
('1110', '11', 'KAB. ACEH SINGKIL', 1),
('1111', '11', 'KAB. BIREUEN', 1),
('1112', '11', 'KAB. ACEH BARAT DAYA', 1),
('1113', '11', 'KAB. GAYO LUES', 1),
('1114', '11', 'KAB. ACEH JAYA', 1),
('1115', '11', 'KAB. NAGAN RAYA', 1),
('1116', '11', 'KAB. ACEH TAMIANG', 1),
('1117', '11', 'KAB. BENER MERIAH', 1),
('1118', '11', 'KAB. PIDIE JAYA', 1),
('1171', '11', 'KOTA BANDA ACEH', 2),
('1172', '11', 'KOTA SABANG', 2),
('1173', '11', 'KOTA LHOKSEUMAWE', 2),
('1174', '11', 'KOTA LANGSA', 2),
('1175', '11', 'KOTA SUBULUSSALAM', 2),
('1201', '12', 'KAB. TAPANULI TENGAH', 1),
('1202', '12', 'KAB. TAPANULI UTARA', 1),
('1203', '12', 'KAB. TAPANULI SELATAN', 1),
('1204', '12', 'KAB. NIAS', 1),
('1205', '12', 'KAB. LANGKAT', 1),
('1206', '12', 'KAB. KARO', 1),
('1207', '12', 'KAB. DELI SERDANG', 1),
('1208', '12', 'KAB. SIMALUNGUN', 1),
('1209', '12', 'KAB. ASAHAN', 1),
('1210', '12', 'KAB. LABUHANBATU', 1),
('1211', '12', 'KAB. DAIRI', 1),
('1212', '12', 'KAB. TOBA SAMOSIR', 1),
('1213', '12', 'KAB. MANDAILING NATAL', 1),
('1214', '12', 'KAB. NIAS SELATAN', 1),
('1215', '12', 'KAB. PAKPAK BHARAT', 1),
('1216', '12', 'KAB. HUMBANG HASUNDUTAN', 1),
('1217', '12', 'KAB. SAMOSIR', 1),
('1218', '12', 'KAB. SERDANG BEDAGAI', 1),
('1219', '12', 'KAB. BATU BARA', 1),
('1220', '12', 'KAB. PADANG LAWAS UTARA', 1),
('1221', '12', 'KAB. PADANG LAWAS', 1),
('1222', '12', 'KAB. LABUHANBATU SELATAN', 1),
('1223', '12', 'KAB. LABUHANBATU UTARA', 1),
('1224', '12', 'KAB. NIAS UTARA', 1),
('1225', '12', 'KAB. NIAS BARAT', 1),
('1271', '12', 'KOTA MEDAN', 2),
('1272', '12', 'KOTA PEMATANG SIANTAR', 2),
('1273', '12', 'KOTA SIBOLGA', 2),
('1274', '12', 'KOTA TANJUNG BALAI', 2),
('1275', '12', 'KOTA BINJAI', 2),
('1276', '12', 'KOTA TEBING TINGGI', 2),
('1277', '12', 'KOTA PADANGSIDIMPUAN', 2),
('1278', '12', 'KOTA GUNUNGSITOLI', 2),
('1301', '13', 'KAB. PESISIR SELATAN', 1),
('1302', '13', 'KAB. SOLOK', 1),
('1303', '13', 'KAB. SIJUNJUNG', 1),
('1304', '13', 'KAB. TANAH DATAR', 1),
('1305', '13', 'KAB. PADANG PARIAMAN', 1),
('1306', '13', 'KAB. AGAM', 1),
('1307', '13', 'KAB. LIMA PULUH KOTA', 1),
('1308', '13', 'KAB. PASAMAN', 1),
('1309', '13', 'KAB. KEPULAUAN MENTAWAI', 1),
('1310', '13', 'KAB. DHARMASRAYA', 1),
('1311', '13', 'KAB. SOLOK SELATAN', 1),
('1312', '13', 'KAB. PASAMAN BARAT', 1),
('1371', '13', 'KOTA PADANG', 2),
('1372', '13', 'KOTA SOLOK', 2),
('1373', '13', 'KOTA SAWAHLUNTO', 2),
('1374', '13', 'KOTA PADANG PANJANG', 2),
('1375', '13', 'KOTA BUKITTINGGI', 2),
('1376', '13', 'KOTA PAYAKUMBUH', 2),
('1377', '13', 'KOTA PARIAMAN', 2),
('1401', '14', 'KAB. KAMPAR', 1),
('1402', '14', 'KAB. INDRAGIRI HULU', 1),
('1403', '14', 'KAB. BENGKALIS', 1),
('1404', '14', 'KAB. INDRAGIRI HILIR', 1),
('1405', '14', 'KAB. PELALAWAN', 1),
('1406', '14', 'KAB. ROKAN HULU', 1),
('1407', '14', 'KAB. ROKAN HILIR', 1),
('1408', '14', 'KAB. SIAK', 1),
('1409', '14', 'KAB. KUANTAN SINGINGI', 1),
('1410', '14', 'KAB. KEPULAUAN MERANTI', 1),
('1471', '14', 'KOTA PEKANBARU', 2),
('1472', '14', 'KOTA DUMAI', 2),
('1501', '15', 'KAB. KERINCI', 1),
('1502', '15', 'KAB. MERANGIN', 1),
('1503', '15', 'KAB. SAROLANGUN', 1),
('1504', '15', 'KAB. BATANGHARI', 1),
('1505', '15', 'KAB. MUARO JAMBI', 1),
('1506', '15', 'KAB. TANJUNG JABUNG BARAT', 1),
('1507', '15', 'KAB. TANJUNG JABUNG TIMUR', 1),
('1508', '15', 'KAB. BUNGO', 1),
('1509', '15', 'KAB. TEBO', 1),
('1571', '15', 'KOTA JAMBI', 2),
('1572', '15', 'KOTA SUNGAI PENUH', 2),
('1601', '16', 'KAB. OGAN KOMERING ULU', 1),
('1602', '16', 'KAB. OGAN KOMERING ILIR', 1),
('1603', '16', 'KAB. MUARA ENIM', 1),
('1604', '16', 'KAB. LAHAT', 1),
('1605', '16', 'KAB. MUSI RAWAS', 1),
('1606', '16', 'KAB. MUSI BANYUASIN', 1),
('1607', '16', 'KAB. BANYUASIN', 1),
('1608', '16', 'KAB. OGAN KOMERING ULU TIMUR', 1),
('1609', '16', 'KAB. OGAN KOMERING ULU SELATAN', 1),
('1610', '16', 'KAB. OGAN ILIR', 1),
('1611', '16', 'KAB. EMPAT LAWANG', 1),
('1612', '16', 'KAB. PENUKAL ABAB LEMATANG ILIR', 1),
('1613', '16', 'KAB. MUSI RAWAS UTARA', 1),
('1671', '16', 'KOTA PALEMBANG', 2),
('1672', '16', 'KOTA PAGAR ALAM', 2),
('1673', '16', 'KOTA LUBUK LINGGAU', 2),
('1674', '16', 'KOTA PRABUMULIH', 2),
('1701', '17', 'KAB. BENGKULU SELATAN', 1),
('1702', '17', 'KAB. REJANG LEBONG', 1),
('1703', '17', 'KAB. BENGKULU UTARA', 1),
('1704', '17', 'KAB. KAUR', 1),
('1705', '17', 'KAB. SELUMA', 1),
('1706', '17', 'KAB. MUKO MUKO', 1),
('1707', '17', 'KAB. LEBONG', 1),
('1708', '17', 'KAB. KEPAHIANG', 1),
('1709', '17', 'KAB. BENGKULU TENGAH', 1),
('1771', '17', 'KOTA BENGKULU', 2),
('1801', '18', 'KAB. LAMPUNG SELATAN', 1),
('1802', '18', 'KAB. LAMPUNG TENGAH', 1),
('1803', '18', 'KAB. LAMPUNG UTARA', 1),
('1804', '18', 'KAB. LAMPUNG BARAT', 1),
('1805', '18', 'KAB. TULANG BAWANG', 1),
('1806', '18', 'KAB. TANGGAMUS', 1),
('1807', '18', 'KAB. LAMPUNG TIMUR', 1),
('1808', '18', 'KAB. WAY KANAN', 1),
('1809', '18', 'KAB. PESAWARAN', 1),
('1810', '18', 'KAB. PRINGSEWU', 1),
('1811', '18', 'KAB. MESUJI', 1),
('1812', '18', 'KAB. TULANG BAWANG BARAT', 1),
('1813', '18', 'KAB. PESISIR BARAT', 1),
('1871', '18', 'KOTA BANDAR LAMPUNG', 2),
('1872', '18', 'KOTA METRO', 2),
('1901', '19', 'KAB. BANGKA', 1),
('1902', '19', 'KAB. BELITUNG', 1),
('1903', '19', 'KAB. BANGKA SELATAN', 1),
('1904', '19', 'KAB. BANGKA TENGAH', 1),
('1905', '19', 'KAB. BANGKA BARAT', 1),
('1906', '19', 'KAB. BELITUNG TIMUR', 1),
('1971', '19', 'KOTA PANGKAL PINANG', 2),
('2101', '21', 'KAB. BINTAN', 1),
('2102', '21', 'KAB. KARIMUN', 1),
('2103', '21', 'KAB. NATUNA', 1),
('2104', '21', 'KAB. LINGGA', 1),
('2105', '21', 'KAB. KEPULAUAN ANAMBAS', 1),
('2171', '21', 'KOTA BATAM', 2),
('2172', '21', 'KOTA TANJUNG PINANG', 2),
('3101', '31', 'KAB. ADM. KEP. SERIBU', 1),
('3171', '31', 'KOTA ADM. JAKARTA PUSAT', 2),
('3172', '31', 'KOTA ADM. JAKARTA UTARA', 2),
('3173', '31', 'KOTA ADM. JAKARTA BARAT', 2),
('3174', '31', 'KOTA ADM. JAKARTA SELATAN', 2),
('3175', '31', 'KOTA ADM. JAKARTA TIMUR', 2),
('3201', '32', 'KAB. BOGOR', 1),
('3202', '32', 'KAB. SUKABUMI', 1),
('3203', '32', 'KAB. CIANJUR', 1),
('3204', '32', 'KAB. BANDUNG', 1),
('3205', '32', 'KAB. GARUT', 1),
('3206', '32', 'KAB. TASIKMALAYA', 1),
('3207', '32', 'KAB. CIAMIS', 1),
('3208', '32', 'KAB. KUNINGAN', 1),
('3209', '32', 'KAB. CIREBON', 1),
('3210', '32', 'KAB. MAJALENGKA', 1),
('3211', '32', 'KAB. SUMEDANG', 1),
('3212', '32', 'KAB. INDRAMAYU', 1),
('3213', '32', 'KAB. SUBANG', 1),
('3214', '32', 'KAB. PURWAKARTA', 1),
('3215', '32', 'KAB. KARAWANG', 1),
('3216', '32', 'KAB. BEKASI', 1),
('3217', '32', 'KAB. BANDUNG BARAT', 1),
('3218', '32', 'KAB. PANGANDARAN', 1),
('3271', '32', 'KOTA BOGOR', 2),
('3272', '32', 'KOTA SUKABUMI', 2),
('3273', '32', 'KOTA BANDUNG', 2),
('3274', '32', 'KOTA CIREBON', 2),
('3275', '32', 'KOTA BEKASI', 2),
('3276', '32', 'KOTA DEPOK', 2),
('3277', '32', 'KOTA CIMAHI', 2),
('3278', '32', 'KOTA TASIKMALAYA', 2),
('3279', '32', 'KOTA BANJAR', 2),
('3301', '33', 'KAB. CILACAP', 1),
('3302', '33', 'KAB. BANYUMAS', 1),
('3303', '33', 'KAB. PURBALINGGA', 1),
('3304', '33', 'KAB. BANJARNEGARA', 1),
('3305', '33', 'KAB. KEBUMEN', 1),
('3306', '33', 'KAB. PURWOREJO', 1),
('3307', '33', 'KAB. WONOSOBO', 1),
('3308', '33', 'KAB. MAGELANG', 1),
('3309', '33', 'KAB. BOYOLALI', 1),
('3310', '33', 'KAB. KLATEN', 1),
('3311', '33', 'KAB. SUKOHARJO', 1),
('3312', '33', 'KAB. WONOGIRI', 1),
('3313', '33', 'KAB. KARANGANYAR', 1),
('3314', '33', 'KAB. SRAGEN', 1),
('3315', '33', 'KAB. GROBOGAN', 1),
('3316', '33', 'KAB. BLORA', 1),
('3317', '33', 'KAB. REMBANG', 1),
('3318', '33', 'KAB. PATI', 1),
('3319', '33', 'KAB. KUDUS', 1),
('3320', '33', 'KAB. JEPARA', 1),
('3321', '33', 'KAB. DEMAK', 1),
('3322', '33', 'KAB. SEMARANG', 1),
('3323', '33', 'KAB. TEMANGGUNG', 1),
('3324', '33', 'KAB. KENDAL', 1),
('3325', '33', 'KAB. BATANG', 1),
('3326', '33', 'KAB. PEKALONGAN', 1),
('3327', '33', 'KAB. PEMALANG', 1),
('3328', '33', 'KAB. TEGAL', 1),
('3329', '33', 'KAB. BREBES', 1),
('3371', '33', 'KOTA MAGELANG', 2),
('3372', '33', 'KOTA SURAKARTA', 2),
('3373', '33', 'KOTA SALATIGA', 2),
('3374', '33', 'KOTA SEMARANG', 2),
('3375', '33', 'KOTA PEKALONGAN', 2),
('3376', '33', 'KOTA TEGAL', 2),
('3401', '34', 'KAB. KULON PROGO', 1),
('3402', '34', 'KAB. BANTUL', 1),
('3403', '34', 'KAB. GUNUNG KIDUL', 1),
('3404', '34', 'KAB. SLEMAN', 1),
('3471', '34', 'KOTA YOGYAKARTA', 2),
('3501', '35', 'KAB. PACITAN', 1),
('3502', '35', 'KAB. PONOROGO', 1),
('3503', '35', 'KAB. TRENGGALEK', 1),
('3504', '35', 'KAB. TULUNGAGUNG', 1),
('3505', '35', 'KAB. BLITAR', 1),
('3506', '35', 'KAB. KEDIRI', 1),
('3507', '35', 'KAB. MALANG', 1),
('3508', '35', 'KAB. LUMAJANG', 1),
('3509', '35', 'KAB. JEMBER', 1),
('3510', '35', 'KAB. BANYUWANGI', 1),
('3511', '35', 'KAB. BONDOWOSO', 1),
('3512', '35', 'KAB. SITUBONDO', 1),
('3513', '35', 'KAB. PROBOLINGGO', 1),
('3514', '35', 'KAB. PASURUAN', 1),
('3515', '35', 'KAB. SIDOARJO', 1),
('3516', '35', 'KAB. MOJOKERTO', 1),
('3517', '35', 'KAB. JOMBANG', 1),
('3518', '35', 'KAB. NGANJUK', 1),
('3519', '35', 'KAB. MADIUN', 1),
('3520', '35', 'KAB. MAGETAN', 1),
('3521', '35', 'KAB. NGAWI', 1),
('3522', '35', 'KAB. BOJONEGORO', 1),
('3523', '35', 'KAB. TUBAN', 1),
('3524', '35', 'KAB. LAMONGAN', 1),
('3525', '35', 'KAB. GRESIK', 1),
('3526', '35', 'KAB. BANGKALAN', 1),
('3527', '35', 'KAB. SAMPANG', 1),
('3528', '35', 'KAB. PAMEKASAN', 1),
('3529', '35', 'KAB. SUMENEP', 1),
('3571', '35', 'KOTA KEDIRI', 2),
('3572', '35', 'KOTA BLITAR', 2),
('3573', '35', 'KOTA MALANG', 2),
('3574', '35', 'KOTA PROBOLINGGO', 2),
('3575', '35', 'KOTA PASURUAN', 2),
('3576', '35', 'KOTA MOJOKERTO', 2),
('3577', '35', 'KOTA MADIUN', 2),
('3578', '35', 'KOTA SURABAYA', 2),
('3579', '35', 'KOTA BATU', 2),
('3601', '36', 'KAB. PANDEGLANG', 1),
('3602', '36', 'KAB. LEBAK', 1),
('3603', '36', 'KAB. TANGERANG', 1),
('3604', '36', 'KAB. SERANG', 1),
('3671', '36', 'KOTA TANGERANG', 2),
('3672', '36', 'KOTA CILEGON', 2),
('3673', '36', 'KOTA SERANG', 2),
('3674', '36', 'KOTA TANGERANG SELATAN', 2),
('5101', '51', 'KAB. JEMBRANA', 1),
('5102', '51', 'KAB. TABANAN', 1),
('5103', '51', 'KAB. BADUNG', 1),
('5104', '51', 'KAB. GIANYAR', 1),
('5105', '51', 'KAB. KLUNGKUNG', 1),
('5106', '51', 'KAB. BANGLI', 1),
('5107', '51', 'KAB. KARANGASEM', 1),
('5108', '51', 'KAB. BULELENG', 1),
('5171', '51', 'KOTA DENPASAR', 2),
('5201', '52', 'KAB. LOMBOK BARAT', 1),
('5202', '52', 'KAB. LOMBOK TENGAH', 1),
('5203', '52', 'KAB. LOMBOK TIMUR', 1),
('5204', '52', 'KAB. SUMBAWA', 1),
('5205', '52', 'KAB. DOMPU', 1),
('5206', '52', 'KAB. BIMA', 1),
('5207', '52', 'KAB. SUMBAWA BARAT', 1),
('5208', '52', 'KAB. LOMBOK UTARA', 1),
('5271', '52', 'KOTA MATARAM', 2),
('5272', '52', 'KOTA BIMA', 2),
('5301', '53', 'KAB. KUPANG', 1),
('5302', '53', 'KAB TIMOR TENGAH SELATAN', 1),
('5303', '53', 'KAB. TIMOR TENGAH UTARA', 1),
('5304', '53', 'KAB. BELU', 1),
('5305', '53', 'KAB. ALOR', 1),
('5306', '53', 'KAB. FLORES TIMUR', 1),
('5307', '53', 'KAB. SIKKA', 1),
('5308', '53', 'KAB. ENDE', 1),
('5309', '53', 'KAB. NGADA', 1),
('5310', '53', 'KAB. MANGGARAI', 1),
('5311', '53', 'KAB. SUMBA TIMUR', 1),
('5312', '53', 'KAB. SUMBA BARAT', 1),
('5313', '53', 'KAB. LEMBATA', 1),
('5314', '53', 'KAB. ROTE NDAO', 1),
('5315', '53', 'KAB. MANGGARAI BARAT', 1),
('5316', '53', 'KAB. NAGEKEO', 1),
('5317', '53', 'KAB. SUMBA TENGAH', 1),
('5318', '53', 'KAB. SUMBA BARAT DAYA', 1),
('5319', '53', 'KAB. MANGGARAI TIMUR', 1),
('5320', '53', 'KAB. SABU RAIJUA', 1),
('5321', '53', 'KAB. MALAKA', 1),
('5371', '53', 'KOTA KUPANG', 2),
('6101', '61', 'KAB. SAMBAS', 1),
('6102', '61', 'KAB. MEMPAWAH', 1),
('6103', '61', 'KAB. SANGGAU', 1),
('6104', '61', 'KAB. KETAPANG', 1),
('6105', '61', 'KAB. SINTANG', 1),
('6106', '61', 'KAB. KAPUAS HULU', 1),
('6107', '61', 'KAB. BENGKAYANG', 1),
('6108', '61', 'KAB. LANDAK', 1),
('6109', '61', 'KAB. SEKADAU', 1),
('6110', '61', 'KAB. MELAWI', 1),
('6111', '61', 'KAB. KAYONG UTARA', 1),
('6112', '61', 'KAB. KUBU RAYA', 1),
('6171', '61', 'KOTA PONTIANAK', 2),
('6172', '61', 'KOTA SINGKAWANG', 2),
('6201', '62', 'KAB. KOTAWARINGIN BARAT', 1),
('6202', '62', 'KAB. KOTAWARINGIN TIMUR', 1),
('6203', '62', 'KAB. KAPUAS', 1),
('6204', '62', 'KAB. BARITO SELATAN', 1),
('6205', '62', 'KAB. BARITO UTARA', 1),
('6206', '62', 'KAB. KATINGAN', 1),
('6207', '62', 'KAB. SERUYAN', 1),
('6208', '62', 'KAB. SUKAMARA', 1),
('6209', '62', 'KAB. LAMANDAU', 1),
('6210', '62', 'KAB. GUNUNG MAS', 1),
('6211', '62', 'KAB. PULANG PISAU', 1),
('6212', '62', 'KAB. MURUNG RAYA', 1),
('6213', '62', 'KAB. BARITO TIMUR', 1),
('6271', '62', 'KOTA PALANGKARAYA', 2),
('6301', '63', 'KAB. TANAH LAUT', 1),
('6302', '63', 'KAB. KOTABARU', 1),
('6303', '63', 'KAB. BANJAR', 1),
('6304', '63', 'KAB. BARITO KUALA', 1),
('6305', '63', 'KAB. TAPIN', 1),
('6306', '63', 'KAB. HULU SUNGAI SELATAN', 1),
('6307', '63', 'KAB. HULU SUNGAI TENGAH', 1),
('6308', '63', 'KAB. HULU SUNGAI UTARA', 1),
('6309', '63', 'KAB. TABALONG', 1),
('6310', '63', 'KAB. TANAH BUMBU', 1),
('6311', '63', 'KAB. BALANGAN', 1),
('6371', '63', 'KOTA BANJARMASIN', 2),
('6372', '63', 'KOTA BANJARBARU', 2),
('6401', '64', 'KAB. PASER', 1),
('6402', '64', 'KAB. KUTAI KARTANEGARA', 1),
('6403', '64', 'KAB. BERAU', 1),
('6407', '64', 'KAB. KUTAI BARAT', 1),
('6408', '64', 'KAB. KUTAI TIMUR', 1),
('6409', '64', 'KAB. PENAJAM PASER UTARA', 1),
('6411', '64', 'KAB. MAHAKAM ULU', 1),
('6471', '64', 'KOTA BALIKPAPAN', 2),
('6472', '64', 'KOTA SAMARINDA', 2),
('6474', '64', 'KOTA BONTANG', 2),
('6501', '65', 'KAB. BULUNGAN', 1),
('6502', '65', 'KAB. MALINAU', 1),
('6503', '65', 'KAB. NUNUKAN', 1),
('6504', '65', 'KAB. TANA TIDUNG', 1),
('6571', '65', 'KOTA TARAKAN', 2),
('7101', '71', 'KAB. BOLAANG MONGONDOW', 1),
('7102', '71', 'KAB. MINAHASA', 1),
('7103', '71', 'KAB. KEPULAUAN SANGIHE', 1),
('7104', '71', 'KAB. KEPULAUAN TALAUD', 1),
('7105', '71', 'KAB. MINAHASA SELATAN', 1),
('7106', '71', 'KAB. MINAHASA UTARA', 1),
('7107', '71', 'KAB. MINAHASA TENGGARA', 1),
('7108', '71', 'KAB. BOLAANG MONGONDOW UTARA', 1),
('7109', '71', 'KAB. KEP. SIAU TAGULANDANG BIARO', 1),
('7110', '71', 'KAB. BOLAANG MONGONDOW TIMUR', 1),
('7111', '71', 'KAB. BOLAANG MONGONDOW SELATAN', 1),
('7171', '71', 'KOTA MANADO', 2),
('7172', '71', 'KOTA BITUNG', 2),
('7173', '71', 'KOTA TOMOHON', 2),
('7174', '71', 'KOTA KOTAMOBAGU', 2),
('7201', '72', 'KAB. BANGGAI', 1),
('7202', '72', 'KAB. POSO', 1),
('7203', '72', 'KAB. DONGGALA', 1),
('7204', '72', 'KAB. TOLI TOLI', 1),
('7205', '72', 'KAB. BUOL', 1),
('7206', '72', 'KAB. MOROWALI', 1),
('7207', '72', 'KAB. BANGGAI KEPULAUAN', 1),
('7208', '72', 'KAB. PARIGI MOUTONG', 1),
('7209', '72', 'KAB. TOJO UNA UNA', 1),
('7210', '72', 'KAB. SIGI', 1),
('7211', '72', 'KAB. BANGGAI LAUT', 1),
('7212', '72', 'KAB. MOROWALI UTARA', 1),
('7271', '72', 'KOTA PALU', 2),
('7301', '73', 'KAB. KEPULAUAN SELAYAR', 1),
('7302', '73', 'KAB. BULUKUMBA', 1),
('7303', '73', 'KAB. BANTAENG', 1),
('7304', '73', 'KAB. JENEPONTO', 1),
('7305', '73', 'KAB. TAKALAR', 1),
('7306', '73', 'KAB. GOWA', 1),
('7307', '73', 'KAB. SINJAI', 1),
('7308', '73', 'KAB. BONE', 1),
('7309', '73', 'KAB. MAROS', 1),
('7310', '73', 'KAB. PANGKAJENE KEPULAUAN', 1),
('7311', '73', 'KAB. BARRU', 1),
('7312', '73', 'KAB. SOPPENG', 1),
('7313', '73', 'KAB. WAJO', 1),
('7314', '73', 'KAB. SIDENRENG RAPPANG', 1),
('7315', '73', 'KAB. PINRANG', 1),
('7316', '73', 'KAB. ENREKANG', 1),
('7317', '73', 'KAB. LUWU', 1),
('7318', '73', 'KAB. TANA TORAJA', 1),
('7322', '73', 'KAB. LUWU UTARA', 1),
('7324', '73', 'KAB. LUWU TIMUR', 1),
('7326', '73', 'KAB. TORAJA UTARA', 1),
('7371', '73', 'KOTA MAKASSAR', 2),
('7372', '73', 'KOTA PARE PARE', 2),
('7373', '73', 'KOTA PALOPO', 2),
('7401', '74', 'KAB. KOLAKA', 1),
('7402', '74', 'KAB. KONAWE', 1),
('7403', '74', 'KAB. MUNA', 1),
('7404', '74', 'KAB. BUTON', 1),
('7405', '74', 'KAB. KONAWE SELATAN', 1),
('7406', '74', 'KAB. BOMBANA', 1),
('7407', '74', 'KAB. WAKATOBI', 1),
('7408', '74', 'KAB. KOLAKA UTARA', 1),
('7409', '74', 'KAB. KONAWE UTARA', 1),
('7410', '74', 'KAB. BUTON UTARA', 1),
('7411', '74', 'KAB. KOLAKA TIMUR', 1),
('7412', '74', 'KAB. KONAWE KEPULAUAN', 1),
('7413', '74', 'KAB. MUNA BARAT', 1),
('7414', '74', 'KAB. BUTON TENGAH', 1),
('7415', '74', 'KAB. BUTON SELATAN', 1),
('7471', '74', 'KOTA KENDARI', 2),
('7472', '74', 'KOTA BAU BAU', 2),
('7501', '75', 'KAB. GORONTALO', 1),
('7502', '75', 'KAB. BOALEMO', 1),
('7503', '75', 'KAB. BONE BOLANGO', 1),
('7504', '75', 'KAB. PAHUWATO', 1),
('7505', '75', 'KAB. GORONTALO UTARA', 1),
('7571', '75', 'KOTA GORONTALO', 2),
('7601', '76', 'KAB. MAMUJU UTARA', 1),
('7602', '76', 'KAB. MAMUJU', 1),
('7603', '76', 'KAB. MAMASA', 1),
('7604', '76', 'KAB. POLEWALI MANDAR', 1),
('7605', '76', 'KAB. MAJENE', 1),
('7606', '76', 'KAB. MAMUJU TENGAH', 1),
('8101', '81', 'KAB. MALUKU TENGAH', 1),
('8102', '81', 'KAB. MALUKU TENGGARA', 1),
('8103', '81', 'KAB MALUKU TENGGARA BARAT', 1),
('8104', '81', 'KAB. BURU', 1),
('8105', '81', 'KAB. SERAM BAGIAN TIMUR', 1),
('8106', '81', 'KAB. SERAM BAGIAN BARAT', 1),
('8107', '81', 'KAB. KEPULAUAN ARU', 1),
('8108', '81', 'KAB. MALUKU BARAT DAYA', 1),
('8109', '81', 'KAB. BURU SELATAN', 1),
('8171', '81', 'KOTA AMBON', 2),
('8172', '81', 'KOTA TUAL', 2),
('8201', '82', 'KAB. HALMAHERA BARAT', 1),
('8202', '82', 'KAB. HALMAHERA TENGAH', 1),
('8203', '82', 'KAB. HALMAHERA UTARA', 1),
('8204', '82', 'KAB. HALMAHERA SELATAN', 1),
('8205', '82', 'KAB. KEPULAUAN SULA', 1),
('8206', '82', 'KAB. HALMAHERA TIMUR', 1),
('8207', '82', 'KAB. PULAU MOROTAI', 1),
('8208', '82', 'KAB. PULAU TALIABU', 1),
('8271', '82', 'KOTA TERNATE', 2),
('8272', '82', 'KOTA TIDORE KEPULAUAN', 2),
('9101', '91', 'KAB. MERAUKE', 1),
('9102', '91', 'KAB. JAYAWIJAYA', 1),
('9103', '91', 'KAB. JAYAPURA', 1),
('9104', '91', 'KAB. NABIRE', 1),
('9105', '91', 'KAB. KEPULAUAN YAPEN', 1),
('9106', '91', 'KAB. BIAK NUMFOR', 1),
('9107', '91', 'KAB. PUNCAK JAYA', 1),
('9108', '91', 'KAB. PANIAI', 1),
('9109', '91', 'KAB. MIMIKA', 1),
('9110', '91', 'KAB. SARMI', 1),
('9111', '91', 'KAB. KEEROM', 1),
('9112', '91', 'KAB PEGUNUNGAN BINTANG', 1),
('9113', '91', 'KAB. YAHUKIMO', 1),
('9114', '91', 'KAB. TOLIKARA', 1),
('9115', '91', 'KAB. WAROPEN', 1),
('9116', '91', 'KAB. BOVEN DIGOEL', 1),
('9117', '91', 'KAB. MAPPI', 1),
('9118', '91', 'KAB. ASMAT', 1),
('9119', '91', 'KAB. SUPIORI', 1),
('9120', '91', 'KAB. MAMBERAMO RAYA', 1),
('9121', '91', 'KAB. MAMBERAMO TENGAH', 1),
('9122', '91', 'KAB. YALIMO', 1),
('9123', '91', 'KAB. LANNY JAYA', 1),
('9124', '91', 'KAB. NDUGA', 1),
('9125', '91', 'KAB. PUNCAK', 1),
('9126', '91', 'KAB. DOGIYAI', 1),
('9127', '91', 'KAB. INTAN JAYA', 1),
('9128', '91', 'KAB. DEIYAI', 1),
('9171', '91', 'KOTA JAYAPURA', 2),
('9201', '92', 'KAB. SORONG', 1),
('9202', '92', 'KAB. MANOKWARI', 1),
('9203', '92', 'KAB. FAK FAK', 1),
('9204', '92', 'KAB. SORONG SELATAN', 1),
('9205', '92', 'KAB. RAJA AMPAT', 1),
('9206', '92', 'KAB. TELUK BINTUNI', 1),
('9207', '92', 'KAB. TELUK WONDAMA', 1),
('9208', '92', 'KAB. KAIMANA', 1),
('9209', '92', 'KAB. TAMBRAUW', 1),
('9210', '92', 'KAB. MAYBRAT', 1),
('9211', '92', 'KAB. MANOKWARI SELATAN', 1),
('9212', '92', 'KAB. PEGUNUNGAN ARFAK', 1),
('9271', '92', 'KOTA SORONG', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ref_kecamatan`
--

CREATE TABLE `ref_kecamatan` (
  `id_kec` char(6) NOT NULL,
  `id_kab` char(4) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kecamatan`
--

INSERT INTO `ref_kecamatan` (`id_kec`, `id_kab`, `nama`) VALUES
('110101', '1101', 'Bakongan'),
('110102', '1101', 'Kluet Utara'),
('110103', '1101', 'Kluet Selatan'),
('110104', '1101', 'Labuhan Haji'),
('110105', '1101', 'Meukek'),
('110106', '1101', 'Samadua'),
('110107', '1101', 'Sawang'),
('110108', '1101', 'Tapaktuan'),
('110109', '1101', 'Trumon'),
('110110', '1101', 'Pasi Raja'),
('110111', '1101', 'Labuhan Haji Timur'),
('110112', '1101', 'Labuhan Haji Barat'),
('110113', '1101', 'Kluet Tengah'),
('110114', '1101', 'Kluet Timur'),
('110115', '1101', 'Bakongan Timur'),
('110116', '1101', 'Trumon Timur'),
('110117', '1101', 'Kota Bahagia'),
('110118', '1101', 'Trumon Tengah'),
('110201', '1102', 'Lawe Alas'),
('110202', '1102', 'Lawe Sigala-Gala'),
('110203', '1102', 'Bambel'),
('110204', '1102', 'Babussalam'),
('110205', '1102', 'Badar'),
('110206', '1102', 'Babul Makmur'),
('110207', '1102', 'Darul Hasanah'),
('110208', '1102', 'Lawe Bulan'),
('110209', '1102', 'Bukit Tusam'),
('110210', '1102', 'Semadam'),
('110211', '1102', 'Babul Rahmah'),
('110212', '1102', 'Ketambe'),
('110213', '1102', 'Deleng Pokhkisen'),
('110214', '1102', 'Lawe Sumur'),
('110215', '1102', 'Tanoh Alas'),
('110216', '1102', 'Leuser'),
('110301', '1103', 'Darul Aman'),
('110302', '1103', 'Julok'),
('110303', '1103', 'Idi Rayeuk'),
('110304', '1103', 'Birem Bayeun'),
('110305', '1103', 'Serbajadi'),
('110306', '1103', 'Nurussalam'),
('110307', '1103', 'Peureulak'),
('110308', '1103', 'Rantau Selamat'),
('110309', '1103', 'Simpang Ulim'),
('110310', '1103', 'Rantau Peureulak'),
('110311', '1103', 'Pante Bidari'),
('110312', '1103', 'Madat'),
('110313', '1103', 'Indra Makmu'),
('110314', '1103', 'Idi Tunong'),
('110315', '1103', 'Banda Alam'),
('110316', '1103', 'Peudawa'),
('110317', '1103', 'Peureulak Timur'),
('110318', '1103', 'Peureulak Barat'),
('110319', '1103', 'Sungai Raya'),
('110320', '1103', 'Simpang Jernih'),
('110321', '1103', 'Darul Ihsan'),
('110322', '1103', 'Darul Falah'),
('110323', '1103', 'Idi Timur'),
('110324', '1103', 'Peunaron'),
('110401', '1104', 'Linge'),
('110402', '1104', 'Silih Nara'),
('110403', '1104', 'Bebesen'),
('110407', '1104', 'Pegasing'),
('110408', '1104', 'Bintang'),
('110410', '1104', 'Ketol'),
('110411', '1104', 'Kebayakan'),
('110412', '1104', 'Kute Panang'),
('110413', '1104', 'Celala'),
('110417', '1104', 'Laut Tawar'),
('110418', '1104', 'Atu Lintang'),
('110419', '1104', 'Jagong Jeget'),
('110420', '1104', 'Bies'),
('110421', '1104', 'Rusip Antara'),
('110501', '1105', 'Johan Pahwalan'),
('110502', '1105', 'Kaway XVI'),
('110503', '1105', 'Sungai Mas'),
('110504', '1105', 'Woyla'),
('110505', '1105', 'Samatiga'),
('110506', '1105', 'Bubon'),
('110507', '1105', 'Arongan Lambalek'),
('110508', '1105', 'Pante Ceureumen'),
('110509', '1105', 'Meureubo'),
('110510', '1105', 'Woyla Barat'),
('110511', '1105', 'Woyla Timur'),
('110512', '1105', 'Panton Reu'),
('110601', '1106', 'Lhoong'),
('110602', '1106', 'Lhoknga'),
('110603', '1106', 'Indrapuri'),
('110604', '1106', 'Seulimeum'),
('110605', '1106', 'Montasik'),
('110606', '1106', 'Sukamakmur'),
('110607', '1106', 'Darul Imarah'),
('110608', '1106', 'Peukan Bada'),
('110609', '1106', 'Mesjid Raya'),
('110610', '1106', 'Ingin Jaya'),
('110611', '1106', 'Kuta Baro'),
('110612', '1106', 'Darussalam'),
('110613', '1106', 'Pulo Aceh'),
('110614', '1106', 'Lembah Seulawah'),
('110615', '1106', 'Kota Jantho'),
('110616', '1106', 'Kota Cot Glie'),
('110617', '1106', 'Kuta Malaka'),
('110618', '1106', 'Simpang Tiga'),
('110619', '1106', 'Darul Kamal'),
('110620', '1106', 'Baitussalam'),
('110621', '1106', 'Krueng Barona Jaya'),
('110622', '1106', 'Leupung'),
('110623', '1106', 'Blang Bintang'),
('110703', '1107', 'Batee'),
('110704', '1107', 'Delima'),
('110705', '1107', 'Geumpang'),
('110706', '1107', 'Geulumpang Tiga'),
('110707', '1107', 'Indra Jaya'),
('110708', '1107', 'Kembang Tanjong'),
('110709', '1107', 'Kota Sigli'),
('110711', '1107', 'Mila'),
('110712', '1107', 'Muara Tiga'),
('110713', '1107', 'Mutiara'),
('110714', '1107', 'Padang Tiji'),
('110715', '1107', 'Peukan Baro'),
('110716', '1107', 'Pidie'),
('110717', '1107', 'Sakti'),
('110718', '1107', 'Simpang Tiga'),
('110719', '1107', 'Tangse'),
('110721', '1107', 'Tiro/Truseb'),
('110722', '1107', 'Keumala'),
('110724', '1107', 'Mutiara Timur'),
('110725', '1107', 'Grong-grong'),
('110727', '1107', 'Mane'),
('110729', '1107', 'Glumpang Baro'),
('110731', '1107', 'Titeue'),
('110801', '1108', 'Baktiya'),
('110802', '1108', 'Dewantara'),
('110803', '1108', 'Kuta Makmur'),
('110804', '1108', 'Lhoksukon'),
('110805', '1108', 'Matangkuli'),
('110806', '1108', 'Muara Batu'),
('110807', '1108', 'Meurah Mulia'),
('110808', '1108', 'Samudera'),
('110809', '1108', 'Seunuddon'),
('110810', '1108', 'Syamtalira Aron'),
('110811', '1108', 'Syamtalira Bayu'),
('110812', '1108', 'Tanah Luas'),
('110813', '1108', 'Tanah Pasir'),
('110814', '1108', 'T. Jambo Aye'),
('110815', '1108', 'Sawang'),
('110816', '1108', 'Nisam'),
('110817', '1108', 'Cot Girek'),
('110818', '1108', 'Langkahan'),
('110819', '1108', 'Baktiya Barat'),
('110820', '1108', 'Paya Bakong'),
('110821', '1108', 'Nibong'),
('110822', '1108', 'Simpang Kramat'),
('110823', '1108', 'Lapang'),
('110824', '1108', 'Pirak Timur'),
('110825', '1108', 'Geuredong Pase'),
('110826', '1108', 'Banda Baro'),
('110827', '1108', 'Nisam Antara'),
('110901', '1109', 'Simeulue Tengah'),
('110902', '1109', 'Salang'),
('110903', '1109', 'Teupah Barat'),
('110904', '1109', 'Simeulue Timur'),
('110905', '1109', 'Teluk Dalam'),
('110906', '1109', 'Simeulue Barat'),
('110907', '1109', 'Teupah Selatan'),
('110908', '1109', 'Alapan'),
('110909', '1109', 'Teupah Tengah'),
('110910', '1109', 'Simeulue Cut'),
('111001', '1110', 'Pulau Banyak'),
('111002', '1110', 'Simpang Kanan'),
('111004', '1110', 'Singkil'),
('111006', '1110', 'Gunung Meriah'),
('111009', '1110', 'Kota Baharu'),
('111010', '1110', 'Singkil Utara'),
('111011', '1110', 'Danau Paris'),
('111012', '1110', 'Suro Makmur'),
('111013', '1110', 'Singkohor'),
('111014', '1110', 'Kuala Baru'),
('111016', '1110', 'Pulau Banyak Barat'),
('111101', '1111', 'Samalanga'),
('111102', '1111', 'Jeunieb'),
('111103', '1111', 'Peudada'),
('111104', '1111', 'Jeumpa'),
('111105', '1111', 'Peusangan'),
('111106', '1111', 'Makmur'),
('111107', '1111', 'Gandapura'),
('111108', '1111', 'Pandrah'),
('111109', '1111', 'Juli'),
('111110', '1111', 'Jangka'),
('111111', '1111', 'Simpang Mamplam'),
('111112', '1111', 'Peulimbang'),
('111113', '1111', 'Kota Juang'),
('111114', '1111', 'Kuala'),
('111115', '1111', 'Peusangan Siblah Krueng'),
('111116', '1111', 'Peusangan Selatan'),
('111117', '1111', 'Kuta Blang'),
('111201', '1112', 'Blang Pidie'),
('111202', '1112', 'Tangan-Tangan'),
('111203', '1112', 'Manggeng'),
('111204', '1112', 'Susoh'),
('111205', '1112', 'Kuala Batee'),
('111206', '1112', 'Babah Rot'),
('111207', '1112', 'Setia'),
('111208', '1112', 'Jeumpa'),
('111209', '1112', 'Lembah Sabil'),
('111301', '1113', 'Blangkejeren'),
('111302', '1113', 'Kutapanjang'),
('111303', '1113', 'Rikit Gaib'),
('111304', '1113', 'Terangun'),
('111305', '1113', 'Pining'),
('111306', '1113', 'Blangpegayon'),
('111307', '1113', 'Puteri Betung'),
('111308', '1113', 'Dabun Gelang'),
('111309', '1113', 'Blangjerango'),
('111310', '1113', 'Teripe Jaya'),
('111311', '1113', 'Pantan Cuaca'),
('111401', '1114', 'Teunom'),
('111402', '1114', 'Krueng Sabee'),
('111403', '1114', 'Setia Bhakti'),
('111404', '1114', 'Sampoiniet'),
('111405', '1114', 'Jaya'),
('111406', '1114', 'Panga'),
('111407', '1114', 'Indra Jaya'),
('111408', '1114', 'Darul Hikmah'),
('111409', '1114', 'Pasie Raya'),
('111501', '1115', 'Kuala'),
('111502', '1115', 'Seunagan'),
('111503', '1115', 'Seunagan Timur'),
('111504', '1115', 'Beutong'),
('111505', '1115', 'Darul Makmur'),
('111506', '1115', 'Suka Makmue'),
('111507', '1115', 'Kuala Pesisir'),
('111508', '1115', 'Tadu Raya'),
('111509', '1115', 'Tripa Makmur'),
('111510', '1115', 'Beutong Ateuh Banggalang'),
('111601', '1116', 'Manyak Payed'),
('111602', '1116', 'Bendahara'),
('111603', '1116', 'Karang Baru'),
('111604', '1116', 'Seruway'),
('111605', '1116', 'Kota Kualasinpang'),
('111606', '1116', 'Kejuruan Muda'),
('111607', '1116', 'Tamiang Hulu'),
('111608', '1116', 'Rantau'),
('111609', '1116', 'Banda Mulia'),
('111610', '1116', 'Bandar Pusaka'),
('111611', '1116', 'Tenggulun'),
('111612', '1116', 'Sekerak'),
('111701', '1117', 'Pintu Rime Gayo'),
('111702', '1117', 'Permata'),
('111703', '1117', 'Syiah Utama'),
('111704', '1117', 'Bandar'),
('111705', '1117', 'Bukit'),
('111706', '1117', 'Wih Pesam'),
('111707', '1117', 'Timang gajah'),
('111708', '1117', 'Bener Kelipah'),
('111709', '1117', 'Mesidah'),
('111710', '1117', 'Gajah Putih'),
('111801', '1118', 'Meureudu'),
('111802', '1118', 'Ulim'),
('111803', '1118', 'Jangka Buaya'),
('111804', '1118', 'Bandar Dua'),
('111805', '1118', 'Meurah Dua'),
('111806', '1118', 'Bandar Baru'),
('111807', '1118', 'Panteraja'),
('111808', '1118', 'Trienggadeng'),
('117101', '1171', 'Baiturrahman'),
('117102', '1171', 'Kuta Alam'),
('117103', '1171', 'Meuraxa'),
('117104', '1171', 'Syiah Kuala'),
('117105', '1171', 'Lueng Bata'),
('117106', '1171', 'Kuta Raja'),
('117107', '1171', 'Banda Raya'),
('117108', '1171', 'Jaya Baru'),
('117109', '1171', 'Ulee Kareng'),
('117201', '1172', 'Sukakarya'),
('117202', '1172', 'Sukajaya'),
('117301', '1173', 'Muara Dua'),
('117302', '1173', 'Banda Sakti'),
('117303', '1173', 'Blang Mangat'),
('117304', '1173', 'Muara Satu'),
('117401', '1174', 'Langsa Timur'),
('117402', '1174', 'Langsa Barat'),
('117403', '1174', 'Langsa Kota'),
('117404', '1174', 'Langsa Lama'),
('117405', '1174', 'Langsa Baro'),
('117501', '1175', 'Simpang Kiri'),
('117502', '1175', 'Penanggalan'),
('117503', '1175', 'Rundeng'),
('117504', '1175', 'Sultan Daulat'),
('117505', '1175', 'Longkib'),
('120101', '1201', 'Barus'),
('120102', '1201', 'Sorkam'),
('120103', '1201', 'Pandan'),
('120104', '1201', 'Pinangsori'),
('120105', '1201', 'Manduamas'),
('120106', '1201', 'Kolang'),
('120107', '1201', 'Tapian Nauli'),
('120108', '1201', 'Sibabangun'),
('120109', '1201', 'Sosor Gadong'),
('120110', '1201', 'Sorkam Barat'),
('120111', '1201', 'Sirandorung'),
('120112', '1201', 'Andam Dewi'),
('120113', '1201', 'Sitahuis'),
('120114', '1201', 'Tukka'),
('120115', '1201', 'Badiri'),
('120116', '1201', 'Pasaribu Tobing'),
('120117', '1201', 'Barus Utara'),
('120118', '1201', 'Suka Bangun'),
('120119', '1201', 'Lumut'),
('120120', '1201', 'Sarudik'),
('120201', '1202', 'Tarutung'),
('120202', '1202', 'Siatas Barita'),
('120203', '1202', 'Adian Koting'),
('120204', '1202', 'Sipoholon'),
('120205', '1202', 'Pahae Julu'),
('120206', '1202', 'Pahae Jae'),
('120207', '1202', 'Simangumban'),
('120208', '1202', 'Purba Tua'),
('120209', '1202', 'Siborong-Borong'),
('120210', '1202', 'Pagaran'),
('120211', '1202', 'Parmonangan'),
('120212', '1202', 'Sipahutar'),
('120213', '1202', 'Pangaribuan'),
('120214', '1202', 'Garoga'),
('120215', '1202', 'Muara'),
('120301', '1203', 'Angkola Barat'),
('120302', '1203', 'Batang Toru'),
('120303', '1203', 'Angkola Timur'),
('120304', '1203', 'Sipirok'),
('120305', '1203', 'Saipar Dolok Hole'),
('120306', '1203', 'Angkola Selatan'),
('120307', '1203', 'Batang Angkola'),
('120314', '1203', 'Arse'),
('120320', '1203', 'Marancar'),
('120321', '1203', 'Sayur Matinggi'),
('120322', '1203', 'Aek Bilah'),
('120329', '1203', 'Muara Batang Toru'),
('120330', '1203', 'Tano Tombangan Angkola'),
('120331', '1203', 'Angkola Sangkunur'),
('120405', '1204', 'Hiliduho'),
('120406', '1204', 'Gido'),
('120410', '1204', 'Idanogawo'),
('120411', '1204', 'Bawolato'),
('120420', '1204', 'Hiliserangkai'),
('120421', '1204', 'Botomuzoi'),
('120427', '1204', 'Ulugawo'),
('120428', '1204', 'Ma\'u'),
('120429', '1204', 'Somolo-molo'),
('120435', '1204', 'Sogae\'adu'),
('120501', '1205', 'Bahorok'),
('120502', '1205', 'Salapian'),
('120503', '1205', 'Kuala'),
('120504', '1205', 'Sei Bingei'),
('120505', '1205', 'Binjai'),
('120506', '1205', 'Selesai'),
('120507', '1205', 'Stabat'),
('120508', '1205', 'Wampu'),
('120509', '1205', 'Secanggang'),
('120510', '1205', 'Hinai'),
('120511', '1205', 'Tanjung Pura'),
('120512', '1205', 'Padang Tualang'),
('120513', '1205', 'Gebang'),
('120514', '1205', 'Babalan'),
('120515', '1205', 'Pangkalan Susu'),
('120516', '1205', 'Besitang'),
('120517', '1205', 'Sei Lepan'),
('120518', '1205', 'Brandan Barat'),
('120519', '1205', 'Batang Serangan'),
('120520', '1205', 'Sawit Seberang'),
('120521', '1205', 'Sirapit'),
('120522', '1205', 'Kutambaru'),
('120523', '1205', 'Pematang Jaya'),
('120601', '1206', 'Kabanjahe'),
('120602', '1206', 'Berastagi'),
('120603', '1206', 'Barusjahe'),
('120604', '1206', 'Tigapanah'),
('120605', '1206', 'Merek'),
('120606', '1206', 'Munte'),
('120607', '1206', 'Juhar'),
('120608', '1206', 'Tigabinanga'),
('120609', '1206', 'Laubaleng'),
('120610', '1206', 'Mardingding'),
('120611', '1206', 'Payung'),
('120612', '1206', 'Simpang Empat'),
('120613', '1206', 'Kutabuluh'),
('120614', '1206', 'Dolat Rayat'),
('120615', '1206', 'Merdeka'),
('120616', '1206', 'Naman Teran'),
('120617', '1206', 'Tiganderket'),
('120701', '1207', 'Gunung Meriah'),
('120702', '1207', 'Tanjung Morawa'),
('120703', '1207', 'Sibolangit'),
('120704', '1207', 'Kutalimbaru'),
('120705', '1207', 'Pancur Batu'),
('120706', '1207', 'Namorambe'),
('120707', '1207', 'Sibiru-biru'),
('120708', '1207', 'STM Hilir'),
('120709', '1207', 'Bangun Purba'),
('120719', '1207', 'Galang'),
('120720', '1207', 'STM Hulu'),
('120721', '1207', 'Patumbak'),
('120722', '1207', 'Deli Tua'),
('120723', '1207', 'Sunggal'),
('120724', '1207', 'Hamparan Perak'),
('120725', '1207', 'Labuhan Deli'),
('120726', '1207', 'Percut Sei Tuan'),
('120727', '1207', 'Batang Kuis'),
('120728', '1207', 'Lubuk Pakam'),
('120731', '1207', 'Pagar Merbau'),
('120732', '1207', 'Pantai Labu'),
('120733', '1207', 'Beringin'),
('120801', '1208', 'Siantar'),
('120802', '1208', 'Gunung Malela'),
('120803', '1208', 'Gunung Maligas'),
('120804', '1208', 'Panei'),
('120805', '1208', 'Panombeian Pane'),
('120806', '1208', 'Jorlang Hataran'),
('120807', '1208', 'Raya Kahean'),
('120808', '1208', 'Bosar Maligas'),
('120809', '1208', 'Sidamanik'),
('120810', '1208', 'Pematang Sidamanik'),
('120811', '1208', 'Tanah Jawa'),
('120812', '1208', 'Hatonduhan'),
('120813', '1208', 'Dolok Panribuan'),
('120814', '1208', 'Purba'),
('120815', '1208', 'Haranggaol Horison'),
('120816', '1208', 'Girsang Sipangan Bolon'),
('120817', '1208', 'Dolok Batu Nanggar'),
('120818', '1208', 'Huta Bayu Raja'),
('120819', '1208', 'Jawa Maraja Bah Jambi'),
('120820', '1208', 'Dolok Pardamean'),
('120821', '1208', 'Pematang Bandar'),
('120822', '1208', 'Bandar Huluan'),
('120823', '1208', 'Bandar'),
('120824', '1208', 'Bandar Masilam'),
('120825', '1208', 'Silimakuta'),
('120826', '1208', 'Dolok Silau'),
('120827', '1208', 'Silou Kahean'),
('120828', '1208', 'Tapian Dolok'),
('120829', '1208', 'Raya'),
('120830', '1208', 'Ujung Padang'),
('120831', '1208', 'Pamatang Silima Huta'),
('120908', '1209', 'Meranti'),
('120909', '1209', 'Air Joman'),
('120910', '1209', 'Tanjung Balai'),
('120911', '1209', 'Sei Kepayang'),
('120912', '1209', 'Simpang Empat'),
('120913', '1209', 'Air Batu'),
('120914', '1209', 'Pulau Rakyat'),
('120915', '1209', 'Bandar Pulau'),
('120916', '1209', 'Buntu Pane'),
('120917', '1209', 'Bandar Pasir Mandoge'),
('120918', '1209', 'Aek Kuasan'),
('120919', '1209', 'Kota Kisaran Barat'),
('120920', '1209', 'Kota Kisaran Timur'),
('120921', '1209', 'Aek Songsongan'),
('120922', '1209', 'Rahunig'),
('120923', '1209', 'Sei Dadap'),
('120924', '1209', 'Sei Kepayang Barat'),
('120925', '1209', 'Sei Kepayang Timur'),
('120926', '1209', 'Tinggi Raja'),
('120927', '1209', 'Setia Janji'),
('120928', '1209', 'Silau Laut'),
('120929', '1209', 'Rawang Panca Arga'),
('120930', '1209', 'Pulo Bandring'),
('120931', '1209', 'Teluk Dalam'),
('120932', '1209', 'Aek Ledong'),
('121001', '1210', 'Rantau Utara'),
('121002', '1210', 'Rantau Selatan'),
('121007', '1210', 'Bilah Barat'),
('121008', '1210', 'Bilah Hilir'),
('121009', '1210', 'Bilah Hulu'),
('121014', '1210', 'Pangkatan'),
('121018', '1210', 'Panai Tengah'),
('121019', '1210', 'Panai Hilir'),
('121020', '1210', 'Panai Hulu'),
('121101', '1211', 'Sidikalang'),
('121102', '1211', 'Sumbul'),
('121103', '1211', 'Tigalingga'),
('121104', '1211', 'Siempat Nempu'),
('121105', '1211', 'Silima Pungga Punga'),
('121106', '1211', 'Tanah Pinem'),
('121107', '1211', 'Siempat Nempu Hulu'),
('121108', '1211', 'Siempat Nempu Hilir'),
('121109', '1211', 'Pegagan Hilir'),
('121110', '1211', 'Parbuluan'),
('121111', '1211', 'Lae Parira'),
('121112', '1211', 'Gunung Sitember'),
('121113', '1211', 'Brampu'),
('121114', '1211', 'Silahisabungan'),
('121115', '1211', 'Sitinjo'),
('121201', '1212', 'Balige'),
('121202', '1212', 'Laguboti'),
('121203', '1212', 'Silaen'),
('121204', '1212', 'Habinsaran'),
('121205', '1212', 'Pintu Pohan Meranti'),
('121206', '1212', 'Borbor'),
('121207', '1212', 'Porsea'),
('121208', '1212', 'Ajibata'),
('121209', '1212', 'Lumban Julu'),
('121210', '1212', 'Uluan'),
('121219', '1212', 'Sigumpar'),
('121220', '1212', 'Siantar Narumonda'),
('121221', '1212', 'Nassau'),
('121222', '1212', 'Tampahan'),
('121223', '1212', 'Bonatua Lunasi'),
('121224', '1212', 'Parmaksian'),
('121301', '1213', 'Panyabungan'),
('121302', '1213', 'Panyabungan Utara'),
('121303', '1213', 'Panyabungan Timur'),
('121304', '1213', 'Panyabungan Selatan'),
('121305', '1213', 'Panyabungan Barat'),
('121306', '1213', 'Siabu'),
('121307', '1213', 'Bukit Malintang'),
('121308', '1213', 'Kotanopan'),
('121309', '1213', 'Lembah Sorik Marapi'),
('121310', '1213', 'Tambangan'),
('121311', '1213', 'Ulu Pungkut'),
('121312', '1213', 'Muara Sipongi'),
('121313', '1213', 'Batang Natal'),
('121314', '1213', 'Lingga Bayu'),
('121315', '1213', 'Batahan'),
('121316', '1213', 'Natal'),
('121317', '1213', 'Muara Batang Gadis'),
('121318', '1213', 'Ranto Baek'),
('121319', '1213', 'Huta Bargot'),
('121320', '1213', 'Puncak Sorik Marapi'),
('121321', '1213', 'Pakantan'),
('121322', '1213', 'Sinunukan'),
('121323', '1213', 'Naga Juang'),
('121401', '1214', 'Lolomatua'),
('121402', '1214', 'Gomo'),
('121403', '1214', 'Lahusa'),
('121404', '1214', 'Hibala'),
('121405', '1214', 'Pulau-Pulau Batu'),
('121406', '1214', 'Teluk Dalam'),
('121407', '1214', 'Amandraya'),
('121408', '1214', 'Lalowa\'u'),
('121409', '1214', 'Susua'),
('121410', '1214', 'Maniamolo'),
('121411', '1214', 'Hilimegai'),
('121412', '1214', 'Toma'),
('121413', '1214', 'Mazino'),
('121414', '1214', 'Umbunasi'),
('121415', '1214', 'Aramo'),
('121416', '1214', 'Pulau-Pulau Batu Timur'),
('121417', '1214', 'Mazo'),
('121418', '1214', 'Fanayama'),
('121419', '1214', 'Ulunoyo'),
('121420', '1214', 'Huruna'),
('121421', '1214', 'O\'o\'u'),
('121422', '1214', 'Onohazumba'),
('121423', '1214', 'Hilisalawa\'ahe'),
('121424', '1214', 'Ulususua'),
('121425', '1214', 'Sidua\'ori'),
('121426', '1214', 'Somambawa'),
('121427', '1214', 'Boronadu'),
('121428', '1214', 'Simuk'),
('121429', '1214', 'Pulau-Pulau Batu Barat'),
('121430', '1214', 'Pulau-Pulau Batu Utara'),
('121431', '1214', 'Tanah Masa'),
('121501', '1215', 'Sitelu Tali Urang Jehe'),
('121502', '1215', 'Kerajaan'),
('121503', '1215', 'Salak'),
('121504', '1215', 'Sitelu Tali Urang Julu'),
('121505', '1215', 'Pergetteng Getteng Sengkut'),
('121506', '1215', 'Pagindar'),
('121507', '1215', 'Tinada'),
('121508', '1215', 'Siempat Rube'),
('121601', '1216', 'Parlilitan'),
('121602', '1216', 'Pollung'),
('121603', '1216', 'Baktiraja'),
('121604', '1216', 'Paranginan'),
('121605', '1216', 'Lintong Nihuta'),
('121606', '1216', 'Dolok Sanggul'),
('121607', '1216', 'Sijamapolang'),
('121608', '1216', 'Onan Ganjang'),
('121609', '1216', 'Pakkat'),
('121610', '1216', 'Tarabintang'),
('121701', '1217', 'Simanindo'),
('121702', '1217', 'Onan Runggu'),
('121703', '1217', 'Nainggolan'),
('121704', '1217', 'Palipi'),
('121705', '1217', 'Harian'),
('121706', '1217', 'Sianjar Mula Mula'),
('121707', '1217', 'Ronggur Nihuta'),
('121708', '1217', 'Pangururan'),
('121709', '1217', 'Sitio-tio'),
('121801', '1218', 'Pantai Cermin'),
('121802', '1218', 'Perbaungan'),
('121803', '1218', 'Teluk Mengkudu'),
('121804', '1218', 'Sei. Rampah'),
('121805', '1218', 'Tanjung Beringin'),
('121806', '1218', 'Bandar Khalifah'),
('121807', '1218', 'Dolok Merawan'),
('121808', '1218', 'Sipispis'),
('121809', '1218', 'Dolok Masihul'),
('121810', '1218', 'Kotarih'),
('121811', '1218', 'Silinda'),
('121812', '1218', 'Serba Jadi'),
('121813', '1218', 'Tebing Tinggi'),
('121814', '1218', 'Pegajahan'),
('121815', '1218', 'Sei Bamban'),
('121816', '1218', 'Tebing Syahbandar'),
('121817', '1218', 'Bintang Bayu'),
('121901', '1219', 'Medang Deras'),
('121902', '1219', 'Sei Suka'),
('121903', '1219', 'Air Putih'),
('121904', '1219', 'Lima Puluh'),
('121905', '1219', 'Talawi'),
('121906', '1219', 'Tanjung Tiram'),
('121907', '1219', 'Sei Balai'),
('122001', '1220', 'Dolok Sigompulon'),
('122002', '1220', 'Dolok'),
('122003', '1220', 'Halongonan'),
('122004', '1220', 'Padang Bolak'),
('122005', '1220', 'Padang Bolak Julu'),
('122006', '1220', 'Portibi'),
('122007', '1220', 'Batang Onang'),
('122008', '1220', 'Simangambat'),
('122009', '1220', 'Hulu Sihapas'),
('122101', '1221', 'Sosopan'),
('122102', '1221', 'Barumun Tengah'),
('122103', '1221', 'Huristak'),
('122104', '1221', 'Lubuk Barumun'),
('122105', '1221', 'Huta Raja Tinggi'),
('122106', '1221', 'Ulu Barumun'),
('122107', '1221', 'Barumun'),
('122108', '1221', 'Sosa'),
('122109', '1221', 'Batang Lubu Sutam'),
('122110', '1221', 'Barumun Selatan'),
('122111', '1221', 'Aek Nabara Barumun'),
('122112', '1221', 'Sihapas Barumun'),
('122201', '1222', 'Kotapinang'),
('122202', '1222', 'Kampung Rakyat'),
('122203', '1222', 'Torgamba'),
('122204', '1222', 'Sungai Kanan'),
('122205', '1222', 'Silangkitang'),
('122301', '1223', 'Kualuh Hulu'),
('122302', '1223', 'Kualuh Leidong'),
('122303', '1223', 'Kualuh Hilir'),
('122304', '1223', 'Aek Kuo'),
('122305', '1223', 'Marbau'),
('122306', '1223', 'Na IX - X'),
('122307', '1223', 'Aek Natas'),
('122308', '1223', 'Kualuh Selatan'),
('122401', '1224', 'Lotu'),
('122402', '1224', 'Sawo'),
('122403', '1224', 'Tuhemberua'),
('122404', '1224', 'Sitolu Ori'),
('122405', '1224', 'Namohalu Esiwa'),
('122406', '1224', 'Alasa Talumuzoi'),
('122407', '1224', 'Alasa'),
('122408', '1224', 'Tugala Oyo'),
('122409', '1224', 'Afulu'),
('122410', '1224', 'Lahewa'),
('122411', '1224', 'Lahewa Timur'),
('122501', '1225', 'Lahomi'),
('122502', '1225', 'Sirombu'),
('122503', '1225', 'Mandrehe Barat'),
('122504', '1225', 'Moro\'o'),
('122505', '1225', 'Mandrehe'),
('122506', '1225', 'Mandrehe Utara'),
('122507', '1225', 'Lolofitu Moi'),
('122508', '1225', 'Ulu Moro\'o'),
('127101', '1271', 'Medan Kota'),
('127102', '1271', 'Medan Sunggal'),
('127103', '1271', 'Medan Helvetia'),
('127104', '1271', 'Medan Denai'),
('127105', '1271', 'Medan Barat'),
('127106', '1271', 'Medan Deli'),
('127107', '1271', 'Medan Tuntungan'),
('127108', '1271', 'Medan Belawan'),
('127109', '1271', 'Medan Amplas'),
('127110', '1271', 'Medan Area'),
('127111', '1271', 'Medan Johor'),
('127112', '1271', 'Medan Marelan'),
('127113', '1271', 'Medan Labuhan'),
('127114', '1271', 'Medan Tembung'),
('127115', '1271', 'Medan Maimun'),
('127116', '1271', 'Medan Polonia'),
('127117', '1271', 'Medan Baru'),
('127118', '1271', 'Medan Perjuangan'),
('127119', '1271', 'Medan Petisah'),
('127120', '1271', 'Medan Timur'),
('127121', '1271', 'Medan Selayang'),
('127201', '1272', 'Siantar Timur'),
('127202', '1272', 'Siantar Barat'),
('127203', '1272', 'Siantar Utara'),
('127204', '1272', 'Siantar Selatan'),
('127205', '1272', 'Siantar Marihat'),
('127206', '1272', 'Siantar Martoba'),
('127207', '1272', 'Siantar Sitalasari'),
('127208', '1272', 'Siantar Marimbun'),
('127301', '1273', 'Sibolga Utara'),
('127302', '1273', 'Sibolga Kota'),
('127303', '1273', 'Sibolga Selatan'),
('127304', '1273', 'Sibolga Sambas'),
('127401', '1274', 'Tanjung Balai Selatan'),
('127402', '1274', 'Tanjung Balai Utara'),
('127403', '1274', 'Sei Tualang Raso'),
('127404', '1274', 'Teluk Nibung'),
('127405', '1274', 'Datuk Bandar'),
('127406', '1274', 'Datuk Bandar Timur'),
('127501', '1275', 'Binjai Utara'),
('127502', '1275', 'Binjai Kota'),
('127503', '1275', 'Binjai Barat'),
('127504', '1275', 'Binjai Timur'),
('127505', '1275', 'Binjai Selatan'),
('127601', '1276', 'Padang Hulu'),
('127602', '1276', 'Rambutan'),
('127603', '1276', 'Padang Hilir'),
('127604', '1276', 'Bajenis'),
('127605', '1276', 'Tebing Tinggi Kota'),
('127701', '1277', 'Padangsidimpuan Utara'),
('127702', '1277', 'Padangsidimpuan Selatan'),
('127703', '1277', 'Padangsidimpuan Batunadua'),
('127704', '1277', 'Padangsidimpuan Hutaimbaru'),
('127705', '1277', 'Padangsidimpuan Tenggara'),
('127706', '1277', 'Padangsidimpuan Angkola Julu'),
('127801', '1278', 'Gunungsitoli'),
('127802', '1278', 'Gunungsitoli Selatan'),
('127803', '1278', 'Gunungsitoli Utara'),
('127804', '1278', 'Gunungsitoli Idanoi'),
('127805', '1278', 'Gunungsitoli Alo\'oa'),
('127806', '1278', 'Gunungsitoli Barat'),
('130101', '1301', 'Pancung Soal'),
('130102', '1301', 'Ranah Pesisir'),
('130103', '1301', 'Lengayang'),
('130104', '1301', 'Batang Kapas'),
('130105', '1301', 'IV Jurai'),
('130106', '1301', 'Bayang'),
('130107', '1301', 'Koto XI Tarusan'),
('130108', '1301', 'Sutera'),
('130109', '1301', 'Linggo Sari Baganti'),
('130110', '1301', 'Lunang'),
('130111', '1301', 'Basa Ampek Balai Tapan'),
('130112', '1301', 'IV Nagari Bayang Utara'),
('130113', '1301', 'Airpura'),
('130114', '1301', 'Ranah Ampek Hulu Tapan'),
('130115', '1301', 'Silaut'),
('130203', '1302', 'Pantai Cermin'),
('130204', '1302', 'Lembah Gumanti'),
('130205', '1302', 'Payung Sekaki'),
('130206', '1302', 'Lembang Jaya'),
('130207', '1302', 'Gunung Talang'),
('130208', '1302', 'Bukit Sundi'),
('130209', '1302', 'IX Koto Sungai Lasi'),
('130210', '1302', 'Kubung'),
('130211', '1302', 'X Koto Singkarak'),
('130212', '1302', 'X Koto Diatas'),
('130213', '1302', 'Junjung Sirih'),
('130217', '1302', 'Hiliran Gumanti'),
('130218', '1302', 'Tigo Lurah'),
('130219', '1302', 'Danau Kembar'),
('130303', '1303', 'Tanjung Gadang'),
('130304', '1303', 'Sijunjung'),
('130305', '1303', 'IV Nagari'),
('130306', '1303', 'Kamang Baru'),
('130307', '1303', 'Lubuak Tarok'),
('130308', '1303', 'Koto VII'),
('130309', '1303', 'Sumpur Kudus'),
('130310', '1303', 'Kupitan'),
('130401', '1304', 'X Koto'),
('130402', '1304', 'Batipuh'),
('130403', '1304', 'Rambatan'),
('130404', '1304', 'Lima Kaum'),
('130405', '1304', 'Tanjung Emas'),
('130406', '1304', 'Lintau Buo'),
('130407', '1304', 'Sungayang'),
('130408', '1304', 'Sungai Tarab'),
('130409', '1304', 'Pariangan'),
('130410', '1304', 'Salimpauang'),
('130411', '1304', 'Padang Ganting'),
('130412', '1304', 'Tanjuang Baru'),
('130413', '1304', 'Lintau Buo Utara'),
('130414', '1304', 'Batipuah Selatan'),
('130501', '1305', 'Lubuk Alung'),
('130502', '1305', 'Batang Anai'),
('130503', '1305', 'Nan Sabaris'),
('130504', '1305', 'x Enam Lingkuang'),
('130505', '1305', 'VII Koto Sungai Sarik'),
('130506', '1305', 'V Koto Kampung Dalam'),
('130507', '1305', 'Sungai Garingging'),
('130508', '1305', 'Sungai Limau'),
('130509', '1305', 'IV Koto Aur Malintang'),
('130510', '1305', 'Ulakan Tapakih'),
('130511', '1305', 'Sintuak Toboh Gadang'),
('130512', '1305', 'Padang Sago'),
('130513', '1305', 'Batang Gasan'),
('130514', '1305', 'V Koto Timur'),
('130515', '1305', 'x Kayu Tanam'),
('130516', '1305', 'Patamuan'),
('130517', '1305', 'Enam Lingkung'),
('130601', '1306', 'Tanjung Mutiara'),
('130602', '1306', 'Lubuk Basung'),
('130603', '1306', 'Tanjung Raya'),
('130604', '1306', 'Matur'),
('130605', '1306', 'IV Koto'),
('130606', '1306', 'Banuhampu'),
('130607', '1306', 'Ampek Angkek'),
('130608', '1306', 'Baso'),
('130609', '1306', 'Tilatang Kamang'),
('130610', '1306', 'Palupuh'),
('130611', '1306', 'Pelembayan'),
('130612', '1306', 'Sungai Pua'),
('130613', '1306', 'Ampek Nagari'),
('130614', '1306', 'Candung'),
('130615', '1306', 'Kamang Magek'),
('130616', '1306', 'Malalak'),
('130701', '1307', 'Suliki'),
('130702', '1307', 'Guguak'),
('130703', '1307', 'Payakumbuh'),
('130704', '1307', 'Luak'),
('130705', '1307', 'Harau'),
('130706', '1307', 'Pangkalan Koto Baru'),
('130707', '1307', 'Kapur IX'),
('130708', '1307', 'Gunuang Omeh'),
('130709', '1307', 'Lareh Sago Halaban'),
('130710', '1307', 'Situjuah Limo Nagari'),
('130711', '1307', 'Mungka'),
('130712', '1307', 'Bukik Barisan'),
('130713', '1307', 'Akabiluru'),
('130804', '1308', 'Bonjol'),
('130805', '1308', 'Lubuk Sikaping'),
('130807', '1308', 'Panti'),
('130808', '1308', 'Mapat Tunggul'),
('130812', '1308', 'Duo Koto'),
('130813', '1308', 'Tigo Nagari'),
('130814', '1308', 'Rao'),
('130815', '1308', 'Mapat Tunggul Selatan'),
('130816', '1308', 'Simpang Alahan Mati'),
('130817', '1308', 'Padang Gelugur'),
('130818', '1308', 'Rao Utara'),
('130819', '1308', 'Rao Selatan'),
('130901', '1309', 'Pagai Utara'),
('130902', '1309', 'Sipora Selatan'),
('130903', '1309', 'Siberut Selatan'),
('130904', '1309', 'Siberut Utara'),
('130905', '1309', 'Siberut Barat'),
('130906', '1309', 'Siberut Barat Daya'),
('130907', '1309', 'Siberut Tengah'),
('130908', '1309', 'Sipora Utara'),
('130909', '1309', 'Sikakap'),
('130910', '1309', 'Pagai Selatan'),
('131001', '1310', 'Koto Baru'),
('131002', '1310', 'Pulau Punjung'),
('131003', '1310', 'Sungai Rumbai'),
('131004', '1310', 'Sitiung'),
('131005', '1310', 'Sembilan Koto'),
('131006', '1310', 'Timpeh'),
('131007', '1310', 'Koto Salak'),
('131008', '1310', 'Tiumang'),
('131009', '1310', 'Padang Laweh'),
('131010', '1310', 'Asam Jujuhan'),
('131011', '1310', 'Koto Besar'),
('131101', '1311', 'Sangir'),
('131102', '1311', 'Sungai Pagu'),
('131103', '1311', 'Koto Parik Gadang Diateh'),
('131104', '1311', 'Sangir Jujuan'),
('131105', '1311', 'Sangir Batang Hari'),
('131106', '1311', 'Pauh Duo'),
('131107', '1311', 'Sangir Balai Janggo'),
('131201', '1312', 'Sungaiberemas'),
('131202', '1312', 'Lembah Melintang'),
('131203', '1312', 'Pasaman'),
('131204', '1312', 'Talamau'),
('131205', '1312', 'Kinali'),
('131206', '1312', 'Gunungtuleh'),
('131207', '1312', 'Ranah Batahan'),
('131208', '1312', 'Koto Balingka'),
('131209', '1312', 'Sungaiaur'),
('131210', '1312', 'Luhak Nan Duo'),
('131211', '1312', 'Sasak Ranah Pesisir'),
('137101', '1371', 'Padang Selatan'),
('137102', '1371', 'Padang Timur'),
('137103', '1371', 'Padang Barat'),
('137104', '1371', 'Padang Utara'),
('137105', '1371', 'Bungus Teluk Kabung'),
('137106', '1371', 'Lubuk Begalung'),
('137107', '1371', 'Lubuk Kilangan'),
('137108', '1371', 'Pauh'),
('137109', '1371', 'Kuranji'),
('137110', '1371', 'Nanggalo'),
('137111', '1371', 'Koto Tangah'),
('137201', '1372', 'Lubuk Sikarah'),
('137202', '1372', 'Tanjung Harapan'),
('137301', '1373', 'Lembah Segar'),
('137302', '1373', 'Barangin'),
('137303', '1373', 'Silungkang'),
('137304', '1373', 'Talawi'),
('137401', '1374', 'Padang Panjang Timur'),
('137402', '1374', 'Padang Panjang Barat'),
('137501', '1375', 'Guguak Panjang'),
('137502', '1375', 'Mandiangin K. Selayan'),
('137503', '1375', 'Aur Birugo Tigo Baleh'),
('137601', '1376', 'Payakumbuh Barat'),
('137602', '1376', 'Payakumbuh Utara'),
('137603', '1376', 'Payakumbuh Timur'),
('137604', '1376', 'Lamposi Tigo Nagori'),
('137605', '1376', 'Payakumbuh Selatan'),
('137701', '1377', 'Pariaman Tengah'),
('137702', '1377', 'Pariaman Utara'),
('137703', '1377', 'Pariaman Selatan'),
('137704', '1377', 'Pariaman Timur'),
('140101', '1401', 'Bangkinang Kota'),
('140102', '1401', 'Kampar'),
('140103', '1401', 'Tambang'),
('140104', '1401', 'XIII Koto Kampar'),
('140105', '1401', 'Kuok'),
('140106', '1401', 'Siak Hulu'),
('140107', '1401', 'Kampar Kiri'),
('140108', '1401', 'Kampar Kiri Hilir'),
('140109', '1401', 'Kampar Kiri Hulu'),
('140110', '1401', 'Tapung'),
('140111', '1401', 'Tapung Hilir'),
('140112', '1401', 'Tapung Hulu'),
('140113', '1401', 'Salo'),
('140114', '1401', 'Rumbio Jaya'),
('140115', '1401', 'Bangkinang'),
('140116', '1401', 'Perhentian Raja'),
('140117', '1401', 'Kampar Timur'),
('140118', '1401', 'Kampar Utara'),
('140119', '1401', 'Kampar Kiri Tengah'),
('140120', '1401', 'Gunung Sahilan'),
('140121', '1401', 'Koto Kampar Hulu'),
('140201', '1402', 'Rengat'),
('140202', '1402', 'Rengat Barat'),
('140203', '1402', 'Kelayang'),
('140204', '1402', 'Pasir Penyu'),
('140205', '1402', 'Peranap'),
('140206', '1402', 'Siberida'),
('140207', '1402', 'Batang Cenaku'),
('140208', '1402', 'Batang Gangsal'),
('140209', '1402', 'Lirik'),
('140210', '1402', 'Kuala Cenaku'),
('140211', '1402', 'Sungai Lala'),
('140212', '1402', 'Lubuk Batu Jaya'),
('140213', '1402', 'Rakit Kulim'),
('140214', '1402', 'Batang Peranap'),
('140301', '1403', 'Bengkalis'),
('140302', '1403', 'Bantan'),
('140303', '1403', 'Bukit Batu'),
('140309', '1403', 'Mandau'),
('140310', '1403', 'Rupat'),
('140311', '1403', 'Rupat Utara'),
('140312', '1403', 'Siak Kecil'),
('140313', '1403', 'Pinggir'),
('140401', '1404', 'Reteh'),
('140402', '1404', 'Enok'),
('140403', '1404', 'Kuala Indragiri'),
('140404', '1404', 'Tembilahan'),
('140405', '1404', 'Tempuling'),
('140406', '1404', 'Gaung Anak Serka'),
('140407', '1404', 'Mandah'),
('140408', '1404', 'Kateman'),
('140409', '1404', 'Keritang'),
('140410', '1404', 'Tanah Merah'),
('140411', '1404', 'Batang Tuaka'),
('140412', '1404', 'Gaung'),
('140413', '1404', 'Tembilahan Hulu'),
('140414', '1404', 'Kemuning'),
('140415', '1404', 'Pelangiran'),
('140416', '1404', 'Teluk Belengkong'),
('140417', '1404', 'Pulau Burung'),
('140418', '1404', 'Concong'),
('140419', '1404', 'Kempas'),
('140420', '1404', 'Sungai Batang'),
('140501', '1405', 'Ukui'),
('140502', '1405', 'Pangkalan Kerinci'),
('140503', '1405', 'Pangkalan Kuras'),
('140504', '1405', 'Pangkalan Lesung'),
('140505', '1405', 'Langgam'),
('140506', '1405', 'Pelalawan'),
('140507', '1405', 'Kerumutan'),
('140508', '1405', 'Bunut'),
('140509', '1405', 'Teluk Meranti'),
('140510', '1405', 'Kuala Kampar'),
('140511', '1405', 'Bandar Sei Kijang'),
('140512', '1405', 'Bandar Petalangan'),
('140601', '1406', 'Ujung Batu'),
('140602', '1406', 'Rokan IV Koto'),
('140603', '1406', 'Rambah'),
('140604', '1406', 'Tambusai'),
('140605', '1406', 'Kepenuhan'),
('140606', '1406', 'Kunto Darussalam'),
('140607', '1406', 'Rambah Samo'),
('140608', '1406', 'Rambah Hilir'),
('140609', '1406', 'Tambusai Utara'),
('140610', '1406', 'Bangun Purba'),
('140611', '1406', 'Tandun'),
('140612', '1406', 'Kabun'),
('140613', '1406', 'Bonai Darussalam'),
('140614', '1406', 'Pagaran Tapah Darussalam'),
('140615', '1406', 'Kepenuhan Hulu'),
('140616', '1406', 'Pendalian IV Koto'),
('140701', '1407', 'Kubu'),
('140702', '1407', 'Bangko'),
('140703', '1407', 'Tanah Putih'),
('140704', '1407', 'Rimba Melintang'),
('140705', '1407', 'Bagan Sinembah'),
('140706', '1407', 'Pasir Limau Kapas'),
('140707', '1407', 'Sinaboi'),
('140708', '1407', 'Pujud'),
('140709', '1407', 'Tanah Putih Tanjung Melawan'),
('140710', '1407', 'Bangko Pusako'),
('140711', '1407', 'Simpang Kanan'),
('140712', '1407', 'Batu Hampar'),
('140713', '1407', 'Rantau Kopar'),
('140714', '1407', 'Pekaitan'),
('140715', '1407', 'Kubu Babussalam'),
('140801', '1408', 'Siak'),
('140802', '1408', 'Sungai Apit'),
('140803', '1408', 'Minas'),
('140804', '1408', 'Tualang'),
('140805', '1408', 'Sungai Mandau'),
('140806', '1408', 'Dayun'),
('140807', '1408', 'Kerinci Kanan'),
('140808', '1408', 'Bunga Raya'),
('140809', '1408', 'Koto Gasib'),
('140810', '1408', 'Kandis'),
('140811', '1408', 'Lubuk Dalam'),
('140812', '1408', 'Sabak Auh'),
('140813', '1408', 'Mempura'),
('140814', '1408', 'Pusako'),
('140901', '1409', 'Kuantan Mudik'),
('140902', '1409', 'Kuantan Tengah'),
('140903', '1409', 'Singingi'),
('140904', '1409', 'Kuantan Hilir'),
('140905', '1409', 'Cerenti'),
('140906', '1409', 'Benai'),
('140907', '1409', 'Gunungtoar'),
('140908', '1409', 'Singingi Hilir'),
('140909', '1409', 'Pangean'),
('140910', '1409', 'Logas Tanah Darat'),
('140911', '1409', 'Inuman'),
('140912', '1409', 'Hulu Kuantan'),
('140913', '1409', 'Kuantan Hilir Seberang'),
('140914', '1409', 'Sentajo Raya'),
('140915', '1409', 'Pucuk Rantau'),
('141001', '1410', 'Tebing Tinggi'),
('141002', '1410', 'Rangsang Barat'),
('141003', '1410', 'Rangsang'),
('141004', '1410', 'Tebing Tinggi Barat'),
('141005', '1410', 'Merbau'),
('141006', '1410', 'Pulaumerbau'),
('141007', '1410', 'Tebing Tinggi Timur'),
('141008', '1410', 'Tasik Putri Puyu'),
('141009', '1410', 'Rangsang Pesisir'),
('147101', '1471', 'Sukajadi'),
('147102', '1471', 'Pekanbaru Kota'),
('147103', '1471', 'Sail'),
('147104', '1471', 'Lima Puluh'),
('147105', '1471', 'Senapelan'),
('147106', '1471', 'Rumbai'),
('147107', '1471', 'Bukit Raya'),
('147108', '1471', 'Tampan'),
('147109', '1471', 'Marpoyan Damai'),
('147110', '1471', 'Tenayan Raya'),
('147111', '1471', 'Payung Sekaki'),
('147112', '1471', 'Rumbai Pesisir'),
('147201', '1472', 'Dumai Barat'),
('147202', '1472', 'Dumai Timur'),
('147203', '1472', 'Bukit Kapur'),
('147204', '1472', 'Sungai Sembilan'),
('147205', '1472', 'Medang Kampai'),
('147206', '1472', 'Dumai Kota'),
('147207', '1472', 'Dumai Selatan'),
('150101', '1501', 'Gunung Raya'),
('150102', '1501', 'Danau Kerinci'),
('150104', '1501', 'Sitinjau Laut'),
('150105', '1501', 'Air Hangat'),
('150106', '1501', 'Gunung Kerinci'),
('150107', '1501', 'Batang Merangin'),
('150108', '1501', 'Keliling Danau'),
('150109', '1501', 'Kayu Aro'),
('150111', '1501', 'Air Hangat Timur'),
('150115', '1501', 'Gunung Tujuh'),
('150116', '1501', 'Siulak'),
('150117', '1501', 'Depati Tujuh'),
('150118', '1501', 'Siulak Mukai'),
('150119', '1501', 'Kayu Aro Barat'),
('150120', '1501', 'Bukitkerman'),
('150121', '1501', 'Air Hangat Barat'),
('150201', '1502', 'Jangkat'),
('150202', '1502', 'Bangko'),
('150203', '1502', 'Muara Siau'),
('150204', '1502', 'Sungai Manau'),
('150205', '1502', 'Tabir'),
('150206', '1502', 'Pamenang'),
('150207', '1502', 'Tabir Ulu'),
('150208', '1502', 'Tabir Selatan'),
('150209', '1502', 'Lembah Masurai'),
('150210', '1502', 'Bangko Barat'),
('150211', '1502', 'Nalo Tatan'),
('150212', '1502', 'Batang Masumai'),
('150213', '1502', 'Pamenang Barat'),
('150214', '1502', 'Tabir Ilir'),
('150215', '1502', 'Tabir Timur'),
('150216', '1502', 'Renah Pembarap'),
('150217', '1502', 'Pangkalan Jambu'),
('150218', '1502', 'Sungai Tenang'),
('150219', '1502', 'Renah Pamenang'),
('150220', '1502', 'Pamenang Selatan'),
('150221', '1502', 'Margo Tabir'),
('150222', '1502', 'Tabir Lintas'),
('150223', '1502', 'Tabir Barat'),
('150224', '1502', 'Tiang Pumpung'),
('150301', '1503', 'Batang Asai'),
('150302', '1503', 'Limun'),
('150303', '1503', 'Sarolangun'),
('150304', '1503', 'Pauh'),
('150305', '1503', 'Pelawan'),
('150306', '1503', 'Mandiangin'),
('150307', '1503', 'Air Hitam'),
('150308', '1503', 'Bathin VIII'),
('150309', '1503', 'Singkut'),
('150310', '1503', 'Cermin Nan Gedang'),
('150401', '1504', 'Mersam'),
('150402', '1504', 'Muara Tembesi'),
('150403', '1504', 'Muara Bulian'),
('150404', '1504', 'Batin XXIV'),
('150405', '1504', 'Pemayung'),
('150406', '1504', 'Maro Sebo Ulu'),
('150407', '1504', 'Bajubang'),
('150408', '1504', 'Maro Sebo Ilir'),
('150501', '1505', 'Jambi Luar Kota'),
('150502', '1505', 'Sekernan'),
('150503', '1505', 'Kumpeh'),
('150504', '1505', 'Maro Sebo'),
('150505', '1505', 'Mestong'),
('150506', '1505', 'Kumpeh Ulu'),
('150507', '1505', 'Sungai Bahar'),
('150508', '1505', 'Sungai Gelam'),
('150509', '1505', 'Bahar Utara'),
('150510', '1505', 'Bahar Selatan'),
('150511', '1505', 'Taman Rajo'),
('150601', '1506', 'Tungkal Ulu'),
('150602', '1506', 'Tungkal Ilir'),
('150603', '1506', 'Pengabuan'),
('150604', '1506', 'Betara'),
('150605', '1506', 'Merlung'),
('150606', '1506', 'Tebing Tinggi'),
('150607', '1506', 'Batang Asam'),
('150608', '1506', 'Renah Mendaluh'),
('150609', '1506', 'Muara Papalik'),
('150610', '1506', 'Seberang Kota'),
('150611', '1506', 'Bram Itam'),
('150612', '1506', 'Kuala Betara'),
('150613', '1506', 'Senyerang'),
('150701', '1507', 'Muara Sabak Timur'),
('150702', '1507', 'Nipah Panjang'),
('150703', '1507', 'Mendahara'),
('150704', '1507', 'Rantau Rasau'),
('150705', '1507', 'S a d u'),
('150706', '1507', 'Dendang'),
('150707', '1507', 'Muara Sabak Barat'),
('150708', '1507', 'Kuala Jambi'),
('150709', '1507', 'Mendahara Ulu'),
('150710', '1507', 'Geragai'),
('150711', '1507', 'Berbak'),
('150801', '1508', 'Tanah Tumbuh'),
('150802', '1508', 'Rantau Pandan'),
('150803', '1508', 'Pasar Muaro Bungo'),
('150804', '1508', 'Jujuhan'),
('150805', '1508', 'Tanah Sepenggal'),
('150806', '1508', 'Pelepat'),
('150807', '1508', 'Limbur Lubuk Mengkuang'),
('150808', '1508', 'Muko-muko Bathin VII'),
('150809', '1508', 'Pelepat Ilir'),
('150810', '1508', 'Batin II Babeko'),
('150811', '1508', 'Bathin III'),
('150812', '1508', 'Bungo Dani'),
('150813', '1508', 'Rimbo Tengah'),
('150814', '1508', 'Bathin III Ulu'),
('150815', '1508', 'Bathin II Pelayang'),
('150816', '1508', 'Jujuhan Ilir'),
('150817', '1508', 'Tanah Sepenggal Lintas'),
('150901', '1509', 'Tebo Tengah'),
('150902', '1509', 'Tebo Ilir'),
('150903', '1509', 'Tebo Ulu'),
('150904', '1509', 'Rimbo Bujang'),
('150905', '1509', 'Sumay'),
('150906', '1509', 'VII Koto'),
('150907', '1509', 'Rimbo Ulu'),
('150908', '1509', 'Rimbo Ilir'),
('150909', '1509', 'Tengah Ilir'),
('150910', '1509', 'Serai Serumpun'),
('150911', '1509', 'VII Koto Ilir'),
('150912', '1509', 'Muara Tabir'),
('157101', '1571', 'Telanaipura'),
('157102', '1571', 'Jambi Selatan'),
('157103', '1571', 'Jambi Timur'),
('157104', '1571', 'Pasar Jambi'),
('157105', '1571', 'Pelayangan'),
('157106', '1571', 'Danau Teluk'),
('157107', '1571', 'Kota Baru'),
('157108', '1571', 'Jelutung'),
('157201', '1572', 'Sungai Penuh'),
('157202', '1572', 'Pesisir Bukit'),
('157203', '1572', 'Hamparan Rawang'),
('157204', '1572', 'Tanah Kampung'),
('157205', '1572', 'Kumun Debai'),
('157206', '1572', 'Pondok Tinggi'),
('157207', '1572', 'Koto Baru'),
('157208', '1572', 'Sungai Bungkal'),
('160107', '1601', 'Sosoh Buay Rayap'),
('160108', '1601', 'Pengandonan'),
('160109', '1601', 'Peninjauan'),
('160113', '1601', 'Baturaja Barat'),
('160114', '1601', 'Baturaja Timur'),
('160120', '1601', 'Ulu Ogan'),
('160121', '1601', 'Semidang Aji'),
('160122', '1601', 'Lubuk Batang'),
('160128', '1601', 'Lengkiti'),
('160129', '1601', 'Sinar Peninjauan'),
('160130', '1601', 'Lubuk Raja'),
('160131', '1601', 'Muara Jaya'),
('160202', '1602', 'Tanjung Lubuk'),
('160203', '1602', 'Pedamaran'),
('160204', '1602', 'Mesuji'),
('160205', '1602', 'Kayu Agung'),
('160208', '1602', 'Sirah Pulau Padang'),
('160211', '1602', 'Tulung Selapan'),
('160212', '1602', 'Pampangan'),
('160213', '1602', 'Lempuing'),
('160214', '1602', 'Air Sugihan'),
('160215', '1602', 'Sungai Menang'),
('160217', '1602', 'Jejawi'),
('160218', '1602', 'Cengal'),
('160219', '1602', 'Pangkalan Lampam'),
('160220', '1602', 'Mesuji Makmur'),
('160221', '1602', 'Mesuji Raya'),
('160222', '1602', 'Lempuing Jaya'),
('160223', '1602', 'Teluk Gelam'),
('160224', '1602', 'Pedamaran Timur'),
('160301', '1603', 'Tanjung Agung'),
('160302', '1603', 'Muara Enim'),
('160303', '1603', 'Rambang Dangku'),
('160304', '1603', 'Gunung Megang'),
('160306', '1603', 'Gelumbang'),
('160307', '1603', 'Lawang Kidul'),
('160308', '1603', 'Semende Darat Laut'),
('160309', '1603', 'Semende Darat Tengah'),
('160310', '1603', 'Semende Darat Ulu'),
('160311', '1603', 'Ujan Mas'),
('160314', '1603', 'Lubai'),
('160315', '1603', 'Rambang'),
('160316', '1603', 'Sungai Rotan'),
('160317', '1603', 'Lembak'),
('160319', '1603', 'Benakat'),
('160321', '1603', 'Kelekar'),
('160322', '1603', 'Muara Belida'),
('160323', '1603', 'Belimbing'),
('160324', '1603', 'Belida Darat'),
('160325', '1603', 'Lubai Ulu'),
('160401', '1604', 'Tanjungsakti Pumu'),
('160406', '1604', 'Jarai'),
('160407', '1604', 'Kota Agung'),
('160408', '1604', 'Pulaupinang'),
('160409', '1604', 'Merapi Barat'),
('160410', '1604', 'Lahat'),
('160412', '1604', 'Pajar Bulan'),
('160415', '1604', 'Mulak Ulu'),
('160416', '1604', 'Kikim Selatan'),
('160417', '1604', 'Kikim Timur'),
('160418', '1604', 'Kikim Tengah'),
('160419', '1604', 'Kikim Barat'),
('160420', '1604', 'Pseksu'),
('160421', '1604', 'Gumay Talang'),
('160422', '1604', 'Pagar Gunung'),
('160423', '1604', 'Merapi Timur'),
('160424', '1604', 'Tanjung Sakti Pumi'),
('160425', '1604', 'Gumay Ulu'),
('160426', '1604', 'Merapi Selatan'),
('160427', '1604', 'Tanjungtebat'),
('160428', '1604', 'Muarapayang'),
('160429', '1604', 'Sukamerindu'),
('160501', '1605', 'Tugumulyo'),
('160502', '1605', 'Muara Lakitan'),
('160503', '1605', 'Muara Kelingi'),
('160508', '1605', 'Jayaloka'),
('160509', '1605', 'Muara Beliti'),
('160510', '1605', 'STL Ulu Terawas'),
('160511', '1605', 'Selangit'),
('160512', '1605', 'Megang Sakti'),
('160513', '1605', 'Purwodadi'),
('160514', '1605', 'BTS. Ulu'),
('160518', '1605', 'Tiang Pumpung Kepungut'),
('160519', '1605', 'Sumber Harta'),
('160520', '1605', 'Tuah Negeri'),
('160521', '1605', 'Suka Karya'),
('160601', '1606', 'Sekayu'),
('160602', '1606', 'Lais'),
('160603', '1606', 'Sungai Keruh'),
('160604', '1606', 'Batang Hari Leko'),
('160605', '1606', 'Sanga Desa'),
('160606', '1606', 'Babat Toman'),
('160607', '1606', 'Sungai Lilin'),
('160608', '1606', 'Keluang'),
('160609', '1606', 'Bayung Lencir'),
('160610', '1606', 'Plakat Tinggi'),
('160611', '1606', 'Lalan'),
('160612', '1606', 'Tungkal Jaya'),
('160613', '1606', 'Lawang Wetan'),
('160614', '1606', 'Babat Supat'),
('160701', '1607', 'Banyuasin I'),
('160702', '1607', 'Banyuasin II'),
('160703', '1607', 'Banyuasin III'),
('160704', '1607', 'Pulau Rimau'),
('160705', '1607', 'Betung'),
('160706', '1607', 'Rambutan'),
('160707', '1607', 'Muara Padang'),
('160708', '1607', 'Muara Telang'),
('160709', '1607', 'Makarti Jaya'),
('160710', '1607', 'Talang Kelapa'),
('160711', '1607', 'Rantau Bayur'),
('160712', '1607', 'Tanjung Lago'),
('160713', '1607', 'Muara Sugihan'),
('160714', '1607', 'Air Salek'),
('160715', '1607', 'Tungkal Ilir'),
('160716', '1607', 'Suak Tapeh'),
('160717', '1607', 'Sembawa'),
('160718', '1607', 'Sumber Marga Telang'),
('160719', '1607', 'Air Kumbang'),
('160801', '1608', 'Martapura'),
('160802', '1608', 'Buay Madang'),
('160803', '1608', 'Belitang'),
('160804', '1608', 'Cempaka'),
('160805', '1608', 'Buay Pemuka Peliung'),
('160806', '1608', 'Madang Suku II'),
('160807', '1608', 'Madang Suku I'),
('160808', '1608', 'Semendawai Suku III'),
('160809', '1608', 'Belitang II'),
('160810', '1608', 'Belitang III'),
('160811', '1608', 'Bunga Mayang'),
('160812', '1608', 'Buay Madang Timur'),
('160813', '1608', 'Madang Suku III'),
('160814', '1608', 'Semendawai Barat'),
('160815', '1608', 'Semendawai Timur'),
('160816', '1608', 'Jayapura'),
('160817', '1608', 'Belitang Jaya'),
('160818', '1608', 'Belitang Madang Raya'),
('160819', '1608', 'Belitang Mulya'),
('160820', '1608', 'Buay Pemuka Bangsa Raja'),
('160901', '1609', 'Muara Dua'),
('160902', '1609', 'Pulau Beringin'),
('160903', '1609', 'Banding Agung'),
('160904', '1609', 'Muara Dua Kisam'),
('160905', '1609', 'Simpang'),
('160906', '1609', 'Buay Sandang Aji'),
('160907', '1609', 'Buay Runjung'),
('160908', '1609', 'Mekakau Ilir'),
('160909', '1609', 'Buay Pemaca'),
('160910', '1609', 'Kisam Tinggi'),
('160911', '1609', 'Kisam Ilir'),
('160912', '1609', 'Buay Pematang Ribu Ranau Tengah'),
('160913', '1609', 'Warkuk Ranau Selatan'),
('160914', '1609', 'Runjung Agung'),
('160915', '1609', 'Sungai Are'),
('160916', '1609', 'Sindang Danau'),
('160917', '1609', 'Buana Pemaca'),
('160918', '1609', 'Tiga Dihaji'),
('160919', '1609', 'Buay Rawan'),
('161001', '1610', 'Muara Kuang'),
('161002', '1610', 'Tanjung Batu'),
('161003', '1610', 'Tanjung Raja'),
('161004', '1610', 'Indralaya'),
('161005', '1610', 'Pemulutan'),
('161006', '1610', 'Rantau Alai'),
('161007', '1610', 'Indralaya Utara'),
('161008', '1610', 'Indralaya Selatan'),
('161009', '1610', 'Pemulutan Selatan'),
('161010', '1610', 'Pemulutan Barat'),
('161011', '1610', 'Rantau Panjang'),
('161012', '1610', 'Sungai Pinang'),
('161013', '1610', 'Kandis'),
('161014', '1610', 'Rambang Kuang'),
('161015', '1610', 'Lubuk Keliat'),
('161016', '1610', 'Payaraman'),
('161101', '1611', 'Muara Pinang'),
('161102', '1611', 'Pendopo'),
('161103', '1611', 'Ulu Musi'),
('161104', '1611', 'Tebing Tinggi'),
('161105', '1611', 'Lintang Kanan'),
('161106', '1611', 'Talang Padang'),
('161107', '1611', 'Pasemah Air Keruh'),
('161108', '1611', 'Sikap Dalam'),
('161109', '1611', 'Saling'),
('161110', '1611', 'Pendopo Barat'),
('161201', '1612', 'Talang Ubi'),
('161202', '1612', 'Penukal Utara'),
('161203', '1612', 'Penukal'),
('161204', '1612', 'Abab'),
('161205', '1612', 'Tanah Abang'),
('161301', '1613', 'Rupit'),
('161302', '1613', 'Rawas Ulu'),
('161303', '1613', 'Nibung'),
('161304', '1613', 'Rawas Ilir'),
('161305', '1613', 'Karang Dapo'),
('161306', '1613', 'Karang Jaya'),
('161307', '1613', 'Ulu Rawas'),
('167101', '1671', 'Ilir Barat II'),
('167102', '1671', 'Seberang Ulu I'),
('167103', '1671', 'Seberang Ulu II'),
('167104', '1671', 'Ilir Barat I'),
('167105', '1671', 'Ilir Timur I'),
('167106', '1671', 'Ilir Timur II'),
('167107', '1671', 'Sukarami'),
('167108', '1671', 'Sako'),
('167109', '1671', 'Kemuning'),
('167110', '1671', 'Kalidoni'),
('167111', '1671', 'Bukit Kecil'),
('167112', '1671', 'Gandus'),
('167113', '1671', 'Kertapati'),
('167114', '1671', 'Plaju'),
('167115', '1671', 'Alang-alang Lebar'),
('167116', '1671', 'Sematang Borang'),
('167201', '1672', 'Pagar Alam Utara'),
('167202', '1672', 'Pagar Alam Selatan'),
('167203', '1672', 'Dempo Utara'),
('167204', '1672', 'Dempo Selatan'),
('167205', '1672', 'Dempo Tengah'),
('167301', '1673', 'Lubuk Linggau Timur I'),
('167302', '1673', 'Lubuk Linggau Barat I'),
('167303', '1673', 'Lubuk Linggau Selatan I'),
('167304', '1673', 'Lubuk Linggau Utara I'),
('167305', '1673', 'Lubuk Linggau Timur II'),
('167306', '1673', 'Lubuk Linggau Barat II'),
('167307', '1673', 'Lubuk Linggau Selatan II'),
('167308', '1673', 'Lubuk Linggau Utara II'),
('167401', '1674', 'Prabumulih Barat'),
('167402', '1674', 'Prabumulih Timur'),
('167403', '1674', 'Cambai'),
('167404', '1674', 'Rambang Kpk Tengah'),
('167405', '1674', 'Prabumulih Utara'),
('167406', '1674', 'Prabumulih Selatan'),
('170101', '1701', 'Kedurang'),
('170102', '1701', 'Seginim'),
('170103', '1701', 'Pino'),
('170104', '1701', 'Manna'),
('170105', '1701', 'Kota Manna'),
('170106', '1701', 'Pino Raya'),
('170107', '1701', 'Kedurang Ilir'),
('170108', '1701', 'Air Nipis'),
('170109', '1701', 'Ulu Manna'),
('170110', '1701', 'Bunga Mas'),
('170111', '1701', 'Pasar Manna'),
('170206', '1702', 'Kota Padang'),
('170207', '1702', 'Padang Ulak Tanding'),
('170208', '1702', 'Sindang Kelingi'),
('170209', '1702', 'Curup'),
('170210', '1702', 'Bermani Ulu'),
('170211', '1702', 'Selupu Rejang'),
('170216', '1702', 'Curup Utara'),
('170217', '1702', 'Curup Timur'),
('170218', '1702', 'Curup Selatan'),
('170219', '1702', 'Curup Tengah'),
('170220', '1702', 'Binduriang'),
('170221', '1702', 'Sindang Beliti Ulu'),
('170222', '1702', 'Sindang Dataran'),
('170223', '1702', 'Sindang Beliti Ilir'),
('170224', '1702', 'Bermani Ulu Raya'),
('170301', '1703', 'Enggano'),
('170306', '1703', 'Kerkap'),
('170307', '1703', 'Kota Arga Makmur'),
('170308', '1703', 'Giri Mulya'),
('170309', '1703', 'Padang Jaya'),
('170310', '1703', 'Lais'),
('170311', '1703', 'Batik Nau'),
('170312', '1703', 'Ketahun'),
('170313', '1703', 'Napal Putih'),
('170314', '1703', 'Putri Hijau'),
('170315', '1703', 'Air Besi'),
('170316', '1703', 'Air Napal'),
('170319', '1703', 'Hulu Palik'),
('170320', '1703', 'Air Padang'),
('170321', '1703', 'Arma Jaya'),
('170322', '1703', 'Tanjung Agung Palik'),
('170323', '1703', 'Ulok Kupai'),
('170401', '1704', 'Kinal'),
('170402', '1704', 'Tanjung Kemuning'),
('170403', '1704', 'Kaur Utara'),
('170404', '1704', 'Kaur Tengah'),
('170405', '1704', 'Kaur Selatan'),
('170406', '1704', 'Maje'),
('170407', '1704', 'Nasal'),
('170408', '1704', 'Semidang Gumay'),
('170409', '1704', 'Kelam Tengah'),
('170410', '1704', 'Luas'),
('170411', '1704', 'Muara Sahung'),
('170412', '1704', 'Tetap'),
('170413', '1704', 'Lungkang Kule'),
('170414', '1704', 'Padang Guci Hilir'),
('170415', '1704', 'Padang Guci Hulu'),
('170501', '1705', 'Sukaraja'),
('170502', '1705', 'Seluma'),
('170503', '1705', 'Talo'),
('170504', '1705', 'Semidang Alas'),
('170505', '1705', 'Semidang Alas Maras'),
('170506', '1705', 'Air Periukan'),
('170507', '1705', 'Lubuk Sandi'),
('170508', '1705', 'Seluma Barat'),
('170509', '1705', 'Seluma Timur'),
('170510', '1705', 'Seluma Utara');

-- --------------------------------------------------------

--
-- Table structure for table `ref_provinsi`
--

CREATE TABLE `ref_provinsi` (
  `id_prov` char(2) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_provinsi`
--

INSERT INTO `ref_provinsi` (`id_prov`, `nama`) VALUES
('11', 'Aceh'),
('12', 'Sumatera Utara'),
('13', 'Sumatera Barat'),
('14', 'Riau'),
('15', 'Jambi'),
('16', 'Sumatera Selatan'),
('17', 'Bengkulu'),
('18', 'Lampung'),
('19', 'Kepulauan Bangka Belitung'),
('21', 'Kepulauan Riau'),
('31', 'DKI Jakarta'),
('32', 'Jawa Barat'),
('33', 'Jawa Tengah'),
('34', 'DI Yogyakarta'),
('35', 'Jawa Timur'),
('36', 'Banten'),
('51', 'Bali'),
('52', 'Nusa Tenggara Barat'),
('53', 'Nusa Tenggara Timur'),
('61', 'Kalimantan Barat'),
('62', 'Kalimantan Tengah'),
('63', 'Kalimantan Selatan'),
('64', 'Kalimantan Timur'),
('65', 'Kalimantan Utara'),
('71', 'Sulawesi Utara'),
('72', 'Sulawesi Tengah'),
('73', 'Sulawesi Selatan'),
('74', 'Sulawesi Tenggara'),
('75', 'Gorontalo'),
('76', 'Sulawesi Barat'),
('81', 'Maluku'),
('82', 'Maluku Utara'),
('91', 'Papua Barat'),
('92', 'Papua');

-- --------------------------------------------------------

--
-- Table structure for table `ref_unit_type`
--

CREATE TABLE `ref_unit_type` (
  `id` int(11) NOT NULL,
  `unit_type` varchar(50) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_unit_type`
--

INSERT INTO `ref_unit_type` (`id`, `unit_type`, `deleted`) VALUES
(1, 'Domestic', 0),
(2, 'International', 0),
(3, 'Umrah', 0),
(4, 'Maize', 0),
(5, 'Lain - lain', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `permissions`, `deleted`) VALUES
(1, 'Programmers', 'a:30:{s:5:\"leave\";s:0:\"\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:0:\"\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:0:\"\";s:8:\"estimate\";N;s:7:\"expense\";s:0:\"\";s:6:\"client\";s:0:\"\";s:6:\"ticket\";s:0:\"\";s:12:\"announcement\";s:0:\"\";s:23:\"help_and_knowledge_base\";s:3:\"all\";s:19:\"can_create_projects\";N;s:17:\"can_edit_projects\";N;s:19:\"can_delete_projects\";N;s:30:\"can_add_remove_project_members\";N;s:16:\"can_create_tasks\";N;s:14:\"can_edit_tasks\";N;s:16:\"can_delete_tasks\";N;s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";N;s:21:\"can_delete_milestones\";N;s:16:\"can_delete_files\";N;s:34:\"can_view_team_members_contact_info\";N;s:34:\"can_view_team_members_social_links\";N;s:29:\"team_member_update_permission\";s:3:\"all\";s:38:\"team_member_update_permission_specific\";s:0:\"\";s:27:\"timesheet_manage_permission\";s:0:\"\";s:36:\"timesheet_manage_permission_specific\";s:0:\"\";s:21:\"disable_event_sharing\";N;}', 0),
(2, 'Projects Manager', 'a:30:{s:5:\"leave\";s:3:\"all\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:3:\"all\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:3:\"all\";s:8:\"estimate\";s:3:\"all\";s:7:\"expense\";s:3:\"all\";s:6:\"client\";s:3:\"all\";s:6:\"ticket\";s:3:\"all\";s:12:\"announcement\";s:3:\"all\";s:23:\"help_and_knowledge_base\";s:3:\"all\";s:19:\"can_create_projects\";s:1:\"1\";s:17:\"can_edit_projects\";s:1:\"1\";s:19:\"can_delete_projects\";s:1:\"1\";s:30:\"can_add_remove_project_members\";s:1:\"1\";s:16:\"can_create_tasks\";s:1:\"1\";s:14:\"can_edit_tasks\";s:1:\"1\";s:16:\"can_delete_tasks\";s:1:\"1\";s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";s:1:\"1\";s:21:\"can_delete_milestones\";s:1:\"1\";s:16:\"can_delete_files\";s:1:\"1\";s:34:\"can_view_team_members_contact_info\";s:1:\"1\";s:34:\"can_view_team_members_social_links\";s:1:\"1\";s:29:\"team_member_update_permission\";s:0:\"\";s:38:\"team_member_update_permission_specific\";s:0:\"\";s:27:\"timesheet_manage_permission\";s:3:\"all\";s:36:\"timesheet_manage_permission_specific\";s:0:\"\";s:21:\"disable_event_sharing\";N;}', 0),
(3, 'Accounting', NULL, 0),
(4, 'Staff', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoices`
--

CREATE TABLE `sales_invoices` (
  `id` int(11) NOT NULL,
  `fid_order` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `inv_address` varchar(250) NOT NULL,
  `delivery_address` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL,
  `paid` varchar(100) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `inv_date` datetime NOT NULL,
  `currency` varchar(10) NOT NULL,
  `amount` double NOT NULL,
  `residual` double NOT NULL,
  `last_email_sent_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_invoices`
--

INSERT INTO `sales_invoices` (`id`, `fid_order`, `code`, `fid_cust`, `inv_address`, `delivery_address`, `status`, `paid`, `fid_tax`, `email_to`, `inv_date`, `currency`, `amount`, `residual`, `last_email_sent_date`, `created_at`, `deleted`) VALUES
(13, 1, '001/RAN/INV/180711', 1, 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'posting', 'PAID', 1, 'nugashare@gmail.com', '2018-07-11 00:00:00', 'IDR', 1650000, 0, NULL, '2018-07-11 10:01:56', 0),
(14, 1, '014/RAN/INV/180711', 1, 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'posting', 'CREDIT', 1, 'nugashare@gmail.com', '2018-07-11 00:00:00', 'IDR', 1650000, 0, NULL, '2018-07-11 10:03:43', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoices_items`
--

CREATE TABLE `sales_invoices_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `basic_price` double NOT NULL,
  `total` double NOT NULL,
  `fid_invoices` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales_invoices_items`
--

INSERT INTO `sales_invoices_items` (`id`, `title`, `description`, `category`, `quantity`, `unit_type`, `rate`, `basic_price`, `total`, `fid_invoices`, `deleted`) VALUES
(1, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 0),
(2, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 0),
(3, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 0),
(4, 'Tiket Kereta', 'Jakarta - surabaya', 'Akomodasi', 1, 'Domestic', 300000, 0, 300000, 2, 0),
(5, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 2, 0),
(6, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 3, 0),
(7, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 3, 0),
(8, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 3, 0),
(9, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 4, 0),
(10, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 4, 0),
(11, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 4, 0),
(12, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 5, 0),
(13, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 5, 0),
(14, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 5, 0),
(15, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 6, 0),
(16, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 6, 0),
(17, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 6, 0),
(18, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 7, 0),
(19, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 7, 0),
(20, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 7, 0),
(21, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 8, 0),
(22, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 8, 0),
(23, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 8, 0),
(24, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 9, 0),
(25, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 9, 0),
(26, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 9, 0),
(27, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 10, 0),
(28, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 10, 0),
(29, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 10, 0),
(30, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 11, 0),
(31, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 11, 0),
(32, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 11, 0),
(33, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 12, 0),
(34, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 12, 0),
(35, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 12, 0),
(36, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 13, 0),
(37, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 13, 0),
(38, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 13, 0),
(39, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 14, 0),
(40, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 14, 0),
(41, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `fid_quot` int(11) NOT NULL,
  `inv_address` varchar(250) NOT NULL,
  `delivery_address` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `exp_date` date NOT NULL,
  `currency` varchar(10) NOT NULL,
  `last_email_sent_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`id`, `code`, `fid_cust`, `fid_quot`, `inv_address`, `delivery_address`, `status`, `fid_tax`, `email_to`, `exp_date`, `currency`, `last_email_sent_date`, `created_at`, `deleted`) VALUES
(1, '001/RAN/ODR/180602', 1, 1, 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'draft', 1, 'nugashare@gmail.com', '2018-06-02', 'IDR', NULL, '2018-06-02 15:50:24', 0),
(2, '002/RAN/ODR/180602', 1, 1, 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'draft', 0, 'nugashare@gmail.com', '2018-06-02', 'IDR', NULL, '2018-06-02 16:05:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_items`
--

CREATE TABLE `sales_order_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `basic_price` double NOT NULL,
  `total` double NOT NULL,
  `fid_order` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales_order_items`
--

INSERT INTO `sales_order_items` (`id`, `title`, `description`, `category`, `quantity`, `unit_type`, `rate`, `basic_price`, `total`, `fid_order`, `deleted`) VALUES
(1, 'Tiket Kereta', 'Jakarta - surabaya', 'Akomodasi', 1, 'Domestic', 300000, 0, 300000, 1, 1),
(2, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 0),
(3, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 0),
(4, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 1),
(5, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 1),
(6, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 1, 0),
(7, 'Tiket Kereta', 'Jakarta - surabaya', 'Akomodasi', 1, 'Domestic', 300000, 0, 300000, 2, 0),
(8, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 0, 500000, 2, 0),
(9, 'Shuttle Bus', 'qwqwe', 'Transport', 1, 'lainnya', 10000000, 500000, 10000000, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_payments`
--

CREATE TABLE `sales_payments` (
  `id` int(11) NOT NULL,
  `code` varchar(250) NOT NULL,
  `fid_inv` int(11) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `paid` varchar(50) NOT NULL,
  `pay_date` datetime NOT NULL,
  `fid_bank` int(11) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `residu` double NOT NULL,
  `memo` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_payments`
--

INSERT INTO `sales_payments` (`id`, `code`, `fid_inv`, `fid_cust`, `paid`, `pay_date`, `fid_bank`, `fid_tax`, `currency`, `amount`, `residu`, `memo`, `created_at`, `deleted`) VALUES
(9, '001/RAN/PAY/180711', 13, 1, 'PAID', '2018-07-11 00:00:00', 66, 1, 'IDR', 1650000, 0, 'Oke', '2018-07-11 10:03:24', 0),
(10, '010/RAN/PAY/180711', 14, 1, 'CREDIT', '2018-07-11 00:00:00', 66, 1, 'IDR', 650000, 1000000, 'Oke', '2018-07-11 10:04:00', 0),
(11, '011/RAN/PAY/180711', 14, 1, 'PAID', '2018-07-11 00:00:00', 66, 1, 'IDR', 1000000, 0, 'Lunas', '2018-07-11 10:04:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_quotation`
--

CREATE TABLE `sales_quotation` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `inv_address` varchar(250) NOT NULL,
  `delivery_address` varchar(250) NOT NULL,
  `status` varchar(10) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `exp_date` date NOT NULL,
  `currency` varchar(10) NOT NULL,
  `last_email_sent_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_quotation`
--

INSERT INTO `sales_quotation` (`id`, `code`, `fid_cust`, `inv_address`, `delivery_address`, `status`, `fid_tax`, `email_to`, `exp_date`, `currency`, `last_email_sent_date`, `created_at`, `deleted`) VALUES
(1, '001/RAN/QUO/180602', 1, 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'draft', 1, 'nugashare@gmail.com', '2018-06-16', 'IDR', NULL, '2018-06-02 15:49:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_quotation_items`
--

CREATE TABLE `sales_quotation_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_quotation` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales_quotation_items`
--

INSERT INTO `sales_quotation_items` (`id`, `title`, `description`, `category`, `quantity`, `unit_type`, `rate`, `total`, `fid_quotation`, `deleted`) VALUES
(1, 'Tiket Kereta', 'Jakarta - surabaya', 'Akomodasi', 1, 'Domestic', 300000, 300000, 1, 0),
(2, 'Shuttle Bus', 'Jakarta - Bandung', 'Akomodasi', 1, 'Domestic', 500000, 500000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_name`, `setting_value`, `deleted`) VALUES
('accepted_file_formats', 'jpg,jpeg,doc,JPG,JPEG,PNG,gif,docx,zip,rar', 0),
('allow_partial_invoice_payment_from_clients', '1', 0),
('allowed_ip_addresses', '', 0),
('app_title', 'PT Ranata Air Network Tours and Travel', 0),
('budget_end', '', 0),
('budget_start', '', 0),
('client_can_add_project_files', '', 0),
('client_can_comment_on_files', '', 0),
('client_can_comment_on_tasks', '', 0),
('client_can_create_projects', '', 0),
('client_can_create_tasks', '', 0),
('client_can_edit_tasks', '', 0),
('client_can_view_gantt', '', 0),
('client_can_view_milestones', '', 0),
('client_can_view_overview', '', 0),
('client_can_view_project_files', '', 0),
('client_can_view_tasks', '', 0),
('client_message_users', '', 0),
('company_address', 'Jl. Cihampelas No.225, Tamansari, Bandung Wetan, Kota Bandung, Jawa Barat 40131', 0),
('company_email', 'official@ranatatour.com', 0),
('company_name', 'PT Ranata Air Network', 0),
('company_phone', '(022) 2036186', 0),
('company_website', 'http://www.ranatatour.com/', 0),
('currency_position', 'left', 0),
('currency_symbol', 'Rp. ', 0),
('date_format', 'd-m-Y', 0),
('decimal_separator', '.', 0),
('default_currency', 'IDR', 0),
('disable_client_login', '', 0),
('disable_client_signup', '1', 0),
('email_protocol', '', 0),
('email_sent_from_address', 'official@ranatatour.com', 0),
('email_sent_from_name', 'Ranata Air Network', 0),
('email_smtp_host', '', 0),
('email_smtp_pass', '', 0),
('email_smtp_port', '', 0),
('email_smtp_security_type', 'tls', 0),
('email_smtp_user', '', 0),
('first_day_of_week', '1', 0),
('front_meta_description', '', 0),
('front_meta_keywords', '', 0),
('front_meta_title', 'Nugastudio - Web Artisans', 0),
('invoice_color', '', 0),
('invoice_footer', '<p>&nbsp; &nbsp; &nbsp; TTD</p><p><br></p><p>Sales Manager</p>', 0),
('invoice_logo', '_file5ae430cdbd39c-invoice-logo.png', 0),
('invoice_prefix', 'INVOICE #', 0),
('invoice_style', '', 0),
('item_purchase_code', 'sdfsdg', 0),
('language', 'english', 0),
('module_announcement', '', 0),
('module_attendance', '', 0),
('module_estimate', '', 0),
('module_estimate_request', '', 0),
('module_event', '', 0),
('module_expense', '1', 0),
('module_help', '1', 0),
('module_invoice', '1', 0),
('module_knowledge_base', '1', 0),
('module_leave', '', 0),
('module_message', '1', 0),
('module_note', '', 0),
('module_project_timesheet', '', 0),
('module_ticket', '', 0),
('module_timeline', '1', 0),
('module_vendor', '1', 0),
('rows_per_page', '10', 0),
('scrollbar', 'jquery', 0),
('send_bcc_to', '', 0),
('show_background_image_in_signin_page', 'yes', 0),
('show_logo_in_signin_page', 'yes', 0),
('site_logo', '_file5ae42fbc2e0ab-site-logo.png', 0),
('time_format', '24_hours', 0),
('timezone', 'Asia/Jakarta', 0);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook` text COLLATE utf8_unicode_ci,
  `twitter` text COLLATE utf8_unicode_ci,
  `linkedin` text COLLATE utf8_unicode_ci,
  `googleplus` text COLLATE utf8_unicode_ci,
  `digg` text COLLATE utf8_unicode_ci,
  `youtube` text COLLATE utf8_unicode_ci,
  `pinterest` text COLLATE utf8_unicode_ci,
  `instagram` text COLLATE utf8_unicode_ci,
  `github` text COLLATE utf8_unicode_ci,
  `tumblr` text COLLATE utf8_unicode_ci,
  `vine` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to` int(11) NOT NULL,
  `deadline` date DEFAULT NULL,
  `labels` text COLLATE utf8_unicode_ci,
  `points` tinyint(4) NOT NULL DEFAULT '1',
  `status` enum('to_do','in_progress','done') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do',
  `start_date` date NOT NULL,
  `collaborators` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `project_id`, `milestone_id`, `assigned_to`, `deadline`, `labels`, `points`, `status`, `start_date`, `collaborators`, `deleted`) VALUES
(1, 'Input Data Tahap 1', 'Menginput Data tahap 1', 1, 0, 1, '2017-08-27', '', 1, 'to_do', '2017-08-20', '1', 0),
(2, 'UI Design HTML Pages', 'Module Web Design And Front End', 2, 2, 3, '2017-09-13', '', 4, 'in_progress', '2017-09-11', '3', 0),
(3, 'Responsive Devices On All Pages', '2.	Module Responsive All Devices', 2, 2, 3, '2017-09-14', '', 1, 'to_do', '2017-09-14', '3', 0),
(4, 'CMS Module and Backend', 'Module CMS Company Profile', 2, 4, 3, '2017-09-17', '', 5, 'to_do', '2017-09-16', '3', 0),
(5, 'Front End Integration', 'Front End Integration Data ', 2, 5, 3, '2017-09-20', '', 5, 'to_do', '2017-09-17', '3', 0),
(6, 'Database Design System', 'Database Schema Design And Relational Tables', 2, 3, 3, '2017-09-16', '', 2, 'to_do', '2017-09-15', '3', 0),
(7, 'User Checked Unit Testing', '', 2, 6, 3, '2017-09-22', '', 1, 'to_do', '2017-09-21', '3', 0),
(8, 'Mengumpulkan Data', '', 3, 7, 1, '2018-03-21', '', 1, 'to_do', '2018-03-19', '1', 0),
(9, 'Desain Database', '', 3, 8, 1, '2018-03-25', '', 1, 'to_do', '2018-03-22', '1', 0),
(10, 'Modul Master Data', '', 3, 9, 1, '2018-04-03', '', 3, 'to_do', '2018-04-01', '1', 0),
(11, 'Modul Reference Data', '', 3, 9, 1, '2018-04-05', '', 1, 'to_do', '2018-04-04', '1', 0),
(12, 'Modul Master Report COA', '', 3, 9, 1, '2018-04-05', '', 1, 'to_do', '2018-04-05', '1', 0),
(13, 'Desain Skema Laporan', '', 3, 8, 1, '2018-03-30', '', 1, 'to_do', '2018-03-26', '1', 0),
(14, 'Desain Skema Purchase & Sales', '', 3, 8, 1, '2018-03-31', '', 1, 'to_do', '2018-03-28', '1', 0),
(15, 'Implementasi Sistem Travel', '', 3, 10, 1, '2018-04-23', '', 1, 'to_do', '2018-04-01', '1', 0),
(16, 'Vendor Sistem', '', 3, 10, 1, '2018-04-08', '', 2, 'to_do', '2018-04-06', '1', 0),
(17, 'CRUD Customers', '', 3, 10, 1, '2018-03-20', '', 1, 'to_do', '2018-04-09', '1', 0),
(18, 'Fitur Purchase Order', '', 3, 10, 1, '2018-04-14', '', 1, 'to_do', '2018-04-10', '1', 0),
(19, 'Fitur Sales Order', '', 3, 10, 1, '2018-04-17', '', 2, 'to_do', '2018-04-15', '1', 0),
(20, 'Fitur Sales Quotation', '', 3, 10, 1, '2018-04-20', '', 2, 'to_do', '2018-04-18', '1', 0),
(21, 'Fitur Purchase Request', '', 3, 10, 1, '2018-04-22', '', 2, 'to_do', '2018-04-21', '1', 0),
(22, 'Fitur Invoice ', '', 3, 10, 1, '2018-04-24', '', 2, 'to_do', '2018-04-23', '1', 0),
(23, 'Fitur Tax (Pajak)', '', 3, 10, 1, '2018-04-25', '', 1, 'to_do', '2018-04-25', '1', 0),
(24, 'Fitur AP & AR', '', 3, 10, 1, '2018-04-27', '', 4, 'to_do', '2018-04-26', '1', 0),
(25, 'Modul Master Asset (Fix)', '', 3, 9, 1, '2018-04-05', '', 1, 'to_do', '2018-04-05', '1', 0),
(26, 'Modul Master Produk', '', 3, 9, 1, '2018-04-05', '', 2, 'to_do', '2018-04-02', '', 0),
(27, 'Laporan NERACA SALDO', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0),
(28, 'Laporan LABA RUGI', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0),
(29, 'Laporan Arus Kas', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0),
(30, 'Laporan Kas Penjualan', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0),
(31, 'Laporan Penyusutan Aset', '', 3, 11, 1, '2018-05-05', '', 1, 'to_do', '2018-04-30', '1', 0),
(32, 'Laporan Perubahan Modal', '', 3, 11, 1, '2018-05-05', '', 1, 'to_do', '2018-04-30', '1', 0),
(33, 'Laporan LABA RUGI per Projects', '', 3, 11, 1, '2018-05-05', '', 2, 'to_do', '2018-04-30', '1', 0),
(34, 'Laporan per Produk', '', 3, 11, 1, '2018-05-05', '', 2, 'to_do', '2018-04-30', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `deleted`) VALUES
(1, 'Tax (10%)', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction_detail`
--

CREATE TABLE `tbl_transaction_detail` (
  `id` int(11) NOT NULL,
  `coa` int(11) NOT NULL,
  `debet` double NOT NULL,
  `kredit` double NOT NULL,
  `fid_transaction` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaction_detail`
--

INSERT INTO `tbl_transaction_detail` (`id`, `coa`, `debet`, `kredit`, `fid_transaction`, `deleted`) VALUES
(1, 2, 100000, 0, 3, 0),
(2, 12, 0, 100000, 3, 0),
(3, 6, 10000, 0, 3, 0),
(4, 17, 0, 10000, 3, 0),
(5, 4, 10000, 0, 3, 0),
(6, 24, 0, 10000, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `title`, `members`, `deleted`) VALUES
(1, 'Developers', '3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_member_job_info`
--

CREATE TABLE `team_member_job_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_hire` date NOT NULL DEFAULT '0000-00-00',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `salary` double NOT NULL DEFAULT '0',
  `salary_term` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team_member_job_info`
--

INSERT INTO `team_member_job_info` (`id`, `user_id`, `date_of_hire`, `deleted`, `salary`, `salary_term`) VALUES
(1, 3, '2017-08-17', 0, 2000000, '5000000'),
(2, 5, '2018-04-28', 0, 1000000, '');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('new','client_replied','open','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime DEFAULT NULL,
  `assigned_to` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `client_id`, `ticket_type_id`, `title`, `created_by`, `created_at`, `status`, `last_activity_at`, `assigned_to`, `labels`, `deleted`) VALUES
(1, 1, 1, 'tanya pembayaran', 2, '2017-08-17 12:41:23', 'new', '2017-08-17 12:41:23', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`id`, `created_by`, `created_at`, `description`, `ticket_id`, `files`, `deleted`) VALUES
(1, 2, '2017-08-17 12:41:23', 'saya mau nanya perihal pembayaran menggunakan apa dan konfirmasi kemana ?', 1, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `title`, `deleted`) VALUES
(1, 'General Support', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_journal`
--

CREATE TABLE `transaction_journal` (
  `id` int(11) NOT NULL,
  `journal_code` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `voucher_code` varchar(100) NOT NULL,
  `fid_coa` char(10) NOT NULL,
  `fid_header` int(11) DEFAULT NULL,
  `debet` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_journal`
--

INSERT INTO `transaction_journal` (`id`, `journal_code`, `date`, `type`, `description`, `voucher_code`, `fid_coa`, `fid_header`, `debet`, `credit`, `username`, `created_at`, `deleted`) VALUES
(59, '001/RAN/INV/180711', '2018-07-11', 'sales', 'Oke', '', '12', 0, 1650000, 0, 'admin', NULL, 0),
(60, '001/RAN/INV/180711', '2018-07-11', 'sales', 'Oke', '', '44', 0, 0, 1650000, 'admin', NULL, 0),
(61, '001/RAN/PAY/180711', '2018-07-11', 'sales', 'Oke', '', '66', 0, 1650000, 0, 'admin', NULL, 0),
(62, '001/RAN/PAY/180711', '2018-07-11', 'sales', 'Oke', '', '12', 0, 0, 1650000, 'admin', NULL, 0),
(63, '014/RAN/INV/180711', '2018-07-11', 'sales', 'Oke', '', '66', 0, 650000, 0, 'admin', NULL, 0),
(64, '014/RAN/INV/180711', '2018-07-11', 'sales', 'Oke', '', '12', 0, 1000000, 0, 'admin', NULL, 0),
(65, '014/RAN/INV/180711', '2018-07-11', 'sales', 'Oke', '', '29', 0, 0, 650000, 'admin', NULL, 0),
(66, '014/RAN/INV/180711', '2018-07-11', 'sales', 'Oke', '', '44', 0, 0, 1000000, 'admin', NULL, 0),
(67, '011/RAN/PAY/180711', '2018-07-11', 'sales', 'Lunas', '', '66', 0, 1000000, 0, 'admin', NULL, 0),
(68, '011/RAN/PAY/180711', '2018-07-11', 'sales', 'Lunas', '', '29', 0, 0, 0, 'admin', NULL, 0),
(69, '011/RAN/PAY/180711', '2018-07-11', 'sales', 'Lunas', '', '12', 0, 0, 1000000, 'admin', NULL, 0),
(70, '011/RAN/PAY/180711', '0000-00-00', 'sales', 'Lunas', '', '44', 0, 0, 0, 'admin', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_journal_header`
--

CREATE TABLE `transaction_journal_header` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `fid_coa` int(11) NOT NULL,
  `voucher_code` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_journal_header`
--

INSERT INTO `transaction_journal_header` (`id`, `code`, `fid_coa`, `voucher_code`, `date`, `description`, `status`, `type`, `deleted`) VALUES
(1, 'RAN180706085530', 0, 'VC001020', '2018-07-06', 'Pembelian\n', 1, 'jurnal_umum', 0),
(2, 'RAN180711090719', 66, 'BKM-18003', '2018-07-11', 'memo', 1, 'income', 0),
(3, 'RAN180711090736', 66, 'BKK-18004', '2018-07-11', 'Vouchlll', 1, 'expenses', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('staff','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `notification_checked_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `job_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT '0',
  `note` mediumtext COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `alternative_address` text COLLATE utf8_unicode_ci,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT '0000-00-00',
  `ssn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `sticky_note` mediumtext COLLATE utf8_unicode_ci,
  `skype` text COLLATE utf8_unicode_ci,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT '1',
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_type`, `is_admin`, `role_id`, `email`, `password`, `image`, `status`, `message_checked_at`, `client_id`, `notification_checked_at`, `is_primary_contact`, `job_title`, `disable_login`, `note`, `address`, `alternative_address`, `phone`, `alternative_phone`, `dob`, `ssn`, `gender`, `sticky_note`, `skype`, `enable_web_notification`, `enable_email_notification`, `created_at`, `deleted`) VALUES
(1, 'Super', 'Admin', 'staff', 1, 0, 'nugasoft.studio@gmail.com', 'e89f883d762bef9c0af3f046a06e4cf1', '_file59958565e9dca-avatar.png', 'active', '2018-06-25 16:03:16', 0, '2018-06-25 16:03:13', 0, 'Admin', 0, NULL, '', '', '085778805131', '', '0000-00-00', '', 'male', 'Diias', '', 1, 1, '2017-08-16 13:04:45', 0),
(2, 'jpunk', 'slow', 'client', 0, 0, 'nugashare@gmail.com', 'e89f883d762bef9c0af3f046a06e4cf1', '_file599587f178660-avatar.png', 'active', '2017-08-17 12:45:50', 1, '2017-08-17 12:45:51', 1, 'Manager Proyek', 0, NULL, NULL, NULL, '085778805131', NULL, '0000-00-00', NULL, 'male', NULL, '', 1, 1, '2017-08-17 12:05:00', 0),
(3, 'Dian', 'Nugraha', 'staff', 0, 0, 'employe1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '_file599593bee682f-avatar.png', 'active', '0000-00-00 00:00:00', 0, '2017-08-17 13:22:16', 0, 'Senior Developers', 0, NULL, '', '', '08124235553', '', '0000-00-00', '', 'male', NULL, '', 1, 1, '2017-08-17 12:23:10', 0),
(4, 'Qodar', 'Askara', 'client', 0, 0, 'qodar@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'active', '0000-00-00 00:00:00', 2, '0000-00-00 00:00:00', 1, 'Web Division', 0, NULL, NULL, NULL, '08599235', NULL, '0000-00-00', NULL, 'male', NULL, '', 1, 1, '2017-09-11 10:11:58', 0),
(5, 'Dimas', 'Baskoro', 'staff', 0, 0, 'dimaskoro.88@gmail.com', '0192023a7bbd73250516f069df18b500', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Accounting', 0, NULL, 'dimaskoro.88@gmail.com', NULL, '09238835235', NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-04-27 12:45:55', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_aging_sales`
-- (See below for the actual view)
--
CREATE TABLE `v_aging_sales` (
`id` int(11)
,`fid_cust` int(11)
,`inv_date` datetime
,`currency` varchar(10)
,`CODE` varchar(50)
,`NAME` varchar(100)
,`termin` varchar(50)
,`amount` double
,`residual` double
,`jumlah` int(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_transaction`
-- (See below for the actual view)
--
CREATE TABLE `v_transaction` (
`tbl` varchar(1)
,`id` bigint(20)
,`tgl` datetime
,`kredit` double
,`debet` double
,`dari_kas` bigint(20)
,`untuk_kas` bigint(20)
,`transaksi` bigint(20)
,`ket` varchar(255)
,`user` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `v_aging_sales`
--
DROP TABLE IF EXISTS `v_aging_sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_aging_sales`  AS  select `a`.`id` AS `id`,`a`.`fid_cust` AS `fid_cust`,`a`.`inv_date` AS `inv_date`,`a`.`currency` AS `currency`,`a`.`code` AS `CODE`,`b`.`name` AS `NAME`,`b`.`termin` AS `termin`,`a`.`amount` AS `amount`,`a`.`residual` AS `residual`,(to_days(curdate()) - to_days(`a`.`inv_date`)) AS `jumlah` from (`sales_invoices` `a` join `master_customers` `b` on((`a`.`fid_cust` = `b`.`id`))) where ((`a`.`status` = 'posting') and (`a`.`paid` in ('Not Paid','Credit')) and (`a`.`deleted` = 0) and (`a`.`inv_date` <= curdate())) group by `a`.`code` ;

-- --------------------------------------------------------

--
-- Structure for view `v_transaction`
--
DROP TABLE IF EXISTS `v_transaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_transaction`  AS  select 'D' AS `tbl`,`acc_transaction`.`id` AS `id`,`acc_transaction`.`tgl_catat` AS `tgl`,if((`acc_transaction`.`dk` = 'K'),`acc_transaction`.`jumlah`,if(isnull(`acc_transaction`.`dk`),`acc_transaction`.`jumlah`,0)) AS `kredit`,if((`acc_transaction`.`dk` = 'D'),`acc_transaction`.`jumlah`,if(isnull(`acc_transaction`.`dk`),`acc_transaction`.`jumlah`,0)) AS `debet`,`acc_transaction`.`dari_kas_id` AS `dari_kas`,`acc_transaction`.`untuk_kas_id` AS `untuk_kas`,`acc_transaction`.`jns_trans` AS `transaksi`,`acc_transaction`.`keterangan` AS `ket`,`acc_transaction`.`user_name` AS `user` from `acc_transaction` order by `acc_transaction`.`tgl_catat` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_coa`
--
ALTER TABLE `acc_coa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_aktiva` (`kd_aktiva`);

--
-- Indexes for table `acc_coa_type`
--
ALTER TABLE `acc_coa_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_voucher` (`code_voucher`);

--
-- Indexes for table `acc_nama_kas_tbl`
--
ALTER TABLE `acc_nama_kas_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_saldo_awal`
--
ALTER TABLE `acc_saldo_awal`
  ADD PRIMARY KEY (`periode`,`no_rek`);

--
-- Indexes for table `acc_sources`
--
ALTER TABLE `acc_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_transaction`
--
ALTER TABLE `acc_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `dari_kas_id` (`dari_kas_id`,`untuk_kas_id`),
  ADD KEY `untuk_kas_id` (`untuk_kas_id`),
  ADD KEY `jns_trans` (`jns_trans`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `checked_by` (`checked_by`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_forms`
--
ALTER TABLE `estimate_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_requests`
--
ALTER TABLE `estimate_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_articles`
--
ALTER TABLE `help_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_categories`
--
ALTER TABLE `help_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `user_id` (`applicant_id`),
  ADD KEY `checked_by` (`checked_by`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_assets`
--
ALTER TABLE `master_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_customers`
--
ALTER TABLE `master_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `master_items`
--
ALTER TABLE `master_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_project`
--
ALTER TABLE `master_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_saldo_awal`
--
ALTER TABLE `master_saldo_awal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_vendor`
--
ALTER TABLE `master_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_from` (`from_user_id`),
  ADD KEY `message_to` (`to_user_id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`event`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_comments`
--
ALTER TABLE `project_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_settings`
--
ALTER TABLE `project_settings`
  ADD UNIQUE KEY `unique_index` (`project_id`,`setting_name`);

--
-- Indexes for table `project_time`
--
ALTER TABLE `project_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `purchase_invoices_items`
--
ALTER TABLE `purchase_invoices_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_request`
--
ALTER TABLE `purchase_request`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ref_items_category`
--
ALTER TABLE `ref_items_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_kabupaten`
--
ALTER TABLE `ref_kabupaten`
  ADD PRIMARY KEY (`id_kab`);

--
-- Indexes for table `ref_kecamatan`
--
ALTER TABLE `ref_kecamatan`
  ADD PRIMARY KEY (`id_kec`);

--
-- Indexes for table `ref_provinsi`
--
ALTER TABLE `ref_provinsi`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indexes for table `ref_unit_type`
--
ALTER TABLE `ref_unit_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sales_invoices_items`
--
ALTER TABLE `sales_invoices_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_payments`
--
ALTER TABLE `sales_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_quotation`
--
ALTER TABLE `sales_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_quotation_items`
--
ALTER TABLE `sales_quotation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaction_detail`
--
ALTER TABLE `tbl_transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_member_job_info`
--
ALTER TABLE `team_member_job_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_journal`
--
ALTER TABLE `transaction_journal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `created_at` (`created_at`);

--
-- Indexes for table `transaction_journal_header`
--
ALTER TABLE `transaction_journal_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_type` (`user_type`),
  ADD KEY `email` (`email`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `deleted` (`deleted`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_coa`
--
ALTER TABLE `acc_coa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `acc_coa_type`
--
ALTER TABLE `acc_coa_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `acc_general_ledger`
--
ALTER TABLE `acc_general_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `acc_nama_kas_tbl`
--
ALTER TABLE `acc_nama_kas_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `acc_sources`
--
ALTER TABLE `acc_sources`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `acc_transaction`
--
ALTER TABLE `acc_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estimate_forms`
--
ALTER TABLE `estimate_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_items`
--
ALTER TABLE `estimate_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estimate_requests`
--
ALTER TABLE `estimate_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `help_articles`
--
ALTER TABLE `help_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `help_categories`
--
ALTER TABLE `help_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_assets`
--
ALTER TABLE `master_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_customers`
--
ALTER TABLE `master_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_items`
--
ALTER TABLE `master_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_project`
--
ALTER TABLE `master_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_saldo_awal`
--
ALTER TABLE `master_saldo_awal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `master_vendor`
--
ALTER TABLE `master_vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_comments`
--
ALTER TABLE `project_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_time`
--
ALTER TABLE `project_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase_invoices`
--
ALTER TABLE `purchase_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_invoices_items`
--
ALTER TABLE `purchase_invoices_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_request`
--
ALTER TABLE `purchase_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_request_items`
--
ALTER TABLE `purchase_request_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ref_items_category`
--
ALTER TABLE `ref_items_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ref_unit_type`
--
ALTER TABLE `ref_unit_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_invoices`
--
ALTER TABLE `sales_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sales_invoices_items`
--
ALTER TABLE `sales_invoices_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_order_items`
--
ALTER TABLE `sales_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales_payments`
--
ALTER TABLE `sales_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sales_quotation`
--
ALTER TABLE `sales_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_quotation_items`
--
ALTER TABLE `sales_quotation_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transaction_detail`
--
ALTER TABLE `tbl_transaction_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_member_job_info`
--
ALTER TABLE `team_member_job_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction_journal`
--
ALTER TABLE `transaction_journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `transaction_journal_header`
--
ALTER TABLE `transaction_journal_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
