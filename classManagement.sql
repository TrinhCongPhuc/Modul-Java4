create schema studentManagement;
use `studentManagement`;
-- tạo bảng
create table `Class`
(
id int primary key auto_increment,
`name` varchar(255),
`description` text
);
create table `teacher`
(
id int primary key auto_increment,
`name` varchar(255),
`age` int,
`country`varchar(255)
);