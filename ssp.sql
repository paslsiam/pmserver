/*
 Navicat Premium Data Transfer

 Source Server         : pmserver
 Source Server Type    : MySQL
 Source Server Version : 100605
 Source Host           : localhost:3306
 Source Schema         : ssp_db

 Target Server Type    : MySQL
 Target Server Version : 100605
 File Encoding         : 65001

 Date: 25/11/2021 09:27:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accessequipment
-- ----------------------------
DROP TABLE IF EXISTS `accessequipment`;
CREATE TABLE `accessequipment`  (
  `deviceType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `switchName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `portName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `portSpeed` float NULL DEFAULT NULL,
  `portUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `locationCode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deviceType`) USING BTREE,
  INDEX `portName`(`portName`) USING BTREE,
  INDEX `locationCode`(`locationCode`) USING BTREE,
  INDEX `switchName`(`switchName`) USING BTREE,
  CONSTRAINT `accessequipment_ibfk_1` FOREIGN KEY (`portName`) REFERENCES `accessportname` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accessequipment_ibfk_2` FOREIGN KEY (`locationCode`) REFERENCES `locationcode` (`codeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accessportname
-- ----------------------------
DROP TABLE IF EXISTS `accessportname`;
CREATE TABLE `accessportname`  (
  `portID` int NOT NULL,
  `portName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `upDownLinkType` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`portID`) USING BTREE,
  INDEX `portName`(`portName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accessportnames
-- ----------------------------
DROP TABLE IF EXISTS `accessportnames`;
CREATE TABLE `accessportnames`  (
  `portID` int NOT NULL,
  `portName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `upDownLinkType` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`portID`) USING BTREE,
  INDEX `portNames`(`portName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for accessswitch
-- ----------------------------
DROP TABLE IF EXISTS `accessswitch`;
CREATE TABLE `accessswitch`  (
  `deviceType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `switchName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `portName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `portSpeed` float NULL DEFAULT NULL,
  `portUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `locationCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deviceType`) USING BTREE,
  INDEX `portName`(`portName`) USING BTREE,
  INDEX `locationCode`(`locationCode`) USING BTREE,
  INDEX `switchName`(`switchName`) USING BTREE,
  CONSTRAINT `accessswitch_ibfk_1` FOREIGN KEY (`portName`) REFERENCES `accessportnames` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `accessswitch_ibfk_2` FOREIGN KEY (`locationCode`) REFERENCES `node` (`locationCode`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for asnrange
-- ----------------------------
DROP TABLE IF EXISTS `asnrange`;
CREATE TABLE `asnrange`  (
  `asnRange` int NOT NULL,
  `asnNumber` double NOT NULL,
  `assign` tinyint(1) NULL DEFAULT NULL,
  `ansSide` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`asnRange`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bgpparameters
-- ----------------------------
DROP TABLE IF EXISTS `bgpparameters`;
CREATE TABLE `bgpparameters`  (
  `providorASN` double NULL DEFAULT NULL,
  `customerASN` double NULL DEFAULT NULL,
  `bgpPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `acceptedPrefixes` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `advertisedPrefixes` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `acceptedPrefixesLimit` int NULL DEFAULT NULL,
  `asPathPrepend` int NULL DEFAULT NULL,
  `localPreference` int NULL DEFAULT NULL,
  `med` int NULL DEFAULT NULL,
  `networkType` int NULL DEFAULT NULL,
  INDEX `providorASN`(`providorASN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `brandID` int NOT NULL,
  `brandName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`brandID`) USING BTREE,
  INDEX `brandName`(`brandName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for cid
-- ----------------------------
DROP TABLE IF EXISTS `cid`;
CREATE TABLE `cid`  (
  `CID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerID` int NULL DEFAULT NULL,
  `vlan` int NULL DEFAULT NULL,
  PRIMARY KEY (`CID`) USING BTREE,
  INDEX `CID`(`CID`) USING BTREE,
  INDEX `customerID`(`customerID`) USING BTREE,
  INDEX `vlan`(`vlan`) USING BTREE,
  CONSTRAINT `cid_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cid_ibfk_2` FOREIGN KEY (`vlan`) REFERENCES `vlan` (`vlanID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for connectiontype
-- ----------------------------
DROP TABLE IF EXISTS `connectiontype`;
CREATE TABLE `connectiontype`  (
  `connectionTypeID` int NOT NULL,
  `connectionTypeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`connectionTypeID`) USING BTREE,
  INDEX `connectionTypeName`(`connectionTypeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customerID` int NOT NULL,
  `customerCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customerGroupID` int NULL DEFAULT NULL,
  `customerGroupName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customerTypeID` int NULL DEFAULT NULL,
  `customerTypeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customerID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for devicetype
-- ----------------------------
DROP TABLE IF EXISTS `devicetype`;
CREATE TABLE `devicetype`  (
  `deviceType` int NOT NULL,
  `deviceTypeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deviceType`) USING BTREE,
  INDEX `deviceTypeName`(`deviceTypeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ethertype
-- ----------------------------
DROP TABLE IF EXISTS `ethertype`;
CREATE TABLE `ethertype`  (
  `etherID` int NOT NULL,
  `etherCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`etherID`, `etherCode`) USING BTREE,
  INDEX `etherID`(`etherID`) USING BTREE,
  INDEX `etherCode`(`etherCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipmgnt
-- ----------------------------
DROP TABLE IF EXISTS `ipmgnt`;
CREATE TABLE `ipmgnt`  (
  `ipMGNT4Range` int NULL DEFAULT NULL,
  `ipMGNT4List` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ipMGNT6Range` int NULL DEFAULT NULL,
  `ipMGNT6List` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  INDEX `ipMGNT4Range`(`ipMGNT4Range`) USING BTREE,
  INDEX `ipMGNT4List`(`ipMGNT4List`) USING BTREE,
  INDEX `ipMGNT6Range`(`ipMGNT6Range`) USING BTREE,
  INDEX `ipMGNT6List`(`ipMGNT6List`) USING BTREE,
  CONSTRAINT `ipmgnt_ibfk_1` FOREIGN KEY (`ipMGNT4Range`) REFERENCES `ipmgnt4range` (`rangeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ipmgnt_ibfk_2` FOREIGN KEY (`ipMGNT4List`) REFERENCES `ipmgnt4listrange` (`assign`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ipmgnt_ibfk_3` FOREIGN KEY (`ipMGNT6Range`) REFERENCES `ipmgnt6range` (`rangeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ipmgnt_ibfk_4` FOREIGN KEY (`ipMGNT6List`) REFERENCES `ipmgnt6listrange` (`assign`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipmgnt4listrange
-- ----------------------------
DROP TABLE IF EXISTS `ipmgnt4listrange`;
CREATE TABLE `ipmgnt4listrange`  (
  `ipMGNT4NumberN` int UNSIGNED NOT NULL,
  `assign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rangeNumber` int NULL DEFAULT NULL,
  PRIMARY KEY (`ipMGNT4NumberN`) USING BTREE,
  INDEX `assign`(`assign`) USING BTREE,
  INDEX `rangeNumber`(`rangeNumber`) USING BTREE,
  CONSTRAINT `ipmgnt4listrange_ibfk_1` FOREIGN KEY (`rangeNumber`) REFERENCES `ipmgnt4range` (`rangeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipmgnt4range
-- ----------------------------
DROP TABLE IF EXISTS `ipmgnt4range`;
CREATE TABLE `ipmgnt4range`  (
  `rangeNumber` int NOT NULL,
  `rangeSubnet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subnetAddress` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`rangeNumber`, `rangeSubnet`) USING BTREE,
  INDEX `subnetAddress`(`subnetAddress`) USING BTREE,
  INDEX `rangeNumber`(`rangeNumber`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipmgnt6listrange
-- ----------------------------
DROP TABLE IF EXISTS `ipmgnt6listrange`;
CREATE TABLE `ipmgnt6listrange`  (
  `ipMGNT6NumberN` inet6 NOT NULL,
  `assign` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rangeNumber` int NULL DEFAULT NULL,
  PRIMARY KEY (`ipMGNT6NumberN`) USING BTREE,
  INDEX `assign`(`assign`) USING BTREE,
  INDEX `rangeNumber`(`rangeNumber`) USING BTREE,
  CONSTRAINT `ipmgnt6listrange_ibfk_1` FOREIGN KEY (`rangeNumber`) REFERENCES `ipmgnt6range` (`rangeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipmgnt6range
-- ----------------------------
DROP TABLE IF EXISTS `ipmgnt6range`;
CREATE TABLE `ipmgnt6range`  (
  `rangeNumber` int NOT NULL,
  `rangeSubnet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subnetAddress` inet6 NULL,
  PRIMARY KEY (`rangeNumber`, `rangeSubnet`) USING BTREE,
  INDEX `rangeNumber`(`rangeNumber`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipv4
-- ----------------------------
DROP TABLE IF EXISTS `ipv4`;
CREATE TABLE `ipv4`  (
  `ipv4WAN` int NULL DEFAULT NULL,
  `ipv4LAN` int NULL DEFAULT NULL,
  `rid4` int NULL DEFAULT NULL,
  INDEX `ipv4WAN`(`ipv4WAN`) USING BTREE,
  INDEX `ipv4LAN`(`ipv4LAN`) USING BTREE,
  INDEX `rid4`(`rid4`) USING BTREE,
  CONSTRAINT `ipv4_ibfk_1` FOREIGN KEY (`ipv4WAN`) REFERENCES `ipv4wan` (`prefixID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ipv4_ibfk_2` FOREIGN KEY (`ipv4LAN`) REFERENCES `ipv4lan` (`prefixID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ipv4_ibfk_3` FOREIGN KEY (`rid4`) REFERENCES `rid4` (`prefixID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipv4lan
-- ----------------------------
DROP TABLE IF EXISTS `ipv4lan`;
CREATE TABLE `ipv4lan`  (
  `prefixID` int NOT NULL,
  `subnetAddress` int NOT NULL,
  PRIMARY KEY (`prefixID`, `subnetAddress`) USING BTREE,
  INDEX `prefixID`(`prefixID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipv4s
-- ----------------------------
DROP TABLE IF EXISTS `ipv4s`;
CREATE TABLE `ipv4s`  (
  `ipv4WAN` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ipv4LAN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rid4` int NULL DEFAULT NULL,
  INDEX `ipv4LAN`(`ipv4LAN`) USING BTREE,
  INDEX `rid4`(`rid4`) USING BTREE,
  INDEX `ipv4WAN`(`ipv4WAN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipv4wan
-- ----------------------------
DROP TABLE IF EXISTS `ipv4wan`;
CREATE TABLE `ipv4wan`  (
  `prefixID` int NOT NULL,
  `subnetAddress` int NOT NULL,
  PRIMARY KEY (`prefixID`, `subnetAddress`) USING BTREE,
  INDEX `prefixID`(`prefixID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipv6
-- ----------------------------
DROP TABLE IF EXISTS `ipv6`;
CREATE TABLE `ipv6`  (
  `ipv6WAN` inet6 NULL,
  `ipv6LAN` inet6 NULL,
  `rid6` inet6 NULL,
  INDEX `ipv6LAN`(`ipv6LAN`) USING BTREE,
  INDEX `ipv6WAN`(`ipv6WAN`) USING BTREE,
  INDEX `rid6`(`rid6`) USING BTREE,
  CONSTRAINT `ipv6_ibfk_1` FOREIGN KEY (`ipv6WAN`) REFERENCES `ipv6wan` (`subnetAddress`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ipv6_ibfk_2` FOREIGN KEY (`ipv6LAN`) REFERENCES `ipv6lan` (`subnetAddress`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ipv6_ibfk_3` FOREIGN KEY (`rid6`) REFERENCES `rid6` (`subnetAddress`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipv6lan
-- ----------------------------
DROP TABLE IF EXISTS `ipv6lan`;
CREATE TABLE `ipv6lan`  (
  `prefixID` bigint NOT NULL,
  `subnetAddress` inet6 NOT NULL,
  PRIMARY KEY (`prefixID`, `subnetAddress`) USING BTREE,
  INDEX `subnetAddress`(`subnetAddress`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ipv6wan
-- ----------------------------
DROP TABLE IF EXISTS `ipv6wan`;
CREATE TABLE `ipv6wan`  (
  `prefixID` bigint NOT NULL,
  `subnetAddress` inet6 NULL,
  PRIMARY KEY (`prefixID`) USING BTREE,
  INDEX `subnetAddress`(`subnetAddress`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for jobplan
-- ----------------------------
DROP TABLE IF EXISTS `jobplan`;
CREATE TABLE `jobplan`  (
  `planID` int NOT NULL,
  `jobStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `newJobStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `requestedDatetime` timestamp NULL DEFAULT NULL,
  `effectiveDatetime` timestamp NULL DEFAULT NULL,
  `planBy` int NULL DEFAULT NULL,
  `planType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `planSubType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parallelCID` tinyint(1) NULL DEFAULT NULL,
  `parallelPlanID` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `apiTrigger` tinyint NULL DEFAULT NULL,
  `cid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceID` int NOT NULL,
  `serviceName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `projectName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `serviceType` tinyint(1) NULL DEFAULT NULL,
  `serviceSpeed` int NULL DEFAULT NULL,
  `serviceUnit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `serviceAlgorithm` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `linkInfo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provisioningHistory` int NULL DEFAULT NULL,
  `interuptionID` int NULL DEFAULT NULL,
  PRIMARY KEY (`planID`, `serviceID`) USING BTREE,
  INDEX `planID`(`planID`) USING BTREE,
  INDEX `f2`(`cid`) USING BTREE,
  INDEX `f1`(`parallelPlanID`) USING BTREE,
  INDEX `f3`(`serviceName`) USING BTREE,
  INDEX `f4`(`projectName`) USING BTREE,
  INDEX `f5`(`serviceSpeed`) USING BTREE,
  INDEX `f6`(`serviceUnit`) USING BTREE,
  INDEX `f7`(`serviceAlgorithm`) USING BTREE,
  INDEX `linkInfo`(`linkInfo`) USING BTREE,
  INDEX `provisioningHistory`(`provisioningHistory`) USING BTREE,
  CONSTRAINT `FK_jobplan_linkinfo` FOREIGN KEY (`linkInfo`) REFERENCES `linkinfos` (`netsite`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `f1` FOREIGN KEY (`parallelPlanID`) REFERENCES `jobplan` (`planID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `f2` FOREIGN KEY (`cid`) REFERENCES `cid` (`CID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `f3` FOREIGN KEY (`serviceName`) REFERENCES `servicename` (`itemCode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `f5` FOREIGN KEY (`serviceSpeed`) REFERENCES `servicespeed` (`spType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `f6` FOREIGN KEY (`serviceUnit`) REFERENCES `servicespeed` (`spUnit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `f7` FOREIGN KEY (`serviceAlgorithm`) REFERENCES `connectiontype` (`connectionTypeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jobplan_ibfk_1` FOREIGN KEY (`linkInfo`) REFERENCES `linkinfos` (`netsite`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jobplan_ibfk_3` FOREIGN KEY (`projectName`) REFERENCES `projectname` (`prjNonCIDName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jobplan_ibfk_4` FOREIGN KEY (`provisioningHistory`) REFERENCES `provisioninghistory` (`provisioningID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for l2vpnattributes
-- ----------------------------
DROP TABLE IF EXISTS `l2vpnattributes`;
CREATE TABLE `l2vpnattributes`  (
  `connectionType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `etherType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `taggedType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vlanNumber` int NULL DEFAULT NULL,
  `l2ServiceID` int NOT NULL AUTO_INCREMENT,
  `routeDistinguisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `routeTarget` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`l2ServiceID`) USING BTREE,
  INDEX `connectionType`(`connectionType`) USING BTREE,
  INDEX `etherType`(`etherType`) USING BTREE,
  INDEX `routeDistinguisher`(`routeDistinguisher`) USING BTREE,
  INDEX `routeTarget`(`routeTarget`) USING BTREE,
  INDEX `vlanNumber`(`vlanNumber`) USING BTREE,
  CONSTRAINT `l2vpnattributes_ibfk_1` FOREIGN KEY (`connectionType`) REFERENCES `l3vpnattributes` (`connectionType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributes_ibfk_2` FOREIGN KEY (`etherType`) REFERENCES `l3vpnattributes` (`etherType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributes_ibfk_4` FOREIGN KEY (`routeDistinguisher`) REFERENCES `l3vpnattributes` (`routeDistinguisher`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributes_ibfk_5` FOREIGN KEY (`routeTarget`) REFERENCES `l3vpnattributes` (`routeTarget`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributes_ibfk_6` FOREIGN KEY (`vlanNumber`) REFERENCES `vlannumber` (`vlanID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributes_ibfk_7` FOREIGN KEY (`vlanNumber`) REFERENCES `l3vpnattributes` (`vlanNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for l2vpnattributess
-- ----------------------------
DROP TABLE IF EXISTS `l2vpnattributess`;
CREATE TABLE `l2vpnattributess`  (
  `connectionType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `etherType` int NULL DEFAULT NULL,
  `taggedType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vlanNumber` int NULL DEFAULT NULL,
  `l2ServiceID` int NOT NULL AUTO_INCREMENT,
  `routeDistinguisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `routeTarget` int NULL DEFAULT NULL,
  PRIMARY KEY (`l2ServiceID`) USING BTREE,
  INDEX `etherType`(`etherType`) USING BTREE,
  INDEX `vlanNumber`(`vlanNumber`) USING BTREE,
  INDEX `routeDistinguisher`(`routeDistinguisher`) USING BTREE,
  INDEX `routeTarget`(`routeTarget`) USING BTREE,
  INDEX `connectionType`(`connectionType`) USING BTREE,
  CONSTRAINT `l2vpnattributess_ibfk_2` FOREIGN KEY (`etherType`) REFERENCES `l3vpnattributess` (`etherType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributess_ibfk_3` FOREIGN KEY (`vlanNumber`) REFERENCES `vlannumbers` (`vlanID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributess_ibfk_4` FOREIGN KEY (`routeDistinguisher`) REFERENCES `l3vpnattributess` (`routeDistinguisher`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributess_ibfk_5` FOREIGN KEY (`routeTarget`) REFERENCES `l3vpnattributess` (`routeTarget`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l2vpnattributess_ibfk_6` FOREIGN KEY (`connectionType`) REFERENCES `connectiontype` (`connectionTypeName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for l3vpnattributes
-- ----------------------------
DROP TABLE IF EXISTS `l3vpnattributes`;
CREATE TABLE `l3vpnattributes`  (
  `connectionType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `etherType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `taggedType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vlanNumber` int NULL DEFAULT NULL,
  `routingProtocol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `routeDistinguisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `routeTarget` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l3VPNServiceID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`l3VPNServiceID`) USING BTREE,
  INDEX `connectionType`(`connectionType`) USING BTREE,
  INDEX `etherType`(`etherType`) USING BTREE,
  INDEX `vlanNumber`(`vlanNumber`) USING BTREE,
  INDEX `routeDistinguisher`(`routeDistinguisher`) USING BTREE,
  INDEX `routeTarget`(`routeTarget`) USING BTREE,
  INDEX `routingProtocol`(`routingProtocol`) USING BTREE,
  CONSTRAINT `l3vpnattributes_ibfk_1` FOREIGN KEY (`connectionType`) REFERENCES `l2vpnattributes` (`connectionType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l3vpnattributes_ibfk_2` FOREIGN KEY (`etherType`) REFERENCES `l2vpnattributes` (`etherType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l3vpnattributes_ibfk_4` FOREIGN KEY (`routeDistinguisher`) REFERENCES `l2vpnattributes` (`routeDistinguisher`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l3vpnattributes_ibfk_5` FOREIGN KEY (`routeTarget`) REFERENCES `l2vpnattributes` (`routeTarget`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l3vpnattributes_ibfk_6` FOREIGN KEY (`routingProtocol`) REFERENCES `routingprotocol` (`routingProtocol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `l3vpnattributes_ibfk_7` FOREIGN KEY (`vlanNumber`) REFERENCES `l2vpnattributes` (`vlanNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for l3vpnattributess
-- ----------------------------
DROP TABLE IF EXISTS `l3vpnattributess`;
CREATE TABLE `l3vpnattributess`  (
  `connectionType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `etherType` int NULL DEFAULT NULL,
  `taggedType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vlanNumber` int NULL DEFAULT NULL,
  `routingProtocol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `routeDistinguisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `routeTarget` int NULL DEFAULT NULL,
  `l3VPNServiceID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`l3VPNServiceID`) USING BTREE,
  INDEX `connectionType`(`connectionType`) USING BTREE,
  INDEX `vlanNumber`(`vlanNumber`) USING BTREE,
  INDEX `routingProtocol`(`routingProtocol`) USING BTREE,
  INDEX `routeDistinguisher`(`routeDistinguisher`) USING BTREE,
  INDEX `etherType`(`etherType`) USING BTREE,
  INDEX `routeTarget`(`routeTarget`) USING BTREE,
  CONSTRAINT `l3vpnattributess_ibfk_1` FOREIGN KEY (`routeTarget`) REFERENCES `rtrange` (`rtNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for lagneighborportlist
-- ----------------------------
DROP TABLE IF EXISTS `lagneighborportlist`;
CREATE TABLE `lagneighborportlist`  (
  `lagID` int NOT NULL,
  INDEX `lagID`(`lagID`) USING BTREE,
  CONSTRAINT `lagneighborportlist_ibfk_1` FOREIGN KEY (`lagID`) REFERENCES `lagportlist` (`lagID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for lagportlist
-- ----------------------------
DROP TABLE IF EXISTS `lagportlist`;
CREATE TABLE `lagportlist`  (
  `lagID` int NOT NULL,
  `lagPortStatusActual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lagPortStatusPlan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lagSpeed` float NULL DEFAULT NULL,
  `lagUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lagType` tinyint(1) NULL DEFAULT NULL,
  `lagNeighborDeviceList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lagNeighborPortList` int NULL DEFAULT NULL,
  PRIMARY KEY (`lagID`) USING BTREE,
  INDEX `lagPortStatusActual`(`lagPortStatusActual`) USING BTREE,
  INDEX `lagPortStatusPlan`(`lagPortStatusPlan`) USING BTREE,
  INDEX `lagNeighborDeviceList`(`lagNeighborDeviceList`) USING BTREE,
  INDEX `lagNeighborPortList`(`lagNeighborPortList`) USING BTREE,
  CONSTRAINT `lagportlist_ibfk_2` FOREIGN KEY (`lagPortStatusPlan`) REFERENCES `portstatusplan` (`statusName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lagportlist_ibfk_3` FOREIGN KEY (`lagNeighborDeviceList`) REFERENCES `neighbordevicelist` (`nodeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lagportlist_ibfk_4` FOREIGN KEY (`lagPortStatusActual`) REFERENCES `portstatusplan` (`statusNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lagportlist_ibfk_5` FOREIGN KEY (`lagNeighborPortList`) REFERENCES `lagneighborportlist` (`lagID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for linkinfo
-- ----------------------------
DROP TABLE IF EXISTS `linkinfo`;
CREATE TABLE `linkinfo`  (
  `netsite` tinyint NOT NULL,
  `node` int NULL DEFAULT NULL,
  `downlinkPort` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uplinkPort` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attributename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `accessNumber` int NULL DEFAULT NULL,
  `coreTopoNumber` int NULL DEFAULT NULL,
  `accessSwitchRouterType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `accessSwitchRouterName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `accessSwitchRouterIPv4` int NULL DEFAULT NULL,
  `accessSwitchRouterIPv6` inet6 NULL,
  `siteConnectionType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l2vpnAttributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `l3vpnAttributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `startEnd` tinyint NOT NULL,
  `offnetCID` int NULL DEFAULT NULL,
  `providorName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `providorLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `configurationPage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `speed` float NULL DEFAULT NULL,
  `unit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `startEndType` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`netsite`, `startEnd`) USING BTREE,
  INDEX `accessSwitchRouterName`(`accessSwitchRouterName`) USING BTREE,
  INDEX `accessSwitchRouterType`(`accessSwitchRouterType`) USING BTREE,
  INDEX `downlinkPort`(`downlinkPort`) USING BTREE,
  INDEX `uplinkPort`(`uplinkPort`) USING BTREE,
  INDEX `accessSwitchRouterIPv4`(`accessSwitchRouterIPv4`) USING BTREE,
  INDEX `accessSwitchRouterIPv6`(`accessSwitchRouterIPv6`) USING BTREE,
  INDEX `l2vpnAttributes`(`l2vpnAttributes`) USING BTREE,
  INDEX `l3vpnAttributes`(`l3vpnAttributes`) USING BTREE,
  INDEX `node`(`node`) USING BTREE,
  CONSTRAINT `linkinfo_ibfk_1` FOREIGN KEY (`accessSwitchRouterName`) REFERENCES `accessequipment` (`switchName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_2` FOREIGN KEY (`accessSwitchRouterType`) REFERENCES `accessequipment` (`deviceType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_3` FOREIGN KEY (`downlinkPort`) REFERENCES `accessequipment` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_4` FOREIGN KEY (`uplinkPort`) REFERENCES `accessequipment` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_5` FOREIGN KEY (`accessSwitchRouterIPv4`) REFERENCES `ipv4` (`ipv4WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_6` FOREIGN KEY (`accessSwitchRouterIPv6`) REFERENCES `ipv6` (`ipv6WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_7` FOREIGN KEY (`l2vpnAttributes`) REFERENCES `l2vpnattributes` (`connectionType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_8` FOREIGN KEY (`l3vpnAttributes`) REFERENCES `l3vpnattributes` (`connectionType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfo_ibfk_9` FOREIGN KEY (`node`) REFERENCES `nodemasterdata` (`nodeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for linkinfos
-- ----------------------------
DROP TABLE IF EXISTS `linkinfos`;
CREATE TABLE `linkinfos`  (
  `netsite` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `node` int NULL DEFAULT NULL,
  `downlinkPort` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uplinkPort` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attributename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessNumber` int NULL DEFAULT NULL,
  `coreTopoNumber` int NULL DEFAULT NULL,
  `accessSwitchRouterType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessSwitchRouterName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessSwitchRouterIPv4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessSwitchRouterIPv6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `siteConnectionType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `l2vpnAttributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `l3vpnAttributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startEnd` tinyint(1) NULL DEFAULT NULL,
  `offnetCID` int NULL DEFAULT NULL,
  `providorName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `providorLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `configurationPage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `speed` float NULL DEFAULT NULL,
  `unit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startEndType` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`netsite`) USING BTREE,
  INDEX `node`(`node`) USING BTREE,
  INDEX `downlinkPort`(`downlinkPort`) USING BTREE,
  INDEX `uplinkPort`(`uplinkPort`) USING BTREE,
  CONSTRAINT `linkinfos_ibfk_1` FOREIGN KEY (`node`) REFERENCES `nodemasterdata` (`nodeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfos_ibfk_2` FOREIGN KEY (`downlinkPort`) REFERENCES `accessswitch` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `linkinfos_ibfk_3` FOREIGN KEY (`uplinkPort`) REFERENCES `accessswitch` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for locationcode
-- ----------------------------
DROP TABLE IF EXISTS `locationcode`;
CREATE TABLE `locationcode`  (
  `codeID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `locationDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` float NULL DEFAULT NULL,
  `long` float NULL DEFAULT NULL,
  PRIMARY KEY (`codeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for locationcodes
-- ----------------------------
DROP TABLE IF EXISTS `locationcodes`;
CREATE TABLE `locationcodes`  (
  `codeID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locationDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lat` float NULL DEFAULT NULL,
  `long` float NULL DEFAULT NULL,
  PRIMARY KEY (`codeID`) USING BTREE,
  INDEX `locationDescription`(`locationDescription`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
  `model` binary(255) NOT NULL,
  `modelName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`model`) USING BTREE,
  INDEX `modelName`(`modelName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for neighbordevicelist
-- ----------------------------
DROP TABLE IF EXISTS `neighbordevicelist`;
CREATE TABLE `neighbordevicelist`  (
  `nodeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  INDEX `nodeName`(`nodeName`) USING BTREE,
  CONSTRAINT `neighbordevicelist_ibfk_1` FOREIGN KEY (`nodeName`) REFERENCES `node` (`nodeName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node`  (
  `nodeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ipMGNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `peNodeType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `topoNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `usablePorts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `locationCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nodeName`) USING BTREE,
  INDEX `locationCode`(`locationCode`) USING BTREE,
  INDEX `deviceType`(`deviceType`) USING BTREE,
  INDEX `brand`(`brand`) USING BTREE,
  INDEX `model`(`model`) USING BTREE,
  INDEX `ipMGNT`(`ipMGNT`) USING BTREE,
  INDEX `usablePorts`(`usablePorts`) USING BTREE,
  CONSTRAINT `node_ibfk_1` FOREIGN KEY (`deviceType`) REFERENCES `devicetype` (`deviceTypeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `node_ibfk_2` FOREIGN KEY (`brand`) REFERENCES `brand` (`brandName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `node_ibfk_4` FOREIGN KEY (`ipMGNT`) REFERENCES `ipmgnt` (`ipMGNT4List`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `node_ibfk_5` FOREIGN KEY (`usablePorts`) REFERENCES `usableports` (`singlePortList`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `node_ibfk_6` FOREIGN KEY (`locationCode`) REFERENCES `locationcodes` (`locationDescription`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `node_ibfk_7` FOREIGN KEY (`model`) REFERENCES `model` (`modelName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nodemasterdata
-- ----------------------------
DROP TABLE IF EXISTS `nodemasterdata`;
CREATE TABLE `nodemasterdata`  (
  `nodeID` int NOT NULL,
  `subType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessEquipment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `etherType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ipv4` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ipv6` inet6 NULL,
  `asnRange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rdRange` int NULL DEFAULT NULL,
  `rtRange` int NULL DEFAULT NULL,
  `pathCalculationPolicy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nodeServiceType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nodeID`) USING BTREE,
  INDEX `subType`(`subType`) USING BTREE,
  INDEX `node`(`node`) USING BTREE,
  INDEX `accessSwitch`(`accessEquipment`) USING BTREE,
  INDEX `etherType`(`etherType`) USING BTREE,
  INDEX `ipv4`(`ipv4`) USING BTREE,
  INDEX `ipv6`(`ipv6`) USING BTREE,
  INDEX `asnRange`(`asnRange`) USING BTREE,
  INDEX `rdRange`(`rdRange`) USING BTREE,
  INDEX `rtRange`(`rtRange`) USING BTREE,
  INDEX `nodeServiceType`(`nodeServiceType`) USING BTREE,
  INDEX `pathCalculationPolicy`(`pathCalculationPolicy`) USING BTREE,
  CONSTRAINT `nodemasterdata_ibfk_1` FOREIGN KEY (`subType`) REFERENCES `subtype` (`subTypeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_10` FOREIGN KEY (`ipv6`) REFERENCES `ipv6` (`ipv6WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_13` FOREIGN KEY (`rdRange`) REFERENCES `rdrange` (`rdRange`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_14` FOREIGN KEY (`rtRange`) REFERENCES `rtrange` (`rtRange`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_16` FOREIGN KEY (`nodeServiceType`) REFERENCES `nodeservicetype` (`connnectionType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_17` FOREIGN KEY (`ipv4`) REFERENCES `ipv4s` (`ipv4WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_18` FOREIGN KEY (`pathCalculationPolicy`) REFERENCES `pathcalculationpolicy` (`attributeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_2` FOREIGN KEY (`node`) REFERENCES `node` (`nodeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_3` FOREIGN KEY (`accessEquipment`) REFERENCES `accessswitch` (`deviceType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_5` FOREIGN KEY (`etherType`) REFERENCES `ethertype` (`etherCode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nodemasterdata_ibfk_9` FOREIGN KEY (`ipv6`) REFERENCES `onnet` (`accessSwitchRouterIPv6`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for nodeservicetype
-- ----------------------------
DROP TABLE IF EXISTS `nodeservicetype`;
CREATE TABLE `nodeservicetype`  (
  `type` int NOT NULL,
  `connnectionType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vpnType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type`) USING BTREE,
  INDEX `connnectionType`(`connnectionType`) USING BTREE,
  CONSTRAINT `nodeservicetype_ibfk_1` FOREIGN KEY (`connnectionType`) REFERENCES `connectiontype` (`connectionTypeName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for offnet
-- ----------------------------
DROP TABLE IF EXISTS `offnet`;
CREATE TABLE `offnet`  (
  `offnetCID` int NOT NULL,
  `providorName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `configurationPage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `speed` float NULL DEFAULT NULL,
  `unit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`offnetCID`) USING BTREE,
  INDEX `providorName`(`providorName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for onnet
-- ----------------------------
DROP TABLE IF EXISTS `onnet`;
CREATE TABLE `onnet`  (
  `node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `downlinkPort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uplinkPort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessNumber` int NULL DEFAULT NULL,
  `coreTopoNumber` int NULL DEFAULT NULL,
  `accessSwitchRouterType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessSwitchRouterName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessSwitchRouterIPv4` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accessSwitchRouterIPv6` inet6 NULL,
  `siteConnectionType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `l2vpnAttributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `l3vpnAttributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  INDEX `accessSwitchRouterIPv6`(`accessSwitchRouterIPv6`) USING BTREE,
  INDEX `node`(`node`) USING BTREE,
  INDEX `downlinkPort`(`downlinkPort`) USING BTREE,
  INDEX `uplinkPort`(`uplinkPort`) USING BTREE,
  INDEX `accessSwitchRouterType`(`accessSwitchRouterType`) USING BTREE,
  INDEX `accessSwitchRouterName`(`accessSwitchRouterName`) USING BTREE,
  INDEX `l3vpnAttributes`(`l3vpnAttributes`) USING BTREE,
  INDEX `l2vpnAttributes`(`l2vpnAttributes`) USING BTREE,
  INDEX `accessSwitchRouterIPv4`(`accessSwitchRouterIPv4`) USING BTREE,
  CONSTRAINT `onnet_ibfk_1` FOREIGN KEY (`node`) REFERENCES `nodemasterdata` (`node`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_10` FOREIGN KEY (`accessSwitchRouterIPv4`) REFERENCES `ipv4s` (`ipv4WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_2` FOREIGN KEY (`downlinkPort`) REFERENCES `accessswitch` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_3` FOREIGN KEY (`uplinkPort`) REFERENCES `accessswitch` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_4` FOREIGN KEY (`accessSwitchRouterType`) REFERENCES `accessswitch` (`deviceType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_5` FOREIGN KEY (`accessSwitchRouterName`) REFERENCES `accessswitch` (`switchName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_7` FOREIGN KEY (`accessSwitchRouterIPv6`) REFERENCES `ipv6` (`ipv6WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_8` FOREIGN KEY (`l2vpnAttributes`) REFERENCES `l2vpnattributess` (`connectionType`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `onnet_ibfk_9` FOREIGN KEY (`l3vpnAttributes`) REFERENCES `l3vpnattributess` (`connectionType`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ospfparameters
-- ----------------------------
DROP TABLE IF EXISTS `ospfparameters`;
CREATE TABLE `ospfparameters`  (
  `ospfAreaID` int NULL DEFAULT NULL,
  `ospfPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `networkType` int NULL DEFAULT NULL,
  `deadInterval` int NULL DEFAULT NULL,
  `helloInterval` int NULL DEFAULT NULL,
  `originateDefaultRoute` tinyint(1) NULL DEFAULT NULL,
  `tag` int NULL DEFAULT NULL,
  `cost` int NULL DEFAULT NULL,
  INDEX `ospfAreaID`(`ospfAreaID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pathcalculationpolicy
-- ----------------------------
DROP TABLE IF EXISTS `pathcalculationpolicy`;
CREATE TABLE `pathcalculationpolicy`  (
  `attributeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `algoID` int NOT NULL,
  `algoName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`attributeName`, `algoID`) USING BTREE,
  INDEX `attributeName`(`attributeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for portneighborportlist
-- ----------------------------
DROP TABLE IF EXISTS `portneighborportlist`;
CREATE TABLE `portneighborportlist`  (
  `portID` int NOT NULL,
  PRIMARY KEY (`portID`) USING BTREE,
  CONSTRAINT `portneighborportlist_ibfk_1` FOREIGN KEY (`portID`) REFERENCES `singleportlist` (`portID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for portstatusactual
-- ----------------------------
DROP TABLE IF EXISTS `portstatusactual`;
CREATE TABLE `portstatusactual`  (
  `statusNumber` bigint NOT NULL,
  `statusName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`statusNumber`) USING BTREE,
  INDEX `statusName`(`statusName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for portstatusplan
-- ----------------------------
DROP TABLE IF EXISTS `portstatusplan`;
CREATE TABLE `portstatusplan`  (
  `statusNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`statusNumber`) USING BTREE,
  INDEX `statusName`(`statusName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for projectname
-- ----------------------------
DROP TABLE IF EXISTS `projectname`;
CREATE TABLE `projectname`  (
  `prjNonCIDID` int NOT NULL,
  `prjNonCIDName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `prjNonCIDCode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `prjNonCIDDesc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `prjNonCIDResp` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`prjNonCIDID`) USING BTREE,
  INDEX `prjNonCIDName`(`prjNonCIDName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for provisioninghistory
-- ----------------------------
DROP TABLE IF EXISTS `provisioninghistory`;
CREATE TABLE `provisioninghistory`  (
  `provisioningID` int NOT NULL AUTO_INCREMENT,
  `provisioningDateTime` datetime NULL DEFAULT NULL,
  `provisioningResult` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rollBackResult` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`provisioningID`) USING BTREE,
  INDEX `provisioningID`(`provisioningID`) USING BTREE,
  INDEX `provisioningDateTime`(`provisioningDateTime`) USING BTREE,
  INDEX `provisioningResult`(`provisioningResult`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for rdrange
-- ----------------------------
DROP TABLE IF EXISTS `rdrange`;
CREATE TABLE `rdrange`  (
  `rdRange` int NOT NULL,
  `rdNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `startRD` int NOT NULL,
  `endRD` int NOT NULL,
  `assign` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`rdRange`, `rdNumber`) USING BTREE,
  INDEX `rdNumber`(`rdNumber`) USING BTREE,
  INDEX `rdRange`(`rdRange`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for rid4
-- ----------------------------
DROP TABLE IF EXISTS `rid4`;
CREATE TABLE `rid4`  (
  `prefixID` int NOT NULL,
  `subnetAddress` int UNSIGNED NOT NULL,
  PRIMARY KEY (`prefixID`, `subnetAddress`) USING BTREE,
  INDEX `subnetAddress`(`subnetAddress`) USING BTREE,
  INDEX `prefixID`(`prefixID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for rid6
-- ----------------------------
DROP TABLE IF EXISTS `rid6`;
CREATE TABLE `rid6`  (
  `prefixID` int NOT NULL,
  `subnetAddress` inet6 NOT NULL,
  PRIMARY KEY (`prefixID`, `subnetAddress`) USING BTREE,
  INDEX `prefixID`(`prefixID`) USING BTREE,
  INDEX `subnetAddress`(`subnetAddress`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for routingprotocol
-- ----------------------------
DROP TABLE IF EXISTS `routingprotocol`;
CREATE TABLE `routingprotocol`  (
  `protocolID` int NOT NULL,
  `routingProtocol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ipv4` int NULL DEFAULT NULL,
  `ipv6` inet6 NULL,
  `staticParameters` inet6 NULL,
  `ospfParameters` int NULL DEFAULT NULL,
  `bgpParameters` double NULL DEFAULT NULL,
  `routingOrder` int NULL DEFAULT NULL,
  PRIMARY KEY (`protocolID`) USING BTREE,
  INDEX `routingProtocol`(`routingProtocol`) USING BTREE,
  INDEX `ipv4`(`ipv4`) USING BTREE,
  INDEX `ipv6`(`ipv6`) USING BTREE,
  INDEX `staticParameters`(`staticParameters`) USING BTREE,
  INDEX `ospfParameters`(`ospfParameters`) USING BTREE,
  INDEX `bgpParameters`(`bgpParameters`) USING BTREE,
  CONSTRAINT `routingprotocol_ibfk_1` FOREIGN KEY (`ipv4`) REFERENCES `ipv4` (`ipv4WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `routingprotocol_ibfk_2` FOREIGN KEY (`ipv6`) REFERENCES `ipv6` (`ipv6WAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `routingprotocol_ibfk_3` FOREIGN KEY (`staticParameters`) REFERENCES `staticparameters` (`nextHopIPv6`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `routingprotocol_ibfk_4` FOREIGN KEY (`ospfParameters`) REFERENCES `ospfparameters` (`ospfAreaID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `routingprotocol_ibfk_5` FOREIGN KEY (`bgpParameters`) REFERENCES `bgpparameters` (`providorASN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rtrange
-- ----------------------------
DROP TABLE IF EXISTS `rtrange`;
CREATE TABLE `rtrange`  (
  `rtRange` int NOT NULL,
  `rtNumber` int NOT NULL,
  `assign` tinyint(1) NULL DEFAULT NULL,
  `rtType` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`rtRange`, `rtNumber`) USING BTREE,
  INDEX `rtNumber`(`rtNumber`) USING BTREE,
  INDEX `rtRange`(`rtRange`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for servicename
-- ----------------------------
DROP TABLE IF EXISTS `servicename`;
CREATE TABLE `servicename`  (
  `itemCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `itemDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for servicespeed
-- ----------------------------
DROP TABLE IF EXISTS `servicespeed`;
CREATE TABLE `servicespeed`  (
  `spType` int NOT NULL,
  `spTypeName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `spValue` double NULL DEFAULT NULL,
  `spUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qosFlag` tinyint(1) NULL DEFAULT NULL,
  `classBandwidthPercent` int NULL DEFAULT NULL,
  `classBandwidthValue` double NULL DEFAULT NULL,
  `classBandwidthUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tos` int NULL DEFAULT NULL,
  `precedence` int NULL DEFAULT NULL,
  `cirValue` double NULL DEFAULT NULL,
  `cirUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pirValue` double NULL DEFAULT NULL,
  `pirUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dscp` int NULL DEFAULT NULL,
  PRIMARY KEY (`spType`) USING BTREE,
  INDEX `spValue`(`spValue`) USING BTREE,
  INDEX `spUnit`(`spUnit`) USING BTREE,
  INDEX `spTypeName`(`spTypeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for singleportlist
-- ----------------------------
DROP TABLE IF EXISTS `singleportlist`;
CREATE TABLE `singleportlist`  (
  `portID` int NOT NULL,
  `portName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `portStatusActual` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `portStatusPlan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `portSpeed` float NULL DEFAULT NULL,
  `portUnit` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `portNeighborDeviceList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `portNeighborPortList` int NULL DEFAULT NULL,
  PRIMARY KEY (`portID`) USING BTREE,
  INDEX `portName`(`portName`) USING BTREE,
  INDEX `portStatusActual`(`portStatusActual`) USING BTREE,
  INDEX `portStatusPlan`(`portStatusPlan`) USING BTREE,
  INDEX `portNeighborDeviceList`(`portNeighborDeviceList`) USING BTREE,
  INDEX `portNeighborPortList`(`portNeighborPortList`) USING BTREE,
  CONSTRAINT `singleportlist_ibfk_1` FOREIGN KEY (`portStatusActual`) REFERENCES `portstatusplan` (`statusName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `singleportlist_ibfk_2` FOREIGN KEY (`portStatusPlan`) REFERENCES `portstatusactual` (`statusName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `singleportlist_ibfk_3` FOREIGN KEY (`portNeighborDeviceList`) REFERENCES `neighbordevicelist` (`nodeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `singleportlist_ibfk_4` FOREIGN KEY (`portNeighborPortList`) REFERENCES `lagneighborportlist` (`lagID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for staticparameters
-- ----------------------------
DROP TABLE IF EXISTS `staticparameters`;
CREATE TABLE `staticparameters`  (
  `nextHopIPv6` inet6 NULL,
  `nextHopIPv4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `destSubnetv6` inet6 NULL,
  `destSubnetv4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  INDEX `nextHopIPv6`(`nextHopIPv6`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for subtype
-- ----------------------------
DROP TABLE IF EXISTS `subtype`;
CREATE TABLE `subtype`  (
  `subType` int NOT NULL,
  `subTypeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`subType`) USING BTREE,
  INDEX `subTypeName`(`subTypeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `TaskID` int NOT NULL AUTO_INCREMENT,
  `Task_Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Task_Completed` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`TaskID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for usableports
-- ----------------------------
DROP TABLE IF EXISTS `usableports`;
CREATE TABLE `usableports`  (
  `singlePortList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lagPortsList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  INDEX `singlePortList`(`singlePortList`) USING BTREE,
  INDEX `lagPortsList`(`lagPortsList`) USING BTREE,
  CONSTRAINT `usableports_ibfk_1` FOREIGN KEY (`singlePortList`) REFERENCES `singleportlist` (`portName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `usableports_ibfk_2` FOREIGN KEY (`lagPortsList`) REFERENCES `lagportlist` (`lagPortStatusActual`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for verify
-- ----------------------------
DROP TABLE IF EXISTS `verify`;
CREATE TABLE `verify`  (
  `verify_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `range_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `range_2` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`verify_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for vlan
-- ----------------------------
DROP TABLE IF EXISTS `vlan`;
CREATE TABLE `vlan`  (
  `vlanID` int NOT NULL,
  `vlanFrontDigit` int NULL DEFAULT NULL,
  PRIMARY KEY (`vlanID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vlannumber
-- ----------------------------
DROP TABLE IF EXISTS `vlannumber`;
CREATE TABLE `vlannumber`  (
  `vlanID` int NOT NULL,
  `assign` tinyint NULL DEFAULT NULL,
  `node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `interface` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`vlanID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vlannumbers
-- ----------------------------
DROP TABLE IF EXISTS `vlannumbers`;
CREATE TABLE `vlannumbers`  (
  `vlanID` int NOT NULL,
  `assign` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`vlanID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
