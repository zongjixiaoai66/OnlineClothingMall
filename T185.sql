/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t185`;
CREATE DATABASE IF NOT EXISTS `t185` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t185`;

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int NOT NULL COMMENT '创建用户',
  `address_name` varchar(200) NOT NULL COMMENT '收货人 ',
  `address_phone` varchar(200) NOT NULL COMMENT '电话 ',
  `address_dizhi` varchar(200) NOT NULL COMMENT '地址 ',
  `isdefault_types` int NOT NULL COMMENT '是否默认地址 ',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='收货地址';

DELETE FROM `address`;
INSERT INTO `address` (`id`, `yonghu_id`, `address_name`, `address_phone`, `address_dizhi`, `isdefault_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, 2, '收货人1', '17703786901', '地址1', 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(2, 3, '收货人2', '17703786902', '地址2', 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(3, 2, '收货人3', '17703786903', '地址3', 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(4, 1, '收货人4', '17703786904', '地址4', 2, '2022-03-15 12:08:17', '2022-03-15 12:27:20', '2022-03-15 12:08:17'),
	(5, 1, '收货人5', '17703786905', '地址5', 1, '2022-03-15 12:08:17', '2022-03-15 12:27:14', '2022-03-15 12:08:17');

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int DEFAULT NULL COMMENT '所属用户',
  `fuzhuang_id` int DEFAULT NULL COMMENT '服装',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='购物车';

DELETE FROM `cart`;
INSERT INTO `cart` (`id`, `yonghu_id`, `fuzhuang_id`, `buy_number`, `create_time`, `update_time`, `insert_time`) VALUES
	(3, 1, 3, 1, '2024-05-14 07:54:03', NULL, '2024-05-14 07:54:03');

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/fuzhuangshangcheng/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/fuzhuangshangcheng/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/fuzhuangshangcheng/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-03-15 12:07:07'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-03-15 12:07:07'),
	(3, 'huiyuandengji_types', '会员等级类型', 1, '青铜会员', NULL, '0.98', '2022-03-15 12:07:07'),
	(4, 'huiyuandengji_types', '会员等级类型', 2, '白银会员', NULL, '0.96', '2022-03-15 12:07:07'),
	(5, 'huiyuandengji_types', '会员等级类型', 3, '黄金会员', NULL, '0.95', '2022-03-15 12:07:07'),
	(6, 'shangxia_types', '上下架', 1, '上架', NULL, NULL, '2022-03-15 12:07:07'),
	(7, 'shangxia_types', '上下架', 2, '下架', NULL, NULL, '2022-03-15 12:07:07'),
	(8, 'fuzhuang_types', '服装类型', 1, '服装类型1', NULL, NULL, '2022-03-15 12:07:07'),
	(9, 'fuzhuang_types', '服装类型', 2, '服装类型2', NULL, NULL, '2022-03-15 12:07:07'),
	(10, 'fuzhuang_types', '服装类型', 3, '服装类型3', NULL, NULL, '2022-03-15 12:07:07'),
	(11, 'fuzhuang_types', '服装类型', 4, '服装类型4', NULL, NULL, '2022-03-15 12:07:07'),
	(12, 'fuzhuang_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2022-03-15 12:07:07'),
	(13, 'fuzhuang_order_types', '订单类型', 1, '已评价', NULL, NULL, '2022-03-15 12:07:07'),
	(14, 'fuzhuang_order_types', '订单类型', 2, '退款', NULL, NULL, '2022-03-15 12:07:07'),
	(15, 'fuzhuang_order_types', '订单类型', 3, '已支付', NULL, NULL, '2022-03-15 12:07:07'),
	(16, 'fuzhuang_order_types', '订单类型', 4, '已发货', NULL, NULL, '2022-03-15 12:07:07'),
	(17, 'fuzhuang_order_types', '订单类型', 5, '已收货', NULL, NULL, '2022-03-15 12:07:07'),
	(18, 'fuzhuang_order_payment_types', '订单支付类型', 1, '现金', NULL, NULL, '2022-03-15 12:07:07'),
	(19, 'fuzhuang_order_payment_types', '订单支付类型', 2, '积分', NULL, NULL, '2022-03-15 12:07:07'),
	(20, 'isdefault_types', '是否默认地址', 1, '否', NULL, NULL, '2022-03-15 12:07:07'),
	(21, 'isdefault_types', '是否默认地址', 2, '是', NULL, NULL, '2022-03-15 12:07:07'),
	(22, 'gonggao_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-03-15 12:07:07'),
	(23, 'gonggao_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-03-15 12:07:07'),
	(24, 'gonggao_types', '公告类型', 3, '公告类型3', NULL, '', '2022-03-15 12:28:38');

DROP TABLE IF EXISTS `fuzhuang`;
CREATE TABLE IF NOT EXISTS `fuzhuang` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `fuzhuang_name` varchar(200) DEFAULT NULL COMMENT '服装名称  Search111 ',
  `fuzhuang_photo` varchar(200) DEFAULT NULL COMMENT '服装照片',
  `fuzhuang_types` int DEFAULT NULL COMMENT '服装类型 Search111',
  `fuzhuang_kucun_number` int DEFAULT NULL COMMENT '服装库存',
  `fuzhuang_price` int DEFAULT NULL COMMENT '购买获得积分 ',
  `fuzhuang_old_money` decimal(10,2) DEFAULT NULL COMMENT '服装原价 ',
  `fuzhuang_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价/积分 ',
  `fuzhuang_clicknum` int DEFAULT NULL COMMENT '点击次数 ',
  `fuzhuang_content` text COMMENT '服装简介 ',
  `shangxia_types` int DEFAULT NULL COMMENT '是否上架 ',
  `fuzhuang_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='服装';

DELETE FROM `fuzhuang`;
INSERT INTO `fuzhuang` (`id`, `fuzhuang_name`, `fuzhuang_photo`, `fuzhuang_types`, `fuzhuang_kucun_number`, `fuzhuang_price`, `fuzhuang_old_money`, `fuzhuang_new_money`, `fuzhuang_clicknum`, `fuzhuang_content`, `shangxia_types`, `fuzhuang_delete`, `create_time`) VALUES
	(1, '服装名称1', 'http://localhost:8080/fuzhuangshangcheng/upload/fuzhuang1.jpg', 4, 101, 462, 587.42, 250.05, 227, '服装简介1', 1, 1, '2022-03-15 12:08:17'),
	(2, '服装名称2', 'http://localhost:8080/fuzhuangshangcheng/upload/fuzhuang2.jpg', 2, 100, 134, 655.37, 222.62, 210, '服装简介2', 1, 1, '2022-03-15 12:08:17'),
	(3, '服装名称3', 'http://localhost:8080/fuzhuangshangcheng/upload/fuzhuang3.jpg', 4, 103, 242, 987.64, 208.31, 93, '服装简介3', 1, 1, '2022-03-15 12:08:17'),
	(4, '服装名称4', 'http://localhost:8080/fuzhuangshangcheng/upload/fuzhuang4.jpg', 1, 104, 101, 568.81, 341.70, 333, '服装简介4', 1, 1, '2022-03-15 12:08:17'),
	(5, '服装名称5', 'http://localhost:8080/fuzhuangshangcheng/upload/fuzhuang5.jpg', 1, 102, 123, 865.33, 203.98, 13, '服装简介5', 1, 1, '2022-03-15 12:08:17');

DROP TABLE IF EXISTS `fuzhuang_collection`;
CREATE TABLE IF NOT EXISTS `fuzhuang_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fuzhuang_id` int DEFAULT NULL COMMENT '服装',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `fuzhuang_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='服装收藏';

DELETE FROM `fuzhuang_collection`;
INSERT INTO `fuzhuang_collection` (`id`, `fuzhuang_id`, `yonghu_id`, `fuzhuang_collection_types`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(2, 2, 1, 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(3, 3, 1, 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(4, 4, 1, 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(5, 5, 3, 1, '2022-03-15 12:08:17', '2022-03-15 12:08:17');

DROP TABLE IF EXISTS `fuzhuang_commentback`;
CREATE TABLE IF NOT EXISTS `fuzhuang_commentback` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fuzhuang_id` int DEFAULT NULL COMMENT '服装',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `fuzhuang_commentback_text` text COMMENT '评价内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='服装评价';

DELETE FROM `fuzhuang_commentback`;
INSERT INTO `fuzhuang_commentback` (`id`, `fuzhuang_id`, `yonghu_id`, `fuzhuang_commentback_text`, `insert_time`, `reply_text`, `update_time`, `create_time`) VALUES
	(1, 1, 2, '评价内容1', '2022-03-15 12:08:17', '回复信息1', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(2, 2, 2, '评价内容2', '2022-03-15 12:08:17', '回复信息2', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(3, 3, 2, '评价内容3', '2022-03-15 12:08:17', '回复信息3', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(4, 4, 1, '评价内容4', '2022-03-15 12:08:17', '回复信息4', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(5, 5, 3, '评价内容5', '2022-03-15 12:08:17', '回复信息5', '2022-03-15 12:08:17', '2022-03-15 12:08:17'),
	(6, 2, 1, '质量挺好的', '2022-03-15 12:31:04', '感谢您的关注', '2022-03-15 12:31:30', '2022-03-15 12:31:04');

DROP TABLE IF EXISTS `fuzhuang_order`;
CREATE TABLE IF NOT EXISTS `fuzhuang_order` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fuzhuang_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `address_id` int DEFAULT NULL COMMENT '收获地址 ',
  `fuzhuang_id` int DEFAULT NULL COMMENT '服装',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `fuzhuang_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `fuzhuang_order_courier_name` varchar(200) DEFAULT NULL COMMENT '快递公司',
  `fuzhuang_order_courier_number` varchar(200) DEFAULT NULL COMMENT '订单快递单号',
  `fuzhuang_order_types` int DEFAULT NULL COMMENT '订单类型',
  `fuzhuang_order_payment_types` int DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='服装订单';

DELETE FROM `fuzhuang_order`;
INSERT INTO `fuzhuang_order` (`id`, `fuzhuang_order_uuid_number`, `address_id`, `fuzhuang_id`, `yonghu_id`, `buy_number`, `fuzhuang_order_true_price`, `fuzhuang_order_courier_name`, `fuzhuang_order_courier_number`, `fuzhuang_order_types`, `fuzhuang_order_payment_types`, `insert_time`, `create_time`) VALUES
	(1, '1647347181774', 4, 1, 1, 1, 250.05, NULL, NULL, 2, 2, '2022-03-15 12:26:22', '2022-03-15 12:26:22'),
	(2, '1647347252276', 4, 5, 1, 3, 599.70, '圆通快递', '12415623', 4, 1, '2022-03-15 12:27:32', '2022-03-15 12:27:32'),
	(3, '1647347252276', 4, 2, 1, 2, 436.34, '申通快递', '1245341', 1, 1, '2022-03-15 12:27:32', '2022-03-15 12:27:32');

DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE IF NOT EXISTS `gonggao` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int NOT NULL COMMENT '公告类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告发布时间 ',
  `gonggao_content` text COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告信息';

DELETE FROM `gonggao`;
INSERT INTO `gonggao` (`id`, `gonggao_name`, `gonggao_photo`, `gonggao_types`, `insert_time`, `gonggao_content`, `create_time`) VALUES
	(1, '公告名称1', 'http://localhost:8080/fuzhuangshangcheng/upload/gonggao1.jpg', 2, '2022-03-15 12:08:17', '公告详情1', '2022-03-15 12:08:17'),
	(2, '公告名称2', 'http://localhost:8080/fuzhuangshangcheng/upload/gonggao2.jpg', 2, '2022-03-15 12:08:17', '公告详情2', '2022-03-15 12:08:17'),
	(3, '公告名称3', 'http://localhost:8080/fuzhuangshangcheng/upload/gonggao3.jpg', 2, '2022-03-15 12:08:17', '公告详情3', '2022-03-15 12:08:17'),
	(4, '公告名称4', 'http://localhost:8080/fuzhuangshangcheng/upload/gonggao4.jpg', 2, '2022-03-15 12:08:17', '公告详情4', '2022-03-15 12:08:17'),
	(5, '公告名称5', 'http://localhost:8080/fuzhuangshangcheng/upload/gonggao5.jpg', 1, '2022-03-15 12:08:17', '公告详情5', '2022-03-15 12:08:17');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', '075k571utj9dbgq2iltll1iw7plbm0tg', '2022-03-15 12:23:00', '2024-05-14 08:52:22'),
	(2, 1, 'a1', 'yonghu', '用户', 'billh5jemh3jdk0egxmisnv0mfbnkt3e', '2022-03-15 12:25:18', '2024-05-14 08:53:34');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_sum_jifen` decimal(10,2) DEFAULT NULL COMMENT '总积分',
  `yonghu_new_jifen` decimal(10,2) DEFAULT NULL COMMENT '现积分',
  `huiyuandengji_types` int DEFAULT NULL COMMENT '会员等级',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_phone`, `yonghu_id_number`, `yonghu_photo`, `sex_types`, `yonghu_email`, `new_money`, `yonghu_sum_jifen`, `yonghu_new_jifen`, `huiyuandengji_types`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/fuzhuangshangcheng/upload/yonghu1.jpg', 2, '1@qq.com', 10528.45, 1545.40, 1114.07, 1, '2022-03-15 12:08:17'),
	(2, '用户2', '123456', '用户姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/fuzhuangshangcheng/upload/yonghu2.jpg', 2, '2@qq.com', 608.17, 547.75, 324.86, 1, '2022-03-15 12:08:17'),
	(3, '用户3', '123456', '用户姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/fuzhuangshangcheng/upload/yonghu3.jpg', 2, '3@qq.com', 543.65, 736.10, 74.74, 1, '2022-03-15 12:08:17');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
