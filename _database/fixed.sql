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

 Date: 17/08/2024 23:55:48
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
  `OTP` int(11) NULL DEFAULT 0,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email_Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Email_Status` int(11) NULL DEFAULT 0,
  `PendingActive` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (11, 'Khoi_Nguyen', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Khoi_Nguyenz', 'CCCC_CC', 'Tao nhan vat', '992137033449480203', '0', 1, NULL, 123, 'knguyen151108@gmail.com', '273765', 0, 1);
INSERT INTO `accounts` VALUES (12, 'Khoi_Nguyenz', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Khoi_NguyenZt', 'Jey_Bee_D', 'Tao nhan vat', '-1', '489948', 0, 0, 916630, 'Undefine', '0', 1, 1);
INSERT INTO `accounts` VALUES (13, 'Adminz', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', '0', 1, 1);
INSERT INTO `accounts` VALUES (14, 'Account_Test', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', '0', 0, 0, NULL, 'Undefine', '0', 1, 1);
INSERT INTO `accounts` VALUES (15, 'Admin_Test', '', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', '0', 1, 1);
INSERT INTO `accounts` VALUES (16, 'Khoi_Nguyenfasd', '', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (17, 'Khoi_Nguyenfasdasf', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (18, 'DumeM', 'cccccc', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (19, 'Khoi_Nguyenzzzz', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (20, 'Khoi_Nguyenzzzadz', 'egegwrgwe', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (21, 'Khoi_Nguyensdfsdf', 'cc@gmail.com', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (22, 'Khoi_Nguyenzz', '', '2024-08-08 03:44:220', 'Undefine', NULL, 'Hacker_Nedumem', 'Hello_SSA', 'CC_NE', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (23, 'Khoi_Nguyendadf', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (24, 'Jey_BeeD', 'nguyen', '2024-08-08 03:44:220', 'Undefine', NULL, 'Khanh_Nguyen', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (25, 'Khoi_Nguyenzzz', '', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (26, 'Hack_Monkey', '', '2024-08-08 03:44:220', 'Undefine', NULL, 'cc_zz', 'Tao nhan vat', 'Tao nhan vat', '1215256287944773715', '64390', 0, 0, NULL, 'Undefine', 'Undefine', 0, 1);
INSERT INTO `accounts` VALUES (27, 'admin', 'adminz', '2024-08-08 03:44:220', 'Undefine', NULL, 'Tao nhan vat', 'Tao nhan vat', 'Tao nhan vat', '-1', 'Undefine', 0, 0, NULL, 'kngyen205@gmail.com', 'Undefine', 0, 0);

-- ----------------------------
-- Table structure for biz
-- ----------------------------
DROP TABLE IF EXISTS `biz`;
CREATE TABLE `biz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NULL DEFAULT 0,
  `ExPosX` float(11, 0) NULL DEFAULT 0,
  `ExPosY` float NULL DEFAULT 0,
  `ExPosZ` float NULL DEFAULT 0,
  `Locked` int(11) NULL DEFAULT 0,
  `OwnerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Undefine',
  `InPosX` float NULL DEFAULT 0,
  `InPosY` float NULL DEFAULT 0,
  `InPosZ` float NULL DEFAULT 0,
  `ExVW` int(11) NULL DEFAULT 0,
  `InVW` int(11) NULL DEFAULT 0,
  `ExInterior` int(11) NULL DEFAULT 0,
  `InInterior` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz
-- ----------------------------
INSERT INTO `biz` VALUES (1, 'Cua hang tien loi', 1, 1929, -1776.12, 13.5469, 0, 'KhNguyenZ', 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for biz_247
-- ----------------------------
DROP TABLE IF EXISTS `biz_247`;
CREATE TABLE `biz_247`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `BizID` int(11) NULL DEFAULT 0,
  `ItemSlot1` int(11) NULL DEFAULT 0,
  `ItemSlot2` int(11) NULL DEFAULT 0,
  `ItemSlot3` int(11) NULL DEFAULT 0,
  `ItemSlot4` int(11) NULL DEFAULT 0,
  `ItemSlot5` int(11) NULL DEFAULT 0,
  `ItemSlot6` int(11) NULL DEFAULT 0,
  `ItemSlot7` int(11) NULL DEFAULT 0,
  `ItemSlot8` int(11) NULL DEFAULT 0,
  `ItemSlot9` int(11) NULL DEFAULT 0,
  `ItemSlot10` int(11) NULL DEFAULT 0,
  `ItemSlot11` int(11) NULL DEFAULT 0,
  `ItemSlot12` int(11) NULL DEFAULT 0,
  `ItemSlot13` int(11) NULL DEFAULT 0,
  `ItemSlot14` int(11) NULL DEFAULT 0,
  `ItemSlot15` int(11) NULL DEFAULT 0,
  `ItemSlot16` int(11) NULL DEFAULT 0,
  `ItemSlot17` int(11) NULL DEFAULT 0,
  `ItemSlot18` int(11) NULL DEFAULT 0,
  `ItemSlot19` int(11) NULL DEFAULT 0,
  `ItemSlot20` int(11) NULL DEFAULT 0,
  `ItemSlot21` int(11) NULL DEFAULT 0,
  `ItemSlot22` int(11) NULL DEFAULT 0,
  `ItemSlot23` int(11) NULL DEFAULT 0,
  `ItemSlot24` int(11) NULL DEFAULT 0,
  `ItemSlot25` int(11) NULL DEFAULT 0,
  `ItemSlot26` int(11) NULL DEFAULT 0,
  `ItemSlot27` int(11) NULL DEFAULT 0,
  `ItemSlot28` int(11) NULL DEFAULT 0,
  `ItemSlot29` int(11) NULL DEFAULT 0,
  `ItemSlot30` int(11) NULL DEFAULT 0,
  `ItemSlot31` int(11) NULL DEFAULT 0,
  `ItemSlot32` int(11) NULL DEFAULT 0,
  `ItemSlot33` int(11) NULL DEFAULT 0,
  `ItemSlot34` int(11) NULL DEFAULT 0,
  `ItemSlot35` int(11) NULL DEFAULT 0,
  `ItemSlot36` int(11) NULL DEFAULT 0,
  `ItemSlot37` int(11) NULL DEFAULT 0,
  `ItemSlot38` int(11) NULL DEFAULT 0,
  `ItemSlot39` int(11) NULL DEFAULT 0,
  `ItemSlot40` int(11) NULL DEFAULT 0,
  `ItemSlot41` int(11) NULL DEFAULT 0,
  `ItemSlot42` int(11) NULL DEFAULT 0,
  `ItemSlot43` int(11) NULL DEFAULT 0,
  `ItemSlot44` int(11) NULL DEFAULT 0,
  `ItemSlot45` int(11) NULL DEFAULT 0,
  `ItemSlot46` int(11) NULL DEFAULT 0,
  `ItemSlot47` int(11) NULL DEFAULT 0,
  `ItemSlot48` int(11) NULL DEFAULT 0,
  `ItemSlot49` int(11) NULL DEFAULT 0,
  `ItemSlot50` int(11) NULL DEFAULT 0,
  `PriceItem1` int(11) NULL DEFAULT 0,
  `PriceItem2` int(11) NULL DEFAULT 0,
  `PriceItem3` int(11) NULL DEFAULT 0,
  `PriceItem4` int(11) NULL DEFAULT 0,
  `PriceItem5` int(11) NULL DEFAULT 0,
  `PriceItem6` int(11) NULL DEFAULT 0,
  `PriceItem7` int(11) NULL DEFAULT 0,
  `PriceItem8` int(11) NULL DEFAULT 0,
  `PriceItem9` int(11) NULL DEFAULT 0,
  `PriceItem10` int(11) NULL DEFAULT 0,
  `PriceItem11` int(11) NULL DEFAULT 0,
  `PriceItem12` int(11) NULL DEFAULT 0,
  `PriceItem13` int(11) NULL DEFAULT 0,
  `PriceItem14` int(11) NULL DEFAULT 0,
  `PriceItem15` int(11) NULL DEFAULT 0,
  `PriceItem16` int(11) NULL DEFAULT 0,
  `PriceItem17` int(11) NULL DEFAULT 0,
  `PriceItem18` int(11) NULL DEFAULT 0,
  `PriceItem19` int(11) NULL DEFAULT 0,
  `PriceItem20` int(11) NULL DEFAULT 0,
  `PriceItem21` int(11) NULL DEFAULT 0,
  `PriceItem22` int(11) NULL DEFAULT 0,
  `PriceItem23` int(11) NULL DEFAULT 0,
  `PriceItem24` int(11) NULL DEFAULT 0,
  `PriceItem25` int(11) NULL DEFAULT 0,
  `PriceItem26` int(11) NULL DEFAULT 0,
  `PriceItem27` int(11) NULL DEFAULT 0,
  `PriceItem28` int(11) NULL DEFAULT 0,
  `PriceItem29` int(11) NULL DEFAULT 0,
  `PriceItem30` int(11) NULL DEFAULT 0,
  `PriceItem31` int(11) NULL DEFAULT 0,
  `PriceItem32` int(11) NULL DEFAULT 0,
  `PriceItem33` int(11) NULL DEFAULT 0,
  `PriceItem34` int(11) NULL DEFAULT 0,
  `PriceItem35` int(11) NULL DEFAULT 0,
  `PriceItem36` int(11) NULL DEFAULT 0,
  `PriceItem37` int(11) NULL DEFAULT 0,
  `PriceItem38` int(11) NULL DEFAULT 0,
  `PriceItem39` int(11) NULL DEFAULT 0,
  `PriceItem40` int(11) NULL DEFAULT 0,
  `PriceItem41` int(11) NULL DEFAULT 0,
  `PriceItem42` int(11) NULL DEFAULT 0,
  `PriceItem43` int(11) NULL DEFAULT 0,
  `PriceItem44` int(11) NULL DEFAULT 0,
  `PriceItem45` int(11) NULL DEFAULT 0,
  `PriceItem46` int(11) NULL DEFAULT 0,
  `PriceItem47` int(11) NULL DEFAULT 0,
  `PriceItem48` int(11) NULL DEFAULT 0,
  `PriceItem49` int(11) NULL DEFAULT 0,
  `PriceItem50` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_247
-- ----------------------------

-- ----------------------------
-- Table structure for bot_discord
-- ----------------------------
DROP TABLE IF EXISTS `bot_discord`;
CREATE TABLE `bot_discord`  (
  `id` int(11) NOT NULL,
  `action` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bot_discord
-- ----------------------------
INSERT INTO `bot_discord` VALUES (0, 'givemoney', '0', 'playerid=0');
INSERT INTO `bot_discord` VALUES (1, 'ban', '1', 'playerid=0');
INSERT INTO `bot_discord` VALUES (2, 'baotrisv', '0', '');
INSERT INTO `bot_discord` VALUES (3, 'kick', '0', 'playerid=1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2159 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cleo
-- ----------------------------
INSERT INTO `cleo` VALUES (1501, 'audio.asi', 'b804a9b5f0d288c78cf41180361a8c39', NULL);
INSERT INTO `cleo` VALUES (1502, 'bass.dll', '8f5b9b73d33e8c99202b5058cb6dce51', NULL);
INSERT INTO `cleo` VALUES (1503, 'bass.lib', '9c17d5e7c546fac1ffa7811d8a713b5c', NULL);
INSERT INTO `cleo` VALUES (1504, 'bass_fx.dll', 'e7f4494bdf7b1c49a303fe56c6b52dc9', NULL);
INSERT INTO `cleo` VALUES (1505, 'bass_fx.lib', '05953a0356b74b1b3943a71182ff2ae1', NULL);
INSERT INTO `cleo` VALUES (1506, 'cleo.asi', '7d47a3c3fcabcf741c864076b327f252', NULL);
INSERT INTO `cleo` VALUES (1507, 'dinput8.dll', '87e56407a5c0c933b5630cc01822b78c', NULL);
INSERT INTO `cleo` VALUES (1508, 'discord-plugin.asi', 'a5ec888f7b0f463d84e19bb76955026b', NULL);
INSERT INTO `cleo` VALUES (1509, 'eax.dll', '309d860fc8137e5fe9e7056c33b4b8be', NULL);
INSERT INTO `cleo` VALUES (1510, 'freetype.dll', 'ff6fed4ba3e572b0ec0cd0f437ffca1f', NULL);
INSERT INTO `cleo` VALUES (1511, 'lua51.dll', '3dff7448b43fcfb4dc65e0040b0ffb88', NULL);
INSERT INTO `cleo` VALUES (1512, 'MoonLoader.asi', '90f5fad196f55f134f882d4c7df848c2', NULL);
INSERT INTO `cleo` VALUES (1513, 'NormalMapFix.asi', '479f790d850aa208a73787411c1df97e', NULL);
INSERT INTO `cleo` VALUES (1514, 'ogg.dll', '0602f672ba595716e64ec4040e6de376', NULL);
INSERT INTO `cleo` VALUES (1515, 'opus.lib', '87ff04134b28b723ce800c31e9c69774', NULL);
INSERT INTO `cleo` VALUES (1516, 'OutFitFix.asi', '795df56453ab16ed321a3937efa33d82', NULL);
INSERT INTO `cleo` VALUES (1517, 'samp-cursor-patch.asi', 'ad70bcb5b3751922d3362568e300e8cd', NULL);
INSERT INTO `cleo` VALUES (1518, 'SAMP-GPS.asi', 'ab94d4fe1531450256433adcf72e17e2', NULL);
INSERT INTO `cleo` VALUES (1519, 'samp.asi', 'c56bd8e899daaf32b6f01e5ed1753323', NULL);
INSERT INTO `cleo` VALUES (1520, 'samp.dll', '1d22eaa2605717ddf215f68e861de378', NULL);
INSERT INTO `cleo` VALUES (1521, 'sampar.dll', '485b790ab3500735810122f2c53f308e', NULL);
INSERT INTO `cleo` VALUES (1522, 'SAMPFUNCS.asi', '181e79281ae5335eacf646d284f91b1d', NULL);
INSERT INTO `cleo` VALUES (1523, 'SAMPGraphicRestore.asi', 'f71c26dfcdcf70615ba63eec031e5921', NULL);
INSERT INTO `cleo` VALUES (1525, 'ShellFix.asi', '9d337b486160ab57eb1f3d980b4d98cb', NULL);
INSERT INTO `cleo` VALUES (1526, 'StreamMemFix.asi', '2e8712c56f19f92f7f74f2d0c76f9c5f', NULL);
INSERT INTO `cleo` VALUES (1527, 'vorbis.dll', '2840f08dd9753a5b13c60d6d1c165c9a', NULL);
INSERT INTO `cleo` VALUES (1528, 'vorbisFile.dll', '90223f6248b55e0813687fe1b7277dd7', NULL);
INSERT INTO `cleo` VALUES (1529, 'vorbisHooked.dll', '2b7b803311d2b228f065c45d13e1aeb2', NULL);
INSERT INTO `cleo` VALUES (1530, '_chat.asi', 'c5e240ff5b98f1d35601aa01a30e5d8a', NULL);
INSERT INTO `cleo` VALUES (1531, '_dialogs.asi', 'd729b4c8b674ed8806995a16ee9841fc', NULL);
INSERT INTO `cleo` VALUES (1532, 'HudDisable.cs', '4fdb43549545a0dd2994613dca2f3369', NULL);
INSERT INTO `cleo` VALUES (1533, 'SA.Audio.cleo', 'f25d29c88947786ab8acf513c8e284c0', NULL);
INSERT INTO `cleo` VALUES (1534, 'SA.DebugUtils.cleo', '186f82490c168c4c2163cdbca7c07b7f', NULL);
INSERT INTO `cleo` VALUES (1535, 'SA.FileSystemOperations.cleo', '6ec153f5931220102b33fb6e070af4de', NULL);
INSERT INTO `cleo` VALUES (1536, 'SA.IniFiles.cleo', 'adf4a6e23a7338c69640237ac4cb25c3', NULL);
INSERT INTO `cleo` VALUES (1537, 'SA.Math.cleo', 'd9939b20d48f996bb4a21b47a18a5efa', NULL);
INSERT INTO `cleo` VALUES (1538, 'SA.MemoryOperations.cleo', '0f806ba4c2b41828aefcde8e90ee5869', NULL);
INSERT INTO `cleo` VALUES (1539, 'SA.Text.cleo', '2f637e386f062869a0a055bb546e7906', NULL);
INSERT INTO `cleo` VALUES (1540, 'audio.dll', '92695f522950963c21ed34337fba7ded', NULL);
INSERT INTO `cleo` VALUES (1541, 'audiowpm.dll', '68c177a250c7812619ba174b3c705e32', NULL);
INSERT INTO `cleo` VALUES (1542, 'bassmix.dll', '4f1ea0f70827b33e149eae318426dd4a', NULL);
INSERT INTO `cleo` VALUES (1543, 'bassflac.dll', '50af8a7d49e83a723ed0f70fb682dcfb', NULL);
INSERT INTO `cleo` VALUES (1544, 'bassmidi.dll', 'ea8c604153561e1e20cbc471696533fc', NULL);
INSERT INTO `cleo` VALUES (1545, 'basswma.dll', '7b52be6d702aa590db57a0e135f81c45', NULL);
INSERT INTO `cleo` VALUES (1546, 'basswv.dll', '4304c0e41adc990c05042b5aef6a9e08', NULL);
INSERT INTO `cleo` VALUES (1547, 'bass_aac.dll', '99b7b694e20e084d4921da3a268f75f8', NULL);
INSERT INTO `cleo` VALUES (1548, 'bass_ac3.dll', 'e0b7b3b23e1ad4bfbe9c29964e377cc5', NULL);
INSERT INTO `cleo` VALUES (1549, 'bass_alac.dll', '5bb5a6d220e404f8e8e26baad6ed8f9a', NULL);
INSERT INTO `cleo` VALUES (1550, 'bass_ape.dll', '8b18088f73934fccc933be1124231d45', NULL);
INSERT INTO `cleo` VALUES (1551, 'bass_mpc.dll', '52420b97e59b525adef27bf51983f036', NULL);
INSERT INTO `cleo` VALUES (1552, 'bass_spx.dll', '2f4db4ee83e4a442b6c1df571f17ea98', NULL);
INSERT INTO `cleo` VALUES (1553, 'bass_tta.dll', '4ad2d66e10aaa0ffe4c7a4f46eadbb56', NULL);
INSERT INTO `cleo` VALUES (1557, 'base64.dll', 'a7b7ce324277ff19d9ba081c4dfdcb1d', NULL);
INSERT INTO `cleo` VALUES (1564, 'cimguidx9.dll', '91070687e0371ad99e5b605fcf37cd2c', NULL);
INSERT INTO `cleo` VALUES (1565, 'cjson.dll', '1607c33badd1e7b251c366d9d15fc180', NULL);
INSERT INTO `cleo` VALUES (1566, 'clipboard.dll', '2ff9eb8127d3ab79e6b4601c9de80a3a', NULL);
INSERT INTO `cleo` VALUES (1571, 'crypto_lua.dll', 'a93d2eb331f3c3e03d5ee5542f3ace9f', NULL);
INSERT INTO `cleo` VALUES (1572, 'des56.dll', '224ca42d9235d97e276b77b126b1f355', NULL);
INSERT INTO `cleo` VALUES (1587, 'iconv.dll', '74993aad19b374b60b969365f7ef995e', NULL);
INSERT INTO `cleo` VALUES (1599, 'lfs.dll', '6e7fff2b9f20c39fb9bd503e96a7dee0', NULL);
INSERT INTO `cleo` VALUES (1600, 'libeffil.dll', '349ba1ed36a4f844e0ef86bae81f2a82', NULL);
INSERT INTO `cleo` VALUES (1601, 'libmcrypt.dll', '31727051d9d8f48f2298785e93350738', NULL);
INSERT INTO `cleo` VALUES (1605, 'lua-utf8.dll', '7723b0e41bbbbf099965ebf14324f74d', NULL);
INSERT INTO `cleo` VALUES (1618, 'MoonAdditions.dll', '89e89c583307a602f7dcbbae1a2f46de', NULL);
INSERT INTO `cleo` VALUES (1619, 'MoonBot.dll', '2cb738bb05f7684b6f554bd06cb9b18b', NULL);
INSERT INTO `cleo` VALUES (1620, 'MoonBot_DEMO.dll', '679c1e0dba4ca9f87343bfac84409140', NULL);
INSERT INTO `cleo` VALUES (1621, 'MoonImGui.dll', '5b502bc4ef9be79d588adc11bf692b33', NULL);
INSERT INTO `cleo` VALUES (1625, 'PingAmplifier.dll', '683efaf0c3e1e26b24c21204fb535b45', NULL);
INSERT INTO `cleo` VALUES (1628, 'RakLuaDll.dll', '25c3d3e4d59de454e868bef6d3da009f', NULL);
INSERT INTO `cleo` VALUES (1639, 'ssl.dll', '9476d2ba9ba1d07d73d2d000f1cd97e8', NULL);
INSERT INTO `cleo` VALUES (1650, 'ziplib.dll', '979de63b3b5068715099dbd748e38155', NULL);
INSERT INTO `cleo` VALUES (1699, 'core.dll', '7a90e7de13ed3c86d0a05e8596eacec6', NULL);
INSERT INTO `cleo` VALUES (1732, 'lpeg.dll', '7d23aba835692902ebc0efeac0942b2e', NULL);
INSERT INTO `cleo` VALUES (1734, 'rex_pcre.dll', '774da5853601353780c9f3aeb5ae049c', NULL);
INSERT INTO `cleo` VALUES (1739, 'mysql.dll', '2d03c640aad5ba97c336791723e3ea99', NULL);
INSERT INTO `cleo` VALUES (1740, 'sqlite3.dll', '1e613f083609309edf40e52be996436b', NULL);
INSERT INTO `cleo` VALUES (2045, 'SAMPFUNCS.lib', '84cfadb08b354f24aab7a096348e622e', NULL);
INSERT INTO `cleo` VALUES (2046, 'DllTricks.dll', '10969505d3d6dc00acbbdb2580a1607d', '2024-08-10 01:44:222');
INSERT INTO `cleo` VALUES (2047, '_dialogs.asi', '11ea0db6443e127fbbcb8377a4f7b8f6', '2024-08-10 01:45:222');
INSERT INTO `cleo` VALUES (2048, 'sampvoice.asi', 'efe45699a8ff821f22c5c65b75afcf30', '2024-08-10 01:45:222');
INSERT INTO `cleo` VALUES (2049, 'modloader.asi', '7bca6c02c326ad80b51c8ba4a3ab7081', '2024-08-10 01:46:222');
INSERT INTO `cleo` VALUES (2050, 'core.asi', '7a41cc6c35ba64a2c1ae1b167d4cb89f', '2024-08-10 01:46:222');
INSERT INTO `cleo` VALUES (2051, '$fastman92limitAdjuster.asi', 'e89ea54d6c4c8e162a0eb3cb99b28566', '2024-08-10 01:48:222');
INSERT INTO `cleo` VALUES (2052, 'BulletTrace.asi', '2ee849d2b8218ba86f64912dca984cb6', '2024-08-10 01:48:222');
INSERT INTO `cleo` VALUES (2053, 'crashes.asi', '34efac8ba62f19a4953ccd3a6c996a74', '2024-08-10 01:49:222');
INSERT INTO `cleo` VALUES (2054, 'gsx.asi', 'f0db307e578206ec6ee6db03c599e9e3', '2024-08-10 01:50:222');
INSERT INTO `cleo` VALUES (2055, 'mfix.asi', '6d71b5c8ea043ea4f1dd24120c89b47d', '2024-08-10 01:50:222');
INSERT INTO `cleo` VALUES (2056, 'mousefix.asi', 'c1b6af3c04ce322fd798610d3bca3287', '2024-08-10 01:50:222');
INSERT INTO `cleo` VALUES (2057, 'radarrect.asi', 'cfa2d51d5c84e3b34959d1c426c182df', '2024-08-10 01:50:222');
INSERT INTO `cleo` VALUES (2058, 'RefreshRateFixByDarkP1xel32.ASI', 'fcecda2841c96a2b6551b17d64e2d7c6', '2024-08-10 01:50:222');
INSERT INTO `cleo` VALUES (2059, 'samp.asi', '1c42c3237bc7558d12cb9a8262f913ca', '2024-08-10 01:51:222');
INSERT INTO `cleo` VALUES (2060, 'SA_GPS.asi', '1f1a55e6fb038c90167c6c45146d5d92', '2024-08-10 01:51:222');
INSERT INTO `cleo` VALUES (2061, 'SilentPatchSA.asi', 'daf3f8ead32000199c8dcb2bc1c0c174', '2024-08-10 01:51:222');
INSERT INTO `cleo` VALUES (2062, 'SimpleLimitAdjuster_Water.asi', '799c2e725d3486117a6bf32abb10ccc6', '2024-08-10 01:52:222');
INSERT INTO `cleo` VALUES (2063, 'VehFuncs.asi', '1abd5fd708699e99fad40df7ef1c4d82', '2024-08-10 01:52:222');
INSERT INTO `cleo` VALUES (2064, 'vehiclespecialabilities.asi', '7d41b175a306dd5892639b831364f03b', '2024-08-10 01:52:222');
INSERT INTO `cleo` VALUES (2065, 'bass.dll', 'c5b3059004e2c7631915ec044f4e6c63', '2024-08-10 01:52:222');
INSERT INTO `cleo` VALUES (2066, 'd3dx9_43.dll', '86e39e9161c3d930d93822f1563c280d', '2024-08-10 01:53:222');
INSERT INTO `cleo` VALUES (2067, 'DSOUND.dll', 'aaf486d213925ebaca01493f11c1cbba', '2024-08-10 01:53:222');
INSERT INTO `cleo` VALUES (2068, 'eax.dll', '309d860fc8137e5fe9e7056c33b4b8be', '2024-08-10 01:53:222');
INSERT INTO `cleo` VALUES (2069, 'Identify.dll', '3e5cf9f3776292726c29bf35b0058007', '2024-08-10 01:53:222');
INSERT INTO `cleo` VALUES (2070, 'libcurl.dll', '9a09fd2fffd79e8a762491d3bb35deef', '2024-08-10 01:53:222');
INSERT INTO `cleo` VALUES (2071, 'MinHook.x64.dll', '9ed71db2c29203e785fa532a6261e416', '2024-08-10 01:54:222');
INSERT INTO `cleo` VALUES (2072, 'MinHook.x86.dll', '81fae251dd1155dbe840106724cbe87f', '2024-08-10 01:54:222');
INSERT INTO `cleo` VALUES (2073, 'msvcr100d.dll', 'b245bf00ba8c1196dbf8c2bd5dec9f60', '2024-08-10 01:54:222');
INSERT INTO `cleo` VALUES (2074, 'samp.dll', '04c6903c32f3fc91c9d1448878c16a57', '2024-08-10 01:54:222');
INSERT INTO `cleo` VALUES (2075, 'HudDisable.cs', '4fdb43549545a0dd2994613dca2f3369', NULL);
INSERT INTO `cleo` VALUES (2076, '$fastman92limitAdjuster.asi', 'e89ea54d6c4c8e162a0eb3cb99b28566', NULL);
INSERT INTO `cleo` VALUES (2077, 'audio.asi', 'b804a9b5f0d288c78cf41180361a8c39', NULL);
INSERT INTO `cleo` VALUES (2078, 'BulletTrace.asi', '2ee849d2b8218ba86f64912dca984cb6', NULL);
INSERT INTO `cleo` VALUES (2079, 'CLEO.asi', '2914f22e10f4b09e96061068425891ce', NULL);
INSERT INTO `cleo` VALUES (2080, 'core.asi', '7a41cc6c35ba64a2c1ae1b167d4cb89f', NULL);
INSERT INTO `cleo` VALUES (2081, 'crashes.asi', '34efac8ba62f19a4953ccd3a6c996a74', NULL);
INSERT INTO `cleo` VALUES (2082, 'discord-plugin.asi', '010bd60aa435c5d3270c2bb51e554a1a', NULL);
INSERT INTO `cleo` VALUES (2083, 'gsx.asi', 'f0db307e578206ec6ee6db03c599e9e3', NULL);
INSERT INTO `cleo` VALUES (2084, 'mfix.asi', '6d71b5c8ea043ea4f1dd24120c89b47d', NULL);
INSERT INTO `cleo` VALUES (2085, 'modloader.asi', '7bca6c02c326ad80b51c8ba4a3ab7081', NULL);
INSERT INTO `cleo` VALUES (2086, 'mousefix.asi', 'c1b6af3c04ce322fd798610d3bca3287', NULL);
INSERT INTO `cleo` VALUES (2087, 'NormalMapFix.asi', '479f790d850aa208a73787411c1df97e', NULL);
INSERT INTO `cleo` VALUES (2088, 'OutFitFix.asi', '795df56453ab16ed321a3937efa33d82', NULL);
INSERT INTO `cleo` VALUES (2089, 'radarrect.asi', 'cfa2d51d5c84e3b34959d1c426c182df', NULL);
INSERT INTO `cleo` VALUES (2090, 'RefreshRateFixByDarkP1xel32.ASI', 'fcecda2841c96a2b6551b17d64e2d7c6', NULL);
INSERT INTO `cleo` VALUES (2091, 'SAMP-GPS.asi', 'ab94d4fe1531450256433adcf72e17e2', NULL);
INSERT INTO `cleo` VALUES (2092, 'samp.asi', '1c42c3237bc7558d12cb9a8262f913ca', NULL);
INSERT INTO `cleo` VALUES (2093, 'SAMPGraphicRestore.asi', 'f71c26dfcdcf70615ba63eec031e5921', NULL);
INSERT INTO `cleo` VALUES (2094, 'sampvoice.asi', 'efe45699a8ff821f22c5c65b75afcf30', NULL);
INSERT INTO `cleo` VALUES (2095, 'SA_GPS.asi', '1f1a55e6fb038c90167c6c45146d5d92', NULL);
INSERT INTO `cleo` VALUES (2096, 'sensfix.asi', '7362899b580ad0599b0d35793fb9fea5', NULL);
INSERT INTO `cleo` VALUES (2097, 'ShellFix.asi', '9d337b486160ab57eb1f3d980b4d98cb', NULL);
INSERT INTO `cleo` VALUES (2098, 'SilentPatchSA.asi', 'daf3f8ead32000199c8dcb2bc1c0c174', NULL);
INSERT INTO `cleo` VALUES (2099, 'SimpleLimitAdjuster_Water.asi', '799c2e725d3486117a6bf32abb10ccc6', NULL);
INSERT INTO `cleo` VALUES (2100, 'StreamMemFix.asi', '2e8712c56f19f92f7f74f2d0c76f9c5f', NULL);
INSERT INTO `cleo` VALUES (2101, 'VehFuncs.asi', '1abd5fd708699e99fad40df7ef1c4d82', NULL);
INSERT INTO `cleo` VALUES (2102, 'vehiclespecialabilities.asi', '7d41b175a306dd5892639b831364f03b', NULL);
INSERT INTO `cleo` VALUES (2103, '_chat.asi', 'c5e240ff5b98f1d35601aa01a30e5d8a', NULL);
INSERT INTO `cleo` VALUES (2104, '_dialogs.asi', '11ea0db6443e127fbbcb8377a4f7b8f6', NULL);
INSERT INTO `cleo` VALUES (2105, 'bass.dll', '8f5b9b73d33e8c99202b5058cb6dce51', NULL);
INSERT INTO `cleo` VALUES (2106, 'bass_fx.dll', 'e7f4494bdf7b1c49a303fe56c6b52dc9', NULL);
INSERT INTO `cleo` VALUES (2107, 'd3dx9_43.dll', '86e39e9161c3d930d93822f1563c280d', NULL);
INSERT INTO `cleo` VALUES (2108, 'DllTricks.dll', '10969505d3d6dc00acbbdb2580a1607d', NULL);
INSERT INTO `cleo` VALUES (2109, 'DSOUND.dll', 'aaf486d213925ebaca01493f11c1cbba', NULL);
INSERT INTO `cleo` VALUES (2110, 'eax.dll', '309d860fc8137e5fe9e7056c33b4b8be', NULL);
INSERT INTO `cleo` VALUES (2111, 'freetype.dll', 'ff6fed4ba3e572b0ec0cd0f437ffca1f', NULL);
INSERT INTO `cleo` VALUES (2112, 'Identify.dll', '3e5cf9f3776292726c29bf35b0058007', NULL);
INSERT INTO `cleo` VALUES (2113, 'libcurl.dll', '9a09fd2fffd79e8a762491d3bb35deef', NULL);
INSERT INTO `cleo` VALUES (2114, 'MinHook.x64.dll', '9ed71db2c29203e785fa532a6261e416', NULL);
INSERT INTO `cleo` VALUES (2115, 'MinHook.x86.dll', '81fae251dd1155dbe840106724cbe87f', NULL);
INSERT INTO `cleo` VALUES (2116, 'msvcr100d.dll', 'b245bf00ba8c1196dbf8c2bd5dec9f60', NULL);
INSERT INTO `cleo` VALUES (2117, 'ogg.dll', '0602f672ba595716e64ec4040e6de376', NULL);
INSERT INTO `cleo` VALUES (2118, 'samp.dll', '04c6903c32f3fc91c9d1448878c16a57', NULL);
INSERT INTO `cleo` VALUES (2119, 'sampar.dll', '485b790ab3500735810122f2c53f308e', NULL);
INSERT INTO `cleo` VALUES (2120, 'VMProtectSDK32.dll', '42bc27a67b8d922ff86699723d546f4a', NULL);
INSERT INTO `cleo` VALUES (2121, 'vorbis.dll', '2840f08dd9753a5b13c60d6d1c165c9a', NULL);
INSERT INTO `cleo` VALUES (2122, 'vorbisFile.dll', '68c7448cf5ad9bc7dc6b00c6951f4513', NULL);
INSERT INTO `cleo` VALUES (2123, 'vorbisHooked.dll', '2b7b803311d2b228f065c45d13e1aeb2', NULL);
INSERT INTO `cleo` VALUES (2124, 'zlib1.dll', 'b8a9e91134e7c89440a0f95470d5e47b', NULL);
INSERT INTO `cleo` VALUES (2125, 'audio.dll', '92695f522950963c21ed34337fba7ded', NULL);
INSERT INTO `cleo` VALUES (2126, 'audiowpm.dll', '68c177a250c7812619ba174b3c705e32', NULL);
INSERT INTO `cleo` VALUES (2127, 'bassmix.dll', '4f1ea0f70827b33e149eae318426dd4a', NULL);
INSERT INTO `cleo` VALUES (2128, 'bassflac.dll', '50af8a7d49e83a723ed0f70fb682dcfb', NULL);
INSERT INTO `cleo` VALUES (2129, 'bassmidi.dll', 'ea8c604153561e1e20cbc471696533fc', NULL);
INSERT INTO `cleo` VALUES (2130, 'basswma.dll', '7b52be6d702aa590db57a0e135f81c45', NULL);
INSERT INTO `cleo` VALUES (2131, 'basswv.dll', '4304c0e41adc990c05042b5aef6a9e08', NULL);
INSERT INTO `cleo` VALUES (2132, 'bass_aac.dll', '99b7b694e20e084d4921da3a268f75f8', NULL);
INSERT INTO `cleo` VALUES (2133, 'bass_ac3.dll', 'e0b7b3b23e1ad4bfbe9c29964e377cc5', NULL);
INSERT INTO `cleo` VALUES (2134, 'bass_alac.dll', '5bb5a6d220e404f8e8e26baad6ed8f9a', NULL);
INSERT INTO `cleo` VALUES (2135, 'bass_ape.dll', '8b18088f73934fccc933be1124231d45', NULL);
INSERT INTO `cleo` VALUES (2136, 'bass_mpc.dll', '52420b97e59b525adef27bf51983f036', NULL);
INSERT INTO `cleo` VALUES (2137, 'bass_spx.dll', '2f4db4ee83e4a442b6c1df571f17ea98', NULL);
INSERT INTO `cleo` VALUES (2138, 'bass_tta.dll', '4ad2d66e10aaa0ffe4c7a4f46eadbb56', NULL);
INSERT INTO `cleo` VALUES (2139, '$fastman92limitAdjuster.lib', '24cdb3bde74600c1574b51fd6a592f80', NULL);
INSERT INTO `cleo` VALUES (2140, 'CLEO.lib', '3c1feff04c50e7f471e301c322a57fa7', NULL);
INSERT INTO `cleo` VALUES (2141, 'std.asi.dll', '6213e58c7afebba3c9a544d136867192', '2024-08-11 11:47:223');
INSERT INTO `cleo` VALUES (2142, 'std.bank.dll', 'b62c4afdd4185dc101a4ef00c2f96df0', '2024-08-11 11:47:223');
INSERT INTO `cleo` VALUES (2143, 'std.data.dll', '6071e23e21a6dbf14d1ccc1c40c8999e', '2024-08-11 11:47:223');
INSERT INTO `cleo` VALUES (2144, 'std.fx.dll', '6d3d25d18bafd2a3aa8ffc45210f8d6f', '2024-08-11 11:48:223');
INSERT INTO `cleo` VALUES (2145, 'std.movies.dll', '2f6cffc454480a78b8dd5e6deaf59a22', '2024-08-11 11:48:223');
INSERT INTO `cleo` VALUES (2146, 'std.scm.dll', 'c4985af123ec3eb3542dd39bc48cf559', '2024-08-11 11:48:223');
INSERT INTO `cleo` VALUES (2147, 'std.sprites.dll', '4eb5de5941e2d777d082f0d55d8ea5a7', '2024-08-11 11:48:223');
INSERT INTO `cleo` VALUES (2148, 'std.stream.dll', '66abdbad403be76682f3f0c9a74bd555', '2024-08-11 11:48:223');
INSERT INTO `cleo` VALUES (2149, 'std.text.dll', '92eb256f95d7f4a290c2d5fb77a7a629', '2024-08-11 11:48:223');
INSERT INTO `cleo` VALUES (2150, 'std.tracks.dll', '62b4f02f39ee472a9e18c0b83f61045a', '2024-08-11 11:48:223');
INSERT INTO `cleo` VALUES (2151, '2GBStream.cs', '84a5a9b95c0a7324fcfc8ec7a6998464', '2024-08-12 02:56:224');
INSERT INTO `cleo` VALUES (2153, 'FastPed.cs', '0a71df74024232c08d5cebfeb1f0fd14', '2024-08-12 02:56:224');
INSERT INTO `cleo` VALUES (2154, 'memory512.cs', '07dd7a442ca6b3afa0e27919d9bfe4aa', '2024-08-12 02:56:224');
INSERT INTO `cleo` VALUES (2155, 'StreamMemory.cs', '85fc11128f8e3f4fe4846750d71075f9', '2024-08-12 02:57:224');
INSERT INTO `cleo` VALUES (2157, 'tracer.cs', '822b082534cc294d334cac7c2a5185c7', '2024-08-12 03:02:224');
INSERT INTO `cleo` VALUES (2158, 'Car-HP.cs', 'b8ea28ae1d735f2d228a252c6802c889', '2024-08-12 03:02:224');

-- ----------------------------
-- Table structure for dealership
-- ----------------------------
DROP TABLE IF EXISTS `dealership`;
CREATE TABLE `dealership`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Model` int(11) NOT NULL DEFAULT 0,
  `Type` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Price` int(11) NOT NULL DEFAULT 0,
  `PositionX` float NOT NULL DEFAULT 0,
  `PositionY` float NOT NULL DEFAULT 0,
  `PositionZ` float NOT NULL DEFAULT 0,
  `PositionA` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dealership
-- ----------------------------
INSERT INTO `dealership` VALUES (3, 411, 0, 100001, 1776.87, -1775.08, 13.48, 0.04);
INSERT INTO `dealership` VALUES (4, 411, 0, 100000, 1776.87, -1783.67, 13.49, 145.18);
INSERT INTO `dealership` VALUES (5, 411, 0, 100000, 1771.93, -1781.51, 13.48, 75.96);
INSERT INTO `dealership` VALUES (6, 411, 0, 100000, 1774.67, -1770.14, 13.49, 337.84);
INSERT INTO `dealership` VALUES (7, 411, 0, 100000, 1777.44, -1763.21, 13.51, 325.71);
INSERT INTO `dealership` VALUES (8, 411, 0, 100000, 1769.17, -1763.65, 13.49, 93.68);
INSERT INTO `dealership` VALUES (9, 411, 0, 100000, 1775.47, -1758.64, 13.48, 286.1);
INSERT INTO `dealership` VALUES (10, 411, 0, 100000, 1768.86, -1754.42, 13.49, 44.07);
INSERT INTO `dealership` VALUES (11, 411, 0, 100000, 1794.71, -1785.53, 13.44, 212.29);
INSERT INTO `dealership` VALUES (12, 411, 0, 100000, 1797.86, -1777.6, 13.49, 357.61);
INSERT INTO `dealership` VALUES (13, 411, 0, 100000, 1794.26, -1778.3, 13.48, 81.05);

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
-- Table structure for gaspump
-- ----------------------------
DROP TABLE IF EXISTS `gaspump`;
CREATE TABLE `gaspump`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Business` int(10) UNSIGNED NULL DEFAULT 0,
  `Object` int(10) UNSIGNED NULL DEFAULT 0,
  `PositionX` float NULL DEFAULT 0,
  `PositionY` float NULL DEFAULT 0,
  `PositionZ` float NULL DEFAULT 0,
  `PositionA` float NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gaspump
-- ----------------------------
INSERT INTO `gaspump` VALUES (1, 8, 1676, 1578.28, 1468.61, 10.8328, 119.046);
INSERT INTO `gaspump` VALUES (2, 2, 1676, 1572.92, 1568.12, 10.8203, 67.1183);
INSERT INTO `gaspump` VALUES (3, 14, 1676, -2852.68, -431.067, 13.3303, 181.184);
INSERT INTO `gaspump` VALUES (4, 23, 1676, 2119.99, -1765.37, 15.3966, 252.722);
INSERT INTO `gaspump` VALUES (5, 23, 1676, 2119.88, -1768.23, 15.3952, 70.6007);
INSERT INTO `gaspump` VALUES (6, 18, 1676, 2112.34, -1768.78, 13.4449, 290.654);
INSERT INTO `gaspump` VALUES (7, 18, 1676, 2114.45, -1764.96, 14.1968, 218.125);
INSERT INTO `gaspump` VALUES (8, 18, 1676, 2109.34, -1753.62, 14.1984, 201.831);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hardwareid
-- ----------------------------
INSERT INTO `hardwareid` VALUES (15, 'BFEBFBFF000806C1', 0, '2024-05-13 01:20:133');

-- ----------------------------
-- Table structure for housefurnitures
-- ----------------------------
DROP TABLE IF EXISTS `housefurnitures`;
CREATE TABLE `housefurnitures`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HouseID` int(11) NOT NULL,
  `FurnitureID` tinyint(11) NOT NULL,
  `FurnitureX` float NOT NULL,
  `FurnitureY` float NOT NULL,
  `FurnitureZ` float NOT NULL,
  `FurnitureRX` float NOT NULL,
  `FurnitureRY` float NOT NULL,
  `FurnitureRZ` float NOT NULL,
  `FurnitureVW` int(11) NOT NULL,
  `FurnitureInt` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of housefurnitures
-- ----------------------------

-- ----------------------------
-- Table structure for houseguns
-- ----------------------------
DROP TABLE IF EXISTS `houseguns`;
CREATE TABLE `houseguns`  (
  `HouseID` int(11) NOT NULL,
  `WeaponID` tinyint(4) NOT NULL,
  `Ammo` int(11) NOT NULL,
  UNIQUE INDEX `HouseID_2`(`HouseID`, `WeaponID`) USING BTREE,
  INDEX `HouseID`(`HouseID`) USING BTREE,
  CONSTRAINT `houseguns_ibfk_1` FOREIGN KEY (`HouseID`) REFERENCES `house` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of houseguns
-- ----------------------------

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Owned` int(11) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 999,
  `Description` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'High',
  `ExteriorX` float(10, 5) NOT NULL DEFAULT 0.00000,
  `ExteriorY` float(10, 5) NOT NULL DEFAULT 0.00000,
  `ExteriorZ` float(10, 5) NOT NULL DEFAULT 0.00000,
  `ExteriorR` float(10, 5) NOT NULL DEFAULT 0.00000,
  `InteriorX` float(10, 5) NOT NULL DEFAULT 0.00000,
  `InteriorY` float(10, 5) NOT NULL DEFAULT 0.00000,
  `InteriorZ` float(10, 5) NOT NULL DEFAULT 0.00000,
  `InteriorR` float(10, 5) NOT NULL DEFAULT 0.00000,
  `ExtIW` int(11) NOT NULL DEFAULT 0,
  `ExtVW` int(11) NOT NULL DEFAULT 0,
  `IntIW` int(11) NOT NULL DEFAULT 0,
  `IntVW` int(11) NOT NULL DEFAULT 0,
  `Lock` int(11) NOT NULL DEFAULT 0,
  `Rentable` int(11) NOT NULL DEFAULT 0,
  `RentFee` int(11) NOT NULL DEFAULT 0,
  `Value` int(11) NOT NULL DEFAULT 0,
  `SafeMoney` int(11) NOT NULL DEFAULT 0,
  `Pot` int(11) NOT NULL DEFAULT 0,
  `Crack` int(11) NOT NULL DEFAULT 0,
  `Materials` int(11) NOT NULL DEFAULT 0,
  `Weapons0` int(11) NOT NULL DEFAULT 0,
  `Weapons1` int(11) NOT NULL DEFAULT 0,
  `Weapons2` int(11) NOT NULL DEFAULT 0,
  `Weapons3` int(11) NOT NULL DEFAULT 0,
  `Weapons4` int(11) NOT NULL DEFAULT 0,
  `GLUpgrade` int(11) NOT NULL DEFAULT 0,
  `PickupID` int(11) NOT NULL DEFAULT 0,
  `CustomInterior` int(11) NOT NULL DEFAULT 0,
  `CustomExterior` int(11) NOT NULL DEFAULT 0,
  `ExteriorA` float(10, 5) NOT NULL DEFAULT 0.00000,
  `InteriorA` float(10, 5) NOT NULL DEFAULT 0.00000,
  `MailX` float(10, 5) NOT NULL DEFAULT 0.00000,
  `MailY` float(10, 5) NOT NULL DEFAULT 0.00000,
  `MailZ` float(10, 5) NOT NULL DEFAULT 0.00000,
  `MailA` float(10, 5) NOT NULL DEFAULT 0.00000,
  `MailType` tinyint(4) NOT NULL DEFAULT 0,
  `Heroin` int(11) NOT NULL DEFAULT 0,
  `ClosetX` float(10, 5) NOT NULL DEFAULT 0.00000,
  `ClosetY` float(10, 5) NOT NULL DEFAULT 0.00000,
  `ClosetZ` float(10, 5) NOT NULL DEFAULT 0.00000,
  `TrasX` float(10, 5) NOT NULL,
  `TrasY` float(10, 5) NOT NULL,
  `TrasZ` float(10, 5) NOT NULL,
  `TrasA` float(10, 5) NOT NULL,
  `AMUpgrade` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL DEFAULT -1,
  `OwnerName` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Nobody',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of houses
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
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `leader` int(11) NULL DEFAULT NULL,
  `birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
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
INSERT INTO `organization` VALUES (2, 'FDSA', 31, '29-5-2024', '29-5-2024', 0, 100000, 50000, 'Giam doc', 'Pho giam doc', 'Truong khoa', 'Pho khoa', 'Ke toan', 'Bac si', 'Dieu duong', 'Y ta', 'Thu ngan', 'Bao ve', 274, 275, 276, 308, 0, 0, 0, 0, 0, 0);

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
  `health` int(11) NULL DEFAULT 1000,
  `odo` int(11) NULL DEFAULT 0,
  `siren` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orgvehs
-- ----------------------------
INSERT INTO `orgvehs` VALUES (19, 416, 2, 2207.66, -1385.96, 23.8301, 252.478, 0, 0, 1, 1, 100, 0, 0, 1000, 0, '1');
INSERT INTO `orgvehs` VALUES (20, 416, 2, 1159.74, -1281.18, 13.6487, 182.028, 0, 0, 2, 2, 100, 0, 0, 1000, 0, '1');
INSERT INTO `orgvehs` VALUES (21, 416, 2, 1204.79, -1341.17, 13.3992, 327.924, 0, 0, 1, 1, 100, 0, 0, 1000, 0, '1');
INSERT INTO `orgvehs` VALUES (22, 416, 2, 1283.26, -1573.71, 13.3828, 340, 0, 0, 1, 1, 100, 0, 0, 1000, 0, '1');
INSERT INTO `orgvehs` VALUES (23, 416, 2, 1268.79, -1574.92, 13.3828, 74.0009, 0, 0, 1, 1, 100, 0, 0, 1000, 0, '1');

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
  `PosX` float(20, 5) NULL DEFAULT 1192.00000,
  `PosY` float(20, 5) NULL DEFAULT -1292.00000,
  `PosZ` float(20, 5) NULL DEFAULT 13.00000,
  `PosA` float(20, 5) NULL DEFAULT 180.00000,
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
  `Job` int(11) NULL DEFAULT 0,
  `InvWeight` int(11) NULL DEFAULT 20,
  `TimeInjured` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (31, 0, 'Khoi_Nguyenz', 'dep traii', 850100, 100, 100, 2, 1776.86951, -1775.07996, 13.47243, 0.04196, 0, 0, '12:40:27 6-30-2024', 1, 0, 0, 0, 1, 15, 11, 2008, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 42900, 15000, 0, -1, 'NULL', 0, 1, 20, 300);
INSERT INTO `players` VALUES (32, 0, 'CCCC_CC', 'dep traiiCC', 940100, 100, 0, 0, 2193.63574, -1202.29126, 1049.02344, 193.01346, 0, 10, '12:40:27 6-30-2024', 1, 0, 6, 0, 1, 1, 1, 2010, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 42900, 15000, 0, -1, 'NULL', 0, 1, 20, 300);
INSERT INTO `players` VALUES (33, 0, 'Khoi_NguyenZt', 'Khong co thong tin', 1000, 100, 0, 299, 1192.00000, -1292.00000, 13.00000, 180.00000, 0, 0, '00:00:00 00-00-0000', 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 0, 0, NULL, -1, NULL, 0, 0, 20, 0);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Fav` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Copyright` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EnbleMailer` int(11) NULL DEFAULT 0,
  `APIKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APIID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ServerAPI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '2',
  `ThongBao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (2, 'GVO.VN', 'KhNguyenZ', 'https://i.imgur.com/cOw7azM.png', 'https://i.imgur.com/f2JxRdb.png', 'Khôi Nguyên', 0, '879dd9889504ba955179d83a5a25cbcd', '879dd9889504ba955179d83a5a25cbcd', '2', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES (8, 31, 411, 1199.23, -1339.26, 13.5487, 181.997, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1000, 1567);
INSERT INTO `vehicle` VALUES (9, 31, 411, 371.738, -1741.45, 16.8231, 341.963, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1000, 0);
INSERT INTO `vehicle` VALUES (10, 31, 411, 1284.07, -1569.49, 13.3828, 286.756, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1000, 0);
INSERT INTO `vehicle` VALUES (11, 31, 411, -61.4808, -1591.24, 2.61072, 265.143, 0, 0, 1, 1, 0, 0, 100, 0, 0, 0, 1000, 0);
INSERT INTO `vehicle` VALUES (12, 31, 522, 1805.14, -1716.87, 13.5426, 188.474, 0, 0, 1, 1, 0, 0, 99, 0, 0, 0, 1000, 1012);
INSERT INTO `vehicle` VALUES (13, 31, 487, 2092.11, -1816.24, 13.3828, 42.2081, 0, 0, 1, 1, 0, 0, 98, 0, 0, 0, 1000, 1373);
INSERT INTO `vehicle` VALUES (14, 31, 3160, 1304.12, -1539.29, 13.3828, 345.846, 0, 0, 1, 1, 0, 0, 99, 0, 0, 0, 1000, 918);

-- ----------------------------
-- Procedure structure for ApplyDefaultValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `ApplyDefaultValues`;
delimiter ;;
CREATE PROCEDURE `ApplyDefaultValues`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE table_name VARCHAR(255);
    DECLARE column_name VARCHAR(255);
    DECLARE column_type VARCHAR(255);
    DECLARE cur1 CURSOR FOR
        SELECT TABLE_NAME, COLUMN_NAME, COLUMN_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND TABLE_NAME = 'employees'
          AND DATA_TYPE IN ('int', 'smallint', 'tinyint', 'bigint', 'decimal', 'float', 'double');
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur1;

    read_loop: LOOP
        FETCH cur1 INTO table_name, column_name, column_type;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET @s = CONCAT('ALTER TABLE ', table_name, 
                        ' MODIFY COLUMN ', column_name, 
                        ' ', column_type, 
                        ' DEFAULT 0;');
        PREPARE stmt FROM @s;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE cur1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SetDefaultValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `SetDefaultValues`;
delimiter ;;
CREATE PROCEDURE `SetDefaultValues`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE table_name VARCHAR(255);
    DECLARE column_name VARCHAR(255);
    DECLARE column_type VARCHAR(255);
    DECLARE cur1 CURSOR FOR
        SELECT TABLE_NAME, COLUMN_NAME, COLUMN_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND DATA_TYPE IN ('int', 'smallint', 'tinyint', 'bigint', 'decimal', 'float', 'double');
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur1;

    read_loop: LOOP
        FETCH cur1 INTO table_name, column_name, column_type;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Chỉ áp dụng DEFAULT cho các cột số, không áp dụng cho các cột kiểu chuỗi, ngày, v.v.
        IF column_type LIKE '%int%' OR column_type LIKE '%decimal%' OR column_type LIKE '%float%' OR column_type LIKE '%double%' THEN
            SET @s = CONCAT('ALTER TABLE ', table_name, 
                            ' MODIFY COLUMN ', column_name, 
                            ' ', column_type, 
                            ' DEFAULT 0;');
            PREPARE stmt FROM @s;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;
    END LOOP;

    CLOSE cur1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for UpdateNullValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `UpdateNullValues`;
delimiter ;;
CREATE PROCEDURE `UpdateNullValues`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE table_name VARCHAR(255);
    DECLARE column_name VARCHAR(255);
    DECLARE data_type VARCHAR(255);
    DECLARE cur1 CURSOR FOR
        SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
          AND DATA_TYPE IN ('int', 'decimal', 'float', 'double', 'smallint', 'tinyint', 'bigint', 'varchar', 'text', 'char', 'mediumtext', 'longtext');
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur1;

    read_loop: LOOP
        FETCH cur1 INTO table_name, column_name, data_type;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET @s = '';
        
        IF data_type IN ('int', 'decimal', 'float', 'double', 'smallint', 'tinyint', 'bigint') THEN
            SET @s = CONCAT('UPDATE ', table_name, ' SET ', column_name, ' = -1 WHERE ', column_name, ' IS NULL');
        ELSEIF data_type IN ('varchar', 'text', 'char', 'mediumtext', 'longtext') THEN
            SET @s = CONCAT('UPDATE ', table_name, ' SET ', column_name, ' = '''' WHERE ', column_name, ' IS NULL');
        END IF;

        -- Ghi nhật ký câu lệnh đang thực thi
        SELECT @s;

        -- Kiểm tra câu lệnh không rỗng
        IF @s != '' THEN
            PREPARE stmt FROM @s;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;
    END LOOP;

    CLOSE cur1;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
