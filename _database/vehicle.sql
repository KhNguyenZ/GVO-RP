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

 Date: 15/03/2024 21:10:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
