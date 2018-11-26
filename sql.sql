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



  
