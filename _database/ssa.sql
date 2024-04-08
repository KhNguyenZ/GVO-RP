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

 Date: 31/03/2024 19:28:55
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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (11, 'Khoi_Nguyen', 'nguyen', NULL, NULL, NULL, 'Khoi_Nguyenz', 'Tao nhan vat', 'Tao nhan vat');
INSERT INTO `accounts` VALUES (12, 'Khoi_Nguyenz', 'nguyen', NULL, NULL, NULL, 'Jey_BEE', 'Tao nhan vat', 'Tao nhan vat');

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
INSERT INTO `doors` VALUES (1, '0', NULL, 0, 0, NULL, NULL, 1787, -1909.54, 13.405, NULL, NULL, NULL, 19135, 0, 0, -1, -1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (169, 31, 10, 1);
INSERT INTO `inventory` VALUES (170, 31, 12, 1);
INSERT INTO `inventory` VALUES (211, 31, 16, 10);
INSERT INTO `inventory` VALUES (212, 31, 20, 10);
INSERT INTO `inventory` VALUES (214, 31, 23, 10);
INSERT INTO `inventory` VALUES (215, 31, 23, 1);
INSERT INTO `inventory` VALUES (216, 31, 23, 1);
INSERT INTO `inventory` VALUES (217, 31, 0, 0);
INSERT INTO `inventory` VALUES (218, 31, 3, 1);
INSERT INTO `inventory` VALUES (219, 31, 3, 1);
INSERT INTO `inventory` VALUES (220, 31, 23, 1);
INSERT INTO `inventory` VALUES (221, 31, 20, 10);
INSERT INTO `inventory` VALUES (222, 31, 23, 10);
INSERT INTO `inventory` VALUES (224, 31, 15, 5);
INSERT INTO `inventory` VALUES (225, 31, 20, 10);
INSERT INTO `inventory` VALUES (227, 31, 8, 5);
INSERT INTO `inventory` VALUES (228, 31, 16, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `leader` int(11) NULL DEFAULT NULL,
  `birth` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT -1,
  `safe` int(11) NULL DEFAULT NULL,
  `safe_dirty` int(11) NULL DEFAULT NULL,
  `rank1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank4` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank5` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank6` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank7` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank8` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank9` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rank10` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, 'Test', 31, '29-3-2024', 'logo:logo', 2, 10000, 10000, 'Ong trum', 'Pho Bang', 'Pho Bang 2', 'Dai Ca', 'Linh', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for organization_safe_gun
-- ----------------------------
DROP TABLE IF EXISTS `organization_safe_gun`;
CREATE TABLE `organization_safe_gun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NULL DEFAULT NULL,
  `weapon` int(11) NULL DEFAULT NULL,
  `ammo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization_safe_gun
-- ----------------------------

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
  `Interior` int(11) NULL DEFAULT -1,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (31, 0, 'Khoi_Nguyenz', 'dep traii', 1000, 100, 0, 3, 1764.56, -1898.66, 13.5638, 254, 0, 0, '00:00:00 00-00-0000', 1, 0, 0, 0, 1, 15, 11, 2008, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `players` VALUES (32, 0, 'Jey_BEE', '', 1000, 100, 0, 1, 1192, -1292, 13, 180, 0, 0, '00:00:00 00-00-0000', 1, 0, -1, 0, 1, 1, 1, 2010, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO `vehicle` VALUES (1, 31, 411, 1788.34, -1907.33, 13.3954, 235.956, 0, 0, 1, 1, 0, 0, 1109393408, 0, 0, 0, 3000, 100);
INSERT INTO `vehicle` VALUES (2, 31, 411, 1768.57, -1895.88, 13.5634, 209.1, 0, 0, 11, 1, 0, 0, 100, 0, 0, 0, 3000, 100);
INSERT INTO `vehicle` VALUES (3, 31, 411, 1779.5, -1902.61, 13.3889, 245.026, 0, 0, 11, 1, 0, 0, 100, 0, 0, 0, 3000, 100);
INSERT INTO `vehicle` VALUES (4, 31, 411, 1779.5, -1902.61, 13.3889, 245.026, 0, 0, 11, 1, 0, 0, 100, 0, 0, 0, 3000, 100);
INSERT INTO `vehicle` VALUES (5, 31, 3145, 1788.85, -1906.37, 13.3958, 291.95, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 3000, 100);
INSERT INTO `vehicle` VALUES (6, 31, 3166, 1792.33, -1913.03, 13.396, 268.187, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1500, 100);

SET FOREIGN_KEY_CHECKS = 1;