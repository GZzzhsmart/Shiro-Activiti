

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `code` varchar(64) NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `pid` bigint(19) DEFAULT NULL,
  `seq` tinyint(2) NOT NULL DEFAULT '0',
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '总经办', '', '01', 'icon-company', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '技术部', '', '02', 'icon-company', null, '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '产品部', '', '03', 'icon-company', null, '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '测试组', '', '04', 'icon-folder', '3', '0', '2015-12-06 13:12:18');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `pid` bigint(19) DEFAULT NULL,
  `seq` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `resourcetype` tinyint(2) NOT NULL DEFAULT '0',
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '系统管理', '', '系统管理', 'icon-company', null, '0', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('11', '资源管理', '/resource/manager', '资源管理', 'icon-folder', '1', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('12', '角色管理', '/role/manager', '角色管理', 'icon-folder', '1', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('13', '用户管理', '/user/manager', '用户管理', 'icon-folder', '1', '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('14', '部门管理', '/organization/manager', '部门管理', 'icon-folder', '1', '4', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', '资源列表', 'icon-list', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('112', '添加', '/resource/add', '资源添加', 'icon-add', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('113', '编辑', '/resource/edit', '资源编辑', 'icon-edit', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('114', '删除', '/resource/delete', '资源删除', 'icon-del', '11', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('121', '列表', '/role/dataGrid', '角色列表', 'icon-list', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('122', '添加', '/role/add', '角色添加', 'icon-add', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('123', '编辑', '/role/edit', '角色编辑', 'icon-edit', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('124', '删除', '/role/delete', '角色删除', 'icon-del', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('125', '授权', '/role/grant', '角色授权', 'icon-ok', '12', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', '用户列表', 'icon-list', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', '用户添加', 'icon-add', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', '用户编辑', 'icon-edit', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', '用户删除', 'icon-del', '13', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('141', '列表', '/organization/treeGrid', '用户列表', 'icon-list', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('142', '添加', '/organization/add', '部门添加', 'icon-add', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('143', '编辑', '/organization/edit', '部门编辑', 'icon-edit', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('144', '删除', '/organization/delete', '部门删除', 'icon-del', '14', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('221', '日志管理', '/sysLog/manager', null, 'icon-company', null, '2', '0', '0', '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES ('222', '视频教程', '', null, 'icon-company', null, '1', '0', '0', '2015-12-06 12:40:42');
INSERT INTO `resource` VALUES ('223', '官方网站', 'http://www.dreamlu.net/', null, 'icon-folder', '222', '0', '0', '0', '2015-12-06 12:42:42');
INSERT INTO `resource` VALUES ('224', 'jfinal视频', 'http://blog.dreamlu.net/blog/79', null, 'icon-folder', '222', '1', '0', '0', '2015-12-06 12:45:28');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `seq` tinyint(2) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', '技术部经理', '0', '技术部经理', '0');
INSERT INTO `role` VALUES ('7', '产品部经理', '0', '产品部经理', '0');
INSERT INTO `role` VALUES ('8', '测试账户', '0', '测试账户', '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(19) NOT NULL,
  `resource_id` bigint(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('158', '3', '1');
INSERT INTO `role_resource` VALUES ('159', '3', '11');
INSERT INTO `role_resource` VALUES ('160', '3', '111');
INSERT INTO `role_resource` VALUES ('161', '3', '112');
INSERT INTO `role_resource` VALUES ('162', '3', '113');
INSERT INTO `role_resource` VALUES ('163', '3', '114');
INSERT INTO `role_resource` VALUES ('164', '3', '12');
INSERT INTO `role_resource` VALUES ('165', '3', '121');
INSERT INTO `role_resource` VALUES ('166', '3', '122');
INSERT INTO `role_resource` VALUES ('167', '3', '123');
INSERT INTO `role_resource` VALUES ('168', '3', '124');
INSERT INTO `role_resource` VALUES ('169', '3', '125');
INSERT INTO `role_resource` VALUES ('170', '3', '13');
INSERT INTO `role_resource` VALUES ('171', '3', '131');
INSERT INTO `role_resource` VALUES ('172', '3', '132');
INSERT INTO `role_resource` VALUES ('173', '3', '133');
INSERT INTO `role_resource` VALUES ('174', '3', '134');
INSERT INTO `role_resource` VALUES ('175', '3', '14');
INSERT INTO `role_resource` VALUES ('176', '3', '141');
INSERT INTO `role_resource` VALUES ('177', '3', '142');
INSERT INTO `role_resource` VALUES ('178', '3', '143');
INSERT INTO `role_resource` VALUES ('179', '3', '144');
INSERT INTO `role_resource` VALUES ('227', '1', '1');
INSERT INTO `role_resource` VALUES ('228', '1', '11');
INSERT INTO `role_resource` VALUES ('229', '1', '111');
INSERT INTO `role_resource` VALUES ('230', '1', '112');
INSERT INTO `role_resource` VALUES ('231', '1', '113');
INSERT INTO `role_resource` VALUES ('232', '1', '114');
INSERT INTO `role_resource` VALUES ('233', '1', '12');
INSERT INTO `role_resource` VALUES ('234', '1', '121');
INSERT INTO `role_resource` VALUES ('235', '1', '122');
INSERT INTO `role_resource` VALUES ('236', '1', '123');
INSERT INTO `role_resource` VALUES ('237', '1', '124');
INSERT INTO `role_resource` VALUES ('238', '1', '125');
INSERT INTO `role_resource` VALUES ('239', '1', '13');
INSERT INTO `role_resource` VALUES ('240', '1', '131');
INSERT INTO `role_resource` VALUES ('241', '1', '132');
INSERT INTO `role_resource` VALUES ('242', '1', '133');
INSERT INTO `role_resource` VALUES ('243', '1', '134');
INSERT INTO `role_resource` VALUES ('244', '1', '14');
INSERT INTO `role_resource` VALUES ('245', '1', '141');
INSERT INTO `role_resource` VALUES ('246', '1', '142');
INSERT INTO `role_resource` VALUES ('247', '1', '143');
INSERT INTO `role_resource` VALUES ('248', '1', '144');
INSERT INTO `role_resource` VALUES ('249', '1', '222');
INSERT INTO `role_resource` VALUES ('250', '1', '223');
INSERT INTO `role_resource` VALUES ('251', '1', '224');
INSERT INTO `role_resource` VALUES ('252', '1', '221');
INSERT INTO `role_resource` VALUES ('253', '2', '1');
INSERT INTO `role_resource` VALUES ('254', '2', '13');
INSERT INTO `role_resource` VALUES ('255', '2', '131');
INSERT INTO `role_resource` VALUES ('256', '2', '132');
INSERT INTO `role_resource` VALUES ('257', '2', '133');
INSERT INTO `role_resource` VALUES ('258', '2', '134');
INSERT INTO `role_resource` VALUES ('259', '2', '222');
INSERT INTO `role_resource` VALUES ('260', '2', '223');
INSERT INTO `role_resource` VALUES ('261', '2', '224');
INSERT INTO `role_resource` VALUES ('262', '2', '221');
INSERT INTO `role_resource` VALUES ('263', '7', '1');
INSERT INTO `role_resource` VALUES ('264', '7', '14');
INSERT INTO `role_resource` VALUES ('265', '7', '141');
INSERT INTO `role_resource` VALUES ('266', '7', '142');
INSERT INTO `role_resource` VALUES ('267', '7', '143');
INSERT INTO `role_resource` VALUES ('268', '7', '222');
INSERT INTO `role_resource` VALUES ('269', '7', '223');
INSERT INTO `role_resource` VALUES ('270', '7', '224');
INSERT INTO `role_resource` VALUES ('271', '7', '221');
INSERT INTO `role_resource` VALUES ('272', '8', '1');
INSERT INTO `role_resource` VALUES ('273', '8', '11');
INSERT INTO `role_resource` VALUES ('274', '8', '111');
INSERT INTO `role_resource` VALUES ('275', '8', '12');
INSERT INTO `role_resource` VALUES ('276', '8', '121');
INSERT INTO `role_resource` VALUES ('277', '8', '13');
INSERT INTO `role_resource` VALUES ('278', '8', '131');
INSERT INTO `role_resource` VALUES ('279', '8', '14');
INSERT INTO `role_resource` VALUES ('280', '8', '141');
INSERT INTO `role_resource` VALUES ('281', '8', '222');
INSERT INTO `role_resource` VALUES ('282', '8', '223');
INSERT INTO `role_resource` VALUES ('283', '8', '224');
INSERT INTO `role_resource` VALUES ('284', '8', '221');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `opt_content` varchar(1024) DEFAULT NULL,
  `client_ip` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('3', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-10-30 17:58:44');
INSERT INTO `syslog` VALUES ('4', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-10-30 17:58:59');
INSERT INTO `syslog` VALUES ('5', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-02 10:35:25');
INSERT INTO `syslog` VALUES ('6', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-11-02 10:35:42');
INSERT INTO `syslog` VALUES ('7', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-02 10:43:17');
INSERT INTO `syslog` VALUES ('8', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-11-02 10:43:42');
INSERT INTO `syslog` VALUES ('9', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-02 17:44:45');
INSERT INTO `syslog` VALUES ('10', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-11-02 17:44:49');
INSERT INTO `syslog` VALUES ('11', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-18 19:14:16');
INSERT INTO `syslog` VALUES ('12', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-11-18 19:14:21');
INSERT INTO `syslog` VALUES ('13', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=218&_=1448724292127&', '127.0.0.1', '2015-11-28 23:25:25');
INSERT INTO `syslog` VALUES ('14', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=218&icon=&status=0&name=测试&seq=0&pid=216&resourcetype=0&url=/sysLog/manager&', '127.0.0.1', '2015-11-28 23:26:06');
INSERT INTO `syslog` VALUES ('15', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-28 23:52:39');
INSERT INTO `syslog` VALUES ('16', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-28 23:53:26');
INSERT INTO `syslog` VALUES ('17', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-29 14:36:08');
INSERT INTO `syslog` VALUES ('18', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-11-29 14:36:44');
INSERT INTO `syslog` VALUES ('19', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-29 18:40:59');
INSERT INTO `syslog` VALUES ('20', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-29 18:41:02');
INSERT INTO `syslog` VALUES ('21', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-29 18:41:20');
INSERT INTO `syslog` VALUES ('22', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-29 18:42:09');
INSERT INTO `syslog` VALUES ('23', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-29 18:44:48');
INSERT INTO `syslog` VALUES ('24', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-29 23:38:07');
INSERT INTO `syslog` VALUES ('25', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-30 13:00:37');
INSERT INTO `syslog` VALUES ('26', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-30 13:05:38');
INSERT INTO `syslog` VALUES ('27', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-30 13:08:32');
INSERT INTO `syslog` VALUES ('28', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-30 13:09:35');
INSERT INTO `syslog` VALUES ('29', 'qaz', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-30 13:10:05');
INSERT INTO `syslog` VALUES ('30', 'qaz', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-30 13:12:46');
INSERT INTO `syslog` VALUES ('31', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-11-30 13:12:52');
INSERT INTO `syslog` VALUES ('32', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-11-30 13:12:56');
INSERT INTO `syslog` VALUES ('33', 'admin', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=4&_=1448937800548&', '127.0.0.1', '2015-12-01 10:43:36');
INSERT INTO `syslog` VALUES ('34', 'admin', 'admin', '[类名]:OrganizationController,[方法]:delete,[参数]:id=4&', '127.0.0.1', '2015-12-01 10:43:43');
INSERT INTO `syslog` VALUES ('35', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=218&_=1448937800549&', '127.0.0.1', '2015-12-01 10:44:06');
INSERT INTO `syslog` VALUES ('36', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=218&icon=&status=0&name=日志管理&seq=0&pid=&resourcetype=0&url=/sysLog/manager&', '127.0.0.1', '2015-12-01 10:44:27');
INSERT INTO `syslog` VALUES ('37', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-01 11:08:57');
INSERT INTO `syslog` VALUES ('38', 'admin', 'admin', '[类名]:ResourceController,[方法]:delete,[参数]:id=219&', '127.0.0.1', '2015-12-01 11:09:21');
INSERT INTO `syslog` VALUES ('39', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=218&_=1448939340536&', '127.0.0.1', '2015-12-01 11:09:38');
INSERT INTO `syslog` VALUES ('40', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=218&icon=&status=0&name=日志管理&seq=0&pid=&resourcetype=0&url=/sysLog/manager&', '127.0.0.1', '2015-12-01 11:09:50');
INSERT INTO `syslog` VALUES ('41', 'admin', 'admin', '[类名]:ResourceController,[方法]:delete,[参数]:id=217&', '127.0.0.1', '2015-12-01 11:10:06');
INSERT INTO `syslog` VALUES ('42', 'admin', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=3&_=1448939340537&', '127.0.0.1', '2015-12-01 11:10:50');
INSERT INTO `syslog` VALUES ('43', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-12-01 11:19:32');
INSERT INTO `syslog` VALUES ('44', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=218&_=1448937870495&', '127.0.0.1', '2015-12-01 11:36:53');
INSERT INTO `syslog` VALUES ('45', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=218&icon=icon-folder&status=0&name=日志管理&seq=0&pid=216&resourcetype=0&url=/sysLog/manager&', '127.0.0.1', '2015-12-01 11:37:02');
INSERT INTO `syslog` VALUES ('46', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=216&_=1448937870496&', '127.0.0.1', '2015-12-01 11:37:05');
INSERT INTO `syslog` VALUES ('47', 'admin', 'admin', '[类名]:ResourceController,[方法]:addPage,[参数]:', null, '2015-12-01 11:37:10');
INSERT INTO `syslog` VALUES ('48', 'admin', 'admin', '[类名]:ResourceController,[方法]:add,[参数]:icon=icon-folder&status=0&name=日志管理&seq=0&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-01 11:37:27');
INSERT INTO `syslog` VALUES ('49', 'admin', 'admin', '[类名]:ResourceController,[方法]:delete,[参数]:id=216&', '127.0.0.1', '2015-12-01 11:37:32');
INSERT INTO `syslog` VALUES ('50', 'admin', 'admin', '[类名]:ResourceController,[方法]:delete,[参数]:id=220&', '127.0.0.1', '2015-12-01 11:37:37');
INSERT INTO `syslog` VALUES ('51', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-01 11:43:23');
INSERT INTO `syslog` VALUES ('52', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=218&_=1448941407091&', '127.0.0.1', '2015-12-01 11:43:47');
INSERT INTO `syslog` VALUES ('53', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=218&icon=icon-folder&status=0&name=日志管理&seq=0&pid=216&resourcetype=0&url=&', '127.0.0.1', '2015-12-01 11:43:52');
INSERT INTO `syslog` VALUES ('54', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=218&_=1448941407092&', '127.0.0.1', '2015-12-01 11:43:56');
INSERT INTO `syslog` VALUES ('55', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=218&icon=icon-folder&status=0&name=日志管理&seq=0&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-01 11:44:02');
INSERT INTO `syslog` VALUES ('56', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=218&_=1448941407093&', '127.0.0.1', '2015-12-01 11:44:04');
INSERT INTO `syslog` VALUES ('57', 'admin', 'admin', '[类名]:ResourceController,[方法]:addPage,[参数]:', null, '2015-12-01 11:44:15');
INSERT INTO `syslog` VALUES ('58', 'admin', 'admin', '[类名]:ResourceController,[方法]:add,[参数]:icon=&status=0&name=信息&seq=0&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-01 11:44:20');
INSERT INTO `syslog` VALUES ('59', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=221&_=1448941407095&', '127.0.0.1', '2015-12-01 11:44:24');
INSERT INTO `syslog` VALUES ('60', 'admin', 'admin', '[类名]:ResourceController,[方法]:delete,[参数]:id=218&', '127.0.0.1', '2015-12-01 11:44:28');
INSERT INTO `syslog` VALUES ('61', 'admin', 'admin', '[类名]:UserController,[方法]:editPwdPage,[参数]:', null, '2015-12-01 11:44:42');
INSERT INTO `syslog` VALUES ('62', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=221&_=1448941473196&', '127.0.0.1', '2015-12-01 11:44:52');
INSERT INTO `syslog` VALUES ('63', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=221&icon=&status=0&name=日志管理&seq=0&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-01 11:44:58');
INSERT INTO `syslog` VALUES ('64', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=221&_=1448941473197&', '127.0.0.1', '2015-12-01 11:45:12');
INSERT INTO `syslog` VALUES ('65', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=221&_=1448941473198&', '127.0.0.1', '2015-12-01 11:58:16');
INSERT INTO `syslog` VALUES ('66', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=221&icon=icon-company&status=0&name=日志管理&seq=0&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-01 11:58:19');
INSERT INTO `syslog` VALUES ('67', 'admin', 'admin', '[类名]:LoginController,[方法]:login,[参数]:null', '127.0.0.1', '2015-12-06 12:10:52');
INSERT INTO `syslog` VALUES ('68', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-12-06 12:10:55');
INSERT INTO `syslog` VALUES ('69', 'admin', 'admin', '[类名]:RoleController,[方法]:delete,[参数]:id=4&', '127.0.0.1', '2015-12-06 12:11:08');
INSERT INTO `syslog` VALUES ('70', 'admin', 'admin', '[类名]:RoleController,[方法]:delete,[参数]:id=5&', '127.0.0.1', '2015-12-06 12:11:11');
INSERT INTO `syslog` VALUES ('71', 'admin', 'admin', '[类名]:RoleController,[方法]:delete,[参数]:id=6&', '127.0.0.1', '2015-12-06 12:11:13');
INSERT INTO `syslog` VALUES ('72', 'admin', 'admin', '[类名]:RoleController,[方法]:delete,[参数]:id=3&', '127.0.0.1', '2015-12-06 12:11:16');
INSERT INTO `syslog` VALUES ('73', 'admin', 'admin', '[类名]:RoleController,[方法]:editPage,[参数]:id=2&_=1449375056663&', '127.0.0.1', '2015-12-06 12:11:19');
INSERT INTO `syslog` VALUES ('74', 'admin', 'admin', '[类名]:RoleController,[方法]:edit,[参数]:id=2&status=0&description=技术部经理&name=技术部经理&seq=0&', '127.0.0.1', '2015-12-06 12:11:33');
INSERT INTO `syslog` VALUES ('75', 'admin', 'admin', '[类名]:RoleController,[方法]:editPage,[参数]:id=1&_=1449375056664&', '127.0.0.1', '2015-12-06 12:11:35');
INSERT INTO `syslog` VALUES ('76', 'admin', 'admin', '[类名]:RoleController,[方法]:edit,[参数]:id=1&status=0&description=超级管理员&name=超级管理员&seq=0&', '127.0.0.1', '2015-12-06 12:11:39');
INSERT INTO `syslog` VALUES ('77', 'admin', 'admin', '[类名]:RoleController,[方法]:addPage,[参数]:', null, '2015-12-06 12:11:41');
INSERT INTO `syslog` VALUES ('78', 'admin', 'admin', '[类名]:RoleController,[方法]:add,[参数]:status=0&description=产品部经理&name=产品部经理&seq=0&', '127.0.0.1', '2015-12-06 12:11:57');
INSERT INTO `syslog` VALUES ('79', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=1&_=1449375056666&', '127.0.0.1', '2015-12-06 12:12:09');
INSERT INTO `syslog` VALUES ('80', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=1&loginname=admin&phone=18707173376&sex=0&status=0&age=18&name=admin&usertype=0&organizationId=1&password=&roleIds=1&', '127.0.0.1', '2015-12-06 12:12:37');
INSERT INTO `syslog` VALUES ('81', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=13&_=1449375056667&', '127.0.0.1', '2015-12-06 12:12:42');
INSERT INTO `syslog` VALUES ('82', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=13&loginname=snoopy&phone=&sex=0&status=0&age=25&name=snoopy&usertype=1&organizationId=3&password=&roleIds=2&', '127.0.0.1', '2015-12-06 12:13:26');
INSERT INTO `syslog` VALUES ('83', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=1&_=1449375056668&', '127.0.0.1', '2015-12-06 12:13:30');
INSERT INTO `syslog` VALUES ('84', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=1&loginname=admin&phone=18707173376&sex=0&status=0&age=25&name=admin&usertype=0&organizationId=1&password=&roleIds=1&', '127.0.0.1', '2015-12-06 12:13:36');
INSERT INTO `syslog` VALUES ('85', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=13&_=1449375056669&', '127.0.0.1', '2015-12-06 12:13:40');
INSERT INTO `syslog` VALUES ('86', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=13&loginname=snoopy&phone=18707173376&sex=0&status=0&age=25&name=snoopy&usertype=1&organizationId=3&password=&roleIds=2&', '127.0.0.1', '2015-12-06 12:13:43');
INSERT INTO `syslog` VALUES ('87', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375056670&', '127.0.0.1', '2015-12-06 12:13:45');
INSERT INTO `syslog` VALUES ('88', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=&sex=0&status=0&age=0&name=dreamlu&usertype=1&organizationId=3&password=123456&roleIds=7&', '127.0.0.1', '2015-12-06 12:14:37');
INSERT INTO `syslog` VALUES ('89', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=13&_=1449375056671&', '127.0.0.1', '2015-12-06 12:14:41');
INSERT INTO `syslog` VALUES ('90', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=13&loginname=snoopy&phone=18707173376&sex=0&status=0&age=25&name=snoopy&usertype=1&organizationId=3&password=123456&roleIds=2&', '127.0.0.1', '2015-12-06 12:14:46');
INSERT INTO `syslog` VALUES ('91', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375056672&', '127.0.0.1', '2015-12-06 12:14:47');
INSERT INTO `syslog` VALUES ('92', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=0&name=dreamlu&usertype=1&organizationId=3&password=123456&roleIds=7&', '127.0.0.1', '2015-12-06 12:14:53');
INSERT INTO `syslog` VALUES ('93', 'admin', 'admin', '[类名]:OrganizationController,[方法]:addPage,[参数]:', null, '2015-12-06 12:15:13');
INSERT INTO `syslog` VALUES ('94', 'admin', 'admin', '[类名]:OrganizationController,[方法]:add,[参数]:icon=icon-folder&address=&name=产品部&seq=0&pid=&code=产品部&', '127.0.0.1', '2015-12-06 12:15:30');
INSERT INTO `syslog` VALUES ('95', 'admin', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=5&_=1449375056674&', '127.0.0.1', '2015-12-06 12:15:42');
INSERT INTO `syslog` VALUES ('96', 'admin', 'admin', '[类名]:OrganizationController,[方法]:edit,[参数]:id=5&icon=icon-company&address=&name=产品部&seq=0&pid=&code=03&', '127.0.0.1', '2015-12-06 12:15:50');
INSERT INTO `syslog` VALUES ('97', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375056675&', '127.0.0.1', '2015-12-06 12:15:58');
INSERT INTO `syslog` VALUES ('98', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=0&name=dreamlu&usertype=1&organizationId=5&password=&roleIds=7&', '127.0.0.1', '2015-12-06 12:16:01');
INSERT INTO `syslog` VALUES ('99', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375365022&', '127.0.0.1', '2015-12-06 12:16:12');
INSERT INTO `syslog` VALUES ('100', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=25&name=dreamlu&usertype=1&organizationId=5&password=&roleIds=7&', '127.0.0.1', '2015-12-06 12:16:15');
INSERT INTO `syslog` VALUES ('101', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=221&_=1449375365023&', '127.0.0.1', '2015-12-06 12:16:33');
INSERT INTO `syslog` VALUES ('102', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=221&icon=icon-company&status=0&name=日志管理&seq=0&pid=&resourcetype=0&url=/sysLog/manager&', '127.0.0.1', '2015-12-06 12:17:29');
INSERT INTO `syslog` VALUES ('103', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=1&_=1449375468115&', '127.0.0.1', '2015-12-06 12:18:30');
INSERT INTO `syslog` VALUES ('104', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221&', '127.0.0.1', '2015-12-06 12:18:36');
INSERT INTO `syslog` VALUES ('105', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=2&_=1449375468116&', '127.0.0.1', '2015-12-06 12:18:39');
INSERT INTO `syslog` VALUES ('106', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=2&resourceIds=13,131,132,133,134,221&', '127.0.0.1', '2015-12-06 12:18:55');
INSERT INTO `syslog` VALUES ('107', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=7&_=1449375468117&', '127.0.0.1', '2015-12-06 12:18:57');
INSERT INTO `syslog` VALUES ('108', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=7&resourceIds=14,141,142,143,221&', '127.0.0.1', '2015-12-06 12:19:13');
INSERT INTO `syslog` VALUES ('109', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:19:16');
INSERT INTO `syslog` VALUES ('110', 'snoopy', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:21:33');
INSERT INTO `syslog` VALUES ('111', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375726916&', '127.0.0.1', '2015-12-06 12:22:16');
INSERT INTO `syslog` VALUES ('112', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=25&name=dreamlu&usertype=1&organizationId=5&password=123456&roleIds=7&', '127.0.0.1', '2015-12-06 12:22:21');
INSERT INTO `syslog` VALUES ('113', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375726917&', '127.0.0.1', '2015-12-06 12:22:40');
INSERT INTO `syslog` VALUES ('114', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=25&name=dreamlu&usertype=1&organizationId=5&password=123456&roleIds=7&', '127.0.0.1', '2015-12-06 12:22:49');
INSERT INTO `syslog` VALUES ('115', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375726918&', '127.0.0.1', '2015-12-06 12:22:51');
INSERT INTO `syslog` VALUES ('116', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=25&name=dreamlu&usertype=1&organizationId=5&password=123456&roleIds=7&', '127.0.0.1', '2015-12-06 12:23:24');
INSERT INTO `syslog` VALUES ('117', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449375726919&', '127.0.0.1', '2015-12-06 12:23:31');
INSERT INTO `syslog` VALUES ('118', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=25&name=dreamlu&usertype=1&organizationId=5&password=admin&roleIds=7&', '127.0.0.1', '2015-12-06 12:23:36');
INSERT INTO `syslog` VALUES ('119', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:23:46');
INSERT INTO `syslog` VALUES ('120', 'dreamlu', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:24:07');
INSERT INTO `syslog` VALUES ('121', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=2&_=1449375852321&', '127.0.0.1', '2015-12-06 12:24:19');
INSERT INTO `syslog` VALUES ('122', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=2&_=1449375852322&', '127.0.0.1', '2015-12-06 12:25:03');
INSERT INTO `syslog` VALUES ('123', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=2&resourceIds=1,13,131,132,133,134,221&', '127.0.0.1', '2015-12-06 12:25:30');
INSERT INTO `syslog` VALUES ('124', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:25:32');
INSERT INTO `syslog` VALUES ('125', 'dreamlu', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:25:42');
INSERT INTO `syslog` VALUES ('126', 'admin', 'admin', '[类名]:UserController,[方法]:editPwdPage,[参数]:', null, '2015-12-06 12:25:51');
INSERT INTO `syslog` VALUES ('127', 'admin', 'admin', '[类名]:RoleController,[方法]:editPage,[参数]:id=7&_=1449375949053&', '127.0.0.1', '2015-12-06 12:25:57');
INSERT INTO `syslog` VALUES ('128', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=7&_=1449375949054&', '127.0.0.1', '2015-12-06 12:25:59');
INSERT INTO `syslog` VALUES ('129', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=7&resourceIds=1,14,141,142,143,221&', '127.0.0.1', '2015-12-06 12:26:03');
INSERT INTO `syslog` VALUES ('130', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:26:06');
INSERT INTO `syslog` VALUES ('131', 'dreamlu', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=1&_=1449375972808&', '127.0.0.1', '2015-12-06 12:26:19');
INSERT INTO `syslog` VALUES ('132', 'dreamlu', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:26:37');
INSERT INTO `syslog` VALUES ('133', 'snoopy', 'admin', '[类名]:UserController,[方法]:addPage,[参数]:', null, '2015-12-06 12:27:13');
INSERT INTO `syslog` VALUES ('134', 'snoopy', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=1&_=1449376026245&', '127.0.0.1', '2015-12-06 12:27:35');
INSERT INTO `syslog` VALUES ('135', 'snoopy', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:27:50');
INSERT INTO `syslog` VALUES ('136', 'admin', 'admin', '[类名]:UserController,[方法]:addPage,[参数]:', null, '2015-12-06 12:28:27');
INSERT INTO `syslog` VALUES ('137', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=1&_=1449376091840&', '127.0.0.1', '2015-12-06 12:29:44');
INSERT INTO `syslog` VALUES ('138', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=221&_=1449376091841&', '127.0.0.1', '2015-12-06 12:29:47');
INSERT INTO `syslog` VALUES ('139', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=221&icon=icon-company&status=0&name=日志管理&seq=1&pid=&resourcetype=0&url=/sysLog/manager&', '127.0.0.1', '2015-12-06 12:29:52');
INSERT INTO `syslog` VALUES ('140', 'admin', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=1&_=1449376091842&', '127.0.0.1', '2015-12-06 12:30:26');
INSERT INTO `syslog` VALUES ('141', 'admin', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=3&_=1449376091843&', '127.0.0.1', '2015-12-06 12:30:28');
INSERT INTO `syslog` VALUES ('142', 'admin', 'admin', '[类名]:OrganizationController,[方法]:edit,[参数]:id=3&icon=icon-company&address=&name=技术部&seq=1&pid=&code=02&', '127.0.0.1', '2015-12-06 12:30:30');
INSERT INTO `syslog` VALUES ('143', 'admin', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=5&_=1449376091844&', '127.0.0.1', '2015-12-06 12:30:34');
INSERT INTO `syslog` VALUES ('144', 'admin', 'admin', '[类名]:OrganizationController,[方法]:edit,[参数]:id=5&icon=icon-company&address=&name=产品部&seq=2&pid=&code=03&', '127.0.0.1', '2015-12-06 12:30:37');
INSERT INTO `syslog` VALUES ('145', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:31:04');
INSERT INTO `syslog` VALUES ('146', 'snoopy', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:31:29');
INSERT INTO `syslog` VALUES ('147', 'snoopy', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:36:12');
INSERT INTO `syslog` VALUES ('148', 'snoopy', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:36:42');
INSERT INTO `syslog` VALUES ('149', 'snoopy', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 12:39:16');
INSERT INTO `syslog` VALUES ('150', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=1&_=1449376768451&', '127.0.0.1', '2015-12-06 12:39:56');
INSERT INTO `syslog` VALUES ('151', 'admin', 'admin', '[类名]:ResourceController,[方法]:addPage,[参数]:', null, '2015-12-06 12:40:20');
INSERT INTO `syslog` VALUES ('152', 'admin', 'admin', '[类名]:ResourceController,[方法]:add,[参数]:icon=&status=0&name=视频教程&seq=0&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-06 12:40:42');
INSERT INTO `syslog` VALUES ('153', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=222&_=1449376846336&', '127.0.0.1', '2015-12-06 12:41:00');
INSERT INTO `syslog` VALUES ('154', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=222&_=1449376846337&', '127.0.0.1', '2015-12-06 12:41:04');
INSERT INTO `syslog` VALUES ('155', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=222&icon=&status=0&name=视频教程&seq=2&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-06 12:41:08');
INSERT INTO `syslog` VALUES ('156', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=222&_=1449376846338&', '127.0.0.1', '2015-12-06 12:41:20');
INSERT INTO `syslog` VALUES ('157', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=222&icon=icon-company&status=0&name=视频教程&seq=2&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-06 12:41:25');
INSERT INTO `syslog` VALUES ('158', 'admin', 'admin', '[类名]:ResourceController,[方法]:addPage,[参数]:', null, '2015-12-06 12:42:13');
INSERT INTO `syslog` VALUES ('159', 'admin', 'admin', '[类名]:ResourceController,[方法]:add,[参数]:icon=&status=0&name=官方网站&seq=0&pid=222&resourcetype=0&url=http://www.dreamlu.net/&', '127.0.0.1', '2015-12-06 12:42:42');
INSERT INTO `syslog` VALUES ('160', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=223&_=1449376846340&', '127.0.0.1', '2015-12-06 12:42:52');
INSERT INTO `syslog` VALUES ('161', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=223&icon=icon-folder&status=0&name=官方网站&seq=0&pid=222&resourcetype=0&url=http://www.dreamlu.net/&', '127.0.0.1', '2015-12-06 12:42:57');
INSERT INTO `syslog` VALUES ('162', 'admin', 'admin', '[类名]:ResourceController,[方法]:addPage,[参数]:', null, '2015-12-06 12:43:12');
INSERT INTO `syslog` VALUES ('163', 'admin', 'admin', '[类名]:ResourceController,[方法]:add,[参数]:icon=&status=0&name=JFinal2.0视频&seq=1&pid=222&resourcetype=0&url=http://blog.dreamlu.net/blog/79&', '127.0.0.1', '2015-12-06 12:45:28');
INSERT INTO `syslog` VALUES ('164', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=224&_=1449376846342&', '127.0.0.1', '2015-12-06 12:45:32');
INSERT INTO `syslog` VALUES ('165', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=224&icon=icon-folder&status=0&name=JFinal2.0视频&seq=1&pid=222&resourcetype=0&url=http://blog.dreamlu.net/blog/79&', '127.0.0.1', '2015-12-06 12:45:36');
INSERT INTO `syslog` VALUES ('166', 'admin', 'admin', '[类名]:ResourceController,[方法]:addPage,[参数]:', null, '2015-12-06 12:45:55');
INSERT INTO `syslog` VALUES ('167', 'admin', 'admin', '[类名]:ResourceController,[方法]:add,[参数]:icon=&status=0&name=JFinal2.0视频源码&seq=0&pid=222&resourcetype=0&url=http://git.oschina.net/596392912/JFinal2.0-beetl-training&', '127.0.0.1', '2015-12-06 12:47:00');
INSERT INTO `syslog` VALUES ('168', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=225&_=1449376846344&', '127.0.0.1', '2015-12-06 12:47:03');
INSERT INTO `syslog` VALUES ('169', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=225&icon=&status=0&name=JFinal2.0视频源码&seq=2&pid=222&resourcetype=0&url=http://git.oschina.net/596392912/JFinal2.0-beetl-training&', '127.0.0.1', '2015-12-06 12:47:09');
INSERT INTO `syslog` VALUES ('170', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=225&_=1449376846345&', '127.0.0.1', '2015-12-06 12:47:21');
INSERT INTO `syslog` VALUES ('171', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=225&icon=icon-folder&status=0&name=视频源码&seq=2&pid=222&resourcetype=0&url=http://git.oschina.net/596392912/JFinal2.0-beetl-training&', '127.0.0.1', '2015-12-06 12:47:30');
INSERT INTO `syslog` VALUES ('172', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=222&_=1449377269160&', '127.0.0.1', '2015-12-06 12:48:09');
INSERT INTO `syslog` VALUES ('173', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=222&icon=icon-company&status=0&name=视频教程&seq=1&pid=&resourcetype=0&url=&', '127.0.0.1', '2015-12-06 12:48:13');
INSERT INTO `syslog` VALUES ('174', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=221&_=1449377269161&', '127.0.0.1', '2015-12-06 12:48:15');
INSERT INTO `syslog` VALUES ('175', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=221&icon=icon-company&status=0&name=日志管理&seq=2&pid=&resourcetype=0&url=/sysLog/manager&', '127.0.0.1', '2015-12-06 12:48:19');
INSERT INTO `syslog` VALUES ('176', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=223&_=1449377269162&', '127.0.0.1', '2015-12-06 12:48:33');
INSERT INTO `syslog` VALUES ('177', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=224&_=1449377269163&', '127.0.0.1', '2015-12-06 12:48:36');
INSERT INTO `syslog` VALUES ('178', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=224&icon=icon-folder&status=0&name=JFinal视频&seq=1&pid=222&resourcetype=0&url=http://blog.dreamlu.net/blog/79&', '127.0.0.1', '2015-12-06 12:48:42');
INSERT INTO `syslog` VALUES ('179', 'admin', 'admin', '[类名]:ResourceController,[方法]:editPage,[参数]:id=224&_=1449377269164&', '127.0.0.1', '2015-12-06 12:48:53');
INSERT INTO `syslog` VALUES ('180', 'admin', 'admin', '[类名]:ResourceController,[方法]:edit,[参数]:id=224&icon=icon-folder&status=0&name=jfinal视频&seq=1&pid=222&resourcetype=0&url=http://blog.dreamlu.net/blog/79&', '127.0.0.1', '2015-12-06 12:49:01');
INSERT INTO `syslog` VALUES ('181', 'admin', 'admin', '[类名]:LoginController,[方法]:loginPost,[参数]:username=admin&password=admin&', '127.0.0.1', '2015-12-06 13:09:23');
INSERT INTO `syslog` VALUES ('182', 'admin', 'admin', '[类名]:ResourceController,[方法]:delete,[参数]:id=225&', '127.0.0.1', '2015-12-06 13:09:29');
INSERT INTO `syslog` VALUES ('183', 'admin', 'admin', '[类名]:RoleController,[方法]:addPage,[参数]:', null, '2015-12-06 13:09:42');
INSERT INTO `syslog` VALUES ('184', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=1&_=1449378563775&', '127.0.0.1', '2015-12-06 13:09:48');
INSERT INTO `syslog` VALUES ('185', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,222,223,224,221&', '127.0.0.1', '2015-12-06 13:09:53');
INSERT INTO `syslog` VALUES ('186', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=2&_=1449378563776&', '127.0.0.1', '2015-12-06 13:09:55');
INSERT INTO `syslog` VALUES ('187', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=2&resourceIds=1,13,131,132,133,134,222,223,224,221&', '127.0.0.1', '2015-12-06 13:09:59');
INSERT INTO `syslog` VALUES ('188', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=7&_=1449378563777&', '127.0.0.1', '2015-12-06 13:10:00');
INSERT INTO `syslog` VALUES ('189', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=7&resourceIds=1,14,141,142,143,222,223,224,221&', '127.0.0.1', '2015-12-06 13:10:04');
INSERT INTO `syslog` VALUES ('190', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 13:10:08');
INSERT INTO `syslog` VALUES ('191', 'admin', 'admin', '[类名]:RoleController,[方法]:addPage,[参数]:', null, '2015-12-06 13:10:28');
INSERT INTO `syslog` VALUES ('192', 'admin', 'admin', '[类名]:RoleController,[方法]:add,[参数]:status=0&description=测试账户&name=测试账户&seq=0&', '127.0.0.1', '2015-12-06 13:10:40');
INSERT INTO `syslog` VALUES ('193', 'admin', 'admin', '[类名]:UserController,[方法]:addPage,[参数]:', null, '2015-12-06 13:10:45');
INSERT INTO `syslog` VALUES ('194', 'admin', 'admin', '[类名]:UserController,[方法]:addPage,[参数]:', null, '2015-12-06 13:11:24');
INSERT INTO `syslog` VALUES ('195', 'admin', 'admin', '[类名]:OrganizationController,[方法]:addPage,[参数]:', null, '2015-12-06 13:11:27');
INSERT INTO `syslog` VALUES ('196', 'admin', 'admin', '[类名]:OrganizationController,[方法]:addPage,[参数]:', null, '2015-12-06 13:11:40');
INSERT INTO `syslog` VALUES ('197', 'admin', 'admin', '[类名]:OrganizationController,[方法]:editPage,[参数]:id=3&_=1449378619302&', '127.0.0.1', '2015-12-06 13:11:52');
INSERT INTO `syslog` VALUES ('198', 'admin', 'admin', '[类名]:OrganizationController,[方法]:addPage,[参数]:', null, '2015-12-06 13:11:56');
INSERT INTO `syslog` VALUES ('199', 'admin', 'admin', '[类名]:OrganizationController,[方法]:add,[参数]:icon=icon-folder&address=&name=测试组&seq=0&pid=3&code=04&', '127.0.0.1', '2015-12-06 13:12:18');
INSERT INTO `syslog` VALUES ('200', 'admin', 'admin', '[类名]:UserController,[方法]:addPage,[参数]:', null, '2015-12-06 13:12:28');
INSERT INTO `syslog` VALUES ('201', 'admin', 'admin', '[类名]:UserController,[方法]:addPage,[参数]:', null, '2015-12-06 13:12:36');
INSERT INTO `syslog` VALUES ('202', 'admin', 'admin', '[类名]:UserController,[方法]:add,[参数]:loginname=test&phone=&sex=0&status=0&age=25&name=test&usertype=1&organizationId=6&password=admin&roleIds=8&', '127.0.0.1', '2015-12-06 13:13:03');
INSERT INTO `syslog` VALUES ('203', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=15&_=1449378750752&', '127.0.0.1', '2015-12-06 13:13:11');
INSERT INTO `syslog` VALUES ('204', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=15&loginname=test&phone=18707173376&sex=0&status=0&age=25&name=test&usertype=1&organizationId=6&password=&roleIds=8&', '127.0.0.1', '2015-12-06 13:13:15');
INSERT INTO `syslog` VALUES ('205', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 13:13:20');
INSERT INTO `syslog` VALUES ('206', 'admin', 'admin', '[类名]:UserController,[方法]:editPwdPage,[参数]:', null, '2015-12-06 13:13:36');
INSERT INTO `syslog` VALUES ('207', 'admin', 'admin', '[类名]:UserController,[方法]:editUserPwd,[参数]:oldPwd=admin&rePwd=123456qaz&pwd=123456qaz&', '127.0.0.1', '2015-12-06 13:14:05');
INSERT INTO `syslog` VALUES ('208', 'admin', 'admin', '[类名]:RoleController,[方法]:grantPage,[参数]:id=8&_=1449378807806&', '127.0.0.1', '2015-12-06 13:14:16');
INSERT INTO `syslog` VALUES ('209', 'admin', 'admin', '[类名]:RoleController,[方法]:grant,[参数]:id=8&resourceIds=1,11,111,12,121,13,131,14,141,222,223,224,221&', '127.0.0.1', '2015-12-06 13:14:40');
INSERT INTO `syslog` VALUES ('210', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 13:14:43');
INSERT INTO `syslog` VALUES ('211', 'admin', 'admin', '[类名]:UserController,[方法]:editPwdPage,[参数]:', null, '2015-12-06 13:15:29');
INSERT INTO `syslog` VALUES ('212', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=15&_=1449378923020&', '127.0.0.1', '2015-12-06 13:15:37');
INSERT INTO `syslog` VALUES ('213', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=15&loginname=test&phone=18707173376&sex=0&status=0&age=25&name=test&usertype=1&organizationId=6&password=admin&roleIds=8&', '127.0.0.1', '2015-12-06 13:15:42');
INSERT INTO `syslog` VALUES ('214', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 13:15:52');
INSERT INTO `syslog` VALUES ('215', 'test', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 13:16:40');
INSERT INTO `syslog` VALUES ('216', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-06 13:17:18');
INSERT INTO `syslog` VALUES ('217', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=1&_=1449452930847&', '127.0.0.1', '2015-12-07 09:49:12');
INSERT INTO `syslog` VALUES ('218', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=1&loginname=admin&phone=18707173376&sex=0&status=0&age=25&name=admin&usertype=0&organizationId=1&password=test&roleIds=1&', '127.0.0.1', '2015-12-07 09:49:18');
INSERT INTO `syslog` VALUES ('219', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=13&_=1449452930848&', '127.0.0.1', '2015-12-07 09:49:20');
INSERT INTO `syslog` VALUES ('220', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=13&loginname=snoopy&phone=18707173376&sex=0&status=0&age=25&name=snoopy&usertype=1&organizationId=3&password=test&roleIds=2&', '127.0.0.1', '2015-12-07 09:49:26');
INSERT INTO `syslog` VALUES ('221', 'admin', 'admin', '[类名]:UserController,[方法]:editPage,[参数]:id=14&_=1449452930849&', '127.0.0.1', '2015-12-07 09:49:27');
INSERT INTO `syslog` VALUES ('222', 'admin', 'admin', '[类名]:UserController,[方法]:edit,[参数]:id=14&loginname=dreamlu&phone=18707173376&sex=0&status=0&age=25&name=dreamlu&usertype=1&organizationId=5&password=test&roleIds=7&', '127.0.0.1', '2015-12-07 09:49:32');
INSERT INTO `syslog` VALUES ('223', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-07 09:49:37');
INSERT INTO `syslog` VALUES ('224', 'admin', 'admin', '[类名]:LoginController,[方法]:logout,[参数]:null', '127.0.0.1', '2015-12-07 09:49:45');
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `sex` tinyint(2) NOT NULL DEFAULT '0',
  `age` tinyint(2) DEFAULT '0',
  `usertype` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `organization_id` int(11) NOT NULL DEFAULT '0',
  `createdate` datetime NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '0', '0', '1', '2015-12-06 13:14:05', '18707173376');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '1', '0', '3', '2015-10-01 13:12:07', '18707173376');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '1', '0', '5', '2015-10-11 23:12:58', '18707173376');
INSERT INTO `user` VALUES ('15', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '0', '25', '1', '0', '6', '2015-12-06 13:13:03', '18707173376');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(19) NOT NULL,
  `role_id` bigint(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('53', '15', '8');
INSERT INTO `user_role` VALUES ('54', '1', '1');
INSERT INTO `user_role` VALUES ('55', '1', '2');
INSERT INTO `user_role` VALUES ('56', '1', '7');
INSERT INTO `user_role` VALUES ('57', '13', '2');
INSERT INTO `user_role` VALUES ('58', '14', '7');
