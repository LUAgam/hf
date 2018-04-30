/*
Navicat MySQL Data Transfer

Source Server         : 192.168.169.132
Source Server Version : 50722
Source Host           : 192.168.169.132:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-01 07:01:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for AccountRecord
-- ----------------------------
DROP TABLE IF EXISTS `AccountRecord`;
CREATE TABLE `AccountRecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changemoney` varchar(255) DEFAULT NULL,
  `changetime` datetime DEFAULT NULL,
  `moneymsg` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(255) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_artba5wr1h4hn6l677cbgsdpb` (`business_id`),
  CONSTRAINT `FK_artba5wr1h4hn6l677cbgsdpb` FOREIGN KEY (`business_id`) REFERENCES `Business` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of AccountRecord
-- ----------------------------

-- ----------------------------
-- Table structure for Business
-- ----------------------------
DROP TABLE IF EXISTS `Business`;
CREATE TABLE `Business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `contacts` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `scale` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s9063enanygbqm77mdonb1yyr` (`user_id`),
  CONSTRAINT `FK_s9063enanygbqm77mdonb1yyr` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Business
-- ----------------------------
INSERT INTO `Business` VALUES ('1', '121212', '0', '安徽-合肥-蜀山区', null, 'www.guoao@foxmail.com', null, '4554545', '上海悦闻111', null, null, null, '3', '8b60c8fd-811e-4716-9d93-4ae5514d9414.png');

-- ----------------------------
-- Table structure for Comments
-- ----------------------------
DROP TABLE IF EXISTS `Comments`;
CREATE TABLE `Comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `ptjob_id` int(11) DEFAULT NULL,
  `ptuser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sw00s86crubn3u2909avqhfa4` (`business_id`),
  KEY `FK_kbh54fhy23pnmsd7m3w0y8ut7` (`parent_id`),
  KEY `FK_tp8wj2esbg8iclxt5c3j8sdo2` (`ptjob_id`),
  KEY `FK_9w5tk1w74mg0sjwjcdicjdw1w` (`ptuser_id`),
  CONSTRAINT `FK_9w5tk1w74mg0sjwjcdicjdw1w` FOREIGN KEY (`ptuser_id`) REFERENCES `Ptuser` (`id`),
  CONSTRAINT `FK_kbh54fhy23pnmsd7m3w0y8ut7` FOREIGN KEY (`parent_id`) REFERENCES `Comments` (`id`),
  CONSTRAINT `FK_sw00s86crubn3u2909avqhfa4` FOREIGN KEY (`business_id`) REFERENCES `Business` (`id`),
  CONSTRAINT `FK_tp8wj2esbg8iclxt5c3j8sdo2` FOREIGN KEY (`ptjob_id`) REFERENCES `Ptjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Comments
-- ----------------------------

-- ----------------------------
-- Table structure for ComplainRecord
-- ----------------------------
DROP TABLE IF EXISTS `ComplainRecord`;
CREATE TABLE `ComplainRecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complain` varchar(255) DEFAULT NULL,
  `complaintime` varchar(255) DEFAULT NULL,
  `handletime` varchar(255) DEFAULT NULL,
  `ptjobid` int(11) DEFAULT NULL,
  `ptuserid` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ComplainRecord
-- ----------------------------

-- ----------------------------
-- Table structure for JobApply
-- ----------------------------
DROP TABLE IF EXISTS `JobApply`;
CREATE TABLE `JobApply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applytime` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `ptjob_id` int(11) DEFAULT NULL,
  `ptuser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_45ns0g9j7pty2gcocggdm92hi` (`ptjob_id`),
  KEY `FK_ahprwr1xnh2q7q7x66nndjgj7` (`ptuser_id`),
  CONSTRAINT `FK_45ns0g9j7pty2gcocggdm92hi` FOREIGN KEY (`ptjob_id`) REFERENCES `Ptjob` (`id`),
  CONSTRAINT `FK_ahprwr1xnh2q7q7x66nndjgj7` FOREIGN KEY (`ptuser_id`) REFERENCES `Ptuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of JobApply
-- ----------------------------
INSERT INTO `JobApply` VALUES ('1', '2018-05-01 02:48:29', '2', '1', '1');
INSERT INTO `JobApply` VALUES ('2', '2018-05-01 06:39:26', '2', '2', '1');

-- ----------------------------
-- Table structure for JobCollection
-- ----------------------------
DROP TABLE IF EXISTS `JobCollection`;
CREATE TABLE `JobCollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colttime` datetime DEFAULT NULL,
  `ptjob_id` int(11) DEFAULT NULL,
  `ptuser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qa41f0k7vfc774kl97s9lcqqm` (`ptjob_id`),
  KEY `FK_ntu8i0xf7rl5fxjfbk4sp03uv` (`ptuser_id`),
  CONSTRAINT `FK_ntu8i0xf7rl5fxjfbk4sp03uv` FOREIGN KEY (`ptuser_id`) REFERENCES `Ptuser` (`id`),
  CONSTRAINT `FK_qa41f0k7vfc774kl97s9lcqqm` FOREIGN KEY (`ptjob_id`) REFERENCES `Ptjob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of JobCollection
-- ----------------------------
INSERT INTO `JobCollection` VALUES ('1', '2018-05-01 02:51:51', '1', '1');

-- ----------------------------
-- Table structure for JobVerify
-- ----------------------------
DROP TABLE IF EXISTS `JobVerify`;
CREATE TABLE `JobVerify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeenum` varchar(255) DEFAULT NULL,
  `undercarriagemsg` varchar(255) DEFAULT NULL,
  `ptjob_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_o31xs8qijvspk8udgmi0bsws6` (`ptjob_id`),
  CONSTRAINT `FK_o31xs8qijvspk8udgmi0bsws6` FOREIGN KEY (`ptjob_id`) REFERENCES `Ptjob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of JobVerify
-- ----------------------------
INSERT INTO `JobVerify` VALUES ('1', '1', null, '1');
INSERT INTO `JobVerify` VALUES ('2', '1', null, '2');

-- ----------------------------
-- Table structure for ManagerUser
-- ----------------------------
DROP TABLE IF EXISTS `ManagerUser`;
CREATE TABLE `ManagerUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mangername` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ManagerUser
-- ----------------------------
INSERT INTO `ManagerUser` VALUES ('1', '1', '1', null, null, '1');

-- ----------------------------
-- Table structure for Message
-- ----------------------------
DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromUserid` int(11) DEFAULT NULL,
  `messsage` varchar(255) DEFAULT NULL,
  `ptjobid` int(11) DEFAULT NULL,
  `sendtime` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `toUserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Message
-- ----------------------------
INSERT INTO `Message` VALUES ('1', '3', '您申请的兼职已我们已经同意了，请按照兼职的具体时间来参加兼职，多谢参与！', '1', '2018-05-01 02:51:00', '1', '2');
INSERT INTO `Message` VALUES ('2', '3', '您申请的职位已我们已经同意了，请按照职位的具体时间来参加职位，多谢参与！', '2', '2018-05-01 07:00:20', '0', '2');

-- ----------------------------
-- Table structure for Ptjob
-- ----------------------------
DROP TABLE IF EXISTS `Ptjob`;
CREATE TABLE `Ptjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enddate` datetime DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `jbadress` varchar(255) DEFAULT NULL,
  `jbdetails` text,
  `jbkind` varchar(255) DEFAULT NULL,
  `jbname` varchar(255) DEFAULT NULL,
  `jbtype` varchar(255) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `recnum` varchar(255) DEFAULT NULL,
  `releasetime` datetime DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `suggest` varchar(255) DEFAULT NULL,
  `worktime` varchar(255) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h4nrg56f96xphi1a562cwhi3v` (`business_id`),
  CONSTRAINT `FK_h4nrg56f96xphi1a562cwhi3v` FOREIGN KEY (`business_id`) REFERENCES `Business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Ptjob
-- ----------------------------
INSERT INTO `Ptjob` VALUES ('1', '2018-05-24 00:00:00', 'qita.png', '蜀山区', '<p>java</p>', '其他', 'java', '全职兼职', '31.784844', '117.233558', '18', '1', '2018-05-01 02:46:19', '1000', '2018-05-01 00:00:00', '1', '合肥市蜀山区明珠广场', '4', '1');
INSERT INTO `Ptjob` VALUES ('2', '2018-05-29 00:00:00', 'qita.png', '蜀山区', '<p>c++</p>', '其他', 'c++', '全职职位', '31.80495', '117.29683', '2', '11', '2018-05-01 06:37:53', '2222', '2018-05-01 00:00:00', '1', '合肥市包河区合肥南站', '3', '1');

-- ----------------------------
-- Table structure for Ptuser
-- ----------------------------
DROP TABLE IF EXISTS `Ptuser`;
CREATE TABLE `Ptuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `eamil` varchar(255) DEFAULT NULL,
  `experience` longtext,
  `height` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `resume` longtext,
  `school` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fujian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ojxx9vpfwkry0udf36i1xgiri` (`user_id`),
  CONSTRAINT `FK_ojxx9vpfwkry0udf36i1xgiri` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Ptuser
-- ----------------------------
INSERT INTO `Ptuser` VALUES ('1', '1995年06月20日', '安徽-合肥-蜀山区', null, '								\n			1				', '175', '/upload/tableExport.pdf', '郭奥门', '15205607212', null, '								\n			1				', '合肥学院', '男', '2', '毕业实习报告.docx');

-- ----------------------------
-- Table structure for ptuser_ptjob
-- ----------------------------
DROP TABLE IF EXISTS `ptuser_ptjob`;
CREATE TABLE `ptuser_ptjob` (
  `ptuser_id` int(11) NOT NULL,
  `ptjob_id` int(11) NOT NULL,
  PRIMARY KEY (`ptuser_id`,`ptjob_id`),
  KEY `FK_hrykf4y8j59e2v477qsoj4s6b` (`ptjob_id`),
  CONSTRAINT `FK_9p5ho0k070wcsq87vuiud9e72` FOREIGN KEY (`ptuser_id`) REFERENCES `Ptuser` (`id`),
  CONSTRAINT `FK_hrykf4y8j59e2v477qsoj4s6b` FOREIGN KEY (`ptjob_id`) REFERENCES `Ptjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ptuser_ptjob
-- ----------------------------

-- ----------------------------
-- Table structure for TopJobRecord
-- ----------------------------
DROP TABLE IF EXISTS `TopJobRecord`;
CREATE TABLE `TopJobRecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `State` varchar(255) DEFAULT NULL,
  `currentdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `ptjob_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f5t4mqtsvaijyyf7vedng124j` (`ptjob_id`),
  CONSTRAINT `FK_f5t4mqtsvaijyyf7vedng124j` FOREIGN KEY (`ptjob_id`) REFERENCES `Ptjob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of TopJobRecord
-- ----------------------------

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1', '1', '1', '1');
INSERT INTO `User` VALUES ('2', '1', '1', '15205607212');
INSERT INTO `User` VALUES ('3', '1', '2', '13818781192');
INSERT INTO `User` VALUES ('4', '1', '2', '15205607213');
