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

 Date: 18/02/2024 00:09:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ( 31, 1, 10);
INSERT INTO `inventory` VALUES ( 31, 2, 10);
INSERT INTO `inventory` VALUES ( 31, 4, 10);
INSERT INTO `inventory` VALUES ( 31, 5, 10);
INSERT INTO `inventory` VALUES ( 31, 6, 10);
INSERT INTO `inventory` VALUES ( 31, 7, 10);
INSERT INTO `inventory` VALUES ( 31, 10, 10);
INSERT INTO `inventory` VALUES ( 31, 14, 10);
INSERT INTO `inventory` VALUES ( 31, 15, 10);
INSERT INTO `inventory` VALUES ( 31, 17, 10);
INSERT INTO `inventory` VALUES ( 31, 18, 10);
INSERT INTO `inventory` VALUES ( 31, 19, 10);
INSERT INTO `inventory` VALUES ( 31, 21, 10);
INSERT INTO `inventory` VALUES ( 31, 22, 10);
INSERT INTO `inventory` VALUES ( 31, 23, 10);
INSERT INTO `inventory` VALUES ( 31, 12, 10);
INSERT INTO `inventory` VALUES ( 31, 18, 5);
INSERT INTO `inventory` VALUES ( 31, 16, 3);
INSERT INTO `inventory` VALUES ( 31, 3, 5);

SET FOREIGN_KEY_CHECKS = 1;
