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

 Date: 18/02/2024 00:25:02
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (11, 'Khoi_Nguyen', 'nguyen', NULL, NULL, NULL, 'Khoi_Nguyenz', 'Tao nhan vat', 'Tao nhan vat');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for doors
-- ----------------------------
DROP TABLE IF EXISTS `doors`;
CREATE TABLE `doors`  (
  `id` int(11) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OwnerID` int(11) NULL DEFAULT NULL,
  `Locked` int(11) NULL DEFAULT 0,
  `Admin` int(11) NULL DEFAULT 0,
  `Group` int(11) NULL DEFAULT NULL,
  `VIP` int(11) NULL DEFAULT NULL,
  `ExPosX` float(11, 0) NULL DEFAULT NULL,
  `ExPosY` float NULL DEFAULT NULL,
  `ExPosZ` float NULL DEFAULT NULL,
  `InPosX` float NULL DEFAULT NULL,
  `InPosY` float NULL DEFAULT NULL,
  `InPosZ` float NULL DEFAULT NULL,
  `PickupID` int(11) NULL DEFAULT 19132,
  `ExVW` int(11) NULL DEFAULT 0,
  `InVW` int(11) NULL DEFAULT 0,
  `ExInterior` int(11) NULL DEFAULT -1,
  `InInterior` int(11) NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doors
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (116, 31, 1, 10);
INSERT INTO `inventory` VALUES (117, 31, 2, 10);
INSERT INTO `inventory` VALUES (119, 31, 4, 10);
INSERT INTO `inventory` VALUES (120, 31, 5, 10);
INSERT INTO `inventory` VALUES (121, 31, 6, 10);
INSERT INTO `inventory` VALUES (122, 31, 7, 10);
INSERT INTO `inventory` VALUES (125, 31, 10, 10);
INSERT INTO `inventory` VALUES (129, 31, 14, 10);
INSERT INTO `inventory` VALUES (130, 31, 15, 10);
INSERT INTO `inventory` VALUES (132, 31, 17, 10);
INSERT INTO `inventory` VALUES (133, 31, 18, 10);
INSERT INTO `inventory` VALUES (134, 31, 19, 10);
INSERT INTO `inventory` VALUES (136, 31, 21, 10);
INSERT INTO `inventory` VALUES (137, 31, 22, 10);
INSERT INTO `inventory` VALUES (138, 31, 23, 10);
INSERT INTO `inventory` VALUES (139, 31, 12, 10);
INSERT INTO `inventory` VALUES (142, 31, 16, 3);
INSERT INTO `inventory` VALUES (143, 31, 3, 5);
INSERT INTO `inventory` VALUES (144, 31, 22, 2);
INSERT INTO `inventory` VALUES (145, 31, 12, 76);
INSERT INTO `inventory` VALUES (146, 31, 10, 49);
INSERT INTO `inventory` VALUES (147, 31, 15, 14);
INSERT INTO `inventory` VALUES (148, 31, 22, 60);
INSERT INTO `inventory` VALUES (149, 31, 11, 26);
INSERT INTO `inventory` VALUES (150, 31, 20, 10);
INSERT INTO `inventory` VALUES (151, 31, 11, 46);
INSERT INTO `inventory` VALUES (152, 31, 8, 44);
INSERT INTO `inventory` VALUES (153, 31, 12, 57);
INSERT INTO `inventory` VALUES (154, 31, 4, 19);
INSERT INTO `inventory` VALUES (155, 31, 10, 23);
INSERT INTO `inventory` VALUES (156, 31, 3, 91);
INSERT INTO `inventory` VALUES (157, 31, 8, 80);
INSERT INTO `inventory` VALUES (158, 31, 20, 74);
INSERT INTO `inventory` VALUES (159, 31, 14, 66);
INSERT INTO `inventory` VALUES (160, 31, 4, 11);
INSERT INTO `inventory` VALUES (161, 31, 17, 78);
INSERT INTO `inventory` VALUES (162, 31, 14, 77);
INSERT INTO `inventory` VALUES (163, 31, 22, 46);
INSERT INTO `inventory` VALUES (164, 31, 22, 2);
INSERT INTO `inventory` VALUES (165, 31, 12, 76);
INSERT INTO `inventory` VALUES (166, 31, 10, 49);
INSERT INTO `inventory` VALUES (167, 31, 15, 14);
INSERT INTO `inventory` VALUES (168, 31, 22, 60);

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
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inventory_drop
-- ----------------------------
INSERT INTO `inventory_drop` VALUES (158, 3, 10, 12, 1820.19995117188, -1601.70996093750, 13.35999965668);
INSERT INTO `inventory_drop` VALUES (159, 8, 10, 12, 1815.03002929688, -1612.48999023438, 13.38000011444);
INSERT INTO `inventory_drop` VALUES (160, 12, 10, 12, 1816.28002929688, -1613.01000976562, 13.38000011444);
INSERT INTO `inventory_drop` VALUES (161, 9, 10, 12, 2092.29003906250, -1748.23999023438, 13.39999961853);
INSERT INTO `inventory_drop` VALUES (162, 19, 1, 12, 2096.53002929688, -1768.67004394531, 13.56000041962);
INSERT INTO `inventory_drop` VALUES (163, 11, 10, 12, 2096.53002929688, -1768.67004394531, 13.71000003815);
INSERT INTO `inventory_drop` VALUES (164, 23, 10, 31, 1773.66003417969, -1899.16003417969, 13.56999969482);
INSERT INTO `inventory_drop` VALUES (165, 20, 10, 31, 1786.07995605469, -1898.66003417969, 13.39999961853);
INSERT INTO `inventory_drop` VALUES (166, 23, 1, 31, 1801.52001953125, -1900.51000976562, 13.40999984741);
INSERT INTO `inventory_drop` VALUES (167, 5, 1, 31, 1754.72998046875, -1895.43005371094, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (168, 16, 10, 31, 1758.01000976562, -1895.57995605469, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (169, 3, 1, 31, 1762.18005371094, -1895.29003906250, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (170, 20, 10, 31, 1766.47998046875, -1895.61999511719, 13.57999992371);
INSERT INTO `inventory_drop` VALUES (171, 13, 10, 31, 1754.72998046875, -1895.43005371094, 13.72999954224);
INSERT INTO `inventory_drop` VALUES (172, 18, 5, 31, 1754.72998046875, -1895.43005371094, 13.88000011444);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (31, 0, 'Khoi_Nguyenz', 'dep traii', 1000, 100, 0, 3, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 1, 0, 0, 0, 1, 15, 11, 2008);

SET FOREIGN_KEY_CHECKS = 1;
