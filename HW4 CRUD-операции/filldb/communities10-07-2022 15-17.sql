#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('1', 'et', '1001');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('2', 'ut', '1002');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('3', 'ipsa', '1003');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('4', 'et', '1004');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('5', 'aut', '1005');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('6', 'illum', '1007');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('7', 'eligendi', '1009');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('8', 'vel', '1011');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('9', 'et', '1014');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('10', 'voluptatem', '1015');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('11', 'amet', '1016');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('12', 'hic', '1017');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('13', 'reprehenderit', '1018');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('14', 'qui', '1020');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('15', 'voluptatem', '1021');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('16', 'voluptatem', '1022');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('17', 'suscipit', '1023');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('18', 'commodi', '1024');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('19', 'sint', '1026');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('20', 'occaecati', '1027');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('21', 'culpa', '1028');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('22', 'numquam', '1029');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('23', 'porro', '1031');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('24', 'illo', '1032');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('25', 'vero', '1033');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('26', 'nam', '1035');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('27', 'similique', '1036');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('28', 'veritatis', '1037');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('29', 'nobis', '1038');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('30', 'est', '1039');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('31', 'ut', '1040');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('32', 'molestiae', '1041');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('33', 'natus', '1044');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('34', 'reiciendis', '1048');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('35', 'suscipit', '1049');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('36', 'dolores', '1051');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('37', 'sit', '1052');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('38', 'eius', '1053');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('39', 'id', '1054');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('40', 'quos', '1055');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('41', 'quia', '1056');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('42', 'et', '1060');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('43', 'iure', '1063');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('44', 'vitae', '1066');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('45', 'sit', '1067');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('46', 'enim', '1068');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('47', 'quasi', '1069');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('48', 'quia', '1070');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('49', 'et', '1071');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('50', 'non', '1077');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('51', 'dolorem', '1078');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('52', 'fuga', '1079');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('53', 'nostrum', '1081');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('54', 'asperiores', '1084');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('55', 'nostrum', '1086');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('56', 'quaerat', '1087');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('57', 'vero', '1090');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('58', 'voluptatem', '1091');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('59', 'aut', '1093');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('60', 'omnis', '1094');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('61', 'assumenda', '1095');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('62', 'minima', '1096');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('63', 'fuga', '1098');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('64', 'eveniet', '1099');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('65', 'similique', '1100');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('66', 'et', '1101');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('67', 'recusandae', '1102');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('68', 'sed', '1105');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('69', 'illum', '1107');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('70', 'aliquid', '1108');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('71', 'ex', '1109');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('72', 'provident', '1110');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('73', 'ex', '1112');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('74', 'sunt', '1113');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('75', 'expedita', '1115');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('76', 'corrupti', '1116');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('77', 'debitis', '1118');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('78', 'debitis', '1120');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('79', 'natus', '1124');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('80', 'facere', '1128');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('81', 'ut', '1130');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('82', 'cum', '1132');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('83', 'temporibus', '1133');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('84', 'aliquam', '1135');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('85', 'aut', '1137');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('86', 'atque', '1139');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('87', 'nihil', '1141');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('88', 'tempora', '1142');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('89', 'autem', '1144');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('90', 'necessitatibus', '1145');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('91', 'aut', '1146');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('92', 'esse', '1147');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('93', 'quis', '1149');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('94', 'vitae', '1152');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('95', 'vel', '1153');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('96', 'voluptatem', '1156');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('97', 'quia', '1157');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('98', 'accusamus', '1160');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('99', 'iure', '1162');
INSERT INTO `communities` (`id`, `name`, `admin_user_id`) VALUES ('100', 'ea', '1166');


