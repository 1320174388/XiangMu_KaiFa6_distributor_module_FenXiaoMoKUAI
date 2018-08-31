/*
Navicat MySQL Data Transfer

Source Server         : 云数据库
Source Server Version : 50718
Source Host           : gz-cdb-9yvp3vjn.sql.tencentcdb.com:63119
Source Database       : DLTH_XM_KAIFA_CHESHI_DATABASE

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-08-31 14:52:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for data_distribution_members
-- ----------------------------
DROP TABLE IF EXISTS `data_distribution_members`;
CREATE TABLE `data_distribution_members` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户token唯一',
  `member_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '成员名称',
  `member_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成员头像图片路径',
  `member_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `member_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `member_status` int(2) DEFAULT '0' COMMENT '推客状态',
  `parent_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上级token标识',
  `created_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `undated_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_token` (`user_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for data_distribution_orders
-- ----------------------------
DROP TABLE IF EXISTS `data_distribution_orders`;
CREATE TABLE `data_distribution_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `json_buyer` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `json_seller` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `json_order` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profit_price` float(10,2) DEFAULT NULL,
  `profit_ratio` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_status` int(10) DEFAULT NULL,
  `order_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_token` (`order_number`,`user_token`,`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for data_distribution_profit
-- ----------------------------
DROP TABLE IF EXISTS `data_distribution_profit`;
CREATE TABLE `data_distribution_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profit_price` float(10,2) DEFAULT '0.00',
  `created_time` int(11) DEFAULT NULL,
  `updated_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_token` (`user_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for data_distribution_putforward
-- ----------------------------
DROP TABLE IF EXISTS `data_distribution_putforward`;
CREATE TABLE `data_distribution_putforward` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forward_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forward_money` float(10,0) DEFAULT NULL,
  `forward_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_token` (`user_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
