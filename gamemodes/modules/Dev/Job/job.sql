/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : deep_city

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2024-04-21 13:41:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jobID` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(255) DEFAULT NULL,
  `jobType` int(11) DEFAULT NULL,
  `jobX` float DEFAULT NULL,
  `jobY` float DEFAULT NULL,
  `jobZ` float DEFAULT NULL,
  `jobA` float DEFAULT NULL,
  `carX` float DEFAULT NULL,
  `carY` float DEFAULT NULL,
  `carZ` float DEFAULT NULL,
  `carA` float DEFAULT NULL,
  `carModel` float DEFAULT NULL,
  `carColor1` float DEFAULT NULL,
  `carColor2` float DEFAULT NULL,
  `jobLevel` int(11) DEFAULT NULL,
  `jobSkin` int(11) DEFAULT NULL,
  `jobBonus` int(11) DEFAULT NULL,
  `jobminMoney` int(11) DEFAULT NULL,
  `jobmaxMoney` int(11) DEFAULT NULL,
  `jobCreated` int(11) DEFAULT '0',
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', 'Aker', '5', '649.991', '945.175', '-35.1926', '92.6482', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `job` VALUES ('2', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('3', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('4', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('5', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('6', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('7', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('8', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('9', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('10', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('11', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `job` VALUES ('12', 'Test', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
