/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100131
 Source Host           : localhost:3306
 Source Schema         : dev_ranata

 Target Server Type    : MySQL
 Target Server Version : 100131
 File Encoding         : 65001

 Date: 06/08/2018 07:49:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for labarugi_budgeting
-- ----------------------------
DROP TABLE IF EXISTS `labarugi_budgeting`;
CREATE TABLE `labarugi_budgeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid_coa` int(11) NOT NULL,
  `coa_name` varchar(250) NOT NULL,
  `periode` int(11) NOT NULL,
  `januari` int(11) NOT NULL,
  `februari` int(11) NOT NULL,
  `maret` int(11) NOT NULL,
  `april` int(11) NOT NULL,
  `mei` int(11) NOT NULL,
  `juni` int(11) NOT NULL,
  `juli` int(11) NOT NULL,
  `agustus` int(11) NOT NULL,
  `september` int(11) NOT NULL,
  `oktober` int(11) NOT NULL,
  `november` int(11) NOT NULL,
  `desember` int(11) NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of labarugi_budgeting
-- ----------------------------
BEGIN;
INSERT INTO `labarugi_budgeting` VALUES (1, 44, 'Penjualan Barang', 2018, 1000, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (2, 88, '     Online Tracking', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (3, 89, '     Ticket Pesawat (Domestik)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (4, 90, '     Ticket Pesawat (Domestik)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (5, 91, '     Tour Package', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (6, 92, '      Tour & Travek ke Jepang', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (7, 93, 'Hotel Reservation', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (8, 94, '     Ticket Pesawat (Domestik)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (9, 96, '     Ticket Pesawat (Domestik)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (10, 45, 'Pendapatan Jasa', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (11, 64, 'Bunga Bank & Jasa Giro', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (12, 74, 'Laba Selisih Kurs', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (13, 121, 'Pendapatan Lain-lain', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (14, 47, 'Harga Pokok Penjualan (HPP) Ticketing', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (15, 99, 'HPP Tiket Pesawat (Domestik)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (16, 100, 'HPP Tiket Pesawat (International)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (17, 48, 'Harga Pokok Penjualan (HPP) Tour And Travel', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (18, 97, 'Harga Pokok Penjualan (HPP) Voucher Hotel', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (19, 101, 'HPP Voucher Hotel (Domestik)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (20, 102, 'HPP Voucher Hotel (International)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (21, 98, 'Harga Pokok Penjualan (HPP) Mice (Meeting, Insentif, Congres & Event)', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (22, 123, 'Retur Potongan', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (23, 103, 'Beban Administrasi dan Umum', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (24, 51, 'Beban Gaji & Tunjangan Karyawan', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (25, 52, 'Beban THR Karyawan', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (26, 73, 'Beban Kesejahteraan Karyawan', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (27, 79, 'Beban Pulsa & Pasca Bayar Direksi', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (28, 80, 'Beban Jasa Profesional', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (29, 81, 'Beban Legalitas & Perijinan', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (30, 104, 'Beban Penyusutan Aktiva', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (31, 105, 'Beban Sewa Kendaraan', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (32, 106, 'Beban Pos & Material', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (33, 107, 'Beban Alat Tulis Kantor', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (34, 108, 'Beban Pajak', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (35, 109, 'Beban Listrik & Air', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (36, 110, 'Beban Telepon & Air', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (37, 111, 'Beban Rumah Tangga Kantor', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (38, 112, 'Beban Transportasi Kantor', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (39, 113, 'Beban Perbaikan dan Pemeliharaan', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (40, 114, 'Bebab Sewa Kantor', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (41, 116, 'Beban Iklan & Promosi', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (42, 117, 'Beban Gift & Merchandise', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (43, 118, 'Beban Perjalanan Dinas', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (44, 119, 'Beban Komisi', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (45, 120, 'Beban Lain-lain', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (46, 56, 'Beban Administrasi Bank', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (47, 75, 'Beban Bunga Pihak Ketiga', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
INSERT INTO `labarugi_budgeting` VALUES (48, 122, 'Beban Lain-lain', 2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
