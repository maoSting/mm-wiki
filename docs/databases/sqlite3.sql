/*
 Navicat Premium Data Transfer

 Source Server         : mm-wiki
 Source Server Type    : SQLite
 Source Server Version : 2008017
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 2008017
 File Encoding         : 65001

 Date: 16/09/2020 11:17:48
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for mw_attachment
-- ----------------------------
DROP TABLE "mw_attachment";
CREATE TABLE "mw_attachment" (
  "attachment_id" integer(8) NOT NULL,
  "user_id" integer(8),
  "document_id" integer(8),
  "name" TEXT(255),
  "path" TEXT(255),
  "source" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("attachment_id")
);

-- ----------------------------
-- Records of mw_attachment
-- ----------------------------
INSERT INTO "mw_attachment" VALUES (1, 1, 3, '220px-Chou_Chuan-huing_2.jpg', 'images/1/3/220px-Chou_Chuan-huing_2.jpg', 1, 1600054935, 1600054935);

-- ----------------------------
-- Table structure for mw_collection
-- ----------------------------
DROP TABLE "mw_collection";
CREATE TABLE "mw_collection" (
  "collection_id" integer(8) NOT NULL,
  "user_id" integer(8),
  "type" integer(2),
  "resource_id" integer(8),
  "create_time" integer(8),
  PRIMARY KEY ("collection_id")
);

-- ----------------------------
-- Table structure for mw_config
-- ----------------------------
DROP TABLE "mw_config";
CREATE TABLE "mw_config" (
  "config_id" integer(8) NOT NULL,
  "name" TEXT(255),
  "key" TEXT(255),
  "value" TEXT(255),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("config_id")
);

-- ----------------------------
-- Records of mw_config
-- ----------------------------
INSERT INTO "mw_config" VALUES (1, '主页标题', 'main_title', '这里可以填写公司名称，例如：欢迎来到 XXXX 科技公司 wiki 平台！', 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (2, '主页描述', 'main_description', '这是写一些描述：请使用域账号登录，使用中有任何问题请联系管理员 root@xxx.com！', 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (3, '是否开启自动关注', 'auto_follow_doc_open', NULL, 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (4, '是否开启邮件通知', 'send_email_open', NULL, 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (5, '是否开启统一登录', 'sso_open', NULL, 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (6, '开启全文搜索', 'fulltext_search_open', 1, 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (7, '索引更新间隔', 'doc_search_timer', 3600, 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (8, '系统名称', 'system_name', 'Markdown Mini Wiki', 1599820465, 1599820465);
INSERT INTO "mw_config" VALUES (9, '系统版本号', 'system_version', 'v0.2.0', 1599820465, 1599820465);

-- ----------------------------
-- Table structure for mw_contact
-- ----------------------------
DROP TABLE "mw_contact";
CREATE TABLE "mw_contact" (
  "contact_id" integer(8) NOT NULL,
  "name" TEXT(255),
  "mobile" TEXT(255),
  "email" TEXT(255),
  "position" TEXT(255),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("contact_id")
);

-- ----------------------------
-- Table structure for mw_document
-- ----------------------------
DROP TABLE "mw_document";
CREATE TABLE "mw_document" (
  "document_id" integer(8) NOT NULL,
  "parent_id" integer(8),
  "space_id" integer(8),
  "name" TEXT(255),
  "type" integer(2),
  "path" TEXT(255),
  "sequence" integer(8),
  "create_user_id" integer(8),
  "edit_user_id" integer(8),
  "is_delete" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("document_id")
);

-- ----------------------------
-- Records of mw_document
-- ----------------------------
INSERT INTO "mw_document" VALUES (1, 0, 1, '内地', 2, 0, 1, 1, 1, 0, 1599820731, 1599820731);
INSERT INTO "mw_document" VALUES (2, 1, 1, '周杰伦', 2, '0,1', 1, 1, 1, 0, 1599820755, 1599820811);
INSERT INTO "mw_document" VALUES (3, 1, 1, '小刚', 1, '0,1', 2, 1, 1, 0, 1599832157, 1600054958);

-- ----------------------------
-- Table structure for mw_email
-- ----------------------------
DROP TABLE "mw_email";
CREATE TABLE "mw_email" (
  "email_id" integer(10) NOT NULL,
  "name" TEXT(255),
  "sender_address" TEXT(255),
  "sender_name" TEXT(255),
  "sender_title_prefix" TEXT(255),
  "host" TEXT(255),
  "port" integer(4),
  "username" TEXT(255),
  "password" TEXT(255),
  "is_ssl" integer(2),
  "is_used" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("email_id")
);

-- ----------------------------
-- Table structure for mw_follow
-- ----------------------------
DROP TABLE "mw_follow";
CREATE TABLE "mw_follow" (
  "follow_id" integer(8) NOT NULL,
  "user_id" integer(8),
  "type" integer(2),
  "object_id" integer(8),
  "create_time" integer(8),
  PRIMARY KEY ("follow_id")
);

-- ----------------------------
-- Records of mw_follow
-- ----------------------------
INSERT INTO "mw_follow" VALUES (1, 1, 1, 2, 1599820811);
INSERT INTO "mw_follow" VALUES (2, 1, 1, 3, 1599832198);

-- ----------------------------
-- Table structure for mw_link
-- ----------------------------
DROP TABLE "mw_link";
CREATE TABLE "mw_link" (
  "link_id" integer(8) NOT NULL,
  "name" TEXT(255),
  "url" TEXT(255),
  "sequence" integer(8),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("link_id")
);

-- ----------------------------
-- Table structure for mw_log
-- ----------------------------
DROP TABLE "mw_log";
CREATE TABLE "mw_log" (
  "log_id" integer(20) NOT NULL,
  "level" integer(2),
  "path" TEXT(255),
  "get" TEXT(255),
  "post" TEXT(255),
  "message" TEXT(255),
  "ip" TEXT(255),
  "user_agent" TEXT(255),
  "referer" TEXT(255),
  "user_id" integer(8),
  "username" TEXT(255),
  "create_time" integer(8),
  PRIMARY KEY ("log_id")
);

-- ----------------------------
-- Records of mw_log
-- ----------------------------
INSERT INTO "mw_log" VALUES (1, 6, '/author/login', '/author/login', '{"username":["adminwiki"]}', '登录成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/author/index', 1, 'adminwiki', 1599820575);
INSERT INTO "mw_log" VALUES (2, 6, '/system/space/save', '/system/space/save', '{"description":[""],"is_share":["1"],"name":["内地"],"space_id":[""],"tags":[""],"visit_level":["public"]}', '添加空间 1 成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/system/space/add', 1, 'adminwiki', 1599820732);
INSERT INTO "mw_log" VALUES (3, 6, '/document/save', '/document/save', '{"name":["周杰伦"],"parent_id":["1"],"space_id":["1"],"type":["2"]}', '创建文档 2 成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/document/add?space_id=1&parent_id=1', 1, 'adminwiki', 1599820755);
INSERT INTO "mw_log" VALUES (4, 6, '/page/modify', '/page/modify', '{"comment":[""],"document_id":["2"],"is_follow_doc":["1"],"is_notice_user":["0"],"name":["周杰伦"]}', '修改文档 2 成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/page/edit?document_id=2', 1, 'adminwiki', 1599820811);
INSERT INTO "mw_log" VALUES (5, 6, '/author/logout', '/author/logout', '{}', '退出成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/', 1, 'adminwiki', 1599820902);
INSERT INTO "mw_log" VALUES (6, 6, '/author/login', '/author/login', '{"username":["adminwiki"]}', '登录成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/author/index', 1, 'adminwiki', 1599832038);
INSERT INTO "mw_log" VALUES (7, 6, '/document/save', '/document/save', '{"name":["小刚"],"parent_id":["1"],"space_id":["1"],"type":["1"]}', '创建文档 3 成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/document/add?space_id=1&parent_id=1', 1, 'adminwiki', 1599832157);
INSERT INTO "mw_log" VALUES (8, 6, '/page/modify', '/page/modify', '{"comment":[""],"document_id":["3"],"is_follow_doc":["1"],"is_notice_user":["0"],"name":["小刚"]}', '修改文档 3 成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'http://xhprof.fujuhaofang.com/page/edit?document_id=3', 1, 'adminwiki', 1599832198);
INSERT INTO "mw_log" VALUES (9, 6, '/author/login', '/author/login', '{"username":["adminwiki"]}', '登录成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'http://xhprof.fujuhaofang.com/author/index', 1, 'adminwiki', 1600050238);
INSERT INTO "mw_log" VALUES (10, 6, '/image/upload', '/image/upload?document_id=3&guid=1600054922707', '{}', '文档 3 上传图片 220px-Chou_Chuan-huing_2.jpg 成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'http://xhprof.fujuhaofang.com/page/edit?document_id=3', 1, 'adminwiki', 1600054935);
INSERT INTO "mw_log" VALUES (11, 6, '/page/modify', '/page/modify', '{"comment":["添加照片"],"document_id":["3"],"is_follow_doc":["1"],"is_notice_user":["0"],"name":["小刚"]}', '修改文档 3 成功', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36', 'http://xhprof.fujuhaofang.com/page/edit?document_id=3', 1, 'adminwiki', 1600054958);

-- ----------------------------
-- Table structure for mw_log_document
-- ----------------------------
DROP TABLE "mw_log_document";
CREATE TABLE "mw_log_document" (
  "log_document_id" integer(8) NOT NULL,
  "document_id" integer(8),
  "space_id" integer(8),
  "user_id" integer(8),
  "action" integer(2),
  "comment" TEXT(255),
  "create_time" integer(8),
  PRIMARY KEY ("log_document_id")
);

-- ----------------------------
-- Records of mw_log_document
-- ----------------------------
INSERT INTO "mw_log_document" VALUES (1, 1, 1, 1, 1, '创建了文档', 1599820732);
INSERT INTO "mw_log_document" VALUES (2, 2, 1, 1, 1, '创建了文档', 1599820755);
INSERT INTO "mw_log_document" VALUES (3, 2, 1, 1, 2, NULL, 1599820811);
INSERT INTO "mw_log_document" VALUES (4, 3, 1, 1, 1, '创建了文档', 1599832157);
INSERT INTO "mw_log_document" VALUES (5, 3, 1, 1, 2, NULL, 1599832198);
INSERT INTO "mw_log_document" VALUES (6, 3, 1, 1, 2, '上传了图片 220px-Chou_Chuan-huing_2.jpg', 1600054935);
INSERT INTO "mw_log_document" VALUES (7, 3, 1, 1, 2, '添加照片', 1600054958);

-- ----------------------------
-- Table structure for mw_login_auth
-- ----------------------------
DROP TABLE "mw_login_auth";
CREATE TABLE "mw_login_auth" (
  "login_auth_id" integer(8) NOT NULL,
  "name" TEXT(255),
  "username_prefix" TEXT(255),
  "url" TEXT(255),
  "ext_data" TEXT(255),
  "is_used" integer(2),
  "is_delete" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("login_auth_id")
);

-- ----------------------------
-- Table structure for mw_privilege
-- ----------------------------
DROP TABLE "mw_privilege";
CREATE TABLE "mw_privilege" (
  "privilege_id" integer(8) NOT NULL,
  "name" TEXT(255),
  "parent_id" integer(8),
  "type" TEXT(255),
  "controller" TEXT(255),
  "action" TEXT(255),
  "icon" TEXT(255),
  "target" TEXT(255),
  "is_display" integer(2),
  "sequence" integer(8),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("privilege_id")
);

-- ----------------------------
-- Records of mw_privilege
-- ----------------------------
INSERT INTO "mw_privilege" VALUES (1, '个人中心', 0, 'menu', NULL, NULL, 'glyphicon-leaf', NULL, 1, 1, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (2, '个人资料', 1, 'controller', 'profile', 'info', 'glyphicon-list', NULL, 1, 11, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (3, '修改资料', 1, 'controller', 'profile', 'edit', 'glyphicon-list', NULL, 0, 12, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (4, '修改资料保存', 1, 'controller', 'profile', 'modify', 'glyphicon-list', NULL, 0, 13, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (5, '关注用户列表', 1, 'controller', 'profile', 'followUser', 'glyphicon-list', NULL, 0, 14, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (6, '关注文档列表', 1, 'controller', 'profile', 'followDoc', 'glyphicon-list', NULL, 0, 15, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (7, '我的活动', 1, 'controller', 'profile', 'activity', 'glyphicon-list', NULL, 1, 16, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (8, '修改密码', 1, 'controller', 'profile', 'password', 'glyphicon-list', NULL, 1, 17, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (9, '修改密码保存', 1, 'controller', 'profile', 'savePass', 'glyphicon-list', NULL, 0, 18, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (10, '用户管理', 1, 'menu', NULL, NULL, 'glyphicon-user', NULL, 1, 2, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (11, '添加用户', 10, 'controller', 'user', 'add', 'glyphicon-list', NULL, 1, 21, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (12, '添加用户保存', 10, 'controller', 'user', 'save', 'glyphicon-list', NULL, 0, 22, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (13, '用户列表', 10, 'controller', 'user', 'list', 'glyphicon-list', NULL, 1, 23, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (14, '修改用户', 10, 'controller', 'user', 'edit', 'glyphicon-list', NULL, 0, 24, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (15, '修改用户保存', 10, 'controller', 'user', 'modify', 'glyphicon-list', NULL, 0, 25, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (16, '屏蔽用户', 10, 'controller', 'user', 'forbidden', 'glyphicon-list', NULL, 0, 26, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (17, '恢复用户', 10, 'controller', 'user', 'recover', 'glyphicon-list', NULL, 0, 27, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (18, '用户详情', 10, 'controller', 'user', 'info', 'glyphicon-list', NULL, 0, 28, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (19, '角色管理', 1, 'menu', NULL, NULL, 'glyphicon-gift', NULL, 1, 3, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (20, '添加角色', 19, 'controller', 'role', 'add', 'glyphicon-list', NULL, 1, 31, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (21, '添加角色保存', 19, 'controller', 'role', 'save', 'glyphicon-list', NULL, 0, 32, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (22, '角色列表', 19, 'controller', 'role', 'list', 'glyphicon-list', NULL, 1, 33, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (23, '修改角色', 19, 'controller', 'role', 'edit', 'glyphicon-list', NULL, 0, 34, 1599820462, 1599820462);
INSERT INTO "mw_privilege" VALUES (24, '修改角色保存', 19, 'controller', 'role', 'modify', 'glyphicon-list', NULL, 0, 35, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (25, '角色用户列表', 19, 'controller', 'role', 'user', 'glyphicon-list', NULL, 0, 36, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (26, '角色权限', 19, 'controller', 'role', 'privilege', 'glyphicon-list', NULL, 0, 37, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (27, '角色权限保存', 19, 'controller', 'role', 'grantPrivilege', 'glyphicon-list', NULL, 0, 38, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (28, '删除角色', 19, 'controller', 'role', 'delete', 'glyphicon-list', NULL, 0, 29, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (29, '重置用户角色', 19, 'controller', 'role', 'resetUser', 'glyphicon-list', NULL, 0, 310, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (30, '权限管理', 1, 'menu', NULL, NULL, 'glyphicon-lock', NULL, 1, 4, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (31, '添加权限', 30, 'controller', 'privilege', 'add', 'glyphicon-list', NULL, 1, 41, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (32, '添加权限保存', 30, 'controller', 'privilege', 'save', 'glyphicon-list', NULL, 0, 42, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (33, '权限列表', 30, 'controller', 'privilege', 'list', 'glyphicon-list', NULL, 1, 43, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (34, '修改权限', 30, 'controller', 'privilege', 'edit', 'glyphicon-list', NULL, 0, 44, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (35, '修改权限保存', 30, 'controller', 'privilege', 'modify', 'glyphicon-list', NULL, 0, 45, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (36, '删除权限', 30, 'controller', 'privilege', 'delete', 'glyphicon-list', NULL, 0, 46, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (37, '空间管理', 1, 'menu', NULL, NULL, 'glyphicon-th-large', NULL, 1, 5, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (38, '添加空间', 37, 'controller', 'space', 'add', 'glyphicon-list', NULL, 1, 51, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (39, '添加空间保存', 37, 'controller', 'space', 'save', 'glyphicon-list', NULL, 0, 52, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (40, '空间列表', 37, 'controller', 'space', 'list', 'glyphicon-list', NULL, 1, 53, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (41, '修改空间', 37, 'controller', 'space', 'edit', 'glyphicon-list', NULL, 0, 54, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (42, '修改空间保存', 37, 'controller', 'space', 'modify', 'glyphicon-list', NULL, 0, 55, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (43, '空间成员列表', 37, 'controller', 'space', 'member', 'glyphicon-list', NULL, 0, 56, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (44, '添加空间成员', 37, 'controller', 'space_user', 'save', 'glyphicon-list', NULL, 0, 57, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (45, '移除空间成员', 37, 'controller', 'space_user', 'remove', 'glyphicon-list', NULL, 0, 58, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (46, '更新空间成员权限', 37, 'controller', 'space_user', 'modify', 'glyphicon-list', NULL, 0, 59, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (47, '删除空间', 37, 'controller', 'space', 'delete', 'glyphicon-list', NULL, 0, 510, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (48, '空间备份', 37, 'controller', 'space', 'download', 'glyphicon-list', NULL, 0, 512, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (49, '日志管理', 1, 'menu', NULL, NULL, 'glyphicon-list-alt', NULL, 1, 6, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (50, '系统日志', 49, 'controller', 'log', 'system', 'glyphicon-list', NULL, 1, 61, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (51, '系统日志详情', 49, 'controller', 'log', 'info', 'glyphicon-list', NULL, 0, 62, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (52, '文档日志', 49, 'controller', 'log', 'document', 'glyphicon-list', NULL, 1, 63, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (53, '配置管理', 1, 'menu', NULL, NULL, 'glyphicon-cog', NULL, 1, 7, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (54, '全局配置', 53, 'controller', 'config', 'global', 'glyphicon-list', NULL, 1, 71, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (55, '全局配置保存', 53, 'controller', 'config', 'modify', 'glyphicon-list', NULL, 0, 72, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (56, '邮箱配置', 53, 'controller', 'email', 'list', 'glyphicon-list', NULL, 1, 73, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (57, '添加邮件服务器', 53, 'controller', 'email', 'add', 'glyphicon-list', NULL, 0, 74, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (58, '添加邮件服务器保存', 53, 'controller', 'email', 'save', 'glyphicon-list', NULL, 0, 75, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (59, '修改邮件服务器', 53, 'controller', 'email', 'edit', 'glyphicon-list', NULL, 0, 76, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (60, '修改邮件服务器保存', 53, 'controller', 'email', 'modify', 'glyphicon-list', NULL, 0, 77, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (61, '启用邮件服务器', 53, 'controller', 'email', 'used', 'glyphicon-list', NULL, 0, 78, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (62, '删除邮件服务器', 53, 'controller', 'email', 'delete', 'glyphicon-list', NULL, 0, 79, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (63, '登录认证', 53, 'controller', 'auth', 'list', 'glyphicon-list', NULL, 1, 81, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (64, '添加登录认证', 53, 'controller', 'auth', 'add', 'glyphicon-list', NULL, 0, 82, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (65, '添加登录认证保存', 53, 'controller', 'auth', 'save', 'glyphicon-list', NULL, 0, 83, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (66, '修改登录认证', 53, 'controller', 'auth', 'edit', 'glyphicon-list', NULL, 0, 84, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (67, '修改登录认证保存', 53, 'controller', 'auth', 'modify', 'glyphicon-list', NULL, 0, 85, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (68, '删除登录认证', 53, 'controller', 'auth', 'delete', 'glyphicon-list', NULL, 0, 86, 1599820463, 1599820463);
INSERT INTO "mw_privilege" VALUES (69, '启用登录认证', 53, 'controller', 'auth', 'used', 'glyphicon-list', NULL, 0, 87, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (70, '登录认证文档', 53, 'controller', 'auth', 'doc', 'glyphicon-list', NULL, 0, 88, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (71, '系统管理', 1, 'menu', NULL, NULL, 'glyphicon-link', NULL, 1, 8, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (72, '快捷链接', 71, 'controller', 'link', 'list', 'glyphicon-list', NULL, 1, 81, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (73, '添加链接', 71, 'controller', 'link', 'add', 'glyphicon-list', NULL, 0, 82, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (74, '添加链接保存', 71, 'controller', 'link', 'save', 'glyphicon-list', NULL, 0, 83, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (75, '修改链接', 71, 'controller', 'link', 'edit', 'glyphicon-list', NULL, 0, 84, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (76, '修改链接保存', 71, 'controller', 'link', 'modify', 'glyphicon-list', NULL, 0, 85, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (77, '删除链接', 71, 'controller', 'link', 'delete', 'glyphicon-list', NULL, 0, 86, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (78, '系统联系人', 71, 'controller', 'contact', 'list', 'glyphicon-list', NULL, 1, 91, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (79, '添加联系人', 71, 'controller', 'contact', 'add', 'glyphicon-list', NULL, 0, 92, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (80, '添加联系人保存', 71, 'controller', 'contact', 'save', 'glyphicon-list', NULL, 0, 93, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (81, '修改联系人', 71, 'controller', 'contact', 'edit', 'glyphicon-list', NULL, 0, 94, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (82, '修改联系人保存', 71, 'controller', 'contact', 'modify', 'glyphicon-list', NULL, 0, 95, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (83, '删除联系人', 71, 'controller', 'contact', 'delete', 'glyphicon-list', NULL, 0, 96, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (84, '统计管理', 1, 'menu', NULL, NULL, 'glyphicon-signal', NULL, 1, 9, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (85, '数据统计', 84, 'controller', 'static', 'default', 'glyphicon-list', NULL, 1, 91, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (86, 'ajax获取空间文档排行', 84, 'controller', 'static', 'spaceDocsRank', 'glyphicon-list', NULL, 0, 92, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (87, 'ajax获取收藏文档排行', 84, 'controller', 'static', 'collectDocRank', 'glyphicon-list', NULL, 0, 93, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (88, 'ajax获取文档数量增长趋势', 84, 'controller', 'static', 'docCountByTime', 'glyphicon-list', NULL, 0, 94, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (89, '系统监控', 84, 'controller', 'static', 'monitor', 'glyphicon-list', NULL, 1, 95, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (90, 'ajax获取服务器状态', 84, 'controller', 'static', 'serverStatus', 'glyphicon-list', NULL, 0, 96, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (91, 'ajax获取服务器时间', 84, 'controller', 'static', 'serverTime', 'glyphicon-list', NULL, 0, 97, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (92, '测试邮件服务器', 53, 'controller', 'email', 'test', 'glyphicon-list', NULL, 0, 80, 1599820464, 1599820464);
INSERT INTO "mw_privilege" VALUES (93, '导入联系人', 71, 'controller', 'contact', 'import', 'glyphicon-list', NULL, 0, 97, 1599820464, 1599820464);

-- ----------------------------
-- Table structure for mw_role
-- ----------------------------
DROP TABLE "mw_role";
CREATE TABLE "mw_role" (
  "role_id" integer(8) NOT NULL,
  "name" TEXT(255),
  "type" integer(2),
  "is_delete" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("role_id")
);

-- ----------------------------
-- Records of mw_role
-- ----------------------------
INSERT INTO "mw_role" VALUES (1, '超级管理员', 1, 0, 1599820462, 1599820462);
INSERT INTO "mw_role" VALUES (2, '管理员', 1, 0, 1599820462, 1599820462);
INSERT INTO "mw_role" VALUES (3, '普通用户', 1, 0, 1599820462, 1599820462);

-- ----------------------------
-- Table structure for mw_role_privilege
-- ----------------------------
DROP TABLE "mw_role_privilege";
CREATE TABLE "mw_role_privilege" (
  "role_privilege_id" integer(8) NOT NULL,
  "role_id" integer(8),
  "privilege_id" integer(8),
  "create_time" integer(8),
  PRIMARY KEY ("role_privilege_id")
);

-- ----------------------------
-- Records of mw_role_privilege
-- ----------------------------
INSERT INTO "mw_role_privilege" VALUES (1, 3, 1, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (2, 3, 2, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (3, 3, 3, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (4, 3, 4, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (5, 3, 5, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (6, 3, 6, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (7, 3, 7, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (8, 3, 8, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (9, 3, 9, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (10, 2, 1, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (11, 2, 2, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (12, 2, 3, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (13, 2, 4, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (14, 2, 5, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (15, 2, 6, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (16, 2, 7, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (17, 2, 8, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (18, 2, 9, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (19, 2, 37, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (20, 2, 38, 1599820464);
INSERT INTO "mw_role_privilege" VALUES (21, 2, 39, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (22, 2, 40, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (23, 2, 41, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (24, 2, 42, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (25, 2, 43, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (26, 2, 44, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (27, 2, 45, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (28, 2, 46, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (29, 2, 47, 1599820465);
INSERT INTO "mw_role_privilege" VALUES (30, 2, 48, 1599820465);

-- ----------------------------
-- Table structure for mw_space
-- ----------------------------
DROP TABLE "mw_space";
CREATE TABLE "mw_space" (
  "space_id" integer(8) NOT NULL,
  "name" TEXT(255),
  "description" TEXT(255),
  "tags" TEXT(255),
  "visit_level" TEXT(255),
  "is_share" integer(2),
  "is_export" integer(2),
  "is_delete" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("space_id")
);

-- ----------------------------
-- Records of mw_space
-- ----------------------------
INSERT INTO "mw_space" VALUES (1, '内地', NULL, NULL, 'public', 1, 0, 0, 1599820731, 1599820731);

-- ----------------------------
-- Table structure for mw_space_user
-- ----------------------------
DROP TABLE "mw_space_user";
CREATE TABLE "mw_space_user" (
  "space_user_id" integer(8) NOT NULL,
  "user_id" integer(8),
  "space_id" integer(8),
  "privilege" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("space_user_id")
);

-- ----------------------------
-- Records of mw_space_user
-- ----------------------------
INSERT INTO "mw_space_user" VALUES (1, 1, 1, 2, 1599820732, 1599820732);

-- ----------------------------
-- Table structure for mw_user
-- ----------------------------
DROP TABLE "mw_user";
CREATE TABLE "mw_user" (
  "user_id" integer(8) NOT NULL,
  "username" TEXT(255),
  "password" TEXT(255),
  "given_name" TEXT(255),
  "mobile" TEXT(255),
  "phone" TEXT(255),
  "email" TEXT(255),
  "department" TEXT(255),
  "position" TEXT(255),
  "location" TEXT(255),
  "im" TEXT(255),
  "last_ip" TEXT(255),
  "last_time" TEXT(255),
  "role_id" integer(2),
  "is_forbidden" integer(2),
  "is_delete" integer(2),
  "create_time" integer(8),
  "update_time" integer(8),
  PRIMARY KEY ("user_id")
);

-- ----------------------------
-- Records of mw_user
-- ----------------------------
INSERT INTO "mw_user" VALUES (1, 'adminwiki', 'e10adc3949ba59abbe56e057f20f883e', 'adminwiki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 1600050238, 1, 0, 0, 1599820462, 1600050238);

PRAGMA foreign_keys = true;
