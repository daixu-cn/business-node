/*
 Navicat MySQL Data Transfer

 Source Server         : WEB
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : business_system

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 18/05/2021 18:24:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `classify_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `userId` int(0) NOT NULL COMMENT '用户id',
  `classify_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`classify_id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `classify_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (1, 1, '汉堡');
INSERT INTO `classify` VALUES (2, 1, '小吃');
INSERT INTO `classify` VALUES (3, 1, '套餐');
INSERT INTO `classify` VALUES (15, 5, '生活用品');

-- ----------------------------
-- Table structure for convertibility
-- ----------------------------
DROP TABLE IF EXISTS `convertibility`;
CREATE TABLE `convertibility`  (
  `convertibility_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '可兑换列表id',
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '兑换产品的名字',
  `conversion_integral` int(0) NOT NULL COMMENT '需要兑换的积分数',
  PRIMARY KEY (`convertibility_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of convertibility
-- ----------------------------
INSERT INTO `convertibility` VALUES (1, 1, '牙刷', 20);
INSERT INTO `convertibility` VALUES (2, 1, '毛巾', 30);
INSERT INTO `convertibility` VALUES (7, 1, '会员卡', 100);
INSERT INTO `convertibility` VALUES (8, 1, '鼠标垫', 1);
INSERT INTO `convertibility` VALUES (9, 1, '洗面奶', 15);

-- ----------------------------
-- Table structure for for_record
-- ----------------------------
DROP TABLE IF EXISTS `for_record`;
CREATE TABLE `for_record`  (
  `record_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '兑换记录id',
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `convertibility_id` int(0) NOT NULL COMMENT '兑换的产品编号',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '兑换人的手机号',
  `record_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '兑换时间',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `record_id`(`record_id`, `convertibility_id`) USING BTREE,
  INDEX `convertibility_id`(`convertibility_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of for_record
-- ----------------------------
INSERT INTO `for_record` VALUES (1, 1, 17, '13858707362', '2020-10-29 21:25:24');
INSERT INTO `for_record` VALUES (2, 1, 14, '13858707362', '2020-10-29 21:26:24');
INSERT INTO `for_record` VALUES (3, 1, 15, '13858707362', '2020-10-29 22:07:05');
INSERT INTO `for_record` VALUES (4, 1, 8, '2064889594', '2020-10-29 22:36:10');
INSERT INTO `for_record` VALUES (5, 1, 8, '2064889594', '2020-10-29 22:36:12');
INSERT INTO `for_record` VALUES (6, 1, 2, '13858707362', '2020-10-29 22:36:29');
INSERT INTO `for_record` VALUES (7, 1, 1, '13858707362', '2020-10-29 22:36:37');
INSERT INTO `for_record` VALUES (8, 1, 1, '13858707362', '2020-10-29 22:36:41');
INSERT INTO `for_record` VALUES (9, 1, 1, '13858707362', '2020-10-29 22:36:44');
INSERT INTO `for_record` VALUES (10, 1, 17, '13858707362', '2020-10-29 22:36:58');
INSERT INTO `for_record` VALUES (11, 1, 17, '13858707362', '2020-10-29 22:37:00');
INSERT INTO `for_record` VALUES (12, 1, 17, '13858707362', '2020-10-29 22:37:01');
INSERT INTO `for_record` VALUES (13, 1, 15, '13858707362', '2020-10-29 22:37:03');
INSERT INTO `for_record` VALUES (14, 1, 17, '13858707362', '2020-10-29 23:02:11');
INSERT INTO `for_record` VALUES (15, 1, 9, '13858707362', '2020-12-24 19:21:21');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `member_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `member_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员用户名',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '会员手机号',
  `integral` int(0) NOT NULL DEFAULT 0 COMMENT '积分',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 1, 'daixu', '13858707362', 413, '2020-10-26 12:12:48');
INSERT INTO `member` VALUES (2, 1, '张三丰', '2064889594', 3, '2020-10-26 12:26:21');
INSERT INTO `member` VALUES (4, 5, '王五', '987654321', 0, '2020-10-27 15:25:29');

-- ----------------------------
-- Table structure for order_form
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form`  (
  `orderForm_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `product_id` int(0) NOT NULL COMMENT '产品编号',
  `kind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单种类(堂食,外卖......)',
  `member_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '会员手机号',
  `exchangeIntegral` int(0) NOT NULL DEFAULT 0 COMMENT '单笔订单给会员增加的积分数',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '订单创建日期',
  PRIMARY KEY (`orderForm_id`) USING BTREE,
  INDEX `member_phone`(`member_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO `order_form` VALUES (40, 5, 77, '', '', 0, '2020-10-26 16:55:42');
INSERT INTO `order_form` VALUES (41, 1, 46, '堂食/打包', '13858707362', 0, '2020-10-26 17:23:55');
INSERT INTO `order_form` VALUES (45, 1, 44, '饿了么', '13858707362', 0, '2020-10-26 20:06:27');
INSERT INTO `order_form` VALUES (46, 1, 41, '堂食/打包', '13858707362', 0, '2020-10-25 20:06:31');
INSERT INTO `order_form` VALUES (49, 1, 76, '堂食/打包', '', 0, '2020-10-27 20:11:38');
INSERT INTO `order_form` VALUES (54, 1, 77, '堂食/打包', '13858707362', 23, '2020-10-27 20:23:21');
INSERT INTO `order_form` VALUES (59, 1, 46, '堂食/打包', '13858707362', 0, '2020-01-26 17:12:36');
INSERT INTO `order_form` VALUES (60, 1, 76, '堂食/打包', '13858707362', 0, '2020-10-30 18:31:51');
INSERT INTO `order_form` VALUES (61, 1, 76, '堂食/打包', '13858707362', 0, '2020-01-30 18:32:03');
INSERT INTO `order_form` VALUES (62, 1, 41, '堂食/打包', '13858707362', 0, '2020-01-30 18:32:11');
INSERT INTO `order_form` VALUES (63, 1, 39, '堂食/打包', '13858707362', 0, '2020-10-30 18:32:14');
INSERT INTO `order_form` VALUES (64, 1, 38, '堂食/打包', '13858707362', 0, '2020-10-30 18:32:17');
INSERT INTO `order_form` VALUES (65, 1, 39, '堂食/打包', '13858707362', 0, '2020-10-30 18:32:23');
INSERT INTO `order_form` VALUES (66, 1, 38, '堂食/打包', '13858707362', 0, '2020-10-30 18:32:26');
INSERT INTO `order_form` VALUES (67, 1, 39, '堂食/打包', '13858707362', 0, '2020-10-30 18:32:29');
INSERT INTO `order_form` VALUES (68, 1, 39, '堂食/打包', '13858707362', 0, '2020-10-30 18:32:32');
INSERT INTO `order_form` VALUES (69, 1, 36, '美团', '13858707362', 0, '2020-10-30 18:32:37');
INSERT INTO `order_form` VALUES (70, 1, 36, '堂食/打包', '13858707362', 0, '2020-07-30 18:32:40');
INSERT INTO `order_form` VALUES (71, 1, 36, '美团', '13858707362', 0, '2020-07-30 18:32:43');
INSERT INTO `order_form` VALUES (72, 1, 34, '堂食/打包', '13858707362', 0, '2020-08-30 18:32:45');
INSERT INTO `order_form` VALUES (73, 1, 34, '堂食/打包', '13858707362', 0, '2019-10-30 18:32:48');
INSERT INTO `order_form` VALUES (74, 1, 34, '堂食/打包', '13858707362', 0, '2019-10-30 18:32:57');
INSERT INTO `order_form` VALUES (75, 1, 45, '堂食/打包', '13858707362', 20, '2019-08-15 18:33:03');
INSERT INTO `order_form` VALUES (76, 1, 77, '美团', '', 0, '2020-12-13 12:01:34');
INSERT INTO `order_form` VALUES (77, 1, 86, '堂食/打包', '', 0, '2020-12-16 19:53:22');
INSERT INTO `order_form` VALUES (78, 1, 86, '堂食/打包', '', 0, '2020-12-16 19:56:00');
INSERT INTO `order_form` VALUES (79, 1, 87, '堂食/打包', '', 0, '2020-12-30 20:56:07');
INSERT INTO `order_form` VALUES (80, 1, 87, '堂食/打包', '13858707362', 5, '2020-12-30 20:56:28');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `user_id` int(0) NOT NULL COMMENT '区分哪个用户的商品',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品名称',
  `product_detailed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品内容',
  `purchasing_price` float(10, 2) NOT NULL COMMENT '进货价格',
  `selling_price` float(10, 2) NOT NULL COMMENT '进货价格',
  `inventory` int(0) NOT NULL DEFAULT 0 COMMENT '库存是否充足0:是',
  `classify_id` int(0) NOT NULL DEFAULT 0 COMMENT '商品分类',
  `product_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product_img' COMMENT '商品图片',
  `exchangeIntegral` int(0) NOT NULL DEFAULT 0 COMMENT '兑换所增加的积分',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `product_ibfk_1`(`user_id`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (34, 1, '牛气冲天堡+中可', '很牛的汉堡+中杯可乐', 10.02, 20.00, 0, 3, 'product_img', 0);
INSERT INTO `product` VALUES (35, 1, '香辣鸡腿堡', '很香很辣的鸡腿堡', 7.22, 14.70, 0, 2, 'product_img', 10);
INSERT INTO `product` VALUES (36, 1, '香辣伴翅', '酥脆可口,滋味鲜美', 6.20, 11.90, 0, 2, 'product_img', 0);
INSERT INTO `product` VALUES (37, 1, '秘制烤翅', '鲜嫩多汁，风味独特', 6.40, 11.90, 0, 2, 'product_img', 0);
INSERT INTO `product` VALUES (38, 1, '辣味鸡肉卷', '一张破饼包起来的鬼东西', 10.20, 14.90, 0, 0, 'product_img', 0);
INSERT INTO `product` VALUES (39, 1, '大薯条', '优选新鲜土豆，色泽柔韧', 6.50, 11.90, 0, 2, 'product_img', 0);
INSERT INTO `product` VALUES (40, 1, '脆皮鸡块', '主要原谅：鸡肉', 4.50, 8.90, 1, 2, 'product_img', 0);
INSERT INTO `product` VALUES (41, 1, '黑椒鸡块', '精选鸡肉烹炸', 6.50, 11.90, 0, 2, 'product_img', 0);
INSERT INTO `product` VALUES (42, 1, '香辣鸡腿堡+黑椒鸡块+鸡米花+中可', '香辣鸡腿堡+黑椒鸡块+鸡米花+中可', 10.50, 20.90, 1, 3, 'product_img', 0);
INSERT INTO `product` VALUES (43, 1, '牛肉汉堡', '甄选高品质牛肉', 6.60, 14.90, 1, 1, 'product_img', 0);
INSERT INTO `product` VALUES (44, 1, '脆皮全翅', '主要原料：鸡肉', 6.60, 11.90, 0, 2, 'product_img', 0);
INSERT INTO `product` VALUES (45, 1, '脆皮炸全鸡', '招牌鸡，外酥里嫩', 10.00, 26.90, 0, 0, '160933294427237574', 20);
INSERT INTO `product` VALUES (46, 1, '蜜汁手扒鸡+中可', '一只鸡一杯可乐', 18.00, 29.90, 0, 3, '160299490859956903', 0);
INSERT INTO `product` VALUES (80, 5, '牙刷', '洗刷刷洗刷刷', 12.50, 25.80, 0, 15, '160299523547473869', 0);
INSERT INTO `product` VALUES (81, 5, '毛巾', '擦擦擦擦脸的毛巾', 13.50, 30.20, 1, 0, '160299527103913392', 0);
INSERT INTO `product` VALUES (87, 1, '罗大炮(测试)', '45', 45.00, 64.00, 0, 1, '160933289344036894', 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户唯一编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0c7540eb7e65b553ec1ba6b20de79608' COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '邮箱',
  `member` int(0) NOT NULL DEFAULT 0 COMMENT '是否会员1：是',
  `creation_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'daixu', '0c7540eb7e65b553ec1ba6b20de79608', 'wjw_daixu@163.com', 1, '2020-10-07 17:13:49');
INSERT INTO `user` VALUES (5, '张三丰', '0c7540eb7e65b553ec1ba6b20de79608', '2064889594@qq.com', 0, '2020-10-12 11:40:32');
INSERT INTO `user` VALUES (6, '987', 'b0063931585f957f3a57150f0f48303f', 'wjw_daixu@163.com', 0, '2020-12-24 19:02:29');

SET FOREIGN_KEY_CHECKS = 1;
