SET NAMES 'utf8';
DROP DATABASE IF EXISTS lol_ionic;
CREATE DATABASE lol_ionic CHARSET=UTF8;
USE lol_ionic;
CREATE TABLE lol_dish(
    did INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    price FLOAT(6,2),
    img_sm VARCHAR(64),
    img_lg VARCHAR(64),
    detail VARCHAR(2048),
    material VARCHAR(2048)
);
INSERT INTO lol_dish(did,img_sm,img_lg,name,price,material,detail) VALUES
(   null,
    'alan.jpg',
    'alan-l.jpg',
    '【奥利安娜】',
    36,
    '发条魔灵',
    '法师,qwer...... '
),
(   null,
    'jks.jpg',
        'jks-l.jpg',
        '【暴走萝莉】',
        16.5,
        '金克斯',
        '射手,能够用q技能切换形态不断输出'
),
(   null,
    'mf.jpg',
        'mf-l.jpg',
        '【赏金猎人】',
        32,
        '厄运小姐',
        '射手,能用e不断消耗,用大招哈哈哈...'
),
(   null,
   'sona.jpg',
       'sona-l.jpg',
       '【琴瑟仙女】',
       6.5,
       '娑娜',
       '辅助,q消耗 w加血 e加速/减速 大招控制'
),
(   null,
   'vn.jpg',
       'vn-l.jpg',
       '【暗夜猎手】',
       32,
       '薇恩',
       '射手,坦克杀手,w第三下触发真实伤害'
),
(   null,
    'xdl.jpg',
        'xdl-l.jpg',
        '【暗黑元首】',
        25,
        '辛德拉',
        '法师,w能够抓取非友方生物.'
);
##SELECT * FROM lol_dish;
/*用户表*/
CREATE TABLE lol_users(
    userid INT PRIMARY KEY AUTO_INCREMENT, /*购物车编号*/
    uname VARCHAR(20),                     /*用户名*/
    pwd VARCHAR(20),                       /*密码*/
    phone VARCHAR(20)                      /*电话*/
);
INSERT INTO lol_users VALUES
(NULL,'mary','11111','13111112345'),
(NULL,'john','33333','13819196547');
/*订单表*/
CREATE TABLE lol_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,     /*订单ID*/
    userid INT,                             /*用户*/
    phone VARCHAR(16),                      /*联系电话*/
    user_name VARCHAR(16),                  /*收货方用户名*/
    order_time LONG,                        /*下单时间*/
    addr VARCHAR(256),                      /*订单地址*/
    totalprice FLOAT(6,2)                   /*订单总价*/
);
INSERT INTO lol_order VALUES
(NULL,1,'13501234567','wx',1445154859209,'艾欧尼亚',20.5),
(NULL,1,'13501257543','小苍',1445154997543,'祖安',12.5),
(NULL,2,'13207654321','Uzi',1445254997612,'祖安',55),
(NULL,2,'13899999999','卷毛',1445354959209,'艾欧尼亚',35),
(NULL,3,'13683675299','faker',1445355889209,'艾欧尼亚',45);
/**购物车表**/
CREATE TABLE lol_cart(
    ctid INT PRIMARY KEY AUTO_INCREMENT, /*购物车编号*/
    userid INT,                          /*用户编号：假定有用户id为 1 和 3 的两个用户有数据*/
    did INT,                             /*产品编号*/
    dishCount INT                      /*数量*/
);
INSERT INTO lol_cart VALUES (1,1,1,1),
(2,1,2,4),
(3,1,5,2),
(4,3,2,10),
(5,3,6,1);
##SELECT * FROM lol_order;
/**订单详情表**/
CREATE TABLE lol_orderdetails(
    oid INT ,                            /*订单编号*/
    did INT,                             /*产品id*/
    dishCount INT,                     /*购买数量*/
    price FLOAT(8,2)                     /*产品单价：需要记载，因为产品价格可能波动*/
);
INSERT INTO lol_orderdetails VALUES (1,1,2,5),
(1,2,1,10.5),
(2,3,1,12.5),
(3,1,3,5),
(3,2,4,10),
(4,4,7,5),
(5,5,5,4),
(5,6,2,12.5);
