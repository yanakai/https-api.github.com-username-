/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:7826
 Source Schema         : shi_yuan

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 01/02/2023 23:14:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_additional_info
-- ----------------------------
DROP TABLE IF EXISTS `b_additional_info`;
CREATE TABLE `b_additional_info`  (
  `additional_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `additional_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附加项名称',
  `additional_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '附加项金额',
  `duration` int NULL DEFAULT NULL COMMENT '服务项目时长单位分钟',
  `data_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务项目类型 1：主服务项目；2：附加项项目',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` datetime NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`additional_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务表---服务项目信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_additional_info
-- ----------------------------
INSERT INTO `b_additional_info` VALUES (2, '98全是推拿调理', 98.00, 60, '1', 0, '2023-01-11 23:21:28', NULL, '2023-01-31 21:03:27', NULL, NULL);
INSERT INTO `b_additional_info` VALUES (4, '小儿', 20.00, 10, '2', 1, '2023-02-01 22:22:45', NULL, NULL, NULL, NULL);
INSERT INTO `b_additional_info` VALUES (5, '拔罐', 30.00, 10, '2', 2, '2023-02-01 22:23:06', NULL, NULL, NULL, NULL);
INSERT INTO `b_additional_info` VALUES (6, '刮痧', 30.00, 10, '2', 3, '2023-02-01 22:23:26', NULL, NULL, NULL, NULL);
INSERT INTO `b_additional_info` VALUES (7, '走罐', 30.00, 10, '2', 4, '2023-02-01 22:28:03', NULL, NULL, NULL, NULL);
INSERT INTO `b_additional_info` VALUES (8, '热疗', 30.00, 10, '2', 5, '2023-02-01 22:28:21', NULL, NULL, NULL, NULL);
INSERT INTO `b_additional_info` VALUES (9, '中草药热敷', 30.00, 10, '2', 6, '2023-02-01 22:28:57', NULL, NULL, NULL, NULL);
INSERT INTO `b_additional_info` VALUES (10, '机器艾灸', 30.00, 10, '2', 7, '2023-02-01 22:29:15', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for b_artificer_info
-- ----------------------------
DROP TABLE IF EXISTS `b_artificer_info`;
CREATE TABLE `b_artificer_info`  (
  `artificer_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '所属店铺id',
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属门店名称',
  `artificer_full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '技师名称',
  `artificer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '技师简称',
  `artificer_level` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '技师等级关联字典表类型b_artificer_level',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别关联字典表（0男 1女 2未知）',
  `salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '薪资',
  `entry_time` datetime NULL DEFAULT NULL COMMENT '入职时间',
  `speciality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特长',
  `is_bell` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否排钟（0：否；1：是）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`artificer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务表--技师表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_artificer_info
-- ----------------------------
INSERT INTO `b_artificer_info` VALUES (4, 101, '典唐按摩', '1 号张三', '1 号张三', '0', '18888888888', '0', 1.00, '2022-09-01 00:00:00', '反对犯得上大师傅大师傅撒打发撒打发撒打发撒打发撒打发撒打发sd', 'Y', 'f撒打发稍等撒打发撒打发', 'admin', '2022-09-02 12:23:16', NULL, NULL);
INSERT INTO `b_artificer_info` VALUES (5, 200, '典唐按摩', '1 李四', '李四', '0', '15555555555', '0', 233.00, '2022-09-03 00:00:00', '容易引发', 'Y', 'i给i不可能空间', 'admin', '2022-09-03 17:35:45', NULL, NULL);
INSERT INTO `b_artificer_info` VALUES (6, 100, '典唐按摩', '1号田师傅', '田师傅', '1', '15891727073', '0', NULL, '2022-09-06 00:00:00', NULL, 'Y', NULL, 'admin', '2022-09-06 17:18:31', NULL, NULL);

-- ----------------------------
-- Table structure for b_member_card
-- ----------------------------
DROP TABLE IF EXISTS `b_member_card`;
CREATE TABLE `b_member_card`  (
  `card_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员卡名称',
  `card_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员卡类型',
  `card_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员卡金额',
  `card_give_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员卡赠送金额',
  `single_amount` decimal(6, 2) NULL DEFAULT NULL COMMENT '单次金额',
  `card_times` int NULL DEFAULT NULL COMMENT '会员次数卡',
  `data_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员卡标识（旧会员卡、新会员卡）',
  `create_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务表--会员卡信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_member_card
-- ----------------------------
INSERT INTO `b_member_card` VALUES (4, '1000 送300', '1', 1000.00, 300.00, 60.00, 0, NULL, NULL, '2022-09-02 21:59:26', NULL, NULL);
INSERT INTO `b_member_card` VALUES (5, '2000 送 600', '1', 2000.00, 600.00, 80.00, 0, NULL, NULL, '2022-09-02 21:59:48', NULL, NULL);
INSERT INTO `b_member_card` VALUES (6, '300 送3次', '2', 0.00, 0.00, 0.00, 3, NULL, NULL, '2022-09-03 11:43:06', NULL, NULL);
INSERT INTO `b_member_card` VALUES (7, '500 送5次', '2', 0.00, 0.00, 0.00, 5, NULL, NULL, '2022-09-03 22:16:12', NULL, NULL);
INSERT INTO `b_member_card` VALUES (8, '王', '1', 1000.00, 300.00, 0.00, 0, NULL, NULL, '2022-09-06 17:20:18', NULL, NULL);

-- ----------------------------
-- Table structure for b_member_info
-- ----------------------------
DROP TABLE IF EXISTS `b_member_info`;
CREATE TABLE `b_member_info`  (
  `member_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员姓名',
  `member_phonenumper` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别关联字典表（0男 1女 2未知）',
  `member_password` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员密码',
  `member_card_id` bigint NULL DEFAULT NULL COMMENT '会员卡id（关联表b_member_card）',
  `member_card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员卡名称（关联表b_member_card）',
  `member_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员卡类型（关联表b_member_card）',
  `member_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员卡类型名称（关联表b_member_card）',
  `recharge_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '充值金额（关联表b_member_card）',
  `give_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '赠送金额（关联表b_member_card）',
  `single_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '单次金额（关联表b_member_card）',
  `surplus_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '剩余金额 （充值金额+赠送金额-使用金额）',
  `surplus_times` int NULL DEFAULT NULL COMMENT '剩余次数（关联表b_member_card）',
  `payment_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付方式（关联字典表b_member_paymentType）',
  `artificer_id` bigint NULL DEFAULT NULL COMMENT '办卡技师所属id',
  `artificer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '办卡技师所属名称',
  `member_points` int NULL DEFAULT NULL COMMENT '会员积分',
  `additive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赠品',
  `additive_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赠送数量',
  `card_personnel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '办卡人员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_nema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `modify_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务表--会员信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_member_info
-- ----------------------------
INSERT INTO `b_member_info` VALUES (8, '闫凯', '15555555555', '0', '123456', 4, '1000 送300', '1', NULL, 1000.00, 300.00, 60.00, 1300.00, 0, '1', 4, '1 号张三', 2000, NULL, NULL, 'tryr', NULL, '2022-09-03 21:38:44', NULL, NULL, NULL);
INSERT INTO `b_member_info` VALUES (9, '闫凯', '15538157826', '0', '123456', 7, '500 送5次', '2', NULL, 0.00, 0.00, 0.00, 0.00, 5, '3', 5, '1 李四', 23, NULL, NULL, '闫凯', NULL, '2022-09-03 22:16:51', NULL, NULL, NULL);
INSERT INTO `b_member_info` VALUES (10, '王二', '16602918019', '0', '123456', 4, '1000 送300', '1', NULL, 1000.00, 300.00, 60.00, 5200.00, 0, '3', 6, '1号田师傅', NULL, NULL, NULL, '源姐', NULL, '2022-09-06 17:24:14', NULL, NULL, NULL);
INSERT INTO `b_member_info` VALUES (11, '王二', '16602918019', '0', '123456', 5, '2000 送 600', '1', NULL, 2000.00, 600.00, 60.00, 0.00, 0, '3', 6, '1号田师傅', NULL, NULL, NULL, '源姐', NULL, '2022-09-06 17:24:43', NULL, NULL, NULL);
INSERT INTO `b_member_info` VALUES (12, '王二', '16602918019', '0', '123456', 4, '1000 送300', '1', NULL, 1000.00, 300.00, 60.00, 0.00, 0, '3', 6, '1号田师傅', NULL, NULL, NULL, '源姐', NULL, '2022-09-06 22:10:49', NULL, NULL, NULL);
INSERT INTO `b_member_info` VALUES (13, '王二', '16602918019', '0', '123456', 5, '2000 送 600', '1', NULL, 2000.00, 600.00, 60.00, 2600.00, 0, '3', 6, '1号田师傅', NULL, NULL, NULL, '源姐', NULL, '2022-09-07 21:48:26', NULL, NULL, NULL);
INSERT INTO `b_member_info` VALUES (14, '王二', '16602918019', '0', '123456', 5, '2000 送 600', '1', NULL, 2000.00, 600.00, 80.00, 2600.00, 0, '3', 6, '1号田师傅', NULL, NULL, NULL, '源姐', NULL, '2022-09-07 21:52:45', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for b_order_info
-- ----------------------------
DROP TABLE IF EXISTS `b_order_info`;
CREATE TABLE `b_order_info`  (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '订单开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '订单结束时间',
  `order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `order_state` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单状态关联字典表b_order_state',
  `payment_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单付款类型关联字典表b_order_payment_type',
  `bell_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排钟类型关联字典表 b_order_bell_type',
  `additional_id` bigint NULL DEFAULT NULL COMMENT '服务项目id',
  `additional_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务项目名称',
  `artificer_id` bigint NULL DEFAULT NULL COMMENT '技师id',
  `artificer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '技师名称',
  `member_id` bigint NULL DEFAULT NULL COMMENT '结账会员id',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '业务主表---订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_order_info
-- ----------------------------
INSERT INTO `b_order_info` VALUES (8, '2023-01-31 22:56:00', '2023-01-31 23:56:00', 98.00, '0', NULL, '1', 2, '98全是推拿调理', 4, '1 号张三', NULL, NULL, '2023-01-31 22:56:45', '典唐', NULL, NULL);
INSERT INTO `b_order_info` VALUES (9, '2023-02-01 21:51:00', '2023-02-01 22:51:00', 98.00, '0', NULL, '1', 2, '98全是推拿调理', 5, '1 李四', NULL, NULL, '2023-02-01 21:51:08', '典唐', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'b_artificer_info', '业务表--技师表', NULL, NULL, 'BArtificerInfo', 'crud', 'com.yk.business', 'business', 'artificer', '业务--技师', 'yanakai@126.com', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-09-01 23:47:06', '', '2022-09-01 23:57:42', NULL);
INSERT INTO `gen_table` VALUES (2, 'b_member_info', '业务表--会员信息', NULL, NULL, 'BMemberInfo', 'crud', 'com.yk.business', 'business', 'member', '会员信息', 'yanakai@126.com', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2022-09-02 14:16:44', '', '2022-09-03 21:51:11', NULL);
INSERT INTO `gen_table` VALUES (3, 'b_member_card', '业务表--会员卡信息', NULL, NULL, 'BMemberCard', 'crud', 'com.yk.business', 'business', 'card', '业务--会员卡信息', 'yanakai@126.com', '0', '/', '{}', 'admin', '2022-09-02 16:12:19', '', '2022-09-02 16:30:47', NULL);
INSERT INTO `gen_table` VALUES (4, 'b_additional_info', '服务项目信息', NULL, NULL, 'BAdditionalInfo', 'crud', 'com.yk.business', 'business', 'additional', '附加项单次金额', 'yankai', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2023-01-09 21:35:10', '', '2023-01-11 23:05:16', NULL);
INSERT INTO `gen_table` VALUES (5, 'b_order_info', '业务主表---订单信息表', NULL, NULL, 'BOrderInfo', 'crud', 'com.yk.business', 'business', 'order', '订单信息', 'yankai', '0', '/', '{\"parentMenuId\":\"2032\"}', 'admin', '2023-01-13 21:33:50', '', '2023-01-31 20:53:35', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'artificer_id', '主键id', 'bigint', 'Long', 'artificerId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (2, '1', 'dept_id', '所属店铺id', 'bigint', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (3, '1', 'artificer_full_name', '技师名称', 'varchar(255)', 'String', 'artificerFullName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (4, '1', 'artificer_name', '技师简称', 'varchar(255)', 'String', 'artificerName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (5, '1', 'artificer_level', '技师等级关联字典表类型b_artificer_level', 'char(5)', 'String', 'artificerLevel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (6, '1', 'phone_number', '手机号', 'varchar(11)', 'String', 'phoneNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (7, '1', 'sex', '关联字典表（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (8, '1', 'salary', '薪资', 'decimal(10,2)', 'BigDecimal', 'salary', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (9, '1', 'entry_time', '入职时间', 'datetime', 'Date', 'entryTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (10, '1', 'speciality', '特长', 'varchar(255)', 'String', 'speciality', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (11, '1', 'is_bell', '是否排钟（0：否；1：是）', 'char(1)', 'String', 'isBell', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (12, '1', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (13, '1', 'create_name', '创建人', 'varchar(255)', 'String', 'createName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 14, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (14, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 15, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (15, '1', 'modify_name', '修改人', 'varchar(255)', 'String', 'modifyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 16, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (16, '1', 'modify_time', '修改时间', 'datetime', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2022-09-01 23:47:06', NULL, '2022-09-02 11:12:54');
INSERT INTO `gen_table_column` VALUES (17, '1', 'dept_name', '所属门店名称', 'varchar(255)', 'String', 'deptName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, '', '2022-09-02 11:12:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'member_id', '主键id', 'bigint', 'Long', 'memberId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (19, '2', 'member_name', '会员姓名', 'varchar(255)', 'String', 'memberName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (20, '2', 'member_phonenumper', '手机号', 'varchar(11)', 'String', 'memberPhonenumper', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (21, '2', 'sex', '性别关联字典表（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (23, '2', 'member_type', '会员卡类型（关联表b_member_card）', 'char(2)', 'String', 'memberType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (24, '2', 'recharge_amount', '充值金额（关联表b_member_card）', 'decimal(10,2)', 'BigDecimal', 'rechargeAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (25, '2', 'give_amount', '赠送金额（关联表b_member_card）', 'decimal(10,2)', 'BigDecimal', 'giveAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (26, '2', 'surplus_amount', '剩余金额 （充值金额+赠送金额-使用金额）', 'decimal(10,2)', 'BigDecimal', 'surplusAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (27, '2', 'payment_type', '支付方式（关联字典表b_member_paymentType）', 'char(2)', 'String', 'paymentType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 15, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (28, '2', 'artificer_id', '办卡技师所属id', 'bigint', 'Long', 'artificerId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (29, '2', 'artificer_name', '办卡技师所属名称', 'varchar(255)', 'String', 'artificerName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 17, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (30, '2', 'member_points', '会员积分', 'int', 'Long', 'memberPoints', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (31, '2', 'additive', '赠品', 'varchar(255)', 'String', 'additive', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (32, '2', 'additive_number', '赠送数量', 'varchar(255)', 'String', 'additiveNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (33, '2', 'card_personnel', '办卡人员', 'varchar(255)', 'String', 'cardPersonnel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (34, '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 22, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (35, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 23, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (36, '2', 'create_nema', '创建人', 'varchar(255)', 'String', 'createNema', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (37, '2', 'modify_name', '修改人', 'varchar(255)', 'String', 'modifyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 25, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (38, '2', 'modify_time', '修改时间', 'datetime', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 26, 'admin', '2022-09-02 14:16:44', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (39, '3', 'card_id', '主键id', 'bigint', 'Long', 'cardId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-09-02 16:12:19', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (40, '3', 'card_name', '会员卡名称', 'varchar(255)', 'String', 'cardName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-02 16:12:19', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (41, '3', 'card_type', '会员卡类型', 'char(2)', 'String', 'cardType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-09-02 16:12:19', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (42, '3', 'card_amount', '会员卡金额', 'decimal(10,2)', 'BigDecimal', 'cardAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-09-02 16:12:19', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (43, '3', 'card_give_amount', '会员卡赠送金额', 'decimal(10,2)', 'BigDecimal', 'cardGiveAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-09-02 16:12:19', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (44, '3', 'data_type', '会员卡标识（旧会员卡、新会员卡）', 'char(2)', 'String', 'dataType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2022-09-02 16:12:19', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (45, '3', 'create_name', '创建人', 'varchar(255)', 'String', 'createName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, '', '2022-09-02 16:14:51', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (46, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 10, '', '2022-09-02 16:14:51', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (47, '3', 'modify_name', '修改人', 'varchar(255)', 'String', 'modifyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 11, '', '2022-09-02 16:14:51', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (48, '3', 'modify_time', '修改时间', 'datetime', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 12, '', '2022-09-02 16:14:51', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (49, '2', 'member_card_id', '会员卡id（关联表b_member_card）', 'bigint', 'Long', 'memberCardId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2022-09-02 22:34:26', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (50, '2', 'member_card_name', '会员卡名称（关联表b_member_card）', 'varchar(255)', 'String', 'memberCardName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, '', '2022-09-02 22:34:26', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (51, '2', 'member_type_name', '会员卡类型名称（关联表b_member_card）', 'varchar(255)', 'String', 'memberTypeName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, '', '2022-09-03 12:23:43', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (52, '2', 'member_password', '会员密码', 'varchar(6)', 'String', 'memberPassword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2022-09-03 13:17:26', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (53, '3', 'single_amount', '单次金额', 'decimal(6,2)', 'BigDecimal', 'singleAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2022-09-03 18:34:20', NULL, '2022-09-03 21:49:17');
INSERT INTO `gen_table_column` VALUES (54, '2', 'single_amount', '单次金额（关联表b_member_card）', 'decimal(10,2)', 'BigDecimal', 'singleAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2022-09-03 18:52:58', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (55, '3', 'card_times', '会员次数卡', 'int', 'Long', 'cardTimes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2022-09-03 21:49:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '2', 'surplus_times', '剩余次数（关联表b_member_card）', 'int', 'Long', 'surplusTimes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, '', '2022-09-03 21:51:00', NULL, '2022-09-03 21:51:16');
INSERT INTO `gen_table_column` VALUES (57, '4', 'additional_id', '主键id', 'bigint', 'Long', 'additionalId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (58, '4', 'additional_name', '附加项名称', 'varchar(255)', 'String', 'additionalName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (59, '4', 'additional_amount', '附加项金额', 'decimal(10,2)', 'BigDecimal', 'additionalAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (61, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 7, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (62, '4', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 8, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (63, '4', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 9, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (64, '4', 'update_by', '修改人', 'datetime', 'Date', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 10, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (65, '4', 'remarks', '备注', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-01-09 21:35:10', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (66, '4', 'data_type', '服务项目类型 1：主服务项目；2：附加项项目', 'char(2)', 'String', 'dataType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'b_additional_type', 5, '', '2023-01-11 22:34:41', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (67, '4', 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2023-01-11 22:34:41', NULL, '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (68, '4', 'duration', '服务项目时长单位分钟', 'int', 'Long', 'duration', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, '', '2023-01-11 23:03:23', '', '2023-01-11 23:05:16');
INSERT INTO `gen_table_column` VALUES (69, '5', 'order_id', '订单id', 'bigint', 'Long', 'orderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (70, '5', 'start_time', '订单开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (71, '5', 'end_time', '订单结束时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (72, '5', 'order_amount', '订单金额', 'decimal(10,2)', 'BigDecimal', 'orderAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (73, '5', 'order_state', '订单状态关联字典表b_order_state', 'char(2)', 'String', 'orderState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'b_order_state', 5, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (74, '5', 'bell_type', '排钟类型关联字典表 b_order_bell_type', 'char(2)', 'String', 'bellType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'b_order_bell_type', 7, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (75, '5', 'additional_id', '服务项目id', 'bigint', 'Long', 'additionalId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'b_additional_type', 8, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (76, '5', 'additional_name', '服务项目名称', 'varchar(255)', 'String', 'additionalName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:31');
INSERT INTO `gen_table_column` VALUES (77, '5', 'artificer_id', '技师id', 'bigint', 'Long', 'artificerId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:31');
INSERT INTO `gen_table_column` VALUES (78, '5', 'artificer_name', '技师名称', 'varchar(255)', 'String', 'artificerName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'b_additional_type', 11, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:31');
INSERT INTO `gen_table_column` VALUES (79, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 14, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:31');
INSERT INTO `gen_table_column` VALUES (80, '5', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 15, 'admin', '2023-01-13 21:33:50', NULL, '2023-02-01 16:52:31');
INSERT INTO `gen_table_column` VALUES (81, '5', 'payment_type', '订单付款类型关联字典表b_order_payment_type', 'char(2)', 'String', 'paymentType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'b_order_payment_type', 6, '', '2023-01-31 20:49:39', NULL, '2023-02-01 16:52:30');
INSERT INTO `gen_table_column` VALUES (82, '5', 'member_id', '结账会员id', 'bigint', 'Long', 'memberId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, '', '2023-02-01 16:52:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '5', 'payment_time', '付款时间', 'datetime', 'Date', 'paymentTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 13, '', '2023-02-01 16:52:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '5', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, '', '2023-02-01 16:52:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '5', 'update_by', '修改人', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, '', '2023-02-01 16:52:31', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-09-01 23:37:14', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-09-01 23:37:14', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-09-01 23:37:14', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-09-01 23:37:14', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-09-01 23:37:14', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '典唐按摩', 0, 'admin', '18888888888', '', '0', '0', 'admin', '2022-09-01 23:37:14', 'admin', '2022-09-01 23:41:18');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '典唐1店', 1, 'admin', '18888888888', '', '0', '0', 'admin', '2022-09-01 23:37:14', 'admin', '2022-09-01 23:40:57');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-01 23:37:14', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '典唐2店', 1, 'admin', NULL, NULL, '0', '0', 'admin', '2022-09-01 23:41:36', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '未分级', '0', 'b_artificer_level', NULL, 'default', 'N', '0', 'admin', '2022-09-02 10:04:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '1级', '1', 'b_artificer_level', NULL, 'default', 'N', '0', 'admin', '2022-09-02 10:04:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '2级', '2', 'b_artificer_level', NULL, 'default', 'N', '0', 'admin', '2022-09-02 10:04:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 3, '3级', '3', 'b_artificer_level', NULL, 'default', 'N', '0', 'admin', '2022-09-02 10:05:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '赠送金额卡', '1', 'b_card_type', NULL, 'default', 'N', '0', 'admin', '2022-09-02 17:17:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '赠送次数卡', '2', 'b_card_type', NULL, 'default', 'N', '0', 'admin', '2022-09-02 17:17:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '小白盒', '1', 'b_member_payment', NULL, 'default', 'N', '0', 'admin', '2022-09-02 22:14:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 2, '抖音', '2', 'b_member_payment', NULL, 'default', 'N', '0', 'admin', '2022-09-02 22:14:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 3, '现金', '3', 'b_member_payment', NULL, 'default', 'N', '0', 'admin', '2022-09-02 22:14:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 4, '刷卡', '4', 'b_member_payment', NULL, 'default', 'N', '0', 'admin', '2022-09-02 22:14:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '主服务项目', '1', 'b_additional_type', NULL, 'primary', 'N', '0', 'admin', '2023-01-11 22:37:54', 'admin', '2023-02-01 22:26:34', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, '附加项项目', '2', 'b_additional_type', NULL, 'danger', 'N', '0', 'admin', '2023-01-11 22:38:15', 'admin', '2023-02-01 22:27:09', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '未支付', '0', 'b_order_state', NULL, 'default', 'N', '0', 'admin', '2023-01-13 21:39:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 1, '已支付', '1', 'b_order_state', NULL, 'default', 'N', '0', 'admin', '2023-01-13 21:39:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '排钟', '1', 'b_order_bell_type', NULL, 'default', 'N', '0', 'admin', '2023-01-13 21:43:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '点钟', '2', 'b_order_bell_type', NULL, 'default', 'N', '0', 'admin', '2023-01-13 21:43:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 1, '会员', '1', 'b_order_payment_type', NULL, 'default', 'N', '0', 'admin', '2023-01-31 20:52:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 2, '小白盒', '2', 'b_order_payment_type', NULL, 'default', 'N', '0', 'admin', '2023-01-31 20:53:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 3, '美团', '3', 'b_order_payment_type', NULL, 'default', 'N', '0', 'admin', '2023-01-31 20:53:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '技师等级', 'b_artificer_level', '0', 'admin', '2022-09-02 10:03:57', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '会员卡名称', 'b_member_card', '0', 'admin', '2022-09-02 15:45:56', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '会员卡类型', 'b_card_type', '0', 'admin', '2022-09-02 17:17:04', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '支付方式', 'b_member_payment', '0', 'admin', '2022-09-02 22:13:38', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '服务项目', 'b_additional_type', '0', 'admin', '2023-01-11 22:37:19', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '订单状态', 'b_order_state', '0', 'admin', '2023-01-13 21:38:57', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '排钟类型', 'b_order_bell_type', '0', 'admin', '2023-01-13 21:41:19', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '订单付款类型', 'b_order_payment_type', '0', 'admin', '2023-01-31 20:52:10', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-09-01 23:37:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2040 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 10, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-09-01 23:37:14', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 11, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-09-01 23:37:14', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 12, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-09-01 23:37:14', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-09-01 23:37:14', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-09-01 23:37:14', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-09-01 23:37:14', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-09-01 23:37:14', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-09-01 23:37:14', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-09-01 23:37:14', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-09-01 23:37:14', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-09-01 23:37:14', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-09-01 23:37:14', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-09-01 23:37:14', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-09-01 23:37:14', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-09-01 23:37:14', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-09-01 23:37:14', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-01 23:37:14', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-09-01 23:37:14', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-09-01 23:37:14', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-09-01 23:37:14', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-09-01 23:37:14', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-09-01 23:37:14', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-09-01 23:37:14', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '技师管理', 0, 1, 'artificer', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'people', 'admin', '2022-09-01 23:45:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '技师列表', 2000, 1, 'artificer', 'business/artificer/index', NULL, 1, 1, 'C', '0', '0', 'business:artificer:list', 'peoples', 'admin', '2022-09-02 00:09:13', 'admin', '2022-09-03 18:05:00', '业务--技师菜单');
INSERT INTO `sys_menu` VALUES (2002, '业务--技师查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:artificer:query', '#', 'admin', '2022-09-02 00:09:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '业务--技师新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:artificer:add', '#', 'admin', '2022-09-02 00:09:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '业务--技师修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:artificer:edit', '#', 'admin', '2022-09-02 00:09:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '业务--技师删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:artificer:remove', '#', 'admin', '2022-09-02 00:09:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '业务--技师导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:artificer:export', '#', 'admin', '2022-09-02 00:09:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '会员管理', 0, 2, 'member', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2022-09-02 12:42:31', 'admin', '2022-09-03 23:07:50', '');
INSERT INTO `sys_menu` VALUES (2009, '会员信息', 2007, 1, 'member', 'business/member/index', NULL, 1, 1, 'C', '0', '0', 'business:member:list', 'user', 'admin', '2022-09-02 14:50:48', 'admin', '2023-01-09 21:58:35', '会员信息菜单');
INSERT INTO `sys_menu` VALUES (2010, '会员信息查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:member:query', '#', 'admin', '2022-09-02 14:50:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '会员信息新增', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:member:add', '#', 'admin', '2022-09-02 14:50:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '会员信息修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:member:edit', '#', 'admin', '2022-09-02 14:50:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '会员信息删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:member:remove', '#', 'admin', '2022-09-02 14:50:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '会员信息导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:member:export', '#', 'admin', '2022-09-02 14:50:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '会员卡信息', 2007, 2, 'card', 'business/card/index', NULL, 1, 1, 'C', '0', '0', 'business:card:list', 'example', 'admin', '2022-09-02 16:41:43', 'admin', '2023-01-09 22:00:15', '业务--会员卡信息菜单');
INSERT INTO `sys_menu` VALUES (2016, '业务--会员卡信息查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:card:query', '#', 'admin', '2022-09-02 16:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '业务--会员卡信息新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:card:add', '#', 'admin', '2022-09-02 16:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '业务--会员卡信息修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:card:edit', '#', 'admin', '2022-09-02 16:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '业务--会员卡信息删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:card:remove', '#', 'admin', '2022-09-02 16:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '业务--会员卡信息导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:card:export', '#', 'admin', '2022-09-02 16:41:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '会员密码修改', 2009, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'business:member:updatePwd', '#', 'admin', '2022-09-03 18:34:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '会员信息详情', 2009, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'business:member:details', '#', 'admin', '2022-09-03 23:10:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '会员消费记录', 2009, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'business:member:consumptionRecord', '#', 'admin', '2022-09-03 23:11:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '合并会员信息', 2009, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'business:member:merge', '#', 'admin', '2022-09-03 23:12:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '服务项目管理', 2007, 3, 'additional', 'business/additional/index', NULL, 1, 1, 'C', '0', '0', 'business:additional:list', 'clipboard', 'admin', '2023-01-09 21:59:43', 'admin', '2023-01-11 22:45:58', '附加项单次金额菜单');
INSERT INTO `sys_menu` VALUES (2027, '附加项单次金额查询', 2026, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:additional:query', '#', 'admin', '2023-01-09 21:59:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '附加项单次金额新增', 2026, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:additional:add', '#', 'admin', '2023-01-09 21:59:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '附加项单次金额修改', 2026, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:additional:edit', '#', 'admin', '2023-01-09 21:59:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '附加项单次金额删除', 2026, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:additional:remove', '#', 'admin', '2023-01-09 21:59:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '附加项单次金额导出', 2026, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:additional:export', '#', 'admin', '2023-01-09 21:59:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '订单管理', 0, 3, 'order', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'shopping', 'admin', '2023-01-13 21:56:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '订单信息', 2032, 1, 'order', 'business/order/index', NULL, 1, 1, 'C', '0', '0', 'business:order:list', 'money', 'admin', '2023-01-13 22:00:37', 'admin', '2023-01-13 22:28:55', '订单信息菜单');
INSERT INTO `sys_menu` VALUES (2034, '订单信息查询', 2033, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:order:query', '#', 'admin', '2023-01-13 22:00:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '订单信息新增', 2033, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:order:add', '#', 'admin', '2023-01-13 22:00:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '订单信息修改', 2033, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:order:edit', '#', 'admin', '2023-01-13 22:00:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '订单信息删除', 2033, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:order:remove', '#', 'admin', '2023-01-13 22:00:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '订单信息导出', 2033, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'business:order:export', '#', 'admin', '2023-01-13 22:00:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '结账', 2033, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'business:order:payment', '#', 'admin', '2023-01-31 20:56:17', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-09-01 23:37:14', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-09-01 23:37:14', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.yk.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 21:59:28');
INSERT INTO `sys_oper_log` VALUES (2, '订单信息', 5, 'com.yk.web.controller.business.BOrderInfoController.export()', 'POST', 1, 'admin', NULL, '/business/order/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-01 22:03:30');
INSERT INTO `sys_oper_log` VALUES (3, '附加项单次金额', 2, 'com.yk.web.controller.business.BAdditionalInfoController.edit()', 'PUT', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":12,\"additionalId\":3,\"additionalName\":\"附加项\",\"createTime\":\"2023-01-11 23:22:52\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":0,\"params\":{},\"updateTime\":\"2023-02-01T22:10:08.17+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:10:08');
INSERT INTO `sys_oper_log` VALUES (4, '附加项单次金额', 2, 'com.yk.web.controller.business.BAdditionalInfoController.edit()', 'PUT', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":12,\"additionalId\":3,\"additionalName\":\"附加项\",\"createTime\":\"2023-01-11 23:22:52\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":0,\"params\":{},\"updateTime\":\"2023-02-01T22:10:19.413+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:10:19');
INSERT INTO `sys_oper_log` VALUES (5, '附加项单次金额', 1, 'com.yk.web.controller.business.BAdditionalInfoController.add()', 'POST', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":20,\"additionalId\":4,\"additionalName\":\"小儿\",\"createTime\":\"2023-02-01T22:22:45.128+08:00\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:22:45');
INSERT INTO `sys_oper_log` VALUES (6, '附加项单次金额', 1, 'com.yk.web.controller.business.BAdditionalInfoController.add()', 'POST', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":30,\"additionalId\":5,\"additionalName\":\"拔罐\",\"createTime\":\"2023-02-01T22:23:05.981+08:00\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:23:06');
INSERT INTO `sys_oper_log` VALUES (7, '附加项单次金额', 1, 'com.yk.web.controller.business.BAdditionalInfoController.add()', 'POST', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":30,\"additionalId\":6,\"additionalName\":\"刮痧\",\"createTime\":\"2023-02-01T22:23:25.591+08:00\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:23:25');
INSERT INTO `sys_oper_log` VALUES (8, '字典数据', 2, 'com.yk.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:37:54\",\"default\":false,\"dictCode\":110,\"dictLabel\":\"主服务项目\",\"dictSort\":1,\"dictType\":\"b_additional_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:26:34');
INSERT INTO `sys_oper_log` VALUES (9, '字典数据', 2, 'com.yk.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:38:15\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"附加项项目\",\"dictSort\":2,\"dictType\":\"b_additional_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:26:40');
INSERT INTO `sys_oper_log` VALUES (10, '字典数据', 2, 'com.yk.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:38:15\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"附加项项目\",\"dictSort\":2,\"dictType\":\"b_additional_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:26:47');
INSERT INTO `sys_oper_log` VALUES (11, '字典数据', 2, 'com.yk.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:38:15\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"附加项项目\",\"dictSort\":2,\"dictType\":\"b_additional_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:27:09');
INSERT INTO `sys_oper_log` VALUES (12, '附加项单次金额', 3, 'com.yk.web.controller.business.BAdditionalInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/business/additional/3', '127.0.0.1', '内网IP', '{additionalIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:27:40');
INSERT INTO `sys_oper_log` VALUES (13, '附加项单次金额', 1, 'com.yk.web.controller.business.BAdditionalInfoController.add()', 'POST', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":30,\"additionalId\":7,\"additionalName\":\"走罐\",\"createTime\":\"2023-02-01T22:28:03.31+08:00\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:28:03');
INSERT INTO `sys_oper_log` VALUES (14, '附加项单次金额', 1, 'com.yk.web.controller.business.BAdditionalInfoController.add()', 'POST', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":30,\"additionalId\":8,\"additionalName\":\"热疗\",\"createTime\":\"2023-02-01T22:28:21.014+08:00\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:28:21');
INSERT INTO `sys_oper_log` VALUES (15, '附加项单次金额', 1, 'com.yk.web.controller.business.BAdditionalInfoController.add()', 'POST', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":30,\"additionalId\":9,\"additionalName\":\"中草药热敷\",\"createTime\":\"2023-02-01T22:28:56.564+08:00\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:28:56');
INSERT INTO `sys_oper_log` VALUES (16, '附加项单次金额', 1, 'com.yk.web.controller.business.BAdditionalInfoController.add()', 'POST', 1, 'admin', NULL, '/business/additional', '127.0.0.1', '内网IP', '{\"additionalAmount\":30,\"additionalId\":10,\"additionalName\":\"机器艾灸\",\"createTime\":\"2023-02-01T22:29:15.294+08:00\",\"dataType\":\"2\",\"duration\":10,\"orderNum\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 22:29:15');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-09-01 23:37:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-09-01 23:37:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-09-01 23:37:14', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '典唐', '00', 'yanakai@126.com', '18888888888', '1', '/profile/avatar/2022/09/03/blob_20220903120800A002.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-01 21:10:16', 'admin', '2022-09-01 23:37:14', '', '2023-02-01 21:10:16', '管理员');
INSERT INTO `sys_user` VALUES (101, 100, '2323', '2323', '00', '', '15538157826', '0', '', '$2a$10$62do6hTOcRUHagBHvB2k..ulzcSssdY04t3WNB8i/AYtDSFxFg1rK', '0', '0', '', NULL, 'admin', '2022-09-02 12:02:29', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
