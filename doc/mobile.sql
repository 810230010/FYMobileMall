/*
Navicat MySQL Data Transfer

Source Server         : test_space
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : mobile

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-03-02 19:30:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fy_address`
-- ----------------------------
DROP TABLE IF EXISTS `fy_address`;
CREATE TABLE `fy_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(50) DEFAULT NULL,
  `goods_taker` varchar(10) DEFAULT NULL COMMENT '收货人',
  `tel` varchar(20) DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fy_address
-- ----------------------------
INSERT INTO `fy_address` VALUES ('1', '浙江省杭州余杭闲林北山畈', '江建平', '17858936109', '1', '2018-12-12 12:00:00', null);
INSERT INTO `fy_address` VALUES ('2', '阿拉伯', 'jay', '17858936109', '1', '2018-02-16 15:53:49', null);

-- ----------------------------
-- Table structure for `fy_message`
-- ----------------------------
DROP TABLE IF EXISTS `fy_message`;
CREATE TABLE `fy_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1024) DEFAULT NULL,
  `message_type` tinyint(1) DEFAULT NULL COMMENT '留言类型0:需求下的留言  1：售后留言',
  `message_publisher_id` int(11) DEFAULT NULL,
  `message_publisher_name` varchar(20) DEFAULT NULL,
  `need_sell_id` int(11) DEFAULT NULL,
  `publish_time` varchar(20) DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0' COMMENT '0:未处理   1:已处理',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fy_message
-- ----------------------------
INSERT INTO `fy_message` VALUES ('1', '还要吗  老哥。', '0', '1', 'Bonjour', '4', '2018-02-06 15:58:31', '0');
INSERT INTO `fy_message` VALUES ('3', '你这个手机有点奇怪', '1', '1', 'Bonjour', '1', '2018-02-19 17:01:57', '0');

-- ----------------------------
-- Table structure for `fy_need_publish`
-- ----------------------------
DROP TABLE IF EXISTS `fy_need_publish`;
CREATE TABLE `fy_need_publish` (
  `need_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) DEFAULT NULL COMMENT '发布者编号->user_id',
  `publisher_name` varchar(50) DEFAULT NULL COMMENT '发布需求人姓名->nickname',
  `need_title` varchar(200) DEFAULT NULL COMMENT '需求标题',
  `need_description` varchar(1024) DEFAULT NULL,
  `comment_no` int(11) DEFAULT '0' COMMENT '评论数',
  `state` tinyint(1) DEFAULT '1' COMMENT '0:已删除   1：已开启',
  `publish_time` varchar(50) DEFAULT NULL COMMENT '发布需求时间',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改需求时间',
  PRIMARY KEY (`need_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fy_need_publish
-- ----------------------------
INSERT INTO `fy_need_publish` VALUES ('4', '1', 'Bonjour', '求一部肾10啊', '<p>哪位好心人，卖个便宜的苹果x.<img src=\"http://p3cv1ndf7.bkt.clouddn.com/1513667969(1).jpg\" style=\"max-width: 100%;\"></p><p><br></p>', '1', '1', '2018-01-31 15:31:12', null);

-- ----------------------------
-- Table structure for `fy_order`
-- ----------------------------
DROP TABLE IF EXISTS `fy_order`;
CREATE TABLE `fy_order` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `buy_user_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `buy_user_name` varchar(10) DEFAULT NULL,
  `sell_item_id` int(11) DEFAULT NULL,
  `sell_user_id` int(11) DEFAULT NULL,
  `sell_user_name` varchar(10) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0' COMMENT '0:已下单  1:交易成功 2：已发货 ',
  `pay_type` tinyint(1) DEFAULT '0' COMMENT '0:货到付款   1:在线付款  ',
  `pay_price` varchar(10) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fy_order
-- ----------------------------
INSERT INTO `fy_order` VALUES ('1000000953632401', '1', 'Bonjour', '1', '1', 'Bonjour', '1', '0', '1,000', '1', '2018-02-16 21:55:57');

-- ----------------------------
-- Table structure for `fy_sell_publish`
-- ----------------------------
DROP TABLE IF EXISTS `fy_sell_publish`;
CREATE TABLE `fy_sell_publish` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(255) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `sell_title` varchar(1024) DEFAULT NULL,
  `image` varchar(1024) DEFAULT NULL,
  `sell_description` varchar(1024) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `brand_name` varchar(20) DEFAULT NULL,
  `love_no` int(11) DEFAULT '0' COMMENT '喜爱人数',
  `comment_no` int(11) DEFAULT '0' COMMENT '评论人数',
  `publish_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '2' COMMENT '0:审核未通过  1：审核通过   2：待审核  3:已有人下单  4:关闭',
  PRIMARY KEY (`sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fy_sell_publish
-- ----------------------------
INSERT INTO `fy_sell_publish` VALUES ('1', 'Bonjour', '1', '九成新iphone X', 'http://p3cv1ndf7.bkt.clouddn.com/TB2dDHnoCYH8KJjSspdXXcRgVXa_!!0-fleamarket.jpg_728x728.jpg', '九成新，只要1000元。', '1000', null, '0', '0', '2018-02-01 16:52:36', null, '1');

-- ----------------------------
-- Table structure for `fy_user`
-- ----------------------------
DROP TABLE IF EXISTS `fy_user`;
CREATE TABLE `fy_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号，自增主键',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `tel` varchar(14) DEFAULT NULL COMMENT '电话号码',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `create_time` varchar(20) DEFAULT NULL COMMENT '用户创建时间',
  `update_time` varchar(20) DEFAULT NULL COMMENT '用户信息修改时间',
  `user_type` tinyint(1) DEFAULT '0' COMMENT '0:普通用户 1:管理员',
  `state` tinyint(4) DEFAULT '1' COMMENT '0:无效   1：有效  ',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fy_user
-- ----------------------------
INSERT INTO `fy_user` VALUES ('1', 'Bonjour', '17858936109', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2018-01-30', null, '0', null);
DROP TRIGGER IF EXISTS `addComment`;
DELIMITER ;;
CREATE TRIGGER `addComment` AFTER INSERT ON `fy_message` FOR EACH ROW if new.message_type=0 then
update fy_need_publish set comment_no = comment_no + 1 where need_id = new.need_sell_id;
end if
;;
DELIMITER ;
