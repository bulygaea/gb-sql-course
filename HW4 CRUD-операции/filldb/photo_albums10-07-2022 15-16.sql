#
# TABLE STRUCTURE FOR: photo_albums
#

DROP TABLE IF EXISTS `photo_albums`;

CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('1', 'tempora', '1001');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('2', 'dicta', '1002');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('3', 'reiciendis', '1003');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('4', 'et', '1004');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('5', 'distinctio', '1005');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('6', 'voluptate', '1007');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('7', 'dolor', '1009');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('8', 'totam', '1011');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('9', 'aut', '1014');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('10', 'minus', '1015');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('11', 'consequatur', '1016');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('12', 'odit', '1017');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('13', 'velit', '1018');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('14', 'eos', '1020');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('15', 'non', '1021');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('16', 'dolores', '1022');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('17', 'consequatur', '1023');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('18', 'suscipit', '1024');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('19', 'corrupti', '1026');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('20', 'est', '1027');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('21', 'odio', '1028');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('22', 'sit', '1029');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('23', 'non', '1031');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('24', 'et', '1032');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('25', 'nisi', '1033');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('26', 'distinctio', '1035');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('27', 'error', '1036');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('28', 'tempora', '1037');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('29', 'fugiat', '1038');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('30', 'repudiandae', '1039');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('31', 'nesciunt', '1040');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('32', 'laudantium', '1041');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('33', 'nisi', '1044');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('34', 'sunt', '1048');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('35', 'voluptates', '1049');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('36', 'pariatur', '1051');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('37', 'repudiandae', '1052');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('38', 'consequuntur', '1053');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('39', 'earum', '1054');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('40', 'et', '1055');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('41', 'deserunt', '1056');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('42', 'provident', '1060');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('43', 'inventore', '1063');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('44', 'animi', '1066');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('45', 'aspernatur', '1067');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('46', 'eum', '1068');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('47', 'qui', '1069');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('48', 'ipsum', '1070');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('49', 'consequatur', '1071');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('50', 'voluptatem', '1077');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('51', 'doloribus', '1078');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('52', 'rem', '1079');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('53', 'ut', '1081');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('54', 'maiores', '1084');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('55', 'cumque', '1086');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('56', 'est', '1087');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('57', 'sit', '1090');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('58', 'mollitia', '1091');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('59', 'quia', '1093');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('60', 'et', '1094');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('61', 'veniam', '1095');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('62', 'praesentium', '1096');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('63', 'officiis', '1098');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('64', 'qui', '1099');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('65', 'natus', '1100');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('66', 'quam', '1101');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('67', 'reprehenderit', '1102');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('68', 'nesciunt', '1105');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('69', 'doloremque', '1107');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('70', 'dolore', '1108');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('71', 'necessitatibus', '1109');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('72', 'ipsa', '1110');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('73', 'aspernatur', '1112');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('74', 'maiores', '1113');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('75', 'velit', '1115');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('76', 'et', '1116');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('77', 'voluptas', '1118');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('78', 'non', '1120');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('79', 'molestiae', '1124');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('80', 'saepe', '1128');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('81', 'dolores', '1130');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('82', 'voluptas', '1132');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('83', 'molestiae', '1133');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('84', 'voluptas', '1135');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('85', 'libero', '1137');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('86', 'dolorem', '1139');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('87', 'sequi', '1141');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('88', 'dolores', '1142');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('89', 'aperiam', '1144');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('90', 'rem', '1145');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('91', 'molestiae', '1146');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('92', 'dolor', '1147');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('93', 'dolorem', '1149');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('94', 'eum', '1152');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('95', 'qui', '1153');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('96', 'deleniti', '1156');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('97', 'aut', '1157');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('98', 'possimus', '1160');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('99', 'aspernatur', '1162');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('100', 'occaecati', '1166');


