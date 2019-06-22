

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(255) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `profile_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Investor');
INSERT INTO `category` VALUES ('2', 'Contact-manager');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(255) NOT NULL AUTO_INCREMENT,
  `comment_branch_of_forum` varchar(250) NOT NULL,
  `comment_date_of_change` date NOT NULL,
  `comment_time_of_change` datetime NOT NULL,
  `comment_text` varchar(250) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `profile_id` (`profile_id`) USING BTREE,
  CONSTRAINT `comment_pp` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'Fresh news', '2014-11-25', '2014-11-25 21:18:23.000000', 'so interesting', '1');
INSERT INTO `comment` VALUES ('2', 'FAQ', '2014-11-20', '2014-11-20 21:42:51.000000', 'useful', '2');
INSERT INTO `comment` VALUES ('3', 'Prices', '2014-11-21', '2014-11-21 21:43:05.000000', 'wtf?!', '3');

-- ----------------------------
-- Table structure for investment
-- ----------------------------
DROP TABLE IF EXISTS `investment`;
CREATE TABLE `investment` (
  `investment_id` int(255) NOT NULL AUTO_INCREMENT,
  `investment_contract_number` int(255) NOT NULL,
  `object_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`investment_id`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `investment_pp` (`profile_id`),
  CONSTRAINT `investment_pp` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `investment_oo` FOREIGN KEY (`object_id`) REFERENCES `object` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of investment
-- ----------------------------
INSERT INTO `investment` VALUES ('1', '5123151', '1', '1');
INSERT INTO `investment` VALUES ('2', '5516516', '1', '1');
INSERT INTO `investment` VALUES ('3', '5621533', '2', '2');
INSERT INTO `investment` VALUES ('4', '4566138', '2', '2');
INSERT INTO `investment` VALUES ('5', '8815531', '3', '3');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_subject` varchar(250) NOT NULL,
  `message_date` date NOT NULL,
  `message_text` varchar(250) NOT NULL,
  `message_sender_profile_id` int(11) NOT NULL,
  `message_recipient_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `profile_id` (`message_sender_profile_id`,`message_recipient_profile_id`),
  KEY `message_mrp` (`message_recipient_profile_id`),
  CONSTRAINT `message_mrp` FOREIGN KEY (`message_recipient_profile_id`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `message_msp` FOREIGN KEY (`message_sender_profile_id`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'buying', '2014-11-19', 'want to buy', '1', '3');
INSERT INTO `message` VALUES ('2', 'meeting', '2014-11-21', 'want to meet', '2', '3');
INSERT INTO `message` VALUES ('3', 'askingfor question', '2014-11-20', 'how to arrange a meeting with conatct-manager', '2', '1');


-- ----------------------------
-- Table structure for object
-- ----------------------------
DROP TABLE IF EXISTS `object`;
CREATE TABLE `object` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(250) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `investment_id` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of object
-- ----------------------------
INSERT INTO `object` VALUES ('1', 'new building 1');
INSERT INTO `object` VALUES ('2', 'new building 2 ');
INSERT INTO `object` VALUES ('3', 'new building 3');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `operation_id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_type_name` varchar(250) NOT NULL,
  `operation_summ` int(11) NOT NULL,
  `operation_date` date NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`operation_id`),
  KEY `operation_pp` (`profile_id`),
  CONSTRAINT `operation_pp` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('1', 'payment', '1000', '2014-11-19', '1');
INSERT INTO `operation` VALUES ('2', 'payment', '1250', '2014-11-20', '2');
INSERT INTO `operation` VALUES ('3', 'transaction', '2250', '2014-11-20', '3');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_login` varchar(250) NOT NULL,
  `profile_password` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `profile_cc` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'ololosh', '123456', '1');
INSERT INTO `profile` VALUES ('2', 'ololoev', '234567', '1');
INSERT INTO `profile` VALUES ('3', 'Nick23', 'qwerty', '2');







