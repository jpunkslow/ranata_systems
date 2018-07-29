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

 Date: 29/07/2018 15:48:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
INSERT INTO `acc_coa_type` VALUES (25, '120', 'PIUTANG LAIN-LAIN', 'Head', 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 0, 0);
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
INSERT INTO `acc_coa_type` VALUES (71, '120001', 'Piutang Pemegang Saham (IDR)', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 25, 0);
INSERT INTO `acc_coa_type` VALUES (72, '200002', 'Hutang Usaha (USD)', NULL, 'Kredit', 'Hutang Lancar', 'Neraca', '', NULL, 'pengeluaran', 26, 0);
INSERT INTO `acc_coa_type` VALUES (73, '600100003', 'Beban Kesejahteraan Karyawan', NULL, 'Debet', 'Beban Administrasi Umum', 'Laba Rugi', '', NULL, 'pengeluaran', 103, 0);
INSERT INTO `acc_coa_type` VALUES (74, '700002', 'Laba Selisih Kurs', NULL, 'Kredit', 'Pendapatan Lain-lain ', 'Laba Rugi', '', NULL, 'pemasukan', 53, 0);
INSERT INTO `acc_coa_type` VALUES (75, '800002', 'Beban Bunga Pihak Ketiga', NULL, 'Debet', 'Beban Lain-lain', 'Laba Rugi', '', NULL, 'pengeluaran', 55, 0);
INSERT INTO `acc_coa_type` VALUES (76, '120002', 'Piutang Lain-lain', NULL, 'Debet', 'Aktiva Lancar', 'Neraca', '', NULL, 'pemasukan', 25, 0);
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

SET FOREIGN_KEY_CHECKS = 1;
