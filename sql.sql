## 基本使用
_**change database**_
- use database_name

_**get info**_
- show databases;
- show tables;
- show columns from table_name; // show table structure
- show create table table_name;  //  show create table sql sentence

_**create table**_
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
