-- tạo csdl bằng từ khóa database
create database data_csdl;
-- tạo csdl bằng từ khóa schema
-- create schema data_csdl1;
-- drop database data_csdl1;
-- lựa chọn database
use `data_csdl`;
-- tạo bảng
create table `Catalog`
(
id int primary key auto_increment,
`name` varchar(255),
`description` text,
`status` bit
);
INSERT INTO `data_csdl`.`catalog` (`name`, `description`, `status`) VALUES ('Đồ điện tử', 'Đồ điện tử', b'1');
INSERT INTO `data_csdl`.`catalog` (`name`, `description`, `status`) VALUES ('Dụng cụ du lịch', 'Dụng cụ du lịch', b'1');
INSERT INTO `data_csdl`.`catalog` (`name`, `description`, `status`) VALUES ('Thiết bị máy tính', 'Thiết bị máy tính', b'1');
INSERT INTO `data_csdl`.`catalog` (`name`, `description`, `status`) VALUES ('Thiết bị di động', 'Thiết bị di động', b'1');
-- drop table `catalog`