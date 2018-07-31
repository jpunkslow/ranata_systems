/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100113
 Source Host           : localhost:3306
 Source Schema         : ranata_dev

 Target Server Type    : MySQL
 Target Server Version : 100113
 File Encoding         : 65001

 Date: 31/07/2018 11:06:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acc_coa
-- ----------------------------
DROP TABLE IF EXISTS `acc_coa`;
CREATE TABLE `acc_coa`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kd_aktiva` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coa` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jns_trans` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `akun` enum('Aktiva','Pasiva') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `laba_rugi` enum('','PENDAPATAN','BIAYA') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `neraca` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pemasukan` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pengeluaran` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `saldo_awal` double NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kd_aktiva`(`kd_aktiva`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acc_coa
-- ----------------------------
INSERT INTO `acc_coa` VALUES (5, 'A4', '100.202', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (6, 'A5', '100.203', 'Pinjaman Pembiayaan', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (7, 'A6', '100.201', 'Pinjaman', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (8, 'A7', '100.204', 'Pinjaman Investasi', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (9, 'A8', '100.301', 'Persediaan Barang', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (10, 'A9', '100.401', 'Biaya Dibayar Dimuka', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (11, 'A10', '', 'Perlengkapan Usaha', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (17, 'C', '', 'Aktiva Tetap Berwujud', 'Aktiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (18, 'C1', '', 'Peralatan Kantor', 'Aktiva', '', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (21, 'C2', '', 'Aktiva Tetap Lainnya', 'Aktiva', '', 'Y', 'Y', 'N', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (26, 'E', '', 'Modal Pribadi', 'Aktiva', '', 'Y', NULL, NULL, 'N', 0, 0);
INSERT INTO `acc_coa` VALUES (27, 'E1', '', 'Prive', 'Aktiva', '', 'Y', 'Y', 'Y', 'N', 0, 0);
INSERT INTO `acc_coa` VALUES (28, 'F', '', 'Utang', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (29, 'F1', '200.102', 'Utang Usaha', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (31, 'K3', '', 'Pengeluaran Lainnya', 'Aktiva', '', 'Y', 'N', 'Y', 'N', 0, 0);
INSERT INTO `acc_coa` VALUES (32, 'F4', '200.103', 'Simpanan Sukarela', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (33, 'F5', '200.103', 'Utang Pajak', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (36, 'H', '', 'Utang Jangka Panjang', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (37, 'H1', '', 'Utang Bank', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (38, 'H2', '', 'Obligasi', 'Pasiva', '', 'Y', 'Y', 'Y', 'N', 0, 0);
INSERT INTO `acc_coa` VALUES (39, 'I', '', 'Modal', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (40, 'I1', '300.101', 'Simpanan Pokok', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (41, 'I2', '200.108', 'Simpanan Wajib', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (42, 'I3', '', 'Modal Awal', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (43, 'I4', '', 'Modal Penyertaan', 'Pasiva', '', 'Y', 'Y', 'Y', 'N', 0, 0);
INSERT INTO `acc_coa` VALUES (44, 'I5', '300.105', 'Modal Sumbangan', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (45, 'I6', '300.106', 'Modal Cadangan', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (47, 'J', '400.101', 'Pendapatan Blanko', 'Pasiva', 'PENDAPATAN', 'Y', 'N', 'N', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (48, 'J1', '', 'Pembayaran Angsuran', 'Pasiva', '', 'Y', NULL, NULL, 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (49, 'J2', '400.199', 'Pendapatan Lainnya', 'Pasiva', 'PENDAPATAN', 'Y', 'Y', 'N', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (50, 'K', '500.100', 'Beban', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (52, 'K2', '500.101', 'Beban Gaji Karyawan', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (53, 'K3', '500.102', 'Biaya Listrik dan Air', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (54, 'K4', '500.103', 'Biaya Transportasi', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (60, 'K10', '500.199', 'Biaya Lainnya', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (110, 'TRF', '', 'Transfer Antar Kas', NULL, '', 'Y', NULL, NULL, 'N', 0, 0);
INSERT INTO `acc_coa` VALUES (111, 'A11', '', 'Permisalan', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (112, 'F6', '200.109', 'Hutang Suspend', 'Pasiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (113, 'J3', '400.103', 'Pendapatan Pembiayaan', 'Pasiva', 'PENDAPATAN', 'Y', 'N', 'N', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (114, 'K5', '500.104', 'Biaya Admin Bank', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (115, 'K6', '500.105', 'Biaya Perizinan', 'Aktiva', 'BIAYA', 'Y', 'N', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (116, 'A4', '100.202', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);
INSERT INTO `acc_coa` VALUES (117, 'A4', '100.202', 'Piutang Usaha', 'Aktiva', '', 'Y', 'Y', 'Y', 'Y', 0, 0);

-- ----------------------------
-- Table structure for acc_coa_type
-- ----------------------------
DROP TABLE IF EXISTS `acc_coa_type`;
CREATE TABLE `acc_coa_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Nomor Akun',
  `account_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Nama Akun',
  `parent` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Tipe Akun',
  `normally` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Saldo Normal',
  `account_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Jenis Akun',
  `reporting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Jenis Laporan',
  `cashflow` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `neraca` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `akun` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parental` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_coa_type
-- ----------------------------
INSERT INTO `acc_coa_type` VALUES (1, '100', 'KAS DAN BANK', 'Head', 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (2, '210', 'BEBAN & PAJAK YANG MASIH HARUS DIBAYAR', 'Head', 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (3, '210001', 'Hutang Beban Gaji', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 2, 0);
INSERT INTO `acc_coa_type` VALUES (4, '100004', 'Bank Central Asia (IDR)-5170505001', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (5, '100005', 'Bank Mandiri (IDR)-1300010012857', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (6, '100006', 'Bank Mandiri (IDR)-1300011823930', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (7, '100007', 'Bank Mandiri (USD)-1300011823948', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (8, '100008', 'Bank Mandiri (USD)-1300009554422', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (9, '100009', 'Bank Jabar Banten-0005427592001', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (10, '100010', 'Deposito BPR Arthaguna Mandiri', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (11, '110', 'PIUTANG USAHA', 'Head', 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (12, '110001', 'Piutang Usaha (IDR)', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 11, 0);
INSERT INTO `acc_coa_type` VALUES (13, '110002', 'Piutang Usaha (USD)', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 11, 0);
INSERT INTO `acc_coa_type` VALUES (14, '130', 'UANG MUKA PEMBELIAN', 'Head', 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (15, '130001', 'Uang Muka Pembelian', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 14, 0);
INSERT INTO `acc_coa_type` VALUES (16, '150', 'PERSEDIAAN BARANG', 'Head', 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (17, '150001', 'Persediaan Barang (Deposit Tiket)', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pengeluaran', 16, 0);
INSERT INTO `acc_coa_type` VALUES (18, '140', 'BIAYA DIBAYAR DIMUKA', 'Head', 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (19, '140001', 'Sewa dibayar dimuka', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pengeluaran', 18, 0);
INSERT INTO `acc_coa_type` VALUES (20, '160', 'AKTIVA LANCAR', 'Head', 'Debet', 'Aktiva Lancar', NULL, '', NULL, '', 0, 0);
INSERT INTO `acc_coa_type` VALUES (21, '160001', 'Gedung', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pengeluaran', 20, 0);
INSERT INTO `acc_coa_type` VALUES (22, '160002', 'Peralatan Kantor', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pengeluaran', 20, 0);
INSERT INTO `acc_coa_type` VALUES (23, '161', 'AKUMULASI PENYUSUTAN', 'Head', 'Kredit', 'Aktiva Lancar', 'Neraca', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (24, '161001', 'Akumulasi Penyusutan Bangunan', NULL, 'Kredit', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 23, 0);
INSERT INTO `acc_coa_type` VALUES (25, '120', 'PIUTANG LAIN-LAIN', 'Head', 'Debet', 'Aktiva Tidak Lancar Lainnya', 'Neraca', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (26, '200', 'HUTANG USAHA', 'Head', 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (27, '200001', 'Hutang Usaha (IDR)', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 26, 0);
INSERT INTO `acc_coa_type` VALUES (28, '240', 'UANG MUKA PENJUALAN', 'Head', 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (29, '240001', 'Uang Muka Penjualan (IDR)', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pemasukan', 28, 0);
INSERT INTO `acc_coa_type` VALUES (30, '210002', 'Hutang Beban Listrik dan Air', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 2, 0);
INSERT INTO `acc_coa_type` VALUES (31, '210003', 'Hutang Beban Telpon dan Fax', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 2, 0);
INSERT INTO `acc_coa_type` VALUES (32, '220', 'HUTANG JANGKA PANJANG', 'Head', 'Kredit', 'Hutang Jangka Panjang', 'Neraca', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (33, '220001', 'Hutang Bank (IDR)', NULL, 'Kredit', 'Hutang Jangka Panjang', 'Neraca', '', NULL, 'pengeluaran', 32, 0);
INSERT INTO `acc_coa_type` VALUES (34, '220002', 'Hutang Leasing (IDR)', NULL, 'Kredit', 'Hutang Jangka Panjang', 'Neraca', '', NULL, 'pemasukan', 32, 0);
INSERT INTO `acc_coa_type` VALUES (35, '230', 'HUTANG LAIN-LAIN', 'Head', 'Kredit', 'Hutang Jangka Panjang', 'Neraca', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (37, '230001', 'Hutang Kepada Pemegang Saham', NULL, 'Kredit', 'Hutang Jangka Panjang', 'Neraca', '', NULL, 'pengeluaran', 35, 0);
INSERT INTO `acc_coa_type` VALUES (38, '300', 'MODAL', 'Head', 'Kredit', 'Modal', 'Neraca', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (39, '300001', 'Modal Saham', NULL, 'Kredit', 'Modal', 'Neraca', '', NULL, 'pemasukan', 38, 0);
INSERT INTO `acc_coa_type` VALUES (40, '300002', 'Deviden', NULL, 'Kredit', 'Modal', 'Neraca', '', NULL, 'pemasukan', 38, 0);
INSERT INTO `acc_coa_type` VALUES (42, '300003', 'Laba Ditahan', NULL, 'Kredit', 'Modal', 'Neraca', '', NULL, 'pemasukan', 38, 0);
INSERT INTO `acc_coa_type` VALUES (43, '400', 'PENDAPATAN', 'Head', 'Kredit', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (44, '400101', 'Penjualan Barang', NULL, 'Kredit', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 43, 0);
INSERT INTO `acc_coa_type` VALUES (45, '400112', 'Pendapatan Jasa', NULL, 'Kredit', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 43, 0);
INSERT INTO `acc_coa_type` VALUES (46, '500', 'BEBAN POKOK PENJUALAN', 'Head', 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (47, '500001', 'Harga Pokok Penjualan (HPP) Ticketing', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 46, 0);
INSERT INTO `acc_coa_type` VALUES (48, '500002', 'Harga Pokok Penjualan (HPP) Tour And Travel', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 46, 0);
INSERT INTO `acc_coa_type` VALUES (50, '600', 'BEBAN OPERASIONAL', 'Head', 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (51, '600100001', 'Beban Gaji & Tunjangan Karyawan', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (52, '600100002', 'Beban THR Karyawan', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (53, '700', 'PENDAPATAN NON OPERASIONAL', 'Head', 'Kredit', 'Pendapatan Lain-lain ', 'Laba Rugi', '', NULL, 'pemasukan', 0, 0);
INSERT INTO `acc_coa_type` VALUES (54, '160003', 'Kendaraan', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pengeluaran', 20, 0);
INSERT INTO `acc_coa_type` VALUES (55, '800', 'BEBAN NON OPERASIONAL', 'Head', 'Debet', 'Beban Lain-lain', 'Laba Rugi', '', NULL, 'pengeluaran', 0, 0);
INSERT INTO `acc_coa_type` VALUES (56, '800001', 'Beban Administrasi Bank', NULL, 'Debet', 'Beban Lain-lain', 'Laba Rugi', '', NULL, 'pengeluaran', 55, 0);
INSERT INTO `acc_coa_type` VALUES (64, '700001', 'Bunga Bank & Jasa Giro', NULL, 'Kredit', 'Pendapatan Lain-lain ', 'Laba Rugi', '', NULL, 'pemasukan', 53, 0);
INSERT INTO `acc_coa_type` VALUES (65, '100011', 'Bank BRI', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (66, '100001', 'Kas (IDR)', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (67, '100002', 'Kas (USD)', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (68, '100003', 'Bank Central Asia (IDR)-5170505001', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 1, 0);
INSERT INTO `acc_coa_type` VALUES (69, '161002', 'Akumulasi Penyusutan Peralatan Kantor', NULL, 'Kredit', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 23, 0);
INSERT INTO `acc_coa_type` VALUES (70, '161003', 'Akumulasi Penyusutan Kendaraan', NULL, 'Kredit', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 23, 0);
INSERT INTO `acc_coa_type` VALUES (71, '120001', 'Piutang Pemegang Saham (IDR)', NULL, 'Debet', 'Aktiva Tidak Lancar Lainnya', 'Neraca', '', NULL, 'pemasukan', 25, 0);
INSERT INTO `acc_coa_type` VALUES (72, '200002', 'Hutang Usaha (USD)', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 26, 0);
INSERT INTO `acc_coa_type` VALUES (73, '600100003', 'Beban Kesejahteraan Karyawan', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (74, '700002', 'Laba Selisih Kurs', NULL, 'Kredit', 'Pendapatan Lain-lain ', 'Laba Rugi', '', NULL, 'pemasukan', 53, 0);
INSERT INTO `acc_coa_type` VALUES (75, '800002', 'Beban Bunga Pihak Ketiga', NULL, 'Debet', 'Beban Lain-lain', 'Laba Rugi', '', NULL, 'pengeluaran', 55, 0);
INSERT INTO `acc_coa_type` VALUES (76, '120002', 'Piutang Lain-lain', NULL, 'Debet', 'Aktiva Tidak Lancar Lainnya', 'Neraca', '', NULL, 'pemasukan', 25, 0);
INSERT INTO `acc_coa_type` VALUES (77, '150002', 'Deposit Jaminan', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 16, 0);
INSERT INTO `acc_coa_type` VALUES (78, '230002', 'Hutang Lain-lain', NULL, 'Kredit', 'Hutang Jangka Panjang', 'Neraca', '', NULL, 'pengeluaran', 35, 0);
INSERT INTO `acc_coa_type` VALUES (79, '600100004', 'Beban Pulsa & Pasca Bayar Direksi', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (80, '600100005', 'Beban Jasa Profesional', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (81, '600100006', 'Beban Legalitas & Perijinan', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (82, '800004', 'Bala', NULL, 'Debet', 'Aktiva', 'Neraca', '', NULL, 'pemasukan', 55, 1);
INSERT INTO `acc_coa_type` VALUES (83, '300102', 'Tiket Domestik', NULL, 'Kredit', 'Income', 'Laba Rugi', '', NULL, 'pemasukan', 44, 1);
INSERT INTO `acc_coa_type` VALUES (84, '80002', 'Beban Hidup', NULL, 'Debet', 'Aktiva', 'Laba Rugi', '', NULL, 'pemasukan', 75, 1);
INSERT INTO `acc_coa_type` VALUES (85, '80002', 'BEBAN HIDUP', NULL, 'Debet', 'Aktiva', 'Neraca', '', NULL, 'pemasukan', 75, 1);
INSERT INTO `acc_coa_type` VALUES (88, '400102', 'Online Ticketing', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 43, 0);
INSERT INTO `acc_coa_type` VALUES (89, '400102001', 'Ticket Pesawat (Domestik)', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 88, 0);
INSERT INTO `acc_coa_type` VALUES (90, '400102002', 'Ticket pesawat (International)', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 88, 0);
INSERT INTO `acc_coa_type` VALUES (91, '400106', 'Tour Package', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 43, 0);
INSERT INTO `acc_coa_type` VALUES (92, '400106001', 'Tour & Travel ke Jepang', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 91, 0);
INSERT INTO `acc_coa_type` VALUES (93, '400109', 'Hotel Reservation', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 43, 0);
INSERT INTO `acc_coa_type` VALUES (94, '400109001', 'Voucher Hotel (Domestik)', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 93, 0);
INSERT INTO `acc_coa_type` VALUES (95, '210004', 'PPN Keluaran', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pemasukan', 2, 0);
INSERT INTO `acc_coa_type` VALUES (96, '400109002', 'Voucher Hotel (International)', NULL, 'Debet', 'Pendapatan', 'Laba Rugi', '', NULL, 'pemasukan', 93, 0);
INSERT INTO `acc_coa_type` VALUES (97, '500003', 'Harga Pokok Penjualan (HPP) Voucher Hotel', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pemasukan', 46, 0);
INSERT INTO `acc_coa_type` VALUES (98, '500004', 'Harga Pokok Penjualan (HPP) Mice (Meeting, Insentif, Congres & Event)', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pemasukan', 46, 0);
INSERT INTO `acc_coa_type` VALUES (99, '500001001', 'HPP Tiket Pesawat (Domestik)', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pemasukan', 47, 0);
INSERT INTO `acc_coa_type` VALUES (100, '500001002', 'HPP Tiket Pesawat (International)', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pemasukan', 47, 0);
INSERT INTO `acc_coa_type` VALUES (101, '500003001', 'HPP Voucher Hotel (Domestik)', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pemasukan', 97, 0);
INSERT INTO `acc_coa_type` VALUES (102, '500003002', 'HPP Voucher Hotel (International)', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pemasukan', 97, 0);
INSERT INTO `acc_coa_type` VALUES (103, '600100', 'Beban Administrasi dan Umum', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 50, 0);
INSERT INTO `acc_coa_type` VALUES (104, '600100007', 'Beban Penyusutan Aktiva', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (105, '600100008', 'Beban Sewa Kendaraan', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (106, '600100009', 'Beban Pos & Materai', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (107, '600100010', 'Beban Alat Tulis Kantor (ATK)', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (108, '600100011', 'Beban Pajak', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (109, '600100012', 'Beban Listrik & Air', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (110, '600100013', 'Beban Telepon & Internet', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (111, '600100014', 'Beban Rumah Tangga Kantor', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (112, '600100015', 'Beban Transportasi Kantor', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (113, '600100017', 'Beban Perbaikan dan Pemeliharaan', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (114, '600100018', 'Beban Sewa Kantor', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (115, '620000', 'Beban Promosi & Pemasaran', NULL, 'Debet', 'Expenses', 'Laba Rugi', '', NULL, 'pengeluaran', 50, 0);
INSERT INTO `acc_coa_type` VALUES (116, '620001', 'Beban Iklan & Promosi ', NULL, 'Debet', 'Beban Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 115, 0);
INSERT INTO `acc_coa_type` VALUES (117, '620002', 'Beban Gift & Merchandise', NULL, 'Debet', 'Beban Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 115, 0);
INSERT INTO `acc_coa_type` VALUES (118, '620003', 'Beban Perjalanan Dinas', NULL, 'Debet', 'Beban Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 115, 0);
INSERT INTO `acc_coa_type` VALUES (119, '620004', 'Beban Komisi', NULL, 'Debet', 'Beban Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 115, 0);
INSERT INTO `acc_coa_type` VALUES (120, '620005', 'Beban Lain-lain', NULL, 'Debet', 'Beban Penjualan', 'Laba Rugi', '', NULL, 'pengeluaran', 115, 0);
INSERT INTO `acc_coa_type` VALUES (121, '700003', 'Pendapatan Lain-lain', NULL, 'Kredit', 'Pendapatan Lain-lain ', 'Laba Rugi', '', NULL, 'pemasukan', 53, 0);
INSERT INTO `acc_coa_type` VALUES (122, '800003', 'Beban Lain-lain', NULL, 'Debet', 'Beban Lain-lain', 'Laba Rugi', '', NULL, 'pengeluaran', 55, 0);
INSERT INTO `acc_coa_type` VALUES (123, '550005', 'Retur Potongan', NULL, 'Debet', 'Harga Pokok Penjualan', 'Laba Rugi', '', NULL, 'pemasukan', 46, 0);
INSERT INTO `acc_coa_type` VALUES (124, '210005', 'Hutang PPH Pasal 21', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 2, 0);

-- ----------------------------
-- Table structure for acc_general_ledger
-- ----------------------------
DROP TABLE IF EXISTS `acc_general_ledger`;
CREATE TABLE `acc_general_ledger`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_voucher` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `account_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `account_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `debit` double NOT NULL,
  `credit` double NOT NULL,
  `value` double NOT NULL,
  `status` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_voucher`(`code_voucher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of acc_general_ledger
-- ----------------------------
INSERT INTO `acc_general_ledger` VALUES (1, 'R00180521223007', '2018-05-21', 'dssdgsdg', '', '', 0, 0, 0, 1, 1);
INSERT INTO `acc_general_ledger` VALUES (3, 'R00180521223142', '2018-05-21', 'ini deskripsi', '', '', 0, 0, 0, 1, 0);
INSERT INTO `acc_general_ledger` VALUES (4, 'R00180510105035', '2018-05-09', 'ini deskripsi', '8', '100.204 Pinjaman Investasi', 10250000, 0, 10250000, 1, 0);

-- ----------------------------
-- Table structure for acc_nama_kas_tbl
-- ----------------------------
DROP TABLE IF EXISTS `acc_nama_kas_tbl`;
CREATE TABLE `acc_nama_kas_tbl`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aktif` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_simpan` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_penarikan` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_pinjaman` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_bayar` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_pemasukan` enum('Y','T') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tmpl_transfer` enum('Y','T') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acc_nama_kas_tbl
-- ----------------------------
INSERT INTO `acc_nama_kas_tbl` VALUES (1, 'Kas Tunai', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `acc_nama_kas_tbl` VALUES (2, 'Kas Besar', 'Y', 'T', 'T', 'T', 'T', 'Y', 'Y', 'Y');
INSERT INTO `acc_nama_kas_tbl` VALUES (3, 'Bank BRI', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');

-- ----------------------------
-- Table structure for acc_saldo_awal
-- ----------------------------
DROP TABLE IF EXISTS `acc_saldo_awal`;
CREATE TABLE `acc_saldo_awal`  (
  `periode` year NOT NULL,
  `date` date NOT NULL,
  `no_rek` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `debet` double NOT NULL DEFAULT 0,
  `kredit` double NOT NULL DEFAULT 0,
  `tgl_insert` date NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`periode`, `no_rek`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for acc_sources
-- ----------------------------
DROP TABLE IF EXISTS `acc_sources`;
CREATE TABLE `acc_sources`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aktif` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_simpan` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_penarikan` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_pinjaman` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_bayar` enum('Y','T') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tmpl_pemasukan` enum('Y','T') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tmpl_pengeluaran` enum('Y','T') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tmpl_transfer` enum('Y','T') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acc_sources
-- ----------------------------
INSERT INTO `acc_sources` VALUES (1, 'Kas Tunai', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `acc_sources` VALUES (2, 'Kas Besar', 'Y', 'T', 'T', 'T', 'T', 'Y', 'Y', 'Y');
INSERT INTO `acc_sources` VALUES (3, 'Bank BRI', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');

-- ----------------------------
-- Table structure for acc_transaction
-- ----------------------------
DROP TABLE IF EXISTS `acc_transaction`;
CREATE TABLE `acc_transaction`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tgl_catat` datetime(0) NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `akun` enum('Pemasukan','Pengeluaran','Transfer') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dari_kas_id` bigint(20) NULL DEFAULT NULL,
  `untuk_kas_id` bigint(20) NULL DEFAULT NULL,
  `jns_trans` bigint(20) NULL DEFAULT NULL,
  `dk` enum('D','K') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_data` datetime(0) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `dari_kas_id`(`dari_kas_id`, `untuk_kas_id`) USING BTREE,
  INDEX `untuk_kas_id`(`untuk_kas_id`) USING BTREE,
  INDEX `jns_trans`(`jns_trans`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acc_transaction
-- ----------------------------
INSERT INTO `acc_transaction` VALUES (1, '2016-09-30 20:38:00', 500000000, 'Modal Awal Koperasi', 'Pemasukan', NULL, 1, 42, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (2, '2016-10-05 19:35:00', 200000000, 'Dana Suspend Bulan Oktober 2016', 'Pemasukan', NULL, 3, 112, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (3, '2016-10-05 19:40:00', 1000000, 'Pengambilan Dana Simpanan', 'Pengeluaran', 3, NULL, 112, 'K', '2018-05-20 09:08:00', '');
INSERT INTO `acc_transaction` VALUES (4, '2016-10-07 14:11:00', 140000, 'AG0001 Pinjaman Pembiayaan', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (5, '2016-10-07 14:18:00', 100000, 'AG0001  Pinjaman Pembiayaan ID : AG0001', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (6, '2016-10-07 14:22:00', 100000, 'AG0001 Pinjaman', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (7, '2016-10-07 14:25:00', 80000, 'AG0001 Pinjaman', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (8, '2016-10-08 14:05:00', 200000, 'Pendapatan Admin', 'Pemasukan', NULL, 3, 49, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (9, '2016-10-08 14:10:00', 120000, 'Pinjaman Butuh', 'Pemasukan', NULL, 3, 47, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (10, '2016-10-08 14:48:00', 150000000, 'Gaji Karyawan', 'Pemasukan', NULL, 3, 112, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (11, '2016-10-08 15:18:00', 100000000, 'Modal Dari Rs Permata Cibubur', 'Pemasukan', NULL, 3, 44, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (12, '2016-10-08 15:21:00', 238989300, 'Dana Suspend', 'Pemasukan', NULL, 3, 112, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (13, '2018-03-15 18:47:00', 100000, 'A', 'Pemasukan', NULL, 1, 29, 'D', '0000-00-00 00:00:00', 'admin');
INSERT INTO `acc_transaction` VALUES (14, '2018-04-28 07:49:00', 100000, 'Jasa', 'Pemasukan', NULL, 1, 21, 'D', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for activity_logs
-- ----------------------------
DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE `activity_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NOT NULL,
  `created_by` int(11) NOT NULL,
  `action` enum('created','updated','deleted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `log_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `log_type_title` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `log_type_id` int(11) NOT NULL DEFAULT 0,
  `changes` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `log_for` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int(11) NOT NULL DEFAULT 0,
  `log_for2` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `log_for_id2` int(11) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of activity_logs
-- ----------------------------
INSERT INTO `activity_logs` VALUES (1, '2017-08-16 11:18:57', 1, 'created', 'task', 'Input Data Tahap 1', 1, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (2, '2017-08-16 11:19:40', 1, 'created', 'milestone', 'Input data Tahap 1', 1, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (3, '2017-08-17 12:19:00', 2, 'created', 'task_comment', 'Oke Mantap', 1, NULL, 'project', 1, 'task', 1, 0);
INSERT INTO `activity_logs` VALUES (4, '2017-08-21 09:29:18', 1, 'created', 'project_file', '_file599aa7ee8258c-ayo-bayar-zakat.jpg', 1, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (5, '2017-09-11 10:20:33', 1, 'created', 'task', 'UI Design HTML Pages', 2, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (6, '2017-09-11 10:21:09', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:2:{s:11:\"assigned_to\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"3\";}s:13:\"collaborators\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:1:\"3\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (7, '2017-09-11 10:22:37', 1, 'created', 'task', 'Responsive Devices On All Pages', 3, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (8, '2017-09-11 10:23:38', 1, 'created', 'task', 'CMS Module and Backend', 4, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (9, '2017-09-11 10:24:49', 1, 'created', 'milestone', 'Design UI/UX HTML', 2, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (10, '2017-09-11 10:25:39', 1, 'created', 'milestone', 'Database Design', 3, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (11, '2017-09-11 10:27:05', 1, 'created', 'milestone', 'Backend Procedure Design Administrator Pages', 4, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (12, '2017-09-11 10:27:32', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"2\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (13, '2017-09-11 10:27:40', 1, 'updated', 'task', 'Responsive Devices On All Pages', 3, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"2\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (14, '2017-09-11 10:27:47', 1, 'updated', 'task', 'CMS Module and Backend', 4, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"4\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (15, '2017-09-11 10:30:22', 1, 'created', 'project_file', '_file59b665be62cab-PROPOSAL-PENAWARAN.docx', 2, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (16, '2017-09-11 10:32:18', 1, 'updated', 'milestone', 'Backend Procedure Design Administrator Pages', 4, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:44:\"Backend Procedure Design Administrator Pages\";s:2:\"to\";s:23:\"Backend And Admin Panel\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (17, '2017-09-11 10:33:55', 1, 'created', 'milestone', 'Front End Including', 5, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (18, '2017-09-11 10:35:02', 1, 'created', 'task', 'Front End Integration', 5, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (19, '2017-09-11 10:35:31', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:1:{s:6:\"status\";a:2:{s:4:\"from\";s:5:\"to_do\";s:2:\"to\";s:11:\"in_progress\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (20, '2017-09-11 10:37:56', 1, 'created', 'task', 'Database Design System', 6, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (21, '2017-09-11 10:38:42', 1, 'updated', 'milestone', 'Backend And Admin Panel', 4, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2017-09-15\";s:2:\"to\";s:10:\"2017-09-16\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (22, '2017-09-11 10:39:20', 1, 'updated', 'task', 'CMS Module and Backend', 4, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2017-09-15\";s:2:\"to\";s:10:\"2017-09-16\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-16\";s:2:\"to\";s:10:\"2017-09-17\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (23, '2017-09-11 10:40:02', 1, 'updated', 'task', 'UI Design HTML Pages', 2, 'a:1:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"4\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (24, '2017-09-11 10:40:15', 1, 'updated', 'task', 'CMS Module and Backend', 4, 'a:1:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"2\";s:2:\"to\";s:1:\"5\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (25, '2017-09-11 10:40:22', 1, 'updated', 'task', 'Front End Integration', 5, 'a:1:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"5\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (26, '2017-09-11 10:40:36', 1, 'updated', 'task', 'Database Design System', 6, 'a:2:{s:6:\"points\";a:2:{s:4:\"from\";s:1:\"1\";s:2:\"to\";s:1:\"2\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-15\";s:2:\"to\";s:10:\"2017-09-16\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (27, '2017-09-11 10:41:56', 1, 'created', 'milestone', 'Unit Testing', 6, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (28, '2017-09-11 10:42:43', 1, 'created', 'task', 'User Checked Unit Testing', 7, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (29, '2017-09-11 10:43:08', 1, 'updated', 'task', 'User Checked Unit Testing', 7, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2017-09-21\";s:2:\"to\";s:10:\"2017-09-22\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-22\";s:2:\"to\";s:10:\"2017-09-23\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (30, '2017-09-11 10:43:23', 1, 'updated', 'milestone', 'Unit Testing', 6, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2017-09-21\";s:2:\"to\";s:10:\"2017-09-23\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (31, '2017-09-11 10:43:44', 1, 'updated', 'task', 'User Checked Unit Testing', 7, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2017-09-22\";s:2:\"to\";s:10:\"2017-09-21\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2017-09-23\";s:2:\"to\";s:10:\"2017-09-22\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (32, '2017-09-11 10:44:01', 1, 'updated', 'milestone', 'Unit Testing', 6, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2017-09-23\";s:2:\"to\";s:10:\"2017-09-21\";}}', 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (33, '2018-03-18 17:11:49', 1, 'created', 'milestone', 'Analisa Kebutuhan', 7, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (34, '2018-03-18 17:13:27', 1, 'created', 'milestone', 'Analisa Perancangan', 8, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (35, '2018-03-18 17:13:45', 1, 'created', 'milestone', 'Implementasi Modul', 9, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (36, '2018-03-18 17:14:30', 1, 'created', 'milestone', 'Implementasi Laporan', 10, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (37, '2018-03-18 17:15:37', 1, 'created', 'task', 'Mengumpulkan Data', 8, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (38, '2018-03-18 17:15:58', 1, 'updated', 'task', 'Mengumpulkan Data', 8, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"0000-00-00\";s:2:\"to\";s:10:\"2018-03-19\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"0000-00-00\";s:2:\"to\";s:10:\"2018-03-21\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (39, '2018-03-18 17:16:52', 1, 'created', 'task', 'Desain Database', 9, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (40, '2018-03-18 17:17:19', 1, 'updated', 'task', 'Desain Database', 9, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-03-23\";s:2:\"to\";s:10:\"2018-03-22\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (41, '2018-03-18 17:21:02', 1, 'created', 'task', 'Modul Master Data', 10, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (42, '2018-03-18 17:21:46', 1, 'created', 'task', 'Modul Reference Data', 11, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (43, '2018-03-18 17:22:21', 1, 'created', 'task', 'Modul Master Report COA', 12, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (44, '2018-03-18 17:23:37', 1, 'created', 'task', 'Desain Skema Laporan', 13, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (45, '2018-03-18 17:24:22', 1, 'created', 'task', 'Desain Skema Purchase & Sales', 14, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (46, '2018-03-18 17:25:35', 1, 'updated', 'task', 'Desain Database', 9, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-03-24\";s:2:\"to\";s:10:\"2018-03-25\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (47, '2018-03-18 17:26:34', 1, 'updated', 'task', 'Desain Skema Laporan', 13, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-03-28\";s:2:\"to\";s:10:\"2018-03-26\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (48, '2018-03-18 17:26:55', 1, 'updated', 'task', 'Desain Skema Purchase & Sales', 14, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-03-30\";s:2:\"to\";s:10:\"2018-03-28\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (49, '2018-03-18 17:27:18', 1, 'updated', 'task', 'Modul Master Data', 10, 'a:1:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-04-02\";s:2:\"to\";s:10:\"2018-04-01\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (50, '2018-03-18 17:28:07', 1, 'created', 'milestone', 'Implementasi Fitur', 11, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (51, '2018-03-18 17:28:20', 1, 'updated', 'milestone', 'Implementasi Laporan', 10, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:20:\"Implementasi Laporan\";s:2:\"to\";s:18:\"Implementasi Fitur\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (52, '2018-03-18 17:28:33', 1, 'updated', 'milestone', 'Implementasi Fitur', 11, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:18:\"Implementasi Fitur\";s:2:\"to\";s:20:\"Implementasi Laporan\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (53, '2018-03-18 17:29:07', 1, 'created', 'milestone', 'Bugs & Testing (FIXING)', 12, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (54, '2018-03-18 17:29:24', 1, 'updated', 'milestone', 'Bugs & Testing (FIXING)', 12, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2018-04-23\";s:2:\"to\";s:10:\"2018-04-28\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (55, '2018-03-18 17:30:55', 1, 'created', 'task', 'Implementasi Sistem Travel', 15, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (56, '2018-03-18 17:33:21', 1, 'created', 'task', 'Vendor Sistem', 16, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (57, '2018-03-18 17:34:08', 1, 'created', 'task', 'CRUD Customers', 17, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (58, '2018-03-18 17:35:36', 1, 'created', 'task', 'Fitur Purchase Order', 18, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (59, '2018-03-18 17:36:31', 1, 'created', 'task', 'Sales Order', 19, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (60, '2018-03-18 17:37:03', 1, 'updated', 'task', 'Sales Order', 19, 'a:1:{s:5:\"title\";a:2:{s:4:\"from\";s:11:\"Sales Order\";s:2:\"to\";s:17:\"Fitur Sales Order\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (61, '2018-03-18 17:37:54', 1, 'created', 'task', 'Fitur Sales Quotation', 20, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (62, '2018-03-18 17:39:04', 1, 'created', 'task', 'Fitur Purchase Request', 21, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (63, '2018-03-18 17:40:13', 1, 'created', 'task', 'Fitur Invoice ', 22, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (64, '2018-03-18 17:41:13', 1, 'updated', 'task', 'Fitur Invoice ', 22, 'a:2:{s:10:\"start_date\";a:2:{s:4:\"from\";s:10:\"2018-04-24\";s:2:\"to\";s:10:\"2018-04-23\";}s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-25\";s:2:\"to\";s:10:\"2018-04-24\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (65, '2018-03-18 17:41:24', 1, 'created', 'task', 'Fitur Tax (Pajak)', 23, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (66, '2018-03-18 17:41:35', 1, 'updated', 'task', 'Fitur Tax (Pajak)', 23, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-26\";s:2:\"to\";s:10:\"2018-04-25\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (67, '2018-03-18 17:42:19', 1, 'created', 'task', 'Fitur AP & AR', 24, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (68, '2018-03-18 17:43:17', 1, 'created', 'task', 'Modul Master Asset (Fix)', 25, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (69, '2018-03-18 17:44:01', 1, 'updated', 'task', 'Modul Master Asset (Fix)', 25, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-07\";s:2:\"to\";s:10:\"2018-04-05\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (70, '2018-03-18 17:46:20', 1, 'created', 'task', 'Modul Master Produk', 26, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (71, '2018-03-18 17:47:11', 1, 'updated', 'task', 'Implementasi Sistem Travel', 15, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-04-27\";s:2:\"to\";s:10:\"2018-04-23\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (72, '2018-03-18 17:48:28', 1, 'updated', 'milestone', 'Implementasi Laporan', 11, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2018-04-16\";s:2:\"to\";s:10:\"2018-04-30\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (73, '2018-03-18 17:48:47', 1, 'updated', 'milestone', 'Bugs & Testing (FIXING)', 12, 'a:1:{s:8:\"due_date\";a:2:{s:4:\"from\";s:10:\"2018-04-28\";s:2:\"to\";s:10:\"2018-05-07\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (74, '2018-03-18 17:49:34', 1, 'created', 'task', 'Laporan NERACA SALDO', 27, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (75, '2018-03-18 17:50:05', 1, 'created', 'task', 'Laporan LABA RUGI', 28, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (76, '2018-03-18 17:50:37', 1, 'created', 'task', 'Laporan Arus Kas', 29, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (77, '2018-03-18 17:52:26', 1, 'created', 'task', 'Laporan Kas Penjualan', 30, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (78, '2018-03-18 17:53:10', 1, 'created', 'task', 'Laporan Penyusutan Aset', 31, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (79, '2018-03-18 17:53:52', 1, 'created', 'task', 'Laporan Perubahan Modal', 32, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (80, '2018-03-18 17:54:32', 1, 'created', 'task', 'Laporan LABA RUGI per Projects', 33, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (81, '2018-03-18 17:54:58', 1, 'created', 'task', 'Laporan per Produk', 34, NULL, 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (82, '2018-03-18 17:55:27', 1, 'updated', 'task', 'Laporan NERACA SALDO', 27, 'a:1:{s:8:\"deadline\";a:2:{s:4:\"from\";s:10:\"2018-05-06\";s:2:\"to\";s:10:\"2018-05-05\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (83, '2018-03-18 17:55:53', 1, 'updated', 'task', 'Laporan LABA RUGI', 28, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (84, '2018-03-18 17:56:05', 1, 'updated', 'task', 'Laporan LABA RUGI per Projects', 33, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (85, '2018-03-18 17:56:14', 1, 'updated', 'task', 'Laporan per Produk', 34, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (86, '2018-03-18 17:56:39', 1, 'updated', 'task', 'Modul Master Produk', 26, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:1:\"9\";}}', 'project', 3, '', 0, 0);
INSERT INTO `activity_logs` VALUES (87, '2018-03-18 17:56:58', 1, 'updated', 'task', 'Laporan Perubahan Modal', 32, 'a:1:{s:12:\"milestone_id\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:2:\"11\";}}', 'project', 3, '', 0, 0);

-- ----------------------------
-- Table structure for announcements
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `share_with` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_at` datetime(0) NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of announcements
-- ----------------------------
INSERT INTO `announcements` VALUES (1, 'Pemberitahuan Maintenance Nugastudio', '<p>Pemberitahuan Maintenance Mengenai Server Kami....</p>', '2017-08-20', '2017-08-21', 1, 'all_members,all_clients', '2017-08-17 12:45:29', '0,2', 0);

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('incomplete','pending','approved','rejected','deleted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int(11) NOT NULL,
  `in_time` datetime(0) NOT NULL,
  `out_time` datetime(0) NULL DEFAULT NULL,
  `checked_by` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `checked_at` datetime(0) NULL DEFAULT NULL,
  `reject_reason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `checked_by`(`checked_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, 'pending', 1, '2017-08-17 12:20:13', '2017-08-17 12:39:28', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attendance` VALUES (2, 'pending', 1, '2017-08-17 12:39:30', '2017-08-17 12:39:33', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attendance` VALUES (3, 'pending', 1, '2017-08-17 12:40:03', '2017-08-18 00:52:36', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attendance` VALUES (4, 'pending', 3, '2017-08-17 13:22:00', '2017-08-17 14:12:21', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attendance` VALUES (5, 'pending', 1, '2018-07-23 13:24:59', '2018-07-23 13:25:01', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attendance` VALUES (6, 'pending', 1, '2018-07-23 13:25:02', '2018-07-23 13:25:02', NULL, NULL, NULL, NULL, 0);
INSERT INTO `attendance` VALUES (7, 'pending', 1, '2018-07-23 13:25:03', '2018-07-23 13:25:03', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('s8ijrjeoh3o9mild1ti1pb5qvk4510m9', '::1', 1533001887, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030313333343B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('a2ijnp66ef18j9p8c5m6uj72q9i8at03', '::1', 1533002256, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030313930313B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('4gvrgq7o5sbut6dkeellgdi8ngi8j7qj', '::1', 1533002624, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030323239323B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('2f85us5gbuslqm5ol1vvbr8vm2qlic0s', '::1', 1533003906, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030323632343B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('22vs22tul78r08qspr77mj37v08nlorp', '::1', 1533004522, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030333930373B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('0rsl3mif285lifi91gjqd38d02nl4b6v', '::1', 1533005864, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030343535303B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('qv9ffnummoe8u3rbkju75c13562db981', '::1', 1533006353, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030353931343B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('fm86a5kbmkvcv16l1e4aau5h73ud5tkg', '::1', 1533006791, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030363335343B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('67s27mmgnr44saa7mo2vkrftcr1rlnhs', '::1', 1533007206, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030363830343B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('jidjffbb6j36mk04uhohlrohlk8l4071', '::1', 1533007566, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030373233363B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('odbbrf9g04lf8p7mvl6cqendlvpqspmm', '::1', 1533007878, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030373537303B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('8eon6vf72btutu0o38ljo4tjjq4uqaru', '::1', 1533008183, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030373839333B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('mv1ulb9c7chrk7iv1p8h5v6m123g577h', '::1', 1533008683, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030383230373B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('c5l8s82kgh3uvpnamt6sncjl1f565mkh', '::1', 1533009319, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030383639303B757365725F69647C733A313A2235223B);
INSERT INTO `ci_sessions` VALUES ('hqlo6dcj5veb2ve3tv9t132mhsq61ur3', '::1', 1533010011, 0x5F5F63695F6C6173745F726567656E65726174657C693A313533333030393332363B757365725F69647C733A313A2235223B);

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `zip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `starred_by` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `vat_number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES (1, 'PT Kamardagang Indonesia', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Tangerang Selatan', 'Tangerang', '15415', 'Indonesia', '2018-05-03', '', '85710433300', '', '', 0, '', '', 1);
INSERT INTO `clients` VALUES (2, 'PT Askara Internal', 'Bla bla bla', 'Bekasi', 'Jakarta Timur', '20000', 'Indonesia', '2017-09-11', 'askara-int.com', '0999993333', '', '', 0, '', '', 1);
INSERT INTO `clients` VALUES (3, 'PT Ranata Tours', '', '', '', '', '', '2018-03-18', '', '', '', '', 0, '', '', 1);

-- ----------------------------
-- Table structure for custom_field_values
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_values`;
CREATE TABLE `custom_field_values`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_to_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `related_to_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for custom_fields
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `related_to` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_table` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `visible_to_admins_only` tinyint(1) NOT NULL DEFAULT 0,
  `hide_from_clients` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for email_templates
-- ----------------------------
DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of email_templates
-- ----------------------------
INSERT INTO `email_templates` VALUES (1, 'login_info', 'Login details', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0);
INSERT INTO `email_templates` VALUES (2, 'reset_password', 'Reset password', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '', 0);
INSERT INTO `email_templates` VALUES (3, 'team_member_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0);
INSERT INTO `email_templates` VALUES (4, 'send_invoice', 'New invoice', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', 0);
INSERT INTO `email_templates` VALUES (5, 'signature', 'Signature', 'Powered By: <a href=\"http://fairsketch.com/\" target=\"_blank\">fairsketch </a>', '<br>', 0);
INSERT INTO `email_templates` VALUES (6, 'client_contact_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0);
INSERT INTO `email_templates` VALUES (7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', '', 0);
INSERT INTO `email_templates` VALUES (8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', '', 0);
INSERT INTO `email_templates` VALUES (9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', '', 0);
INSERT INTO `email_templates` VALUES (10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', '', 0);
INSERT INTO `email_templates` VALUES (11, 'general_notification', '{EVENT_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', '', 0);
INSERT INTO `email_templates` VALUES (12, 'invoice_payment_confirmation', 'Payment received', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\">\r\n                                        <tbody><tr>\r\n                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Payment Confirmation</h2>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </td>\r\n                                                            </tr>\r\n                                                        </tbody>\r\n                                                    </table>\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    Hello,<br>\r\n                                                                                    We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_ID} <br>\r\n                                                                                    Thank you for your business cooperation.\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr>\r\n                                                                                                <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                        <tbody>\r\n                                                                                                            <tr>\r\n                                                                                                                <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                                    <a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a>\r\n                                                                                                                </td>\r\n                                                                                                            </tr>\r\n                                                                                                        </tbody>\r\n                                                                                                    </table>\r\n                                                                                                </td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n                                                                                    \r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n  {SIGNATURE}\r\n  </td>\r\n </tr>\r\n </tbody>\r\n  </table>\r\n  </td>\r\n  </tr>\r\n  </tbody>\r\n </table>\r\n  </td>\r\n </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n </tr>\r\n </tbody>\r\n </table>\r\n </td>\r\n </tr>\r\n </tbody>\r\n  </table>', NULL, 0);
INSERT INTO `email_templates` VALUES (13, 'message_received', '{SUBJECT}', '<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"> <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\"> <style type=\"text/css\"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id=\"message-container\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;\"> <tbody> <tr> <td valign=\"top\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"50\" width=\"600\">&nbsp;</td> </tr> <tr> <td style=\"background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; \" width=\"600\"><h2 style=\"color:#fff; text-align:center;\">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor=\"whitesmoke\" style=\"background:#fff; font-family:Helvetica,Arial,sans-serif\" valign=\"top\" width=\"600\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> <tr> <td width=\"560\"><p><span style=\"background-color: transparent;\">{MESSAGE_CONTENT}</span></p> <p style=\"display:inline-block; padding: 10px 15px; background-color: #00b393;\"><a href=\"{MESSAGE_URL}\" style=\"text-decoration: none; color:#fff;\" target=\"_blank\">Reply Message</a></p> </td> </tr> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height=\"60\" width=\"600\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0);

-- ----------------------------
-- Table structure for estimate_forms
-- ----------------------------
DROP TABLE IF EXISTS `estimate_forms`;
CREATE TABLE `estimate_forms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enable_attachment` tinyint(4) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for estimate_items
-- ----------------------------
DROP TABLE IF EXISTS `estimate_items`;
CREATE TABLE `estimate_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estimate_items
-- ----------------------------
INSERT INTO `estimate_items` VALUES (1, 'Web Design HTML Templates', '', 5, 'pages', 250000, 1250000, 1, 0);
INSERT INTO `estimate_items` VALUES (2, 'Web Company Profiles', 'Web Company Profiles', 1, 'Module', 6400000, 6400000, 2, 0);

-- ----------------------------
-- Table structure for estimate_requests
-- ----------------------------
DROP TABLE IF EXISTS `estimate_requests`;
CREATE TABLE `estimate_requests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_form_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `client_id` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `files` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for estimates
-- ----------------------------
DROP TABLE IF EXISTS `estimates`;
CREATE TABLE `estimates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL DEFAULT 0,
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `last_email_sent_date` date NULL DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax_id2` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estimates
-- ----------------------------
INSERT INTO `estimates` VALUES (1, 1, 0, '2017-08-20', '2017-09-03', 'ryryer  ery', NULL, 'draft', 0, 0, 0);
INSERT INTO `estimates` VALUES (2, 2, 0, '2017-09-11', '2017-09-18', 'Web Company Profiles', NULL, 'draft', 0, 0, 0);

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time(0) NULL DEFAULT NULL,
  `end_time` time(0) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `location` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `share_with` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (1, 'Annual Meeting Monthly', 'Meeting', '2017-08-25', '2017-08-25', '09:00:00', '11:00:00', 1, 'Kantor', 0, 'Meetings', 'all', 0, '#2d9cdb');

-- ----------------------------
-- Table structure for expense_categories
-- ----------------------------
DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE `expense_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of expense_categories
-- ----------------------------
INSERT INTO `expense_categories` VALUES (1, 'Miscellaneous expense', 0);
INSERT INTO `expense_categories` VALUES (2, 'Transportation', 0);
INSERT INTO `expense_categories` VALUES (3, 'Acomodations', 0);
INSERT INTO `expense_categories` VALUES (4, 'Listrik', 0);
INSERT INTO `expense_categories` VALUES (5, 'Payroll', 0);
INSERT INTO `expense_categories` VALUES (6, 'Sewa', 0);
INSERT INTO `expense_categories` VALUES (7, 'Kebutuhan Harian', 0);

-- ----------------------------
-- Table structure for expenses
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `amount` double NOT NULL,
  `files` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for help_articles
-- ----------------------------
DROP TABLE IF EXISTS `help_articles`;
CREATE TABLE `help_articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `total_views` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of help_articles
-- ----------------------------
INSERT INTO `help_articles` VALUES (1, 'Clients Pages', '<div class=\"page-header\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\"><h3 style=\"margin: 18px 0px 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 26px; vertical-align: baseline;\">Clients</h3><hr class=\"notop\" style=\"line-height: 0px; border-bottom: 1px solid rgb(255, 255, 255); border-top-color: rgb(212, 212, 212); margin: 0px 0px 16px; padding: 0px; clear: both; float: none;\"></div><p style=\"margin-top: 18px; margin-bottom: 18px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\">You can create and manage your customers in clients section.&nbsp;</p><p style=\"margin-top: 18px; margin-bottom: 18px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\">Images</p><h5 style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 100; font-size: 16px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\">List of Clients</h5><ol style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\"><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Create new client using the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Add client</span>&nbsp;button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Search the existing clients which already added in this application.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To see the details information of the client click on the Company name link.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">If you need to edit the client\'s information you can do it using the edit button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To delete the client use the delete button. Once you click on the button, the system will delete the client and you will have a chance to undo the action within 10 seconds. If you don\'t undo the action, the system will delete the client permanently&nbsp;and you will not be able to revert the client anyway!</li></ol><h5 style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 100; font-size: 16px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\">Add new client</h5><ol style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\"><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">The company name is an organization you or your organization works for. Even if your client is a person you have to add the information as a company. After creating any client you can add contacts of that client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">&nbsp;You can define different currency for different clients. It\'s useful when you are working with a foreign client which currency symbol is different from your default currency symbol. By default the invoices of the client will be generated using the default currency symbol if you don\'t define any currency symbol with that specific client.</li></ol><h5 style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 100; font-size: 16px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; color: rgb(56, 56, 56);\">Client Details</h5><div>Images</div><div><br></div><div><ol style=\"margin: 18px 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; font-family: Arial, verdana, arial, sans-serif; vertical-align: baseline; line-height: 1.5em; color: rgb(56, 56, 56);\"><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Click on the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Edit&nbsp;</span>button to edit any information of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">The contacts tab contains the list of contacts of the client. You can add one or more contact by clicking on the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Add contact&nbsp;</span>button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To send an invitation to any user for the client, use the&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: 700; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Send invitation</span>&nbsp;button.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Projects tab contains all projects of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Invoices tab contains all invoices of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Payments tab contains all payments of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">Tickets tab contains all tickets of the client.</li><li style=\"margin: 0px 0px 0px 36px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; list-style: decimal;\">To delete any contact from the client, use the delete button. Once you delete any contact you can undo the action within 10 seconds. If you don\'t undo the action the contact will be deleted from the client permanently&nbsp;and the contact will not be able to login in the client portal.</li></ol></div>', 1, 1, '2017-08-17 19:17:54', 'active', 4, 0);

-- ----------------------------
-- Table structure for help_categories
-- ----------------------------
DROP TABLE IF EXISTS `help_categories`;
CREATE TABLE `help_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('help','knowledge_base') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of help_categories
-- ----------------------------
INSERT INTO `help_categories` VALUES (1, 'Documentation', 'Documentation Of Nugastudio Projects Management', 'help', 1, 'active', 0);

-- ----------------------------
-- Table structure for invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE `invoice_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invoice_items
-- ----------------------------
INSERT INTO `invoice_items` VALUES (1, 'Transportation', 'Transportation', 1, 'days', 100000, 100000, 1, 0);
INSERT INTO `invoice_items` VALUES (2, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 3, 0);
INSERT INTO `invoice_items` VALUES (3, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 4, 0);
INSERT INTO `invoice_items` VALUES (4, 'Web Company Profiles', 'Web Company Profiles', 1, 'Module', 6400000, 6400000, 4, 0);
INSERT INTO `invoice_items` VALUES (5, 'Example Items', '', 3, '', 100000, 300000, 5, 0);
INSERT INTO `invoice_items` VALUES (6, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 1, 0);
INSERT INTO `invoice_items` VALUES (7, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 6, 0);
INSERT INTO `invoice_items` VALUES (8, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 13, 0);
INSERT INTO `invoice_items` VALUES (9, 'Down Payment 50%', 'DP 50% Tanda Jadi Proyek', 1, 'DP', 3200000, 3200000, 13, 0);

-- ----------------------------
-- Table structure for invoice_payments
-- ----------------------------
DROP TABLE IF EXISTS `invoice_payments`;
CREATE TABLE `invoice_payments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `transaction_id` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_by` int(11) NULL DEFAULT 1,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `id_2`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invoice_payments
-- ----------------------------
INSERT INTO `invoice_payments` VALUES (1, 100000, '2017-08-16', 4, 'Payment 1', 1, 0, NULL, 1, '2017-08-16 11:27:32');
INSERT INTO `invoice_payments` VALUES (2, 3200000, '2017-09-06', 4, 'Pembayaran DP 50% Proyek Company Profile', 3, 0, NULL, 1, '2017-09-11 11:25:50');
INSERT INTO `invoice_payments` VALUES (3, 1560000, '2018-05-07', 1, 'sdg', 4, 0, NULL, 1, '2018-05-07 09:45:47');
INSERT INTO `invoice_payments` VALUES (4, 100000, '2018-05-08', 4, 'Termin 1', 5, 0, NULL, 1, '2018-05-07 10:22:18');
INSERT INTO `invoice_payments` VALUES (5, 230000, '2018-05-08', 4, 'Done', 5, 0, NULL, 1, '2018-05-07 10:23:04');

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `last_email_sent_date` date NULL DEFAULT NULL,
  `status` enum('draft','not_paid') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax_id2` int(11) NOT NULL DEFAULT 0,
  `recurring` tinyint(4) NOT NULL DEFAULT 0,
  `recurring_invoice_id` int(11) NOT NULL DEFAULT 0,
  `repeat_every` int(11) NOT NULL DEFAULT 0,
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `no_of_cycles` int(11) NOT NULL DEFAULT 0,
  `next_recurring_date` date NOT NULL,
  `no_of_cycles_completed` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of invoices
-- ----------------------------
INSERT INTO `invoices` VALUES (1, 1, 1, '2017-08-20', '2017-08-27', 'Pembayaran Pertama', NULL, 'not_paid', 0, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0);
INSERT INTO `invoices` VALUES (2, 2, 0, '2017-09-05', '2017-09-06', 'DP Pembuatan Web Site 50%', NULL, 'draft', 0, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0);
INSERT INTO `invoices` VALUES (3, 2, 2, '2017-09-06', '2017-09-08', '', NULL, 'not_paid', 0, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0);
INSERT INTO `invoices` VALUES (4, 2, 2, '2018-04-27', '2018-04-29', 'eryeyer', NULL, 'not_paid', 1, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0);
INSERT INTO `invoices` VALUES (5, 1, 1, '2018-05-08', '2018-05-09', 'aksdfsdg', '2018-05-08', 'not_paid', 1, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0);
INSERT INTO `invoices` VALUES (6, 2, 2, '2018-05-17', '2018-05-18', 'dsf', NULL, 'draft', 1, 0, 0, 0, 1, 'months', 0, '0000-00-00', 0, 0);

-- ----------------------------
-- Table structure for leave_applications
-- ----------------------------
DROP TABLE IF EXISTS `leave_applications`;
CREATE TABLE `leave_applications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7, 2) NOT NULL,
  `total_days` decimal(5, 2) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `reason` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime(0) NOT NULL,
  `created_by` int(11) NOT NULL,
  `checked_at` datetime(0) NULL DEFAULT NULL,
  `checked_by` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `leave_type_id`(`leave_type_id`) USING BTREE,
  INDEX `user_id`(`applicant_id`) USING BTREE,
  INDEX `checked_by`(`checked_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_types
-- ----------------------------
DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE `leave_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_types
-- ----------------------------
INSERT INTO `leave_types` VALUES (1, 'Casual Leave', 'active', '#83c340', '', 0);

-- ----------------------------
-- Table structure for master_assets
-- ----------------------------
DROP TABLE IF EXISTS `master_assets`;
CREATE TABLE `master_assets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activa_code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activa_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activa_age` int(11) NOT NULL,
  `activa_pricing` double NOT NULL,
  `asset_residu` double NOT NULL,
  `depreciated_method` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activa_account` int(11) NOT NULL,
  `activa_depreciate_account` int(11) NOT NULL,
  `activa_expense_depre_account` int(11) NOT NULL,
  `get_date` date NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_assets
-- ----------------------------
INSERT INTO `master_assets` VALUES (1, 'AS18001', 'Bangunan', 20, 14500000, 0, 'Garis_Lurus', 21, 24, 51, '2017-12-28', '2018-05-04 07:18:48', 0);
INSERT INTO `master_assets` VALUES (2, 'AS18002', 'Bangunan', 20, 10000000, 100000, 'Garis_Lurus', 0, 0, 51, '2017-12-28', '2018-05-27 16:05:51', 0);
INSERT INTO `master_assets` VALUES (3, 'AS18003', 'Tanah', 20, 430000000, 0, 'Garis_Lurus', 22, 24, 51, '2014-07-24', '2018-05-30 01:20:50', 0);
INSERT INTO `master_assets` VALUES (4, 'AS18004', 'Tanah', 20, 150000000, 1000000, 'Garis_Lurus', 6, 7, 51, '2018-05-30', '2018-05-30 04:11:11', 0);

-- ----------------------------
-- Table structure for master_customers
-- ----------------------------
DROP TABLE IF EXISTS `master_customers`;
CREATE TABLE `master_customers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `npwp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `state` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `zip` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `termin` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contact` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `credit_limit` double NOT NULL,
  `memo` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_customers
-- ----------------------------
INSERT INTO `master_customers` VALUES (1, 'CS18001', 'DIan Nugraha', '', 'DIan Nugraha', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', '', '', '', '', '30', 'nugashare@gmail.com', '85710433300', '085710433300', 100000, '', '2018-05-25 12:37:04', 0);

-- ----------------------------
-- Table structure for master_items
-- ----------------------------
DROP TABLE IF EXISTS `master_items`;
CREATE TABLE `master_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `unit_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` double NULL DEFAULT NULL,
  `sales_journal` int(10) NULL DEFAULT NULL,
  `hpp_journal` int(10) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_items
-- ----------------------------
INSERT INTO `master_items` VALUES (1, 'Tiket Pesawat Garuda', NULL, 'Domestic', 'Akomodasi', 700000, 89, 99, 0);
INSERT INTO `master_items` VALUES (2, 'Tiket Pesawat ', NULL, 'Umrah', 'Akomodasi', 1000000, 90, 102, 0);
INSERT INTO `master_items` VALUES (3, 'Tiket Kereta', '12125', 'Domestic', 'Transport', 300000, NULL, NULL, 1);
INSERT INTO `master_items` VALUES (4, 'Shuttle Bus', '', 'lainnya', 'Transport', 500000, NULL, NULL, 1);
INSERT INTO `master_items` VALUES (5, 'Hotel', NULL, 'Domestic', 'Akomodasi', NULL, 94, 101, 0);
INSERT INTO `master_items` VALUES (6, 'Hotel International', NULL, '', 'Akomodasi', NULL, 96, 102, 1);
INSERT INTO `master_items` VALUES (7, 'Hotel International', NULL, 'International', 'Akomodasi', NULL, 96, 102, 0);
INSERT INTO `master_items` VALUES (8, 'Tour Package', NULL, 'Domestic', 'Akomodasi', NULL, 91, 48, 0);

-- ----------------------------
-- Table structure for master_project
-- ----------------------------
DROP TABLE IF EXISTS `master_project`;
CREATE TABLE `master_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `project_description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_cust` int(11) NULL DEFAULT NULL,
  `owner_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_project
-- ----------------------------
INSERT INTO `master_project` VALUES (1, 'Trip To Lombok', 'Project Ke Lombok', NULL, 'Dian Nugraha', 'PT Kochi Mediatama Indonesia', '', '2018-07-12 16:26:59', 0);
INSERT INTO `master_project` VALUES (2, 'Trip To Bali', 'Project Ke Bali', NULL, 'Dian Nugraha', 'PT Abyor International', '', '2018-07-12 16:26:00', 0);

-- ----------------------------
-- Table structure for master_saldo_awal
-- ----------------------------
DROP TABLE IF EXISTS `master_saldo_awal`;
CREATE TABLE `master_saldo_awal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid_coa` int(11) NOT NULL,
  `periode` int(11) NOT NULL,
  `date` date NOT NULL,
  `debet` double NOT NULL,
  `credit` double NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_saldo_awal
-- ----------------------------
INSERT INTO `master_saldo_awal` VALUES (2, 4, 2018, '2018-05-30', 250818491, 0, 1);
INSERT INTO `master_saldo_awal` VALUES (3, 5, 2018, '2018-05-30', 158412586, 0, 1);
INSERT INTO `master_saldo_awal` VALUES (4, 39, 2018, '2018-05-30', 0, 409231077, 1);
INSERT INTO `master_saldo_awal` VALUES (5, 66, 2013, '2013-06-30', 4587179, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (6, 4, 2013, '2013-06-30', 121880384, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (7, 12, 2013, '2013-06-30', 264040350, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (8, 76, 2013, '2013-06-30', 1021031906, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (9, 15, 2013, '2013-06-30', 199493898, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (10, 19, 2013, '2013-06-30', 3000000, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (11, 77, 2013, '2013-06-30', 59269910, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (12, 22, 2013, '2013-06-30', 248852000, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (13, 69, 2013, '2013-06-30', 0, 139936600, 0);
INSERT INTO `master_saldo_awal` VALUES (14, 71, 2013, '2013-06-30', 45000000, 0, 1);
INSERT INTO `master_saldo_awal` VALUES (15, 27, 2013, '2013-06-30', 0, 93265009, 1);
INSERT INTO `master_saldo_awal` VALUES (16, 33, 2013, '2013-06-30', 0, 100000000, 0);
INSERT INTO `master_saldo_awal` VALUES (17, 34, 2013, '2013-06-30', 0, 99692000, 0);
INSERT INTO `master_saldo_awal` VALUES (18, 78, 2013, '2013-06-30', 0, 465000000, 0);
INSERT INTO `master_saldo_awal` VALUES (19, 37, 2013, '2013-06-30', 0, 255000000, 0);
INSERT INTO `master_saldo_awal` VALUES (20, 39, 2013, '2013-06-30', 0, 880000000, 0);
INSERT INTO `master_saldo_awal` VALUES (21, 42, 2013, '2013-06-30', 65737982, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (22, 69, 2018, '2018-06-09', 0, 100000, 0);
INSERT INTO `master_saldo_awal` VALUES (23, 44, 2018, '2018-06-09', 0, 20000, 0);
INSERT INTO `master_saldo_awal` VALUES (24, 44, 2018, '2018-06-09', 0, 0, 1);
INSERT INTO `master_saldo_awal` VALUES (25, 7, 2018, '2018-06-09', 100000, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (26, 3, 2018, '2018-07-11', 0, 330000, 0);
INSERT INTO `master_saldo_awal` VALUES (27, 3, 2018, '2018-07-11', 0, 24000, 1);
INSERT INTO `master_saldo_awal` VALUES (28, 3, 2018, '2018-07-11', 0, 330000, 1);
INSERT INTO `master_saldo_awal` VALUES (29, 9, 2018, '2018-07-11', 330000, 0, 0);
INSERT INTO `master_saldo_awal` VALUES (30, 3, 2018, '2018-07-11', 0, 330000, 0);

-- ----------------------------
-- Table structure for master_vendor
-- ----------------------------
DROP TABLE IF EXISTS `master_vendor`;
CREATE TABLE `master_vendor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `npwp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `termin` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contact` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `state` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `zip` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile_number` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `credit_limit` double NOT NULL,
  `memo` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of master_vendor
-- ----------------------------
INSERT INTO `master_vendor` VALUES (1, 'VD18001', 'Vendor Dian Nugraha', '', '111111111111', 'Parung Bogor', '30', '085710433300', '', '', '', '', 'nugashare@gmail.com', '85710433300', 100000, '', '', 0, '2018-05-25 12:35:57');
INSERT INTO `master_vendor` VALUES (2, 'VD18002', 'Qwash Indonesia Jaya', '', '12425253636', 'Ruko Parakan 8E, Jl parakan pamulang 2', '30', '085778805131', '', '', '', '', 'qwash.indonesia@gmail.com', '85778805131', 1000000, '', '', 0, '2018-06-05 16:04:21');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` enum('unread','read') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted_by_users` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_from`(`from_user_id`) USING BTREE,
  INDEX `message_to`(`to_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, 'Testing', 'Mas Ini Sudah Mulai Kah ????', '2017-08-17 12:06:17', 2, 1, 'read', 0, 0, 'a:0:{}', '');
INSERT INTO `messages` VALUES (2, '', 'Iya Mas Sudah', '2017-08-17 12:06:47', 1, 2, 'read', 1, 0, 'a:0:{}', '');
INSERT INTO `messages` VALUES (3, '', 'Oke Mas Terima Kasih :D', '2017-08-17 12:10:02', 2, 1, 'read', 1, 0, 'a:0:{}', '');
INSERT INTO `messages` VALUES (4, 'Test', 'Data', '2018-04-27 12:48:01', 5, 1, 'read', 0, 0, 'a:0:{}', '');

-- ----------------------------
-- Table structure for milestones
-- ----------------------------
DROP TABLE IF EXISTS `milestones`;
CREATE TABLE `milestones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of milestones
-- ----------------------------
INSERT INTO `milestones` VALUES (1, 'Input data Tahap 1', 1, '2017-08-20', 'proses input data tahap 1', 0);
INSERT INTO `milestones` VALUES (2, 'Design UI/UX HTML', 2, '2017-09-11', 'Design ALL Pages and User Interfacing', 0);
INSERT INTO `milestones` VALUES (3, 'Database Design', 2, '2017-09-13', 'Database Management and design table', 0);
INSERT INTO `milestones` VALUES (4, 'Backend And Admin Panel', 2, '2017-09-16', 'Deploy Web Administration and Integration Data Master Of All CRUD', 0);
INSERT INTO `milestones` VALUES (5, 'Front End Including', 2, '2017-09-17', 'Front End Integration With Database And Scratching Data UI/UX', 0);
INSERT INTO `milestones` VALUES (6, 'Unit Testing', 2, '2017-09-21', 'Unit Acceptance Testing', 0);
INSERT INTO `milestones` VALUES (7, 'Analisa Kebutuhan', 3, '2018-03-19', '', 0);
INSERT INTO `milestones` VALUES (8, 'Analisa Perancangan', 3, '2018-03-26', '', 0);
INSERT INTO `milestones` VALUES (9, 'Implementasi Modul', 3, '2018-04-02', '', 0);
INSERT INTO `milestones` VALUES (10, 'Implementasi Fitur', 3, '2018-04-09', '', 0);
INSERT INTO `milestones` VALUES (11, 'Implementasi Laporan', 3, '2018-04-30', '', 0);
INSERT INTO `milestones` VALUES (12, 'Bugs & Testing (FIXING)', 3, '2018-05-07', '', 0);

-- ----------------------------
-- Table structure for notes
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notes
-- ----------------------------
INSERT INTO `notes` VALUES (1, 1, '2017-08-17 12:39:12', ' test notes', 'ini isi notes nya', 0, 0, 0, 'data', 0);

-- ----------------------------
-- Table structure for notification_settings
-- ----------------------------
DROP TABLE IF EXISTS `notification_settings`;
CREATE TABLE `notification_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `enable_email` int(1) NOT NULL DEFAULT 0,
  `enable_web` int(1) NOT NULL DEFAULT 0,
  `notify_to_team` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notify_to_team_members` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notify_to_terms` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `event`(`event`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notification_settings
-- ----------------------------
INSERT INTO `notification_settings` VALUES (1, 'project_created', 'project', 0, 0, '', '', '', 1, 0);
INSERT INTO `notification_settings` VALUES (2, 'project_deleted', 'project', 0, 0, '', '', '', 2, 0);
INSERT INTO `notification_settings` VALUES (3, 'project_task_created', 'project', 0, 1, '', '', 'project_members,task_assignee', 3, 0);
INSERT INTO `notification_settings` VALUES (4, 'project_task_updated', 'project', 0, 1, '', '', 'task_assignee', 4, 0);
INSERT INTO `notification_settings` VALUES (5, 'project_task_assigned', 'project', 0, 1, '', '', 'task_assignee', 5, 0);
INSERT INTO `notification_settings` VALUES (7, 'project_task_started', 'project', 0, 0, '', '', '', 7, 0);
INSERT INTO `notification_settings` VALUES (8, 'project_task_finished', 'project', 0, 0, '', '', '', 8, 0);
INSERT INTO `notification_settings` VALUES (9, 'project_task_reopened', 'project', 0, 0, '', '', '', 9, 0);
INSERT INTO `notification_settings` VALUES (10, 'project_task_deleted', 'project', 0, 1, '', '', 'task_assignee', 10, 0);
INSERT INTO `notification_settings` VALUES (11, 'project_task_commented', 'project', 0, 1, '', '', 'task_assignee', 11, 0);
INSERT INTO `notification_settings` VALUES (12, 'project_member_added', 'project', 0, 1, '', '', 'project_members', 12, 0);
INSERT INTO `notification_settings` VALUES (13, 'project_member_deleted', 'project', 0, 1, '', '', 'project_members', 13, 0);
INSERT INTO `notification_settings` VALUES (14, 'project_file_added', 'project', 0, 1, '', '', 'project_members', 14, 0);
INSERT INTO `notification_settings` VALUES (15, 'project_file_deleted', 'project', 0, 1, '', '', 'project_members', 15, 0);
INSERT INTO `notification_settings` VALUES (16, 'project_file_commented', 'project', 0, 1, '', '', 'project_members', 16, 0);
INSERT INTO `notification_settings` VALUES (17, 'project_comment_added', 'project', 0, 1, '', '', 'project_members', 17, 0);
INSERT INTO `notification_settings` VALUES (18, 'project_comment_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 18, 0);
INSERT INTO `notification_settings` VALUES (19, 'project_customer_feedback_added', 'project', 0, 1, '', '', 'project_members', 19, 0);
INSERT INTO `notification_settings` VALUES (20, 'project_customer_feedback_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 20, 0);
INSERT INTO `notification_settings` VALUES (21, 'client_signup', 'client', 0, 0, '', '', '', 21, 0);
INSERT INTO `notification_settings` VALUES (22, 'invoice_online_payment_received', 'invoice', 1, 1, '', '1', '', 22, 0);
INSERT INTO `notification_settings` VALUES (23, 'leave_application_submitted', 'leave', 0, 0, '', '', '', 23, 0);
INSERT INTO `notification_settings` VALUES (24, 'leave_approved', 'leave', 0, 1, '', '', 'leave_applicant', 24, 0);
INSERT INTO `notification_settings` VALUES (25, 'leave_assigned', 'leave', 0, 1, '', '', 'leave_applicant', 25, 0);
INSERT INTO `notification_settings` VALUES (26, 'leave_rejected', 'leave', 0, 1, '', '', 'leave_applicant', 26, 0);
INSERT INTO `notification_settings` VALUES (27, 'leave_canceled', 'leave', 0, 0, '', '', '', 27, 0);
INSERT INTO `notification_settings` VALUES (28, 'ticket_created', 'ticket', 0, 0, '', '', '', 28, 0);
INSERT INTO `notification_settings` VALUES (29, 'ticket_commented', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 29, 0);
INSERT INTO `notification_settings` VALUES (30, 'ticket_closed', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 30, 0);
INSERT INTO `notification_settings` VALUES (31, 'ticket_reopened', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 31, 0);
INSERT INTO `notification_settings` VALUES (32, 'estimate_request_received', 'estimate', 0, 0, '', '', '', 32, 0);
INSERT INTO `notification_settings` VALUES (33, 'estimate_sent', 'estimate', 0, 0, '', '', '', 33, 0);
INSERT INTO `notification_settings` VALUES (34, 'estimate_accepted', 'estimate', 0, 0, '', '', '', 34, 0);
INSERT INTO `notification_settings` VALUES (35, 'estimate_rejected', 'estimate', 0, 0, '', '', '', 35, 0);
INSERT INTO `notification_settings` VALUES (36, 'new_message_sent', 'message', 0, 0, '', '', '', 36, 0);
INSERT INTO `notification_settings` VALUES (37, 'message_reply_sent', 'message', 0, 0, '', '', '', 37, 0);
INSERT INTO `notification_settings` VALUES (38, 'invoice_payment_confirmation', 'invoice', 0, 0, '', '', '', 22, 0);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `notify_to` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 1, '', '2017-08-16 11:18:58', '', '', 'project_task_created', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (2, 2, '', '2017-08-17 12:19:00', '1', ',1', 'project_task_commented', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (3, 1, '', '2017-08-17 13:21:04', '3', '', 'project_member_added', 1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (4, 1, '', '2017-08-21 09:29:18', '3', '', 'project_file_added', 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (5, 1, '', '2017-09-11 10:20:33', '', '', 'project_task_created', 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (6, 1, '', '2017-09-11 10:20:50', '3', '', 'project_member_added', 2, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (7, 1, '', '2017-09-11 10:21:09', '3', '', 'project_task_updated', 2, 2, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (8, 1, '', '2017-09-11 10:22:37', '3', '', 'project_task_created', 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (9, 1, '', '2017-09-11 10:23:38', '3', '', 'project_task_created', 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (10, 1, '', '2017-09-11 10:27:32', '3', '', 'project_task_updated', 2, 2, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (11, 1, '', '2017-09-11 10:27:40', '3', '', 'project_task_updated', 2, 3, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (12, 1, '', '2017-09-11 10:27:47', '3', '', 'project_task_updated', 2, 4, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (13, 1, '', '2017-09-11 10:30:22', '3', '', 'project_file_added', 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (14, 1, '', '2017-09-11 10:35:02', '3', '', 'project_task_created', 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (15, 1, '', '2017-09-11 10:37:56', '3', '', 'project_task_created', 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (16, 1, '', '2017-09-11 10:39:04', '3', '', 'project_task_updated', 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (17, 1, '', '2017-09-11 10:39:20', '3', '', 'project_task_updated', 2, 4, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (18, 1, '', '2017-09-11 10:40:03', '3', '', 'project_task_updated', 2, 2, 0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (19, 1, '', '2017-09-11 10:40:15', '3', '', 'project_task_updated', 2, 4, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (20, 1, '', '2017-09-11 10:40:22', '3', '', 'project_task_updated', 2, 5, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (21, 1, '', '2017-09-11 10:40:36', '3', '', 'project_task_updated', 2, 6, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (22, 1, '', '2017-09-11 10:42:43', '3', '', 'project_task_created', 2, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (23, 1, '', '2017-09-11 10:43:08', '3', '', 'project_task_updated', 2, 7, 0, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (24, 1, '', '2017-09-11 10:43:44', '3', '', 'project_task_updated', 2, 7, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (25, 1, '', '2018-03-18 17:15:37', '', '', 'project_task_created', 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (26, 1, '', '2018-03-18 17:15:58', '', '', 'project_task_updated', 3, 8, 0, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (27, 1, '', '2018-03-18 17:16:52', '', '', 'project_task_created', 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (28, 1, '', '2018-03-18 17:17:19', '', '', 'project_task_updated', 3, 9, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (29, 1, '', '2018-03-18 17:21:02', '', '', 'project_task_created', 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (30, 1, '', '2018-03-18 17:21:46', '', '', 'project_task_created', 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (31, 1, '', '2018-03-18 17:22:22', '', '', 'project_task_created', 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (32, 1, '', '2018-03-18 17:23:37', '', '', 'project_task_created', 3, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (33, 1, '', '2018-03-18 17:24:23', '', '', 'project_task_created', 3, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (34, 1, '', '2018-03-18 17:25:35', '', '', 'project_task_updated', 3, 9, 0, 0, 0, 0, 0, 0, 0, 46, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (35, 1, '', '2018-03-18 17:26:34', '', '', 'project_task_updated', 3, 13, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (36, 1, '', '2018-03-18 17:26:55', '', '', 'project_task_updated', 3, 14, 0, 0, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (37, 1, '', '2018-03-18 17:27:18', '', '', 'project_task_updated', 3, 10, 0, 0, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (38, 1, '', '2018-03-18 17:30:56', '', '', 'project_task_created', 3, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (39, 1, '', '2018-03-18 17:33:21', '', '', 'project_task_created', 3, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (40, 1, '', '2018-03-18 17:34:08', '', '', 'project_task_created', 3, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (41, 1, '', '2018-03-18 17:35:36', '', '', 'project_task_created', 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (42, 1, '', '2018-03-18 17:36:32', '', '', 'project_task_created', 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (43, 1, '', '2018-03-18 17:37:03', '', '', 'project_task_updated', 3, 19, 0, 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (44, 1, '', '2018-03-18 17:37:54', '', '', 'project_task_created', 3, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (45, 1, '', '2018-03-18 17:39:04', '', '', 'project_task_created', 3, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (46, 1, '', '2018-03-18 17:40:13', '', '', 'project_task_created', 3, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (47, 1, '', '2018-03-18 17:41:13', '', '', 'project_task_updated', 3, 22, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (48, 1, '', '2018-03-18 17:41:25', '', '', 'project_task_created', 3, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (49, 1, '', '2018-03-18 17:41:35', '', '', 'project_task_updated', 3, 23, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (50, 1, '', '2018-03-18 17:42:19', '', '', 'project_task_created', 3, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (51, 1, '', '2018-03-18 17:43:18', '', '', 'project_task_created', 3, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (52, 1, '', '2018-03-18 17:44:02', '', '', 'project_task_updated', 3, 25, 0, 0, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (53, 1, '', '2018-03-18 17:46:20', '', '', 'project_task_created', 3, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (54, 1, '', '2018-03-18 17:47:11', '', '', 'project_task_updated', 3, 15, 0, 0, 0, 0, 0, 0, 0, 71, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (55, 1, '', '2018-03-18 17:49:34', '', '', 'project_task_created', 3, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (56, 1, '', '2018-03-18 17:50:05', '', '', 'project_task_created', 3, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (57, 1, '', '2018-03-18 17:50:38', '', '', 'project_task_created', 3, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (58, 1, '', '2018-03-18 17:52:26', '', '', 'project_task_created', 3, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (59, 1, '', '2018-03-18 17:53:10', '', '', 'project_task_created', 3, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (60, 1, '', '2018-03-18 17:53:52', '', '', 'project_task_created', 3, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (61, 1, '', '2018-03-18 17:54:32', '', '', 'project_task_created', 3, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (62, 1, '', '2018-03-18 17:54:58', '', '', 'project_task_created', 3, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (63, 1, '', '2018-03-18 17:55:27', '', '', 'project_task_updated', 3, 27, 0, 0, 0, 0, 0, 0, 0, 82, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (64, 1, '', '2018-03-18 17:55:53', '', '', 'project_task_updated', 3, 28, 0, 0, 0, 0, 0, 0, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (65, 1, '', '2018-03-18 17:56:05', '', '', 'project_task_updated', 3, 33, 0, 0, 0, 0, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (66, 1, '', '2018-03-18 17:56:14', '', '', 'project_task_updated', 3, 34, 0, 0, 0, 0, 0, 0, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (67, 1, '', '2018-03-18 17:56:27', '', '', 'project_task_updated', 3, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (68, 1, '', '2018-03-18 17:56:39', '', '', 'project_task_updated', 3, 26, 0, 0, 0, 0, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (69, 1, '', '2018-03-18 17:56:58', '', '', 'project_task_updated', 3, 32, 0, 0, 0, 0, 0, 0, 0, 87, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT 0,
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_payment_amount` double NOT NULL DEFAULT 0,
  `settings` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES (1, 'Cash', 'custom', 'Cash payments', 0, 0, 0, 'a:0:{}', 0);
INSERT INTO `payment_methods` VALUES (2, 'Stripe', 'stripe', 'Stripe online payments', 1, 0, 0, 'a:3:{s:15:\"pay_button_text\";s:6:\"Stripe\";s:10:\"secret_key\";s:6:\"\";s:15:\"publishable_key\";s:6:\"\";}', 0);
INSERT INTO `payment_methods` VALUES (3, 'PayPal Payments Standard', 'paypal_payments_standard', 'PayPal Payments Standard Online Payments', 1, 0, 0, 'a:4:{s:15:\"pay_button_text\";s:6:\"PayPal\";s:5:\"email\";s:4:\"\";s:11:\"paypal_live\";s:1:\"0\";s:5:\"debug\";s:1:\"0\";}', 0);
INSERT INTO `payment_methods` VALUES (4, 'Bank Transfers', 'custom', 'BCA A/n Dian Nugraha', 0, 0, 0, 'a:0:{}', 0);

-- ----------------------------
-- Table structure for paypal_ipn
-- ----------------------------
DROP TABLE IF EXISTS `paypal_ipn`;
CREATE TABLE `paypal_ipn`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `ipn_hash` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ipn_data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `share_with` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 1, '2017-08-17 12:21:12', 'Nice To Meet You', 0, '', 'a:0:{}', 0);
INSERT INTO `posts` VALUES (2, 1, '2017-08-18 01:09:27', 'Tour And Travels', 0, '', 'a:1:{i:0;a:2:{s:9:\"file_name\";s:75:\"timeline_post_file59963e470f9e3-Khazzanah-Tour-Travel-Umroh-Haji-banner.jpg\";s:9:\"file_size\";s:6:\"151123\";}}', 0);
INSERT INTO `posts` VALUES (3, 1, '2018-05-19 22:16:01', ',lll', 0, '', 'a:0:{}', 0);
INSERT INTO `posts` VALUES (4, 1, '2018-05-19 22:16:10', 'l;;;', 0, '', 'a:0:{}', 0);

-- ----------------------------
-- Table structure for project_comments
-- ----------------------------
DROP TABLE IF EXISTS `project_comments`;
CREATE TABLE `project_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `file_id` int(11) NOT NULL DEFAULT 0,
  `customer_feedback_id` int(11) NOT NULL DEFAULT 0,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_comments
-- ----------------------------
INSERT INTO `project_comments` VALUES (1, 2, '2017-08-17 12:19:00', 'Oke Mantap', 1, 0, 1, 0, 0, 'a:0:{}', 0);

-- ----------------------------
-- Table structure for project_files
-- ----------------------------
DROP TABLE IF EXISTS `project_files`;
CREATE TABLE `project_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `file_size` double NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `project_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_files
-- ----------------------------
INSERT INTO `project_files` VALUES (1, '_file599aa7ee8258c-ayo-bayar-zakat.jpg', '', 13525, '2017-08-21 09:29:18', 1, 1, 0);
INSERT INTO `project_files` VALUES (2, '_file59b665be62cab-PROPOSAL-PENAWARAN.docx', '', 145053, '2017-09-11 10:30:22', 2, 1, 0);

-- ----------------------------
-- Table structure for project_members
-- ----------------------------
DROP TABLE IF EXISTS `project_members`;
CREATE TABLE `project_members`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_leader` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_members
-- ----------------------------
INSERT INTO `project_members` VALUES (1, 1, 1, 1, 0);
INSERT INTO `project_members` VALUES (2, 3, 1, 0, 0);
INSERT INTO `project_members` VALUES (3, 1, 2, 1, 0);
INSERT INTO `project_members` VALUES (4, 3, 2, 0, 0);
INSERT INTO `project_members` VALUES (5, 1, 3, 1, 0);

-- ----------------------------
-- Table structure for project_settings
-- ----------------------------
DROP TABLE IF EXISTS `project_settings`;
CREATE TABLE `project_settings`  (
  `project_id` int(11) NOT NULL,
  `setting_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `unique_index`(`project_id`, `setting_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_time
-- ----------------------------
DROP TABLE IF EXISTS `project_time`;
CREATE TABLE `project_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `status` enum('open','logged','approved') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logged',
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_time
-- ----------------------------
INSERT INTO `project_time` VALUES (1, 1, 3, '2017-08-17 13:22:38', '2017-08-17 14:12:04', 'logged', 'sdf', 1, 0);
INSERT INTO `project_time` VALUES (2, 1, 3, '2017-08-17 13:23:00', '2017-08-17 15:00:00', 'logged', 'input data sudah selesai', 1, 0);
INSERT INTO `project_time` VALUES (3, 2, 1, '2017-09-11 10:30:00', '2018-03-18 17:06:25', 'logged', '', 0, 0);

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `status` enum('open','completed','canceled') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `price` double NOT NULL DEFAULT 0,
  `starred_by` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (1, 'Kamardagang Content Input Data', 'Mengisi Data Form Bisnis ', '2017-08-21', '2017-12-31', 1, '2017-08-16', 1, 'open', 'KDG', 4000000, ',:3:', 0);
INSERT INTO `projects` VALUES (2, 'Proyek Web Company Profiles Askara Int', 'Pembuatan Website Profil Perusahaan PT Askara Internal\nhttp://demo.bitsolution.web.id/askarainternal', '2017-09-11', '2017-09-21', 2, '2017-09-11', 1, 'open', 'Company Profile', 6400000, '', 0);
INSERT INTO `projects` VALUES (3, 'Management Travel Advanced', 'Sistem Aplikasi Website Management Travel Advanced Dengan Laporan Akuntansi', '2018-03-19', '2018-05-01', 3, '2018-03-18', 1, 'open', '', 30000000, '', 0);

-- ----------------------------
-- Table structure for purchase_invoices
-- ----------------------------
DROP TABLE IF EXISTS `purchase_invoices`;
CREATE TABLE `purchase_invoices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid_order` int(11) NOT NULL,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `inv_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delivery_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inv_date` datetime(0) NOT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` double NOT NULL,
  `residual` double NOT NULL,
  `last_email_sent_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_invoices_items
-- ----------------------------
DROP TABLE IF EXISTS `purchase_invoices_items`;
CREATE TABLE `purchase_invoices_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_invoices` int(11) NOT NULL,
  `fid_items` int(50) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `fid_quot` int(11) NOT NULL,
  `inv_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delivery_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `exp_date` date NOT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_email_sent_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_order_items
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_items`;
CREATE TABLE `purchase_order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_order` int(11) NOT NULL,
  `fid_items` int(11) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_payments
-- ----------------------------
DROP TABLE IF EXISTS `purchase_payments`;
CREATE TABLE `purchase_payments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_inv` int(11) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `paid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pay_date` datetime(0) NOT NULL,
  `fid_bank` int(11) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `currency` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` double NOT NULL,
  `residu` double NOT NULL,
  `memo` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_request
-- ----------------------------
DROP TABLE IF EXISTS `purchase_request`;
CREATE TABLE `purchase_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_vendor` int(11) NOT NULL,
  `inv_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delivery_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `exp_date` datetime(0) NOT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_email_sent_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_request_items
-- ----------------------------
DROP TABLE IF EXISTS `purchase_request_items`;
CREATE TABLE `purchase_request_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_quotation` int(11) NOT NULL,
  `fid_items` int(11) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ref_items_category
-- ----------------------------
DROP TABLE IF EXISTS `ref_items_category`;
CREATE TABLE `ref_items_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ref_items_category
-- ----------------------------
INSERT INTO `ref_items_category` VALUES (1, 'Akomodasi', 0);
INSERT INTO `ref_items_category` VALUES (2, 'Transportasi', 0);

-- ----------------------------
-- Table structure for ref_jenis
-- ----------------------------
DROP TABLE IF EXISTS `ref_jenis`;
CREATE TABLE `ref_jenis`  (
  `id_jenis` int(11) NOT NULL,
  `nama` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ref_jenis
-- ----------------------------
INSERT INTO `ref_jenis` VALUES (1, 'kabupaten');
INSERT INTO `ref_jenis` VALUES (2, 'kota');
INSERT INTO `ref_jenis` VALUES (3, 'kelurahan');
INSERT INTO `ref_jenis` VALUES (4, 'desa');

-- ----------------------------
-- Table structure for ref_kabupaten
-- ----------------------------
DROP TABLE IF EXISTS `ref_kabupaten`;
CREATE TABLE `ref_kabupaten`  (
  `id_kab` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_prov` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_jenis` int(11) NOT NULL,
  PRIMARY KEY (`id_kab`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ref_kabupaten
-- ----------------------------
INSERT INTO `ref_kabupaten` VALUES ('1101', '11', 'KAB. ACEH SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1102', '11', 'KAB. ACEH TENGGARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1103', '11', 'KAB. ACEH TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1104', '11', 'KAB. ACEH TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('1105', '11', 'KAB. ACEH BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1106', '11', 'KAB. ACEH BESAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1107', '11', 'KAB. PIDIE', 1);
INSERT INTO `ref_kabupaten` VALUES ('1108', '11', 'KAB. ACEH UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1109', '11', 'KAB. SIMEULUE', 1);
INSERT INTO `ref_kabupaten` VALUES ('1110', '11', 'KAB. ACEH SINGKIL', 1);
INSERT INTO `ref_kabupaten` VALUES ('1111', '11', 'KAB. BIREUEN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1112', '11', 'KAB. ACEH BARAT DAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1113', '11', 'KAB. GAYO LUES', 1);
INSERT INTO `ref_kabupaten` VALUES ('1114', '11', 'KAB. ACEH JAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1115', '11', 'KAB. NAGAN RAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1116', '11', 'KAB. ACEH TAMIANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1117', '11', 'KAB. BENER MERIAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('1118', '11', 'KAB. PIDIE JAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1171', '11', 'KOTA BANDA ACEH', 2);
INSERT INTO `ref_kabupaten` VALUES ('1172', '11', 'KOTA SABANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('1173', '11', 'KOTA LHOKSEUMAWE', 2);
INSERT INTO `ref_kabupaten` VALUES ('1174', '11', 'KOTA LANGSA', 2);
INSERT INTO `ref_kabupaten` VALUES ('1175', '11', 'KOTA SUBULUSSALAM', 2);
INSERT INTO `ref_kabupaten` VALUES ('1201', '12', 'KAB. TAPANULI TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('1202', '12', 'KAB. TAPANULI UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1203', '12', 'KAB. TAPANULI SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1204', '12', 'KAB. NIAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('1205', '12', 'KAB. LANGKAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1206', '12', 'KAB. KARO', 1);
INSERT INTO `ref_kabupaten` VALUES ('1207', '12', 'KAB. DELI SERDANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1208', '12', 'KAB. SIMALUNGUN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1209', '12', 'KAB. ASAHAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1210', '12', 'KAB. LABUHANBATU', 1);
INSERT INTO `ref_kabupaten` VALUES ('1211', '12', 'KAB. DAIRI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1212', '12', 'KAB. TOBA SAMOSIR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1213', '12', 'KAB. MANDAILING NATAL', 1);
INSERT INTO `ref_kabupaten` VALUES ('1214', '12', 'KAB. NIAS SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1215', '12', 'KAB. PAKPAK BHARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1216', '12', 'KAB. HUMBANG HASUNDUTAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1217', '12', 'KAB. SAMOSIR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1218', '12', 'KAB. SERDANG BEDAGAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1219', '12', 'KAB. BATU BARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1220', '12', 'KAB. PADANG LAWAS UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1221', '12', 'KAB. PADANG LAWAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('1222', '12', 'KAB. LABUHANBATU SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1223', '12', 'KAB. LABUHANBATU UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1224', '12', 'KAB. NIAS UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1225', '12', 'KAB. NIAS BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1271', '12', 'KOTA MEDAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('1272', '12', 'KOTA PEMATANG SIANTAR', 2);
INSERT INTO `ref_kabupaten` VALUES ('1273', '12', 'KOTA SIBOLGA', 2);
INSERT INTO `ref_kabupaten` VALUES ('1274', '12', 'KOTA TANJUNG BALAI', 2);
INSERT INTO `ref_kabupaten` VALUES ('1275', '12', 'KOTA BINJAI', 2);
INSERT INTO `ref_kabupaten` VALUES ('1276', '12', 'KOTA TEBING TINGGI', 2);
INSERT INTO `ref_kabupaten` VALUES ('1277', '12', 'KOTA PADANGSIDIMPUAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('1278', '12', 'KOTA GUNUNGSITOLI', 2);
INSERT INTO `ref_kabupaten` VALUES ('1301', '13', 'KAB. PESISIR SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1302', '13', 'KAB. SOLOK', 1);
INSERT INTO `ref_kabupaten` VALUES ('1303', '13', 'KAB. SIJUNJUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1304', '13', 'KAB. TANAH DATAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1305', '13', 'KAB. PADANG PARIAMAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1306', '13', 'KAB. AGAM', 1);
INSERT INTO `ref_kabupaten` VALUES ('1307', '13', 'KAB. LIMA PULUH KOTA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1308', '13', 'KAB. PASAMAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1309', '13', 'KAB. KEPULAUAN MENTAWAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1310', '13', 'KAB. DHARMASRAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1311', '13', 'KAB. SOLOK SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1312', '13', 'KAB. PASAMAN BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1371', '13', 'KOTA PADANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('1372', '13', 'KOTA SOLOK', 2);
INSERT INTO `ref_kabupaten` VALUES ('1373', '13', 'KOTA SAWAHLUNTO', 2);
INSERT INTO `ref_kabupaten` VALUES ('1374', '13', 'KOTA PADANG PANJANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('1375', '13', 'KOTA BUKITTINGGI', 2);
INSERT INTO `ref_kabupaten` VALUES ('1376', '13', 'KOTA PAYAKUMBUH', 2);
INSERT INTO `ref_kabupaten` VALUES ('1377', '13', 'KOTA PARIAMAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('1401', '14', 'KAB. KAMPAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1402', '14', 'KAB. INDRAGIRI HULU', 1);
INSERT INTO `ref_kabupaten` VALUES ('1403', '14', 'KAB. BENGKALIS', 1);
INSERT INTO `ref_kabupaten` VALUES ('1404', '14', 'KAB. INDRAGIRI HILIR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1405', '14', 'KAB. PELALAWAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1406', '14', 'KAB. ROKAN HULU', 1);
INSERT INTO `ref_kabupaten` VALUES ('1407', '14', 'KAB. ROKAN HILIR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1408', '14', 'KAB. SIAK', 1);
INSERT INTO `ref_kabupaten` VALUES ('1409', '14', 'KAB. KUANTAN SINGINGI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1410', '14', 'KAB. KEPULAUAN MERANTI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1471', '14', 'KOTA PEKANBARU', 2);
INSERT INTO `ref_kabupaten` VALUES ('1472', '14', 'KOTA DUMAI', 2);
INSERT INTO `ref_kabupaten` VALUES ('1501', '15', 'KAB. KERINCI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1502', '15', 'KAB. MERANGIN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1503', '15', 'KAB. SAROLANGUN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1504', '15', 'KAB. BATANGHARI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1505', '15', 'KAB. MUARO JAMBI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1506', '15', 'KAB. TANJUNG JABUNG BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1507', '15', 'KAB. TANJUNG JABUNG TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1508', '15', 'KAB. BUNGO', 1);
INSERT INTO `ref_kabupaten` VALUES ('1509', '15', 'KAB. TEBO', 1);
INSERT INTO `ref_kabupaten` VALUES ('1571', '15', 'KOTA JAMBI', 2);
INSERT INTO `ref_kabupaten` VALUES ('1572', '15', 'KOTA SUNGAI PENUH', 2);
INSERT INTO `ref_kabupaten` VALUES ('1601', '16', 'KAB. OGAN KOMERING ULU', 1);
INSERT INTO `ref_kabupaten` VALUES ('1602', '16', 'KAB. OGAN KOMERING ILIR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1603', '16', 'KAB. MUARA ENIM', 1);
INSERT INTO `ref_kabupaten` VALUES ('1604', '16', 'KAB. LAHAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1605', '16', 'KAB. MUSI RAWAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('1606', '16', 'KAB. MUSI BANYUASIN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1607', '16', 'KAB. BANYUASIN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1608', '16', 'KAB. OGAN KOMERING ULU TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1609', '16', 'KAB. OGAN KOMERING ULU SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1610', '16', 'KAB. OGAN ILIR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1611', '16', 'KAB. EMPAT LAWANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1612', '16', 'KAB. PENUKAL ABAB LEMATANG ILIR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1613', '16', 'KAB. MUSI RAWAS UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1671', '16', 'KOTA PALEMBANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('1672', '16', 'KOTA PAGAR ALAM', 2);
INSERT INTO `ref_kabupaten` VALUES ('1673', '16', 'KOTA LUBUK LINGGAU', 2);
INSERT INTO `ref_kabupaten` VALUES ('1674', '16', 'KOTA PRABUMULIH', 2);
INSERT INTO `ref_kabupaten` VALUES ('1701', '17', 'KAB. BENGKULU SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1702', '17', 'KAB. REJANG LEBONG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1703', '17', 'KAB. BENGKULU UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1704', '17', 'KAB. KAUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1705', '17', 'KAB. SELUMA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1706', '17', 'KAB. MUKO MUKO', 1);
INSERT INTO `ref_kabupaten` VALUES ('1707', '17', 'KAB. LEBONG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1708', '17', 'KAB. KEPAHIANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1709', '17', 'KAB. BENGKULU TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('1771', '17', 'KOTA BENGKULU', 2);
INSERT INTO `ref_kabupaten` VALUES ('1801', '18', 'KAB. LAMPUNG SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1802', '18', 'KAB. LAMPUNG TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('1803', '18', 'KAB. LAMPUNG UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1804', '18', 'KAB. LAMPUNG BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1805', '18', 'KAB. TULANG BAWANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1806', '18', 'KAB. TANGGAMUS', 1);
INSERT INTO `ref_kabupaten` VALUES ('1807', '18', 'KAB. LAMPUNG TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1808', '18', 'KAB. WAY KANAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1809', '18', 'KAB. PESAWARAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1810', '18', 'KAB. PRINGSEWU', 1);
INSERT INTO `ref_kabupaten` VALUES ('1811', '18', 'KAB. MESUJI', 1);
INSERT INTO `ref_kabupaten` VALUES ('1812', '18', 'KAB. TULANG BAWANG BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1813', '18', 'KAB. PESISIR BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1871', '18', 'KOTA BANDAR LAMPUNG', 2);
INSERT INTO `ref_kabupaten` VALUES ('1872', '18', 'KOTA METRO', 2);
INSERT INTO `ref_kabupaten` VALUES ('1901', '19', 'KAB. BANGKA', 1);
INSERT INTO `ref_kabupaten` VALUES ('1902', '19', 'KAB. BELITUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('1903', '19', 'KAB. BANGKA SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('1904', '19', 'KAB. BANGKA TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('1905', '19', 'KAB. BANGKA BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('1906', '19', 'KAB. BELITUNG TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('1971', '19', 'KOTA PANGKAL PINANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('2101', '21', 'KAB. BINTAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('2102', '21', 'KAB. KARIMUN', 1);
INSERT INTO `ref_kabupaten` VALUES ('2103', '21', 'KAB. NATUNA', 1);
INSERT INTO `ref_kabupaten` VALUES ('2104', '21', 'KAB. LINGGA', 1);
INSERT INTO `ref_kabupaten` VALUES ('2105', '21', 'KAB. KEPULAUAN ANAMBAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('2171', '21', 'KOTA BATAM', 2);
INSERT INTO `ref_kabupaten` VALUES ('2172', '21', 'KOTA TANJUNG PINANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('3101', '31', 'KAB. ADM. KEP. SERIBU', 1);
INSERT INTO `ref_kabupaten` VALUES ('3171', '31', 'KOTA ADM. JAKARTA PUSAT', 2);
INSERT INTO `ref_kabupaten` VALUES ('3172', '31', 'KOTA ADM. JAKARTA UTARA', 2);
INSERT INTO `ref_kabupaten` VALUES ('3173', '31', 'KOTA ADM. JAKARTA BARAT', 2);
INSERT INTO `ref_kabupaten` VALUES ('3174', '31', 'KOTA ADM. JAKARTA SELATAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('3175', '31', 'KOTA ADM. JAKARTA TIMUR', 2);
INSERT INTO `ref_kabupaten` VALUES ('3201', '32', 'KAB. BOGOR', 1);
INSERT INTO `ref_kabupaten` VALUES ('3202', '32', 'KAB. SUKABUMI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3203', '32', 'KAB. CIANJUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('3204', '32', 'KAB. BANDUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3205', '32', 'KAB. GARUT', 1);
INSERT INTO `ref_kabupaten` VALUES ('3206', '32', 'KAB. TASIKMALAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('3207', '32', 'KAB. CIAMIS', 1);
INSERT INTO `ref_kabupaten` VALUES ('3208', '32', 'KAB. KUNINGAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3209', '32', 'KAB. CIREBON', 1);
INSERT INTO `ref_kabupaten` VALUES ('3210', '32', 'KAB. MAJALENGKA', 1);
INSERT INTO `ref_kabupaten` VALUES ('3211', '32', 'KAB. SUMEDANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3212', '32', 'KAB. INDRAMAYU', 1);
INSERT INTO `ref_kabupaten` VALUES ('3213', '32', 'KAB. SUBANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3214', '32', 'KAB. PURWAKARTA', 1);
INSERT INTO `ref_kabupaten` VALUES ('3215', '32', 'KAB. KARAWANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3216', '32', 'KAB. BEKASI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3217', '32', 'KAB. BANDUNG BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('3218', '32', 'KAB. PANGANDARAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3271', '32', 'KOTA BOGOR', 2);
INSERT INTO `ref_kabupaten` VALUES ('3272', '32', 'KOTA SUKABUMI', 2);
INSERT INTO `ref_kabupaten` VALUES ('3273', '32', 'KOTA BANDUNG', 2);
INSERT INTO `ref_kabupaten` VALUES ('3274', '32', 'KOTA CIREBON', 2);
INSERT INTO `ref_kabupaten` VALUES ('3275', '32', 'KOTA BEKASI', 2);
INSERT INTO `ref_kabupaten` VALUES ('3276', '32', 'KOTA DEPOK', 2);
INSERT INTO `ref_kabupaten` VALUES ('3277', '32', 'KOTA CIMAHI', 2);
INSERT INTO `ref_kabupaten` VALUES ('3278', '32', 'KOTA TASIKMALAYA', 2);
INSERT INTO `ref_kabupaten` VALUES ('3279', '32', 'KOTA BANJAR', 2);
INSERT INTO `ref_kabupaten` VALUES ('3301', '33', 'KAB. CILACAP', 1);
INSERT INTO `ref_kabupaten` VALUES ('3302', '33', 'KAB. BANYUMAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('3303', '33', 'KAB. PURBALINGGA', 1);
INSERT INTO `ref_kabupaten` VALUES ('3304', '33', 'KAB. BANJARNEGARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('3305', '33', 'KAB. KEBUMEN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3306', '33', 'KAB. PURWOREJO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3307', '33', 'KAB. WONOSOBO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3308', '33', 'KAB. MAGELANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3309', '33', 'KAB. BOYOLALI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3310', '33', 'KAB. KLATEN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3311', '33', 'KAB. SUKOHARJO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3312', '33', 'KAB. WONOGIRI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3313', '33', 'KAB. KARANGANYAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('3314', '33', 'KAB. SRAGEN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3315', '33', 'KAB. GROBOGAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3316', '33', 'KAB. BLORA', 1);
INSERT INTO `ref_kabupaten` VALUES ('3317', '33', 'KAB. REMBANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3318', '33', 'KAB. PATI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3319', '33', 'KAB. KUDUS', 1);
INSERT INTO `ref_kabupaten` VALUES ('3320', '33', 'KAB. JEPARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('3321', '33', 'KAB. DEMAK', 1);
INSERT INTO `ref_kabupaten` VALUES ('3322', '33', 'KAB. SEMARANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3323', '33', 'KAB. TEMANGGUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3324', '33', 'KAB. KENDAL', 1);
INSERT INTO `ref_kabupaten` VALUES ('3325', '33', 'KAB. BATANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3326', '33', 'KAB. PEKALONGAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3327', '33', 'KAB. PEMALANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3328', '33', 'KAB. TEGAL', 1);
INSERT INTO `ref_kabupaten` VALUES ('3329', '33', 'KAB. BREBES', 1);
INSERT INTO `ref_kabupaten` VALUES ('3371', '33', 'KOTA MAGELANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('3372', '33', 'KOTA SURAKARTA', 2);
INSERT INTO `ref_kabupaten` VALUES ('3373', '33', 'KOTA SALATIGA', 2);
INSERT INTO `ref_kabupaten` VALUES ('3374', '33', 'KOTA SEMARANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('3375', '33', 'KOTA PEKALONGAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('3376', '33', 'KOTA TEGAL', 2);
INSERT INTO `ref_kabupaten` VALUES ('3401', '34', 'KAB. KULON PROGO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3402', '34', 'KAB. BANTUL', 1);
INSERT INTO `ref_kabupaten` VALUES ('3403', '34', 'KAB. GUNUNG KIDUL', 1);
INSERT INTO `ref_kabupaten` VALUES ('3404', '34', 'KAB. SLEMAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3471', '34', 'KOTA YOGYAKARTA', 2);
INSERT INTO `ref_kabupaten` VALUES ('3501', '35', 'KAB. PACITAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3502', '35', 'KAB. PONOROGO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3503', '35', 'KAB. TRENGGALEK', 1);
INSERT INTO `ref_kabupaten` VALUES ('3504', '35', 'KAB. TULUNGAGUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3505', '35', 'KAB. BLITAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('3506', '35', 'KAB. KEDIRI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3507', '35', 'KAB. MALANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3508', '35', 'KAB. LUMAJANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3509', '35', 'KAB. JEMBER', 1);
INSERT INTO `ref_kabupaten` VALUES ('3510', '35', 'KAB. BANYUWANGI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3511', '35', 'KAB. BONDOWOSO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3512', '35', 'KAB. SITUBONDO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3513', '35', 'KAB. PROBOLINGGO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3514', '35', 'KAB. PASURUAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3515', '35', 'KAB. SIDOARJO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3516', '35', 'KAB. MOJOKERTO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3517', '35', 'KAB. JOMBANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3518', '35', 'KAB. NGANJUK', 1);
INSERT INTO `ref_kabupaten` VALUES ('3519', '35', 'KAB. MADIUN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3520', '35', 'KAB. MAGETAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3521', '35', 'KAB. NGAWI', 1);
INSERT INTO `ref_kabupaten` VALUES ('3522', '35', 'KAB. BOJONEGORO', 1);
INSERT INTO `ref_kabupaten` VALUES ('3523', '35', 'KAB. TUBAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3524', '35', 'KAB. LAMONGAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3525', '35', 'KAB. GRESIK', 1);
INSERT INTO `ref_kabupaten` VALUES ('3526', '35', 'KAB. BANGKALAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3527', '35', 'KAB. SAMPANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3528', '35', 'KAB. PAMEKASAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('3529', '35', 'KAB. SUMENEP', 1);
INSERT INTO `ref_kabupaten` VALUES ('3571', '35', 'KOTA KEDIRI', 2);
INSERT INTO `ref_kabupaten` VALUES ('3572', '35', 'KOTA BLITAR', 2);
INSERT INTO `ref_kabupaten` VALUES ('3573', '35', 'KOTA MALANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('3574', '35', 'KOTA PROBOLINGGO', 2);
INSERT INTO `ref_kabupaten` VALUES ('3575', '35', 'KOTA PASURUAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('3576', '35', 'KOTA MOJOKERTO', 2);
INSERT INTO `ref_kabupaten` VALUES ('3577', '35', 'KOTA MADIUN', 2);
INSERT INTO `ref_kabupaten` VALUES ('3578', '35', 'KOTA SURABAYA', 2);
INSERT INTO `ref_kabupaten` VALUES ('3579', '35', 'KOTA BATU', 2);
INSERT INTO `ref_kabupaten` VALUES ('3601', '36', 'KAB. PANDEGLANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3602', '36', 'KAB. LEBAK', 1);
INSERT INTO `ref_kabupaten` VALUES ('3603', '36', 'KAB. TANGERANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3604', '36', 'KAB. SERANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('3671', '36', 'KOTA TANGERANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('3672', '36', 'KOTA CILEGON', 2);
INSERT INTO `ref_kabupaten` VALUES ('3673', '36', 'KOTA SERANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('3674', '36', 'KOTA TANGERANG SELATAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('5101', '51', 'KAB. JEMBRANA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5102', '51', 'KAB. TABANAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('5103', '51', 'KAB. BADUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('5104', '51', 'KAB. GIANYAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('5105', '51', 'KAB. KLUNGKUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('5106', '51', 'KAB. BANGLI', 1);
INSERT INTO `ref_kabupaten` VALUES ('5107', '51', 'KAB. KARANGASEM', 1);
INSERT INTO `ref_kabupaten` VALUES ('5108', '51', 'KAB. BULELENG', 1);
INSERT INTO `ref_kabupaten` VALUES ('5171', '51', 'KOTA DENPASAR', 2);
INSERT INTO `ref_kabupaten` VALUES ('5201', '52', 'KAB. LOMBOK BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('5202', '52', 'KAB. LOMBOK TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('5203', '52', 'KAB. LOMBOK TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('5204', '52', 'KAB. SUMBAWA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5205', '52', 'KAB. DOMPU', 1);
INSERT INTO `ref_kabupaten` VALUES ('5206', '52', 'KAB. BIMA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5207', '52', 'KAB. SUMBAWA BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('5208', '52', 'KAB. LOMBOK UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5271', '52', 'KOTA MATARAM', 2);
INSERT INTO `ref_kabupaten` VALUES ('5272', '52', 'KOTA BIMA', 2);
INSERT INTO `ref_kabupaten` VALUES ('5301', '53', 'KAB. KUPANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('5302', '53', 'KAB TIMOR TENGAH SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('5303', '53', 'KAB. TIMOR TENGAH UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5304', '53', 'KAB. BELU', 1);
INSERT INTO `ref_kabupaten` VALUES ('5305', '53', 'KAB. ALOR', 1);
INSERT INTO `ref_kabupaten` VALUES ('5306', '53', 'KAB. FLORES TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('5307', '53', 'KAB. SIKKA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5308', '53', 'KAB. ENDE', 1);
INSERT INTO `ref_kabupaten` VALUES ('5309', '53', 'KAB. NGADA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5310', '53', 'KAB. MANGGARAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('5311', '53', 'KAB. SUMBA TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('5312', '53', 'KAB. SUMBA BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('5313', '53', 'KAB. LEMBATA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5314', '53', 'KAB. ROTE NDAO', 1);
INSERT INTO `ref_kabupaten` VALUES ('5315', '53', 'KAB. MANGGARAI BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('5316', '53', 'KAB. NAGEKEO', 1);
INSERT INTO `ref_kabupaten` VALUES ('5317', '53', 'KAB. SUMBA TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('5318', '53', 'KAB. SUMBA BARAT DAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5319', '53', 'KAB. MANGGARAI TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('5320', '53', 'KAB. SABU RAIJUA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5321', '53', 'KAB. MALAKA', 1);
INSERT INTO `ref_kabupaten` VALUES ('5371', '53', 'KOTA KUPANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('6101', '61', 'KAB. SAMBAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('6102', '61', 'KAB. MEMPAWAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('6103', '61', 'KAB. SANGGAU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6104', '61', 'KAB. KETAPANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('6105', '61', 'KAB. SINTANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('6106', '61', 'KAB. KAPUAS HULU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6107', '61', 'KAB. BENGKAYANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('6108', '61', 'KAB. LANDAK', 1);
INSERT INTO `ref_kabupaten` VALUES ('6109', '61', 'KAB. SEKADAU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6110', '61', 'KAB. MELAWI', 1);
INSERT INTO `ref_kabupaten` VALUES ('6111', '61', 'KAB. KAYONG UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6112', '61', 'KAB. KUBU RAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6171', '61', 'KOTA PONTIANAK', 2);
INSERT INTO `ref_kabupaten` VALUES ('6172', '61', 'KOTA SINGKAWANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('6201', '62', 'KAB. KOTAWARINGIN BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('6202', '62', 'KAB. KOTAWARINGIN TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('6203', '62', 'KAB. KAPUAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('6204', '62', 'KAB. BARITO SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6205', '62', 'KAB. BARITO UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6206', '62', 'KAB. KATINGAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6207', '62', 'KAB. SERUYAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6208', '62', 'KAB. SUKAMARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6209', '62', 'KAB. LAMANDAU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6210', '62', 'KAB. GUNUNG MAS', 1);
INSERT INTO `ref_kabupaten` VALUES ('6211', '62', 'KAB. PULANG PISAU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6212', '62', 'KAB. MURUNG RAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6213', '62', 'KAB. BARITO TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('6271', '62', 'KOTA PALANGKARAYA', 2);
INSERT INTO `ref_kabupaten` VALUES ('6301', '63', 'KAB. TANAH LAUT', 1);
INSERT INTO `ref_kabupaten` VALUES ('6302', '63', 'KAB. KOTABARU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6303', '63', 'KAB. BANJAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('6304', '63', 'KAB. BARITO KUALA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6305', '63', 'KAB. TAPIN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6306', '63', 'KAB. HULU SUNGAI SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6307', '63', 'KAB. HULU SUNGAI TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('6308', '63', 'KAB. HULU SUNGAI UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6309', '63', 'KAB. TABALONG', 1);
INSERT INTO `ref_kabupaten` VALUES ('6310', '63', 'KAB. TANAH BUMBU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6311', '63', 'KAB. BALANGAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6371', '63', 'KOTA BANJARMASIN', 2);
INSERT INTO `ref_kabupaten` VALUES ('6372', '63', 'KOTA BANJARBARU', 2);
INSERT INTO `ref_kabupaten` VALUES ('6401', '64', 'KAB. PASER', 1);
INSERT INTO `ref_kabupaten` VALUES ('6402', '64', 'KAB. KUTAI KARTANEGARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6403', '64', 'KAB. BERAU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6407', '64', 'KAB. KUTAI BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('6408', '64', 'KAB. KUTAI TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('6409', '64', 'KAB. PENAJAM PASER UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('6411', '64', 'KAB. MAHAKAM ULU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6471', '64', 'KOTA BALIKPAPAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('6472', '64', 'KOTA SAMARINDA', 2);
INSERT INTO `ref_kabupaten` VALUES ('6474', '64', 'KOTA BONTANG', 2);
INSERT INTO `ref_kabupaten` VALUES ('6501', '65', 'KAB. BULUNGAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6502', '65', 'KAB. MALINAU', 1);
INSERT INTO `ref_kabupaten` VALUES ('6503', '65', 'KAB. NUNUKAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('6504', '65', 'KAB. TANA TIDUNG', 1);
INSERT INTO `ref_kabupaten` VALUES ('6571', '65', 'KOTA TARAKAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('7101', '71', 'KAB. BOLAANG MONGONDOW', 1);
INSERT INTO `ref_kabupaten` VALUES ('7102', '71', 'KAB. MINAHASA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7103', '71', 'KAB. KEPULAUAN SANGIHE', 1);
INSERT INTO `ref_kabupaten` VALUES ('7104', '71', 'KAB. KEPULAUAN TALAUD', 1);
INSERT INTO `ref_kabupaten` VALUES ('7105', '71', 'KAB. MINAHASA SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('7106', '71', 'KAB. MINAHASA UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7107', '71', 'KAB. MINAHASA TENGGARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7108', '71', 'KAB. BOLAANG MONGONDOW UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7109', '71', 'KAB. KEP. SIAU TAGULANDANG BIARO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7110', '71', 'KAB. BOLAANG MONGONDOW TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('7111', '71', 'KAB. BOLAANG MONGONDOW SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('7171', '71', 'KOTA MANADO', 2);
INSERT INTO `ref_kabupaten` VALUES ('7172', '71', 'KOTA BITUNG', 2);
INSERT INTO `ref_kabupaten` VALUES ('7173', '71', 'KOTA TOMOHON', 2);
INSERT INTO `ref_kabupaten` VALUES ('7174', '71', 'KOTA KOTAMOBAGU', 2);
INSERT INTO `ref_kabupaten` VALUES ('7201', '72', 'KAB. BANGGAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('7202', '72', 'KAB. POSO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7203', '72', 'KAB. DONGGALA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7204', '72', 'KAB. TOLI TOLI', 1);
INSERT INTO `ref_kabupaten` VALUES ('7205', '72', 'KAB. BUOL', 1);
INSERT INTO `ref_kabupaten` VALUES ('7206', '72', 'KAB. MOROWALI', 1);
INSERT INTO `ref_kabupaten` VALUES ('7207', '72', 'KAB. BANGGAI KEPULAUAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('7208', '72', 'KAB. PARIGI MOUTONG', 1);
INSERT INTO `ref_kabupaten` VALUES ('7209', '72', 'KAB. TOJO UNA UNA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7210', '72', 'KAB. SIGI', 1);
INSERT INTO `ref_kabupaten` VALUES ('7211', '72', 'KAB. BANGGAI LAUT', 1);
INSERT INTO `ref_kabupaten` VALUES ('7212', '72', 'KAB. MOROWALI UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7271', '72', 'KOTA PALU', 2);
INSERT INTO `ref_kabupaten` VALUES ('7301', '73', 'KAB. KEPULAUAN SELAYAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('7302', '73', 'KAB. BULUKUMBA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7303', '73', 'KAB. BANTAENG', 1);
INSERT INTO `ref_kabupaten` VALUES ('7304', '73', 'KAB. JENEPONTO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7305', '73', 'KAB. TAKALAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('7306', '73', 'KAB. GOWA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7307', '73', 'KAB. SINJAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('7308', '73', 'KAB. BONE', 1);
INSERT INTO `ref_kabupaten` VALUES ('7309', '73', 'KAB. MAROS', 1);
INSERT INTO `ref_kabupaten` VALUES ('7310', '73', 'KAB. PANGKAJENE KEPULAUAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('7311', '73', 'KAB. BARRU', 1);
INSERT INTO `ref_kabupaten` VALUES ('7312', '73', 'KAB. SOPPENG', 1);
INSERT INTO `ref_kabupaten` VALUES ('7313', '73', 'KAB. WAJO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7314', '73', 'KAB. SIDENRENG RAPPANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('7315', '73', 'KAB. PINRANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('7316', '73', 'KAB. ENREKANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('7317', '73', 'KAB. LUWU', 1);
INSERT INTO `ref_kabupaten` VALUES ('7318', '73', 'KAB. TANA TORAJA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7322', '73', 'KAB. LUWU UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7324', '73', 'KAB. LUWU TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('7326', '73', 'KAB. TORAJA UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7371', '73', 'KOTA MAKASSAR', 2);
INSERT INTO `ref_kabupaten` VALUES ('7372', '73', 'KOTA PARE PARE', 2);
INSERT INTO `ref_kabupaten` VALUES ('7373', '73', 'KOTA PALOPO', 2);
INSERT INTO `ref_kabupaten` VALUES ('7401', '74', 'KAB. KOLAKA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7402', '74', 'KAB. KONAWE', 1);
INSERT INTO `ref_kabupaten` VALUES ('7403', '74', 'KAB. MUNA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7404', '74', 'KAB. BUTON', 1);
INSERT INTO `ref_kabupaten` VALUES ('7405', '74', 'KAB. KONAWE SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('7406', '74', 'KAB. BOMBANA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7407', '74', 'KAB. WAKATOBI', 1);
INSERT INTO `ref_kabupaten` VALUES ('7408', '74', 'KAB. KOLAKA UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7409', '74', 'KAB. KONAWE UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7410', '74', 'KAB. BUTON UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7411', '74', 'KAB. KOLAKA TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('7412', '74', 'KAB. KONAWE KEPULAUAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('7413', '74', 'KAB. MUNA BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('7414', '74', 'KAB. BUTON TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('7415', '74', 'KAB. BUTON SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('7471', '74', 'KOTA KENDARI', 2);
INSERT INTO `ref_kabupaten` VALUES ('7472', '74', 'KOTA BAU BAU', 2);
INSERT INTO `ref_kabupaten` VALUES ('7501', '75', 'KAB. GORONTALO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7502', '75', 'KAB. BOALEMO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7503', '75', 'KAB. BONE BOLANGO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7504', '75', 'KAB. PAHUWATO', 1);
INSERT INTO `ref_kabupaten` VALUES ('7505', '75', 'KAB. GORONTALO UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7571', '75', 'KOTA GORONTALO', 2);
INSERT INTO `ref_kabupaten` VALUES ('7601', '76', 'KAB. MAMUJU UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7602', '76', 'KAB. MAMUJU', 1);
INSERT INTO `ref_kabupaten` VALUES ('7603', '76', 'KAB. MAMASA', 1);
INSERT INTO `ref_kabupaten` VALUES ('7604', '76', 'KAB. POLEWALI MANDAR', 1);
INSERT INTO `ref_kabupaten` VALUES ('7605', '76', 'KAB. MAJENE', 1);
INSERT INTO `ref_kabupaten` VALUES ('7606', '76', 'KAB. MAMUJU TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('8101', '81', 'KAB. MALUKU TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('8102', '81', 'KAB. MALUKU TENGGARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('8103', '81', 'KAB MALUKU TENGGARA BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('8104', '81', 'KAB. BURU', 1);
INSERT INTO `ref_kabupaten` VALUES ('8105', '81', 'KAB. SERAM BAGIAN TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('8106', '81', 'KAB. SERAM BAGIAN BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('8107', '81', 'KAB. KEPULAUAN ARU', 1);
INSERT INTO `ref_kabupaten` VALUES ('8108', '81', 'KAB. MALUKU BARAT DAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('8109', '81', 'KAB. BURU SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('8171', '81', 'KOTA AMBON', 2);
INSERT INTO `ref_kabupaten` VALUES ('8172', '81', 'KOTA TUAL', 2);
INSERT INTO `ref_kabupaten` VALUES ('8201', '82', 'KAB. HALMAHERA BARAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('8202', '82', 'KAB. HALMAHERA TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('8203', '82', 'KAB. HALMAHERA UTARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('8204', '82', 'KAB. HALMAHERA SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('8205', '82', 'KAB. KEPULAUAN SULA', 1);
INSERT INTO `ref_kabupaten` VALUES ('8206', '82', 'KAB. HALMAHERA TIMUR', 1);
INSERT INTO `ref_kabupaten` VALUES ('8207', '82', 'KAB. PULAU MOROTAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('8208', '82', 'KAB. PULAU TALIABU', 1);
INSERT INTO `ref_kabupaten` VALUES ('8271', '82', 'KOTA TERNATE', 2);
INSERT INTO `ref_kabupaten` VALUES ('8272', '82', 'KOTA TIDORE KEPULAUAN', 2);
INSERT INTO `ref_kabupaten` VALUES ('9101', '91', 'KAB. MERAUKE', 1);
INSERT INTO `ref_kabupaten` VALUES ('9102', '91', 'KAB. JAYAWIJAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9103', '91', 'KAB. JAYAPURA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9104', '91', 'KAB. NABIRE', 1);
INSERT INTO `ref_kabupaten` VALUES ('9105', '91', 'KAB. KEPULAUAN YAPEN', 1);
INSERT INTO `ref_kabupaten` VALUES ('9106', '91', 'KAB. BIAK NUMFOR', 1);
INSERT INTO `ref_kabupaten` VALUES ('9107', '91', 'KAB. PUNCAK JAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9108', '91', 'KAB. PANIAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9109', '91', 'KAB. MIMIKA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9110', '91', 'KAB. SARMI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9111', '91', 'KAB. KEEROM', 1);
INSERT INTO `ref_kabupaten` VALUES ('9112', '91', 'KAB PEGUNUNGAN BINTANG', 1);
INSERT INTO `ref_kabupaten` VALUES ('9113', '91', 'KAB. YAHUKIMO', 1);
INSERT INTO `ref_kabupaten` VALUES ('9114', '91', 'KAB. TOLIKARA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9115', '91', 'KAB. WAROPEN', 1);
INSERT INTO `ref_kabupaten` VALUES ('9116', '91', 'KAB. BOVEN DIGOEL', 1);
INSERT INTO `ref_kabupaten` VALUES ('9117', '91', 'KAB. MAPPI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9118', '91', 'KAB. ASMAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('9119', '91', 'KAB. SUPIORI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9120', '91', 'KAB. MAMBERAMO RAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9121', '91', 'KAB. MAMBERAMO TENGAH', 1);
INSERT INTO `ref_kabupaten` VALUES ('9122', '91', 'KAB. YALIMO', 1);
INSERT INTO `ref_kabupaten` VALUES ('9123', '91', 'KAB. LANNY JAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9124', '91', 'KAB. NDUGA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9125', '91', 'KAB. PUNCAK', 1);
INSERT INTO `ref_kabupaten` VALUES ('9126', '91', 'KAB. DOGIYAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9127', '91', 'KAB. INTAN JAYA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9128', '91', 'KAB. DEIYAI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9171', '91', 'KOTA JAYAPURA', 2);
INSERT INTO `ref_kabupaten` VALUES ('9201', '92', 'KAB. SORONG', 1);
INSERT INTO `ref_kabupaten` VALUES ('9202', '92', 'KAB. MANOKWARI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9203', '92', 'KAB. FAK FAK', 1);
INSERT INTO `ref_kabupaten` VALUES ('9204', '92', 'KAB. SORONG SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('9205', '92', 'KAB. RAJA AMPAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('9206', '92', 'KAB. TELUK BINTUNI', 1);
INSERT INTO `ref_kabupaten` VALUES ('9207', '92', 'KAB. TELUK WONDAMA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9208', '92', 'KAB. KAIMANA', 1);
INSERT INTO `ref_kabupaten` VALUES ('9209', '92', 'KAB. TAMBRAUW', 1);
INSERT INTO `ref_kabupaten` VALUES ('9210', '92', 'KAB. MAYBRAT', 1);
INSERT INTO `ref_kabupaten` VALUES ('9211', '92', 'KAB. MANOKWARI SELATAN', 1);
INSERT INTO `ref_kabupaten` VALUES ('9212', '92', 'KAB. PEGUNUNGAN ARFAK', 1);
INSERT INTO `ref_kabupaten` VALUES ('9271', '92', 'KOTA SORONG', 2);

-- ----------------------------
-- Table structure for ref_kecamatan
-- ----------------------------
DROP TABLE IF EXISTS `ref_kecamatan`;
CREATE TABLE `ref_kecamatan`  (
  `id_kec` char(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_kab` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_kec`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ref_kecamatan
-- ----------------------------
INSERT INTO `ref_kecamatan` VALUES ('110101', '1101', 'Bakongan');
INSERT INTO `ref_kecamatan` VALUES ('110102', '1101', 'Kluet Utara');
INSERT INTO `ref_kecamatan` VALUES ('110103', '1101', 'Kluet Selatan');
INSERT INTO `ref_kecamatan` VALUES ('110104', '1101', 'Labuhan Haji');
INSERT INTO `ref_kecamatan` VALUES ('110105', '1101', 'Meukek');
INSERT INTO `ref_kecamatan` VALUES ('110106', '1101', 'Samadua');
INSERT INTO `ref_kecamatan` VALUES ('110107', '1101', 'Sawang');
INSERT INTO `ref_kecamatan` VALUES ('110108', '1101', 'Tapaktuan');
INSERT INTO `ref_kecamatan` VALUES ('110109', '1101', 'Trumon');
INSERT INTO `ref_kecamatan` VALUES ('110110', '1101', 'Pasi Raja');
INSERT INTO `ref_kecamatan` VALUES ('110111', '1101', 'Labuhan Haji Timur');
INSERT INTO `ref_kecamatan` VALUES ('110112', '1101', 'Labuhan Haji Barat');
INSERT INTO `ref_kecamatan` VALUES ('110113', '1101', 'Kluet Tengah');
INSERT INTO `ref_kecamatan` VALUES ('110114', '1101', 'Kluet Timur');
INSERT INTO `ref_kecamatan` VALUES ('110115', '1101', 'Bakongan Timur');
INSERT INTO `ref_kecamatan` VALUES ('110116', '1101', 'Trumon Timur');
INSERT INTO `ref_kecamatan` VALUES ('110117', '1101', 'Kota Bahagia');
INSERT INTO `ref_kecamatan` VALUES ('110118', '1101', 'Trumon Tengah');
INSERT INTO `ref_kecamatan` VALUES ('110201', '1102', 'Lawe Alas');
INSERT INTO `ref_kecamatan` VALUES ('110202', '1102', 'Lawe Sigala-Gala');
INSERT INTO `ref_kecamatan` VALUES ('110203', '1102', 'Bambel');
INSERT INTO `ref_kecamatan` VALUES ('110204', '1102', 'Babussalam');
INSERT INTO `ref_kecamatan` VALUES ('110205', '1102', 'Badar');
INSERT INTO `ref_kecamatan` VALUES ('110206', '1102', 'Babul Makmur');
INSERT INTO `ref_kecamatan` VALUES ('110207', '1102', 'Darul Hasanah');
INSERT INTO `ref_kecamatan` VALUES ('110208', '1102', 'Lawe Bulan');
INSERT INTO `ref_kecamatan` VALUES ('110209', '1102', 'Bukit Tusam');
INSERT INTO `ref_kecamatan` VALUES ('110210', '1102', 'Semadam');
INSERT INTO `ref_kecamatan` VALUES ('110211', '1102', 'Babul Rahmah');
INSERT INTO `ref_kecamatan` VALUES ('110212', '1102', 'Ketambe');
INSERT INTO `ref_kecamatan` VALUES ('110213', '1102', 'Deleng Pokhkisen');
INSERT INTO `ref_kecamatan` VALUES ('110214', '1102', 'Lawe Sumur');
INSERT INTO `ref_kecamatan` VALUES ('110215', '1102', 'Tanoh Alas');
INSERT INTO `ref_kecamatan` VALUES ('110216', '1102', 'Leuser');
INSERT INTO `ref_kecamatan` VALUES ('110301', '1103', 'Darul Aman');
INSERT INTO `ref_kecamatan` VALUES ('110302', '1103', 'Julok');
INSERT INTO `ref_kecamatan` VALUES ('110303', '1103', 'Idi Rayeuk');
INSERT INTO `ref_kecamatan` VALUES ('110304', '1103', 'Birem Bayeun');
INSERT INTO `ref_kecamatan` VALUES ('110305', '1103', 'Serbajadi');
INSERT INTO `ref_kecamatan` VALUES ('110306', '1103', 'Nurussalam');
INSERT INTO `ref_kecamatan` VALUES ('110307', '1103', 'Peureulak');
INSERT INTO `ref_kecamatan` VALUES ('110308', '1103', 'Rantau Selamat');
INSERT INTO `ref_kecamatan` VALUES ('110309', '1103', 'Simpang Ulim');
INSERT INTO `ref_kecamatan` VALUES ('110310', '1103', 'Rantau Peureulak');
INSERT INTO `ref_kecamatan` VALUES ('110311', '1103', 'Pante Bidari');
INSERT INTO `ref_kecamatan` VALUES ('110312', '1103', 'Madat');
INSERT INTO `ref_kecamatan` VALUES ('110313', '1103', 'Indra Makmu');
INSERT INTO `ref_kecamatan` VALUES ('110314', '1103', 'Idi Tunong');
INSERT INTO `ref_kecamatan` VALUES ('110315', '1103', 'Banda Alam');
INSERT INTO `ref_kecamatan` VALUES ('110316', '1103', 'Peudawa');
INSERT INTO `ref_kecamatan` VALUES ('110317', '1103', 'Peureulak Timur');
INSERT INTO `ref_kecamatan` VALUES ('110318', '1103', 'Peureulak Barat');
INSERT INTO `ref_kecamatan` VALUES ('110319', '1103', 'Sungai Raya');
INSERT INTO `ref_kecamatan` VALUES ('110320', '1103', 'Simpang Jernih');
INSERT INTO `ref_kecamatan` VALUES ('110321', '1103', 'Darul Ihsan');
INSERT INTO `ref_kecamatan` VALUES ('110322', '1103', 'Darul Falah');
INSERT INTO `ref_kecamatan` VALUES ('110323', '1103', 'Idi Timur');
INSERT INTO `ref_kecamatan` VALUES ('110324', '1103', 'Peunaron');
INSERT INTO `ref_kecamatan` VALUES ('110401', '1104', 'Linge');
INSERT INTO `ref_kecamatan` VALUES ('110402', '1104', 'Silih Nara');
INSERT INTO `ref_kecamatan` VALUES ('110403', '1104', 'Bebesen');
INSERT INTO `ref_kecamatan` VALUES ('110407', '1104', 'Pegasing');
INSERT INTO `ref_kecamatan` VALUES ('110408', '1104', 'Bintang');
INSERT INTO `ref_kecamatan` VALUES ('110410', '1104', 'Ketol');
INSERT INTO `ref_kecamatan` VALUES ('110411', '1104', 'Kebayakan');
INSERT INTO `ref_kecamatan` VALUES ('110412', '1104', 'Kute Panang');
INSERT INTO `ref_kecamatan` VALUES ('110413', '1104', 'Celala');
INSERT INTO `ref_kecamatan` VALUES ('110417', '1104', 'Laut Tawar');
INSERT INTO `ref_kecamatan` VALUES ('110418', '1104', 'Atu Lintang');
INSERT INTO `ref_kecamatan` VALUES ('110419', '1104', 'Jagong Jeget');
INSERT INTO `ref_kecamatan` VALUES ('110420', '1104', 'Bies');
INSERT INTO `ref_kecamatan` VALUES ('110421', '1104', 'Rusip Antara');
INSERT INTO `ref_kecamatan` VALUES ('110501', '1105', 'Johan Pahwalan');
INSERT INTO `ref_kecamatan` VALUES ('110502', '1105', 'Kaway XVI');
INSERT INTO `ref_kecamatan` VALUES ('110503', '1105', 'Sungai Mas');
INSERT INTO `ref_kecamatan` VALUES ('110504', '1105', 'Woyla');
INSERT INTO `ref_kecamatan` VALUES ('110505', '1105', 'Samatiga');
INSERT INTO `ref_kecamatan` VALUES ('110506', '1105', 'Bubon');
INSERT INTO `ref_kecamatan` VALUES ('110507', '1105', 'Arongan Lambalek');
INSERT INTO `ref_kecamatan` VALUES ('110508', '1105', 'Pante Ceureumen');
INSERT INTO `ref_kecamatan` VALUES ('110509', '1105', 'Meureubo');
INSERT INTO `ref_kecamatan` VALUES ('110510', '1105', 'Woyla Barat');
INSERT INTO `ref_kecamatan` VALUES ('110511', '1105', 'Woyla Timur');
INSERT INTO `ref_kecamatan` VALUES ('110512', '1105', 'Panton Reu');
INSERT INTO `ref_kecamatan` VALUES ('110601', '1106', 'Lhoong');
INSERT INTO `ref_kecamatan` VALUES ('110602', '1106', 'Lhoknga');
INSERT INTO `ref_kecamatan` VALUES ('110603', '1106', 'Indrapuri');
INSERT INTO `ref_kecamatan` VALUES ('110604', '1106', 'Seulimeum');
INSERT INTO `ref_kecamatan` VALUES ('110605', '1106', 'Montasik');
INSERT INTO `ref_kecamatan` VALUES ('110606', '1106', 'Sukamakmur');
INSERT INTO `ref_kecamatan` VALUES ('110607', '1106', 'Darul Imarah');
INSERT INTO `ref_kecamatan` VALUES ('110608', '1106', 'Peukan Bada');
INSERT INTO `ref_kecamatan` VALUES ('110609', '1106', 'Mesjid Raya');
INSERT INTO `ref_kecamatan` VALUES ('110610', '1106', 'Ingin Jaya');
INSERT INTO `ref_kecamatan` VALUES ('110611', '1106', 'Kuta Baro');
INSERT INTO `ref_kecamatan` VALUES ('110612', '1106', 'Darussalam');
INSERT INTO `ref_kecamatan` VALUES ('110613', '1106', 'Pulo Aceh');
INSERT INTO `ref_kecamatan` VALUES ('110614', '1106', 'Lembah Seulawah');
INSERT INTO `ref_kecamatan` VALUES ('110615', '1106', 'Kota Jantho');
INSERT INTO `ref_kecamatan` VALUES ('110616', '1106', 'Kota Cot Glie');
INSERT INTO `ref_kecamatan` VALUES ('110617', '1106', 'Kuta Malaka');
INSERT INTO `ref_kecamatan` VALUES ('110618', '1106', 'Simpang Tiga');
INSERT INTO `ref_kecamatan` VALUES ('110619', '1106', 'Darul Kamal');
INSERT INTO `ref_kecamatan` VALUES ('110620', '1106', 'Baitussalam');
INSERT INTO `ref_kecamatan` VALUES ('110621', '1106', 'Krueng Barona Jaya');
INSERT INTO `ref_kecamatan` VALUES ('110622', '1106', 'Leupung');
INSERT INTO `ref_kecamatan` VALUES ('110623', '1106', 'Blang Bintang');
INSERT INTO `ref_kecamatan` VALUES ('110703', '1107', 'Batee');
INSERT INTO `ref_kecamatan` VALUES ('110704', '1107', 'Delima');
INSERT INTO `ref_kecamatan` VALUES ('110705', '1107', 'Geumpang');
INSERT INTO `ref_kecamatan` VALUES ('110706', '1107', 'Geulumpang Tiga');
INSERT INTO `ref_kecamatan` VALUES ('110707', '1107', 'Indra Jaya');
INSERT INTO `ref_kecamatan` VALUES ('110708', '1107', 'Kembang Tanjong');
INSERT INTO `ref_kecamatan` VALUES ('110709', '1107', 'Kota Sigli');
INSERT INTO `ref_kecamatan` VALUES ('110711', '1107', 'Mila');
INSERT INTO `ref_kecamatan` VALUES ('110712', '1107', 'Muara Tiga');
INSERT INTO `ref_kecamatan` VALUES ('110713', '1107', 'Mutiara');
INSERT INTO `ref_kecamatan` VALUES ('110714', '1107', 'Padang Tiji');
INSERT INTO `ref_kecamatan` VALUES ('110715', '1107', 'Peukan Baro');
INSERT INTO `ref_kecamatan` VALUES ('110716', '1107', 'Pidie');
INSERT INTO `ref_kecamatan` VALUES ('110717', '1107', 'Sakti');
INSERT INTO `ref_kecamatan` VALUES ('110718', '1107', 'Simpang Tiga');
INSERT INTO `ref_kecamatan` VALUES ('110719', '1107', 'Tangse');
INSERT INTO `ref_kecamatan` VALUES ('110721', '1107', 'Tiro/Truseb');
INSERT INTO `ref_kecamatan` VALUES ('110722', '1107', 'Keumala');
INSERT INTO `ref_kecamatan` VALUES ('110724', '1107', 'Mutiara Timur');
INSERT INTO `ref_kecamatan` VALUES ('110725', '1107', 'Grong-grong');
INSERT INTO `ref_kecamatan` VALUES ('110727', '1107', 'Mane');
INSERT INTO `ref_kecamatan` VALUES ('110729', '1107', 'Glumpang Baro');
INSERT INTO `ref_kecamatan` VALUES ('110731', '1107', 'Titeue');
INSERT INTO `ref_kecamatan` VALUES ('110801', '1108', 'Baktiya');
INSERT INTO `ref_kecamatan` VALUES ('110802', '1108', 'Dewantara');
INSERT INTO `ref_kecamatan` VALUES ('110803', '1108', 'Kuta Makmur');
INSERT INTO `ref_kecamatan` VALUES ('110804', '1108', 'Lhoksukon');
INSERT INTO `ref_kecamatan` VALUES ('110805', '1108', 'Matangkuli');
INSERT INTO `ref_kecamatan` VALUES ('110806', '1108', 'Muara Batu');
INSERT INTO `ref_kecamatan` VALUES ('110807', '1108', 'Meurah Mulia');
INSERT INTO `ref_kecamatan` VALUES ('110808', '1108', 'Samudera');
INSERT INTO `ref_kecamatan` VALUES ('110809', '1108', 'Seunuddon');
INSERT INTO `ref_kecamatan` VALUES ('110810', '1108', 'Syamtalira Aron');
INSERT INTO `ref_kecamatan` VALUES ('110811', '1108', 'Syamtalira Bayu');
INSERT INTO `ref_kecamatan` VALUES ('110812', '1108', 'Tanah Luas');
INSERT INTO `ref_kecamatan` VALUES ('110813', '1108', 'Tanah Pasir');
INSERT INTO `ref_kecamatan` VALUES ('110814', '1108', 'T. Jambo Aye');
INSERT INTO `ref_kecamatan` VALUES ('110815', '1108', 'Sawang');
INSERT INTO `ref_kecamatan` VALUES ('110816', '1108', 'Nisam');
INSERT INTO `ref_kecamatan` VALUES ('110817', '1108', 'Cot Girek');
INSERT INTO `ref_kecamatan` VALUES ('110818', '1108', 'Langkahan');
INSERT INTO `ref_kecamatan` VALUES ('110819', '1108', 'Baktiya Barat');
INSERT INTO `ref_kecamatan` VALUES ('110820', '1108', 'Paya Bakong');
INSERT INTO `ref_kecamatan` VALUES ('110821', '1108', 'Nibong');
INSERT INTO `ref_kecamatan` VALUES ('110822', '1108', 'Simpang Kramat');
INSERT INTO `ref_kecamatan` VALUES ('110823', '1108', 'Lapang');
INSERT INTO `ref_kecamatan` VALUES ('110824', '1108', 'Pirak Timur');
INSERT INTO `ref_kecamatan` VALUES ('110825', '1108', 'Geuredong Pase');
INSERT INTO `ref_kecamatan` VALUES ('110826', '1108', 'Banda Baro');
INSERT INTO `ref_kecamatan` VALUES ('110827', '1108', 'Nisam Antara');
INSERT INTO `ref_kecamatan` VALUES ('110901', '1109', 'Simeulue Tengah');
INSERT INTO `ref_kecamatan` VALUES ('110902', '1109', 'Salang');
INSERT INTO `ref_kecamatan` VALUES ('110903', '1109', 'Teupah Barat');
INSERT INTO `ref_kecamatan` VALUES ('110904', '1109', 'Simeulue Timur');
INSERT INTO `ref_kecamatan` VALUES ('110905', '1109', 'Teluk Dalam');
INSERT INTO `ref_kecamatan` VALUES ('110906', '1109', 'Simeulue Barat');
INSERT INTO `ref_kecamatan` VALUES ('110907', '1109', 'Teupah Selatan');
INSERT INTO `ref_kecamatan` VALUES ('110908', '1109', 'Alapan');
INSERT INTO `ref_kecamatan` VALUES ('110909', '1109', 'Teupah Tengah');
INSERT INTO `ref_kecamatan` VALUES ('110910', '1109', 'Simeulue Cut');
INSERT INTO `ref_kecamatan` VALUES ('111001', '1110', 'Pulau Banyak');
INSERT INTO `ref_kecamatan` VALUES ('111002', '1110', 'Simpang Kanan');
INSERT INTO `ref_kecamatan` VALUES ('111004', '1110', 'Singkil');
INSERT INTO `ref_kecamatan` VALUES ('111006', '1110', 'Gunung Meriah');
INSERT INTO `ref_kecamatan` VALUES ('111009', '1110', 'Kota Baharu');
INSERT INTO `ref_kecamatan` VALUES ('111010', '1110', 'Singkil Utara');
INSERT INTO `ref_kecamatan` VALUES ('111011', '1110', 'Danau Paris');
INSERT INTO `ref_kecamatan` VALUES ('111012', '1110', 'Suro Makmur');
INSERT INTO `ref_kecamatan` VALUES ('111013', '1110', 'Singkohor');
INSERT INTO `ref_kecamatan` VALUES ('111014', '1110', 'Kuala Baru');
INSERT INTO `ref_kecamatan` VALUES ('111016', '1110', 'Pulau Banyak Barat');
INSERT INTO `ref_kecamatan` VALUES ('111101', '1111', 'Samalanga');
INSERT INTO `ref_kecamatan` VALUES ('111102', '1111', 'Jeunieb');
INSERT INTO `ref_kecamatan` VALUES ('111103', '1111', 'Peudada');
INSERT INTO `ref_kecamatan` VALUES ('111104', '1111', 'Jeumpa');
INSERT INTO `ref_kecamatan` VALUES ('111105', '1111', 'Peusangan');
INSERT INTO `ref_kecamatan` VALUES ('111106', '1111', 'Makmur');
INSERT INTO `ref_kecamatan` VALUES ('111107', '1111', 'Gandapura');
INSERT INTO `ref_kecamatan` VALUES ('111108', '1111', 'Pandrah');
INSERT INTO `ref_kecamatan` VALUES ('111109', '1111', 'Juli');
INSERT INTO `ref_kecamatan` VALUES ('111110', '1111', 'Jangka');
INSERT INTO `ref_kecamatan` VALUES ('111111', '1111', 'Simpang Mamplam');
INSERT INTO `ref_kecamatan` VALUES ('111112', '1111', 'Peulimbang');
INSERT INTO `ref_kecamatan` VALUES ('111113', '1111', 'Kota Juang');
INSERT INTO `ref_kecamatan` VALUES ('111114', '1111', 'Kuala');
INSERT INTO `ref_kecamatan` VALUES ('111115', '1111', 'Peusangan Siblah Krueng');
INSERT INTO `ref_kecamatan` VALUES ('111116', '1111', 'Peusangan Selatan');
INSERT INTO `ref_kecamatan` VALUES ('111117', '1111', 'Kuta Blang');
INSERT INTO `ref_kecamatan` VALUES ('111201', '1112', 'Blang Pidie');
INSERT INTO `ref_kecamatan` VALUES ('111202', '1112', 'Tangan-Tangan');
INSERT INTO `ref_kecamatan` VALUES ('111203', '1112', 'Manggeng');
INSERT INTO `ref_kecamatan` VALUES ('111204', '1112', 'Susoh');
INSERT INTO `ref_kecamatan` VALUES ('111205', '1112', 'Kuala Batee');
INSERT INTO `ref_kecamatan` VALUES ('111206', '1112', 'Babah Rot');
INSERT INTO `ref_kecamatan` VALUES ('111207', '1112', 'Setia');
INSERT INTO `ref_kecamatan` VALUES ('111208', '1112', 'Jeumpa');
INSERT INTO `ref_kecamatan` VALUES ('111209', '1112', 'Lembah Sabil');
INSERT INTO `ref_kecamatan` VALUES ('111301', '1113', 'Blangkejeren');
INSERT INTO `ref_kecamatan` VALUES ('111302', '1113', 'Kutapanjang');
INSERT INTO `ref_kecamatan` VALUES ('111303', '1113', 'Rikit Gaib');
INSERT INTO `ref_kecamatan` VALUES ('111304', '1113', 'Terangun');
INSERT INTO `ref_kecamatan` VALUES ('111305', '1113', 'Pining');
INSERT INTO `ref_kecamatan` VALUES ('111306', '1113', 'Blangpegayon');
INSERT INTO `ref_kecamatan` VALUES ('111307', '1113', 'Puteri Betung');
INSERT INTO `ref_kecamatan` VALUES ('111308', '1113', 'Dabun Gelang');
INSERT INTO `ref_kecamatan` VALUES ('111309', '1113', 'Blangjerango');
INSERT INTO `ref_kecamatan` VALUES ('111310', '1113', 'Teripe Jaya');
INSERT INTO `ref_kecamatan` VALUES ('111311', '1113', 'Pantan Cuaca');
INSERT INTO `ref_kecamatan` VALUES ('111401', '1114', 'Teunom');
INSERT INTO `ref_kecamatan` VALUES ('111402', '1114', 'Krueng Sabee');
INSERT INTO `ref_kecamatan` VALUES ('111403', '1114', 'Setia Bhakti');
INSERT INTO `ref_kecamatan` VALUES ('111404', '1114', 'Sampoiniet');
INSERT INTO `ref_kecamatan` VALUES ('111405', '1114', 'Jaya');
INSERT INTO `ref_kecamatan` VALUES ('111406', '1114', 'Panga');
INSERT INTO `ref_kecamatan` VALUES ('111407', '1114', 'Indra Jaya');
INSERT INTO `ref_kecamatan` VALUES ('111408', '1114', 'Darul Hikmah');
INSERT INTO `ref_kecamatan` VALUES ('111409', '1114', 'Pasie Raya');
INSERT INTO `ref_kecamatan` VALUES ('111501', '1115', 'Kuala');
INSERT INTO `ref_kecamatan` VALUES ('111502', '1115', 'Seunagan');
INSERT INTO `ref_kecamatan` VALUES ('111503', '1115', 'Seunagan Timur');
INSERT INTO `ref_kecamatan` VALUES ('111504', '1115', 'Beutong');
INSERT INTO `ref_kecamatan` VALUES ('111505', '1115', 'Darul Makmur');
INSERT INTO `ref_kecamatan` VALUES ('111506', '1115', 'Suka Makmue');
INSERT INTO `ref_kecamatan` VALUES ('111507', '1115', 'Kuala Pesisir');
INSERT INTO `ref_kecamatan` VALUES ('111508', '1115', 'Tadu Raya');
INSERT INTO `ref_kecamatan` VALUES ('111509', '1115', 'Tripa Makmur');
INSERT INTO `ref_kecamatan` VALUES ('111510', '1115', 'Beutong Ateuh Banggalang');
INSERT INTO `ref_kecamatan` VALUES ('111601', '1116', 'Manyak Payed');
INSERT INTO `ref_kecamatan` VALUES ('111602', '1116', 'Bendahara');
INSERT INTO `ref_kecamatan` VALUES ('111603', '1116', 'Karang Baru');
INSERT INTO `ref_kecamatan` VALUES ('111604', '1116', 'Seruway');
INSERT INTO `ref_kecamatan` VALUES ('111605', '1116', 'Kota Kualasinpang');
INSERT INTO `ref_kecamatan` VALUES ('111606', '1116', 'Kejuruan Muda');
INSERT INTO `ref_kecamatan` VALUES ('111607', '1116', 'Tamiang Hulu');
INSERT INTO `ref_kecamatan` VALUES ('111608', '1116', 'Rantau');
INSERT INTO `ref_kecamatan` VALUES ('111609', '1116', 'Banda Mulia');
INSERT INTO `ref_kecamatan` VALUES ('111610', '1116', 'Bandar Pusaka');
INSERT INTO `ref_kecamatan` VALUES ('111611', '1116', 'Tenggulun');
INSERT INTO `ref_kecamatan` VALUES ('111612', '1116', 'Sekerak');
INSERT INTO `ref_kecamatan` VALUES ('111701', '1117', 'Pintu Rime Gayo');
INSERT INTO `ref_kecamatan` VALUES ('111702', '1117', 'Permata');
INSERT INTO `ref_kecamatan` VALUES ('111703', '1117', 'Syiah Utama');
INSERT INTO `ref_kecamatan` VALUES ('111704', '1117', 'Bandar');
INSERT INTO `ref_kecamatan` VALUES ('111705', '1117', 'Bukit');
INSERT INTO `ref_kecamatan` VALUES ('111706', '1117', 'Wih Pesam');
INSERT INTO `ref_kecamatan` VALUES ('111707', '1117', 'Timang gajah');
INSERT INTO `ref_kecamatan` VALUES ('111708', '1117', 'Bener Kelipah');
INSERT INTO `ref_kecamatan` VALUES ('111709', '1117', 'Mesidah');
INSERT INTO `ref_kecamatan` VALUES ('111710', '1117', 'Gajah Putih');
INSERT INTO `ref_kecamatan` VALUES ('111801', '1118', 'Meureudu');
INSERT INTO `ref_kecamatan` VALUES ('111802', '1118', 'Ulim');
INSERT INTO `ref_kecamatan` VALUES ('111803', '1118', 'Jangka Buaya');
INSERT INTO `ref_kecamatan` VALUES ('111804', '1118', 'Bandar Dua');
INSERT INTO `ref_kecamatan` VALUES ('111805', '1118', 'Meurah Dua');
INSERT INTO `ref_kecamatan` VALUES ('111806', '1118', 'Bandar Baru');
INSERT INTO `ref_kecamatan` VALUES ('111807', '1118', 'Panteraja');
INSERT INTO `ref_kecamatan` VALUES ('111808', '1118', 'Trienggadeng');
INSERT INTO `ref_kecamatan` VALUES ('117101', '1171', 'Baiturrahman');
INSERT INTO `ref_kecamatan` VALUES ('117102', '1171', 'Kuta Alam');
INSERT INTO `ref_kecamatan` VALUES ('117103', '1171', 'Meuraxa');
INSERT INTO `ref_kecamatan` VALUES ('117104', '1171', 'Syiah Kuala');
INSERT INTO `ref_kecamatan` VALUES ('117105', '1171', 'Lueng Bata');
INSERT INTO `ref_kecamatan` VALUES ('117106', '1171', 'Kuta Raja');
INSERT INTO `ref_kecamatan` VALUES ('117107', '1171', 'Banda Raya');
INSERT INTO `ref_kecamatan` VALUES ('117108', '1171', 'Jaya Baru');
INSERT INTO `ref_kecamatan` VALUES ('117109', '1171', 'Ulee Kareng');
INSERT INTO `ref_kecamatan` VALUES ('117201', '1172', 'Sukakarya');
INSERT INTO `ref_kecamatan` VALUES ('117202', '1172', 'Sukajaya');
INSERT INTO `ref_kecamatan` VALUES ('117301', '1173', 'Muara Dua');
INSERT INTO `ref_kecamatan` VALUES ('117302', '1173', 'Banda Sakti');
INSERT INTO `ref_kecamatan` VALUES ('117303', '1173', 'Blang Mangat');
INSERT INTO `ref_kecamatan` VALUES ('117304', '1173', 'Muara Satu');
INSERT INTO `ref_kecamatan` VALUES ('117401', '1174', 'Langsa Timur');
INSERT INTO `ref_kecamatan` VALUES ('117402', '1174', 'Langsa Barat');
INSERT INTO `ref_kecamatan` VALUES ('117403', '1174', 'Langsa Kota');
INSERT INTO `ref_kecamatan` VALUES ('117404', '1174', 'Langsa Lama');
INSERT INTO `ref_kecamatan` VALUES ('117405', '1174', 'Langsa Baro');
INSERT INTO `ref_kecamatan` VALUES ('117501', '1175', 'Simpang Kiri');
INSERT INTO `ref_kecamatan` VALUES ('117502', '1175', 'Penanggalan');
INSERT INTO `ref_kecamatan` VALUES ('117503', '1175', 'Rundeng');
INSERT INTO `ref_kecamatan` VALUES ('117504', '1175', 'Sultan Daulat');
INSERT INTO `ref_kecamatan` VALUES ('117505', '1175', 'Longkib');
INSERT INTO `ref_kecamatan` VALUES ('120101', '1201', 'Barus');
INSERT INTO `ref_kecamatan` VALUES ('120102', '1201', 'Sorkam');
INSERT INTO `ref_kecamatan` VALUES ('120103', '1201', 'Pandan');
INSERT INTO `ref_kecamatan` VALUES ('120104', '1201', 'Pinangsori');
INSERT INTO `ref_kecamatan` VALUES ('120105', '1201', 'Manduamas');
INSERT INTO `ref_kecamatan` VALUES ('120106', '1201', 'Kolang');
INSERT INTO `ref_kecamatan` VALUES ('120107', '1201', 'Tapian Nauli');
INSERT INTO `ref_kecamatan` VALUES ('120108', '1201', 'Sibabangun');
INSERT INTO `ref_kecamatan` VALUES ('120109', '1201', 'Sosor Gadong');
INSERT INTO `ref_kecamatan` VALUES ('120110', '1201', 'Sorkam Barat');
INSERT INTO `ref_kecamatan` VALUES ('120111', '1201', 'Sirandorung');
INSERT INTO `ref_kecamatan` VALUES ('120112', '1201', 'Andam Dewi');
INSERT INTO `ref_kecamatan` VALUES ('120113', '1201', 'Sitahuis');
INSERT INTO `ref_kecamatan` VALUES ('120114', '1201', 'Tukka');
INSERT INTO `ref_kecamatan` VALUES ('120115', '1201', 'Badiri');
INSERT INTO `ref_kecamatan` VALUES ('120116', '1201', 'Pasaribu Tobing');
INSERT INTO `ref_kecamatan` VALUES ('120117', '1201', 'Barus Utara');
INSERT INTO `ref_kecamatan` VALUES ('120118', '1201', 'Suka Bangun');
INSERT INTO `ref_kecamatan` VALUES ('120119', '1201', 'Lumut');
INSERT INTO `ref_kecamatan` VALUES ('120120', '1201', 'Sarudik');
INSERT INTO `ref_kecamatan` VALUES ('120201', '1202', 'Tarutung');
INSERT INTO `ref_kecamatan` VALUES ('120202', '1202', 'Siatas Barita');
INSERT INTO `ref_kecamatan` VALUES ('120203', '1202', 'Adian Koting');
INSERT INTO `ref_kecamatan` VALUES ('120204', '1202', 'Sipoholon');
INSERT INTO `ref_kecamatan` VALUES ('120205', '1202', 'Pahae Julu');
INSERT INTO `ref_kecamatan` VALUES ('120206', '1202', 'Pahae Jae');
INSERT INTO `ref_kecamatan` VALUES ('120207', '1202', 'Simangumban');
INSERT INTO `ref_kecamatan` VALUES ('120208', '1202', 'Purba Tua');
INSERT INTO `ref_kecamatan` VALUES ('120209', '1202', 'Siborong-Borong');
INSERT INTO `ref_kecamatan` VALUES ('120210', '1202', 'Pagaran');
INSERT INTO `ref_kecamatan` VALUES ('120211', '1202', 'Parmonangan');
INSERT INTO `ref_kecamatan` VALUES ('120212', '1202', 'Sipahutar');
INSERT INTO `ref_kecamatan` VALUES ('120213', '1202', 'Pangaribuan');
INSERT INTO `ref_kecamatan` VALUES ('120214', '1202', 'Garoga');
INSERT INTO `ref_kecamatan` VALUES ('120215', '1202', 'Muara');
INSERT INTO `ref_kecamatan` VALUES ('120301', '1203', 'Angkola Barat');
INSERT INTO `ref_kecamatan` VALUES ('120302', '1203', 'Batang Toru');
INSERT INTO `ref_kecamatan` VALUES ('120303', '1203', 'Angkola Timur');
INSERT INTO `ref_kecamatan` VALUES ('120304', '1203', 'Sipirok');
INSERT INTO `ref_kecamatan` VALUES ('120305', '1203', 'Saipar Dolok Hole');
INSERT INTO `ref_kecamatan` VALUES ('120306', '1203', 'Angkola Selatan');
INSERT INTO `ref_kecamatan` VALUES ('120307', '1203', 'Batang Angkola');
INSERT INTO `ref_kecamatan` VALUES ('120314', '1203', 'Arse');
INSERT INTO `ref_kecamatan` VALUES ('120320', '1203', 'Marancar');
INSERT INTO `ref_kecamatan` VALUES ('120321', '1203', 'Sayur Matinggi');
INSERT INTO `ref_kecamatan` VALUES ('120322', '1203', 'Aek Bilah');
INSERT INTO `ref_kecamatan` VALUES ('120329', '1203', 'Muara Batang Toru');
INSERT INTO `ref_kecamatan` VALUES ('120330', '1203', 'Tano Tombangan Angkola');
INSERT INTO `ref_kecamatan` VALUES ('120331', '1203', 'Angkola Sangkunur');
INSERT INTO `ref_kecamatan` VALUES ('120405', '1204', 'Hiliduho');
INSERT INTO `ref_kecamatan` VALUES ('120406', '1204', 'Gido');
INSERT INTO `ref_kecamatan` VALUES ('120410', '1204', 'Idanogawo');
INSERT INTO `ref_kecamatan` VALUES ('120411', '1204', 'Bawolato');
INSERT INTO `ref_kecamatan` VALUES ('120420', '1204', 'Hiliserangkai');
INSERT INTO `ref_kecamatan` VALUES ('120421', '1204', 'Botomuzoi');
INSERT INTO `ref_kecamatan` VALUES ('120427', '1204', 'Ulugawo');
INSERT INTO `ref_kecamatan` VALUES ('120428', '1204', 'Ma\'u');
INSERT INTO `ref_kecamatan` VALUES ('120429', '1204', 'Somolo-molo');
INSERT INTO `ref_kecamatan` VALUES ('120435', '1204', 'Sogae\'adu');
INSERT INTO `ref_kecamatan` VALUES ('120501', '1205', 'Bahorok');
INSERT INTO `ref_kecamatan` VALUES ('120502', '1205', 'Salapian');
INSERT INTO `ref_kecamatan` VALUES ('120503', '1205', 'Kuala');
INSERT INTO `ref_kecamatan` VALUES ('120504', '1205', 'Sei Bingei');
INSERT INTO `ref_kecamatan` VALUES ('120505', '1205', 'Binjai');
INSERT INTO `ref_kecamatan` VALUES ('120506', '1205', 'Selesai');
INSERT INTO `ref_kecamatan` VALUES ('120507', '1205', 'Stabat');
INSERT INTO `ref_kecamatan` VALUES ('120508', '1205', 'Wampu');
INSERT INTO `ref_kecamatan` VALUES ('120509', '1205', 'Secanggang');
INSERT INTO `ref_kecamatan` VALUES ('120510', '1205', 'Hinai');
INSERT INTO `ref_kecamatan` VALUES ('120511', '1205', 'Tanjung Pura');
INSERT INTO `ref_kecamatan` VALUES ('120512', '1205', 'Padang Tualang');
INSERT INTO `ref_kecamatan` VALUES ('120513', '1205', 'Gebang');
INSERT INTO `ref_kecamatan` VALUES ('120514', '1205', 'Babalan');
INSERT INTO `ref_kecamatan` VALUES ('120515', '1205', 'Pangkalan Susu');
INSERT INTO `ref_kecamatan` VALUES ('120516', '1205', 'Besitang');
INSERT INTO `ref_kecamatan` VALUES ('120517', '1205', 'Sei Lepan');
INSERT INTO `ref_kecamatan` VALUES ('120518', '1205', 'Brandan Barat');
INSERT INTO `ref_kecamatan` VALUES ('120519', '1205', 'Batang Serangan');
INSERT INTO `ref_kecamatan` VALUES ('120520', '1205', 'Sawit Seberang');
INSERT INTO `ref_kecamatan` VALUES ('120521', '1205', 'Sirapit');
INSERT INTO `ref_kecamatan` VALUES ('120522', '1205', 'Kutambaru');
INSERT INTO `ref_kecamatan` VALUES ('120523', '1205', 'Pematang Jaya');
INSERT INTO `ref_kecamatan` VALUES ('120601', '1206', 'Kabanjahe');
INSERT INTO `ref_kecamatan` VALUES ('120602', '1206', 'Berastagi');
INSERT INTO `ref_kecamatan` VALUES ('120603', '1206', 'Barusjahe');
INSERT INTO `ref_kecamatan` VALUES ('120604', '1206', 'Tigapanah');
INSERT INTO `ref_kecamatan` VALUES ('120605', '1206', 'Merek');
INSERT INTO `ref_kecamatan` VALUES ('120606', '1206', 'Munte');
INSERT INTO `ref_kecamatan` VALUES ('120607', '1206', 'Juhar');
INSERT INTO `ref_kecamatan` VALUES ('120608', '1206', 'Tigabinanga');
INSERT INTO `ref_kecamatan` VALUES ('120609', '1206', 'Laubaleng');
INSERT INTO `ref_kecamatan` VALUES ('120610', '1206', 'Mardingding');
INSERT INTO `ref_kecamatan` VALUES ('120611', '1206', 'Payung');
INSERT INTO `ref_kecamatan` VALUES ('120612', '1206', 'Simpang Empat');
INSERT INTO `ref_kecamatan` VALUES ('120613', '1206', 'Kutabuluh');
INSERT INTO `ref_kecamatan` VALUES ('120614', '1206', 'Dolat Rayat');
INSERT INTO `ref_kecamatan` VALUES ('120615', '1206', 'Merdeka');
INSERT INTO `ref_kecamatan` VALUES ('120616', '1206', 'Naman Teran');
INSERT INTO `ref_kecamatan` VALUES ('120617', '1206', 'Tiganderket');
INSERT INTO `ref_kecamatan` VALUES ('120701', '1207', 'Gunung Meriah');
INSERT INTO `ref_kecamatan` VALUES ('120702', '1207', 'Tanjung Morawa');
INSERT INTO `ref_kecamatan` VALUES ('120703', '1207', 'Sibolangit');
INSERT INTO `ref_kecamatan` VALUES ('120704', '1207', 'Kutalimbaru');
INSERT INTO `ref_kecamatan` VALUES ('120705', '1207', 'Pancur Batu');
INSERT INTO `ref_kecamatan` VALUES ('120706', '1207', 'Namorambe');
INSERT INTO `ref_kecamatan` VALUES ('120707', '1207', 'Sibiru-biru');
INSERT INTO `ref_kecamatan` VALUES ('120708', '1207', 'STM Hilir');
INSERT INTO `ref_kecamatan` VALUES ('120709', '1207', 'Bangun Purba');
INSERT INTO `ref_kecamatan` VALUES ('120719', '1207', 'Galang');
INSERT INTO `ref_kecamatan` VALUES ('120720', '1207', 'STM Hulu');
INSERT INTO `ref_kecamatan` VALUES ('120721', '1207', 'Patumbak');
INSERT INTO `ref_kecamatan` VALUES ('120722', '1207', 'Deli Tua');
INSERT INTO `ref_kecamatan` VALUES ('120723', '1207', 'Sunggal');
INSERT INTO `ref_kecamatan` VALUES ('120724', '1207', 'Hamparan Perak');
INSERT INTO `ref_kecamatan` VALUES ('120725', '1207', 'Labuhan Deli');
INSERT INTO `ref_kecamatan` VALUES ('120726', '1207', 'Percut Sei Tuan');
INSERT INTO `ref_kecamatan` VALUES ('120727', '1207', 'Batang Kuis');
INSERT INTO `ref_kecamatan` VALUES ('120728', '1207', 'Lubuk Pakam');
INSERT INTO `ref_kecamatan` VALUES ('120731', '1207', 'Pagar Merbau');
INSERT INTO `ref_kecamatan` VALUES ('120732', '1207', 'Pantai Labu');
INSERT INTO `ref_kecamatan` VALUES ('120733', '1207', 'Beringin');
INSERT INTO `ref_kecamatan` VALUES ('120801', '1208', 'Siantar');
INSERT INTO `ref_kecamatan` VALUES ('120802', '1208', 'Gunung Malela');
INSERT INTO `ref_kecamatan` VALUES ('120803', '1208', 'Gunung Maligas');
INSERT INTO `ref_kecamatan` VALUES ('120804', '1208', 'Panei');
INSERT INTO `ref_kecamatan` VALUES ('120805', '1208', 'Panombeian Pane');
INSERT INTO `ref_kecamatan` VALUES ('120806', '1208', 'Jorlang Hataran');
INSERT INTO `ref_kecamatan` VALUES ('120807', '1208', 'Raya Kahean');
INSERT INTO `ref_kecamatan` VALUES ('120808', '1208', 'Bosar Maligas');
INSERT INTO `ref_kecamatan` VALUES ('120809', '1208', 'Sidamanik');
INSERT INTO `ref_kecamatan` VALUES ('120810', '1208', 'Pematang Sidamanik');
INSERT INTO `ref_kecamatan` VALUES ('120811', '1208', 'Tanah Jawa');
INSERT INTO `ref_kecamatan` VALUES ('120812', '1208', 'Hatonduhan');
INSERT INTO `ref_kecamatan` VALUES ('120813', '1208', 'Dolok Panribuan');
INSERT INTO `ref_kecamatan` VALUES ('120814', '1208', 'Purba');
INSERT INTO `ref_kecamatan` VALUES ('120815', '1208', 'Haranggaol Horison');
INSERT INTO `ref_kecamatan` VALUES ('120816', '1208', 'Girsang Sipangan Bolon');
INSERT INTO `ref_kecamatan` VALUES ('120817', '1208', 'Dolok Batu Nanggar');
INSERT INTO `ref_kecamatan` VALUES ('120818', '1208', 'Huta Bayu Raja');
INSERT INTO `ref_kecamatan` VALUES ('120819', '1208', 'Jawa Maraja Bah Jambi');
INSERT INTO `ref_kecamatan` VALUES ('120820', '1208', 'Dolok Pardamean');
INSERT INTO `ref_kecamatan` VALUES ('120821', '1208', 'Pematang Bandar');
INSERT INTO `ref_kecamatan` VALUES ('120822', '1208', 'Bandar Huluan');
INSERT INTO `ref_kecamatan` VALUES ('120823', '1208', 'Bandar');
INSERT INTO `ref_kecamatan` VALUES ('120824', '1208', 'Bandar Masilam');
INSERT INTO `ref_kecamatan` VALUES ('120825', '1208', 'Silimakuta');
INSERT INTO `ref_kecamatan` VALUES ('120826', '1208', 'Dolok Silau');
INSERT INTO `ref_kecamatan` VALUES ('120827', '1208', 'Silou Kahean');
INSERT INTO `ref_kecamatan` VALUES ('120828', '1208', 'Tapian Dolok');
INSERT INTO `ref_kecamatan` VALUES ('120829', '1208', 'Raya');
INSERT INTO `ref_kecamatan` VALUES ('120830', '1208', 'Ujung Padang');
INSERT INTO `ref_kecamatan` VALUES ('120831', '1208', 'Pamatang Silima Huta');
INSERT INTO `ref_kecamatan` VALUES ('120908', '1209', 'Meranti');
INSERT INTO `ref_kecamatan` VALUES ('120909', '1209', 'Air Joman');
INSERT INTO `ref_kecamatan` VALUES ('120910', '1209', 'Tanjung Balai');
INSERT INTO `ref_kecamatan` VALUES ('120911', '1209', 'Sei Kepayang');
INSERT INTO `ref_kecamatan` VALUES ('120912', '1209', 'Simpang Empat');
INSERT INTO `ref_kecamatan` VALUES ('120913', '1209', 'Air Batu');
INSERT INTO `ref_kecamatan` VALUES ('120914', '1209', 'Pulau Rakyat');
INSERT INTO `ref_kecamatan` VALUES ('120915', '1209', 'Bandar Pulau');
INSERT INTO `ref_kecamatan` VALUES ('120916', '1209', 'Buntu Pane');
INSERT INTO `ref_kecamatan` VALUES ('120917', '1209', 'Bandar Pasir Mandoge');
INSERT INTO `ref_kecamatan` VALUES ('120918', '1209', 'Aek Kuasan');
INSERT INTO `ref_kecamatan` VALUES ('120919', '1209', 'Kota Kisaran Barat');
INSERT INTO `ref_kecamatan` VALUES ('120920', '1209', 'Kota Kisaran Timur');
INSERT INTO `ref_kecamatan` VALUES ('120921', '1209', 'Aek Songsongan');
INSERT INTO `ref_kecamatan` VALUES ('120922', '1209', 'Rahunig');
INSERT INTO `ref_kecamatan` VALUES ('120923', '1209', 'Sei Dadap');
INSERT INTO `ref_kecamatan` VALUES ('120924', '1209', 'Sei Kepayang Barat');
INSERT INTO `ref_kecamatan` VALUES ('120925', '1209', 'Sei Kepayang Timur');
INSERT INTO `ref_kecamatan` VALUES ('120926', '1209', 'Tinggi Raja');
INSERT INTO `ref_kecamatan` VALUES ('120927', '1209', 'Setia Janji');
INSERT INTO `ref_kecamatan` VALUES ('120928', '1209', 'Silau Laut');
INSERT INTO `ref_kecamatan` VALUES ('120929', '1209', 'Rawang Panca Arga');
INSERT INTO `ref_kecamatan` VALUES ('120930', '1209', 'Pulo Bandring');
INSERT INTO `ref_kecamatan` VALUES ('120931', '1209', 'Teluk Dalam');
INSERT INTO `ref_kecamatan` VALUES ('120932', '1209', 'Aek Ledong');
INSERT INTO `ref_kecamatan` VALUES ('121001', '1210', 'Rantau Utara');
INSERT INTO `ref_kecamatan` VALUES ('121002', '1210', 'Rantau Selatan');
INSERT INTO `ref_kecamatan` VALUES ('121007', '1210', 'Bilah Barat');
INSERT INTO `ref_kecamatan` VALUES ('121008', '1210', 'Bilah Hilir');
INSERT INTO `ref_kecamatan` VALUES ('121009', '1210', 'Bilah Hulu');
INSERT INTO `ref_kecamatan` VALUES ('121014', '1210', 'Pangkatan');
INSERT INTO `ref_kecamatan` VALUES ('121018', '1210', 'Panai Tengah');
INSERT INTO `ref_kecamatan` VALUES ('121019', '1210', 'Panai Hilir');
INSERT INTO `ref_kecamatan` VALUES ('121020', '1210', 'Panai Hulu');
INSERT INTO `ref_kecamatan` VALUES ('121101', '1211', 'Sidikalang');
INSERT INTO `ref_kecamatan` VALUES ('121102', '1211', 'Sumbul');
INSERT INTO `ref_kecamatan` VALUES ('121103', '1211', 'Tigalingga');
INSERT INTO `ref_kecamatan` VALUES ('121104', '1211', 'Siempat Nempu');
INSERT INTO `ref_kecamatan` VALUES ('121105', '1211', 'Silima Pungga Punga');
INSERT INTO `ref_kecamatan` VALUES ('121106', '1211', 'Tanah Pinem');
INSERT INTO `ref_kecamatan` VALUES ('121107', '1211', 'Siempat Nempu Hulu');
INSERT INTO `ref_kecamatan` VALUES ('121108', '1211', 'Siempat Nempu Hilir');
INSERT INTO `ref_kecamatan` VALUES ('121109', '1211', 'Pegagan Hilir');
INSERT INTO `ref_kecamatan` VALUES ('121110', '1211', 'Parbuluan');
INSERT INTO `ref_kecamatan` VALUES ('121111', '1211', 'Lae Parira');
INSERT INTO `ref_kecamatan` VALUES ('121112', '1211', 'Gunung Sitember');
INSERT INTO `ref_kecamatan` VALUES ('121113', '1211', 'Brampu');
INSERT INTO `ref_kecamatan` VALUES ('121114', '1211', 'Silahisabungan');
INSERT INTO `ref_kecamatan` VALUES ('121115', '1211', 'Sitinjo');
INSERT INTO `ref_kecamatan` VALUES ('121201', '1212', 'Balige');
INSERT INTO `ref_kecamatan` VALUES ('121202', '1212', 'Laguboti');
INSERT INTO `ref_kecamatan` VALUES ('121203', '1212', 'Silaen');
INSERT INTO `ref_kecamatan` VALUES ('121204', '1212', 'Habinsaran');
INSERT INTO `ref_kecamatan` VALUES ('121205', '1212', 'Pintu Pohan Meranti');
INSERT INTO `ref_kecamatan` VALUES ('121206', '1212', 'Borbor');
INSERT INTO `ref_kecamatan` VALUES ('121207', '1212', 'Porsea');
INSERT INTO `ref_kecamatan` VALUES ('121208', '1212', 'Ajibata');
INSERT INTO `ref_kecamatan` VALUES ('121209', '1212', 'Lumban Julu');
INSERT INTO `ref_kecamatan` VALUES ('121210', '1212', 'Uluan');
INSERT INTO `ref_kecamatan` VALUES ('121219', '1212', 'Sigumpar');
INSERT INTO `ref_kecamatan` VALUES ('121220', '1212', 'Siantar Narumonda');
INSERT INTO `ref_kecamatan` VALUES ('121221', '1212', 'Nassau');
INSERT INTO `ref_kecamatan` VALUES ('121222', '1212', 'Tampahan');
INSERT INTO `ref_kecamatan` VALUES ('121223', '1212', 'Bonatua Lunasi');
INSERT INTO `ref_kecamatan` VALUES ('121224', '1212', 'Parmaksian');
INSERT INTO `ref_kecamatan` VALUES ('121301', '1213', 'Panyabungan');
INSERT INTO `ref_kecamatan` VALUES ('121302', '1213', 'Panyabungan Utara');
INSERT INTO `ref_kecamatan` VALUES ('121303', '1213', 'Panyabungan Timur');
INSERT INTO `ref_kecamatan` VALUES ('121304', '1213', 'Panyabungan Selatan');
INSERT INTO `ref_kecamatan` VALUES ('121305', '1213', 'Panyabungan Barat');
INSERT INTO `ref_kecamatan` VALUES ('121306', '1213', 'Siabu');
INSERT INTO `ref_kecamatan` VALUES ('121307', '1213', 'Bukit Malintang');
INSERT INTO `ref_kecamatan` VALUES ('121308', '1213', 'Kotanopan');
INSERT INTO `ref_kecamatan` VALUES ('121309', '1213', 'Lembah Sorik Marapi');
INSERT INTO `ref_kecamatan` VALUES ('121310', '1213', 'Tambangan');
INSERT INTO `ref_kecamatan` VALUES ('121311', '1213', 'Ulu Pungkut');
INSERT INTO `ref_kecamatan` VALUES ('121312', '1213', 'Muara Sipongi');
INSERT INTO `ref_kecamatan` VALUES ('121313', '1213', 'Batang Natal');
INSERT INTO `ref_kecamatan` VALUES ('121314', '1213', 'Lingga Bayu');
INSERT INTO `ref_kecamatan` VALUES ('121315', '1213', 'Batahan');
INSERT INTO `ref_kecamatan` VALUES ('121316', '1213', 'Natal');
INSERT INTO `ref_kecamatan` VALUES ('121317', '1213', 'Muara Batang Gadis');
INSERT INTO `ref_kecamatan` VALUES ('121318', '1213', 'Ranto Baek');
INSERT INTO `ref_kecamatan` VALUES ('121319', '1213', 'Huta Bargot');
INSERT INTO `ref_kecamatan` VALUES ('121320', '1213', 'Puncak Sorik Marapi');
INSERT INTO `ref_kecamatan` VALUES ('121321', '1213', 'Pakantan');
INSERT INTO `ref_kecamatan` VALUES ('121322', '1213', 'Sinunukan');
INSERT INTO `ref_kecamatan` VALUES ('121323', '1213', 'Naga Juang');
INSERT INTO `ref_kecamatan` VALUES ('121401', '1214', 'Lolomatua');
INSERT INTO `ref_kecamatan` VALUES ('121402', '1214', 'Gomo');
INSERT INTO `ref_kecamatan` VALUES ('121403', '1214', 'Lahusa');
INSERT INTO `ref_kecamatan` VALUES ('121404', '1214', 'Hibala');
INSERT INTO `ref_kecamatan` VALUES ('121405', '1214', 'Pulau-Pulau Batu');
INSERT INTO `ref_kecamatan` VALUES ('121406', '1214', 'Teluk Dalam');
INSERT INTO `ref_kecamatan` VALUES ('121407', '1214', 'Amandraya');
INSERT INTO `ref_kecamatan` VALUES ('121408', '1214', 'Lalowa\'u');
INSERT INTO `ref_kecamatan` VALUES ('121409', '1214', 'Susua');
INSERT INTO `ref_kecamatan` VALUES ('121410', '1214', 'Maniamolo');
INSERT INTO `ref_kecamatan` VALUES ('121411', '1214', 'Hilimegai');
INSERT INTO `ref_kecamatan` VALUES ('121412', '1214', 'Toma');
INSERT INTO `ref_kecamatan` VALUES ('121413', '1214', 'Mazino');
INSERT INTO `ref_kecamatan` VALUES ('121414', '1214', 'Umbunasi');
INSERT INTO `ref_kecamatan` VALUES ('121415', '1214', 'Aramo');
INSERT INTO `ref_kecamatan` VALUES ('121416', '1214', 'Pulau-Pulau Batu Timur');
INSERT INTO `ref_kecamatan` VALUES ('121417', '1214', 'Mazo');
INSERT INTO `ref_kecamatan` VALUES ('121418', '1214', 'Fanayama');
INSERT INTO `ref_kecamatan` VALUES ('121419', '1214', 'Ulunoyo');
INSERT INTO `ref_kecamatan` VALUES ('121420', '1214', 'Huruna');
INSERT INTO `ref_kecamatan` VALUES ('121421', '1214', 'O\'o\'u');
INSERT INTO `ref_kecamatan` VALUES ('121422', '1214', 'Onohazumba');
INSERT INTO `ref_kecamatan` VALUES ('121423', '1214', 'Hilisalawa\'ahe');
INSERT INTO `ref_kecamatan` VALUES ('121424', '1214', 'Ulususua');
INSERT INTO `ref_kecamatan` VALUES ('121425', '1214', 'Sidua\'ori');
INSERT INTO `ref_kecamatan` VALUES ('121426', '1214', 'Somambawa');
INSERT INTO `ref_kecamatan` VALUES ('121427', '1214', 'Boronadu');
INSERT INTO `ref_kecamatan` VALUES ('121428', '1214', 'Simuk');
INSERT INTO `ref_kecamatan` VALUES ('121429', '1214', 'Pulau-Pulau Batu Barat');
INSERT INTO `ref_kecamatan` VALUES ('121430', '1214', 'Pulau-Pulau Batu Utara');
INSERT INTO `ref_kecamatan` VALUES ('121431', '1214', 'Tanah Masa');
INSERT INTO `ref_kecamatan` VALUES ('121501', '1215', 'Sitelu Tali Urang Jehe');
INSERT INTO `ref_kecamatan` VALUES ('121502', '1215', 'Kerajaan');
INSERT INTO `ref_kecamatan` VALUES ('121503', '1215', 'Salak');
INSERT INTO `ref_kecamatan` VALUES ('121504', '1215', 'Sitelu Tali Urang Julu');
INSERT INTO `ref_kecamatan` VALUES ('121505', '1215', 'Pergetteng Getteng Sengkut');
INSERT INTO `ref_kecamatan` VALUES ('121506', '1215', 'Pagindar');
INSERT INTO `ref_kecamatan` VALUES ('121507', '1215', 'Tinada');
INSERT INTO `ref_kecamatan` VALUES ('121508', '1215', 'Siempat Rube');
INSERT INTO `ref_kecamatan` VALUES ('121601', '1216', 'Parlilitan');
INSERT INTO `ref_kecamatan` VALUES ('121602', '1216', 'Pollung');
INSERT INTO `ref_kecamatan` VALUES ('121603', '1216', 'Baktiraja');
INSERT INTO `ref_kecamatan` VALUES ('121604', '1216', 'Paranginan');
INSERT INTO `ref_kecamatan` VALUES ('121605', '1216', 'Lintong Nihuta');
INSERT INTO `ref_kecamatan` VALUES ('121606', '1216', 'Dolok Sanggul');
INSERT INTO `ref_kecamatan` VALUES ('121607', '1216', 'Sijamapolang');
INSERT INTO `ref_kecamatan` VALUES ('121608', '1216', 'Onan Ganjang');
INSERT INTO `ref_kecamatan` VALUES ('121609', '1216', 'Pakkat');
INSERT INTO `ref_kecamatan` VALUES ('121610', '1216', 'Tarabintang');
INSERT INTO `ref_kecamatan` VALUES ('121701', '1217', 'Simanindo');
INSERT INTO `ref_kecamatan` VALUES ('121702', '1217', 'Onan Runggu');
INSERT INTO `ref_kecamatan` VALUES ('121703', '1217', 'Nainggolan');
INSERT INTO `ref_kecamatan` VALUES ('121704', '1217', 'Palipi');
INSERT INTO `ref_kecamatan` VALUES ('121705', '1217', 'Harian');
INSERT INTO `ref_kecamatan` VALUES ('121706', '1217', 'Sianjar Mula Mula');
INSERT INTO `ref_kecamatan` VALUES ('121707', '1217', 'Ronggur Nihuta');
INSERT INTO `ref_kecamatan` VALUES ('121708', '1217', 'Pangururan');
INSERT INTO `ref_kecamatan` VALUES ('121709', '1217', 'Sitio-tio');
INSERT INTO `ref_kecamatan` VALUES ('121801', '1218', 'Pantai Cermin');
INSERT INTO `ref_kecamatan` VALUES ('121802', '1218', 'Perbaungan');
INSERT INTO `ref_kecamatan` VALUES ('121803', '1218', 'Teluk Mengkudu');
INSERT INTO `ref_kecamatan` VALUES ('121804', '1218', 'Sei. Rampah');
INSERT INTO `ref_kecamatan` VALUES ('121805', '1218', 'Tanjung Beringin');
INSERT INTO `ref_kecamatan` VALUES ('121806', '1218', 'Bandar Khalifah');
INSERT INTO `ref_kecamatan` VALUES ('121807', '1218', 'Dolok Merawan');
INSERT INTO `ref_kecamatan` VALUES ('121808', '1218', 'Sipispis');
INSERT INTO `ref_kecamatan` VALUES ('121809', '1218', 'Dolok Masihul');
INSERT INTO `ref_kecamatan` VALUES ('121810', '1218', 'Kotarih');
INSERT INTO `ref_kecamatan` VALUES ('121811', '1218', 'Silinda');
INSERT INTO `ref_kecamatan` VALUES ('121812', '1218', 'Serba Jadi');
INSERT INTO `ref_kecamatan` VALUES ('121813', '1218', 'Tebing Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('121814', '1218', 'Pegajahan');
INSERT INTO `ref_kecamatan` VALUES ('121815', '1218', 'Sei Bamban');
INSERT INTO `ref_kecamatan` VALUES ('121816', '1218', 'Tebing Syahbandar');
INSERT INTO `ref_kecamatan` VALUES ('121817', '1218', 'Bintang Bayu');
INSERT INTO `ref_kecamatan` VALUES ('121901', '1219', 'Medang Deras');
INSERT INTO `ref_kecamatan` VALUES ('121902', '1219', 'Sei Suka');
INSERT INTO `ref_kecamatan` VALUES ('121903', '1219', 'Air Putih');
INSERT INTO `ref_kecamatan` VALUES ('121904', '1219', 'Lima Puluh');
INSERT INTO `ref_kecamatan` VALUES ('121905', '1219', 'Talawi');
INSERT INTO `ref_kecamatan` VALUES ('121906', '1219', 'Tanjung Tiram');
INSERT INTO `ref_kecamatan` VALUES ('121907', '1219', 'Sei Balai');
INSERT INTO `ref_kecamatan` VALUES ('122001', '1220', 'Dolok Sigompulon');
INSERT INTO `ref_kecamatan` VALUES ('122002', '1220', 'Dolok');
INSERT INTO `ref_kecamatan` VALUES ('122003', '1220', 'Halongonan');
INSERT INTO `ref_kecamatan` VALUES ('122004', '1220', 'Padang Bolak');
INSERT INTO `ref_kecamatan` VALUES ('122005', '1220', 'Padang Bolak Julu');
INSERT INTO `ref_kecamatan` VALUES ('122006', '1220', 'Portibi');
INSERT INTO `ref_kecamatan` VALUES ('122007', '1220', 'Batang Onang');
INSERT INTO `ref_kecamatan` VALUES ('122008', '1220', 'Simangambat');
INSERT INTO `ref_kecamatan` VALUES ('122009', '1220', 'Hulu Sihapas');
INSERT INTO `ref_kecamatan` VALUES ('122101', '1221', 'Sosopan');
INSERT INTO `ref_kecamatan` VALUES ('122102', '1221', 'Barumun Tengah');
INSERT INTO `ref_kecamatan` VALUES ('122103', '1221', 'Huristak');
INSERT INTO `ref_kecamatan` VALUES ('122104', '1221', 'Lubuk Barumun');
INSERT INTO `ref_kecamatan` VALUES ('122105', '1221', 'Huta Raja Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('122106', '1221', 'Ulu Barumun');
INSERT INTO `ref_kecamatan` VALUES ('122107', '1221', 'Barumun');
INSERT INTO `ref_kecamatan` VALUES ('122108', '1221', 'Sosa');
INSERT INTO `ref_kecamatan` VALUES ('122109', '1221', 'Batang Lubu Sutam');
INSERT INTO `ref_kecamatan` VALUES ('122110', '1221', 'Barumun Selatan');
INSERT INTO `ref_kecamatan` VALUES ('122111', '1221', 'Aek Nabara Barumun');
INSERT INTO `ref_kecamatan` VALUES ('122112', '1221', 'Sihapas Barumun');
INSERT INTO `ref_kecamatan` VALUES ('122201', '1222', 'Kotapinang');
INSERT INTO `ref_kecamatan` VALUES ('122202', '1222', 'Kampung Rakyat');
INSERT INTO `ref_kecamatan` VALUES ('122203', '1222', 'Torgamba');
INSERT INTO `ref_kecamatan` VALUES ('122204', '1222', 'Sungai Kanan');
INSERT INTO `ref_kecamatan` VALUES ('122205', '1222', 'Silangkitang');
INSERT INTO `ref_kecamatan` VALUES ('122301', '1223', 'Kualuh Hulu');
INSERT INTO `ref_kecamatan` VALUES ('122302', '1223', 'Kualuh Leidong');
INSERT INTO `ref_kecamatan` VALUES ('122303', '1223', 'Kualuh Hilir');
INSERT INTO `ref_kecamatan` VALUES ('122304', '1223', 'Aek Kuo');
INSERT INTO `ref_kecamatan` VALUES ('122305', '1223', 'Marbau');
INSERT INTO `ref_kecamatan` VALUES ('122306', '1223', 'Na IX - X');
INSERT INTO `ref_kecamatan` VALUES ('122307', '1223', 'Aek Natas');
INSERT INTO `ref_kecamatan` VALUES ('122308', '1223', 'Kualuh Selatan');
INSERT INTO `ref_kecamatan` VALUES ('122401', '1224', 'Lotu');
INSERT INTO `ref_kecamatan` VALUES ('122402', '1224', 'Sawo');
INSERT INTO `ref_kecamatan` VALUES ('122403', '1224', 'Tuhemberua');
INSERT INTO `ref_kecamatan` VALUES ('122404', '1224', 'Sitolu Ori');
INSERT INTO `ref_kecamatan` VALUES ('122405', '1224', 'Namohalu Esiwa');
INSERT INTO `ref_kecamatan` VALUES ('122406', '1224', 'Alasa Talumuzoi');
INSERT INTO `ref_kecamatan` VALUES ('122407', '1224', 'Alasa');
INSERT INTO `ref_kecamatan` VALUES ('122408', '1224', 'Tugala Oyo');
INSERT INTO `ref_kecamatan` VALUES ('122409', '1224', 'Afulu');
INSERT INTO `ref_kecamatan` VALUES ('122410', '1224', 'Lahewa');
INSERT INTO `ref_kecamatan` VALUES ('122411', '1224', 'Lahewa Timur');
INSERT INTO `ref_kecamatan` VALUES ('122501', '1225', 'Lahomi');
INSERT INTO `ref_kecamatan` VALUES ('122502', '1225', 'Sirombu');
INSERT INTO `ref_kecamatan` VALUES ('122503', '1225', 'Mandrehe Barat');
INSERT INTO `ref_kecamatan` VALUES ('122504', '1225', 'Moro\'o');
INSERT INTO `ref_kecamatan` VALUES ('122505', '1225', 'Mandrehe');
INSERT INTO `ref_kecamatan` VALUES ('122506', '1225', 'Mandrehe Utara');
INSERT INTO `ref_kecamatan` VALUES ('122507', '1225', 'Lolofitu Moi');
INSERT INTO `ref_kecamatan` VALUES ('122508', '1225', 'Ulu Moro\'o');
INSERT INTO `ref_kecamatan` VALUES ('127101', '1271', 'Medan Kota');
INSERT INTO `ref_kecamatan` VALUES ('127102', '1271', 'Medan Sunggal');
INSERT INTO `ref_kecamatan` VALUES ('127103', '1271', 'Medan Helvetia');
INSERT INTO `ref_kecamatan` VALUES ('127104', '1271', 'Medan Denai');
INSERT INTO `ref_kecamatan` VALUES ('127105', '1271', 'Medan Barat');
INSERT INTO `ref_kecamatan` VALUES ('127106', '1271', 'Medan Deli');
INSERT INTO `ref_kecamatan` VALUES ('127107', '1271', 'Medan Tuntungan');
INSERT INTO `ref_kecamatan` VALUES ('127108', '1271', 'Medan Belawan');
INSERT INTO `ref_kecamatan` VALUES ('127109', '1271', 'Medan Amplas');
INSERT INTO `ref_kecamatan` VALUES ('127110', '1271', 'Medan Area');
INSERT INTO `ref_kecamatan` VALUES ('127111', '1271', 'Medan Johor');
INSERT INTO `ref_kecamatan` VALUES ('127112', '1271', 'Medan Marelan');
INSERT INTO `ref_kecamatan` VALUES ('127113', '1271', 'Medan Labuhan');
INSERT INTO `ref_kecamatan` VALUES ('127114', '1271', 'Medan Tembung');
INSERT INTO `ref_kecamatan` VALUES ('127115', '1271', 'Medan Maimun');
INSERT INTO `ref_kecamatan` VALUES ('127116', '1271', 'Medan Polonia');
INSERT INTO `ref_kecamatan` VALUES ('127117', '1271', 'Medan Baru');
INSERT INTO `ref_kecamatan` VALUES ('127118', '1271', 'Medan Perjuangan');
INSERT INTO `ref_kecamatan` VALUES ('127119', '1271', 'Medan Petisah');
INSERT INTO `ref_kecamatan` VALUES ('127120', '1271', 'Medan Timur');
INSERT INTO `ref_kecamatan` VALUES ('127121', '1271', 'Medan Selayang');
INSERT INTO `ref_kecamatan` VALUES ('127201', '1272', 'Siantar Timur');
INSERT INTO `ref_kecamatan` VALUES ('127202', '1272', 'Siantar Barat');
INSERT INTO `ref_kecamatan` VALUES ('127203', '1272', 'Siantar Utara');
INSERT INTO `ref_kecamatan` VALUES ('127204', '1272', 'Siantar Selatan');
INSERT INTO `ref_kecamatan` VALUES ('127205', '1272', 'Siantar Marihat');
INSERT INTO `ref_kecamatan` VALUES ('127206', '1272', 'Siantar Martoba');
INSERT INTO `ref_kecamatan` VALUES ('127207', '1272', 'Siantar Sitalasari');
INSERT INTO `ref_kecamatan` VALUES ('127208', '1272', 'Siantar Marimbun');
INSERT INTO `ref_kecamatan` VALUES ('127301', '1273', 'Sibolga Utara');
INSERT INTO `ref_kecamatan` VALUES ('127302', '1273', 'Sibolga Kota');
INSERT INTO `ref_kecamatan` VALUES ('127303', '1273', 'Sibolga Selatan');
INSERT INTO `ref_kecamatan` VALUES ('127304', '1273', 'Sibolga Sambas');
INSERT INTO `ref_kecamatan` VALUES ('127401', '1274', 'Tanjung Balai Selatan');
INSERT INTO `ref_kecamatan` VALUES ('127402', '1274', 'Tanjung Balai Utara');
INSERT INTO `ref_kecamatan` VALUES ('127403', '1274', 'Sei Tualang Raso');
INSERT INTO `ref_kecamatan` VALUES ('127404', '1274', 'Teluk Nibung');
INSERT INTO `ref_kecamatan` VALUES ('127405', '1274', 'Datuk Bandar');
INSERT INTO `ref_kecamatan` VALUES ('127406', '1274', 'Datuk Bandar Timur');
INSERT INTO `ref_kecamatan` VALUES ('127501', '1275', 'Binjai Utara');
INSERT INTO `ref_kecamatan` VALUES ('127502', '1275', 'Binjai Kota');
INSERT INTO `ref_kecamatan` VALUES ('127503', '1275', 'Binjai Barat');
INSERT INTO `ref_kecamatan` VALUES ('127504', '1275', 'Binjai Timur');
INSERT INTO `ref_kecamatan` VALUES ('127505', '1275', 'Binjai Selatan');
INSERT INTO `ref_kecamatan` VALUES ('127601', '1276', 'Padang Hulu');
INSERT INTO `ref_kecamatan` VALUES ('127602', '1276', 'Rambutan');
INSERT INTO `ref_kecamatan` VALUES ('127603', '1276', 'Padang Hilir');
INSERT INTO `ref_kecamatan` VALUES ('127604', '1276', 'Bajenis');
INSERT INTO `ref_kecamatan` VALUES ('127605', '1276', 'Tebing Tinggi Kota');
INSERT INTO `ref_kecamatan` VALUES ('127701', '1277', 'Padangsidimpuan Utara');
INSERT INTO `ref_kecamatan` VALUES ('127702', '1277', 'Padangsidimpuan Selatan');
INSERT INTO `ref_kecamatan` VALUES ('127703', '1277', 'Padangsidimpuan Batunadua');
INSERT INTO `ref_kecamatan` VALUES ('127704', '1277', 'Padangsidimpuan Hutaimbaru');
INSERT INTO `ref_kecamatan` VALUES ('127705', '1277', 'Padangsidimpuan Tenggara');
INSERT INTO `ref_kecamatan` VALUES ('127706', '1277', 'Padangsidimpuan Angkola Julu');
INSERT INTO `ref_kecamatan` VALUES ('127801', '1278', 'Gunungsitoli');
INSERT INTO `ref_kecamatan` VALUES ('127802', '1278', 'Gunungsitoli Selatan');
INSERT INTO `ref_kecamatan` VALUES ('127803', '1278', 'Gunungsitoli Utara');
INSERT INTO `ref_kecamatan` VALUES ('127804', '1278', 'Gunungsitoli Idanoi');
INSERT INTO `ref_kecamatan` VALUES ('127805', '1278', 'Gunungsitoli Alo\'oa');
INSERT INTO `ref_kecamatan` VALUES ('127806', '1278', 'Gunungsitoli Barat');
INSERT INTO `ref_kecamatan` VALUES ('130101', '1301', 'Pancung Soal');
INSERT INTO `ref_kecamatan` VALUES ('130102', '1301', 'Ranah Pesisir');
INSERT INTO `ref_kecamatan` VALUES ('130103', '1301', 'Lengayang');
INSERT INTO `ref_kecamatan` VALUES ('130104', '1301', 'Batang Kapas');
INSERT INTO `ref_kecamatan` VALUES ('130105', '1301', 'IV Jurai');
INSERT INTO `ref_kecamatan` VALUES ('130106', '1301', 'Bayang');
INSERT INTO `ref_kecamatan` VALUES ('130107', '1301', 'Koto XI Tarusan');
INSERT INTO `ref_kecamatan` VALUES ('130108', '1301', 'Sutera');
INSERT INTO `ref_kecamatan` VALUES ('130109', '1301', 'Linggo Sari Baganti');
INSERT INTO `ref_kecamatan` VALUES ('130110', '1301', 'Lunang');
INSERT INTO `ref_kecamatan` VALUES ('130111', '1301', 'Basa Ampek Balai Tapan');
INSERT INTO `ref_kecamatan` VALUES ('130112', '1301', 'IV Nagari Bayang Utara');
INSERT INTO `ref_kecamatan` VALUES ('130113', '1301', 'Airpura');
INSERT INTO `ref_kecamatan` VALUES ('130114', '1301', 'Ranah Ampek Hulu Tapan');
INSERT INTO `ref_kecamatan` VALUES ('130115', '1301', 'Silaut');
INSERT INTO `ref_kecamatan` VALUES ('130203', '1302', 'Pantai Cermin');
INSERT INTO `ref_kecamatan` VALUES ('130204', '1302', 'Lembah Gumanti');
INSERT INTO `ref_kecamatan` VALUES ('130205', '1302', 'Payung Sekaki');
INSERT INTO `ref_kecamatan` VALUES ('130206', '1302', 'Lembang Jaya');
INSERT INTO `ref_kecamatan` VALUES ('130207', '1302', 'Gunung Talang');
INSERT INTO `ref_kecamatan` VALUES ('130208', '1302', 'Bukit Sundi');
INSERT INTO `ref_kecamatan` VALUES ('130209', '1302', 'IX Koto Sungai Lasi');
INSERT INTO `ref_kecamatan` VALUES ('130210', '1302', 'Kubung');
INSERT INTO `ref_kecamatan` VALUES ('130211', '1302', 'X Koto Singkarak');
INSERT INTO `ref_kecamatan` VALUES ('130212', '1302', 'X Koto Diatas');
INSERT INTO `ref_kecamatan` VALUES ('130213', '1302', 'Junjung Sirih');
INSERT INTO `ref_kecamatan` VALUES ('130217', '1302', 'Hiliran Gumanti');
INSERT INTO `ref_kecamatan` VALUES ('130218', '1302', 'Tigo Lurah');
INSERT INTO `ref_kecamatan` VALUES ('130219', '1302', 'Danau Kembar');
INSERT INTO `ref_kecamatan` VALUES ('130303', '1303', 'Tanjung Gadang');
INSERT INTO `ref_kecamatan` VALUES ('130304', '1303', 'Sijunjung');
INSERT INTO `ref_kecamatan` VALUES ('130305', '1303', 'IV Nagari');
INSERT INTO `ref_kecamatan` VALUES ('130306', '1303', 'Kamang Baru');
INSERT INTO `ref_kecamatan` VALUES ('130307', '1303', 'Lubuak Tarok');
INSERT INTO `ref_kecamatan` VALUES ('130308', '1303', 'Koto VII');
INSERT INTO `ref_kecamatan` VALUES ('130309', '1303', 'Sumpur Kudus');
INSERT INTO `ref_kecamatan` VALUES ('130310', '1303', 'Kupitan');
INSERT INTO `ref_kecamatan` VALUES ('130401', '1304', 'X Koto');
INSERT INTO `ref_kecamatan` VALUES ('130402', '1304', 'Batipuh');
INSERT INTO `ref_kecamatan` VALUES ('130403', '1304', 'Rambatan');
INSERT INTO `ref_kecamatan` VALUES ('130404', '1304', 'Lima Kaum');
INSERT INTO `ref_kecamatan` VALUES ('130405', '1304', 'Tanjung Emas');
INSERT INTO `ref_kecamatan` VALUES ('130406', '1304', 'Lintau Buo');
INSERT INTO `ref_kecamatan` VALUES ('130407', '1304', 'Sungayang');
INSERT INTO `ref_kecamatan` VALUES ('130408', '1304', 'Sungai Tarab');
INSERT INTO `ref_kecamatan` VALUES ('130409', '1304', 'Pariangan');
INSERT INTO `ref_kecamatan` VALUES ('130410', '1304', 'Salimpauang');
INSERT INTO `ref_kecamatan` VALUES ('130411', '1304', 'Padang Ganting');
INSERT INTO `ref_kecamatan` VALUES ('130412', '1304', 'Tanjuang Baru');
INSERT INTO `ref_kecamatan` VALUES ('130413', '1304', 'Lintau Buo Utara');
INSERT INTO `ref_kecamatan` VALUES ('130414', '1304', 'Batipuah Selatan');
INSERT INTO `ref_kecamatan` VALUES ('130501', '1305', 'Lubuk Alung');
INSERT INTO `ref_kecamatan` VALUES ('130502', '1305', 'Batang Anai');
INSERT INTO `ref_kecamatan` VALUES ('130503', '1305', 'Nan Sabaris');
INSERT INTO `ref_kecamatan` VALUES ('130504', '1305', 'x Enam Lingkuang');
INSERT INTO `ref_kecamatan` VALUES ('130505', '1305', 'VII Koto Sungai Sarik');
INSERT INTO `ref_kecamatan` VALUES ('130506', '1305', 'V Koto Kampung Dalam');
INSERT INTO `ref_kecamatan` VALUES ('130507', '1305', 'Sungai Garingging');
INSERT INTO `ref_kecamatan` VALUES ('130508', '1305', 'Sungai Limau');
INSERT INTO `ref_kecamatan` VALUES ('130509', '1305', 'IV Koto Aur Malintang');
INSERT INTO `ref_kecamatan` VALUES ('130510', '1305', 'Ulakan Tapakih');
INSERT INTO `ref_kecamatan` VALUES ('130511', '1305', 'Sintuak Toboh Gadang');
INSERT INTO `ref_kecamatan` VALUES ('130512', '1305', 'Padang Sago');
INSERT INTO `ref_kecamatan` VALUES ('130513', '1305', 'Batang Gasan');
INSERT INTO `ref_kecamatan` VALUES ('130514', '1305', 'V Koto Timur');
INSERT INTO `ref_kecamatan` VALUES ('130515', '1305', 'x Kayu Tanam');
INSERT INTO `ref_kecamatan` VALUES ('130516', '1305', 'Patamuan');
INSERT INTO `ref_kecamatan` VALUES ('130517', '1305', 'Enam Lingkung');
INSERT INTO `ref_kecamatan` VALUES ('130601', '1306', 'Tanjung Mutiara');
INSERT INTO `ref_kecamatan` VALUES ('130602', '1306', 'Lubuk Basung');
INSERT INTO `ref_kecamatan` VALUES ('130603', '1306', 'Tanjung Raya');
INSERT INTO `ref_kecamatan` VALUES ('130604', '1306', 'Matur');
INSERT INTO `ref_kecamatan` VALUES ('130605', '1306', 'IV Koto');
INSERT INTO `ref_kecamatan` VALUES ('130606', '1306', 'Banuhampu');
INSERT INTO `ref_kecamatan` VALUES ('130607', '1306', 'Ampek Angkek');
INSERT INTO `ref_kecamatan` VALUES ('130608', '1306', 'Baso');
INSERT INTO `ref_kecamatan` VALUES ('130609', '1306', 'Tilatang Kamang');
INSERT INTO `ref_kecamatan` VALUES ('130610', '1306', 'Palupuh');
INSERT INTO `ref_kecamatan` VALUES ('130611', '1306', 'Pelembayan');
INSERT INTO `ref_kecamatan` VALUES ('130612', '1306', 'Sungai Pua');
INSERT INTO `ref_kecamatan` VALUES ('130613', '1306', 'Ampek Nagari');
INSERT INTO `ref_kecamatan` VALUES ('130614', '1306', 'Candung');
INSERT INTO `ref_kecamatan` VALUES ('130615', '1306', 'Kamang Magek');
INSERT INTO `ref_kecamatan` VALUES ('130616', '1306', 'Malalak');
INSERT INTO `ref_kecamatan` VALUES ('130701', '1307', 'Suliki');
INSERT INTO `ref_kecamatan` VALUES ('130702', '1307', 'Guguak');
INSERT INTO `ref_kecamatan` VALUES ('130703', '1307', 'Payakumbuh');
INSERT INTO `ref_kecamatan` VALUES ('130704', '1307', 'Luak');
INSERT INTO `ref_kecamatan` VALUES ('130705', '1307', 'Harau');
INSERT INTO `ref_kecamatan` VALUES ('130706', '1307', 'Pangkalan Koto Baru');
INSERT INTO `ref_kecamatan` VALUES ('130707', '1307', 'Kapur IX');
INSERT INTO `ref_kecamatan` VALUES ('130708', '1307', 'Gunuang Omeh');
INSERT INTO `ref_kecamatan` VALUES ('130709', '1307', 'Lareh Sago Halaban');
INSERT INTO `ref_kecamatan` VALUES ('130710', '1307', 'Situjuah Limo Nagari');
INSERT INTO `ref_kecamatan` VALUES ('130711', '1307', 'Mungka');
INSERT INTO `ref_kecamatan` VALUES ('130712', '1307', 'Bukik Barisan');
INSERT INTO `ref_kecamatan` VALUES ('130713', '1307', 'Akabiluru');
INSERT INTO `ref_kecamatan` VALUES ('130804', '1308', 'Bonjol');
INSERT INTO `ref_kecamatan` VALUES ('130805', '1308', 'Lubuk Sikaping');
INSERT INTO `ref_kecamatan` VALUES ('130807', '1308', 'Panti');
INSERT INTO `ref_kecamatan` VALUES ('130808', '1308', 'Mapat Tunggul');
INSERT INTO `ref_kecamatan` VALUES ('130812', '1308', 'Duo Koto');
INSERT INTO `ref_kecamatan` VALUES ('130813', '1308', 'Tigo Nagari');
INSERT INTO `ref_kecamatan` VALUES ('130814', '1308', 'Rao');
INSERT INTO `ref_kecamatan` VALUES ('130815', '1308', 'Mapat Tunggul Selatan');
INSERT INTO `ref_kecamatan` VALUES ('130816', '1308', 'Simpang Alahan Mati');
INSERT INTO `ref_kecamatan` VALUES ('130817', '1308', 'Padang Gelugur');
INSERT INTO `ref_kecamatan` VALUES ('130818', '1308', 'Rao Utara');
INSERT INTO `ref_kecamatan` VALUES ('130819', '1308', 'Rao Selatan');
INSERT INTO `ref_kecamatan` VALUES ('130901', '1309', 'Pagai Utara');
INSERT INTO `ref_kecamatan` VALUES ('130902', '1309', 'Sipora Selatan');
INSERT INTO `ref_kecamatan` VALUES ('130903', '1309', 'Siberut Selatan');
INSERT INTO `ref_kecamatan` VALUES ('130904', '1309', 'Siberut Utara');
INSERT INTO `ref_kecamatan` VALUES ('130905', '1309', 'Siberut Barat');
INSERT INTO `ref_kecamatan` VALUES ('130906', '1309', 'Siberut Barat Daya');
INSERT INTO `ref_kecamatan` VALUES ('130907', '1309', 'Siberut Tengah');
INSERT INTO `ref_kecamatan` VALUES ('130908', '1309', 'Sipora Utara');
INSERT INTO `ref_kecamatan` VALUES ('130909', '1309', 'Sikakap');
INSERT INTO `ref_kecamatan` VALUES ('130910', '1309', 'Pagai Selatan');
INSERT INTO `ref_kecamatan` VALUES ('131001', '1310', 'Koto Baru');
INSERT INTO `ref_kecamatan` VALUES ('131002', '1310', 'Pulau Punjung');
INSERT INTO `ref_kecamatan` VALUES ('131003', '1310', 'Sungai Rumbai');
INSERT INTO `ref_kecamatan` VALUES ('131004', '1310', 'Sitiung');
INSERT INTO `ref_kecamatan` VALUES ('131005', '1310', 'Sembilan Koto');
INSERT INTO `ref_kecamatan` VALUES ('131006', '1310', 'Timpeh');
INSERT INTO `ref_kecamatan` VALUES ('131007', '1310', 'Koto Salak');
INSERT INTO `ref_kecamatan` VALUES ('131008', '1310', 'Tiumang');
INSERT INTO `ref_kecamatan` VALUES ('131009', '1310', 'Padang Laweh');
INSERT INTO `ref_kecamatan` VALUES ('131010', '1310', 'Asam Jujuhan');
INSERT INTO `ref_kecamatan` VALUES ('131011', '1310', 'Koto Besar');
INSERT INTO `ref_kecamatan` VALUES ('131101', '1311', 'Sangir');
INSERT INTO `ref_kecamatan` VALUES ('131102', '1311', 'Sungai Pagu');
INSERT INTO `ref_kecamatan` VALUES ('131103', '1311', 'Koto Parik Gadang Diateh');
INSERT INTO `ref_kecamatan` VALUES ('131104', '1311', 'Sangir Jujuan');
INSERT INTO `ref_kecamatan` VALUES ('131105', '1311', 'Sangir Batang Hari');
INSERT INTO `ref_kecamatan` VALUES ('131106', '1311', 'Pauh Duo');
INSERT INTO `ref_kecamatan` VALUES ('131107', '1311', 'Sangir Balai Janggo');
INSERT INTO `ref_kecamatan` VALUES ('131201', '1312', 'Sungaiberemas');
INSERT INTO `ref_kecamatan` VALUES ('131202', '1312', 'Lembah Melintang');
INSERT INTO `ref_kecamatan` VALUES ('131203', '1312', 'Pasaman');
INSERT INTO `ref_kecamatan` VALUES ('131204', '1312', 'Talamau');
INSERT INTO `ref_kecamatan` VALUES ('131205', '1312', 'Kinali');
INSERT INTO `ref_kecamatan` VALUES ('131206', '1312', 'Gunungtuleh');
INSERT INTO `ref_kecamatan` VALUES ('131207', '1312', 'Ranah Batahan');
INSERT INTO `ref_kecamatan` VALUES ('131208', '1312', 'Koto Balingka');
INSERT INTO `ref_kecamatan` VALUES ('131209', '1312', 'Sungaiaur');
INSERT INTO `ref_kecamatan` VALUES ('131210', '1312', 'Luhak Nan Duo');
INSERT INTO `ref_kecamatan` VALUES ('131211', '1312', 'Sasak Ranah Pesisir');
INSERT INTO `ref_kecamatan` VALUES ('137101', '1371', 'Padang Selatan');
INSERT INTO `ref_kecamatan` VALUES ('137102', '1371', 'Padang Timur');
INSERT INTO `ref_kecamatan` VALUES ('137103', '1371', 'Padang Barat');
INSERT INTO `ref_kecamatan` VALUES ('137104', '1371', 'Padang Utara');
INSERT INTO `ref_kecamatan` VALUES ('137105', '1371', 'Bungus Teluk Kabung');
INSERT INTO `ref_kecamatan` VALUES ('137106', '1371', 'Lubuk Begalung');
INSERT INTO `ref_kecamatan` VALUES ('137107', '1371', 'Lubuk Kilangan');
INSERT INTO `ref_kecamatan` VALUES ('137108', '1371', 'Pauh');
INSERT INTO `ref_kecamatan` VALUES ('137109', '1371', 'Kuranji');
INSERT INTO `ref_kecamatan` VALUES ('137110', '1371', 'Nanggalo');
INSERT INTO `ref_kecamatan` VALUES ('137111', '1371', 'Koto Tangah');
INSERT INTO `ref_kecamatan` VALUES ('137201', '1372', 'Lubuk Sikarah');
INSERT INTO `ref_kecamatan` VALUES ('137202', '1372', 'Tanjung Harapan');
INSERT INTO `ref_kecamatan` VALUES ('137301', '1373', 'Lembah Segar');
INSERT INTO `ref_kecamatan` VALUES ('137302', '1373', 'Barangin');
INSERT INTO `ref_kecamatan` VALUES ('137303', '1373', 'Silungkang');
INSERT INTO `ref_kecamatan` VALUES ('137304', '1373', 'Talawi');
INSERT INTO `ref_kecamatan` VALUES ('137401', '1374', 'Padang Panjang Timur');
INSERT INTO `ref_kecamatan` VALUES ('137402', '1374', 'Padang Panjang Barat');
INSERT INTO `ref_kecamatan` VALUES ('137501', '1375', 'Guguak Panjang');
INSERT INTO `ref_kecamatan` VALUES ('137502', '1375', 'Mandiangin K. Selayan');
INSERT INTO `ref_kecamatan` VALUES ('137503', '1375', 'Aur Birugo Tigo Baleh');
INSERT INTO `ref_kecamatan` VALUES ('137601', '1376', 'Payakumbuh Barat');
INSERT INTO `ref_kecamatan` VALUES ('137602', '1376', 'Payakumbuh Utara');
INSERT INTO `ref_kecamatan` VALUES ('137603', '1376', 'Payakumbuh Timur');
INSERT INTO `ref_kecamatan` VALUES ('137604', '1376', 'Lamposi Tigo Nagori');
INSERT INTO `ref_kecamatan` VALUES ('137605', '1376', 'Payakumbuh Selatan');
INSERT INTO `ref_kecamatan` VALUES ('137701', '1377', 'Pariaman Tengah');
INSERT INTO `ref_kecamatan` VALUES ('137702', '1377', 'Pariaman Utara');
INSERT INTO `ref_kecamatan` VALUES ('137703', '1377', 'Pariaman Selatan');
INSERT INTO `ref_kecamatan` VALUES ('137704', '1377', 'Pariaman Timur');
INSERT INTO `ref_kecamatan` VALUES ('140101', '1401', 'Bangkinang Kota');
INSERT INTO `ref_kecamatan` VALUES ('140102', '1401', 'Kampar');
INSERT INTO `ref_kecamatan` VALUES ('140103', '1401', 'Tambang');
INSERT INTO `ref_kecamatan` VALUES ('140104', '1401', 'XIII Koto Kampar');
INSERT INTO `ref_kecamatan` VALUES ('140105', '1401', 'Kuok');
INSERT INTO `ref_kecamatan` VALUES ('140106', '1401', 'Siak Hulu');
INSERT INTO `ref_kecamatan` VALUES ('140107', '1401', 'Kampar Kiri');
INSERT INTO `ref_kecamatan` VALUES ('140108', '1401', 'Kampar Kiri Hilir');
INSERT INTO `ref_kecamatan` VALUES ('140109', '1401', 'Kampar Kiri Hulu');
INSERT INTO `ref_kecamatan` VALUES ('140110', '1401', 'Tapung');
INSERT INTO `ref_kecamatan` VALUES ('140111', '1401', 'Tapung Hilir');
INSERT INTO `ref_kecamatan` VALUES ('140112', '1401', 'Tapung Hulu');
INSERT INTO `ref_kecamatan` VALUES ('140113', '1401', 'Salo');
INSERT INTO `ref_kecamatan` VALUES ('140114', '1401', 'Rumbio Jaya');
INSERT INTO `ref_kecamatan` VALUES ('140115', '1401', 'Bangkinang');
INSERT INTO `ref_kecamatan` VALUES ('140116', '1401', 'Perhentian Raja');
INSERT INTO `ref_kecamatan` VALUES ('140117', '1401', 'Kampar Timur');
INSERT INTO `ref_kecamatan` VALUES ('140118', '1401', 'Kampar Utara');
INSERT INTO `ref_kecamatan` VALUES ('140119', '1401', 'Kampar Kiri Tengah');
INSERT INTO `ref_kecamatan` VALUES ('140120', '1401', 'Gunung Sahilan');
INSERT INTO `ref_kecamatan` VALUES ('140121', '1401', 'Koto Kampar Hulu');
INSERT INTO `ref_kecamatan` VALUES ('140201', '1402', 'Rengat');
INSERT INTO `ref_kecamatan` VALUES ('140202', '1402', 'Rengat Barat');
INSERT INTO `ref_kecamatan` VALUES ('140203', '1402', 'Kelayang');
INSERT INTO `ref_kecamatan` VALUES ('140204', '1402', 'Pasir Penyu');
INSERT INTO `ref_kecamatan` VALUES ('140205', '1402', 'Peranap');
INSERT INTO `ref_kecamatan` VALUES ('140206', '1402', 'Siberida');
INSERT INTO `ref_kecamatan` VALUES ('140207', '1402', 'Batang Cenaku');
INSERT INTO `ref_kecamatan` VALUES ('140208', '1402', 'Batang Gangsal');
INSERT INTO `ref_kecamatan` VALUES ('140209', '1402', 'Lirik');
INSERT INTO `ref_kecamatan` VALUES ('140210', '1402', 'Kuala Cenaku');
INSERT INTO `ref_kecamatan` VALUES ('140211', '1402', 'Sungai Lala');
INSERT INTO `ref_kecamatan` VALUES ('140212', '1402', 'Lubuk Batu Jaya');
INSERT INTO `ref_kecamatan` VALUES ('140213', '1402', 'Rakit Kulim');
INSERT INTO `ref_kecamatan` VALUES ('140214', '1402', 'Batang Peranap');
INSERT INTO `ref_kecamatan` VALUES ('140301', '1403', 'Bengkalis');
INSERT INTO `ref_kecamatan` VALUES ('140302', '1403', 'Bantan');
INSERT INTO `ref_kecamatan` VALUES ('140303', '1403', 'Bukit Batu');
INSERT INTO `ref_kecamatan` VALUES ('140309', '1403', 'Mandau');
INSERT INTO `ref_kecamatan` VALUES ('140310', '1403', 'Rupat');
INSERT INTO `ref_kecamatan` VALUES ('140311', '1403', 'Rupat Utara');
INSERT INTO `ref_kecamatan` VALUES ('140312', '1403', 'Siak Kecil');
INSERT INTO `ref_kecamatan` VALUES ('140313', '1403', 'Pinggir');
INSERT INTO `ref_kecamatan` VALUES ('140401', '1404', 'Reteh');
INSERT INTO `ref_kecamatan` VALUES ('140402', '1404', 'Enok');
INSERT INTO `ref_kecamatan` VALUES ('140403', '1404', 'Kuala Indragiri');
INSERT INTO `ref_kecamatan` VALUES ('140404', '1404', 'Tembilahan');
INSERT INTO `ref_kecamatan` VALUES ('140405', '1404', 'Tempuling');
INSERT INTO `ref_kecamatan` VALUES ('140406', '1404', 'Gaung Anak Serka');
INSERT INTO `ref_kecamatan` VALUES ('140407', '1404', 'Mandah');
INSERT INTO `ref_kecamatan` VALUES ('140408', '1404', 'Kateman');
INSERT INTO `ref_kecamatan` VALUES ('140409', '1404', 'Keritang');
INSERT INTO `ref_kecamatan` VALUES ('140410', '1404', 'Tanah Merah');
INSERT INTO `ref_kecamatan` VALUES ('140411', '1404', 'Batang Tuaka');
INSERT INTO `ref_kecamatan` VALUES ('140412', '1404', 'Gaung');
INSERT INTO `ref_kecamatan` VALUES ('140413', '1404', 'Tembilahan Hulu');
INSERT INTO `ref_kecamatan` VALUES ('140414', '1404', 'Kemuning');
INSERT INTO `ref_kecamatan` VALUES ('140415', '1404', 'Pelangiran');
INSERT INTO `ref_kecamatan` VALUES ('140416', '1404', 'Teluk Belengkong');
INSERT INTO `ref_kecamatan` VALUES ('140417', '1404', 'Pulau Burung');
INSERT INTO `ref_kecamatan` VALUES ('140418', '1404', 'Concong');
INSERT INTO `ref_kecamatan` VALUES ('140419', '1404', 'Kempas');
INSERT INTO `ref_kecamatan` VALUES ('140420', '1404', 'Sungai Batang');
INSERT INTO `ref_kecamatan` VALUES ('140501', '1405', 'Ukui');
INSERT INTO `ref_kecamatan` VALUES ('140502', '1405', 'Pangkalan Kerinci');
INSERT INTO `ref_kecamatan` VALUES ('140503', '1405', 'Pangkalan Kuras');
INSERT INTO `ref_kecamatan` VALUES ('140504', '1405', 'Pangkalan Lesung');
INSERT INTO `ref_kecamatan` VALUES ('140505', '1405', 'Langgam');
INSERT INTO `ref_kecamatan` VALUES ('140506', '1405', 'Pelalawan');
INSERT INTO `ref_kecamatan` VALUES ('140507', '1405', 'Kerumutan');
INSERT INTO `ref_kecamatan` VALUES ('140508', '1405', 'Bunut');
INSERT INTO `ref_kecamatan` VALUES ('140509', '1405', 'Teluk Meranti');
INSERT INTO `ref_kecamatan` VALUES ('140510', '1405', 'Kuala Kampar');
INSERT INTO `ref_kecamatan` VALUES ('140511', '1405', 'Bandar Sei Kijang');
INSERT INTO `ref_kecamatan` VALUES ('140512', '1405', 'Bandar Petalangan');
INSERT INTO `ref_kecamatan` VALUES ('140601', '1406', 'Ujung Batu');
INSERT INTO `ref_kecamatan` VALUES ('140602', '1406', 'Rokan IV Koto');
INSERT INTO `ref_kecamatan` VALUES ('140603', '1406', 'Rambah');
INSERT INTO `ref_kecamatan` VALUES ('140604', '1406', 'Tambusai');
INSERT INTO `ref_kecamatan` VALUES ('140605', '1406', 'Kepenuhan');
INSERT INTO `ref_kecamatan` VALUES ('140606', '1406', 'Kunto Darussalam');
INSERT INTO `ref_kecamatan` VALUES ('140607', '1406', 'Rambah Samo');
INSERT INTO `ref_kecamatan` VALUES ('140608', '1406', 'Rambah Hilir');
INSERT INTO `ref_kecamatan` VALUES ('140609', '1406', 'Tambusai Utara');
INSERT INTO `ref_kecamatan` VALUES ('140610', '1406', 'Bangun Purba');
INSERT INTO `ref_kecamatan` VALUES ('140611', '1406', 'Tandun');
INSERT INTO `ref_kecamatan` VALUES ('140612', '1406', 'Kabun');
INSERT INTO `ref_kecamatan` VALUES ('140613', '1406', 'Bonai Darussalam');
INSERT INTO `ref_kecamatan` VALUES ('140614', '1406', 'Pagaran Tapah Darussalam');
INSERT INTO `ref_kecamatan` VALUES ('140615', '1406', 'Kepenuhan Hulu');
INSERT INTO `ref_kecamatan` VALUES ('140616', '1406', 'Pendalian IV Koto');
INSERT INTO `ref_kecamatan` VALUES ('140701', '1407', 'Kubu');
INSERT INTO `ref_kecamatan` VALUES ('140702', '1407', 'Bangko');
INSERT INTO `ref_kecamatan` VALUES ('140703', '1407', 'Tanah Putih');
INSERT INTO `ref_kecamatan` VALUES ('140704', '1407', 'Rimba Melintang');
INSERT INTO `ref_kecamatan` VALUES ('140705', '1407', 'Bagan Sinembah');
INSERT INTO `ref_kecamatan` VALUES ('140706', '1407', 'Pasir Limau Kapas');
INSERT INTO `ref_kecamatan` VALUES ('140707', '1407', 'Sinaboi');
INSERT INTO `ref_kecamatan` VALUES ('140708', '1407', 'Pujud');
INSERT INTO `ref_kecamatan` VALUES ('140709', '1407', 'Tanah Putih Tanjung Melawan');
INSERT INTO `ref_kecamatan` VALUES ('140710', '1407', 'Bangko Pusako');
INSERT INTO `ref_kecamatan` VALUES ('140711', '1407', 'Simpang Kanan');
INSERT INTO `ref_kecamatan` VALUES ('140712', '1407', 'Batu Hampar');
INSERT INTO `ref_kecamatan` VALUES ('140713', '1407', 'Rantau Kopar');
INSERT INTO `ref_kecamatan` VALUES ('140714', '1407', 'Pekaitan');
INSERT INTO `ref_kecamatan` VALUES ('140715', '1407', 'Kubu Babussalam');
INSERT INTO `ref_kecamatan` VALUES ('140801', '1408', 'Siak');
INSERT INTO `ref_kecamatan` VALUES ('140802', '1408', 'Sungai Apit');
INSERT INTO `ref_kecamatan` VALUES ('140803', '1408', 'Minas');
INSERT INTO `ref_kecamatan` VALUES ('140804', '1408', 'Tualang');
INSERT INTO `ref_kecamatan` VALUES ('140805', '1408', 'Sungai Mandau');
INSERT INTO `ref_kecamatan` VALUES ('140806', '1408', 'Dayun');
INSERT INTO `ref_kecamatan` VALUES ('140807', '1408', 'Kerinci Kanan');
INSERT INTO `ref_kecamatan` VALUES ('140808', '1408', 'Bunga Raya');
INSERT INTO `ref_kecamatan` VALUES ('140809', '1408', 'Koto Gasib');
INSERT INTO `ref_kecamatan` VALUES ('140810', '1408', 'Kandis');
INSERT INTO `ref_kecamatan` VALUES ('140811', '1408', 'Lubuk Dalam');
INSERT INTO `ref_kecamatan` VALUES ('140812', '1408', 'Sabak Auh');
INSERT INTO `ref_kecamatan` VALUES ('140813', '1408', 'Mempura');
INSERT INTO `ref_kecamatan` VALUES ('140814', '1408', 'Pusako');
INSERT INTO `ref_kecamatan` VALUES ('140901', '1409', 'Kuantan Mudik');
INSERT INTO `ref_kecamatan` VALUES ('140902', '1409', 'Kuantan Tengah');
INSERT INTO `ref_kecamatan` VALUES ('140903', '1409', 'Singingi');
INSERT INTO `ref_kecamatan` VALUES ('140904', '1409', 'Kuantan Hilir');
INSERT INTO `ref_kecamatan` VALUES ('140905', '1409', 'Cerenti');
INSERT INTO `ref_kecamatan` VALUES ('140906', '1409', 'Benai');
INSERT INTO `ref_kecamatan` VALUES ('140907', '1409', 'Gunungtoar');
INSERT INTO `ref_kecamatan` VALUES ('140908', '1409', 'Singingi Hilir');
INSERT INTO `ref_kecamatan` VALUES ('140909', '1409', 'Pangean');
INSERT INTO `ref_kecamatan` VALUES ('140910', '1409', 'Logas Tanah Darat');
INSERT INTO `ref_kecamatan` VALUES ('140911', '1409', 'Inuman');
INSERT INTO `ref_kecamatan` VALUES ('140912', '1409', 'Hulu Kuantan');
INSERT INTO `ref_kecamatan` VALUES ('140913', '1409', 'Kuantan Hilir Seberang');
INSERT INTO `ref_kecamatan` VALUES ('140914', '1409', 'Sentajo Raya');
INSERT INTO `ref_kecamatan` VALUES ('140915', '1409', 'Pucuk Rantau');
INSERT INTO `ref_kecamatan` VALUES ('141001', '1410', 'Tebing Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('141002', '1410', 'Rangsang Barat');
INSERT INTO `ref_kecamatan` VALUES ('141003', '1410', 'Rangsang');
INSERT INTO `ref_kecamatan` VALUES ('141004', '1410', 'Tebing Tinggi Barat');
INSERT INTO `ref_kecamatan` VALUES ('141005', '1410', 'Merbau');
INSERT INTO `ref_kecamatan` VALUES ('141006', '1410', 'Pulaumerbau');
INSERT INTO `ref_kecamatan` VALUES ('141007', '1410', 'Tebing Tinggi Timur');
INSERT INTO `ref_kecamatan` VALUES ('141008', '1410', 'Tasik Putri Puyu');
INSERT INTO `ref_kecamatan` VALUES ('141009', '1410', 'Rangsang Pesisir');
INSERT INTO `ref_kecamatan` VALUES ('147101', '1471', 'Sukajadi');
INSERT INTO `ref_kecamatan` VALUES ('147102', '1471', 'Pekanbaru Kota');
INSERT INTO `ref_kecamatan` VALUES ('147103', '1471', 'Sail');
INSERT INTO `ref_kecamatan` VALUES ('147104', '1471', 'Lima Puluh');
INSERT INTO `ref_kecamatan` VALUES ('147105', '1471', 'Senapelan');
INSERT INTO `ref_kecamatan` VALUES ('147106', '1471', 'Rumbai');
INSERT INTO `ref_kecamatan` VALUES ('147107', '1471', 'Bukit Raya');
INSERT INTO `ref_kecamatan` VALUES ('147108', '1471', 'Tampan');
INSERT INTO `ref_kecamatan` VALUES ('147109', '1471', 'Marpoyan Damai');
INSERT INTO `ref_kecamatan` VALUES ('147110', '1471', 'Tenayan Raya');
INSERT INTO `ref_kecamatan` VALUES ('147111', '1471', 'Payung Sekaki');
INSERT INTO `ref_kecamatan` VALUES ('147112', '1471', 'Rumbai Pesisir');
INSERT INTO `ref_kecamatan` VALUES ('147201', '1472', 'Dumai Barat');
INSERT INTO `ref_kecamatan` VALUES ('147202', '1472', 'Dumai Timur');
INSERT INTO `ref_kecamatan` VALUES ('147203', '1472', 'Bukit Kapur');
INSERT INTO `ref_kecamatan` VALUES ('147204', '1472', 'Sungai Sembilan');
INSERT INTO `ref_kecamatan` VALUES ('147205', '1472', 'Medang Kampai');
INSERT INTO `ref_kecamatan` VALUES ('147206', '1472', 'Dumai Kota');
INSERT INTO `ref_kecamatan` VALUES ('147207', '1472', 'Dumai Selatan');
INSERT INTO `ref_kecamatan` VALUES ('150101', '1501', 'Gunung Raya');
INSERT INTO `ref_kecamatan` VALUES ('150102', '1501', 'Danau Kerinci');
INSERT INTO `ref_kecamatan` VALUES ('150104', '1501', 'Sitinjau Laut');
INSERT INTO `ref_kecamatan` VALUES ('150105', '1501', 'Air Hangat');
INSERT INTO `ref_kecamatan` VALUES ('150106', '1501', 'Gunung Kerinci');
INSERT INTO `ref_kecamatan` VALUES ('150107', '1501', 'Batang Merangin');
INSERT INTO `ref_kecamatan` VALUES ('150108', '1501', 'Keliling Danau');
INSERT INTO `ref_kecamatan` VALUES ('150109', '1501', 'Kayu Aro');
INSERT INTO `ref_kecamatan` VALUES ('150111', '1501', 'Air Hangat Timur');
INSERT INTO `ref_kecamatan` VALUES ('150115', '1501', 'Gunung Tujuh');
INSERT INTO `ref_kecamatan` VALUES ('150116', '1501', 'Siulak');
INSERT INTO `ref_kecamatan` VALUES ('150117', '1501', 'Depati Tujuh');
INSERT INTO `ref_kecamatan` VALUES ('150118', '1501', 'Siulak Mukai');
INSERT INTO `ref_kecamatan` VALUES ('150119', '1501', 'Kayu Aro Barat');
INSERT INTO `ref_kecamatan` VALUES ('150120', '1501', 'Bukitkerman');
INSERT INTO `ref_kecamatan` VALUES ('150121', '1501', 'Air Hangat Barat');
INSERT INTO `ref_kecamatan` VALUES ('150201', '1502', 'Jangkat');
INSERT INTO `ref_kecamatan` VALUES ('150202', '1502', 'Bangko');
INSERT INTO `ref_kecamatan` VALUES ('150203', '1502', 'Muara Siau');
INSERT INTO `ref_kecamatan` VALUES ('150204', '1502', 'Sungai Manau');
INSERT INTO `ref_kecamatan` VALUES ('150205', '1502', 'Tabir');
INSERT INTO `ref_kecamatan` VALUES ('150206', '1502', 'Pamenang');
INSERT INTO `ref_kecamatan` VALUES ('150207', '1502', 'Tabir Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150208', '1502', 'Tabir Selatan');
INSERT INTO `ref_kecamatan` VALUES ('150209', '1502', 'Lembah Masurai');
INSERT INTO `ref_kecamatan` VALUES ('150210', '1502', 'Bangko Barat');
INSERT INTO `ref_kecamatan` VALUES ('150211', '1502', 'Nalo Tatan');
INSERT INTO `ref_kecamatan` VALUES ('150212', '1502', 'Batang Masumai');
INSERT INTO `ref_kecamatan` VALUES ('150213', '1502', 'Pamenang Barat');
INSERT INTO `ref_kecamatan` VALUES ('150214', '1502', 'Tabir Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150215', '1502', 'Tabir Timur');
INSERT INTO `ref_kecamatan` VALUES ('150216', '1502', 'Renah Pembarap');
INSERT INTO `ref_kecamatan` VALUES ('150217', '1502', 'Pangkalan Jambu');
INSERT INTO `ref_kecamatan` VALUES ('150218', '1502', 'Sungai Tenang');
INSERT INTO `ref_kecamatan` VALUES ('150219', '1502', 'Renah Pamenang');
INSERT INTO `ref_kecamatan` VALUES ('150220', '1502', 'Pamenang Selatan');
INSERT INTO `ref_kecamatan` VALUES ('150221', '1502', 'Margo Tabir');
INSERT INTO `ref_kecamatan` VALUES ('150222', '1502', 'Tabir Lintas');
INSERT INTO `ref_kecamatan` VALUES ('150223', '1502', 'Tabir Barat');
INSERT INTO `ref_kecamatan` VALUES ('150224', '1502', 'Tiang Pumpung');
INSERT INTO `ref_kecamatan` VALUES ('150301', '1503', 'Batang Asai');
INSERT INTO `ref_kecamatan` VALUES ('150302', '1503', 'Limun');
INSERT INTO `ref_kecamatan` VALUES ('150303', '1503', 'Sarolangun');
INSERT INTO `ref_kecamatan` VALUES ('150304', '1503', 'Pauh');
INSERT INTO `ref_kecamatan` VALUES ('150305', '1503', 'Pelawan');
INSERT INTO `ref_kecamatan` VALUES ('150306', '1503', 'Mandiangin');
INSERT INTO `ref_kecamatan` VALUES ('150307', '1503', 'Air Hitam');
INSERT INTO `ref_kecamatan` VALUES ('150308', '1503', 'Bathin VIII');
INSERT INTO `ref_kecamatan` VALUES ('150309', '1503', 'Singkut');
INSERT INTO `ref_kecamatan` VALUES ('150310', '1503', 'Cermin Nan Gedang');
INSERT INTO `ref_kecamatan` VALUES ('150401', '1504', 'Mersam');
INSERT INTO `ref_kecamatan` VALUES ('150402', '1504', 'Muara Tembesi');
INSERT INTO `ref_kecamatan` VALUES ('150403', '1504', 'Muara Bulian');
INSERT INTO `ref_kecamatan` VALUES ('150404', '1504', 'Batin XXIV');
INSERT INTO `ref_kecamatan` VALUES ('150405', '1504', 'Pemayung');
INSERT INTO `ref_kecamatan` VALUES ('150406', '1504', 'Maro Sebo Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150407', '1504', 'Bajubang');
INSERT INTO `ref_kecamatan` VALUES ('150408', '1504', 'Maro Sebo Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150501', '1505', 'Jambi Luar Kota');
INSERT INTO `ref_kecamatan` VALUES ('150502', '1505', 'Sekernan');
INSERT INTO `ref_kecamatan` VALUES ('150503', '1505', 'Kumpeh');
INSERT INTO `ref_kecamatan` VALUES ('150504', '1505', 'Maro Sebo');
INSERT INTO `ref_kecamatan` VALUES ('150505', '1505', 'Mestong');
INSERT INTO `ref_kecamatan` VALUES ('150506', '1505', 'Kumpeh Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150507', '1505', 'Sungai Bahar');
INSERT INTO `ref_kecamatan` VALUES ('150508', '1505', 'Sungai Gelam');
INSERT INTO `ref_kecamatan` VALUES ('150509', '1505', 'Bahar Utara');
INSERT INTO `ref_kecamatan` VALUES ('150510', '1505', 'Bahar Selatan');
INSERT INTO `ref_kecamatan` VALUES ('150511', '1505', 'Taman Rajo');
INSERT INTO `ref_kecamatan` VALUES ('150601', '1506', 'Tungkal Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150602', '1506', 'Tungkal Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150603', '1506', 'Pengabuan');
INSERT INTO `ref_kecamatan` VALUES ('150604', '1506', 'Betara');
INSERT INTO `ref_kecamatan` VALUES ('150605', '1506', 'Merlung');
INSERT INTO `ref_kecamatan` VALUES ('150606', '1506', 'Tebing Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('150607', '1506', 'Batang Asam');
INSERT INTO `ref_kecamatan` VALUES ('150608', '1506', 'Renah Mendaluh');
INSERT INTO `ref_kecamatan` VALUES ('150609', '1506', 'Muara Papalik');
INSERT INTO `ref_kecamatan` VALUES ('150610', '1506', 'Seberang Kota');
INSERT INTO `ref_kecamatan` VALUES ('150611', '1506', 'Bram Itam');
INSERT INTO `ref_kecamatan` VALUES ('150612', '1506', 'Kuala Betara');
INSERT INTO `ref_kecamatan` VALUES ('150613', '1506', 'Senyerang');
INSERT INTO `ref_kecamatan` VALUES ('150701', '1507', 'Muara Sabak Timur');
INSERT INTO `ref_kecamatan` VALUES ('150702', '1507', 'Nipah Panjang');
INSERT INTO `ref_kecamatan` VALUES ('150703', '1507', 'Mendahara');
INSERT INTO `ref_kecamatan` VALUES ('150704', '1507', 'Rantau Rasau');
INSERT INTO `ref_kecamatan` VALUES ('150705', '1507', 'S a d u');
INSERT INTO `ref_kecamatan` VALUES ('150706', '1507', 'Dendang');
INSERT INTO `ref_kecamatan` VALUES ('150707', '1507', 'Muara Sabak Barat');
INSERT INTO `ref_kecamatan` VALUES ('150708', '1507', 'Kuala Jambi');
INSERT INTO `ref_kecamatan` VALUES ('150709', '1507', 'Mendahara Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150710', '1507', 'Geragai');
INSERT INTO `ref_kecamatan` VALUES ('150711', '1507', 'Berbak');
INSERT INTO `ref_kecamatan` VALUES ('150801', '1508', 'Tanah Tumbuh');
INSERT INTO `ref_kecamatan` VALUES ('150802', '1508', 'Rantau Pandan');
INSERT INTO `ref_kecamatan` VALUES ('150803', '1508', 'Pasar Muaro Bungo');
INSERT INTO `ref_kecamatan` VALUES ('150804', '1508', 'Jujuhan');
INSERT INTO `ref_kecamatan` VALUES ('150805', '1508', 'Tanah Sepenggal');
INSERT INTO `ref_kecamatan` VALUES ('150806', '1508', 'Pelepat');
INSERT INTO `ref_kecamatan` VALUES ('150807', '1508', 'Limbur Lubuk Mengkuang');
INSERT INTO `ref_kecamatan` VALUES ('150808', '1508', 'Muko-muko Bathin VII');
INSERT INTO `ref_kecamatan` VALUES ('150809', '1508', 'Pelepat Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150810', '1508', 'Batin II Babeko');
INSERT INTO `ref_kecamatan` VALUES ('150811', '1508', 'Bathin III');
INSERT INTO `ref_kecamatan` VALUES ('150812', '1508', 'Bungo Dani');
INSERT INTO `ref_kecamatan` VALUES ('150813', '1508', 'Rimbo Tengah');
INSERT INTO `ref_kecamatan` VALUES ('150814', '1508', 'Bathin III Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150815', '1508', 'Bathin II Pelayang');
INSERT INTO `ref_kecamatan` VALUES ('150816', '1508', 'Jujuhan Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150817', '1508', 'Tanah Sepenggal Lintas');
INSERT INTO `ref_kecamatan` VALUES ('150901', '1509', 'Tebo Tengah');
INSERT INTO `ref_kecamatan` VALUES ('150902', '1509', 'Tebo Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150903', '1509', 'Tebo Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150904', '1509', 'Rimbo Bujang');
INSERT INTO `ref_kecamatan` VALUES ('150905', '1509', 'Sumay');
INSERT INTO `ref_kecamatan` VALUES ('150906', '1509', 'VII Koto');
INSERT INTO `ref_kecamatan` VALUES ('150907', '1509', 'Rimbo Ulu');
INSERT INTO `ref_kecamatan` VALUES ('150908', '1509', 'Rimbo Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150909', '1509', 'Tengah Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150910', '1509', 'Serai Serumpun');
INSERT INTO `ref_kecamatan` VALUES ('150911', '1509', 'VII Koto Ilir');
INSERT INTO `ref_kecamatan` VALUES ('150912', '1509', 'Muara Tabir');
INSERT INTO `ref_kecamatan` VALUES ('157101', '1571', 'Telanaipura');
INSERT INTO `ref_kecamatan` VALUES ('157102', '1571', 'Jambi Selatan');
INSERT INTO `ref_kecamatan` VALUES ('157103', '1571', 'Jambi Timur');
INSERT INTO `ref_kecamatan` VALUES ('157104', '1571', 'Pasar Jambi');
INSERT INTO `ref_kecamatan` VALUES ('157105', '1571', 'Pelayangan');
INSERT INTO `ref_kecamatan` VALUES ('157106', '1571', 'Danau Teluk');
INSERT INTO `ref_kecamatan` VALUES ('157107', '1571', 'Kota Baru');
INSERT INTO `ref_kecamatan` VALUES ('157108', '1571', 'Jelutung');
INSERT INTO `ref_kecamatan` VALUES ('157201', '1572', 'Sungai Penuh');
INSERT INTO `ref_kecamatan` VALUES ('157202', '1572', 'Pesisir Bukit');
INSERT INTO `ref_kecamatan` VALUES ('157203', '1572', 'Hamparan Rawang');
INSERT INTO `ref_kecamatan` VALUES ('157204', '1572', 'Tanah Kampung');
INSERT INTO `ref_kecamatan` VALUES ('157205', '1572', 'Kumun Debai');
INSERT INTO `ref_kecamatan` VALUES ('157206', '1572', 'Pondok Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('157207', '1572', 'Koto Baru');
INSERT INTO `ref_kecamatan` VALUES ('157208', '1572', 'Sungai Bungkal');
INSERT INTO `ref_kecamatan` VALUES ('160107', '1601', 'Sosoh Buay Rayap');
INSERT INTO `ref_kecamatan` VALUES ('160108', '1601', 'Pengandonan');
INSERT INTO `ref_kecamatan` VALUES ('160109', '1601', 'Peninjauan');
INSERT INTO `ref_kecamatan` VALUES ('160113', '1601', 'Baturaja Barat');
INSERT INTO `ref_kecamatan` VALUES ('160114', '1601', 'Baturaja Timur');
INSERT INTO `ref_kecamatan` VALUES ('160120', '1601', 'Ulu Ogan');
INSERT INTO `ref_kecamatan` VALUES ('160121', '1601', 'Semidang Aji');
INSERT INTO `ref_kecamatan` VALUES ('160122', '1601', 'Lubuk Batang');
INSERT INTO `ref_kecamatan` VALUES ('160128', '1601', 'Lengkiti');
INSERT INTO `ref_kecamatan` VALUES ('160129', '1601', 'Sinar Peninjauan');
INSERT INTO `ref_kecamatan` VALUES ('160130', '1601', 'Lubuk Raja');
INSERT INTO `ref_kecamatan` VALUES ('160131', '1601', 'Muara Jaya');
INSERT INTO `ref_kecamatan` VALUES ('160202', '1602', 'Tanjung Lubuk');
INSERT INTO `ref_kecamatan` VALUES ('160203', '1602', 'Pedamaran');
INSERT INTO `ref_kecamatan` VALUES ('160204', '1602', 'Mesuji');
INSERT INTO `ref_kecamatan` VALUES ('160205', '1602', 'Kayu Agung');
INSERT INTO `ref_kecamatan` VALUES ('160208', '1602', 'Sirah Pulau Padang');
INSERT INTO `ref_kecamatan` VALUES ('160211', '1602', 'Tulung Selapan');
INSERT INTO `ref_kecamatan` VALUES ('160212', '1602', 'Pampangan');
INSERT INTO `ref_kecamatan` VALUES ('160213', '1602', 'Lempuing');
INSERT INTO `ref_kecamatan` VALUES ('160214', '1602', 'Air Sugihan');
INSERT INTO `ref_kecamatan` VALUES ('160215', '1602', 'Sungai Menang');
INSERT INTO `ref_kecamatan` VALUES ('160217', '1602', 'Jejawi');
INSERT INTO `ref_kecamatan` VALUES ('160218', '1602', 'Cengal');
INSERT INTO `ref_kecamatan` VALUES ('160219', '1602', 'Pangkalan Lampam');
INSERT INTO `ref_kecamatan` VALUES ('160220', '1602', 'Mesuji Makmur');
INSERT INTO `ref_kecamatan` VALUES ('160221', '1602', 'Mesuji Raya');
INSERT INTO `ref_kecamatan` VALUES ('160222', '1602', 'Lempuing Jaya');
INSERT INTO `ref_kecamatan` VALUES ('160223', '1602', 'Teluk Gelam');
INSERT INTO `ref_kecamatan` VALUES ('160224', '1602', 'Pedamaran Timur');
INSERT INTO `ref_kecamatan` VALUES ('160301', '1603', 'Tanjung Agung');
INSERT INTO `ref_kecamatan` VALUES ('160302', '1603', 'Muara Enim');
INSERT INTO `ref_kecamatan` VALUES ('160303', '1603', 'Rambang Dangku');
INSERT INTO `ref_kecamatan` VALUES ('160304', '1603', 'Gunung Megang');
INSERT INTO `ref_kecamatan` VALUES ('160306', '1603', 'Gelumbang');
INSERT INTO `ref_kecamatan` VALUES ('160307', '1603', 'Lawang Kidul');
INSERT INTO `ref_kecamatan` VALUES ('160308', '1603', 'Semende Darat Laut');
INSERT INTO `ref_kecamatan` VALUES ('160309', '1603', 'Semende Darat Tengah');
INSERT INTO `ref_kecamatan` VALUES ('160310', '1603', 'Semende Darat Ulu');
INSERT INTO `ref_kecamatan` VALUES ('160311', '1603', 'Ujan Mas');
INSERT INTO `ref_kecamatan` VALUES ('160314', '1603', 'Lubai');
INSERT INTO `ref_kecamatan` VALUES ('160315', '1603', 'Rambang');
INSERT INTO `ref_kecamatan` VALUES ('160316', '1603', 'Sungai Rotan');
INSERT INTO `ref_kecamatan` VALUES ('160317', '1603', 'Lembak');
INSERT INTO `ref_kecamatan` VALUES ('160319', '1603', 'Benakat');
INSERT INTO `ref_kecamatan` VALUES ('160321', '1603', 'Kelekar');
INSERT INTO `ref_kecamatan` VALUES ('160322', '1603', 'Muara Belida');
INSERT INTO `ref_kecamatan` VALUES ('160323', '1603', 'Belimbing');
INSERT INTO `ref_kecamatan` VALUES ('160324', '1603', 'Belida Darat');
INSERT INTO `ref_kecamatan` VALUES ('160325', '1603', 'Lubai Ulu');
INSERT INTO `ref_kecamatan` VALUES ('160401', '1604', 'Tanjungsakti Pumu');
INSERT INTO `ref_kecamatan` VALUES ('160406', '1604', 'Jarai');
INSERT INTO `ref_kecamatan` VALUES ('160407', '1604', 'Kota Agung');
INSERT INTO `ref_kecamatan` VALUES ('160408', '1604', 'Pulaupinang');
INSERT INTO `ref_kecamatan` VALUES ('160409', '1604', 'Merapi Barat');
INSERT INTO `ref_kecamatan` VALUES ('160410', '1604', 'Lahat');
INSERT INTO `ref_kecamatan` VALUES ('160412', '1604', 'Pajar Bulan');
INSERT INTO `ref_kecamatan` VALUES ('160415', '1604', 'Mulak Ulu');
INSERT INTO `ref_kecamatan` VALUES ('160416', '1604', 'Kikim Selatan');
INSERT INTO `ref_kecamatan` VALUES ('160417', '1604', 'Kikim Timur');
INSERT INTO `ref_kecamatan` VALUES ('160418', '1604', 'Kikim Tengah');
INSERT INTO `ref_kecamatan` VALUES ('160419', '1604', 'Kikim Barat');
INSERT INTO `ref_kecamatan` VALUES ('160420', '1604', 'Pseksu');
INSERT INTO `ref_kecamatan` VALUES ('160421', '1604', 'Gumay Talang');
INSERT INTO `ref_kecamatan` VALUES ('160422', '1604', 'Pagar Gunung');
INSERT INTO `ref_kecamatan` VALUES ('160423', '1604', 'Merapi Timur');
INSERT INTO `ref_kecamatan` VALUES ('160424', '1604', 'Tanjung Sakti Pumi');
INSERT INTO `ref_kecamatan` VALUES ('160425', '1604', 'Gumay Ulu');
INSERT INTO `ref_kecamatan` VALUES ('160426', '1604', 'Merapi Selatan');
INSERT INTO `ref_kecamatan` VALUES ('160427', '1604', 'Tanjungtebat');
INSERT INTO `ref_kecamatan` VALUES ('160428', '1604', 'Muarapayang');
INSERT INTO `ref_kecamatan` VALUES ('160429', '1604', 'Sukamerindu');
INSERT INTO `ref_kecamatan` VALUES ('160501', '1605', 'Tugumulyo');
INSERT INTO `ref_kecamatan` VALUES ('160502', '1605', 'Muara Lakitan');
INSERT INTO `ref_kecamatan` VALUES ('160503', '1605', 'Muara Kelingi');
INSERT INTO `ref_kecamatan` VALUES ('160508', '1605', 'Jayaloka');
INSERT INTO `ref_kecamatan` VALUES ('160509', '1605', 'Muara Beliti');
INSERT INTO `ref_kecamatan` VALUES ('160510', '1605', 'STL Ulu Terawas');
INSERT INTO `ref_kecamatan` VALUES ('160511', '1605', 'Selangit');
INSERT INTO `ref_kecamatan` VALUES ('160512', '1605', 'Megang Sakti');
INSERT INTO `ref_kecamatan` VALUES ('160513', '1605', 'Purwodadi');
INSERT INTO `ref_kecamatan` VALUES ('160514', '1605', 'BTS. Ulu');
INSERT INTO `ref_kecamatan` VALUES ('160518', '1605', 'Tiang Pumpung Kepungut');
INSERT INTO `ref_kecamatan` VALUES ('160519', '1605', 'Sumber Harta');
INSERT INTO `ref_kecamatan` VALUES ('160520', '1605', 'Tuah Negeri');
INSERT INTO `ref_kecamatan` VALUES ('160521', '1605', 'Suka Karya');
INSERT INTO `ref_kecamatan` VALUES ('160601', '1606', 'Sekayu');
INSERT INTO `ref_kecamatan` VALUES ('160602', '1606', 'Lais');
INSERT INTO `ref_kecamatan` VALUES ('160603', '1606', 'Sungai Keruh');
INSERT INTO `ref_kecamatan` VALUES ('160604', '1606', 'Batang Hari Leko');
INSERT INTO `ref_kecamatan` VALUES ('160605', '1606', 'Sanga Desa');
INSERT INTO `ref_kecamatan` VALUES ('160606', '1606', 'Babat Toman');
INSERT INTO `ref_kecamatan` VALUES ('160607', '1606', 'Sungai Lilin');
INSERT INTO `ref_kecamatan` VALUES ('160608', '1606', 'Keluang');
INSERT INTO `ref_kecamatan` VALUES ('160609', '1606', 'Bayung Lencir');
INSERT INTO `ref_kecamatan` VALUES ('160610', '1606', 'Plakat Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('160611', '1606', 'Lalan');
INSERT INTO `ref_kecamatan` VALUES ('160612', '1606', 'Tungkal Jaya');
INSERT INTO `ref_kecamatan` VALUES ('160613', '1606', 'Lawang Wetan');
INSERT INTO `ref_kecamatan` VALUES ('160614', '1606', 'Babat Supat');
INSERT INTO `ref_kecamatan` VALUES ('160701', '1607', 'Banyuasin I');
INSERT INTO `ref_kecamatan` VALUES ('160702', '1607', 'Banyuasin II');
INSERT INTO `ref_kecamatan` VALUES ('160703', '1607', 'Banyuasin III');
INSERT INTO `ref_kecamatan` VALUES ('160704', '1607', 'Pulau Rimau');
INSERT INTO `ref_kecamatan` VALUES ('160705', '1607', 'Betung');
INSERT INTO `ref_kecamatan` VALUES ('160706', '1607', 'Rambutan');
INSERT INTO `ref_kecamatan` VALUES ('160707', '1607', 'Muara Padang');
INSERT INTO `ref_kecamatan` VALUES ('160708', '1607', 'Muara Telang');
INSERT INTO `ref_kecamatan` VALUES ('160709', '1607', 'Makarti Jaya');
INSERT INTO `ref_kecamatan` VALUES ('160710', '1607', 'Talang Kelapa');
INSERT INTO `ref_kecamatan` VALUES ('160711', '1607', 'Rantau Bayur');
INSERT INTO `ref_kecamatan` VALUES ('160712', '1607', 'Tanjung Lago');
INSERT INTO `ref_kecamatan` VALUES ('160713', '1607', 'Muara Sugihan');
INSERT INTO `ref_kecamatan` VALUES ('160714', '1607', 'Air Salek');
INSERT INTO `ref_kecamatan` VALUES ('160715', '1607', 'Tungkal Ilir');
INSERT INTO `ref_kecamatan` VALUES ('160716', '1607', 'Suak Tapeh');
INSERT INTO `ref_kecamatan` VALUES ('160717', '1607', 'Sembawa');
INSERT INTO `ref_kecamatan` VALUES ('160718', '1607', 'Sumber Marga Telang');
INSERT INTO `ref_kecamatan` VALUES ('160719', '1607', 'Air Kumbang');
INSERT INTO `ref_kecamatan` VALUES ('160801', '1608', 'Martapura');
INSERT INTO `ref_kecamatan` VALUES ('160802', '1608', 'Buay Madang');
INSERT INTO `ref_kecamatan` VALUES ('160803', '1608', 'Belitang');
INSERT INTO `ref_kecamatan` VALUES ('160804', '1608', 'Cempaka');
INSERT INTO `ref_kecamatan` VALUES ('160805', '1608', 'Buay Pemuka Peliung');
INSERT INTO `ref_kecamatan` VALUES ('160806', '1608', 'Madang Suku II');
INSERT INTO `ref_kecamatan` VALUES ('160807', '1608', 'Madang Suku I');
INSERT INTO `ref_kecamatan` VALUES ('160808', '1608', 'Semendawai Suku III');
INSERT INTO `ref_kecamatan` VALUES ('160809', '1608', 'Belitang II');
INSERT INTO `ref_kecamatan` VALUES ('160810', '1608', 'Belitang III');
INSERT INTO `ref_kecamatan` VALUES ('160811', '1608', 'Bunga Mayang');
INSERT INTO `ref_kecamatan` VALUES ('160812', '1608', 'Buay Madang Timur');
INSERT INTO `ref_kecamatan` VALUES ('160813', '1608', 'Madang Suku III');
INSERT INTO `ref_kecamatan` VALUES ('160814', '1608', 'Semendawai Barat');
INSERT INTO `ref_kecamatan` VALUES ('160815', '1608', 'Semendawai Timur');
INSERT INTO `ref_kecamatan` VALUES ('160816', '1608', 'Jayapura');
INSERT INTO `ref_kecamatan` VALUES ('160817', '1608', 'Belitang Jaya');
INSERT INTO `ref_kecamatan` VALUES ('160818', '1608', 'Belitang Madang Raya');
INSERT INTO `ref_kecamatan` VALUES ('160819', '1608', 'Belitang Mulya');
INSERT INTO `ref_kecamatan` VALUES ('160820', '1608', 'Buay Pemuka Bangsa Raja');
INSERT INTO `ref_kecamatan` VALUES ('160901', '1609', 'Muara Dua');
INSERT INTO `ref_kecamatan` VALUES ('160902', '1609', 'Pulau Beringin');
INSERT INTO `ref_kecamatan` VALUES ('160903', '1609', 'Banding Agung');
INSERT INTO `ref_kecamatan` VALUES ('160904', '1609', 'Muara Dua Kisam');
INSERT INTO `ref_kecamatan` VALUES ('160905', '1609', 'Simpang');
INSERT INTO `ref_kecamatan` VALUES ('160906', '1609', 'Buay Sandang Aji');
INSERT INTO `ref_kecamatan` VALUES ('160907', '1609', 'Buay Runjung');
INSERT INTO `ref_kecamatan` VALUES ('160908', '1609', 'Mekakau Ilir');
INSERT INTO `ref_kecamatan` VALUES ('160909', '1609', 'Buay Pemaca');
INSERT INTO `ref_kecamatan` VALUES ('160910', '1609', 'Kisam Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('160911', '1609', 'Kisam Ilir');
INSERT INTO `ref_kecamatan` VALUES ('160912', '1609', 'Buay Pematang Ribu Ranau Tengah');
INSERT INTO `ref_kecamatan` VALUES ('160913', '1609', 'Warkuk Ranau Selatan');
INSERT INTO `ref_kecamatan` VALUES ('160914', '1609', 'Runjung Agung');
INSERT INTO `ref_kecamatan` VALUES ('160915', '1609', 'Sungai Are');
INSERT INTO `ref_kecamatan` VALUES ('160916', '1609', 'Sindang Danau');
INSERT INTO `ref_kecamatan` VALUES ('160917', '1609', 'Buana Pemaca');
INSERT INTO `ref_kecamatan` VALUES ('160918', '1609', 'Tiga Dihaji');
INSERT INTO `ref_kecamatan` VALUES ('160919', '1609', 'Buay Rawan');
INSERT INTO `ref_kecamatan` VALUES ('161001', '1610', 'Muara Kuang');
INSERT INTO `ref_kecamatan` VALUES ('161002', '1610', 'Tanjung Batu');
INSERT INTO `ref_kecamatan` VALUES ('161003', '1610', 'Tanjung Raja');
INSERT INTO `ref_kecamatan` VALUES ('161004', '1610', 'Indralaya');
INSERT INTO `ref_kecamatan` VALUES ('161005', '1610', 'Pemulutan');
INSERT INTO `ref_kecamatan` VALUES ('161006', '1610', 'Rantau Alai');
INSERT INTO `ref_kecamatan` VALUES ('161007', '1610', 'Indralaya Utara');
INSERT INTO `ref_kecamatan` VALUES ('161008', '1610', 'Indralaya Selatan');
INSERT INTO `ref_kecamatan` VALUES ('161009', '1610', 'Pemulutan Selatan');
INSERT INTO `ref_kecamatan` VALUES ('161010', '1610', 'Pemulutan Barat');
INSERT INTO `ref_kecamatan` VALUES ('161011', '1610', 'Rantau Panjang');
INSERT INTO `ref_kecamatan` VALUES ('161012', '1610', 'Sungai Pinang');
INSERT INTO `ref_kecamatan` VALUES ('161013', '1610', 'Kandis');
INSERT INTO `ref_kecamatan` VALUES ('161014', '1610', 'Rambang Kuang');
INSERT INTO `ref_kecamatan` VALUES ('161015', '1610', 'Lubuk Keliat');
INSERT INTO `ref_kecamatan` VALUES ('161016', '1610', 'Payaraman');
INSERT INTO `ref_kecamatan` VALUES ('161101', '1611', 'Muara Pinang');
INSERT INTO `ref_kecamatan` VALUES ('161102', '1611', 'Pendopo');
INSERT INTO `ref_kecamatan` VALUES ('161103', '1611', 'Ulu Musi');
INSERT INTO `ref_kecamatan` VALUES ('161104', '1611', 'Tebing Tinggi');
INSERT INTO `ref_kecamatan` VALUES ('161105', '1611', 'Lintang Kanan');
INSERT INTO `ref_kecamatan` VALUES ('161106', '1611', 'Talang Padang');
INSERT INTO `ref_kecamatan` VALUES ('161107', '1611', 'Pasemah Air Keruh');
INSERT INTO `ref_kecamatan` VALUES ('161108', '1611', 'Sikap Dalam');
INSERT INTO `ref_kecamatan` VALUES ('161109', '1611', 'Saling');
INSERT INTO `ref_kecamatan` VALUES ('161110', '1611', 'Pendopo Barat');
INSERT INTO `ref_kecamatan` VALUES ('161201', '1612', 'Talang Ubi');
INSERT INTO `ref_kecamatan` VALUES ('161202', '1612', 'Penukal Utara');
INSERT INTO `ref_kecamatan` VALUES ('161203', '1612', 'Penukal');
INSERT INTO `ref_kecamatan` VALUES ('161204', '1612', 'Abab');
INSERT INTO `ref_kecamatan` VALUES ('161205', '1612', 'Tanah Abang');
INSERT INTO `ref_kecamatan` VALUES ('161301', '1613', 'Rupit');
INSERT INTO `ref_kecamatan` VALUES ('161302', '1613', 'Rawas Ulu');
INSERT INTO `ref_kecamatan` VALUES ('161303', '1613', 'Nibung');
INSERT INTO `ref_kecamatan` VALUES ('161304', '1613', 'Rawas Ilir');
INSERT INTO `ref_kecamatan` VALUES ('161305', '1613', 'Karang Dapo');
INSERT INTO `ref_kecamatan` VALUES ('161306', '1613', 'Karang Jaya');
INSERT INTO `ref_kecamatan` VALUES ('161307', '1613', 'Ulu Rawas');
INSERT INTO `ref_kecamatan` VALUES ('167101', '1671', 'Ilir Barat II');
INSERT INTO `ref_kecamatan` VALUES ('167102', '1671', 'Seberang Ulu I');
INSERT INTO `ref_kecamatan` VALUES ('167103', '1671', 'Seberang Ulu II');
INSERT INTO `ref_kecamatan` VALUES ('167104', '1671', 'Ilir Barat I');
INSERT INTO `ref_kecamatan` VALUES ('167105', '1671', 'Ilir Timur I');
INSERT INTO `ref_kecamatan` VALUES ('167106', '1671', 'Ilir Timur II');
INSERT INTO `ref_kecamatan` VALUES ('167107', '1671', 'Sukarami');
INSERT INTO `ref_kecamatan` VALUES ('167108', '1671', 'Sako');
INSERT INTO `ref_kecamatan` VALUES ('167109', '1671', 'Kemuning');
INSERT INTO `ref_kecamatan` VALUES ('167110', '1671', 'Kalidoni');
INSERT INTO `ref_kecamatan` VALUES ('167111', '1671', 'Bukit Kecil');
INSERT INTO `ref_kecamatan` VALUES ('167112', '1671', 'Gandus');
INSERT INTO `ref_kecamatan` VALUES ('167113', '1671', 'Kertapati');
INSERT INTO `ref_kecamatan` VALUES ('167114', '1671', 'Plaju');
INSERT INTO `ref_kecamatan` VALUES ('167115', '1671', 'Alang-alang Lebar');
INSERT INTO `ref_kecamatan` VALUES ('167116', '1671', 'Sematang Borang');
INSERT INTO `ref_kecamatan` VALUES ('167201', '1672', 'Pagar Alam Utara');
INSERT INTO `ref_kecamatan` VALUES ('167202', '1672', 'Pagar Alam Selatan');
INSERT INTO `ref_kecamatan` VALUES ('167203', '1672', 'Dempo Utara');
INSERT INTO `ref_kecamatan` VALUES ('167204', '1672', 'Dempo Selatan');
INSERT INTO `ref_kecamatan` VALUES ('167205', '1672', 'Dempo Tengah');
INSERT INTO `ref_kecamatan` VALUES ('167301', '1673', 'Lubuk Linggau Timur I');
INSERT INTO `ref_kecamatan` VALUES ('167302', '1673', 'Lubuk Linggau Barat I');
INSERT INTO `ref_kecamatan` VALUES ('167303', '1673', 'Lubuk Linggau Selatan I');
INSERT INTO `ref_kecamatan` VALUES ('167304', '1673', 'Lubuk Linggau Utara I');
INSERT INTO `ref_kecamatan` VALUES ('167305', '1673', 'Lubuk Linggau Timur II');
INSERT INTO `ref_kecamatan` VALUES ('167306', '1673', 'Lubuk Linggau Barat II');
INSERT INTO `ref_kecamatan` VALUES ('167307', '1673', 'Lubuk Linggau Selatan II');
INSERT INTO `ref_kecamatan` VALUES ('167308', '1673', 'Lubuk Linggau Utara II');
INSERT INTO `ref_kecamatan` VALUES ('167401', '1674', 'Prabumulih Barat');
INSERT INTO `ref_kecamatan` VALUES ('167402', '1674', 'Prabumulih Timur');
INSERT INTO `ref_kecamatan` VALUES ('167403', '1674', 'Cambai');
INSERT INTO `ref_kecamatan` VALUES ('167404', '1674', 'Rambang Kpk Tengah');
INSERT INTO `ref_kecamatan` VALUES ('167405', '1674', 'Prabumulih Utara');
INSERT INTO `ref_kecamatan` VALUES ('167406', '1674', 'Prabumulih Selatan');
INSERT INTO `ref_kecamatan` VALUES ('170101', '1701', 'Kedurang');
INSERT INTO `ref_kecamatan` VALUES ('170102', '1701', 'Seginim');
INSERT INTO `ref_kecamatan` VALUES ('170103', '1701', 'Pino');
INSERT INTO `ref_kecamatan` VALUES ('170104', '1701', 'Manna');
INSERT INTO `ref_kecamatan` VALUES ('170105', '1701', 'Kota Manna');
INSERT INTO `ref_kecamatan` VALUES ('170106', '1701', 'Pino Raya');
INSERT INTO `ref_kecamatan` VALUES ('170107', '1701', 'Kedurang Ilir');
INSERT INTO `ref_kecamatan` VALUES ('170108', '1701', 'Air Nipis');
INSERT INTO `ref_kecamatan` VALUES ('170109', '1701', 'Ulu Manna');
INSERT INTO `ref_kecamatan` VALUES ('170110', '1701', 'Bunga Mas');
INSERT INTO `ref_kecamatan` VALUES ('170111', '1701', 'Pasar Manna');
INSERT INTO `ref_kecamatan` VALUES ('170206', '1702', 'Kota Padang');
INSERT INTO `ref_kecamatan` VALUES ('170207', '1702', 'Padang Ulak Tanding');
INSERT INTO `ref_kecamatan` VALUES ('170208', '1702', 'Sindang Kelingi');
INSERT INTO `ref_kecamatan` VALUES ('170209', '1702', 'Curup');
INSERT INTO `ref_kecamatan` VALUES ('170210', '1702', 'Bermani Ulu');
INSERT INTO `ref_kecamatan` VALUES ('170211', '1702', 'Selupu Rejang');
INSERT INTO `ref_kecamatan` VALUES ('170216', '1702', 'Curup Utara');
INSERT INTO `ref_kecamatan` VALUES ('170217', '1702', 'Curup Timur');
INSERT INTO `ref_kecamatan` VALUES ('170218', '1702', 'Curup Selatan');
INSERT INTO `ref_kecamatan` VALUES ('170219', '1702', 'Curup Tengah');
INSERT INTO `ref_kecamatan` VALUES ('170220', '1702', 'Binduriang');
INSERT INTO `ref_kecamatan` VALUES ('170221', '1702', 'Sindang Beliti Ulu');
INSERT INTO `ref_kecamatan` VALUES ('170222', '1702', 'Sindang Dataran');
INSERT INTO `ref_kecamatan` VALUES ('170223', '1702', 'Sindang Beliti Ilir');
INSERT INTO `ref_kecamatan` VALUES ('170224', '1702', 'Bermani Ulu Raya');
INSERT INTO `ref_kecamatan` VALUES ('170301', '1703', 'Enggano');
INSERT INTO `ref_kecamatan` VALUES ('170306', '1703', 'Kerkap');
INSERT INTO `ref_kecamatan` VALUES ('170307', '1703', 'Kota Arga Makmur');
INSERT INTO `ref_kecamatan` VALUES ('170308', '1703', 'Giri Mulya');
INSERT INTO `ref_kecamatan` VALUES ('170309', '1703', 'Padang Jaya');
INSERT INTO `ref_kecamatan` VALUES ('170310', '1703', 'Lais');
INSERT INTO `ref_kecamatan` VALUES ('170311', '1703', 'Batik Nau');
INSERT INTO `ref_kecamatan` VALUES ('170312', '1703', 'Ketahun');
INSERT INTO `ref_kecamatan` VALUES ('170313', '1703', 'Napal Putih');
INSERT INTO `ref_kecamatan` VALUES ('170314', '1703', 'Putri Hijau');
INSERT INTO `ref_kecamatan` VALUES ('170315', '1703', 'Air Besi');
INSERT INTO `ref_kecamatan` VALUES ('170316', '1703', 'Air Napal');
INSERT INTO `ref_kecamatan` VALUES ('170319', '1703', 'Hulu Palik');
INSERT INTO `ref_kecamatan` VALUES ('170320', '1703', 'Air Padang');
INSERT INTO `ref_kecamatan` VALUES ('170321', '1703', 'Arma Jaya');
INSERT INTO `ref_kecamatan` VALUES ('170322', '1703', 'Tanjung Agung Palik');
INSERT INTO `ref_kecamatan` VALUES ('170323', '1703', 'Ulok Kupai');
INSERT INTO `ref_kecamatan` VALUES ('170401', '1704', 'Kinal');
INSERT INTO `ref_kecamatan` VALUES ('170402', '1704', 'Tanjung Kemuning');
INSERT INTO `ref_kecamatan` VALUES ('170403', '1704', 'Kaur Utara');
INSERT INTO `ref_kecamatan` VALUES ('170404', '1704', 'Kaur Tengah');
INSERT INTO `ref_kecamatan` VALUES ('170405', '1704', 'Kaur Selatan');
INSERT INTO `ref_kecamatan` VALUES ('170406', '1704', 'Maje');
INSERT INTO `ref_kecamatan` VALUES ('170407', '1704', 'Nasal');
INSERT INTO `ref_kecamatan` VALUES ('170408', '1704', 'Semidang Gumay');
INSERT INTO `ref_kecamatan` VALUES ('170409', '1704', 'Kelam Tengah');
INSERT INTO `ref_kecamatan` VALUES ('170410', '1704', 'Luas');
INSERT INTO `ref_kecamatan` VALUES ('170411', '1704', 'Muara Sahung');
INSERT INTO `ref_kecamatan` VALUES ('170412', '1704', 'Tetap');
INSERT INTO `ref_kecamatan` VALUES ('170413', '1704', 'Lungkang Kule');
INSERT INTO `ref_kecamatan` VALUES ('170414', '1704', 'Padang Guci Hilir');
INSERT INTO `ref_kecamatan` VALUES ('170415', '1704', 'Padang Guci Hulu');
INSERT INTO `ref_kecamatan` VALUES ('170501', '1705', 'Sukaraja');
INSERT INTO `ref_kecamatan` VALUES ('170502', '1705', 'Seluma');
INSERT INTO `ref_kecamatan` VALUES ('170503', '1705', 'Talo');
INSERT INTO `ref_kecamatan` VALUES ('170504', '1705', 'Semidang Alas');
INSERT INTO `ref_kecamatan` VALUES ('170505', '1705', 'Semidang Alas Maras');
INSERT INTO `ref_kecamatan` VALUES ('170506', '1705', 'Air Periukan');
INSERT INTO `ref_kecamatan` VALUES ('170507', '1705', 'Lubuk Sandi');
INSERT INTO `ref_kecamatan` VALUES ('170508', '1705', 'Seluma Barat');
INSERT INTO `ref_kecamatan` VALUES ('170509', '1705', 'Seluma Timur');
INSERT INTO `ref_kecamatan` VALUES ('170510', '1705', 'Seluma Utara');

-- ----------------------------
-- Table structure for ref_provinsi
-- ----------------------------
DROP TABLE IF EXISTS `ref_provinsi`;
CREATE TABLE `ref_provinsi`  (
  `id_prov` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_prov`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ref_provinsi
-- ----------------------------
INSERT INTO `ref_provinsi` VALUES ('11', 'Aceh');
INSERT INTO `ref_provinsi` VALUES ('12', 'Sumatera Utara');
INSERT INTO `ref_provinsi` VALUES ('13', 'Sumatera Barat');
INSERT INTO `ref_provinsi` VALUES ('14', 'Riau');
INSERT INTO `ref_provinsi` VALUES ('15', 'Jambi');
INSERT INTO `ref_provinsi` VALUES ('16', 'Sumatera Selatan');
INSERT INTO `ref_provinsi` VALUES ('17', 'Bengkulu');
INSERT INTO `ref_provinsi` VALUES ('18', 'Lampung');
INSERT INTO `ref_provinsi` VALUES ('19', 'Kepulauan Bangka Belitung');
INSERT INTO `ref_provinsi` VALUES ('21', 'Kepulauan Riau');
INSERT INTO `ref_provinsi` VALUES ('31', 'DKI Jakarta');
INSERT INTO `ref_provinsi` VALUES ('32', 'Jawa Barat');
INSERT INTO `ref_provinsi` VALUES ('33', 'Jawa Tengah');
INSERT INTO `ref_provinsi` VALUES ('34', 'DI Yogyakarta');
INSERT INTO `ref_provinsi` VALUES ('35', 'Jawa Timur');
INSERT INTO `ref_provinsi` VALUES ('36', 'Banten');
INSERT INTO `ref_provinsi` VALUES ('51', 'Bali');
INSERT INTO `ref_provinsi` VALUES ('52', 'Nusa Tenggara Barat');
INSERT INTO `ref_provinsi` VALUES ('53', 'Nusa Tenggara Timur');
INSERT INTO `ref_provinsi` VALUES ('61', 'Kalimantan Barat');
INSERT INTO `ref_provinsi` VALUES ('62', 'Kalimantan Tengah');
INSERT INTO `ref_provinsi` VALUES ('63', 'Kalimantan Selatan');
INSERT INTO `ref_provinsi` VALUES ('64', 'Kalimantan Timur');
INSERT INTO `ref_provinsi` VALUES ('65', 'Kalimantan Utara');
INSERT INTO `ref_provinsi` VALUES ('71', 'Sulawesi Utara');
INSERT INTO `ref_provinsi` VALUES ('72', 'Sulawesi Tengah');
INSERT INTO `ref_provinsi` VALUES ('73', 'Sulawesi Selatan');
INSERT INTO `ref_provinsi` VALUES ('74', 'Sulawesi Tenggara');
INSERT INTO `ref_provinsi` VALUES ('75', 'Gorontalo');
INSERT INTO `ref_provinsi` VALUES ('76', 'Sulawesi Barat');
INSERT INTO `ref_provinsi` VALUES ('81', 'Maluku');
INSERT INTO `ref_provinsi` VALUES ('82', 'Maluku Utara');
INSERT INTO `ref_provinsi` VALUES ('91', 'Papua Barat');
INSERT INTO `ref_provinsi` VALUES ('92', 'Papua');

-- ----------------------------
-- Table structure for ref_unit_type
-- ----------------------------
DROP TABLE IF EXISTS `ref_unit_type`;
CREATE TABLE `ref_unit_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ref_unit_type
-- ----------------------------
INSERT INTO `ref_unit_type` VALUES (1, 'Domestic', 0);
INSERT INTO `ref_unit_type` VALUES (2, 'International', 0);
INSERT INTO `ref_unit_type` VALUES (3, 'Umrah', 0);
INSERT INTO `ref_unit_type` VALUES (4, 'Maize', 0);
INSERT INTO `ref_unit_type` VALUES (5, 'Lain - lain', 0);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Programmers', 'a:30:{s:5:\"leave\";s:0:\"\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:0:\"\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:0:\"\";s:8:\"estimate\";N;s:7:\"expense\";s:0:\"\";s:6:\"client\";s:0:\"\";s:6:\"ticket\";s:0:\"\";s:12:\"announcement\";s:0:\"\";s:23:\"help_and_knowledge_base\";s:3:\"all\";s:19:\"can_create_projects\";N;s:17:\"can_edit_projects\";N;s:19:\"can_delete_projects\";N;s:30:\"can_add_remove_project_members\";N;s:16:\"can_create_tasks\";N;s:14:\"can_edit_tasks\";N;s:16:\"can_delete_tasks\";N;s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";N;s:21:\"can_delete_milestones\";N;s:16:\"can_delete_files\";N;s:34:\"can_view_team_members_contact_info\";N;s:34:\"can_view_team_members_social_links\";N;s:29:\"team_member_update_permission\";s:3:\"all\";s:38:\"team_member_update_permission_specific\";s:0:\"\";s:27:\"timesheet_manage_permission\";s:0:\"\";s:36:\"timesheet_manage_permission_specific\";s:0:\"\";s:21:\"disable_event_sharing\";N;}', 0);
INSERT INTO `roles` VALUES (2, 'Projects Manager', 'a:30:{s:5:\"leave\";s:3:\"all\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:3:\"all\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:3:\"all\";s:8:\"estimate\";s:3:\"all\";s:7:\"expense\";s:3:\"all\";s:6:\"client\";s:3:\"all\";s:6:\"ticket\";s:3:\"all\";s:12:\"announcement\";s:3:\"all\";s:23:\"help_and_knowledge_base\";s:3:\"all\";s:19:\"can_create_projects\";s:1:\"1\";s:17:\"can_edit_projects\";s:1:\"1\";s:19:\"can_delete_projects\";s:1:\"1\";s:30:\"can_add_remove_project_members\";s:1:\"1\";s:16:\"can_create_tasks\";s:1:\"1\";s:14:\"can_edit_tasks\";s:1:\"1\";s:16:\"can_delete_tasks\";s:1:\"1\";s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";s:1:\"1\";s:21:\"can_delete_milestones\";s:1:\"1\";s:16:\"can_delete_files\";s:1:\"1\";s:34:\"can_view_team_members_contact_info\";s:1:\"1\";s:34:\"can_view_team_members_social_links\";s:1:\"1\";s:29:\"team_member_update_permission\";s:0:\"\";s:38:\"team_member_update_permission_specific\";s:0:\"\";s:27:\"timesheet_manage_permission\";s:3:\"all\";s:36:\"timesheet_manage_permission_specific\";s:0:\"\";s:21:\"disable_event_sharing\";N;}', 0);
INSERT INTO `roles` VALUES (3, 'Accounting', NULL, 0);
INSERT INTO `roles` VALUES (4, 'Staff', NULL, 0);

-- ----------------------------
-- Table structure for sales_invoices
-- ----------------------------
DROP TABLE IF EXISTS `sales_invoices`;
CREATE TABLE `sales_invoices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid_order` int(11) NOT NULL,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `coa_sales` int(11) NOT NULL,
  `inv_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delivery_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inv_date` date NOT NULL,
  `end_date` date NOT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sub_total` double NOT NULL,
  `ppn` int(11) NOT NULL,
  `amount` double NOT NULL,
  `residual` double NOT NULL,
  `last_email_sent_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sales_invoices_items
-- ----------------------------
DROP TABLE IF EXISTS `sales_invoices_items`;
CREATE TABLE `sales_invoices_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `basic_price` double NOT NULL,
  `total` double NOT NULL,
  `fid_invoices` int(11) NOT NULL,
  `fid_items` int(11) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sales_order
-- ----------------------------
DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE `sales_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `fid_quot` int(11) NOT NULL,
  `inv_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delivery_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `exp_date` date NOT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_email_sent_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales_order
-- ----------------------------
INSERT INTO `sales_order` VALUES (1, '001/RAN/ODR/180731', 1, 1, 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'draft', 1, 'nugashare@gmail.com', '2018-07-31', 'IDR', NULL, '2018-07-31 03:41:32', 0);

-- ----------------------------
-- Table structure for sales_order_items
-- ----------------------------
DROP TABLE IF EXISTS `sales_order_items`;
CREATE TABLE `sales_order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `basic_price` double NOT NULL,
  `total` double NOT NULL,
  `fid_order` int(11) NOT NULL,
  `fid_items` int(50) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales_order_items
-- ----------------------------
INSERT INTO `sales_order_items` VALUES (1, 'Tiket Pesawat Garuda', 'Tiket pesawat 2 orang', 'Transport', 2, 'Domestic', 1600000, 0, 3200000, 1, NULL, 0);
INSERT INTO `sales_order_items` VALUES (2, 'Hotel', 'untuk 2 orang 2 malam', 'Akomodasi', 2, 'Domestic', 1300000, 0, 2600000, 1, NULL, 0);
INSERT INTO `sales_order_items` VALUES (3, 'Tour Package', 'untuk 2 orang', 'Akomodasi', 2, 'Domestic', 800000, 0, 1600000, 1, NULL, 1);

-- ----------------------------
-- Table structure for sales_payments
-- ----------------------------
DROP TABLE IF EXISTS `sales_payments`;
CREATE TABLE `sales_payments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_inv` int(11) NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `paid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pay_date` datetime(0) NOT NULL,
  `fid_bank` int(11) NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `currency` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` double NOT NULL,
  `residu` double NOT NULL,
  `memo` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sales_quotation
-- ----------------------------
DROP TABLE IF EXISTS `sales_quotation`;
CREATE TABLE `sales_quotation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_cust` int(11) NOT NULL,
  `inv_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `delivery_address` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_tax` int(11) NOT NULL,
  `email_to` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `exp_date` date NOT NULL,
  `currency` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_email_sent_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales_quotation
-- ----------------------------
INSERT INTO `sales_quotation` VALUES (1, '001/RAN/QUO/180731', 1, 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'Jl Puring Mas 2 Villa Pamulang Mas Blok C 16 no 3 Bambu Apus', 'draft', 1, 'nugashare@gmail.com', '2018-08-01', 'IDR', NULL, '2018-07-31 03:14:44', 0);

-- ----------------------------
-- Table structure for sales_quotation_items
-- ----------------------------
DROP TABLE IF EXISTS `sales_quotation_items`;
CREATE TABLE `sales_quotation_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `fid_quotation` int(11) NOT NULL,
  `fid_items` int(11) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales_quotation_items
-- ----------------------------
INSERT INTO `sales_quotation_items` VALUES (1, 'Tiket Pesawat Garuda', 'Tiket pesawat 2 orang', 'Transport', 2, 'Domestic', 1600000, 3200000, 1, 1, 0);
INSERT INTO `sales_quotation_items` VALUES (2, 'Hotel', 'untuk 2 orang 2 malam', 'Akomodasi', 2, 'Domestic', 1300000, 2600000, 1, 5, 0);
INSERT INTO `sales_quotation_items` VALUES (3, 'Tour Package', 'untuk 2 orang', 'Akomodasi', 2, 'Domestic', 800000, 1600000, 1, 8, 0);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `setting_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `setting_name`(`setting_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('accepted_file_formats', 'jpg,jpeg,doc,JPG,JPEG,PNG,gif,docx,zip,rar', 0);
INSERT INTO `settings` VALUES ('allow_partial_invoice_payment_from_clients', '1', 0);
INSERT INTO `settings` VALUES ('allowed_ip_addresses', '', 0);
INSERT INTO `settings` VALUES ('app_title', 'PT Ranata Air Network Tours and Travel', 0);
INSERT INTO `settings` VALUES ('budget_end', '', 0);
INSERT INTO `settings` VALUES ('budget_start', '', 0);
INSERT INTO `settings` VALUES ('client_can_add_project_files', '', 0);
INSERT INTO `settings` VALUES ('client_can_comment_on_files', '', 0);
INSERT INTO `settings` VALUES ('client_can_comment_on_tasks', '', 0);
INSERT INTO `settings` VALUES ('client_can_create_projects', '', 0);
INSERT INTO `settings` VALUES ('client_can_create_tasks', '', 0);
INSERT INTO `settings` VALUES ('client_can_edit_tasks', '', 0);
INSERT INTO `settings` VALUES ('client_can_view_gantt', '', 0);
INSERT INTO `settings` VALUES ('client_can_view_milestones', '', 0);
INSERT INTO `settings` VALUES ('client_can_view_overview', '', 0);
INSERT INTO `settings` VALUES ('client_can_view_project_files', '', 0);
INSERT INTO `settings` VALUES ('client_can_view_tasks', '', 0);
INSERT INTO `settings` VALUES ('client_message_users', '', 0);
INSERT INTO `settings` VALUES ('company_address', 'Jl. Cihampelas No.225, Tamansari, Bandung Wetan, Kota Bandung, Jawa Barat 40131', 0);
INSERT INTO `settings` VALUES ('company_email', 'official@ranatatour.com', 0);
INSERT INTO `settings` VALUES ('company_name', 'PT Ranata Air Network', 0);
INSERT INTO `settings` VALUES ('company_phone', '(022) 2036186', 0);
INSERT INTO `settings` VALUES ('company_website', 'http://www.ranatatour.com/', 0);
INSERT INTO `settings` VALUES ('currency_position', 'left', 0);
INSERT INTO `settings` VALUES ('currency_symbol', 'Rp. ', 0);
INSERT INTO `settings` VALUES ('date_format', 'd-m-Y', 0);
INSERT INTO `settings` VALUES ('decimal_separator', '.', 0);
INSERT INTO `settings` VALUES ('default_currency', 'IDR', 0);
INSERT INTO `settings` VALUES ('disable_client_login', '', 0);
INSERT INTO `settings` VALUES ('disable_client_signup', '1', 0);
INSERT INTO `settings` VALUES ('email_protocol', '', 0);
INSERT INTO `settings` VALUES ('email_sent_from_address', 'official@ranatatour.com', 0);
INSERT INTO `settings` VALUES ('email_sent_from_name', 'Ranata Air Network', 0);
INSERT INTO `settings` VALUES ('email_smtp_host', '', 0);
INSERT INTO `settings` VALUES ('email_smtp_pass', '', 0);
INSERT INTO `settings` VALUES ('email_smtp_port', '', 0);
INSERT INTO `settings` VALUES ('email_smtp_security_type', 'tls', 0);
INSERT INTO `settings` VALUES ('email_smtp_user', '', 0);
INSERT INTO `settings` VALUES ('first_day_of_week', '1', 0);
INSERT INTO `settings` VALUES ('front_meta_description', '', 0);
INSERT INTO `settings` VALUES ('front_meta_keywords', '', 0);
INSERT INTO `settings` VALUES ('front_meta_title', 'Nugastudio - Web Artisans', 0);
INSERT INTO `settings` VALUES ('invoice_color', '', 0);
INSERT INTO `settings` VALUES ('invoice_footer', '<p>&nbsp; &nbsp; &nbsp; TTD</p><p><br></p><p>Sales Manager</p>', 0);
INSERT INTO `settings` VALUES ('invoice_logo', '_file5ae430cdbd39c-invoice-logo.png', 0);
INSERT INTO `settings` VALUES ('invoice_prefix', 'INVOICE #', 0);
INSERT INTO `settings` VALUES ('invoice_style', '', 0);
INSERT INTO `settings` VALUES ('item_purchase_code', 'sdfsdg', 0);
INSERT INTO `settings` VALUES ('language', 'english', 0);
INSERT INTO `settings` VALUES ('module_announcement', '', 0);
INSERT INTO `settings` VALUES ('module_attendance', '', 0);
INSERT INTO `settings` VALUES ('module_estimate', '', 0);
INSERT INTO `settings` VALUES ('module_estimate_request', '', 0);
INSERT INTO `settings` VALUES ('module_event', '', 0);
INSERT INTO `settings` VALUES ('module_expense', '1', 0);
INSERT INTO `settings` VALUES ('module_help', '1', 0);
INSERT INTO `settings` VALUES ('module_invoice', '1', 0);
INSERT INTO `settings` VALUES ('module_knowledge_base', '1', 0);
INSERT INTO `settings` VALUES ('module_leave', '', 0);
INSERT INTO `settings` VALUES ('module_message', '1', 0);
INSERT INTO `settings` VALUES ('module_note', '', 0);
INSERT INTO `settings` VALUES ('module_project_timesheet', '', 0);
INSERT INTO `settings` VALUES ('module_ticket', '', 0);
INSERT INTO `settings` VALUES ('module_timeline', '1', 0);
INSERT INTO `settings` VALUES ('module_vendor', '1', 0);
INSERT INTO `settings` VALUES ('rows_per_page', '10', 0);
INSERT INTO `settings` VALUES ('scrollbar', 'jquery', 0);
INSERT INTO `settings` VALUES ('send_bcc_to', '', 0);
INSERT INTO `settings` VALUES ('show_background_image_in_signin_page', 'yes', 0);
INSERT INTO `settings` VALUES ('show_logo_in_signin_page', 'yes', 0);
INSERT INTO `settings` VALUES ('site_logo', '_file5ae42fbc2e0ab-site-logo.png', 0);
INSERT INTO `settings` VALUES ('time_format', '24_hours', 0);
INSERT INTO `settings` VALUES ('timezone', 'Asia/Jakarta', 0);

-- ----------------------------
-- Table structure for social_links
-- ----------------------------
DROP TABLE IF EXISTS `social_links`;
CREATE TABLE `social_links`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `twitter` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `linkedin` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `googleplus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `digg` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `youtube` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `pinterest` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `instagram` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `github` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tumblr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `vine` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `project_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL DEFAULT 0,
  `assigned_to` int(11) NOT NULL,
  `deadline` date NULL DEFAULT NULL,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `points` tinyint(4) NOT NULL DEFAULT 1,
  `status` enum('to_do','in_progress','done') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do',
  `start_date` date NOT NULL,
  `collaborators` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, 'Input Data Tahap 1', 'Menginput Data tahap 1', 1, 0, 1, '2017-08-27', '', 1, 'to_do', '2017-08-20', '1', 0);
INSERT INTO `tasks` VALUES (2, 'UI Design HTML Pages', 'Module Web Design And Front End', 2, 2, 3, '2017-09-13', '', 4, 'in_progress', '2017-09-11', '3', 0);
INSERT INTO `tasks` VALUES (3, 'Responsive Devices On All Pages', '2.	Module Responsive All Devices', 2, 2, 3, '2017-09-14', '', 1, 'to_do', '2017-09-14', '3', 0);
INSERT INTO `tasks` VALUES (4, 'CMS Module and Backend', 'Module CMS Company Profile', 2, 4, 3, '2017-09-17', '', 5, 'to_do', '2017-09-16', '3', 0);
INSERT INTO `tasks` VALUES (5, 'Front End Integration', 'Front End Integration Data ', 2, 5, 3, '2017-09-20', '', 5, 'to_do', '2017-09-17', '3', 0);
INSERT INTO `tasks` VALUES (6, 'Database Design System', 'Database Schema Design And Relational Tables', 2, 3, 3, '2017-09-16', '', 2, 'to_do', '2017-09-15', '3', 0);
INSERT INTO `tasks` VALUES (7, 'User Checked Unit Testing', '', 2, 6, 3, '2017-09-22', '', 1, 'to_do', '2017-09-21', '3', 0);
INSERT INTO `tasks` VALUES (8, 'Mengumpulkan Data', '', 3, 7, 1, '2018-03-21', '', 1, 'to_do', '2018-03-19', '1', 0);
INSERT INTO `tasks` VALUES (9, 'Desain Database', '', 3, 8, 1, '2018-03-25', '', 1, 'to_do', '2018-03-22', '1', 0);
INSERT INTO `tasks` VALUES (10, 'Modul Master Data', '', 3, 9, 1, '2018-04-03', '', 3, 'to_do', '2018-04-01', '1', 0);
INSERT INTO `tasks` VALUES (11, 'Modul Reference Data', '', 3, 9, 1, '2018-04-05', '', 1, 'to_do', '2018-04-04', '1', 0);
INSERT INTO `tasks` VALUES (12, 'Modul Master Report COA', '', 3, 9, 1, '2018-04-05', '', 1, 'to_do', '2018-04-05', '1', 0);
INSERT INTO `tasks` VALUES (13, 'Desain Skema Laporan', '', 3, 8, 1, '2018-03-30', '', 1, 'to_do', '2018-03-26', '1', 0);
INSERT INTO `tasks` VALUES (14, 'Desain Skema Purchase & Sales', '', 3, 8, 1, '2018-03-31', '', 1, 'to_do', '2018-03-28', '1', 0);
INSERT INTO `tasks` VALUES (15, 'Implementasi Sistem Travel', '', 3, 10, 1, '2018-04-23', '', 1, 'to_do', '2018-04-01', '1', 0);
INSERT INTO `tasks` VALUES (16, 'Vendor Sistem', '', 3, 10, 1, '2018-04-08', '', 2, 'to_do', '2018-04-06', '1', 0);
INSERT INTO `tasks` VALUES (17, 'CRUD Customers', '', 3, 10, 1, '2018-03-20', '', 1, 'to_do', '2018-04-09', '1', 0);
INSERT INTO `tasks` VALUES (18, 'Fitur Purchase Order', '', 3, 10, 1, '2018-04-14', '', 1, 'to_do', '2018-04-10', '1', 0);
INSERT INTO `tasks` VALUES (19, 'Fitur Sales Order', '', 3, 10, 1, '2018-04-17', '', 2, 'to_do', '2018-04-15', '1', 0);
INSERT INTO `tasks` VALUES (20, 'Fitur Sales Quotation', '', 3, 10, 1, '2018-04-20', '', 2, 'to_do', '2018-04-18', '1', 0);
INSERT INTO `tasks` VALUES (21, 'Fitur Purchase Request', '', 3, 10, 1, '2018-04-22', '', 2, 'to_do', '2018-04-21', '1', 0);
INSERT INTO `tasks` VALUES (22, 'Fitur Invoice ', '', 3, 10, 1, '2018-04-24', '', 2, 'to_do', '2018-04-23', '1', 0);
INSERT INTO `tasks` VALUES (23, 'Fitur Tax (Pajak)', '', 3, 10, 1, '2018-04-25', '', 1, 'to_do', '2018-04-25', '1', 0);
INSERT INTO `tasks` VALUES (24, 'Fitur AP & AR', '', 3, 10, 1, '2018-04-27', '', 4, 'to_do', '2018-04-26', '1', 0);
INSERT INTO `tasks` VALUES (25, 'Modul Master Asset (Fix)', '', 3, 9, 1, '2018-04-05', '', 1, 'to_do', '2018-04-05', '1', 0);
INSERT INTO `tasks` VALUES (26, 'Modul Master Produk', '', 3, 9, 1, '2018-04-05', '', 2, 'to_do', '2018-04-02', '', 0);
INSERT INTO `tasks` VALUES (27, 'Laporan NERACA SALDO', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0);
INSERT INTO `tasks` VALUES (28, 'Laporan LABA RUGI', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0);
INSERT INTO `tasks` VALUES (29, 'Laporan Arus Kas', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0);
INSERT INTO `tasks` VALUES (30, 'Laporan Kas Penjualan', '', 3, 11, 1, '2018-05-05', '', 3, 'to_do', '2018-04-30', '1', 0);
INSERT INTO `tasks` VALUES (31, 'Laporan Penyusutan Aset', '', 3, 11, 1, '2018-05-05', '', 1, 'to_do', '2018-04-30', '1', 0);
INSERT INTO `tasks` VALUES (32, 'Laporan Perubahan Modal', '', 3, 11, 1, '2018-05-05', '', 1, 'to_do', '2018-04-30', '1', 0);
INSERT INTO `tasks` VALUES (33, 'Laporan LABA RUGI per Projects', '', 3, 11, 1, '2018-05-05', '', 2, 'to_do', '2018-04-30', '1', 0);
INSERT INTO `tasks` VALUES (34, 'Laporan per Produk', '', 3, 11, 1, '2018-05-05', '', 2, 'to_do', '2018-04-30', '1', 0);

-- ----------------------------
-- Table structure for taxes
-- ----------------------------
DROP TABLE IF EXISTS `taxes`;
CREATE TABLE `taxes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taxes
-- ----------------------------
INSERT INTO `taxes` VALUES (1, 'PPN (10%)', 10, 0);

-- ----------------------------
-- Table structure for tbl_transaction_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_transaction_detail`;
CREATE TABLE `tbl_transaction_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coa` int(11) NOT NULL,
  `debet` double NOT NULL,
  `kredit` double NOT NULL,
  `fid_transaction` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_transaction_detail
-- ----------------------------
INSERT INTO `tbl_transaction_detail` VALUES (1, 2, 100000, 0, 3, 0);
INSERT INTO `tbl_transaction_detail` VALUES (2, 12, 0, 100000, 3, 0);
INSERT INTO `tbl_transaction_detail` VALUES (3, 6, 10000, 0, 3, 0);
INSERT INTO `tbl_transaction_detail` VALUES (4, 17, 0, 10000, 3, 0);
INSERT INTO `tbl_transaction_detail` VALUES (5, 4, 10000, 0, 3, 0);
INSERT INTO `tbl_transaction_detail` VALUES (6, 24, 0, 10000, 3, 0);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 'Developers', '3', 0);

-- ----------------------------
-- Table structure for team_member_job_info
-- ----------------------------
DROP TABLE IF EXISTS `team_member_job_info`;
CREATE TABLE `team_member_job_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_of_hire` date NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `salary` double NOT NULL DEFAULT 0,
  `salary_term` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of team_member_job_info
-- ----------------------------
INSERT INTO `team_member_job_info` VALUES (1, 3, '2017-08-17', 0, 2000000, '5000000');
INSERT INTO `team_member_job_info` VALUES (2, 5, '2018-04-28', 0, 1000000, '');

-- ----------------------------
-- Table structure for ticket_comments
-- ----------------------------
DROP TABLE IF EXISTS `ticket_comments`;
CREATE TABLE `ticket_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket_comments
-- ----------------------------
INSERT INTO `ticket_comments` VALUES (1, 2, '2017-08-17 12:41:23', 'saya mau nanya perihal pembayaran menggunakan apa dan konfirmasi kemana ?', 1, 'a:0:{}', 0);

-- ----------------------------
-- Table structure for ticket_types
-- ----------------------------
DROP TABLE IF EXISTS `ticket_types`;
CREATE TABLE `ticket_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket_types
-- ----------------------------
INSERT INTO `ticket_types` VALUES (1, 'General Support', 0);

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `status` enum('new','client_replied','open','closed') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime(0) NULL DEFAULT NULL,
  `assigned_to` int(11) NOT NULL DEFAULT 0,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES (1, 1, 1, 'tanya pembayaran', 2, '2017-08-17 12:41:23', 'new', '2017-08-17 12:41:23', 0, NULL, 0);

-- ----------------------------
-- Table structure for transaction_journal
-- ----------------------------
DROP TABLE IF EXISTS `transaction_journal`;
CREATE TABLE `transaction_journal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `voucher_code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_coa` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_header` int(11) NULL DEFAULT NULL,
  `debet` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for transaction_journal_header
-- ----------------------------
DROP TABLE IF EXISTS `transaction_journal_header`;
CREATE TABLE `transaction_journal_header`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fid_coa` int(11) NOT NULL,
  `voucher_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of transaction_journal_header
-- ----------------------------
INSERT INTO `transaction_journal_header` VALUES (8, 'RAN180712192013', 66, 'BKK-18001', '2018-07-12', 'ok', 1, 'expenses', 0);
INSERT INTO `transaction_journal_header` VALUES (9, 'RAN180717114510', 4, 'BKM-18106', '2018-07-17', 'Pendapatan Jasa', 1, 'income', 0);
INSERT INTO `transaction_journal_header` VALUES (10, 'RAN180722041036', 4, 'BKM-18108', '2018-07-22', 'Penjualan', 1, 'income', 0);
INSERT INTO `transaction_journal_header` VALUES (11, 'RAN180722042519', 4, 'BKM-18110', '2018-07-22', 'TIket', 1, 'income', 0);
INSERT INTO `transaction_journal_header` VALUES (12, 'RAN180722042556', 4, 'BKM-18112', '2018-07-22', 'Tiket ke Jepang', 1, 'income', 0);
INSERT INTO `transaction_journal_header` VALUES (13, 'RAN180722043343', 4, 'BKM-18114', '2018-06-08', 'sdfsdg', 1, 'income', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('staff','client') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime(0) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `notification_checked_at` datetime(0) NOT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT 0,
  `job_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT 0,
  `note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `alternative_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `alternative_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `dob` date NULL,
  `ssn` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `sticky_note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `skype` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT 1,
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(0) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_type`(`user_type`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `client_id`(`client_id`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Super', 'Admin', 'staff', 1, 0, 'nugasoft.studio@gmail.com', 'e89f883d762bef9c0af3f046a06e4cf1', '_file59958565e9dca-avatar.png', 'active', '2018-06-25 16:03:16', 0, '2018-06-25 16:03:13', 0, 'Admin', 0, NULL, '', '', '085778805131', '', '0000-00-00', '', 'male', 'Diias', '', 1, 1, '2017-08-16 13:04:45', 0);
INSERT INTO `users` VALUES (2, 'jpunk', 'slow', 'client', 0, 0, 'nugashare@gmail.com', 'e89f883d762bef9c0af3f046a06e4cf1', '_file599587f178660-avatar.png', 'active', '2017-08-17 12:45:50', 1, '2017-08-17 12:45:51', 1, 'Manager Proyek', 0, NULL, NULL, NULL, '085778805131', NULL, '0000-00-00', NULL, 'male', NULL, '', 1, 1, '2017-08-17 12:05:00', 0);
INSERT INTO `users` VALUES (3, 'Dian', 'Nugraha', 'staff', 0, 0, 'employe1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '_file599593bee682f-avatar.png', 'active', '0000-00-00 00:00:00', 0, '2017-08-17 13:22:16', 0, 'Senior Developers', 0, NULL, '', '', '08124235553', '', '0000-00-00', '', 'male', NULL, '', 1, 1, '2017-08-17 12:23:10', 0);
INSERT INTO `users` VALUES (4, 'Qodar', 'Askara', 'client', 0, 0, 'qodar@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'active', '0000-00-00 00:00:00', 2, '0000-00-00 00:00:00', 1, 'Web Division', 0, NULL, NULL, NULL, '08599235', NULL, '0000-00-00', NULL, 'male', NULL, '', 1, 1, '2017-09-11 10:11:58', 0);
INSERT INTO `users` VALUES (5, 'Dimas', 'Baskoro', 'staff', 1, 0, 'dimaskoro88@gmail.com', '0192023a7bbd73250516f069df18b500', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Accounting', 0, NULL, 'dimaskoro.88@gmail.com', NULL, '09238835235', NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-04-27 12:45:55', 0);

-- ----------------------------
-- View structure for v_aging_sales
-- ----------------------------
DROP VIEW IF EXISTS `v_aging_sales`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_aging_sales` AS select `a`.`id` AS `id`,`a`.`fid_cust` AS `fid_cust`,`a`.`inv_date` AS `inv_date`,`a`.`currency` AS `currency`,`a`.`code` AS `CODE`,`b`.`name` AS `NAME`,`b`.`termin` AS `termin`,`a`.`amount` AS `amount`,`a`.`residual` AS `residual`,(to_days(curdate()) - to_days(`a`.`inv_date`)) AS `jumlah` from (`sales_invoices` `a` join `master_customers` `b` on((`a`.`fid_cust` = `b`.`id`))) where ((`a`.`status` = 'posting') and (`a`.`paid` in ('Not Paid','Credit')) and (`a`.`deleted` = 0) and (`a`.`inv_date` <= curdate())) group by `a`.`code` ; ;

-- ----------------------------
-- View structure for v_transaction
-- ----------------------------
DROP VIEW IF EXISTS `v_transaction`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_transaction` AS select 'D' AS `tbl`,`acc_transaction`.`id` AS `id`,`acc_transaction`.`tgl_catat` AS `tgl`,if((`acc_transaction`.`dk` = 'K'),`acc_transaction`.`jumlah`,if(isnull(`acc_transaction`.`dk`),`acc_transaction`.`jumlah`,0)) AS `kredit`,if((`acc_transaction`.`dk` = 'D'),`acc_transaction`.`jumlah`,if(isnull(`acc_transaction`.`dk`),`acc_transaction`.`jumlah`,0)) AS `debet`,`acc_transaction`.`dari_kas_id` AS `dari_kas`,`acc_transaction`.`untuk_kas_id` AS `untuk_kas`,`acc_transaction`.`jns_trans` AS `transaksi`,`acc_transaction`.`keterangan` AS `ket`,`acc_transaction`.`user_name` AS `user` from `acc_transaction` order by `acc_transaction`.`tgl_catat` ; ;

SET FOREIGN_KEY_CHECKS = 1;
