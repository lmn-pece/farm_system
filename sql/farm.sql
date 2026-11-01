/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : baizhanfarm

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 28/11/2025 18:34:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for plant_employee
-- ----------------------------
DROP TABLE IF EXISTS `plant_employee`;
CREATE TABLE `plant_employee`  (
  `employee_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '雇员ID',
  `employee_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编码',
  `employee_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '姓名',
  `employee_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '雇员类型',
  `employee_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `employee_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '雇员性别',
  `employee_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '雇员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_employee
-- ----------------------------
INSERT INTO `plant_employee` VALUES (9, '1001', '孙悟空', '0', '13811122233', '0', '花果山水帘洞', '', 'admin', '2025-11-28 17:04:23', 'admin', '2025-11-28 17:05:19');
INSERT INTO `plant_employee` VALUES (10, '1002', '猪八戒', '2', '13822233344', '0', '高老庄', '', 'admin', '2025-11-28 17:04:43', 'admin', '2025-11-28 17:04:43');
INSERT INTO `plant_employee` VALUES (11, '1003', '女儿国国王', '2', '13866655544', '1', '女儿国', '', 'admin', '2025-11-28 17:05:05', 'admin', '2025-11-28 17:05:05');

-- ----------------------------
-- Table structure for plant_germplasm
-- ----------------------------
DROP TABLE IF EXISTS `plant_germplasm`;
CREATE TABLE `plant_germplasm`  (
  `germplasm_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '种质ID',
  `crop_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '作物名称',
  `crop_en_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '作物英文名称',
  `germplasm_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '种质名称',
  `germplasm_en_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '种质英文名称',
  `germplasm_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '种质图片',
  `germplasm_des` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '宣传语',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`germplasm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '种质表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_germplasm
-- ----------------------------
INSERT INTO `plant_germplasm` VALUES (8, '花生', 'huasheng', '花生', 'huasheng', '', '花生很好吃', '', 'admin', '2025-11-28 17:14:55', 'admin', '2025-11-28 17:14:55');
INSERT INTO `plant_germplasm` VALUES (9, '番茄', 'tomato', '番茄', 'tomato', '', '番茄是常见水果，也是常见蔬菜', '', 'admin', '2025-11-28 17:15:19', 'admin', '2025-11-28 17:15:29');

-- ----------------------------
-- Table structure for plant_germplasm_intro
-- ----------------------------
DROP TABLE IF EXISTS `plant_germplasm_intro`;
CREATE TABLE `plant_germplasm_intro`  (
  `intro_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '介绍ID',
  `germplasm_id` bigint(20) NULL DEFAULT NULL COMMENT '种质ID',
  `intro_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `intro_des` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`intro_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '种质介绍表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_germplasm_intro
-- ----------------------------
INSERT INTO `plant_germplasm_intro` VALUES (6, 9, '番茄介绍', '123123', '', 'admin', '2025-11-28 17:16:46', 'admin', '2025-11-28 17:16:46');

-- ----------------------------
-- Table structure for plant_germplasm_job
-- ----------------------------
DROP TABLE IF EXISTS `plant_germplasm_job`;
CREATE TABLE `plant_germplasm_job`  (
  `job_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '作业任务ID',
  `germplasm_id` bigint(20) NULL DEFAULT 0 COMMENT '种质ID',
  `job_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '作业任务名称',
  `cycle_unit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '作业周期单位（0代表周 1代表天）',
  `job_start` int(11) NULL DEFAULT 0 COMMENT '起始周/天',
  `job_finish` int(11) NULL DEFAULT 0 COMMENT '结束周/天',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标准作业任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_germplasm_job
-- ----------------------------
INSERT INTO `plant_germplasm_job` VALUES (26, 9, '浇水', '0', 1, 1, '', 'admin', '2025-11-28 17:17:15', 'admin', '2025-11-28 17:17:15');
INSERT INTO `plant_germplasm_job` VALUES (27, 9, '施肥', '0', 2, 2, '', 'admin', '2025-11-28 17:17:27', 'admin', '2025-11-28 17:17:27');

-- ----------------------------
-- Table structure for plant_germplasm_method
-- ----------------------------
DROP TABLE IF EXISTS `plant_germplasm_method`;
CREATE TABLE `plant_germplasm_method`  (
  `method_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '方法ID',
  `germplasm_id` bigint(20) NULL DEFAULT NULL COMMENT '种质ID',
  `method_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `method_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片',
  `method_des` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`method_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '种植方法表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_germplasm_method
-- ----------------------------
INSERT INTO `plant_germplasm_method` VALUES (6, 9, '番茄种质方法1', '', '123', '', 'admin', '2025-11-28 17:16:17', 'admin', '2025-11-28 17:16:17');

-- ----------------------------
-- Table structure for plant_land
-- ----------------------------
DROP TABLE IF EXISTS `plant_land`;
CREATE TABLE `plant_land`  (
  `land_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地块ID',
  `land_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地块名称',
  `land_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '地块类型：0:耕地 1：大棚 2：果园',
  `land_area` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '地块面积',
  `stroke_weight` tinyint(4) NULL DEFAULT 0 COMMENT '边框宽度',
  `stroke_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '边框颜色',
  `stroke_opacity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '边框透明度',
  `land_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地块路径',
  `fill_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地块背景颜色',
  `fill_opacity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '地块透明度',
  `current_batch` bigint(20) NULL DEFAULT 0 COMMENT '当前种植批次',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`land_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_land
-- ----------------------------
INSERT INTO `plant_land` VALUES (5, '我的地块1', '0', 352.60, 1, 'rgb(221, 28, 28)', 0.60, '[[116.392069,39.870838],[116.389013,39.869755],[116.389168,39.867721],[116.392784,39.867573],[116.396478,39.869057],[116.39526,39.871076]]', 'rgb(22, 210, 22)', 0.20, 10, '', 'admin', '2025-11-28 17:02:34', 'admin', '2025-11-28 17:02:34');
INSERT INTO `plant_land` VALUES (6, '我的地块2', '1', 187.96, 1, 'rgb(239, 21, 21)', 0.40, '[[116.397276,39.868201],[116.392731,39.866375],[116.393698,39.864252],[116.397624,39.866123]]', 'rgb(24, 211, 24)', 0.50, 12, '', 'admin', '2025-11-28 17:03:16', 'admin', '2025-11-28 17:03:30');

-- ----------------------------
-- Table structure for plant_machine
-- ----------------------------
DROP TABLE IF EXISTS `plant_machine`;
CREATE TABLE `plant_machine`  (
  `machine_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '机械ID',
  `machine_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '机械编码',
  `machine_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '机械名称',
  `machine_type_id` bigint(20) NULL DEFAULT 0 COMMENT '机械类别',
  `measure_unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '计量单位',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`machine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机械信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_machine
-- ----------------------------
INSERT INTO `plant_machine` VALUES (5, '1001', '挖掘机型号1', 8, '量', '', 'admin', '2025-11-28 17:13:09', 'admin', '2025-11-28 17:13:09');
INSERT INTO `plant_machine` VALUES (6, '1002', '挖掘机型号2', 8, '量', '', 'admin', '2025-11-28 17:13:23', 'admin', '2025-11-28 17:13:23');
INSERT INTO `plant_machine` VALUES (7, '1003', '除草剂型号1', 9, '量', '', 'admin', '2025-11-28 17:13:42', 'admin', '2025-11-28 17:13:42');

-- ----------------------------
-- Table structure for plant_machine_type
-- ----------------------------
DROP TABLE IF EXISTS `plant_machine_type`;
CREATE TABLE `plant_machine_type`  (
  `machine_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '机械类别ID',
  `machine_type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '机械类别名称',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`machine_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机械类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_machine_type
-- ----------------------------
INSERT INTO `plant_machine_type` VALUES (8, '挖掘机', '', 'admin', '2025-11-28 17:12:00', 'admin', '2025-11-28 17:12:00');
INSERT INTO `plant_machine_type` VALUES (9, '除草机', '', 'admin', '2025-11-28 17:12:09', 'admin', '2025-11-28 17:12:09');
INSERT INTO `plant_machine_type` VALUES (10, '收割机', '', 'admin', '2025-11-28 17:12:15', 'admin', '2025-11-28 17:12:15');

-- ----------------------------
-- Table structure for plant_material
-- ----------------------------
DROP TABLE IF EXISTS `plant_material`;
CREATE TABLE `plant_material`  (
  `material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '农资ID',
  `material_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '农资编码',
  `material_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '农资名称',
  `material_type_id` bigint(20) NULL DEFAULT 0 COMMENT '农资类别',
  `measure_unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '计量单位',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`material_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '农资信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_material
-- ----------------------------
INSERT INTO `plant_material` VALUES (8, '1001', '氮肥', 10, '袋', '', 'admin', '2025-11-28 17:07:17', 'admin', '2025-11-28 17:07:17');
INSERT INTO `plant_material` VALUES (9, '1002', '磷肥', 10, '袋', '', 'admin', '2025-11-28 17:07:40', 'admin', '2025-11-28 17:07:40');
INSERT INTO `plant_material` VALUES (10, '1003', '老鼠药', 9, '瓶', '', 'admin', '2025-11-28 17:08:16', 'admin', '2025-11-28 17:08:16');

-- ----------------------------
-- Table structure for plant_material_type
-- ----------------------------
DROP TABLE IF EXISTS `plant_material_type`;
CREATE TABLE `plant_material_type`  (
  `material_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '农资类别ID',
  `material_type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '农资类别名称',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`material_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '农资类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_material_type
-- ----------------------------
INSERT INTO `plant_material_type` VALUES (8, '农药', '', '0', 0, 'admin', '2025-11-28 17:06:22', 'admin', '2025-11-28 17:06:22');
INSERT INTO `plant_material_type` VALUES (9, '杀虫剂', '', '0', 0, 'admin', '2025-11-28 17:06:27', 'admin', '2025-11-28 17:06:27');
INSERT INTO `plant_material_type` VALUES (10, '化肥', '', '0', 0, 'admin', '2025-11-28 17:06:32', 'admin', '2025-11-28 17:06:32');
INSERT INTO `plant_material_type` VALUES (11, '除草剂', '', '0', 0, 'admin', '2025-11-28 17:06:34', 'admin', '2025-11-28 17:06:43');

-- ----------------------------
-- Table structure for plant_task
-- ----------------------------
DROP TABLE IF EXISTS `plant_task`;
CREATE TABLE `plant_task`  (
  `task_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `batch_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '批次ID',
  `task_head` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '任务负责人',
  `task_head_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人名字',
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '任务名称',
  `plan_start` datetime NULL DEFAULT NULL COMMENT '计划开始日期',
  `plan_finish` datetime NULL DEFAULT NULL COMMENT '计划结束日期',
  `actual_start` datetime NULL DEFAULT NULL COMMENT '实际开始日期',
  `actual_finish` datetime NULL DEFAULT NULL COMMENT '实际结束日期',
  `task_detail` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '任务详情',
  `task_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片资料',
  `task_videos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '视频资料',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0未分配 1已分配 2进行中 3已完成',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '批次任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_task
-- ----------------------------
INSERT INTO `plant_task` VALUES (23, 10, 1, '百战', '浇水', '2025-11-12 16:00:00', '2025-11-13 16:00:00', NULL, NULL, '第一次浇水', NULL, NULL, '', '0', 'admin', '2025-11-28 18:21:11', 'admin', '2025-11-28 18:21:11');
INSERT INTO `plant_task` VALUES (25, 10, 1, '百战', '除草', '2025-11-05 08:00:00', '2025-11-13 08:00:00', '2025-11-28 10:31:26', '2025-11-28 10:31:33', '第一次除草', NULL, NULL, '', '3', 'admin', '2025-11-28 18:21:35', 'admin', '2025-11-28 18:31:33');

-- ----------------------------
-- Table structure for plant_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `plant_task_batch`;
CREATE TABLE `plant_task_batch`  (
  `batch_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '批次ID',
  `batch_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次名称',
  `germplasm_id` bigint(20) NULL DEFAULT NULL COMMENT '种质ID',
  `land_id` bigint(20) NULL DEFAULT 0 COMMENT '地块ID',
  `crop_area` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '种植面积（亩）',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `batch_head` bigint(20) NULL DEFAULT NULL COMMENT '负责人id',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`batch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作物批次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_task_batch
-- ----------------------------
INSERT INTO `plant_task_batch` VALUES (10, '2030年第一季花生', 8, 5, 352.60, '2030-03-01 09:32:57', 1, '', 'admin', '2025-11-28 17:33:35', 'admin', '2025-11-28 17:33:35');
INSERT INTO `plant_task_batch` VALUES (12, '2033年第一季番茄', 9, 6, 100.00, '2025-11-28 16:00:00', 6, '', 'admin', '2025-11-28 17:57:14', 'admin', '2025-11-28 17:57:14');

-- ----------------------------
-- Table structure for plant_task_employee
-- ----------------------------
DROP TABLE IF EXISTS `plant_task_employee`;
CREATE TABLE `plant_task_employee`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint(20) NULL DEFAULT 0 COMMENT '任务ID',
  `employee_id` bigint(20) NULL DEFAULT 0 COMMENT '雇员ID',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '批次任务工人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_task_employee
-- ----------------------------
INSERT INTO `plant_task_employee` VALUES (17, 25, 10, 'admin', '2025-11-28 18:31:01', 'admin', '2025-11-28 18:31:01');
INSERT INTO `plant_task_employee` VALUES (18, 25, 11, 'admin', '2025-11-28 18:31:01', 'admin', '2025-11-28 18:31:01');

-- ----------------------------
-- Table structure for plant_task_employee_time
-- ----------------------------
DROP TABLE IF EXISTS `plant_task_employee_time`;
CREATE TABLE `plant_task_employee_time`  (
  `cost_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint(20) NULL DEFAULT 0 COMMENT '任务ID',
  `employee_id` bigint(20) NULL DEFAULT 0 COMMENT '雇员ID',
  `working_hours` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '工时',
  `working_start` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `working_finish` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cost_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人工工时表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_task_employee_time
-- ----------------------------
INSERT INTO `plant_task_employee_time` VALUES (1, 1, 6, 30.00, '2024-09-26 00:00:00', '2024-09-27 00:00:00', '', '17', '2024-09-26 14:55:54', '0', NULL);
INSERT INTO `plant_task_employee_time` VALUES (2, 22, 11, 2.00, '2025-11-04 16:00:00', '2025-11-06 16:00:00', '', 'admin', '2025-11-28 18:16:22', 'admin', '2025-11-28 18:16:22');
INSERT INTO `plant_task_employee_time` VALUES (3, 25, 11, 2.00, '2025-11-04 16:00:00', '2025-11-05 16:00:00', '', 'admin', '2025-11-28 18:30:03', 'admin', '2025-11-28 18:30:03');

-- ----------------------------
-- Table structure for plant_task_machine_time
-- ----------------------------
DROP TABLE IF EXISTS `plant_task_machine_time`;
CREATE TABLE `plant_task_machine_time`  (
  `cost_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint(20) NULL DEFAULT 0 COMMENT '任务ID',
  `machine_id` bigint(20) NULL DEFAULT 0 COMMENT '机械ID',
  `machine_count` int(11) NULL DEFAULT 0 COMMENT '机械数量',
  `working_hours` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '工时',
  `working_start` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `working_finish` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cost_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机械工时表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_task_machine_time
-- ----------------------------
INSERT INTO `plant_task_machine_time` VALUES (1, 1, 4, 2, 2.00, '2024-10-15 00:00:00', '2024-10-16 00:00:00', '', '17', '2024-10-15 10:18:10', '0', NULL);
INSERT INTO `plant_task_machine_time` VALUES (2, 22, 6, 1, 2.00, '2025-11-05 16:00:00', '2025-11-28 16:00:00', '', 'admin', '2025-11-28 18:16:41', 'admin', '2025-11-28 18:16:41');
INSERT INTO `plant_task_machine_time` VALUES (3, 25, 6, 2, 2.00, '2025-11-05 16:00:00', '2025-11-06 16:00:00', '', 'admin', '2025-11-28 18:30:30', 'admin', '2025-11-28 18:30:30');
INSERT INTO `plant_task_machine_time` VALUES (4, 25, 7, 2, 2.00, '2025-11-06 16:00:00', '2025-11-07 16:00:00', '', 'admin', '2025-11-28 18:30:41', 'admin', '2025-11-28 18:30:41');

-- ----------------------------
-- Table structure for plant_task_material_time
-- ----------------------------
DROP TABLE IF EXISTS `plant_task_material_time`;
CREATE TABLE `plant_task_material_time`  (
  `cost_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_id` bigint(20) NULL DEFAULT 0 COMMENT '任务ID',
  `material_id` bigint(20) NULL DEFAULT 0 COMMENT '农资ID',
  `material_count` int(11) NULL DEFAULT 0 COMMENT '使用数量',
  `measure_unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '计量单位',
  `working_start` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `working_finish` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cost_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '农资用量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plant_task_material_time
-- ----------------------------
INSERT INTO `plant_task_material_time` VALUES (1, 1, 6, 2, '袋', '2024-10-15 00:00:00', '2024-10-16 00:00:00', '', '17', '2024-10-15 10:18:33', '0', NULL);
INSERT INTO `plant_task_material_time` VALUES (2, 22, 10, 3, '瓶', NULL, NULL, '', 'admin', '2025-11-28 18:18:54', 'admin', '2025-11-28 18:18:54');
INSERT INTO `plant_task_material_time` VALUES (3, 25, 10, 3, '瓶', NULL, NULL, '', 'admin', '2025-11-28 18:30:48', 'admin', '2025-11-28 18:30:48');
INSERT INTO `plant_task_material_time` VALUES (4, 25, 8, 2, '袋', NULL, NULL, '', 'admin', '2025-11-28 18:30:53', 'admin', '2025-11-28 18:30:53');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` int(4) NULL DEFAULT NULL COMMENT '字典数值',
  `dict_type` bigint(20) NULL DEFAULT NULL COMMENT '字典类型id',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', 1, 1, 'Y', '0', 'admin', '2025-07-24 16:57:55', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', 2, 1, 'N', '0', 'admin', '2025-07-24 16:57:55', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (7, 3, '未知', 3, 1, 'N', '0', 'admin', '2025-10-29 11:54:05', 'admin', '2025-10-29 11:54:05', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典数值',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', NULL, '1', 'admin', '2025-07-24 16:57:55', 'admin', '2025-10-29 11:48:16', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (3, '重量单位', NULL, '1', '', '2025-08-06 17:17:29', 'admin', '2025-10-29 11:48:13', NULL);

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
INSERT INTO `sys_login_info` VALUES (1, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:15:48');
INSERT INTO `sys_login_info` VALUES (2, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:17:54');
INSERT INTO `sys_login_info` VALUES (3, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:18:36');
INSERT INTO `sys_login_info` VALUES (4, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:18:41');
INSERT INTO `sys_login_info` VALUES (5, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-08 16:18:52');
INSERT INTO `sys_login_info` VALUES (6, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:19:05');
INSERT INTO `sys_login_info` VALUES (7, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:22:05');
INSERT INTO `sys_login_info` VALUES (8, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:23:26');
INSERT INTO `sys_login_info` VALUES (9, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:34:54');
INSERT INTO `sys_login_info` VALUES (10, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '用户名或密码错误', '2025-08-08 16:35:36');
INSERT INTO `sys_login_info` VALUES (11, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 16:35:44');
INSERT INTO `sys_login_info` VALUES (12, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-08 16:36:03');
INSERT INTO `sys_login_info` VALUES (13, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-08 17:33:44');
INSERT INTO `sys_login_info` VALUES (14, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 17:38:13');
INSERT INTO `sys_login_info` VALUES (15, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-08 17:38:20');
INSERT INTO `sys_login_info` VALUES (16, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-08 17:40:11');
INSERT INTO `sys_login_info` VALUES (17, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-08 17:40:19');
INSERT INTO `sys_login_info` VALUES (18, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-08 17:42:39');
INSERT INTO `sys_login_info` VALUES (19, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-08 17:50:26');
INSERT INTO `sys_login_info` VALUES (20, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 17:19:07');
INSERT INTO `sys_login_info` VALUES (21, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 17:21:18');
INSERT INTO `sys_login_info` VALUES (22, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 17:53:18');
INSERT INTO `sys_login_info` VALUES (23, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-22 17:54:33');
INSERT INTO `sys_login_info` VALUES (24, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 17:55:11');
INSERT INTO `sys_login_info` VALUES (25, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 18:48:22');
INSERT INTO `sys_login_info` VALUES (26, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 18:50:40');
INSERT INTO `sys_login_info` VALUES (27, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-22 18:50:57');
INSERT INTO `sys_login_info` VALUES (28, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-22 18:51:12');
INSERT INTO `sys_login_info` VALUES (29, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 18:52:28');
INSERT INTO `sys_login_info` VALUES (30, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-22 18:54:41');
INSERT INTO `sys_login_info` VALUES (31, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-27 10:48:34');
INSERT INTO `sys_login_info` VALUES (32, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 10:49:15');
INSERT INTO `sys_login_info` VALUES (33, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 15:48:36');
INSERT INTO `sys_login_info` VALUES (34, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-27 16:20:20');
INSERT INTO `sys_login_info` VALUES (35, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 16:21:19');
INSERT INTO `sys_login_info` VALUES (36, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 16:22:58');
INSERT INTO `sys_login_info` VALUES (37, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 16:24:04');
INSERT INTO `sys_login_info` VALUES (38, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-27 16:25:14');
INSERT INTO `sys_login_info` VALUES (39, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 16:25:39');
INSERT INTO `sys_login_info` VALUES (40, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-27 16:26:39');
INSERT INTO `sys_login_info` VALUES (41, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-27 16:26:47');
INSERT INTO `sys_login_info` VALUES (42, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 16:26:53');
INSERT INTO `sys_login_info` VALUES (43, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-27 17:40:02');
INSERT INTO `sys_login_info` VALUES (44, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '用户名或密码错误', '2025-08-28 15:43:24');
INSERT INTO `sys_login_info` VALUES (45, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '用户名或密码错误', '2025-08-28 15:43:42');
INSERT INTO `sys_login_info` VALUES (46, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '验证码错误', '2025-08-28 15:45:04');
INSERT INTO `sys_login_info` VALUES (47, 'unknown', '0:0:0:0:0:0:0:1', 'Other', 'Other', '1', '用户名或密码错误', '2025-08-28 15:45:54');
INSERT INTO `sys_login_info` VALUES (48, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-28 15:48:10');
INSERT INTO `sys_login_info` VALUES (49, 'admin', '0:0:0:0:0:0:0:1', 'Other', 'Other', '0', '登录成功', '2025-08-28 17:26:44');
INSERT INTO `sys_login_info` VALUES (50, 'unknown', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '1', '验证码错误', '2025-10-29 16:32:18');
INSERT INTO `sys_login_info` VALUES (51, 'unknown', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '1', '用户名或密码错误', '2025-10-29 16:32:53');
INSERT INTO `sys_login_info` VALUES (52, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-10-29 16:33:16');
INSERT INTO `sys_login_info` VALUES (53, 'unknown', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '1', '用户名或密码错误', '2025-11-04 16:08:22');
INSERT INTO `sys_login_info` VALUES (54, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-11-04 16:08:30');
INSERT INTO `sys_login_info` VALUES (55, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-11-11 16:34:30');
INSERT INTO `sys_login_info` VALUES (56, 'unknown', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '1', '用户名或密码错误', '2025-11-20 15:07:08');
INSERT INTO `sys_login_info` VALUES (57, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-11-20 15:07:15');
INSERT INTO `sys_login_info` VALUES (58, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-11-21 15:03:32');
INSERT INTO `sys_login_info` VALUES (59, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-11-21 15:06:23');
INSERT INTO `sys_login_info` VALUES (60, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-11-21 15:10:25');
INSERT INTO `sys_login_info` VALUES (61, 'unknown', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '1', '用户名或密码错误', '2025-11-28 15:11:04');
INSERT INTO `sys_login_info` VALUES (62, 'admin', '0:0:0:0:0:0:0:1', 'Chrome', 'Windows', '0', '登录成功', '2025-11-28 15:11:08');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (2, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'admin', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"roleName\":\"员工\",\"roleSort\":2}]', '', 1, '角色已存在', '2025-08-08 17:51:51', 8);
INSERT INTO `sys_oper_log` VALUES (3, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'admin', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"roleName\":\"员工1\",\"roleSort\":2}]', '', 1, '角色已存在', '2025-08-08 17:52:24', 6);
INSERT INTO `sys_oper_log` VALUES (4, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'admin', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"createTime\":\"2025-08-08 17:52:28.498874600\",\"roleId\":5,\"roleName\":\"员工10\",\"roleSort\":2,\"status\":\"0\"}]', '{\"code\":200,\"data\":\"新增角色成功\",\"msg\":\"操作成功\"}', 0, '', '2025-08-08 17:52:29', 11);
INSERT INTO `sys_oper_log` VALUES (6, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'anonymousUser', '/role/addRole', '0:0:0:0:0:0:0:1', '', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-08 17:54:59', 12);
INSERT INTO `sys_oper_log` VALUES (7, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'anonymousUser', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"roleName\":\"员工11\",\"roleSort\":2}]', '', 1, '角色已存在', '2025-08-11 15:10:56', 309);
INSERT INTO `sys_oper_log` VALUES (8, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'anonymousUser', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"createTime\":\"2025-08-11 15:11:50.076375100\",\"roleId\":7,\"roleName\":\"员工12\",\"roleSort\":2,\"status\":\"0\"}]', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-11 15:11:50', 15);
INSERT INTO `sys_oper_log` VALUES (9, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'anonymousUser', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"createTime\":\"2025-08-12 16:47:38.739216600\",\"roleId\":8,\"roleName\":\"员工13\",\"roleSort\":2,\"status\":\"0\"}]', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-12 16:47:39', 308);
INSERT INTO `sys_oper_log` VALUES (10, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'anonymousUser', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"createBy\":\"anonymousUser\",\"createTime\":\"2025-08-12 16:53:15.402911900\",\"roleId\":9,\"roleName\":\"员工14\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"anonymousUser\",\"updateTime\":\"2025-08-12 16:53:15.402911900\"}]', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-12 16:53:15', 307);
INSERT INTO `sys_oper_log` VALUES (11, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'anonymousUser', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"warehouseCode\":\"1005\",\"warehouseName\":\"北京仓库2\"}]', '', 1, '编码重复', '2025-08-22 18:25:47', 292);
INSERT INTO `sys_oper_log` VALUES (12, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'anonymousUser', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"createTime\":\"2025-08-22 18:26:01.673413100\",\"id\":5,\"updateTime\":\"2025-08-22 18:26:01.673413100\",\"warehouseCode\":\"1006\",\"warehouseName\":\"北京仓库6\"}]', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-22 18:26:02', 11);
INSERT INTO `sys_oper_log` VALUES (13, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'anonymousUser', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"warehouseCode\":\"1006\",\"warehouseName\":\"北京仓库6\"}]', '', 1, '编码重复', '2025-08-22 18:27:39', 292);
INSERT INTO `sys_oper_log` VALUES (14, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'admin', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"warehouseCode\":\"1006\",\"warehouseName\":\"北京仓库6\"}]', '', 1, '编码重复', '2025-08-22 18:55:05', 295);
INSERT INTO `sys_oper_log` VALUES (15, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'admin', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"createTime\":\"2025-08-22 18:55:13.045077300\",\"id\":6,\"updateTime\":\"2025-08-22 18:55:13.045077300\",\"warehouseCode\":\"1007\",\"warehouseName\":\"北京仓库7\"}]', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-22 18:55:13', 14);
INSERT INTO `sys_oper_log` VALUES (16, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'admin', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"createTime\":\"2025-08-27 15:49:05.571427700\",\"id\":7,\"updateTime\":\"2025-08-27 15:49:05.571427700\",\"warehouseCode\":\"1008\",\"warehouseName\":\"北京仓库8\"}]', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-27 15:49:06', 10);
INSERT INTO `sys_oper_log` VALUES (17, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'admin', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"createTime\":\"2025-08-27 16:28:23.418398400\",\"id\":8,\"updateTime\":\"2025-08-27 16:28:23.418398400\",\"warehouseCode\":\"1009\",\"warehouseName\":\"北京仓库10\"}]', '{\"code\":200,\"msg\":\"操作成功\"}', 0, '', '2025-08-27 16:28:23', 10);
INSERT INTO `sys_oper_log` VALUES (18, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'admin', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"createBy\":\"admin\",\"createTime\":\"2025-10-30 17:27:29.168357700\",\"remark\":\"\",\"roleId\":13,\"roleName\":\"人事\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2025-10-30 17:27:29.168357700\"}]', '{\"code\":200,\"data\":\"角色添加成功\",\"message\":\"操作成功\"}', 0, '', '2025-10-30 17:27:29', 55);
INSERT INTO `sys_oper_log` VALUES (19, '角色管理', 'INSERT', 'com.itbaizhan.farm_system.controller.RoleController.addRole()', 'POST', 'admin', '/role/addRole', '0:0:0:0:0:0:0:1', '[{\"remark\":\"\",\"roleName\":\"人事\",\"roleSort\":1,\"status\":\"0\"}]', '', 1, '角色已存在', '2025-10-30 17:28:37', 5);
INSERT INTO `sys_oper_log` VALUES (20, '角色管理', 'DELETE', 'com.itbaizhan.farm_system.controller.RoleController.deleteRole()', 'DELETE', 'admin', '/role/deleteRole', '0:0:0:0:0:0:0:1', '{\"ids\":[\"8\"]}', '{\"code\":200,\"message\":\"操作成功\"}', 0, '', '2025-10-30 17:30:11', 68);
INSERT INTO `sys_oper_log` VALUES (21, '仓库管理', 'INSERT', 'com.itbaizhan.farm_warehousing.controller.WarehouseController.addWarehouse()', 'POST', 'admin', '/warehouse/addWarehouse', '0:0:0:0:0:0:0:1', '[{\"createBy\":\"admin\",\"createTime\":\"2025-11-21 15:06:05.798428300\",\"id\":16,\"orderNum\":0,\"remark\":\"\",\"updateBy\":\"admin\",\"updateTime\":\"2025-11-21 15:06:05.798428300\",\"warehouseCode\":\"1008\",\"warehouseName\":\"北京仓库8\"}]', '{\"code\":200,\"message\":\"操作成功\"}', 0, '', '2025-11-21 15:06:06', 71);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限路径',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (100, '用户管理', '/user/list', 'admin', '2025-07-24 16:57:55', '', NULL, '用户管理菜单');
INSERT INTO `sys_permission` VALUES (101, '角色管理', '/role/list', 'admin', '2025-07-24 16:57:55', '', NULL, '角色管理菜单');
INSERT INTO `sys_permission` VALUES (102, '菜单管理', 'system/menu/index', 'admin', '2025-07-24 16:57:55', '', NULL, '菜单管理菜单');
INSERT INTO `sys_permission` VALUES (104, '操作日志', 'monitor/operlog/index', 'admin', '2025-07-24 16:57:55', '', NULL, '操作日志菜单');
INSERT INTO `sys_permission` VALUES (105, '登录日志', '/logininfor/index', 'admin', '2025-07-24 16:57:55', '', '2025-10-21 16:33:23', '登录日志菜单');
INSERT INTO `sys_permission` VALUES (109, '新增仓库', '/warehouse/addWarehouse', '', '2025-11-21 15:09:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '0', 'admin', '2025-07-24 16:57:55', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 2, '0', 'admin', '2025-07-24 16:57:55', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '员工1', 2, '0', '', '2025-08-01 16:43:37', '', '2025-08-05 17:44:27', NULL);
INSERT INTO `sys_role` VALUES (4, '员工', 2, '0', '', '2025-08-05 17:44:24', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (5, '员工10', 2, '0', '', '2025-08-08 17:52:28', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (6, '员工11', 2, '0', '', '2025-08-08 17:54:59', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (7, '员工12', 2, '0', '', '2025-08-11 15:11:50', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (12, '公司职员', 5, '0', 'admin', '2025-10-24 15:33:06', 'admin', '2025-10-24 15:33:06', NULL);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 100);
INSERT INTO `sys_role_permission` VALUES (1, 101);
INSERT INTO `sys_role_permission` VALUES (1, 102);
INSERT INTO `sys_role_permission` VALUES (1, 104);
INSERT INTO `sys_role_permission` VALUES (1, 105);
INSERT INTO `sys_role_permission` VALUES (1, 109);
INSERT INTO `sys_role_permission` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '百战', 'baizhan@163.com', '13812345678', '0', '', '$2a$10$mR0Y4ZVsrlJuTc/dMl0AUOPWH0UMCPQOEe3hYQgIre0oXZI9ZWAce', '0', '127.0.0.1', '2025-07-24 16:57:54', '2025-10-28 15:28:44', 'admin', '2025-07-24 16:57:54', 'admin', '2025-10-28 15:28:44', '管理员');
INSERT INTO `sys_user` VALUES (2, 'ry', '尚学堂', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '127.0.0.1', '2025-07-24 16:57:54', '2025-07-24 16:57:54', 'admin', '2025-07-24 16:57:54', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (6, 'bz123456', 'bz', '', '', '0', '', '123456', '0', '', NULL, NULL, '', '2025-08-05 18:07:00', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (5, 1);
INSERT INTO `sys_user_role` VALUES (6, 1);
INSERT INTO `sys_user_role` VALUES (6, 2);

-- ----------------------------
-- Table structure for wh_area
-- ----------------------------
DROP TABLE IF EXISTS `wh_area`;
CREATE TABLE `wh_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `area_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编号',
  `area_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `warehouse_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属仓库ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_area
-- ----------------------------
INSERT INTO `wh_area` VALUES (1, '1', '亭仓1', 1, '4', '12', '2025-06-09 09:20:20.000', '12', '2025-06-27 09:57:15.630');
INSERT INTO `wh_area` VALUES (3, '1', '阜仓1', 2, '', '12', '2025-06-10 08:33:54.000', '12', '2025-06-27 10:01:48.847');
INSERT INTO `wh_area` VALUES (4, '2', '亭仓2', 1, '', '12', '2025-06-27 09:57:01.000', '12', '2025-06-27 09:57:06.347');
INSERT INTO `wh_area` VALUES (5, '2', '阜仓2', 2, '', '12', '2025-06-27 10:01:59.132', NULL, NULL);

-- ----------------------------
-- Table structure for wh_check_order
-- ----------------------------
DROP TABLE IF EXISTS `wh_check_order`;
CREATE TABLE `wh_check_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `check_order_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '盘点单号',
  `check_order_status` tinyint(4) NULL DEFAULT 11 COMMENT '库存盘点单状态 -1：作废 0：未盘库 1：已盘库',
  `check_order_total` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '盈亏数',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '所属库区',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_check_order
-- ----------------------------
INSERT INTO `wh_check_order` VALUES (1, 'PK20250629-00001', 1, 3.00, 2, 3, '', 'admin', '2025-06-29 10:16:22.344', 'admin', '2025-11-14 15:33:21.000');
INSERT INTO `wh_check_order` VALUES (2, 'PK20250820-00003', 1, 0.00, 1, 1, '', 'admin', '2025-08-20 18:06:59.958', 'admin', '2025-08-20 18:08:59.324');
INSERT INTO `wh_check_order` VALUES (15, 'PK20251114-00019', 1, 1.00, 1, 1, '', 'admin', '2025-11-14 19:12:54.087', 'admin', '2025-11-14 19:13:42.704');
INSERT INTO `wh_check_order` VALUES (16, 'PK20251114-00022', 1, 1.00, 1, 1, '', 'admin', '2025-11-14 19:26:26.682', 'admin', '2025-11-14 19:26:31.332');
INSERT INTO `wh_check_order` VALUES (17, 'PK20251114-00025', 1, 1.00, 1, 1, '', 'admin', '2025-11-14 19:28:52.288', 'admin', '2025-11-14 19:29:33.107');
INSERT INTO `wh_check_order` VALUES (18, 'PK20251114-00028', 1, 1.00, 1, 1, '', 'admin', '2025-11-14 19:32:29.320', 'admin', '2025-11-14 19:32:52.354');
INSERT INTO `wh_check_order` VALUES (19, 'PK20251114-00031', 1, 1.00, 1, 1, '', 'admin', '2025-11-14 19:35:07.532', 'admin', '2025-11-14 19:35:34.620');
INSERT INTO `wh_check_order` VALUES (20, 'PK20251114-00034', 1, 1.00, 1, 1, '', 'admin', '2025-11-14 19:38:06.848', 'admin', '2025-11-14 19:38:09.607');

-- ----------------------------
-- Table structure for wh_check_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wh_check_order_detail`;
CREATE TABLE `wh_check_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `check_order_id` bigint(20) NULL DEFAULT 0 COMMENT '盘点单id',
  `sku_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '规格id',
  `quantity` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '库存数量',
  `check_quantity` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '盘点数量',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '所属库区',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期日期',
  `inventory_detail_id` bigint(20) NULL DEFAULT 0 COMMENT '入库记录id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存盘点单据详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_check_order_detail
-- ----------------------------
INSERT INTO `wh_check_order_detail` VALUES (1, 1, 1, 14.00, 15.00, 2, 3, '2025-06-01 00:00:00.000', '2025-06-30 00:00:00.000', 6, '', '12', '2025-06-29 10:16:22.400', NULL, NULL);
INSERT INTO `wh_check_order_detail` VALUES (2, 1, 2, 10.00, 6.00, 2, 3, '2025-06-01 00:00:00.000', '2025-06-30 00:00:00.000', 3, '', '12', '2025-06-29 10:16:22.409', NULL, NULL);
INSERT INTO `wh_check_order_detail` VALUES (3, 1, 4, 10.00, 7.00, 2, 3, '2025-06-01 00:00:00.000', '2025-06-30 00:00:00.000', 4, '', '12', '2025-06-29 10:16:22.412', NULL, NULL);
INSERT INTO `wh_check_order_detail` VALUES (4, 2, 1, 20.00, 15.00, 1, 1, NULL, NULL, 12, '', NULL, '2025-08-20 18:06:59.963', NULL, '2025-08-20 18:06:59.963');
INSERT INTO `wh_check_order_detail` VALUES (21, 15, 12, 4.00, 3.00, 1, 1, '2025-11-04 00:00:00.000', '2025-11-12 00:00:00.000', 17, '', 'admin', '2025-11-14 19:13:14.477', 'admin', '2025-11-14 19:13:33.649');
INSERT INTO `wh_check_order_detail` VALUES (22, 15, 13, 1.00, 3.00, 1, 1, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 16, '', 'admin', '2025-11-14 19:13:14.477', 'admin', '2025-11-14 19:13:33.649');
INSERT INTO `wh_check_order_detail` VALUES (24, 16, 12, 4.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 17, '', 'admin', '2025-11-14 19:26:27.274', 'admin', '2025-11-14 19:26:27.274');
INSERT INTO `wh_check_order_detail` VALUES (25, 16, 13, 1.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 16, '', 'admin', '2025-11-14 19:26:27.274', 'admin', '2025-11-14 19:26:27.274');
INSERT INTO `wh_check_order_detail` VALUES (26, 17, 12, 4.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 17, '', 'admin', '2025-11-14 19:28:52.842', 'admin', '2025-11-14 19:28:52.842');
INSERT INTO `wh_check_order_detail` VALUES (27, 17, 13, 1.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 16, '', 'admin', '2025-11-14 19:28:52.842', 'admin', '2025-11-14 19:28:52.842');
INSERT INTO `wh_check_order_detail` VALUES (28, 18, 12, 4.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 17, '', 'admin', '2025-11-14 19:32:29.799', 'admin', '2025-11-14 19:32:29.799');
INSERT INTO `wh_check_order_detail` VALUES (29, 18, 13, 1.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 16, '', 'admin', '2025-11-14 19:32:29.799', 'admin', '2025-11-14 19:32:29.799');
INSERT INTO `wh_check_order_detail` VALUES (30, 19, 12, 4.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 17, '', 'admin', '2025-11-14 19:35:07.679', 'admin', '2025-11-14 19:35:07.679');
INSERT INTO `wh_check_order_detail` VALUES (31, 19, 13, 1.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 16, '', 'admin', '2025-11-14 19:35:07.679', 'admin', '2025-11-14 19:35:07.679');
INSERT INTO `wh_check_order_detail` VALUES (32, 20, 13, 1.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 16, '', 'admin', '2025-11-14 19:38:07.406', 'admin', '2025-11-14 19:38:07.406');
INSERT INTO `wh_check_order_detail` VALUES (33, 20, 12, 4.00, 3.00, 1, 1, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 17, '', 'admin', '2025-11-14 19:38:07.406', 'admin', '2025-11-14 19:38:07.406');

-- ----------------------------
-- Table structure for wh_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wh_inventory`;
CREATE TABLE `wh_inventory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) NULL DEFAULT 0 COMMENT '规格ID',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '所属库区',
  `quantity` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '库存',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_inventory
-- ----------------------------
INSERT INTO `wh_inventory` VALUES (11, 13, 1, 1, 9.00, '', 'admin', '2025-11-11 11:19:00.842', 'admin', '2025-11-18 15:46:15.100');
INSERT INTO `wh_inventory` VALUES (12, 12, 1, 1, 10.00, '', 'admin', '2025-11-11 11:19:00.847', 'admin', '2025-11-17 15:37:18.807');
INSERT INTO `wh_inventory` VALUES (13, 11, 1, 1, 7.00, '', 'admin', '2025-11-11 11:19:00.848', 'admin', '2025-11-18 15:48:13.613');
INSERT INTO `wh_inventory` VALUES (21, 13, 1, 4, 1.00, '', 'admin', '2025-11-18 15:46:15.105', 'admin', '2025-11-18 15:46:15.105');
INSERT INTO `wh_inventory` VALUES (22, 11, 1, 4, 3.00, '', 'admin', '2025-11-18 15:46:15.112', 'admin', '2025-11-18 15:48:13.616');

-- ----------------------------
-- Table structure for wh_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `wh_inventory_detail`;
CREATE TABLE `wh_inventory_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `receipt_order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '入库单id',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '单号',
  `sku_id` bigint(20) NULL DEFAULT 0 COMMENT 'sku的ID',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '所属库区',
  `quantity` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '入库数量',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期时间',
  `amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金额',
  `remain_quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '剩余数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_polish_ci COMMENT = '库存详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_inventory_detail
-- ----------------------------
INSERT INTO `wh_inventory_detail` VALUES (16, 21, 'RK20251111-00008', 13, 1, 1, 3.00, '2025-11-05 00:00:00.000', '2025-11-06 00:00:00.000', 2.00, 2.00, '', 'admin', '2025-11-11 11:19:00.850', 'admin', '2025-11-18 15:46:15.115');
INSERT INTO `wh_inventory_detail` VALUES (17, 21, 'RK20251111-00008', 12, 1, 1, 3.00, '2025-11-05 00:00:00.000', '2025-11-13 00:00:00.000', 5.00, 1.00, '', 'admin', '2025-11-11 11:19:00.853', 'admin', '2025-11-17 15:37:18.815');
INSERT INTO `wh_inventory_detail` VALUES (18, 21, 'RK20251111-00008', 11, 1, 1, 6.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', 10.00, 3.00, '', 'admin', '2025-11-11 11:19:00.854', 'admin', '2025-11-18 15:48:13.619');
INSERT INTO `wh_inventory_detail` VALUES (19, 22, 'RK20251111-00009', 13, 1, 1, 3.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 2.00, 2.00, '', 'admin', '2025-11-11 11:21:58.477', 'admin', '2025-11-18 15:34:25.238');
INSERT INTO `wh_inventory_detail` VALUES (29, 21, 'RK20251111-00008', 13, 1, 4, 1.00, '2025-11-05 00:00:00.000', '2025-11-06 00:00:00.000', 2.00, 1.00, '', 'admin', '2025-11-18 15:46:15.119', 'admin', '2025-11-18 15:46:15.119');
INSERT INTO `wh_inventory_detail` VALUES (30, 21, 'RK20251111-00008', 11, 1, 4, 3.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', 10.00, 3.00, '', 'admin', '2025-11-18 15:46:15.125', 'admin', '2025-11-18 15:48:13.623');

-- ----------------------------
-- Table structure for wh_inventory_history
-- ----------------------------
DROP TABLE IF EXISTS `wh_inventory_history`;
CREATE TABLE `wh_inventory_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '所属库区',
  `sku_id` bigint(20) NULL DEFAULT 0 COMMENT '物料ID',
  `quantity` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '库存变化',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期日期',
  `amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金额',
  `order_id` bigint(20) NULL DEFAULT 0 COMMENT '操作id（出库、入库、库存移动表单id）',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作单号（入库、出库、移库、盘库单号）',
  `order_type` int(11) NULL DEFAULT 0 COMMENT '操作类型（1.入库 2.出库 3.移库 4.盘库）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_inventory_history
-- ----------------------------
INSERT INTO `wh_inventory_history` VALUES (31, 1, 1, 13, 3.00, '2025-11-05 00:00:00.000', '2025-11-06 00:00:00.000', 2.00, 21, '', 1, '', 'admin', '2025-11-11 11:19:00.856', 'admin', '2025-11-11 11:19:00.856');
INSERT INTO `wh_inventory_history` VALUES (32, 1, 1, 12, 5.00, '2025-11-05 00:00:00.000', '2025-11-13 00:00:00.000', 5.00, 21, '', 1, '', 'admin', '2025-11-11 11:19:00.861', 'admin', '2025-11-11 11:19:00.861');
INSERT INTO `wh_inventory_history` VALUES (33, 1, 1, 11, 2.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', 10.00, 21, '', 1, '', 'admin', '2025-11-11 11:19:00.862', 'admin', '2025-11-11 11:19:00.862');
INSERT INTO `wh_inventory_history` VALUES (34, 1, 1, 13, 3.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 2.00, 22, 'RK20251111-00009', 1, '', 'admin', '2025-11-11 11:21:58.480', 'admin', '2025-11-11 11:21:58.480');
INSERT INTO `wh_inventory_history` VALUES (35, 1, 1, 13, -1.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', -2.00, 12, 'CK20251113-00003', 2, '', 'admin', '2025-11-13 17:59:30.203', 'admin', '2025-11-13 17:59:30.203');
INSERT INTO `wh_inventory_history` VALUES (36, 1, 1, 11, -1.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', -10.00, 12, 'CK20251113-00003', 2, '', 'admin', '2025-11-13 17:59:30.212', 'admin', '2025-11-13 17:59:30.212');
INSERT INTO `wh_inventory_history` VALUES (37, 1, 1, 13, -1.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', -2.00, 13, 'CK20251114-00001', 2, '', 'admin', '2025-11-14 11:51:06.766', 'admin', '2025-11-14 11:51:06.766');
INSERT INTO `wh_inventory_history` VALUES (38, 1, 1, 11, -1.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', -10.00, 13, 'CK20251114-00001', 2, '', 'admin', '2025-11-14 11:51:06.768', 'admin', '2025-11-14 11:51:06.768');
INSERT INTO `wh_inventory_history` VALUES (39, 1, 1, 12, -1.00, '2025-11-04 00:00:00.000', '2025-11-12 00:00:00.000', 5.00, 9, 'YK20251114-00005', 3, '', 'admin', '2025-11-14 12:36:17.772', 'admin', '2025-11-14 12:36:17.772');
INSERT INTO `wh_inventory_history` VALUES (40, 1, 4, 12, 1.00, '2025-11-04 00:00:00.000', '2025-11-12 00:00:00.000', 5.00, 9, 'YK20251114-00005', 3, '', 'admin', '2025-11-14 12:36:17.773', 'admin', '2025-11-14 12:36:17.773');
INSERT INTO `wh_inventory_history` VALUES (41, 1, 1, 13, -2.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 2.00, 9, 'YK20251114-00005', 3, '', 'admin', '2025-11-14 12:36:17.775', 'admin', '2025-11-14 12:36:17.775');
INSERT INTO `wh_inventory_history` VALUES (42, 1, 4, 13, 2.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 2.00, 9, 'YK20251114-00005', 3, '', 'admin', '2025-11-14 12:36:17.775', 'admin', '2025-11-14 12:36:17.775');
INSERT INTO `wh_inventory_history` VALUES (43, 1, 1, 12, -1.00, '2025-11-04 00:00:00.000', '2025-11-12 00:00:00.000', 0.00, 15, 'PK20251114-00019', 4, '', 'admin', '2025-11-14 19:13:42.700', 'admin', '2025-11-14 19:13:42.700');
INSERT INTO `wh_inventory_history` VALUES (44, 1, 1, 13, 2.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 0.00, 15, 'PK20251114-00019', 4, '', 'admin', '2025-11-14 19:13:42.702', 'admin', '2025-11-14 19:13:42.702');
INSERT INTO `wh_inventory_history` VALUES (45, 1, 1, 12, -1.00, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 0.00, 16, 'PK20251114-00022', 4, '', 'admin', '2025-11-14 19:26:31.327', 'admin', '2025-11-14 19:26:31.327');
INSERT INTO `wh_inventory_history` VALUES (46, 1, 1, 13, 2.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 0.00, 16, 'PK20251114-00022', 4, '', 'admin', '2025-11-14 19:26:31.330', 'admin', '2025-11-14 19:26:31.330');
INSERT INTO `wh_inventory_history` VALUES (47, 1, 1, 12, -1.00, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 0.00, 17, 'PK20251114-00025', 4, '', 'admin', '2025-11-14 19:29:33.102', 'admin', '2025-11-14 19:29:33.102');
INSERT INTO `wh_inventory_history` VALUES (48, 1, 1, 13, 2.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 0.00, 17, 'PK20251114-00025', 4, '', 'admin', '2025-11-14 19:29:33.106', 'admin', '2025-11-14 19:29:33.106');
INSERT INTO `wh_inventory_history` VALUES (49, 1, 1, 12, -1.00, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 0.00, 18, 'PK20251114-00028', 4, '', 'admin', '2025-11-14 19:32:52.349', 'admin', '2025-11-14 19:32:52.349');
INSERT INTO `wh_inventory_history` VALUES (50, 1, 1, 13, 2.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 0.00, 18, 'PK20251114-00028', 4, '', 'admin', '2025-11-14 19:32:52.352', 'admin', '2025-11-14 19:32:52.352');
INSERT INTO `wh_inventory_history` VALUES (51, 1, 1, 12, -1.00, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 0.00, 19, 'PK20251114-00031', 4, '', 'admin', '2025-11-14 19:35:34.617', 'admin', '2025-11-14 19:35:34.617');
INSERT INTO `wh_inventory_history` VALUES (52, 1, 1, 13, 2.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 0.00, 19, 'PK20251114-00031', 4, '', 'admin', '2025-11-14 19:35:34.619', 'admin', '2025-11-14 19:35:34.619');
INSERT INTO `wh_inventory_history` VALUES (53, 1, 1, 13, 2.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 0.00, 20, 'PK20251114-00034', 4, '', 'admin', '2025-11-14 19:38:09.601', 'admin', '2025-11-14 19:38:09.601');
INSERT INTO `wh_inventory_history` VALUES (54, 1, 1, 12, -1.00, '2025-11-04 16:00:00.000', '2025-11-12 16:00:00.000', 0.00, 20, 'PK20251114-00034', 4, '', 'admin', '2025-11-14 19:38:09.606', 'admin', '2025-11-14 19:38:09.606');
INSERT INTO `wh_inventory_history` VALUES (55, 1, 1, 13, -1.00, '2025-11-05 00:00:00.000', '2025-11-06 00:00:00.000', -2.00, 20, 'CK20251117-00001', 2, '', 'admin', '2025-11-17 15:37:18.816', 'admin', '2025-11-17 15:37:18.816');
INSERT INTO `wh_inventory_history` VALUES (56, 1, 1, 12, -2.00, '2025-11-05 00:00:00.000', '2025-11-13 00:00:00.000', -10.00, 20, 'CK20251117-00001', 2, '', 'admin', '2025-11-17 15:37:18.820', 'admin', '2025-11-17 15:37:18.820');
INSERT INTO `wh_inventory_history` VALUES (71, 1, 1, 13, -1.00, '2025-11-05 00:00:00.000', '2025-11-06 00:00:00.000', 2.00, 24, 'YK20251118-00008', 3, '', 'admin', '2025-11-18 15:37:13.795', 'admin', '2025-11-18 15:37:13.795');
INSERT INTO `wh_inventory_history` VALUES (72, 1, 1, 11, -1.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', 10.00, 25, 'YK20251118-00009', 3, '', 'admin', '2025-11-18 15:40:35.519', 'admin', '2025-11-18 15:40:35.519');
INSERT INTO `wh_inventory_history` VALUES (73, 1, 1, 13, -1.00, '2025-11-05 00:00:00.000', '2025-11-06 00:00:00.000', 2.00, 26, 'YK20251118-00010', 3, '', 'admin', '2025-11-18 15:46:15.128', 'admin', '2025-11-18 15:46:15.128');
INSERT INTO `wh_inventory_history` VALUES (74, 1, 1, 11, -2.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', 10.00, 26, 'YK20251118-00010', 3, '', 'admin', '2025-11-18 15:46:15.132', 'admin', '2025-11-18 15:46:15.132');
INSERT INTO `wh_inventory_history` VALUES (75, 1, 1, 11, -1.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', 10.00, 27, 'YK20251118-00011', 3, '', 'admin', '2025-11-18 15:48:13.624', 'admin', '2025-11-18 15:48:13.624');

-- ----------------------------
-- Table structure for wh_item
-- ----------------------------
DROP TABLE IF EXISTS `wh_item`;
CREATE TABLE `wh_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `item_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编号',
  `item_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类id',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '单位类别',
  `item_brand` bigint(20) NULL DEFAULT 0 COMMENT '品牌',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_item
-- ----------------------------
INSERT INTO `wh_item` VALUES (10, '1001', '麒麟瓜', 14, '个', 5, '', 'admin', '2025-11-04 17:10:24.857', 'admin', '2025-11-10 17:30:16.877');
INSERT INTO `wh_item` VALUES (11, '1002', '新疆瓜', 14, '个', 1, '', 'admin', '2025-11-05 15:39:03.967', 'admin', '2025-11-10 17:30:10.134');

-- ----------------------------
-- Table structure for wh_item_brand
-- ----------------------------
DROP TABLE IF EXISTS `wh_item_brand`;
CREATE TABLE `wh_item_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `brand_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_item_brand
-- ----------------------------
INSERT INTO `wh_item_brand` VALUES (1, '华为', '', '12', '2025-06-09 10:21:13.000', '12', '2025-06-12 10:48:11.483');
INSERT INTO `wh_item_brand` VALUES (5, '麒麟', '', 'admin', '2025-11-05 15:31:28.166', 'admin', '2025-11-05 15:31:28.166');

-- ----------------------------
-- Table structure for wh_item_category
-- ----------------------------
DROP TABLE IF EXISTS `wh_item_category`;
CREATE TABLE `wh_item_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物料类型id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父物料类型id',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '物料类型名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_item_category
-- ----------------------------
INSERT INTO `wh_item_category` VALUES (11, 0, '水果', 0, '', 'admin', '2025-11-04 16:58:22.711', 'admin', '2025-11-04 16:58:22.711');
INSERT INTO `wh_item_category` VALUES (13, 0, '化肥', 0, '', 'admin', '2025-11-04 16:58:33.562', 'admin', '2025-11-04 16:58:33.562');
INSERT INTO `wh_item_category` VALUES (14, 11, '西瓜', 0, '', 'admin', '2025-11-04 16:59:27.533', 'admin', '2025-11-04 16:59:27.533');

-- ----------------------------
-- Table structure for wh_item_sku
-- ----------------------------
DROP TABLE IF EXISTS `wh_item_sku`;
CREATE TABLE `wh_item_sku`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规格名称',
  `item_id` bigint(20) NULL DEFAULT 0 COMMENT '物料id',
  `barcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '条码',
  `sku_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编码',
  `length` decimal(10, 1) NULL DEFAULT 0.0 COMMENT '长，单位cm',
  `width` decimal(10, 1) NULL DEFAULT 0.0 COMMENT '宽，单位cm',
  `height` decimal(10, 1) NULL DEFAULT 0.0 COMMENT '高，单位cm',
  `gross_weight` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '毛重，单位kg',
  `net_weight` decimal(10, 3) NULL DEFAULT 0.000 COMMENT '净重，单位kg',
  `cost_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '成本价（元）',
  `selling_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '销售价（元）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'sku信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_item_sku
-- ----------------------------
INSERT INTO `wh_item_sku` VALUES (11, '大箱', 10, '100201', '100201', 1.0, 1.0, 1.0, 1.000, 1.000, 1.00, 1.00, '', 'admin', '2025-11-10 17:29:34.803', 'admin', '2025-11-10 17:30:16.973');
INSERT INTO `wh_item_sku` VALUES (12, '中箱', 10, '100202', '100202', 1.0, 1.0, 1.0, 1.000, 1.000, 1.00, 1.00, '', 'admin', '2025-11-10 17:29:34.834', 'admin', '2025-11-10 17:30:16.949');
INSERT INTO `wh_item_sku` VALUES (13, '大箱', 11, '100301', '100301', 1.0, 1.0, 1.0, 1.000, 1.000, 1.00, 1.00, '', 'admin', '2025-11-10 17:30:10.205', 'admin', '2025-11-10 17:30:10.205');

-- ----------------------------
-- Table structure for wh_merchant
-- ----------------------------
DROP TABLE IF EXISTS `wh_merchant`;
CREATE TABLE `wh_merchant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '编号',
  `merchant_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `merchant_type` tinyint(4) NULL DEFAULT 0 COMMENT '企业类型',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '开户行',
  `bank_account` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '银行账户',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址',
  `mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `tel` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '座机号',
  `contact_person` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Email',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '往来单位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_merchant
-- ----------------------------
INSERT INTO `wh_merchant` VALUES (2, '1002', '北京农贸市场', 3, '', '', '123', '13812345678', '01012345678', '112233', 'bjnm@163.com', '', 'admin', '2025-11-04 15:50:55.758', 'admin', '2025-11-04 15:50:55.758');

-- ----------------------------
-- Table structure for wh_movement_order
-- ----------------------------
DROP TABLE IF EXISTS `wh_movement_order`;
CREATE TABLE `wh_movement_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `movement_order_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编号',
  `source_warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '源仓库',
  `source_area_id` bigint(20) NULL DEFAULT 0 COMMENT '源库区',
  `target_warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '目标仓库',
  `target_area_id` bigint(20) NULL DEFAULT 0 COMMENT '目标库区',
  `movement_order_status` tinyint(4) NULL DEFAULT 0 COMMENT '状态',
  `total_quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '总数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '移库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_movement_order
-- ----------------------------
INSERT INTO `wh_movement_order` VALUES (26, 'YK20251118-00010', 1, 1, 1, 4, 1, 3.00, '', 'admin', '2025-11-18 15:45:24.426', 'admin', '2025-11-18 15:46:15.133');
INSERT INTO `wh_movement_order` VALUES (27, 'YK20251118-00011', 1, 1, 1, 4, 1, 1.00, '', 'admin', '2025-11-18 15:48:10.727', 'admin', '2025-11-18 15:48:13.626');

-- ----------------------------
-- Table structure for wh_movement_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wh_movement_order_detail`;
CREATE TABLE `wh_movement_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `movement_order_id` bigint(20) NULL DEFAULT 0 COMMENT '移库单Id',
  `sku_id` bigint(20) NULL DEFAULT 0 COMMENT '规格id',
  `quantity` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '数量',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期日期',
  `source_warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '源仓库',
  `source_area_id` bigint(20) NULL DEFAULT 0 COMMENT '源库区',
  `target_warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '目标仓库',
  `target_area_id` bigint(20) NULL DEFAULT 0 COMMENT '目标库区',
  `inventory_detail_id` bigint(20) NULL DEFAULT 0 COMMENT '入库记录id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '库存移动详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_movement_order_detail
-- ----------------------------
INSERT INTO `wh_movement_order_detail` VALUES (32, 26, 11, 2.00, '2025-11-04 00:00:00.000', '2025-11-11 00:00:00.000', 1, 1, 1, 4, 18, '', 'admin', '2025-11-18 15:45:24.904', 'admin', '2025-11-18 15:46:06.700');
INSERT INTO `wh_movement_order_detail` VALUES (33, 26, 13, 1.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 1, 1, 1, 4, 16, '', 'admin', '2025-11-18 15:46:06.700', 'admin', '2025-11-18 15:46:06.700');
INSERT INTO `wh_movement_order_detail` VALUES (34, 27, 11, 1.00, '2025-11-04 16:00:00.000', '2025-11-11 16:00:00.000', 1, 1, 1, 4, 18, '', 'admin', '2025-11-18 15:48:10.829', 'admin', '2025-11-18 15:48:10.829');

-- ----------------------------
-- Table structure for wh_receipt_order
-- ----------------------------
DROP TABLE IF EXISTS `wh_receipt_order`;
CREATE TABLE `wh_receipt_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `receipt_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '入库单号',
  `receipt_order_type` int(4) NULL DEFAULT NULL COMMENT '入库类型（1.正常入库 2.移库入库 3.盘库入库）\r\n',
  `merchant_id` bigint(20) NULL DEFAULT 0 COMMENT '供应商',
  `total_quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品总数',
  `payable_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单金额',
  `receipt_order_status` tinyint(4) NULL DEFAULT 0 COMMENT '入库状态',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '仓库id',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '库区id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_receipt_order
-- ----------------------------
INSERT INTO `wh_receipt_order` VALUES (21, 'RK20251111-00008', 1, 2, 10.00, 51.00, 1, 1, 1, '', 'admin', '2025-11-11 11:18:08.846', 'admin', '2025-11-11 11:19:00.863');
INSERT INTO `wh_receipt_order` VALUES (22, 'RK20251111-00009', 1, 2, 3.00, 6.00, 1, 1, 1, '', 'admin', '2025-11-11 11:21:46.823', 'admin', '2025-11-11 11:21:58.483');
INSERT INTO `wh_receipt_order` VALUES (24, 'RK20251114-00020', 2, 0, 0.00, 0.00, 0, 1, 1, 'PK20251114-00019', 'admin', '2025-11-14 19:13:42.674', 'admin', '2025-11-14 19:13:42.674');
INSERT INTO `wh_receipt_order` VALUES (25, 'RK20251114-00023', 2, 0, 0.00, 0.00, 1, 1, 1, 'PK20251114-00022', 'admin', '2025-11-14 19:26:31.289', 'admin', '2025-11-14 19:26:31.289');
INSERT INTO `wh_receipt_order` VALUES (26, 'RK20251114-00026', 2, 0, 0.00, 0.00, 1, 1, 1, 'PK20251114-00025', 'admin', '2025-11-14 19:28:59.895', 'admin', '2025-11-14 19:28:59.895');
INSERT INTO `wh_receipt_order` VALUES (27, 'RK20251114-00029', 2, 0, 2.00, 0.00, 1, 1, 1, 'PK20251114-00028', 'admin', '2025-11-14 19:32:52.310', 'admin', '2025-11-14 19:32:52.310');
INSERT INTO `wh_receipt_order` VALUES (28, 'RK20251114-00032', 2, 0, 2.00, 0.00, 1, 1, 1, 'PK20251114-00031', 'admin', '2025-11-14 19:35:09.944', 'admin', '2025-11-14 19:35:09.944');
INSERT INTO `wh_receipt_order` VALUES (29, 'RK20251114-00035', 2, 0, 2.00, 0.00, 1, 1, 1, 'PK20251114-00034', 'admin', '2025-11-14 19:38:09.563', 'admin', '2025-11-14 19:38:09.563');

-- ----------------------------
-- Table structure for wh_receipt_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wh_receipt_order_detail`;
CREATE TABLE `wh_receipt_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `receipt_order_id` bigint(20) NULL DEFAULT 0 COMMENT '入库单号',
  `sku_id` bigint(20) NULL DEFAULT 0 COMMENT '规格id',
  `quantity` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '入库数量',
  `amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金额',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期时间',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '所属库区',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '入库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_receipt_order_detail
-- ----------------------------
INSERT INTO `wh_receipt_order_detail` VALUES (26, 21, 11, 2.00, 10.00, '2025-11-05 00:00:00.000', '2025-11-12 00:00:00.000', 1, 1, '', 'admin', '2025-11-11 11:18:09.320', 'admin', '2025-11-11 11:18:09.320');
INSERT INTO `wh_receipt_order_detail` VALUES (27, 21, 12, 2.00, 5.00, '2025-11-05 00:00:00.000', '2025-11-13 00:00:00.000', 1, 1, '', 'admin', '2025-11-11 11:18:09.320', 'admin', '2025-11-11 11:18:09.320');
INSERT INTO `wh_receipt_order_detail` VALUES (28, 21, 12, 3.00, 5.00, '2025-11-05 00:00:00.000', '2025-11-13 00:00:00.000', 1, 1, '', 'admin', '2025-11-11 11:18:09.320', 'admin', '2025-11-11 11:18:09.320');
INSERT INTO `wh_receipt_order_detail` VALUES (29, 21, 13, 3.00, 2.00, '2025-11-05 00:00:00.000', '2025-11-06 00:00:00.000', 1, 1, '', 'admin', '2025-11-11 11:18:36.170', 'admin', '2025-11-11 11:18:36.170');
INSERT INTO `wh_receipt_order_detail` VALUES (30, 22, 13, 3.00, 2.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 1, 1, '', 'admin', '2025-11-11 11:21:47.366', 'admin', '2025-11-11 11:21:47.366');
INSERT INTO `wh_receipt_order_detail` VALUES (33, 24, 13, 2.00, 0.00, '2025-11-04 00:00:00.000', '2025-11-05 00:00:00.000', 1, 1, '', NULL, NULL, NULL, NULL);
INSERT INTO `wh_receipt_order_detail` VALUES (34, 25, 13, 2.00, 0.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 1, 1, '', NULL, NULL, NULL, NULL);
INSERT INTO `wh_receipt_order_detail` VALUES (35, 26, 13, 2.00, 0.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 1, 1, '', 'admin', '2025-11-14 19:29:33.048', 'admin', '2025-11-14 19:29:33.048');
INSERT INTO `wh_receipt_order_detail` VALUES (36, 27, 13, 2.00, 0.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 1, 1, '', 'admin', '2025-11-14 19:32:52.315', 'admin', '2025-11-14 19:32:52.315');
INSERT INTO `wh_receipt_order_detail` VALUES (37, 28, 13, 2.00, 0.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 1, 1, '', 'admin', '2025-11-14 19:35:09.946', 'admin', '2025-11-14 19:35:09.946');
INSERT INTO `wh_receipt_order_detail` VALUES (38, 29, 13, 2.00, 0.00, '2025-11-04 16:00:00.000', '2025-11-05 16:00:00.000', 1, 1, '', 'admin', '2025-11-14 19:38:09.569', 'admin', '2025-11-14 19:38:09.569');

-- ----------------------------
-- Table structure for wh_shipment_order
-- ----------------------------
DROP TABLE IF EXISTS `wh_shipment_order`;
CREATE TABLE `wh_shipment_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shipment_order_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '出库单号，系统自动生成',
  `shipment_order_type` int(4) NULL DEFAULT NULL COMMENT '出库类型(1.普通出库 2.盘亏出库)',
  `merchant_id` bigint(20) NULL DEFAULT 0 COMMENT '客户',
  `receivable_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单金额',
  `total_quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '出库数量',
  `shipment_order_status` tinyint(4) NULL DEFAULT 0 COMMENT '出库单状态',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '仓库id',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '库区id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_shipment_order
-- ----------------------------

-- ----------------------------
-- Table structure for wh_shipment_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wh_shipment_order_detail`;
CREATE TABLE `wh_shipment_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shipment_order_id` bigint(20) NULL DEFAULT 0 COMMENT '出库单',
  `sku_id` bigint(20) NULL DEFAULT 0 COMMENT '规格id',
  `quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金额',
  `warehouse_id` bigint(20) NULL DEFAULT 0 COMMENT '所属仓库',
  `area_id` bigint(20) NULL DEFAULT 0 COMMENT '所属库区',
  `production_date` datetime(3) NULL DEFAULT NULL COMMENT '生产日期',
  `expiration_date` datetime(3) NULL DEFAULT NULL COMMENT '过期时间',
  `inventory_detail_id` bigint(20) NULL DEFAULT 0 COMMENT '入库记录id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_shipment_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for wh_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wh_warehouse`;
CREATE TABLE `wh_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `warehouse_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编号',
  `warehouse_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `order_num` bigint(20) NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(3) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wh_warehouse
-- ----------------------------
INSERT INTO `wh_warehouse` VALUES (1, '1', '亭湖仓库', '', 0, '12', '2025-06-09 09:08:43.000', '12', '2025-06-27 09:56:40.806');
INSERT INTO `wh_warehouse` VALUES (2, '2', '阜宁仓库', '', 0, '12', '2025-06-10 08:33:21.000', '12', '2025-06-27 10:01:40.637');
INSERT INTO `wh_warehouse` VALUES (3, '1004', '北京仓库1', '', 0, NULL, '2025-08-22 18:07:51.680', NULL, '2025-08-22 18:07:51.680');
INSERT INTO `wh_warehouse` VALUES (4, '1005', '北京仓库2', '', 0, NULL, '2025-08-22 18:22:43.124', NULL, '2025-08-22 18:22:43.124');
INSERT INTO `wh_warehouse` VALUES (5, '1006', '北京仓库6', '', 0, NULL, '2025-08-22 18:26:01.673', NULL, '2025-08-22 18:26:01.673');
INSERT INTO `wh_warehouse` VALUES (6, '1007', '北京仓库7', '', 0, NULL, '2025-08-22 18:55:13.045', NULL, '2025-08-22 18:55:13.045');
INSERT INTO `wh_warehouse` VALUES (17, '1008', '北京仓库8', '', 0, 'admin', '2025-11-21 15:10:38.078', 'admin', '2025-11-21 15:10:38.078');

SET FOREIGN_KEY_CHECKS = 1;
