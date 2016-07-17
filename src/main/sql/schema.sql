-- 数据库初始化脚本
-- 创建数据库
drop database if exists seckill;
create database seckill default charset utf8 collate utf8_general_ci;
-- 使用数据库
use seckill;
-- 创建秒杀库存表
drop table if exists seckill.seckill;
create table seckill.seckill (
`seckill_id` bigint NOT NULL AUTO_INCREMENT comment '商品库存id', 
`name` varchar(120) NOT NULL comment '商品名称',
`number` int NOT NULL comment '库存数量',
`start_time` timestamp NOT NULL default CURRENT_TIMESTAMP comment '秒杀开启时间',
`end_time` timestamp NOT NULL default CURRENT_TIMESTAMP comment '秒杀结束时间',
`create_time` timestamp NOT NULL default CURRENT_TIMESTAMP comment '创建时间',
primary key (seckill_id),
key idx_start_time (start_time),
key idx_end_time (end_time),
key idx_create_time (create_time)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

-- 初始化数据
insert into seckill.seckill(name, number, start_time, end_time)
values
   ('1000元秒杀iphone6',100,'2015-11-01 00:00:00','2015-11-02 00:00:00'),
   ('500元秒杀ipad2',200,'2015-11-01 00:00:00','2015-11-02 00:00:00'),
   ('300元秒杀小米4',300,'2015-11-01 00:00:00','2015-11-02 00:00:00'),
   ('200元秒杀红米note',400,'2015-11-01 00:00:00','2015-11-02 00:00:00');

select * from seckill.seckill;   

-- 秒杀成功明细表
-- 用户登录认证相关的信息
CREATE TABLE seckill.success_killed(
`seckill_id` bigint NOT NULL COMMENT '商品库存id',
`user_phone` bigint NOT NULL COMMENT '用户手机号',
`state` tinyint NOT NULL DEFAULT -1 COMMENT '状态标识：-1：无效 0：成功 1：已付款 2：已发货',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
PRIMARY KEY (seckill_id,user_phone),/*联合主键*/
key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="秒杀成功明细表";

-- 连接数据库控制台
mysql -uroot -p

-- 查看数据库表 
show tables;

-- 查看建表语句
show create table seckill.seckill
