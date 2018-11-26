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
