-----------------------------基础查询语法---------------------
-- change database
use database_name

-- get info
show databases;
show tables;
show columns from table_name; // show table structure
show create table table_name;  //  show create table sql sentence

-- create table
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- query table limit 5 and offset 2
SELECT * from AC_USER limit 2, 5

-- distinct selection
SELECT DISTINCT `name` from AC_USER;

-- multiple distinct selection
SELECT DISTINCT `name`, `class` from AC_USER;

-- sort selection
SELECT `id`, `name`, `age`
  FROM AC_USER
  ORDER BY `id`
  LIMIT 10;

-- mulitple sort selection
SELECT `id`, `name`, `age`
  FROM AC_USER
  ORDER BY `id`, `name` DESC
  LIMIT 10;
  
-- filter data and where query
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE name = 'tom'
  LIMIT 10;
  
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE age BETWEEN 12 and 18
  LIMIT 10;
  
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE name is null;
  
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE name = 'tom' AND name = 'jake';
  
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE age = 'tom' OR name = 'jake';
  
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE age IN (12, 15, 17);
  
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE age NOT IN (12, 15, 17);
 
-- t% ,%表示任意多个字符，_t_,_表示任意单个字符
SELECT `id`, `name`, `age`
  FROM AC_USER
  WHERE name LIKE 't%'
-- 利用正则查询匹配的记录
SELECT * from AC_USER_ORDER WHERE order_id REGEXP '3630'
SELECT * from AC_USER_ORDER WHERE order_id REGEXP 'app | sang'

-- create concatenate fields
SELECT * FROM user;
-- +---------+----------------+-----------------+-------------+------------+----------+--------------+
-- | user_id | user_name      | user_address    | user_city   | user_state | user_age | user_country |
-- +---------+----------------+-----------------+-------------+------------+----------+--------------+
-- |    1001 | yanwei R Us    | 123 Main Street | Southfield  | MI         | 15       | USA          |
-- |    1002 | LT Supplies    | 500 Park Street | Anytown     | OH         | 22       | USA          |
-- |    1003 | ACME           | 555 High Street | Los Angeles | CA         | 16       | USA          |
-- |    1004 | Furball Inc.   | 1000 5th Avenue | New York    | NY         | 32       | USA          |
-- |    1005 | Jet Set        | 42 Galaxy Road  | London      | NULL       | 55       | England      |
-- |    1006 | Jouets Et Ours | 1 Rue Amusement | Paris       | NULL       | 24       | France       |
-- +---------+----------------+-----------------+-------------+------------+----------+--------------+
-- Trim()去除左右空格，RTtim（）去除右空格
SELECT Concat(Trim(user_name), '(',RTrim(user_country),')',user_age+1) as user_info
FROM user
-- +-------------------------------------------+
-- | Concat(vend_name, '(', vend_country ,')') |
-- +-------------------------------------------+
-- | ACME(USA)                                 |
-- | yanwei R Us(USA)                          |
-- | Furball Inc.(USA)                         |
-- | Jet Set(England)                          |
-- | Jouets Et Ours(France)                    |
-- | LT Supplies(USA)                          |
-- +-------------------------------------------+

-- 数据处理函数
SELECT name, Upper(name) AS name_uppercase
  FROM user;
  
--- String function
-- Left(str, len)           | 返回最左边len长度的子串
-- Right(str, len)          | 返回最右边len长度的子串
-- Length(str)              | 返回字符串存储长度
-- Lower(str)               | 全部转换为小写
-- Upper(str)               | 全部转换为大写
-- Reverse(str)             | 字符串倒序
  
--- date function 
SELECT id, order_num FROM orders WHERE Date(order_date) = '2018-09-01';
SELECT id, order_num FROM orders WHERE Year(order_date) = 2005 AND Month(order_date) = 9;
-- AddDate(expr, days)    | add time values (intervals) to a date value
-- AddTime(expr1, expr2)  | add time
-- Now()                  | return datetime
-- CurDate()              | return current date
-- CurTime()              | return current time
-- Date(expr)             | return date part of expr
-- Time(expr)             | return time part of expr
-- Year(expr)             | return year part of expr
-- Month(expr)            | return month part of expr
-- Day(expr)              | return day part of expr
-- Hour(expr)             | return hour part of expr
-- Minute(expr)           | return minute part of expr
-- Second(expr)           | return second part of expr
-- DayOfWeek(expr)        | return day of expr
-- DateDiff(expr1, expr2) | return expr1 - expr2

-- aggregate function
-- Avg()
-- Count()
-- Max()
-- Min()
-- Sum()

------分组查询 GROUP  HAVING
-- +---------+---------+----------------+------------+----------------------------------------------------------------+
-- | prod_id | vend_id | prod_name      | prod_price | prod_desc                                                      |
-- +---------+---------+----------------+------------+----------------------------------------------------------------+
-- | ANV01   |    1001 | .5 ton anvil   |       5.99 | .5 ton anvil, black, complete with handy hook                  |
-- | ANV02   |    1001 | 1 ton anvil    |       9.99 | 1 ton anvil, black, complete with handy hook and carrying case |
-- | ANV03   |    1001 | 2 ton anvil    |      14.99 | 2 ton anvil, black, complete with handy hook and carrying case |
-- | DTNTR   |    1003 | Detonator      |      13.00 | Detonator (plunger powered), fuses not included                |
-- | FB      |    1003 | Bird seed      |      10.00 | Large bag (suitable for road runners)                          |
-- | FC      |    1003 | Carrots        |       2.50 | Carrots (rabbit hunting season only)                           |
-- | FU1     |    1002 | Fuses          |       3.42 | 1 dozen, extra long                                            |
-- | JP1000  |    1005 | JetPack 1000   |      35.00 | JetPack 1000, intended for single use                          |
-- | JP2000  |    1005 | JetPack 2000   |      55.00 | JetPack 2000, multi-use                                        |
-- | OL1     |    1002 | Oil can        |       8.99 | Oil can, red                                                   |
-- | SAFE    |    1003 | Safe           |      50.00 | Safe with combination lock                                     |
-- | SLING   |    1003 | Sling          |       4.49 | Sling, one size fits all                                       |
-- | TNT1    |    1003 | TNT (1 stick)  |       2.50 | TNT, red, single stick                                         |
-- | TNT2    |    1003 | TNT (5 sticks) |      10.00 | TNT, red, pack of 10 sticks                                    |
-- +---------+---------+----------------+------------+----------------------------------------------------------------+

SELECT vend_id, Count(*) AS num_prod
  FROM products
  GROUP BY vend_id
  HAVING Count(*) >= 2;
-- +---------+----------+
-- | vend_id | num_prod |
-- +---------+----------+
-- |    1001 |        3 |
-- |    1002 |        2 |
-- |    1003 |        7 |
-- |    1005 |        2 |
-- +---------+----------+
