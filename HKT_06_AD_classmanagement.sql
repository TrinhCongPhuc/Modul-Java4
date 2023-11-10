CREATE DATABASE classmanagement;
USE classmanagement;

-- Tạo bảng teacher
CREATE TABLE teacher (
    idteacher INT AUTO_INCREMENT PRIMARY KEY,
    nameteacher VARCHAR(100) NOT NULL UNIQUE,
    phoneteacher VARCHAR(50) NOT NULL UNIQUE,
    emailteacher VARCHAR(50) NOT NULL UNIQUE,
    birthdayteacher DATE NOT NULL
);

-- Tạo bảng class_room
CREATE TABLE class_room (
    idclass INT AUTO_INCREMENT PRIMARY KEY,
    nameclass VARCHAR(200) NOT NULL,
    total_student INT DEFAULT 0,
    start_date DATE,
    end_date DATE    
);

-- Tạo bảng teacher_class
CREATE TABLE teacher_class (
    teacher_id INT,
    class_room_id INT,
    start_date DATE,
    end_date DATE,
    time_slot_start INT,
    time_slot_end INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(idteacher),
    FOREIGN KEY (class_room_id) REFERENCES class_room(idclass)
);

-- Tạo bảng student
CREATE TABLE student (
    idstudent INT AUTO_INCREMENT PRIMARY KEY,
    namestudent VARCHAR(150) NOT NULL,
    emailstudent VARCHAR(100) NOT NULL UNIQUE,
    phonestudent VARCHAR(50) NOT NULL UNIQUE,
    gender TINYINT NOT NULL CHECK (gender = 1 OR gender = 2),
    class_room_id INT,
    birthday DATE NOT NULL,
    FOREIGN KEY (class_room_id) REFERENCES class_room(idclass)
);

-- Tạo bảng subject
CREATE TABLE subjects (
    idsubjects INT AUTO_INCREMENT PRIMARY KEY,
    namesubjects VARCHAR(200) NOT NULL UNIQUE
);

-- Tạo bảng mark
CREATE TABLE mark (
    student_id INT not null,
    subject_id INT not null,
    score INT NOT NULL CHECK (score >= 0 AND score <= 10),
    FOREIGN KEY (student_id) REFERENCES student(idstudent),
    FOREIGN KEY (subject_id) REFERENCES subjects(idsubjects)
);

-- Thêm dữ liệu vào bảng teacher:
INSERT INTO teacher (nameteacher, phoneteacher, emailteacher, birthdayteacher) VALUES
('Nguyễn Văn Aa', '0987654321', 'nguyenvana@email.com', '1980-05-25'),
('Trần Thị Bình', '0901234567', 'tranthib@email.com', '1975-10-15'),
('Phạm Văn Chính', '0975123456', 'phamvanc@email.com', '1990-12-30'),
('Lê Thị Dương', '0912345678', 'lethid@email.com', '1988-03-20'),
('Hoàng Văn Em', '0965432190', 'hoangvane@email.com', '1985-07-10');

-- Thêm dữ liệu vào bảng class_room:
INSERT INTO class_room (nameclass, total_student, start_date, end_date) VALUES
('Lớp 1A', 30, '2023-09-01', '2024-06-30'),
('Lớp 2B', 25, '2023-08-15', '2024-05-30'),
('Lớp 3C', 20, '2023-09-05', '2024-07-10'),
('Lớp 4D', 35, '2023-07-20', '2024-04-30'),
('Lớp 5E', 28, '2023-08-10', '2024-06-15');

-- Thêm dữ liệu vào bảng teacher_class:
INSERT INTO teacher_class (teacher_id, class_room_id, start_date, end_date, time_slot_start, time_slot_end) VALUES
(1, 1, '2023-09-01', '2024-06-30', 1, 2),
(2, 3, '2023-09-05', '2024-07-10', 3, 4),
(3, 2, '2023-08-15', '2024-05-30', 2, 3),
(4, 4, '2023-07-20', '2024-04-30', 1, 2),
(5, 5, '2023-08-10', '2024-06-15', 3, 4);

-- Thêm dữ liệu vào bảng student:
INSERT INTO student (namestudent, emailstudent, phonestudent, gender, class_room_id, birthday) VALUES
('Nguyễn Thị Hằng', 'nguyenthihang@email.com', '0987111111', 2, 1, '2003-01-15'),
('Trần Văn Minh', 'tranvanminh@email.com', '0909090909', 1, 2, '2002-12-20'),
('Lê Thị Lan', 'lethilan@email.com', '0977777777', 2, 3, '2003-05-10'),
('Phạm Văn Tuấn', 'phamvantuan@email.com', '0912345678', 1, 4, '2002-08-25'),
('Hoàng Thị Hương', 'hoangthihuong@email.com', '0966666666', 2, 5, '2003-03-30'),
('Nguyễn Văn Đạt', 'nguyenvandat@email.com', '095555555', 1, 1, '2003-04-05'),
('Trần Thị Thu', 'tranthithu@email.com', '0922222222', 2, 2, '2002-09-12'),
('Lê Văn Tâm', 'levantam@email.com', '0903333333', 1, 3, '2003-06-18'),
('Phạm Thị Nga', 'phamthinga@email.com', '0908666666', 2, 4, '2002-11-22'),
('Hoàng Văn Long', 'hoangvanlong@email.com', '0999999999', 1, 5, '2003-07-07'),
('Nguyễn Thị Hoa', 'nguyenthihoa@email.com', '0911111111', 2, 1, '2002-10-11'),
('Trần Văn An', 'tranvanan@email.com', '0988888888', 1, 2, '2003-08-08'),
('Lê Thị Huệ', 'lethihue@email.com', '0944444444', 2, 3, '2002-12-03'),
('Phạm Văn Hùng', 'phamvanhung@email.com', '0933333333', 1, 4, '2003-09-28'),
('Hoàng Văn Tuyền', 'hoangvantuyen@email.com', '0988222222', 2, 5, '2002-07-26');

-- Thêm dữ liệu vào bảng subjects:
INSERT INTO subjects (namesubjects) VALUES
('Toán học'),
('Ngữ văn'),
('Vật lý'),
('Hóa học');


-- Thêm dữ liệu vào bảng mark:
INSERT INTO mark (student_id, subject_id, score) VALUES
(1, 1, 9),
(2, 2, 8),
(1, 3, 7),
(2, 1, 8),
(1, 2, 6),
(2, 3, 9),
(1, 1, 8),
(2, 2, 7),
(1, 3, 9),
(2, 1, 6),
(1, 2, 7),
(2, 3, 8),
(1, 1, 9),
(2, 2, 8),
(1, 3, 7),
(2, 1, 8),
(1, 2, 6),
(2, 3, 9),
(1, 1, 8),
(2, 2, 7);

-- 1.  Lấy ra danh sách Student sắp xếp tăng dần theo trường (field) Name.
SELECT s.idstudent AS Id, s.namestudent AS Name, s.emailstudent AS Email, s.phonestudent AS Phone, s.gender AS Gender, s.birthday AS BirthDay, TIMESTAMPDIFF(YEAR, s.birthday, CURDATE()) AS Age
FROM student s ORDER BY s.namestudent ASC;

-- 2.  Lấy ra danh sách Teacher:
SELECT t.idteacher AS Id, t.nameteacher AS Name, t.phoneteacher AS Phone, t.emailteacher AS Email, t.birthdayteacher AS BirthDay, TIMESTAMPDIFF(YEAR, t.birthdayteacher, CURDATE()) AS Age, COUNT(tc.class_room_id) AS TotalClass
FROM teacher t LEFT JOIN teacher_class tc ON t.idteacher = tc.teacher_id
GROUP BY t.idteacher;

-- 3.  Truy vấn danh sách class_room khai giảng năm 2023:
SELECT idclass AS Id, nameclass AS Name, total_student AS TotalStudent, start_date AS StartDate, end_date AS EndDate
FROM class_room WHERE YEAR(start_date) = 2023;

-- 4.  Cập nhật cột TotalStudent trong bảng class_room:

-- 5.  Tạo View v_getStudentInfo:
CREATE VIEW v_getStudentInfo AS
SELECT s.idstudent AS Id, s.namestudent AS Name, s.emailstudent AS Email, s.phonestudent AS Phone, 
       s.gender AS Gender, s.birthday AS BirthDay, cr.nameclass AS ClassName, 
       CASE
           WHEN AVG(m.score) <= 5 THEN 'Loại Yếu'
           WHEN AVG(m.score) < 7.5 THEN 'Loại Trung bình'
           WHEN AVG(m.score) <= 8 THEN 'Loại Giỏi'
           ELSE 'Loại Xuất sắc'
       END AS MarksAvg
FROM student s LEFT JOIN mark m ON s.idstudent = m.student_id
LEFT JOIN class_room cr ON s.class_room_id = cr.idclass GROUP BY s.idstudent;

-- 6. View v_getStudentMax:
CREATE VIEW v_getStudentMax AS
SELECT s.idstudent AS Id, s.namestudent AS Name, AVG(m.score) AS MarksAvg
FROM student s LEFT JOIN mark m ON s.idstudent = m.student_id
GROUP BY s.idstudent HAVING AVG(m.score) >= 7.5;

-- 7.  Tạo thủ tục thêm mới dữ liệu vào bảng class_room:
DELIMITER //
CREATE PROCEDURE AddClassRoom(IN className VARCHAR(200), IN totalStudent INT, IN startDate DATE, IN endDate DATE)
BEGIN
INSERT INTO class_room (nameclass, total_student, start_date, end_date) 
VALUES (className, totalStudent, startDate, endDate);
END //
DELIMITER ;
-- Gọi thủ tục thêm mới dữ liệu vào bảng class_room
-- CALL AddClassRoom('Lớp 6F', 35, '2023-10-10', '2024-06-30');

-- 8.  Tạo thủ tục cập nhật dữ liệu trên bảng student:
DELIMITER //
CREATE PROCEDURE UpdateStudent(
    IN studentId INT,
    IN newName VARCHAR(150),
    IN newEmail VARCHAR(100),
    IN newPhone VARCHAR(50),
    IN newGender TINYINT,
    IN newClassRoomId INT,
    IN newBirthday DATE
)
BEGIN
    UPDATE student
    SET namestudent = newName,
        emailstudent = newEmail,
        phonestudent = newPhone,
        gender = newGender,
        class_room_id = newClassRoomId,
        birthday = newBirthday
    WHERE idstudent = studentId;
END //
DELIMITER ;

-- Tạo thủ tục cập nhật dữ liệu trên bảng student
-- CALL UpdateStudent(2,'Phạm Văn Chương', 'chuongpv@email.com', '0999888888', 1, 3, '2003-01-21');

-- 9. Tạo thủ tục xóa dữ liệu theo id trên bảng subject:
DELIMITER //
CREATE PROCEDURE DeleteSubject(IN subjectId INT)
BEGIN
DELETE FROM subjects WHERE idsubjects = subjectId;
END //
DELIMITER ;

-- Tạo thủ tục xóa dữ liệu theo id trên bảng subject:
-- CALL DeleteSubject(4);

-- 10. Tạo thủ tục getStudentPaginate:
DELIMITER //
CREATE PROCEDURE GetStudentPaginate(IN limit_val INT, IN page_val INT)
BEGIN
    DECLARE offset_val INT;
    SET offset_val = (page_val - 1) * limit_val;
    SELECT s.idstudent AS Id, s.namestudent AS Name, s.emailstudent AS Email, s.phonestudent AS Phone, s.gender AS Gender, s.birthday AS BirthDay, cr.nameclass AS ClassName
    FROM student s     LEFT JOIN class_room cr ON s.class_room_id = cr.idclass     LIMIT limit_val OFFSET offset_val;
END;
// DELIMITER ;

-- Gọi thủ tục getStudentPaginate:
-- CALL GetStudentPaginate(5, 1);




