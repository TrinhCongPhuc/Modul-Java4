CREATE DATABASE IF NOT EXISTS QuanLySinhVien_ss7;
USE QuanLySinhVien_ss7;

-- Tạo bảng Students_ss7
CREATE TABLE Students_ss7
(
    StudentID   INT PRIMARY KEY,
    StudentName VARCHAR(255),
    Age         INT,
    Email       VARCHAR(255),
    Status      BIT DEFAULT 1
);

-- Tạo bảng Classes_ss7
CREATE TABLE Classes_ss7
(
    ClassID   INT PRIMARY KEY,
    ClassName VARCHAR(255)
);

-- Tạo bảng ClassStudent_ss7
CREATE TABLE ClassStudent_ss7
(
    StudentID INT,
    ClassID   INT
);

-- Tạo bảng Subjects_ss7
CREATE TABLE Subjects_ss7
(
    SubjectID   INT PRIMARY KEY,
    SubjectName VARCHAR(255)
);

-- Tạo bảng Marks_ss7
CREATE TABLE Marks_ss7
(
    Mark      INT,
    SubjectID INT,
    StudentID INT
);

-- Kết nối các khóa chính sử dụng khóa ngoại
-- Tạo khóa ngoại trong bảng ClassStudent_ss7 để kết nối Students_ss7 và Classes_ss7
ALTER TABLE ClassStudent_ss7
    ADD CONSTRAINT FK_StudentID
        FOREIGN KEY (StudentID)
            REFERENCES Students_ss7 (StudentID),
    ADD CONSTRAINT FK_ClassID
        FOREIGN KEY (ClassID)
            REFERENCES Classes_ss7 (ClassID);

-- Tạo khóa ngoại trong bảng Marks_ss7 để kết nối Subjects_ss7 và Students_ss7
ALTER TABLE Marks_ss7
    ADD CONSTRAINT FK_SubjectID
        FOREIGN KEY (SubjectID)
            REFERENCES Subjects_ss7 (SubjectID),
    ADD CONSTRAINT FK_StudentID_Marks
        FOREIGN KEY (StudentID)
            REFERENCES Students_ss7 (StudentID);

-- Chèn dữ liệu vào bảng Students_ss7
INSERT INTO Students_ss7 (StudentID, StudentName, Age, Email)
VALUES (1, 'Nguyen Quang An', 18, 'an@yahoo.com'),
       (2, 'Nguyen Cong Vinh', 20, 'vinh@gmail.com'),
       (3, 'Nguyen Van Quyen', 19, 'quyen'),
       (4, 'Pham Thanh Binh', 25, 'binh@com'),
       (5, 'Nguyen Van Tai Em', 30, 'taiem@sport.vn');

-- Chèn dữ liệu vào bảng Classes_ss7
INSERT INTO Classes_ss7 (ClassID, ClassName)
VALUES (1, 'C0706L'),
       (2, 'C0708G');

-- Chèn dữ liệu vào bảng ClassStudent_ss7
INSERT INTO ClassStudent_ss7 (StudentID, ClassID)
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 2),
       (5, 2);

-- Chèn dữ liệu vào bảng Subjects_ss7
INSERT INTO Subjects_ss7 (SubjectID, SubjectName)
VALUES (1, 'SQL'),
       (2, 'Java'),
       (3, 'C'),
       (4, 'Visual Basic');

-- Chèn dữ liệu vào bảng Marks_ss7
INSERT INTO Marks_ss7 (Mark, SubjectID, StudentID)
VALUES (8, 1, 1), -- SubjectID 1 và StudentID 1 tồn tại
       (4, 2, 1), -- SubjectID 2 và StudentID 1 tồn tại
       (9, 1, 1), -- SubjectID 1 và StudentID 1 tồn tại
       (7, 1, 3), -- SubjectID 1 và StudentID 3 tồn tại
       (3, 3, 1), -- SubjectID 3 và StudentID 1 tồn tại
       (4, 3, 5), -- SubjectID 3 và StudentID 5 tồn tại
       (8, 3, 3), -- SubjectID 3 và StudentID 3 tồn tại
       (1, 4, 5), -- SubjectID 4 và StudentID 5 tồn tại
       (3, 4, 2); -- SubjectID 4 và StudentID 2 tồn tại

-- 1. Truy vấn thông tin trong bảng Students_ss7
SELECT *
FROM Students_ss7;

-- 2. Truy vấn thông tin trong bảng Subjects_ss7
SELECT *
FROM Subjects_ss7;

-- 3. Truy vấn StudentID và điểm trung bình (DiemTrungBinh) từ bảng Marks_ss7
SELECT StudentID, AVG(Mark) AS DiemTrungBinh
FROM Marks_ss7
GROUP BY StudentID;

-- 4. Truy vấn tên môn học (SubjectName) và điểm cao nhất (MaxMark) từ bảng Subjects_ss7
SELECT S.SubjectName, M.MaxMark
FROM Subjects_ss7 AS S
         JOIN (SELECT SubjectID, MAX(Mark) AS MaxMark
               FROM Marks_ss7
               GROUP BY SubjectID) AS M ON S.SubjectID = M.SubjectID;

-- 5. Truy vấn điểm (Mark) và xếp hạng dày đặc (ThuTuGiam) dựa trên điểm từ bảng Marks_ss7
SELECT Mark,
       DENSE_RANK() OVER (ORDER BY Mark DESC) AS ThuTuGiam
FROM Marks_ss7
ORDER BY Mark DESC;

-- 6. Thay đổi kiểu dữ liệu cột SubjectName trong bảng Subjects_ss7 thành varchar(255)
ALTER TABLE Subjects_ss7
    MODIFY SubjectName VARCHAR(255);

-- 7. Cập nhật tên môn học (SubjectName) trong bảng Subjects_ss7
UPDATE Subjects_ss7
SET SubjectName = CONCAT('Day la mon hoc ', SubjectName);

-- 8. Thêm ràng buộc kiểm tra (CHECK) cho cột Age trong bảng Students_ss7
ALTER TABLE Students_ss7
    ADD CONSTRAINT CHK_AgeRange CHECK (Age > 15 AND Age < 50);

-- 9. Xóa ràng buộc khóa ngoại trong bảng ClassStudent_ss7 và Marks_ss7
ALTER TABLE ClassStudent_ss7
    DROP CONSTRAINT FK_StudentID;

ALTER TABLE ClassStudent_ss7
    DROP CONSTRAINT FK_ClassID;

ALTER TABLE Marks_ss7
    DROP CONSTRAINT FK_SubjectID;

ALTER TABLE Marks_ss7
    DROP CONSTRAINT FK_StudentID_Marks;

-- 10. Xóa dữ liệu liên quan đến StudentID = 1 trong bảng ClassStudent_ss7 và Marks_ss7
DELETE
FROM ClassStudent_ss7
WHERE StudentID = 1;

DELETE
FROM Marks_ss7
WHERE StudentID = 1;

DELETE
FROM Students_ss7
WHERE StudentID = 1;

-- 11. Thêm cột Status có giá trị mặc định là 1 trong bảng Students_ss7
ALTER TABLE Students_ss7
    ADD Status BIT DEFAULT 1;

-- 12. Cập nhật giá trị của cột Status thành 0 trong bảng Students_ss7
UPDATE Students_ss7
SET Status = 0;