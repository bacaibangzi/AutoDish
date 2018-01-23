/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : auto_dish

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-01-05 15:50:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cook
-- ----------------------------
DROP TABLE IF EXISTS `cook`;
CREATE TABLE `cook` (
  `sn` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL ,
  `phone` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `org_code` varchar(64) DEFAULT NULL,
  `p1` varchar(64) DEFAULT NULL,
  `p2` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cook
-- ----------------------------
INSERT INTO `cook` VALUES ('2', '大厨师', '1', '2017-12-28 00:00:00', '13333333', '1', '0000', null, null);

-- ----------------------------
-- Table structure for dev_org_info
-- ----------------------------
DROP TABLE IF EXISTS `dev_org_info`;
CREATE TABLE `dev_org_info` (
  `OI_ID` decimal(12,0) NOT NULL COMMENT '机构ID',
  `OI_CODE` varchar(128) NOT NULL COMMENT '机构CODE',
  `OI_NAME` varchar(128) DEFAULT NULL COMMENT '机构名称',
  `OI_MEMO` varchar(256) DEFAULT NULL COMMENT '机构说明',
  `OI_TYPE` varchar(16) DEFAULT NULL COMMENT '构机类型',
  `AREA_CODE` varchar(64) DEFAULT NULL COMMENT '域区编码',
  `AREA_NAME` varchar(64) DEFAULT NULL COMMENT '域区名称',
  `PRINT_CHECK` int(1) DEFAULT '1' COMMENT '打印标记',
  `PRINT_CONTEXT` varchar(255) DEFAULT NULL COMMENT '打印内容',
  `lon` double(16,8) DEFAULT NULL,
  `lat` double(16,8) DEFAULT NULL,
  PRIMARY KEY (`OI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构信息表';

-- ----------------------------
-- Records of dev_org_info
-- ----------------------------
INSERT INTO `dev_org_info` VALUES ('1', '0000', '学校', '1', '0', '', '北京市', null, null, null, null);
INSERT INTO `dev_org_info` VALUES ('250', '00000001', '学生食堂1', '学生食堂1', '1', null, null, '1', null, null, null);
INSERT INTO `dev_org_info` VALUES ('251', '00000002', '学生食堂2', '学生食堂2', '1', null, null, '1', null, null, null);
INSERT INTO `dev_org_info` VALUES ('252', '00000003', '教师食堂1', '教师食堂1', '1', null, null, '1', null, null, null);
INSERT INTO `dev_org_info` VALUES ('255', '000000030001', '绿焖鸡摊位', '444', '2', null, null, '1', null, null, null);
INSERT INTO `dev_org_info` VALUES ('256', '000000020001', '南京糖水鸭摊位', '5', '2', null, null, '1', null, null, null);
INSERT INTO `dev_org_info` VALUES ('257', '000000010001', '夫妻肺片摊位', '33', '2', null, null, '1', null, null, null);
INSERT INTO `dev_org_info` VALUES ('258', '000000030002', '儿童食堂', '儿童食堂', '2', null, null, '1', null, null, null);
INSERT INTO `dev_org_info` VALUES ('262', '000000030003', '22', '22', '2', null, null, '1', null, null, null);

-- ----------------------------
-- Table structure for dev_role_info
-- ----------------------------
DROP TABLE IF EXISTS `dev_role_info`;
CREATE TABLE `dev_role_info` (
  `RI_ID` decimal(12,0) NOT NULL COMMENT '角色ID',
  `RI_NAME` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `RI_MEMO` varchar(256) DEFAULT NULL COMMENT '角色描述',
  `RI_LEVEL` decimal(1,0) DEFAULT NULL COMMENT '角色类型',
  `ORG_CODE` varchar(128) DEFAULT NULL COMMENT '数据权限机构（12位一级）',
  `PARENT_ID` decimal(12,0) DEFAULT NULL COMMENT '父ID',
  PRIMARY KEY (`RI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dev_role_info
-- ----------------------------
INSERT INTO `dev_role_info` VALUES ('2', '系统管理角色', '系统管理角色', '1', '', null);
INSERT INTO `dev_role_info` VALUES ('3', '商户角色', '商户角色', '1', '', null);

-- ----------------------------
-- Table structure for dev_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `dev_role_menu`;
CREATE TABLE `dev_role_menu` (
  `RM_ID` decimal(12,0) NOT NULL COMMENT '角色功能ID',
  `RI_ID` decimal(12,0) DEFAULT NULL COMMENT '角色ID',
  `MI_ID` decimal(12,0) DEFAULT NULL COMMENT '功能ID',
  `RM_MEMO` varchar(256) DEFAULT NULL COMMENT '角色功能说明',
  PRIMARY KEY (`RM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能表';

-- ----------------------------
-- Records of dev_role_menu
-- ----------------------------
INSERT INTO `dev_role_menu` VALUES ('999', '8', '0', null);
INSERT INTO `dev_role_menu` VALUES ('1000', '8', '159', null);
INSERT INTO `dev_role_menu` VALUES ('1001', '8', '160', null);
INSERT INTO `dev_role_menu` VALUES ('1002', '8', '161', null);
INSERT INTO `dev_role_menu` VALUES ('1003', '8', '162', null);
INSERT INTO `dev_role_menu` VALUES ('1004', '8', '163', null);
INSERT INTO `dev_role_menu` VALUES ('1005', '8', '164', null);
INSERT INTO `dev_role_menu` VALUES ('1006', '8', '165', null);
INSERT INTO `dev_role_menu` VALUES ('1007', '8', '166', null);
INSERT INTO `dev_role_menu` VALUES ('1008', '8', '167', null);
INSERT INTO `dev_role_menu` VALUES ('1009', '8', '1159', null);
INSERT INTO `dev_role_menu` VALUES ('2009', '6', '0', null);
INSERT INTO `dev_role_menu` VALUES ('2010', '6', '9', null);
INSERT INTO `dev_role_menu` VALUES ('2011', '6', '143', null);
INSERT INTO `dev_role_menu` VALUES ('2012', '6', '152', null);
INSERT INTO `dev_role_menu` VALUES ('2013', '6', '153', null);
INSERT INTO `dev_role_menu` VALUES ('2014', '6', '1182', null);
INSERT INTO `dev_role_menu` VALUES ('2015', '6', '1183', null);
INSERT INTO `dev_role_menu` VALUES ('2016', '6', '1184', null);
INSERT INTO `dev_role_menu` VALUES ('3477', '7', '0', null);
INSERT INTO `dev_role_menu` VALUES ('3478', '7', '10', null);
INSERT INTO `dev_role_menu` VALUES ('3479', '7', '18', null);
INSERT INTO `dev_role_menu` VALUES ('3480', '7', '19', null);
INSERT INTO `dev_role_menu` VALUES ('3481', '7', '144', null);
INSERT INTO `dev_role_menu` VALUES ('3482', '7', '145', null);
INSERT INTO `dev_role_menu` VALUES ('3483', '7', '146', null);
INSERT INTO `dev_role_menu` VALUES ('3484', '7', '148', null);
INSERT INTO `dev_role_menu` VALUES ('3485', '7', '149', null);
INSERT INTO `dev_role_menu` VALUES ('3486', '7', '150', null);
INSERT INTO `dev_role_menu` VALUES ('3487', '7', '151', null);
INSERT INTO `dev_role_menu` VALUES ('4507', '9', '1176', null);
INSERT INTO `dev_role_menu` VALUES ('4508', '9', '0', null);
INSERT INTO `dev_role_menu` VALUES ('4509', '9', '1204', null);
INSERT INTO `dev_role_menu` VALUES ('4510', '9', '1177', null);
INSERT INTO `dev_role_menu` VALUES ('4511', '9', '8', null);
INSERT INTO `dev_role_menu` VALUES ('4512', '9', '1206', null);
INSERT INTO `dev_role_menu` VALUES ('4513', '9', '1178', null);
INSERT INTO `dev_role_menu` VALUES ('4514', '9', '26', null);
INSERT INTO `dev_role_menu` VALUES ('4515', '9', '1207', null);
INSERT INTO `dev_role_menu` VALUES ('4516', '9', '1', null);
INSERT INTO `dev_role_menu` VALUES ('4517', '9', '1211', null);
INSERT INTO `dev_role_menu` VALUES ('4518', '9', '136', null);
INSERT INTO `dev_role_menu` VALUES ('4519', '9', '12', null);
INSERT INTO `dev_role_menu` VALUES ('4520', '9', '1215', null);
INSERT INTO `dev_role_menu` VALUES ('4521', '9', '138', null);
INSERT INTO `dev_role_menu` VALUES ('4522', '9', '1186', null);
INSERT INTO `dev_role_menu` VALUES ('4523', '9', '139', null);
INSERT INTO `dev_role_menu` VALUES ('4524', '9', '1214', null);
INSERT INTO `dev_role_menu` VALUES ('4525', '9', '16', null);
INSERT INTO `dev_role_menu` VALUES ('4526', '9', '1213', null);
INSERT INTO `dev_role_menu` VALUES ('4527', '9', '140', null);
INSERT INTO `dev_role_menu` VALUES ('4528', '9', '17', null);
INSERT INTO `dev_role_menu` VALUES ('4529', '9', '141', null);
INSERT INTO `dev_role_menu` VALUES ('4530', '9', '1212', null);
INSERT INTO `dev_role_menu` VALUES ('4531', '9', '126', null);
INSERT INTO `dev_role_menu` VALUES ('4532', '9', '142', null);
INSERT INTO `dev_role_menu` VALUES ('4533', '9', '11', null);
INSERT INTO `dev_role_menu` VALUES ('4534', '9', '1160', null);
INSERT INTO `dev_role_menu` VALUES ('4535', '9', '20', null);
INSERT INTO `dev_role_menu` VALUES ('4536', '9', '154', null);
INSERT INTO `dev_role_menu` VALUES ('4537', '9', '1161', null);
INSERT INTO `dev_role_menu` VALUES ('4538', '9', '156', null);
INSERT INTO `dev_role_menu` VALUES ('4539', '9', '21', null);
INSERT INTO `dev_role_menu` VALUES ('4540', '9', '1164', null);
INSERT INTO `dev_role_menu` VALUES ('4541', '9', '22', null);
INSERT INTO `dev_role_menu` VALUES ('4542', '9', '157', null);
INSERT INTO `dev_role_menu` VALUES ('4543', '9', '1171', null);
INSERT INTO `dev_role_menu` VALUES ('4544', '9', '23', null);
INSERT INTO `dev_role_menu` VALUES ('4545', '9', '9', null);
INSERT INTO `dev_role_menu` VALUES ('4546', '9', '1165', null);
INSERT INTO `dev_role_menu` VALUES ('4547', '9', '24', null);
INSERT INTO `dev_role_menu` VALUES ('4548', '9', '143', null);
INSERT INTO `dev_role_menu` VALUES ('4549', '9', '1172', null);
INSERT INTO `dev_role_menu` VALUES ('4550', '9', '152', null);
INSERT INTO `dev_role_menu` VALUES ('4551', '9', '25', null);
INSERT INTO `dev_role_menu` VALUES ('4552', '9', '1173', null);
INSERT INTO `dev_role_menu` VALUES ('4553', '9', '153', null);
INSERT INTO `dev_role_menu` VALUES ('4554', '9', '27', null);
INSERT INTO `dev_role_menu` VALUES ('4555', '9', '1174', null);
INSERT INTO `dev_role_menu` VALUES ('4556', '9', '1182', null);
INSERT INTO `dev_role_menu` VALUES ('4557', '9', '1162', null);
INSERT INTO `dev_role_menu` VALUES ('4558', '9', '1175', null);
INSERT INTO `dev_role_menu` VALUES ('4559', '9', '1163', null);
INSERT INTO `dev_role_menu` VALUES ('4560', '9', '1183', null);
INSERT INTO `dev_role_menu` VALUES ('4561', '9', '1180', null);
INSERT INTO `dev_role_menu` VALUES ('4562', '9', '1169', null);
INSERT INTO `dev_role_menu` VALUES ('4563', '9', '1184', null);
INSERT INTO `dev_role_menu` VALUES ('4564', '9', '1181', null);
INSERT INTO `dev_role_menu` VALUES ('4565', '9', '1205', null);
INSERT INTO `dev_role_menu` VALUES ('4566', '9', '1170', null);
INSERT INTO `dev_role_menu` VALUES ('4567', '9', '1187', null);
INSERT INTO `dev_role_menu` VALUES ('4568', '9', '159', null);
INSERT INTO `dev_role_menu` VALUES ('4569', '9', '10', null);
INSERT INTO `dev_role_menu` VALUES ('4570', '9', '1203', null);
INSERT INTO `dev_role_menu` VALUES ('4571', '9', '18', null);
INSERT INTO `dev_role_menu` VALUES ('4572', '9', '160', null);
INSERT INTO `dev_role_menu` VALUES ('4573', '9', '1188', null);
INSERT INTO `dev_role_menu` VALUES ('4574', '9', '161', null);
INSERT INTO `dev_role_menu` VALUES ('4575', '9', '19', null);
INSERT INTO `dev_role_menu` VALUES ('4576', '9', '1189', null);
INSERT INTO `dev_role_menu` VALUES ('4577', '9', '144', null);
INSERT INTO `dev_role_menu` VALUES ('4578', '9', '162', null);
INSERT INTO `dev_role_menu` VALUES ('4579', '9', '1190', null);
INSERT INTO `dev_role_menu` VALUES ('4580', '9', '145', null);
INSERT INTO `dev_role_menu` VALUES ('4581', '9', '163', null);
INSERT INTO `dev_role_menu` VALUES ('4582', '9', '1191', null);
INSERT INTO `dev_role_menu` VALUES ('4583', '9', '146', null);
INSERT INTO `dev_role_menu` VALUES ('4584', '9', '164', null);
INSERT INTO `dev_role_menu` VALUES ('4585', '9', '1192', null);
INSERT INTO `dev_role_menu` VALUES ('4586', '9', '147', null);
INSERT INTO `dev_role_menu` VALUES ('4587', '9', '165', null);
INSERT INTO `dev_role_menu` VALUES ('4588', '9', '1193', null);
INSERT INTO `dev_role_menu` VALUES ('4589', '9', '166', null);
INSERT INTO `dev_role_menu` VALUES ('4590', '9', '148', null);
INSERT INTO `dev_role_menu` VALUES ('4591', '9', '1194', null);
INSERT INTO `dev_role_menu` VALUES ('4592', '9', '167', null);
INSERT INTO `dev_role_menu` VALUES ('4593', '9', '149', null);
INSERT INTO `dev_role_menu` VALUES ('4594', '9', '150', null);
INSERT INTO `dev_role_menu` VALUES ('4595', '9', '1159', null);
INSERT INTO `dev_role_menu` VALUES ('4596', '9', '1195', null);
INSERT INTO `dev_role_menu` VALUES ('4597', '9', '151', null);
INSERT INTO `dev_role_menu` VALUES ('4598', '9', '1196', null);
INSERT INTO `dev_role_menu` VALUES ('4599', '9', '1179', null);
INSERT INTO `dev_role_menu` VALUES ('4600', '9', '1185', null);
INSERT INTO `dev_role_menu` VALUES ('4601', '9', '1197', null);
INSERT INTO `dev_role_menu` VALUES ('4602', '9', '1176', null);
INSERT INTO `dev_role_menu` VALUES ('4603', '9', '1202', null);
INSERT INTO `dev_role_menu` VALUES ('4604', '9', '1177', null);
INSERT INTO `dev_role_menu` VALUES ('4605', '9', '1198', null);
INSERT INTO `dev_role_menu` VALUES ('4606', '9', '1204', null);
INSERT INTO `dev_role_menu` VALUES ('4607', '9', '1178', null);
INSERT INTO `dev_role_menu` VALUES ('4608', '9', '1199', null);
INSERT INTO `dev_role_menu` VALUES ('4609', '9', '1206', null);
INSERT INTO `dev_role_menu` VALUES ('4610', '9', '1', null);
INSERT INTO `dev_role_menu` VALUES ('4611', '9', '1200', null);
INSERT INTO `dev_role_menu` VALUES ('4612', '9', '1207', null);
INSERT INTO `dev_role_menu` VALUES ('4613', '9', '1201', null);
INSERT INTO `dev_role_menu` VALUES ('4614', '9', '12', null);
INSERT INTO `dev_role_menu` VALUES ('4615', '9', '1211', null);
INSERT INTO `dev_role_menu` VALUES ('4616', '9', '1186', null);
INSERT INTO `dev_role_menu` VALUES ('4617', '9', '1209', null);
INSERT INTO `dev_role_menu` VALUES ('4618', '9', '1215', null);
INSERT INTO `dev_role_menu` VALUES ('4619', '9', '16', null);
INSERT INTO `dev_role_menu` VALUES ('4620', '9', '1210', null);
INSERT INTO `dev_role_menu` VALUES ('4621', '9', '1214', null);
INSERT INTO `dev_role_menu` VALUES ('4622', '9', '17', null);
INSERT INTO `dev_role_menu` VALUES ('4623', '9', '1216', null);
INSERT INTO `dev_role_menu` VALUES ('4624', '9', '1213', null);
INSERT INTO `dev_role_menu` VALUES ('4625', '9', '1217', null);
INSERT INTO `dev_role_menu` VALUES ('4626', '9', '126', null);
INSERT INTO `dev_role_menu` VALUES ('4627', '9', '1212', null);
INSERT INTO `dev_role_menu` VALUES ('4628', '9', '1218', null);
INSERT INTO `dev_role_menu` VALUES ('4629', '9', '1160', null);
INSERT INTO `dev_role_menu` VALUES ('4630', '9', '11', null);
INSERT INTO `dev_role_menu` VALUES ('4631', '9', '1161', null);
INSERT INTO `dev_role_menu` VALUES ('4632', '9', '20', null);
INSERT INTO `dev_role_menu` VALUES ('4633', '9', '1164', null);
INSERT INTO `dev_role_menu` VALUES ('4634', '9', '21', null);
INSERT INTO `dev_role_menu` VALUES ('4635', '9', '1171', null);
INSERT INTO `dev_role_menu` VALUES ('4636', '9', '22', null);
INSERT INTO `dev_role_menu` VALUES ('4637', '9', '1165', null);
INSERT INTO `dev_role_menu` VALUES ('4638', '9', '23', null);
INSERT INTO `dev_role_menu` VALUES ('4639', '9', '1172', null);
INSERT INTO `dev_role_menu` VALUES ('4640', '9', '24', null);
INSERT INTO `dev_role_menu` VALUES ('4641', '9', '1173', null);
INSERT INTO `dev_role_menu` VALUES ('4642', '9', '25', null);
INSERT INTO `dev_role_menu` VALUES ('4643', '9', '1174', null);
INSERT INTO `dev_role_menu` VALUES ('4644', '9', '27', null);
INSERT INTO `dev_role_menu` VALUES ('4645', '9', '1175', null);
INSERT INTO `dev_role_menu` VALUES ('4646', '9', '1162', null);
INSERT INTO `dev_role_menu` VALUES ('4647', '9', '1180', null);
INSERT INTO `dev_role_menu` VALUES ('4648', '9', '1163', null);
INSERT INTO `dev_role_menu` VALUES ('4649', '9', '1181', null);
INSERT INTO `dev_role_menu` VALUES ('4650', '9', '1169', null);
INSERT INTO `dev_role_menu` VALUES ('4651', '9', '1187', null);
INSERT INTO `dev_role_menu` VALUES ('4652', '9', '1170', null);
INSERT INTO `dev_role_menu` VALUES ('4653', '9', '159', null);
INSERT INTO `dev_role_menu` VALUES ('4654', '9', '1203', null);
INSERT INTO `dev_role_menu` VALUES ('4655', '9', '160', null);
INSERT INTO `dev_role_menu` VALUES ('4656', '9', '1188', null);
INSERT INTO `dev_role_menu` VALUES ('4657', '9', '161', null);
INSERT INTO `dev_role_menu` VALUES ('4658', '9', '1189', null);
INSERT INTO `dev_role_menu` VALUES ('4659', '9', '162', null);
INSERT INTO `dev_role_menu` VALUES ('4660', '9', '1190', null);
INSERT INTO `dev_role_menu` VALUES ('4661', '9', '163', null);
INSERT INTO `dev_role_menu` VALUES ('4662', '9', '1191', null);
INSERT INTO `dev_role_menu` VALUES ('4663', '9', '164', null);
INSERT INTO `dev_role_menu` VALUES ('4664', '9', '1192', null);
INSERT INTO `dev_role_menu` VALUES ('4665', '9', '165', null);
INSERT INTO `dev_role_menu` VALUES ('4666', '9', '1193', null);
INSERT INTO `dev_role_menu` VALUES ('4667', '9', '166', null);
INSERT INTO `dev_role_menu` VALUES ('4668', '9', '1194', null);
INSERT INTO `dev_role_menu` VALUES ('4669', '9', '167', null);
INSERT INTO `dev_role_menu` VALUES ('4670', '9', '1195', null);
INSERT INTO `dev_role_menu` VALUES ('4671', '9', '1159', null);
INSERT INTO `dev_role_menu` VALUES ('4672', '9', '1196', null);
INSERT INTO `dev_role_menu` VALUES ('4673', '9', '1179', null);
INSERT INTO `dev_role_menu` VALUES ('4674', '9', '1197', null);
INSERT INTO `dev_role_menu` VALUES ('4675', '9', '1176', null);
INSERT INTO `dev_role_menu` VALUES ('4676', '9', '1198', null);
INSERT INTO `dev_role_menu` VALUES ('4677', '9', '1177', null);
INSERT INTO `dev_role_menu` VALUES ('4678', '9', '1199', null);
INSERT INTO `dev_role_menu` VALUES ('4679', '9', '1178', null);
INSERT INTO `dev_role_menu` VALUES ('4680', '9', '1200', null);
INSERT INTO `dev_role_menu` VALUES ('4681', '9', '1', null);
INSERT INTO `dev_role_menu` VALUES ('4682', '9', '1201', null);
INSERT INTO `dev_role_menu` VALUES ('4683', '9', '12', null);
INSERT INTO `dev_role_menu` VALUES ('4684', '9', '1209', null);
INSERT INTO `dev_role_menu` VALUES ('4685', '9', '1186', null);
INSERT INTO `dev_role_menu` VALUES ('4686', '9', '1210', null);
INSERT INTO `dev_role_menu` VALUES ('4687', '9', '16', null);
INSERT INTO `dev_role_menu` VALUES ('4688', '9', '1216', null);
INSERT INTO `dev_role_menu` VALUES ('4689', '9', '17', null);
INSERT INTO `dev_role_menu` VALUES ('4690', '9', '1217', null);
INSERT INTO `dev_role_menu` VALUES ('4691', '9', '126', null);
INSERT INTO `dev_role_menu` VALUES ('4692', '9', '1218', null);
INSERT INTO `dev_role_menu` VALUES ('4693', '9', '1160', null);
INSERT INTO `dev_role_menu` VALUES ('4694', '9', '1161', null);
INSERT INTO `dev_role_menu` VALUES ('4695', '9', '1164', null);
INSERT INTO `dev_role_menu` VALUES ('4696', '9', '1171', null);
INSERT INTO `dev_role_menu` VALUES ('4697', '9', '1165', null);
INSERT INTO `dev_role_menu` VALUES ('4698', '9', '1172', null);
INSERT INTO `dev_role_menu` VALUES ('4699', '9', '1173', null);
INSERT INTO `dev_role_menu` VALUES ('4700', '9', '1174', null);
INSERT INTO `dev_role_menu` VALUES ('4701', '9', '1175', null);
INSERT INTO `dev_role_menu` VALUES ('4702', '9', '1180', null);
INSERT INTO `dev_role_menu` VALUES ('4703', '9', '1181', null);
INSERT INTO `dev_role_menu` VALUES ('4704', '9', '1187', null);
INSERT INTO `dev_role_menu` VALUES ('4705', '9', '1203', null);
INSERT INTO `dev_role_menu` VALUES ('4706', '9', '1188', null);
INSERT INTO `dev_role_menu` VALUES ('4707', '9', '1189', null);
INSERT INTO `dev_role_menu` VALUES ('4708', '9', '1190', null);
INSERT INTO `dev_role_menu` VALUES ('4709', '9', '1191', null);
INSERT INTO `dev_role_menu` VALUES ('4710', '9', '1192', null);
INSERT INTO `dev_role_menu` VALUES ('4711', '9', '1193', null);
INSERT INTO `dev_role_menu` VALUES ('4712', '9', '1194', null);
INSERT INTO `dev_role_menu` VALUES ('4713', '9', '1195', null);
INSERT INTO `dev_role_menu` VALUES ('4714', '9', '1196', null);
INSERT INTO `dev_role_menu` VALUES ('4715', '9', '1197', null);
INSERT INTO `dev_role_menu` VALUES ('4716', '9', '1198', null);
INSERT INTO `dev_role_menu` VALUES ('4717', '9', '1199', null);
INSERT INTO `dev_role_menu` VALUES ('4718', '9', '1200', null);
INSERT INTO `dev_role_menu` VALUES ('4719', '9', '1201', null);
INSERT INTO `dev_role_menu` VALUES ('4720', '9', '1209', null);
INSERT INTO `dev_role_menu` VALUES ('4721', '9', '1210', null);
INSERT INTO `dev_role_menu` VALUES ('4722', '9', '1216', null);
INSERT INTO `dev_role_menu` VALUES ('4723', '9', '1217', null);
INSERT INTO `dev_role_menu` VALUES ('4724', '9', '1218', null);
INSERT INTO `dev_role_menu` VALUES ('4761', '5', '0', null);
INSERT INTO `dev_role_menu` VALUES ('4762', '5', '1', null);
INSERT INTO `dev_role_menu` VALUES ('4763', '5', '12', null);
INSERT INTO `dev_role_menu` VALUES ('4764', '5', '1186', null);
INSERT INTO `dev_role_menu` VALUES ('4765', '5', '16', null);
INSERT INTO `dev_role_menu` VALUES ('4766', '5', '17', null);
INSERT INTO `dev_role_menu` VALUES ('4767', '5', '8', null);
INSERT INTO `dev_role_menu` VALUES ('4768', '5', '26', null);
INSERT INTO `dev_role_menu` VALUES ('4769', '5', '136', null);
INSERT INTO `dev_role_menu` VALUES ('4770', '5', '138', null);
INSERT INTO `dev_role_menu` VALUES ('4771', '5', '139', null);
INSERT INTO `dev_role_menu` VALUES ('4772', '5', '140', null);
INSERT INTO `dev_role_menu` VALUES ('4773', '5', '141', null);
INSERT INTO `dev_role_menu` VALUES ('4774', '5', '142', null);
INSERT INTO `dev_role_menu` VALUES ('4775', '5', '154', null);
INSERT INTO `dev_role_menu` VALUES ('4776', '5', '156', null);
INSERT INTO `dev_role_menu` VALUES ('4777', '5', '157', null);
INSERT INTO `dev_role_menu` VALUES ('5707', '16', '0', null);
INSERT INTO `dev_role_menu` VALUES ('5708', '16', '1172', null);
INSERT INTO `dev_role_menu` VALUES ('5709', '16', '1173', null);
INSERT INTO `dev_role_menu` VALUES ('5710', '16', '1174', null);
INSERT INTO `dev_role_menu` VALUES ('5711', '16', '1175', null);
INSERT INTO `dev_role_menu` VALUES ('5712', '16', '1180', null);
INSERT INTO `dev_role_menu` VALUES ('5713', '16', '1181', null);
INSERT INTO `dev_role_menu` VALUES ('5714', '16', '1219', null);
INSERT INTO `dev_role_menu` VALUES ('5715', '16', '1233', null);
INSERT INTO `dev_role_menu` VALUES ('5716', '16', '1236', null);
INSERT INTO `dev_role_menu` VALUES ('5717', '17', '0', null);
INSERT INTO `dev_role_menu` VALUES ('5718', '17', '10', null);
INSERT INTO `dev_role_menu` VALUES ('5719', '17', '1220', null);
INSERT INTO `dev_role_menu` VALUES ('5720', '17', '1230', null);
INSERT INTO `dev_role_menu` VALUES ('5721', '17', '1222', null);
INSERT INTO `dev_role_menu` VALUES ('5722', '17', '1223', null);
INSERT INTO `dev_role_menu` VALUES ('5723', '17', '1224', null);
INSERT INTO `dev_role_menu` VALUES ('5724', '17', '1225', null);
INSERT INTO `dev_role_menu` VALUES ('5725', '17', '1226', null);
INSERT INTO `dev_role_menu` VALUES ('5726', '17', '1231', null);
INSERT INTO `dev_role_menu` VALUES ('5727', '17', '1228', null);
INSERT INTO `dev_role_menu` VALUES ('5728', '17', '1229', null);
INSERT INTO `dev_role_menu` VALUES ('5729', '18', '0', null);
INSERT INTO `dev_role_menu` VALUES ('5730', '18', '1187', null);
INSERT INTO `dev_role_menu` VALUES ('5731', '18', '1203', null);
INSERT INTO `dev_role_menu` VALUES ('5732', '18', '1188', null);
INSERT INTO `dev_role_menu` VALUES ('5733', '18', '1189', null);
INSERT INTO `dev_role_menu` VALUES ('5734', '18', '1190', null);
INSERT INTO `dev_role_menu` VALUES ('5735', '18', '1191', null);
INSERT INTO `dev_role_menu` VALUES ('5736', '18', '1192', null);
INSERT INTO `dev_role_menu` VALUES ('5737', '18', '1193', null);
INSERT INTO `dev_role_menu` VALUES ('5738', '18', '1194', null);
INSERT INTO `dev_role_menu` VALUES ('5739', '18', '1195', null);
INSERT INTO `dev_role_menu` VALUES ('5740', '18', '1196', null);
INSERT INTO `dev_role_menu` VALUES ('5741', '18', '1197', null);
INSERT INTO `dev_role_menu` VALUES ('5742', '18', '1198', null);
INSERT INTO `dev_role_menu` VALUES ('5743', '18', '1199', null);
INSERT INTO `dev_role_menu` VALUES ('5744', '18', '1201', null);
INSERT INTO `dev_role_menu` VALUES ('5745', '18', '1209', null);
INSERT INTO `dev_role_menu` VALUES ('5746', '18', '1210', null);
INSERT INTO `dev_role_menu` VALUES ('5747', '18', '1217', null);
INSERT INTO `dev_role_menu` VALUES ('5748', '18', '1218', null);
INSERT INTO `dev_role_menu` VALUES ('5749', '19', '0', null);
INSERT INTO `dev_role_menu` VALUES ('5750', '19', '1', null);
INSERT INTO `dev_role_menu` VALUES ('5751', '19', '12', null);
INSERT INTO `dev_role_menu` VALUES ('5752', '19', '1186', null);
INSERT INTO `dev_role_menu` VALUES ('5753', '19', '16', null);
INSERT INTO `dev_role_menu` VALUES ('5754', '19', '17', null);
INSERT INTO `dev_role_menu` VALUES ('5755', '15', '0', null);
INSERT INTO `dev_role_menu` VALUES ('5756', '15', '1172', null);
INSERT INTO `dev_role_menu` VALUES ('5757', '15', '1173', null);
INSERT INTO `dev_role_menu` VALUES ('5758', '15', '1174', null);
INSERT INTO `dev_role_menu` VALUES ('5759', '15', '1175', null);
INSERT INTO `dev_role_menu` VALUES ('5760', '15', '1180', null);
INSERT INTO `dev_role_menu` VALUES ('5761', '15', '1181', null);
INSERT INTO `dev_role_menu` VALUES ('5762', '15', '1219', null);
INSERT INTO `dev_role_menu` VALUES ('5763', '15', '1233', null);
INSERT INTO `dev_role_menu` VALUES ('5764', '15', '1', null);
INSERT INTO `dev_role_menu` VALUES ('5765', '15', '12', null);
INSERT INTO `dev_role_menu` VALUES ('5766', '15', '16', null);
INSERT INTO `dev_role_menu` VALUES ('5767', '15', '17', null);
INSERT INTO `dev_role_menu` VALUES ('5768', '15', '126', null);
INSERT INTO `dev_role_menu` VALUES ('5769', '15', '1160', null);
INSERT INTO `dev_role_menu` VALUES ('5770', '15', '1161', null);
INSERT INTO `dev_role_menu` VALUES ('5965', '3', '0', null);
INSERT INTO `dev_role_menu` VALUES ('5966', '3', '1', null);
INSERT INTO `dev_role_menu` VALUES ('5967', '3', '16', null);
INSERT INTO `dev_role_menu` VALUES ('5968', '3', '17', null);
INSERT INTO `dev_role_menu` VALUES ('5969', '3', '126', null);
INSERT INTO `dev_role_menu` VALUES ('5970', '3', '1237', null);
INSERT INTO `dev_role_menu` VALUES ('5971', '3', '1240', null);
INSERT INTO `dev_role_menu` VALUES ('5972', '3', '1241', null);
INSERT INTO `dev_role_menu` VALUES ('5973', '2', '0', null);
INSERT INTO `dev_role_menu` VALUES ('5974', '2', '1', null);
INSERT INTO `dev_role_menu` VALUES ('5975', '2', '16', null);
INSERT INTO `dev_role_menu` VALUES ('5976', '2', '17', null);
INSERT INTO `dev_role_menu` VALUES ('5977', '2', '1243', null);
INSERT INTO `dev_role_menu` VALUES ('5978', '2', '1244', null);
INSERT INTO `dev_role_menu` VALUES ('5979', '2', '1246', null);
INSERT INTO `dev_role_menu` VALUES ('5980', '2', '1247', null);
INSERT INTO `dev_role_menu` VALUES ('5981', '2', '1245', null);
INSERT INTO `dev_role_menu` VALUES ('5982', '2', '126', null);
INSERT INTO `dev_role_menu` VALUES ('5983', '2', '1237', null);
INSERT INTO `dev_role_menu` VALUES ('5984', '2', '1240', null);
INSERT INTO `dev_role_menu` VALUES ('5985', '2', '1241', null);
INSERT INTO `dev_role_menu` VALUES ('5986', '2', '1248', null);
INSERT INTO `dev_role_menu` VALUES ('5987', '2', '1249', null);
INSERT INTO `dev_role_menu` VALUES ('5988', '2', '1250', null);
INSERT INTO `dev_role_menu` VALUES ('5989', '2', '11', null);
INSERT INTO `dev_role_menu` VALUES ('5990', '2', '20', null);
INSERT INTO `dev_role_menu` VALUES ('5991', '2', '22', null);
INSERT INTO `dev_role_menu` VALUES ('5992', '2', '1239', null);
INSERT INTO `dev_role_menu` VALUES ('5993', '2', '23', null);
INSERT INTO `dev_role_menu` VALUES ('5994', '2', '24', null);
INSERT INTO `dev_role_menu` VALUES ('5995', '2', '27', null);

-- ----------------------------
-- Table structure for dev_seq
-- ----------------------------
DROP TABLE IF EXISTS `dev_seq`;
CREATE TABLE `dev_seq` (
  `seqname` varchar(64) NOT NULL COMMENT '表名',
  `currentValue` int(12) DEFAULT NULL COMMENT '始数起',
  `increment` int(12) DEFAULT NULL COMMENT '增递变量',
  PRIMARY KEY (`seqname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流水号表（不使用MySQL自带的递增属性）';

-- ----------------------------
-- Records of dev_seq
-- ----------------------------
INSERT INTO `dev_seq` VALUES ('apps', '8', '1');
INSERT INTO `dev_seq` VALUES ('app_cost', '2', '1');
INSERT INTO `dev_seq` VALUES ('app_run', '8', '1');
INSERT INTO `dev_seq` VALUES ('area', '3209', '1');
INSERT INTO `dev_seq` VALUES ('car_info', '15', '1');
INSERT INTO `dev_seq` VALUES ('company_info', '316', '1');
INSERT INTO `dev_seq` VALUES ('cook', '2', '1');
INSERT INTO `dev_seq` VALUES ('customer', '5', '1');
INSERT INTO `dev_seq` VALUES ('food_type', '6', '1');
INSERT INTO `dev_seq` VALUES ('house_info', '28', '1');
INSERT INTO `dev_seq` VALUES ('house_type', '2', '1');
INSERT INTO `dev_seq` VALUES ('lou_ceng', '2', '1');
INSERT INTO `dev_seq` VALUES ('lou_dong', '2', '1');
INSERT INTO `dev_seq` VALUES ('material', '1', '1');
INSERT INTO `dev_seq` VALUES ('menu', '1250', '1');
INSERT INTO `dev_seq` VALUES ('menu_cook', '3', '1');
INSERT INTO `dev_seq` VALUES ('menu_material', '3', '1');
INSERT INTO `dev_seq` VALUES ('menu_nutrition', '3', '1');
INSERT INTO `dev_seq` VALUES ('news', '14', '1');
INSERT INTO `dev_seq` VALUES ('nutrition', '2', '1');
INSERT INTO `dev_seq` VALUES ('org', '262', '1');
INSERT INTO `dev_seq` VALUES ('role', '20', '1');
INSERT INTO `dev_seq` VALUES ('role_menu', '5995', '1');
INSERT INTO `dev_seq` VALUES ('room', '2', '1');
INSERT INTO `dev_seq` VALUES ('t_bas_menu', '6', '1');
INSERT INTO `dev_seq` VALUES ('t_bas_platinfo', '5', '1');
INSERT INTO `dev_seq` VALUES ('user', '148', '1');
INSERT INTO `dev_seq` VALUES ('user_house', '54', '1');
INSERT INTO `dev_seq` VALUES ('user_orgs', '1185', '1');
INSERT INTO `dev_seq` VALUES ('user_role', '327', '1');
INSERT INTO `dev_seq` VALUES ('weight_unit', '3', '1');

-- ----------------------------
-- Table structure for dev_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `dev_system_menu`;
CREATE TABLE `dev_system_menu` (
  `MI_ID` decimal(8,0) NOT NULL COMMENT '菜单ID',
  `FI_ID` decimal(8,0) DEFAULT NULL COMMENT '功能ID',
  `MI_NAME` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `MI_URL` varchar(200) DEFAULT NULL COMMENT '菜单链接',
  `MI_PIC` varchar(64) DEFAULT NULL COMMENT '菜单工作图片',
  `MI_MEMO` varchar(128) DEFAULT NULL COMMENT '菜单备注',
  `MI_INDEX` decimal(8,0) DEFAULT NULL COMMENT '菜单排序',
  `MI_LEVEL` decimal(8,0) DEFAULT NULL COMMENT '菜单等级',
  PRIMARY KEY (`MI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of dev_system_menu
-- ----------------------------
INSERT INTO `dev_system_menu` VALUES ('0', '-1', '全部菜单', ' ', ' ', ' ', '0', '0');
INSERT INTO `dev_system_menu` VALUES ('1', '0', '我的账户', 'user/toUser.htm', 'common/images/userNormal.png', '', '1', '1');
INSERT INTO `dev_system_menu` VALUES ('11', '0', '系统设置', '', 'common/images/xt.png', '', '5', '1');
INSERT INTO `dev_system_menu` VALUES ('16', '1', '个人信息编辑', 'acountManage/userDetail', 'common/images/gerxxbj.png', '', '10', '2');
INSERT INTO `dev_system_menu` VALUES ('17', '1', '登录密码修改', 'acountManage/passwordEidt', 'common/images/denglmmxg.png', '', '11', '2');
INSERT INTO `dev_system_menu` VALUES ('20', '11', '区域信息维护', 'area/main.htm', 'common/images/quyxxwh.png', '', '14', '2');
INSERT INTO `dev_system_menu` VALUES ('22', '11', '系统用户管理', 'user/main.htm', 'common/images/xityggl.png', '', '16', '2');
INSERT INTO `dev_system_menu` VALUES ('23', '11', '系统角色管理', 'role/main.htm', 'common/images/xitjsgl.png', '', '17', '2');
INSERT INTO `dev_system_menu` VALUES ('24', '11', '角色功能分配', 'rolemenu/main.htm', 'common/images/xitjsqxfp.png', '', '18', '2');
INSERT INTO `dev_system_menu` VALUES ('27', '11', '系统菜单', 'menu/main.htm', 'common/images/xitcd.png', '', '27', '2');
INSERT INTO `dev_system_menu` VALUES ('126', '0', '餐饮管理', 'test', 'common/images/shsz.png', '', '4', '1');
INSERT INTO `dev_system_menu` VALUES ('1173', '1172', '商品管理', 'scItem/main.htm', 'common/images/shangp.png', '', '1', '2');
INSERT INTO `dev_system_menu` VALUES ('1174', '1172', '商品类别', 'scItemClass/main.htm', 'common/images/leib.png', '', '2', '2');
INSERT INTO `dev_system_menu` VALUES ('1175', '1172', '商品单位', 'scItemUnit/main.htm', 'common/images/danw.png', '', '4', '2');
INSERT INTO `dev_system_menu` VALUES ('1180', '1172', '会员管理', 'scMember/main.htm', 'common/images/keh.png', '', '4', '2');
INSERT INTO `dev_system_menu` VALUES ('1181', '1172', '供应商管理', 'scSupplier/main.htm', 'common/images/gongys.png', '', '5', '2');
INSERT INTO `dev_system_menu` VALUES ('1219', '1172', '会员类型', 'scMemberType/main.htm', 'common/images/mobsz.png', '', '6', '2');
INSERT INTO `dev_system_menu` VALUES ('1220', '10', '收银流水', 'ReportSupermarket/ssyls.htm', '', '', '220', '2');
INSERT INTO `dev_system_menu` VALUES ('1222', '10', '收入库明细', 'ReportSupermarket/ssrkmx.htm', '', '', '222', '2');
INSERT INTO `dev_system_menu` VALUES ('1223', '10', '储值明细', 'ReportSupermarket/sczmx.htm', '', '', '223', '2');
INSERT INTO `dev_system_menu` VALUES ('1224', '10', '利润汇总', 'ReportSupermarket/slrhz.htm', '', '', '224', '2');
INSERT INTO `dev_system_menu` VALUES ('1225', '10', '退货汇总', 'ReportSupermarket/slrhz.htm', '', '', '225', '2');
INSERT INTO `dev_system_menu` VALUES ('1226', '10', '销售流水', 'ReportSupermarket/sxsls.htm', '', '', '226', '2');
INSERT INTO `dev_system_menu` VALUES ('1228', '10', '交班明细', 'ReportSupermarket/sjbmx.htm', '', '', '228', '2');
INSERT INTO `dev_system_menu` VALUES ('1229', '10', '税务明细', 'ReportSupermarket/sswmx.htm', '', '', '229', '2');
INSERT INTO `dev_system_menu` VALUES ('1230', '10', '收银汇总', 'ReportSupermarket/ssyhz.htm', '', '', '221', '2');
INSERT INTO `dev_system_menu` VALUES ('1231', '10', '销售汇总', 'ReportSupermarket/sxshz.htm', '', '', '227', '2');
INSERT INTO `dev_system_menu` VALUES ('1233', '1172', '客户管理', 'scCustomer/main.htm', 'common/images/huiylx.png	', '', '8', '2');
INSERT INTO `dev_system_menu` VALUES ('1237', '126', '菜品类型', 'foodType/main.htm', 'common/images/shanghxxgl.png', '1', '1', '2');
INSERT INTO `dev_system_menu` VALUES ('1239', '11', '项目审核管理', 'publish/main.htm', 'common/images/vipfwgnfp.png', '', '16', '2');
INSERT INTO `dev_system_menu` VALUES ('1240', '126', '菜品单位', 'weightUnit/main.htm', 'common/images/xitjsgl.png', '', '2', '2');
INSERT INTO `dev_system_menu` VALUES ('1241', '126', '菜品信息', 'tbasMenu/main.htm', 'common/images/xitcd.png', '', '3', '2');
INSERT INTO `dev_system_menu` VALUES ('1243', '0', '食堂管理', '', 'common/images/shanghvipfwsq.png', '', '2', '1');
INSERT INTO `dev_system_menu` VALUES ('1244', '1243', '食堂信息', 'org/main.htm', 'common/images/xityggl.png', '', '1', '2');
INSERT INTO `dev_system_menu` VALUES ('1245', '1243', '餐台信息', 'tbasPlatinfo/main.htm', 'common/images/shanghvipfwsq.png', '', '4', '2');
INSERT INTO `dev_system_menu` VALUES ('1246', '1243', '摊位信息', 'agOrg/main.htm', 'common/images/xitcd.png', '', '2', '2');
INSERT INTO `dev_system_menu` VALUES ('1247', '1243', '商户信息', 'businessUser/center.htm', 'common/images/shanghxxgl.png', '', '3', '2');
INSERT INTO `dev_system_menu` VALUES ('1248', '126', '原料管理', 'material/main.htm', 'common/images/shanghxxgl.png', '', '4', '2');
INSERT INTO `dev_system_menu` VALUES ('1249', '126', '营养项目', 'nutrition/main.htm', 'common/images/shanghxxgl.png', '', '5', '2');
INSERT INTO `dev_system_menu` VALUES ('1250', '126', '厨师信息', 'cook/main.htm', 'common/images/shanghvipfwsq.png', '', '6', '2');

-- ----------------------------
-- Table structure for dev_user_info
-- ----------------------------
DROP TABLE IF EXISTS `dev_user_info`;
CREATE TABLE `dev_user_info` (
  `UI_ID` decimal(12,0) NOT NULL COMMENT '用户ID',
  `UI_TYPE` decimal(12,0) DEFAULT NULL COMMENT '用户类型',
  `UI_LOGIN_NAME` varchar(64) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `UI_PASSWORD` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `UI_NAME` varchar(64) DEFAULT NULL COMMENT '联系人',
  `UI_NUM` varchar(32) DEFAULT NULL,
  `UI_NICK_NAME` varchar(64) DEFAULT NULL COMMENT '昵称',
  `UI_SEX` decimal(12,0) DEFAULT NULL COMMENT '性别',
  `UI_IMG` varchar(60) DEFAULT NULL COMMENT '用户头像',
  `UI_PR_ID` decimal(12,0) DEFAULT NULL COMMENT '省份ID',
  `UI_CY_ID` decimal(12,0) DEFAULT NULL COMMENT '城市ID',
  `UI_AR_ID` decimal(12,0) DEFAULT NULL COMMENT '区域ID',
  `UI_PROVINCE` varchar(64) DEFAULT NULL COMMENT '省份',
  `UI_CITY` varchar(64) DEFAULT NULL COMMENT '城市',
  `UI_AREA` varchar(64) DEFAULT NULL COMMENT '区域',
  `UI_MOBILE` varchar(64) DEFAULT NULL COMMENT '绑定手机号码',
  `UI_EMAIL` varchar(64) DEFAULT NULL COMMENT '绑定电子邮箱',
  `UI_COMPANY` varchar(64) DEFAULT NULL COMMENT '公司名称',
  `UI_ADDRESS` varchar(64) DEFAULT NULL COMMENT '公司地址',
  `UI_TELPHONE` varchar(64) DEFAULT NULL COMMENT '公司电话',
  `UI_VIP_LEVEL_ID` decimal(12,0) DEFAULT NULL COMMENT '用户VIP等级ID',
  `UI_VIP_LEVEL_NAME` varchar(64) DEFAULT NULL COMMENT '用户VIP等级名称',
  `UI_VIP_LEVEL_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '用户VIP等级到期时间',
  `UI_CT_LIMIT` decimal(12,0) DEFAULT NULL COMMENT '用户餐厅上限',
  `UI_TOTAL_SMS_COUNT` decimal(12,0) DEFAULT NULL COMMENT '短信总条数',
  `UI_BALANCE` decimal(12,2) DEFAULT NULL COMMENT '账号余额',
  `UI_FIND_PASSWORD_CODE` varchar(64) DEFAULT NULL COMMENT '找回密码验证码',
  `UI_FIND_PASSWORD_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '找回密码验证码生成时间',
  `UI_SH` decimal(1,0) DEFAULT NULL COMMENT '核审状态：0=未审核，1=审核',
  `UI_REG_TIME` timestamp NULL DEFAULT NULL COMMENT '册注时间',
  `UI_ORG_CODE` varchar(128) DEFAULT NULL COMMENT '机构CODE',
  PRIMARY KEY (`UI_ID`,`UI_LOGIN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of dev_user_info
-- ----------------------------
INSERT INTO `dev_user_info` VALUES ('26', '1', 'admin', 'MTIzNDU2', 'admin', null, 'Li D', '1', 'upload/images/1468474325683.jpg', null, null, null, '31', '3101', '310102', '18994036828', 'qwe1144084387@qq.com', '德国汉诺22', '意大利', '1249972', null, null, '2017-12-17 12:22:50', null, null, null, null, '2015-02-28 13:22:06', '1', '2015-02-09 15:57:57', '0000');
INSERT INTO `dev_user_info` VALUES ('147', '2', 't1', 'MTIzNDU2', 'test', null, null, '0', null, null, null, null, null, null, null, '13376011121', '1213123123@qq.com', '1', '1', '1', null, null, '2017-12-20 16:33:13', null, null, null, null, '2017-09-19 15:52:47', '1', '2017-09-19 15:52:47', '000000030001');
INSERT INTO `dev_user_info` VALUES ('148', '2', 't2', 'MTIzNDU2', '测试2', null, null, '1', null, null, null, null, null, null, null, '', '', null, null, null, null, null, '2017-12-20 16:35:19', null, null, null, null, '2017-12-20 16:28:19', '1', '2017-12-20 16:28:19', '000000020001');

-- ----------------------------
-- Table structure for dev_user_orgs
-- ----------------------------
DROP TABLE IF EXISTS `dev_user_orgs`;
CREATE TABLE `dev_user_orgs` (
  `SN` decimal(16,0) NOT NULL COMMENT '水流号',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `ORG_CODE` varchar(64) DEFAULT NULL COMMENT '机构编码',
  PRIMARY KEY (`SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户机构表';

-- ----------------------------
-- Records of dev_user_orgs
-- ----------------------------
INSERT INTO `dev_user_orgs` VALUES ('82', '72', '0000');
INSERT INTO `dev_user_orgs` VALUES ('83', '72', '00000010');
INSERT INTO `dev_user_orgs` VALUES ('84', '72', '00000011');
INSERT INTO `dev_user_orgs` VALUES ('85', '72', '000000110001');
INSERT INTO `dev_user_orgs` VALUES ('86', '72', '000000110002');
INSERT INTO `dev_user_orgs` VALUES ('87', '72', '000000110003');
INSERT INTO `dev_user_orgs` VALUES ('88', '72', '000000110004');
INSERT INTO `dev_user_orgs` VALUES ('89', '72', '000000110005');
INSERT INTO `dev_user_orgs` VALUES ('389', '93', '0000');
INSERT INTO `dev_user_orgs` VALUES ('390', '93', '00000011');
INSERT INTO `dev_user_orgs` VALUES ('391', '93', '000000110001');
INSERT INTO `dev_user_orgs` VALUES ('392', '93', '000000110002');
INSERT INTO `dev_user_orgs` VALUES ('393', '93', '000000110003');
INSERT INTO `dev_user_orgs` VALUES ('394', '93', '000000110004');
INSERT INTO `dev_user_orgs` VALUES ('395', '93', '000000110005');
INSERT INTO `dev_user_orgs` VALUES ('396', '93', '000000110006');
INSERT INTO `dev_user_orgs` VALUES ('664', '95', '000000130001');
INSERT INTO `dev_user_orgs` VALUES ('665', '95', '0000001300010001');
INSERT INTO `dev_user_orgs` VALUES ('666', '95', '0000001300010002');
INSERT INTO `dev_user_orgs` VALUES ('668', '97', '0000001300010002');
INSERT INTO `dev_user_orgs` VALUES ('677', '96', '000000130001');
INSERT INTO `dev_user_orgs` VALUES ('678', '96', '0000001300010001');
INSERT INTO `dev_user_orgs` VALUES ('679', '96', '0000001300010002');
INSERT INTO `dev_user_orgs` VALUES ('680', '87', '0000');
INSERT INTO `dev_user_orgs` VALUES ('681', '87', '00000011');
INSERT INTO `dev_user_orgs` VALUES ('682', '87', '000000110001');
INSERT INTO `dev_user_orgs` VALUES ('683', '87', '000000110002');
INSERT INTO `dev_user_orgs` VALUES ('684', '87', '000000110003');
INSERT INTO `dev_user_orgs` VALUES ('685', '87', '000000110004');
INSERT INTO `dev_user_orgs` VALUES ('686', '87', '000000110005');
INSERT INTO `dev_user_orgs` VALUES ('687', '87', '000000110006');
INSERT INTO `dev_user_orgs` VALUES ('879', '85', '0000');
INSERT INTO `dev_user_orgs` VALUES ('880', '85', '00000011');
INSERT INTO `dev_user_orgs` VALUES ('881', '85', '000000110001');
INSERT INTO `dev_user_orgs` VALUES ('882', '85', '000000110002');
INSERT INTO `dev_user_orgs` VALUES ('883', '85', '000000110003');
INSERT INTO `dev_user_orgs` VALUES ('884', '85', '000000110004');
INSERT INTO `dev_user_orgs` VALUES ('885', '85', '000000110005');
INSERT INTO `dev_user_orgs` VALUES ('886', '85', '000000110006');
INSERT INTO `dev_user_orgs` VALUES ('887', '94', '0000');
INSERT INTO `dev_user_orgs` VALUES ('888', '94', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('889', '94', '000000130001');
INSERT INTO `dev_user_orgs` VALUES ('890', '94', '0000001300010001');
INSERT INTO `dev_user_orgs` VALUES ('891', '94', '0000001300010002');
INSERT INTO `dev_user_orgs` VALUES ('945', '26', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('946', '26', '0000');
INSERT INTO `dev_user_orgs` VALUES ('947', '26', '000000130001');
INSERT INTO `dev_user_orgs` VALUES ('948', '26', '00000001');
INSERT INTO `dev_user_orgs` VALUES ('949', '26', '0000001300010001');
INSERT INTO `dev_user_orgs` VALUES ('950', '26', '000000010001');
INSERT INTO `dev_user_orgs` VALUES ('951', '26', '0000001300010002');
INSERT INTO `dev_user_orgs` VALUES ('952', '26', '0000000100010001');
INSERT INTO `dev_user_orgs` VALUES ('953', '26', '000000130002');
INSERT INTO `dev_user_orgs` VALUES ('954', '26', '0000000100010002');
INSERT INTO `dev_user_orgs` VALUES ('955', '26', '000000010002');
INSERT INTO `dev_user_orgs` VALUES ('956', '26', '000000010003');
INSERT INTO `dev_user_orgs` VALUES ('957', '26', '000000010004');
INSERT INTO `dev_user_orgs` VALUES ('958', '26', '000000010005');
INSERT INTO `dev_user_orgs` VALUES ('959', '26', '00000003');
INSERT INTO `dev_user_orgs` VALUES ('960', '26', '000000030002');
INSERT INTO `dev_user_orgs` VALUES ('961', '26', '00000004');
INSERT INTO `dev_user_orgs` VALUES ('962', '26', '000000040002');
INSERT INTO `dev_user_orgs` VALUES ('963', '26', '00000006');
INSERT INTO `dev_user_orgs` VALUES ('964', '26', '000000060001');
INSERT INTO `dev_user_orgs` VALUES ('965', '26', '000000060002');
INSERT INTO `dev_user_orgs` VALUES ('966', '26', '000000060003');
INSERT INTO `dev_user_orgs` VALUES ('967', '26', '0000000600030001');
INSERT INTO `dev_user_orgs` VALUES ('968', '26', '000000060006');
INSERT INTO `dev_user_orgs` VALUES ('969', '26', '00000007');
INSERT INTO `dev_user_orgs` VALUES ('970', '26', '000000070001');
INSERT INTO `dev_user_orgs` VALUES ('971', '26', '000000070002');
INSERT INTO `dev_user_orgs` VALUES ('972', '26', '000000070003');
INSERT INTO `dev_user_orgs` VALUES ('973', '26', '000000070004');
INSERT INTO `dev_user_orgs` VALUES ('974', '26', '00000008');
INSERT INTO `dev_user_orgs` VALUES ('975', '26', '000000080001');
INSERT INTO `dev_user_orgs` VALUES ('976', '26', '0000000800010001');
INSERT INTO `dev_user_orgs` VALUES ('977', '26', '00000008000100010001');
INSERT INTO `dev_user_orgs` VALUES ('978', '26', '00000008000100010002');
INSERT INTO `dev_user_orgs` VALUES ('979', '26', '0000000800010002');
INSERT INTO `dev_user_orgs` VALUES ('980', '26', '0000000800010003');
INSERT INTO `dev_user_orgs` VALUES ('981', '26', '0000000800010004');
INSERT INTO `dev_user_orgs` VALUES ('982', '26', '0000000800010005');
INSERT INTO `dev_user_orgs` VALUES ('983', '26', '00000009');
INSERT INTO `dev_user_orgs` VALUES ('984', '26', '000000090001');
INSERT INTO `dev_user_orgs` VALUES ('985', '26', '000000090002');
INSERT INTO `dev_user_orgs` VALUES ('986', '26', '0000000900020001');
INSERT INTO `dev_user_orgs` VALUES ('987', '26', '000000090004');
INSERT INTO `dev_user_orgs` VALUES ('988', '26', '000000090005');
INSERT INTO `dev_user_orgs` VALUES ('989', '26', '000000090006');
INSERT INTO `dev_user_orgs` VALUES ('990', '26', '000000090008');
INSERT INTO `dev_user_orgs` VALUES ('991', '26', '000000090009');
INSERT INTO `dev_user_orgs` VALUES ('992', '26', '000000090010');
INSERT INTO `dev_user_orgs` VALUES ('993', '26', '00000010');
INSERT INTO `dev_user_orgs` VALUES ('994', '26', '00000011');
INSERT INTO `dev_user_orgs` VALUES ('995', '26', '000000110001');
INSERT INTO `dev_user_orgs` VALUES ('996', '26', '000000110002');
INSERT INTO `dev_user_orgs` VALUES ('997', '26', '000000110003');
INSERT INTO `dev_user_orgs` VALUES ('998', '26', '000000110004');
INSERT INTO `dev_user_orgs` VALUES ('999', '26', '000000110005');
INSERT INTO `dev_user_orgs` VALUES ('1000', '26', '000000110006');
INSERT INTO `dev_user_orgs` VALUES ('1001', '26', '00000012');
INSERT INTO `dev_user_orgs` VALUES ('1002', '26', '000000120001');
INSERT INTO `dev_user_orgs` VALUES ('1003', '26', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('1004', '26', '000000130001');
INSERT INTO `dev_user_orgs` VALUES ('1005', '26', '0000001300010001');
INSERT INTO `dev_user_orgs` VALUES ('1006', '26', '0000001300010002');
INSERT INTO `dev_user_orgs` VALUES ('1007', '26', '000000130002');
INSERT INTO `dev_user_orgs` VALUES ('1008', '106', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1009', '106', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('1010', '106', '000000130002');
INSERT INTO `dev_user_orgs` VALUES ('1011', '26', '0000001300010003');
INSERT INTO `dev_user_orgs` VALUES ('1028', '', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1029', '', '00000001');
INSERT INTO `dev_user_orgs` VALUES ('1030', '', '000000010004');
INSERT INTO `dev_user_orgs` VALUES ('1031', '', '00000003');
INSERT INTO `dev_user_orgs` VALUES ('1061', '1', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1062', '1', '00000001');
INSERT INTO `dev_user_orgs` VALUES ('1063', '1', '000000010001');
INSERT INTO `dev_user_orgs` VALUES ('1064', '1', '0000000100010001');
INSERT INTO `dev_user_orgs` VALUES ('1065', '1', '0000000100010002');
INSERT INTO `dev_user_orgs` VALUES ('1066', '1', '00000003');
INSERT INTO `dev_user_orgs` VALUES ('1076', '68', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1077', '68', '00000001');
INSERT INTO `dev_user_orgs` VALUES ('1078', '68', '000000010001');
INSERT INTO `dev_user_orgs` VALUES ('1079', '68', '0000000100010001');
INSERT INTO `dev_user_orgs` VALUES ('1080', '68', '0000000100010002');
INSERT INTO `dev_user_orgs` VALUES ('1081', '68', '000000010002');
INSERT INTO `dev_user_orgs` VALUES ('1082', '68', '000000010003');
INSERT INTO `dev_user_orgs` VALUES ('1083', '68', '000000010004');
INSERT INTO `dev_user_orgs` VALUES ('1084', '68', '000000010005');
INSERT INTO `dev_user_orgs` VALUES ('1085', '68', '00000004');
INSERT INTO `dev_user_orgs` VALUES ('1086', '68', '000000040002');
INSERT INTO `dev_user_orgs` VALUES ('1087', '90', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1088', '90', '00000001');
INSERT INTO `dev_user_orgs` VALUES ('1089', '90', '000000010001');
INSERT INTO `dev_user_orgs` VALUES ('1090', '90', '0000000100010001');
INSERT INTO `dev_user_orgs` VALUES ('1091', '90', '0000000100010002');
INSERT INTO `dev_user_orgs` VALUES ('1092', '90', '000000010005');
INSERT INTO `dev_user_orgs` VALUES ('1097', '77', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1098', '77', '00000001');
INSERT INTO `dev_user_orgs` VALUES ('1099', '77', '000000010001');
INSERT INTO `dev_user_orgs` VALUES ('1100', '77', '0000000100010001');
INSERT INTO `dev_user_orgs` VALUES ('1101', '77', '0000000100010002');
INSERT INTO `dev_user_orgs` VALUES ('1102', '117', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1103', '117', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('1104', '117', '000000130001');
INSERT INTO `dev_user_orgs` VALUES ('1105', '117', '0000001300010001');
INSERT INTO `dev_user_orgs` VALUES ('1106', '117', '0000001300010002');
INSERT INTO `dev_user_orgs` VALUES ('1107', '117', '0000001300010003');
INSERT INTO `dev_user_orgs` VALUES ('1108', '117', '000000130002');
INSERT INTO `dev_user_orgs` VALUES ('1109', '104', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1110', '104', '00000008');
INSERT INTO `dev_user_orgs` VALUES ('1111', '104', '000000080001');
INSERT INTO `dev_user_orgs` VALUES ('1112', '104', '0000000800010001');
INSERT INTO `dev_user_orgs` VALUES ('1113', '104', '00000008000100010001');
INSERT INTO `dev_user_orgs` VALUES ('1114', '104', '00000008000100010002');
INSERT INTO `dev_user_orgs` VALUES ('1115', '104', '0000000800010002');
INSERT INTO `dev_user_orgs` VALUES ('1116', '104', '0000000800010003');
INSERT INTO `dev_user_orgs` VALUES ('1117', '104', '0000000800010004');
INSERT INTO `dev_user_orgs` VALUES ('1118', '104', '0000000800010005');
INSERT INTO `dev_user_orgs` VALUES ('1119', '26', '0000000100010003');
INSERT INTO `dev_user_orgs` VALUES ('1120', '118', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1121', '118', '00000011');
INSERT INTO `dev_user_orgs` VALUES ('1122', '118', '000000110001');
INSERT INTO `dev_user_orgs` VALUES ('1123', '118', '000000110002');
INSERT INTO `dev_user_orgs` VALUES ('1124', '118', '000000110003');
INSERT INTO `dev_user_orgs` VALUES ('1125', '118', '000000110004');
INSERT INTO `dev_user_orgs` VALUES ('1126', '118', '000000110005');
INSERT INTO `dev_user_orgs` VALUES ('1127', '118', '000000110006');
INSERT INTO `dev_user_orgs` VALUES ('1128', '119', '00000011');
INSERT INTO `dev_user_orgs` VALUES ('1129', '119', '000000110001');
INSERT INTO `dev_user_orgs` VALUES ('1130', '118', '000000110007');
INSERT INTO `dev_user_orgs` VALUES ('1131', '26', '000000010006');
INSERT INTO `dev_user_orgs` VALUES ('1132', '26', '000000010007');
INSERT INTO `dev_user_orgs` VALUES ('1133', '26', '000000130003');
INSERT INTO `dev_user_orgs` VALUES ('1134', '26', '0000001300030001');
INSERT INTO `dev_user_orgs` VALUES ('1135', '26', '0000001300030002');
INSERT INTO `dev_user_orgs` VALUES ('1136', '26', '0000001300030003');
INSERT INTO `dev_user_orgs` VALUES ('1137', '26', '000000130004');
INSERT INTO `dev_user_orgs` VALUES ('1138', '26', '0000001300040004');
INSERT INTO `dev_user_orgs` VALUES ('1139', '26', '00000014');
INSERT INTO `dev_user_orgs` VALUES ('1140', '26', '000000130007');
INSERT INTO `dev_user_orgs` VALUES ('1141', '26', '000000140001');
INSERT INTO `dev_user_orgs` VALUES ('1142', '26', '000000140001');
INSERT INTO `dev_user_orgs` VALUES ('1143', '26', '0000001300070001');
INSERT INTO `dev_user_orgs` VALUES ('1144', '26', '000000130008');
INSERT INTO `dev_user_orgs` VALUES ('1145', '26', '000000130009');
INSERT INTO `dev_user_orgs` VALUES ('1146', '26', '0000001300070002');
INSERT INTO `dev_user_orgs` VALUES ('1147', '26', '0000001300070003');
INSERT INTO `dev_user_orgs` VALUES ('1148', '26', '0000001400010001');
INSERT INTO `dev_user_orgs` VALUES ('1149', '26', '0000001400010002');
INSERT INTO `dev_user_orgs` VALUES ('1150', '26', '0000001400010003');
INSERT INTO `dev_user_orgs` VALUES ('1151', '26', '0000001300070003');
INSERT INTO `dev_user_orgs` VALUES ('1152', '26', '0000001300070003');
INSERT INTO `dev_user_orgs` VALUES ('1153', '26', '0000001300070003');
INSERT INTO `dev_user_orgs` VALUES ('1154', '26', '0000001300070003');
INSERT INTO `dev_user_orgs` VALUES ('1155', '26', '000000010006');
INSERT INTO `dev_user_orgs` VALUES ('1156', '26', '0000001300070003');
INSERT INTO `dev_user_orgs` VALUES ('1157', '121', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1158', '121', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('1159', '121', '000000130007');
INSERT INTO `dev_user_orgs` VALUES ('1160', '121', '0000001300070001');
INSERT INTO `dev_user_orgs` VALUES ('1161', '122', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1162', '122', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('1163', '122', '000000130007');
INSERT INTO `dev_user_orgs` VALUES ('1164', '122', '0000001300070001');
INSERT INTO `dev_user_orgs` VALUES ('1165', '122', '0000001300070002');
INSERT INTO `dev_user_orgs` VALUES ('1166', '122', '0000001300070003');
INSERT INTO `dev_user_orgs` VALUES ('1167', '26', '000000130008');
INSERT INTO `dev_user_orgs` VALUES ('1168', '123', '0000');
INSERT INTO `dev_user_orgs` VALUES ('1169', '123', '00000013');
INSERT INTO `dev_user_orgs` VALUES ('1170', '123', '000000130008');
INSERT INTO `dev_user_orgs` VALUES ('1171', '123', '0000001300080001');
INSERT INTO `dev_user_orgs` VALUES ('1172', '123', '0000001300080002');
INSERT INTO `dev_user_orgs` VALUES ('1173', '123', '0000001300080003');
INSERT INTO `dev_user_orgs` VALUES ('1174', '124', '000000130008');
INSERT INTO `dev_user_orgs` VALUES ('1175', '124', '0000001300080001');
INSERT INTO `dev_user_orgs` VALUES ('1176', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1177', '26', '0000001300070005');
INSERT INTO `dev_user_orgs` VALUES ('1178', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1179', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1180', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1181', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1182', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1183', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1184', '26', '0000001300070004');
INSERT INTO `dev_user_orgs` VALUES ('1185', '26', '00000002');

-- ----------------------------
-- Table structure for dev_user_role
-- ----------------------------
DROP TABLE IF EXISTS `dev_user_role`;
CREATE TABLE `dev_user_role` (
  `UR_ID` decimal(12,0) NOT NULL COMMENT '用户角色ID',
  `UI_ID` decimal(12,0) DEFAULT NULL COMMENT '用户ID',
  `RI_ID` decimal(12,0) DEFAULT NULL COMMENT '角色ID',
  `UR_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '到期时间',
  PRIMARY KEY (`UR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of dev_user_role
-- ----------------------------
INSERT INTO `dev_user_role` VALUES ('12', '16', '2', '2015-02-03 17:05:47');
INSERT INTO `dev_user_role` VALUES ('13', '16', '3', '2015-02-03 17:05:47');
INSERT INTO `dev_user_role` VALUES ('17', '59', '5', '2015-02-12 14:01:23');
INSERT INTO `dev_user_role` VALUES ('122', '73', '3', '2015-06-09 11:23:07');
INSERT INTO `dev_user_role` VALUES ('123', '71', '15', '2015-06-16 17:21:30');
INSERT INTO `dev_user_role` VALUES ('127', '67', '2', '2015-06-22 09:04:35');
INSERT INTO `dev_user_role` VALUES ('128', '70', '3', '2015-06-30 17:24:14');
INSERT INTO `dev_user_role` VALUES ('129', '79', '3', '2015-07-01 09:29:47');
INSERT INTO `dev_user_role` VALUES ('130', '80', '5', '2015-07-04 13:19:58');
INSERT INTO `dev_user_role` VALUES ('131', '80', '6', '2015-07-04 13:19:58');
INSERT INTO `dev_user_role` VALUES ('132', '80', '7', '2015-07-04 13:19:58');
INSERT INTO `dev_user_role` VALUES ('133', '80', '8', '2015-07-04 13:19:58');
INSERT INTO `dev_user_role` VALUES ('134', '82', '2', '2015-07-13 15:47:41');
INSERT INTO `dev_user_role` VALUES ('135', '26', '2', '2015-09-11 13:32:55');
INSERT INTO `dev_user_role` VALUES ('136', '26', '6', '2015-07-21 15:05:14');
INSERT INTO `dev_user_role` VALUES ('137', '26', '7', '2015-07-21 15:05:14');
INSERT INTO `dev_user_role` VALUES ('138', '26', '2', '2015-07-21 15:11:04');
INSERT INTO `dev_user_role` VALUES ('139', '83', '5', '2015-07-21 15:05:35');
INSERT INTO `dev_user_role` VALUES ('140', '83', '6', '2015-07-21 15:05:35');
INSERT INTO `dev_user_role` VALUES ('141', '83', '7', '2015-07-21 15:05:35');
INSERT INTO `dev_user_role` VALUES ('142', '83', '8', '2015-07-21 15:05:35');
INSERT INTO `dev_user_role` VALUES ('152', '86', '5', '2015-07-25 13:26:09');
INSERT INTO `dev_user_role` VALUES ('153', '86', '6', '2015-07-25 13:26:09');
INSERT INTO `dev_user_role` VALUES ('154', '86', '7', '2015-07-25 13:26:09');
INSERT INTO `dev_user_role` VALUES ('155', '86', '8', '2015-07-25 13:26:09');
INSERT INTO `dev_user_role` VALUES ('160', '85', '3', '2015-08-11 14:24:24');
INSERT INTO `dev_user_role` VALUES ('161', '72', '5', '2015-08-11 18:17:02');
INSERT INTO `dev_user_role` VALUES ('162', '72', '6', '2015-08-11 18:17:02');
INSERT INTO `dev_user_role` VALUES ('163', '72', '7', '2015-08-11 18:17:02');
INSERT INTO `dev_user_role` VALUES ('172', '93', '2', '2015-10-20 15:29:29');
INSERT INTO `dev_user_role` VALUES ('173', '93', '3', '2015-10-20 15:29:29');
INSERT INTO `dev_user_role` VALUES ('174', '93', '15', '2015-10-20 15:29:29');
INSERT INTO `dev_user_role` VALUES ('175', '87', '9', '2015-10-20 15:30:10');
INSERT INTO `dev_user_role` VALUES ('176', '87', '10', '2015-10-20 15:30:10');
INSERT INTO `dev_user_role` VALUES ('177', '87', '13', '2015-10-20 15:30:10');
INSERT INTO `dev_user_role` VALUES ('181', '94', '9', '2015-10-20 15:35:24');
INSERT INTO `dev_user_role` VALUES ('182', '94', '10', '2015-10-20 15:35:24');
INSERT INTO `dev_user_role` VALUES ('183', '94', '13', '2015-10-20 15:35:24');
INSERT INTO `dev_user_role` VALUES ('230', '97', '9', '2015-10-21 09:51:10');
INSERT INTO `dev_user_role` VALUES ('231', '97', '10', '2015-10-21 09:51:10');
INSERT INTO `dev_user_role` VALUES ('232', '97', '13', '2015-10-21 09:51:10');
INSERT INTO `dev_user_role` VALUES ('233', '96', '9', '2015-10-21 09:51:22');
INSERT INTO `dev_user_role` VALUES ('234', '96', '10', '2015-10-21 09:51:22');
INSERT INTO `dev_user_role` VALUES ('235', '96', '13', '2015-10-21 09:51:22');
INSERT INTO `dev_user_role` VALUES ('246', '95', '5', '2015-10-28 15:13:08');
INSERT INTO `dev_user_role` VALUES ('247', '95', '6', '2015-10-28 15:13:08');
INSERT INTO `dev_user_role` VALUES ('248', '95', '7', '2015-10-28 15:13:08');
INSERT INTO `dev_user_role` VALUES ('249', '95', '8', '2015-10-28 15:13:08');
INSERT INTO `dev_user_role` VALUES ('250', '95', '12', '2015-10-28 15:13:08');
INSERT INTO `dev_user_role` VALUES ('251', '95', '14', '2015-10-28 15:13:08');
INSERT INTO `dev_user_role` VALUES ('252', '105', '3', '2015-10-30 10:35:21');
INSERT INTO `dev_user_role` VALUES ('253', '106', '6', '2015-10-30 15:00:47');
INSERT INTO `dev_user_role` VALUES ('254', '106', '7', '2015-10-30 15:00:47');
INSERT INTO `dev_user_role` VALUES ('260', '1', '2', '2015-11-24 10:07:47');
INSERT INTO `dev_user_role` VALUES ('261', '1', '3', '2015-11-24 10:07:47');
INSERT INTO `dev_user_role` VALUES ('269', '68', '9', '2015-11-24 14:35:35');
INSERT INTO `dev_user_role` VALUES ('270', '68', '10', '2015-11-24 14:35:35');
INSERT INTO `dev_user_role` VALUES ('271', '90', '5', '2015-11-24 14:46:27');
INSERT INTO `dev_user_role` VALUES ('272', '90', '6', '2015-11-24 14:46:27');
INSERT INTO `dev_user_role` VALUES ('273', '90', '7', '2015-11-24 14:46:27');
INSERT INTO `dev_user_role` VALUES ('274', '90', '8', '2015-11-24 14:46:27');
INSERT INTO `dev_user_role` VALUES ('279', '77', '6', '2015-11-24 15:02:54');
INSERT INTO `dev_user_role` VALUES ('280', '77', '7', '2015-11-24 15:02:54');
INSERT INTO `dev_user_role` VALUES ('281', '117', '5', '2015-12-01 13:56:25');
INSERT INTO `dev_user_role` VALUES ('282', '117', '6', '2015-12-01 13:56:25');
INSERT INTO `dev_user_role` VALUES ('283', '117', '7', '2015-12-01 13:56:25');
INSERT INTO `dev_user_role` VALUES ('284', '117', '8', '2015-12-01 13:56:25');
INSERT INTO `dev_user_role` VALUES ('285', '117', '12', '2015-12-01 13:56:25');
INSERT INTO `dev_user_role` VALUES ('286', '117', '14', '2015-12-01 13:56:25');
INSERT INTO `dev_user_role` VALUES ('291', '104', '5', '2015-12-08 10:27:53');
INSERT INTO `dev_user_role` VALUES ('292', '104', '6', '2015-12-08 10:27:53');
INSERT INTO `dev_user_role` VALUES ('293', '104', '7', '2015-12-08 10:27:53');
INSERT INTO `dev_user_role` VALUES ('294', '104', '8', '2015-12-08 10:27:53');
INSERT INTO `dev_user_role` VALUES ('295', '118', '5', '2015-12-10 12:02:19');
INSERT INTO `dev_user_role` VALUES ('296', '118', '6', '2015-12-10 12:02:19');
INSERT INTO `dev_user_role` VALUES ('297', '118', '7', '2015-12-10 12:02:19');
INSERT INTO `dev_user_role` VALUES ('298', '118', '8', '2015-12-10 12:02:19');
INSERT INTO `dev_user_role` VALUES ('299', '119', '5', '2015-12-10 13:13:13');
INSERT INTO `dev_user_role` VALUES ('300', '119', '6', '2015-12-10 13:13:13');
INSERT INTO `dev_user_role` VALUES ('301', '119', '7', '2015-12-10 13:13:13');
INSERT INTO `dev_user_role` VALUES ('302', '119', '8', '2015-12-10 13:13:13');
INSERT INTO `dev_user_role` VALUES ('306', '122', '16', '2016-02-23 11:20:43');
INSERT INTO `dev_user_role` VALUES ('307', '122', '17', '2016-02-23 11:20:43');
INSERT INTO `dev_user_role` VALUES ('308', '122', '18', '2016-02-23 11:20:43');
INSERT INTO `dev_user_role` VALUES ('309', '122', '19', '2016-02-23 11:20:43');
INSERT INTO `dev_user_role` VALUES ('310', '121', '16', '2016-02-23 11:22:17');
INSERT INTO `dev_user_role` VALUES ('311', '121', '17', '2016-02-23 11:22:17');
INSERT INTO `dev_user_role` VALUES ('312', '121', '18', '2016-02-23 11:22:17');
INSERT INTO `dev_user_role` VALUES ('313', '121', '19', '2016-02-23 11:22:17');
INSERT INTO `dev_user_role` VALUES ('314', '123', '16', '2016-02-23 11:27:47');
INSERT INTO `dev_user_role` VALUES ('315', '123', '17', '2016-02-23 11:27:47');
INSERT INTO `dev_user_role` VALUES ('316', '123', '18', '2016-02-23 11:27:47');
INSERT INTO `dev_user_role` VALUES ('317', '123', '19', '2016-02-23 11:27:47');
INSERT INTO `dev_user_role` VALUES ('318', '124', '16', '2016-02-23 11:30:42');
INSERT INTO `dev_user_role` VALUES ('319', '124', '17', '2016-02-23 11:30:42');
INSERT INTO `dev_user_role` VALUES ('320', '124', '18', '2016-02-23 11:30:42');
INSERT INTO `dev_user_role` VALUES ('321', '124', '19', '2016-02-23 11:30:42');
INSERT INTO `dev_user_role` VALUES ('322', '133', '3', '2016-07-13 13:34:36');
INSERT INTO `dev_user_role` VALUES ('323', '134', '3', '2016-07-21 11:43:57');
INSERT INTO `dev_user_role` VALUES ('324', '136', '3', '2016-07-21 11:52:55');
INSERT INTO `dev_user_role` VALUES ('325', '137', '3', '2016-07-21 12:03:58');
INSERT INTO `dev_user_role` VALUES ('326', '147', '3', '2017-09-19 15:52:47');
INSERT INTO `dev_user_role` VALUES ('327', '148', '3', '2017-12-20 16:43:01');

-- ----------------------------
-- Table structure for food_type
-- ----------------------------
DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `SN` varchar(50) NOT NULL,
  `TYPE_ID` varchar(50) NOT NULL,
  `TYPE_NAME` varchar(50) DEFAULT NULL,
  `PLAT_NO` varchar(50) NOT NULL COMMENT '餐台编号',
  `ORG_CODE` varchar(64) NOT NULL,
  `P1` varchar(64) DEFAULT NULL,
  `P2` varchar(64) DEFAULT NULL,
  `PLAT_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TYPE_ID`,`ORG_CODE`,`PLAT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_type
-- ----------------------------
INSERT INTO `food_type` VALUES ('6', '01', '11', '1', '00000001', null, null, '糖水鸡餐台1');
INSERT INTO `food_type` VALUES ('3', '01', '凉菜', '3', '000000020001', null, null, '糖水鸡餐台');
INSERT INTO `food_type` VALUES ('2', '02', '江浙菜', '3', '000000020001', null, null, '糖水鸡餐台');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `sn` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `org_code` varchar(64) DEFAULT NULL,
  `p1` varchar(64) DEFAULT NULL,
  `p2` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('0', '白菜', '1.10', '11', '0000', null, null);

-- ----------------------------
-- Table structure for menu_cook
-- ----------------------------
DROP TABLE IF EXISTS `menu_cook`;
CREATE TABLE `menu_cook` (
  `sn` varchar(64) NOT NULL,
  `dish_sn` varchar(64) DEFAULT NULL,
  `cook_sn` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `p1` varchar(64) DEFAULT NULL,
  `p2` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_cook
-- ----------------------------
INSERT INTO `menu_cook` VALUES ('3', '', '2', null, '大厨师', null);

-- ----------------------------
-- Table structure for menu_material
-- ----------------------------
DROP TABLE IF EXISTS `menu_material`;
CREATE TABLE `menu_material` (
  `sn` varchar(64) NOT NULL,
  `dish_sn` varchar(64) DEFAULT NULL,
  `material_sn` varchar(64) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `p1` varchar(64) DEFAULT NULL,
  `p2` varchar(64) DEFAULT NULL COMMENT '菜品原料',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_material
-- ----------------------------
INSERT INTO `menu_material` VALUES ('3', '', '0', null, '白菜', null);

-- ----------------------------
-- Table structure for menu_nutrition
-- ----------------------------
DROP TABLE IF EXISTS `menu_nutrition`;
CREATE TABLE `menu_nutrition` (
  `sn` varchar(64) NOT NULL COMMENT '菜品营养',
  `dish_sn` varchar(64) DEFAULT NULL,
  `material_sn` varchar(64) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `p1` varchar(64) DEFAULT NULL,
  `p2` varchar(64) DEFAULT NULL COMMENT '菜品原料',
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_nutrition
-- ----------------------------
INSERT INTO `menu_nutrition` VALUES ('3', '', '2', null, 'Ca', null);

-- ----------------------------
-- Table structure for nutrition
-- ----------------------------
DROP TABLE IF EXISTS `nutrition`;
CREATE TABLE `nutrition` (
  `sn` varchar(64) NOT NULL COMMENT '营养',
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `org_code` varchar(64) DEFAULT NULL,
  `p1` varchar(64) DEFAULT NULL,
  `p2` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nutrition
-- ----------------------------
INSERT INTO `nutrition` VALUES ('2', 'Ca', 'ml', 'Ca', '0000', null, null);

-- ----------------------------
-- Table structure for t_bas_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_bas_menu`;
CREATE TABLE `t_bas_menu` (
  `SN` varchar(50) DEFAULT NULL,
  `PLAT_NO` varchar(50) NOT NULL COMMENT '餐台编号',
  `FOOD_NO` varchar(50) NOT NULL COMMENT '菜编号',
  `FOOD_NAME` varchar(255) DEFAULT NULL COMMENT '菜名称',
  `FOOD_TYPE` varchar(50) DEFAULT NULL COMMENT '所属分类',
  `WEIGHT_UNIT` varchar(50) DEFAULT NULL COMMENT '重量单位编号',
  `PRICE_UNIT` decimal(5,2) DEFAULT NULL COMMENT '单价',
  `START_WEIGHT` decimal(8,3) DEFAULT NULL COMMENT '最小销售重量',
  `USE_FLAG` int(1) DEFAULT NULL COMMENT '启用标识，0不启用，1启用',
  `START_DATE` datetime DEFAULT NULL COMMENT '起售日期',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT '操作人',
  `OPERATE_TIME` datetime DEFAULT NULL COMMENT '操作时间',
  `ORG_CODE` varchar(64) NOT NULL,
  `P1` varchar(64) DEFAULT NULL,
  `P2` varchar(64) DEFAULT NULL,
  `PLAT_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PLAT_NO`,`ORG_CODE`,`FOOD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bas_menu
-- ----------------------------
INSERT INTO `t_bas_menu` VALUES ('5', '3', '01', '111', '01', '01', '1.00', '1.000', '0', '2018-01-31 00:00:00', '', null, '000000020001', null, null, '糖水鸡餐台');
INSERT INTO `t_bas_menu` VALUES ('6', '3', '02', '11', '01', '01', '11.00', '11.000', '0', '2018-01-26 00:00:00', '', null, '000000020001', null, null, '糖水鸡餐台');

-- ----------------------------
-- Table structure for t_bas_platinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_bas_platinfo`;
CREATE TABLE `t_bas_platinfo` (
  `SN` varchar(50) DEFAULT NULL,
  `PLAT_NO` varchar(50) NOT NULL,
  `PLAT_NAME` varchar(50) DEFAULT NULL,
  `BOSSNAME` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `DEPART_CODE` varchar(50) DEFAULT NULL COMMENT '所属单位编号',
  `STATION_CODE` varchar(50) DEFAULT NULL COMMENT '所属食堂编号',
  `START_DATE` datetime DEFAULT NULL,
  `ORG_CODE` varchar(64) NOT NULL,
  `P1` varchar(64) DEFAULT NULL,
  `P2` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`PLAT_NO`,`ORG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bas_platinfo
-- ----------------------------
INSERT INTO `t_bas_platinfo` VALUES ('4', '1', '糖水鸡餐台1', '3', '13333333', '5', '', '', null, '00000001', '', '');
INSERT INTO `t_bas_platinfo` VALUES ('2', '1', '绿闷鸭餐台', '张思', '18111111111', '中间', '', '', null, '000000030001', '', '');
INSERT INTO `t_bas_platinfo` VALUES ('5', '11', '1', '1', '133333331', '1', '', '', null, '00000001', '', '');
INSERT INTO `t_bas_platinfo` VALUES ('3', '3', '糖水鸡餐台', '李刘', '12122222', '大门口', '', '', null, '000000020001', '', '');

-- ----------------------------
-- Table structure for weight_unit
-- ----------------------------
DROP TABLE IF EXISTS `weight_unit`;
CREATE TABLE `weight_unit` (
  `SN` varchar(50) DEFAULT NULL,
  `UNIT_ID` varchar(50) NOT NULL,
  `UNIT_NAME` varchar(50) DEFAULT NULL,
  `PLAT_NO` varchar(50) DEFAULT NULL,
  `UNIT_ZHXS` float DEFAULT NULL,
  `ORG_CODE` varchar(64) NOT NULL,
  `P1` varchar(64) DEFAULT NULL,
  `P2` varchar(64) DEFAULT NULL,
  `PLAT_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UNIT_ID`,`ORG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weight_unit
-- ----------------------------
INSERT INTO `weight_unit` VALUES ('3', '01', '顿', '1', null, '00000001', null, null, '糖水鸡餐台1');
INSERT INTO `weight_unit` VALUES ('2', '01', '斤', '3', null, '000000020001', null, null, '糖水鸡套餐');

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(seq_name VARCHAR(50)) RETURNS int(11)
BEGIN    
  DECLARE current INTEGER;    
  SET current = 0;    
  SELECT currentValue INTO current    
  FROM dev_seq     
  WHERE seqname = seq_name;    
  RETURN current;    
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextorgval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextorgval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextorgval`(code varchar(64)) RETURNS varchar(64) CHARSET utf8
begin

DECLARE nextcode VARCHAR(255) ; 
DECLARE len long ; 
set nextcode ='0';

select  left( max(oi_code),length(code)+4)  into nextcode  from dev_org_info where oi_code like concat( '', code,  '%');

 if LENGTH(nextcode) = LENGTH(code) then 
    set nextcode = concat('', nextcode,  '0001');
    set nextcode = LPAD(nextcode,LENGTH(code)+4,'0');
 elseif LENGTH(nextcode) <> LENGTH(code) then
	set len = LENGTH(nextcode);
	if len>10 then
		set nextcode = CONCAT(left(nextcode,len-4),  LPAD( cast(right(nextcode,4)  as SIGNED INTEGER) +1,4 ,'0' ));
		set nextcode = LPAD(nextcode,len,'0');

	else
		set nextcode = nextcode +1;
		set nextcode = LPAD(nextcode,len,'0');
	end if;
 end if;

return nextcode;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(seq_name VARCHAR(50)) RETURNS int(11)
BEGIN    
   UPDATE dev_SEQ    
   SET currentValue = currentValue + increment    
   WHERE seqname = seq_name;    
   RETURN currval(seq_name);    
END
;;
DELIMITER ;
