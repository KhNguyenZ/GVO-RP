/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50515 (5.5.15)
 Source Host           : localhost:3306
 Source Schema         : ssa

 Target Server Type    : MySQL
 Target Server Version : 50515 (5.5.15)
 File Encoding         : 65001

 Date: 22/06/2024 22:20:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RegisterDay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LastLogin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ActiveAccount` int(11) NULL DEFAULT NULL,
  `CharName0` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Tao nhan vat',
  `CharName1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Tao nhan vat',
  `CharName2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Tao nhan vat',
  `DiscordID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1',
  `Discord_Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Discord_Auth` int(11) NULL DEFAULT 0,
  `Online` int(11) NULL DEFAULT 0,
  `OTP` int(11) NULL DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email_Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email_Status` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (11, 'Khoi_Nguyen', 'nguyen', NULL, NULL, NULL, 'Khoi_Nguyenz', 'Hack_Monkey', 'Tao nhan vat', '992137033449480203', '0', 1, NULL, 123, 'knguyen151108@gmail.com', '273765', 0);
INSERT INTO `accounts` VALUES (12, 'Khoi_Nguyenz', 'nguyen', NULL, NULL, NULL, 'Khoi_Bi', 'Tao nhan vat', 'Tao nhan vat', '992137033449480203', '489948', 0, 0, 916630, NULL, '0', 1);
INSERT INTO `accounts` VALUES (13, 'Adminz', 'nguyen', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, '0', 1);
INSERT INTO `accounts` VALUES (14, 'Account_Test', 'nguyen', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '1203582188386390056', '0', 1, 0, NULL, NULL, '0', 1);
INSERT INTO `accounts` VALUES (15, 'Admin_Test', '', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, '0', 1);
INSERT INTO `accounts` VALUES (16, 'Khoi_Nguyenfasd', '', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (17, 'Khoi_Nguyenfasdasf', 'nguyen', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (18, 'DumeM', 'cccccc', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (19, 'Khoi_Nguyenzzzz', 'nguyen', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (20, 'Khoi_Nguyenzzzadz', 'egegwrgwe', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (21, 'Khoi_Nguyensdfsdf', 'cc@gmail.com', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (22, 'Khoi_Nguyenzz', '', NULL, NULL, NULL, 'Hacker_Nedumem', 'Hello_SSA', 'CC_NE', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (23, 'Khoi_Nguyendadf', 'nguyen', NULL, NULL, NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);
INSERT INTO `accounts` VALUES (24, 'Jey_BeeD', 'nguyen', NULL, NULL, NULL, 'Khanh_Nguyen', 'Tao nhan vat', 'Tao nhan vat', '-1', NULL, 0, 0, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for biz
-- ----------------------------
DROP TABLE IF EXISTS `biz`;
CREATE TABLE `biz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NULL DEFAULT NULL,
  `ExPosX` float(11, 0) NULL DEFAULT NULL,
  `ExPosY` float NULL DEFAULT NULL,
  `ExPosZ` float NULL DEFAULT NULL,
  `Locked` int(11) NULL DEFAULT NULL,
  `OwnerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `InPosX` float NULL DEFAULT NULL,
  `InPosY` float NULL DEFAULT NULL,
  `InPosZ` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz
-- ----------------------------

-- ----------------------------
-- Table structure for biz_247
-- ----------------------------
DROP TABLE IF EXISTS `biz_247`;
CREATE TABLE `biz_247`  (
  `id` int(11) NOT NULL,
  `BizID` int(11) NULL DEFAULT NULL,
  `ItemSlot1` int(11) NULL DEFAULT NULL,
  `ItemSlot2` int(11) NULL DEFAULT NULL,
  `ItemSlot3` int(11) NULL DEFAULT NULL,
  `ItemSlot4` int(11) NULL DEFAULT NULL,
  `ItemSlot5` int(11) NULL DEFAULT NULL,
  `ItemSlot6` int(11) NULL DEFAULT NULL,
  `ItemSlot7` int(11) NULL DEFAULT NULL,
  `ItemSlot8` int(11) NULL DEFAULT NULL,
  `ItemSlot9` int(11) NULL DEFAULT NULL,
  `ItemSlot10` int(11) NULL DEFAULT NULL,
  `ItemSlot11` int(11) NULL DEFAULT NULL,
  `ItemSlot12` int(11) NULL DEFAULT NULL,
  `ItemSlot13` int(11) NULL DEFAULT NULL,
  `ItemSlot14` int(11) NULL DEFAULT NULL,
  `ItemSlot15` int(11) NULL DEFAULT NULL,
  `ItemSlot16` int(11) NULL DEFAULT NULL,
  `ItemSlot17` int(11) NULL DEFAULT NULL,
  `ItemSlot18` int(11) NULL DEFAULT NULL,
  `ItemSlot19` int(11) NULL DEFAULT NULL,
  `ItemSlot20` int(11) NULL DEFAULT NULL,
  `ItemSlot21` int(11) NULL DEFAULT NULL,
  `ItemSlot22` int(11) NULL DEFAULT NULL,
  `ItemSlot23` int(11) NULL DEFAULT NULL,
  `ItemSlot24` int(11) NULL DEFAULT NULL,
  `ItemSlot25` int(11) NULL DEFAULT NULL,
  `ItemSlot26` int(11) NULL DEFAULT NULL,
  `ItemSlot27` int(11) NULL DEFAULT NULL,
  `ItemSlot28` int(11) NULL DEFAULT NULL,
  `ItemSlot29` int(11) NULL DEFAULT NULL,
  `ItemSlot30` int(11) NULL DEFAULT NULL,
  `ItemSlot31` int(11) NULL DEFAULT NULL,
  `ItemSlot32` int(11) NULL DEFAULT NULL,
  `ItemSlot33` int(11) NULL DEFAULT NULL,
  `ItemSlot34` int(11) NULL DEFAULT NULL,
  `ItemSlot35` int(11) NULL DEFAULT NULL,
  `ItemSlot36` int(11) NULL DEFAULT NULL,
  `ItemSlot37` int(11) NULL DEFAULT NULL,
  `ItemSlot38` int(11) NULL DEFAULT NULL,
  `ItemSlot39` int(11) NULL DEFAULT NULL,
  `ItemSlot40` int(11) NULL DEFAULT NULL,
  `ItemSlot41` int(11) NULL DEFAULT NULL,
  `ItemSlot42` int(11) NULL DEFAULT NULL,
  `ItemSlot43` int(11) NULL DEFAULT NULL,
  `ItemSlot44` int(11) NULL DEFAULT NULL,
  `ItemSlot45` int(11) NULL DEFAULT NULL,
  `ItemSlot46` int(11) NULL DEFAULT NULL,
  `ItemSlot47` int(11) NULL DEFAULT NULL,
  `ItemSlot48` int(11) NULL DEFAULT NULL,
  `ItemSlot49` int(11) NULL DEFAULT NULL,
  `ItemSlot50` int(11) NULL DEFAULT NULL,
  `PriceItem1` int(11) NULL DEFAULT NULL,
  `PriceItem2` int(11) NULL DEFAULT NULL,
  `PriceItem3` int(11) NULL DEFAULT NULL,
  `PriceItem4` int(11) NULL DEFAULT NULL,
  `PriceItem5` int(11) NULL DEFAULT NULL,
  `PriceItem6` int(11) NULL DEFAULT NULL,
  `PriceItem7` int(11) NULL DEFAULT NULL,
  `PriceItem8` int(11) NULL DEFAULT NULL,
  `PriceItem9` int(11) NULL DEFAULT NULL,
  `PriceItem10` int(11) NULL DEFAULT NULL,
  `PriceItem11` int(11) NULL DEFAULT NULL,
  `PriceItem12` int(11) NULL DEFAULT NULL,
  `PriceItem13` int(11) NULL DEFAULT NULL,
  `PriceItem14` int(11) NULL DEFAULT NULL,
  `PriceItem15` int(11) NULL DEFAULT NULL,
  `PriceItem16` int(11) NULL DEFAULT NULL,
  `PriceItem17` int(11) NULL DEFAULT NULL,
  `PriceItem18` int(11) NULL DEFAULT NULL,
  `PriceItem19` int(11) NULL DEFAULT NULL,
  `PriceItem20` int(11) NULL DEFAULT NULL,
  `PriceItem21` int(11) NULL DEFAULT NULL,
  `PriceItem22` int(11) NULL DEFAULT NULL,
  `PriceItem23` int(11) NULL DEFAULT NULL,
  `PriceItem24` int(11) NULL DEFAULT NULL,
  `PriceItem25` int(11) NULL DEFAULT NULL,
  `PriceItem26` int(11) NULL DEFAULT NULL,
  `PriceItem27` int(11) NULL DEFAULT NULL,
  `PriceItem28` int(11) NULL DEFAULT NULL,
  `PriceItem29` int(11) NULL DEFAULT NULL,
  `PriceItem30` int(11) NULL DEFAULT NULL,
  `PriceItem31` int(11) NULL DEFAULT NULL,
  `PriceItem32` int(11) NULL DEFAULT NULL,
  `PriceItem33` int(11) NULL DEFAULT NULL,
  `PriceItem34` int(11) NULL DEFAULT NULL,
  `PriceItem35` int(11) NULL DEFAULT NULL,
  `PriceItem36` int(11) NULL DEFAULT NULL,
  `PriceItem37` int(11) NULL DEFAULT NULL,
  `PriceItem38` int(11) NULL DEFAULT NULL,
  `PriceItem39` int(11) NULL DEFAULT NULL,
  `PriceItem40` int(11) NULL DEFAULT NULL,
  `PriceItem41` int(11) NULL DEFAULT NULL,
  `PriceItem42` int(11) NULL DEFAULT NULL,
  `PriceItem43` int(11) NULL DEFAULT NULL,
  `PriceItem44` int(11) NULL DEFAULT NULL,
  `PriceItem45` int(11) NULL DEFAULT NULL,
  `PriceItem46` int(11) NULL DEFAULT NULL,
  `PriceItem47` int(11) NULL DEFAULT NULL,
  `PriceItem48` int(11) NULL DEFAULT NULL,
  `PriceItem49` int(11) NULL DEFAULT NULL,
  `PriceItem50` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_247
-- ----------------------------

-- ----------------------------
-- Table structure for cleo
-- ----------------------------
DROP TABLE IF EXISTS `cleo`;
CREATE TABLE `cleo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `HashFile` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `UploadTime` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cleo
-- ----------------------------
INSERT INTO `cleo` VALUES (1, 'IntOperations.cleo', 'd41d8cd98f00b204e9800998ecf8427e', '2023-12-30 10:42:363');
INSERT INTO `cleo` VALUES (2, 'FileSystemOperations.cleo', 'dd32e5056f698a9b20f4067d478dc208', '2023-12-30 10:43:363');
INSERT INTO `cleo` VALUES (8, 'HudDisable.cs', '4fdb43549545a0dd2994613dca2f3369', '2024-03-28 09:54:87');

-- ----------------------------
-- Table structure for doors
-- ----------------------------
DROP TABLE IF EXISTS `doors`;
CREATE TABLE `doors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OwnerID` int(11) NULL DEFAULT -1,
  `Locked` int(11) NULL DEFAULT 0,
  `Admin` int(11) NULL DEFAULT 0,
  `Group` int(11) NULL DEFAULT -1,
  `VIP` int(11) NULL DEFAULT -1,
  `ExPosX` float(11, 0) NULL DEFAULT 0,
  `ExPosY` float NULL DEFAULT 0,
  `ExPosZ` float NULL DEFAULT 0,
  `InPosX` float NULL DEFAULT 0,
  `InPosY` float NULL DEFAULT 0,
  `InPosZ` float NULL DEFAULT 0,
  `PickupID` int(11) NULL DEFAULT 19132,
  `ExVW` int(11) NULL DEFAULT 0,
  `InVW` int(11) NULL DEFAULT 0,
  `ExInterior` int(11) NULL DEFAULT -1,
  `InInterior` int(11) NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doors
-- ----------------------------
INSERT INTO `doors` VALUES (1, 'Benh Vien 1', 0, 0, 0, 0, 0, 1172, -1323.6, 15.4035, 1425.16, 1469.53, 1010.91, 1240, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for hardwareid
-- ----------------------------
DROP TABLE IF EXISTS `hardwareid`;
CREATE TABLE `hardwareid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HardwareID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Status` int(11) NULL DEFAULT 0,
  `UpdateTime` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hardwareid
-- ----------------------------
INSERT INTO `hardwareid` VALUES (14, 'BFEBFBFF000806C12', 0, '2024-05-04 11:15:124');
INSERT INTO `hardwareid` VALUES (15, 'BFEBFBFF000806C1', 0, '2024-05-13 01:20:133');
INSERT INTO `hardwareid` VALUES (16, 'BFEBFBFF000806C12', 0, '2024-05-04 11:15:124');
INSERT INTO `hardwareid` VALUES (17, 'BFEBFBFF000806C12', 0, '2024-05-04 11:15:124');
INSERT INTO `hardwareid` VALUES (18, 'BFEBFBFF000806C12', 0, '2024-05-04 11:15:124');
INSERT INTO `hardwareid` VALUES (19, 'BFEBFBFF000806C12', 0, '2024-05-04 11:15:124');
INSERT INTO `hardwareid` VALUES (20, 'BFEBFBFF000806C12', 0, '2024-05-04 11:15:124');
INSERT INTO `hardwareid` VALUES (21, 'BFEBFBFF000806C12', 0, '2024-05-04 11:15:124');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `item` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (229, 31, 3, 1);
INSERT INTO `inventory` VALUES (230, 31, 5, 1);
INSERT INTO `inventory` VALUES (231, 31, 6, 4);

-- ----------------------------
-- Table structure for inventory_drop
-- ----------------------------
DROP TABLE IF EXISTS `inventory_drop`;
CREATE TABLE `inventory_drop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `posx` float(20, 11) NULL DEFAULT NULL,
  `posy` float(20, 11) NULL DEFAULT NULL,
  `posz` float(20, 11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inventory_drop
-- ----------------------------
INSERT INTO `inventory_drop` VALUES (159, 8, 10, 12, 1815.03002929688, -1612.48999023438, 13.38000011444);
INSERT INTO `inventory_drop` VALUES (160, 12, 10, 12, 1816.28002929688, -1613.01000976562, 13.38000011444);
INSERT INTO `inventory_drop` VALUES (161, 9, 10, 12, 2092.29003906250, -1748.23999023438, 13.39999961853);
INSERT INTO `inventory_drop` VALUES (162, 19, 1, 12, 2096.53002929688, -1768.67004394531, 13.56000041962);
INSERT INTO `inventory_drop` VALUES (163, 11, 10, 12, 2096.53002929688, -1768.67004394531, 13.71000003815);
INSERT INTO `inventory_drop` VALUES (167, 5, 1, 31, 1754.72998046875, -1895.43005371094, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (171, 13, 10, 31, 1754.72998046875, -1895.43005371094, 13.72999954224);
INSERT INTO `inventory_drop` VALUES (172, 18, 5, 31, 1754.72998046875, -1895.43005371094, 13.88000011444);
INSERT INTO `inventory_drop` VALUES (173, 22, 2, 31, 1754.50000000000, -1894.82995605469, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (174, 20, 10, 31, 1755.81005859375, -1895.11999511719, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (175, 3, 1, 31, 1756.06005859375, -1895.82995605469, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (176, 10, 5, 31, 1787.26000976562, -1898.13000488281, 13.39999961853);
INSERT INTO `inventory_drop` VALUES (177, 20, 5, 31, 1785.48999023438, -1899.66003417969, 13.39999961853);
INSERT INTO `inventory_drop` VALUES (178, 12, 1, 31, 1796.83996582031, -1911.63000488281, 13.39000034332);
INSERT INTO `inventory_drop` VALUES (179, 23, 1, 31, 1794.43005371094, -1895.91003417969, 13.39000034332);
INSERT INTO `inventory_drop` VALUES (180, 16, 9, 31, -1514.57995605469, 747.83001708984, 7.17999982834);
INSERT INTO `inventory_drop` VALUES (181, 23, 10, 31, 1402.42004394531, -1680.63000488281, 39.54000091553);
INSERT INTO `inventory_drop` VALUES (182, 20, 10, 31, 1402.75000000000, -1679.78002929688, 39.54000091553);
INSERT INTO `inventory_drop` VALUES (183, 0, 0, 31, 1402.39001464844, -1677.65002441406, 39.54000091553);
INSERT INTO `inventory_drop` VALUES (184, 3, 1, 31, 1403.88000488281, -1676.10998535156, 39.54000091553);
INSERT INTO `inventory_drop` VALUES (185, 15, 5, 31, 1403.42004394531, -1674.26000976562, 39.54000091553);
INSERT INTO `inventory_drop` VALUES (186, 8, 5, 31, 1401.32995605469, -1673.71997070312, 39.54000091553);
INSERT INTO `inventory_drop` VALUES (187, 16, 10, 31, 1402.43005371094, -1672.26000976562, 39.54000091553);

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `leader` int(11) NULL DEFAULT NULL,
  `birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT -1,
  `safe` int(11) NULL DEFAULT 0,
  `safe_dirty` int(11) NULL DEFAULT 0,
  `rank1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rank10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skin1` int(11) NULL DEFAULT 0,
  `skin2` int(11) NULL DEFAULT 0,
  `skin3` int(11) NULL DEFAULT 0,
  `skin4` int(11) NULL DEFAULT 0,
  `skin5` int(11) NULL DEFAULT 0,
  `skin6` int(11) NULL DEFAULT 0,
  `skin7` int(11) NULL DEFAULT 0,
  `skin8` int(11) NULL DEFAULT 0,
  `skin9` int(11) NULL DEFAULT 0,
  `skin10` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (2, '2', 31, '29-5-2024', '29-5-2024', 0, 100000, 50000, 'Giam doc', 'Pho giam doc', 'Truong khoa', 'Pho khoa', 'Ke toan', 'Bac si', 'Dieu duong', 'Y ta', 'Thu ngan', 'Bao ve', 274, 275, 276, 308, 0, 0, 0, 0, 0, 0);
INSERT INTO `organization` VALUES (3, '', 31, '0-0-0', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `organization` VALUES (4, 'DumeM', 31, '0-0-0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `organization` VALUES (5, 'CC', 31, '0-0-0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for organization_safe_gun
-- ----------------------------
DROP TABLE IF EXISTS `organization_safe_gun`;
CREATE TABLE `organization_safe_gun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NULL DEFAULT -1,
  `weapon` int(11) NULL DEFAULT -1,
  `ammo` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization_safe_gun
-- ----------------------------

-- ----------------------------
-- Table structure for orgvehs
-- ----------------------------
DROP TABLE IF EXISTS `orgvehs`;
CREATE TABLE `orgvehs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NULL DEFAULT NULL,
  `orgid` int(11) NULL DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_r` float NULL DEFAULT NULL,
  `lock` int(11) NULL DEFAULT 0,
  `paintjob` int(11) NULL DEFAULT 0,
  `color1` int(11) NULL DEFAULT 0,
  `color2` int(11) NULL DEFAULT 2,
  `fuel` int(11) NULL DEFAULT 0,
  `vw` int(11) NULL DEFAULT NULL,
  `int` int(11) NULL DEFAULT NULL,
  `health` int(11) NULL DEFAULT NULL,
  `odo` int(11) NULL DEFAULT NULL,
  `siren` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orgvehs
-- ----------------------------
INSERT INTO `orgvehs` VALUES (7, 416, 2, 1800.79, -1896.51, 13.4045, 220.856, 0, 0, 1, 1, 100, 0, 0, NULL, NULL, '1');

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccID` int(11) NULL DEFAULT -1,
  `PlayerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Khong co thong tin',
  `Cash` int(11) NULL DEFAULT 1000,
  `Health` float NULL DEFAULT 100,
  `Armour` float NULL DEFAULT 0,
  `Skin` int(11) NULL DEFAULT 299,
  `PosX` float NULL DEFAULT 1192,
  `PosY` float NULL DEFAULT -1292,
  `PosZ` float NULL DEFAULT 13,
  `PosA` float(11, 0) NULL DEFAULT 180,
  `TanSo` int(11) NULL DEFAULT 0,
  `AdminLevel` int(11) NULL DEFAULT 0,
  `LastLogin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00:00:00 00-00-0000',
  `Gender` int(11) NULL DEFAULT 0,
  `Level` int(11) NULL DEFAULT 0,
  `Interior` int(11) NULL DEFAULT 0,
  `VW` int(11) NULL DEFAULT 0,
  `QuocTich` int(11) NULL DEFAULT 0,
  `BirthDay` int(11) NULL DEFAULT 0,
  `BirthMonth` int(11) NULL DEFAULT 0,
  `BirthYear` int(11) NULL DEFAULT 0,
  `OrgID` int(11) NULL DEFAULT -1,
  `OrgRank` int(11) NULL DEFAULT -1,
  `Phone` int(11) NULL DEFAULT NULL,
  `DanhBa` int(11) NULL DEFAULT NULL,
  `Dice` int(11) NULL DEFAULT NULL,
  `CanXang` int(11) NULL DEFAULT NULL,
  `DayThung` int(11) NULL DEFAULT NULL,
  `XiGa` int(11) NULL DEFAULT NULL,
  `Drink` int(11) NULL DEFAULT NULL,
  `BinhSonXe` int(11) NULL DEFAULT NULL,
  `Radio` int(11) NULL DEFAULT NULL,
  `MatNa` int(11) NULL DEFAULT NULL,
  `Eat` int(11) NULL DEFAULT 50,
  `Bank` int(11) NULL DEFAULT 0,
  `BankSaving` int(11) NULL DEFAULT 0,
  `HoursSaving` int(11) NULL DEFAULT NULL,
  `ChiaKhoaXe` int(11) NOT NULL DEFAULT -1,
  `Refer` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Injured` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (31, 0, 'Khoi_Nguyenz', 'dep traii', 943100, 77, 100, 3, 1829.29, -1561.77, 13.5164, 221, 0, 10, '\r2:47:50 6-21-2024', 1, 0, 1, 0, 1, 15, 11, 2008, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 42900, 15000, 0, -1, 'NULL', 0);
INSERT INTO `players` VALUES (46, 0, 'Ngoc_Linh', 'Khong co thong tin', 1000, 100, 0, 299, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0);
INSERT INTO `players` VALUES (47, 0, 'Hacker_Ne', 'Khong co thong tin', 1000, 100, 0, 299, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0);
INSERT INTO `players` VALUES (48, 0, 'Hacker_Nedumem', 'dep traiidume m beo vcl ', 1000, 100, 0, 15, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 1, 0, 0, 0, 1, 15, 11, 1998, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0);
INSERT INTO `players` VALUES (49, 0, 'Hello_SSA', 'Khong co thong tin', 1000, 100, 0, 299, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0);
INSERT INTO `players` VALUES (50, 0, 'CC_NE', 'Khong co thong tin', 1000, 100, 0, 299, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0);
INSERT INTO `players` VALUES (51, 0, 'Khoi_Bi', 'Beo du vu cmm', 1000, 100, 0, 11, 1465.72, -1652.15, 14.5469, 61, 0, 0, '1:10:54 6-17-2024', 1, 0, 0, 0, 1, 12, 8, 1999, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, -1, 'NULL', 0);
INSERT INTO `players` VALUES (52, 0, 'Hack_Monkey', 'dep traiiDume SSA hay vclll', 1000, 100, 0, 5, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 1, 0, 0, 0, 1, 15, 11, 1992, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0);
INSERT INTO `players` VALUES (53, 0, 'Khanh_Nguyen', '', 1000, 100, 0, 0, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(11) NOT NULL,
  `forum` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ucp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cache` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `guide` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update` varchar(2550) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `news` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of settings
-- ----------------------------

-- ----------------------------
-- Table structure for veh_trunk
-- ----------------------------
DROP TABLE IF EXISTS `veh_trunk`;
CREATE TABLE `veh_trunk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehid` int(11) NULL DEFAULT NULL,
  `item` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of veh_trunk
-- ----------------------------

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqlid` int(11) NULL DEFAULT NULL,
  `model` int(11) NULL DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_r` float NULL DEFAULT NULL,
  `lock` int(11) NULL DEFAULT 0,
  `paintjob` int(11) NULL DEFAULT 0,
  `color1` int(11) NULL DEFAULT 0,
  `color2` int(11) NULL DEFAULT 2,
  `ticket` int(11) NULL DEFAULT 0,
  `restricted` int(11) NULL DEFAULT 0,
  `fuel` int(11) NULL DEFAULT 0,
  `impound` int(11) NULL DEFAULT 0,
  `vw` int(11) NULL DEFAULT NULL,
  `int` int(11) NULL DEFAULT NULL,
  `health` int(11) NULL DEFAULT NULL,
  `odo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES (1, 31, 3166, 1792.33, -1913.03, 13.396, 268.187, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1500, 100);
INSERT INTO `vehicle` VALUES (2, 31, 3166, 1792.33, -1913.03, 13.396, 268.187, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1500, 100);
INSERT INTO `vehicle` VALUES (3, 31, 3166, 1792.33, -1913.03, 13.396, 268.187, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1500, 100);
INSERT INTO `vehicle` VALUES (4, 31, 3166, 1792.33, -1913.03, 13.396, 268.187, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1500, 100);
INSERT INTO `vehicle` VALUES (5, 31, 3166, 1792.33, -1913.03, 13.396, 268.187, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1500, 100);
INSERT INTO `vehicle` VALUES (6, 31, 3166, 1792.33, -1913.03, 13.396, 268.187, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1500, 100);

SET FOREIGN_KEY_CHECKS = 1;
