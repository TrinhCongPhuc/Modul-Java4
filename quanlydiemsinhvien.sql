Create Database QuanLyDiemSinhvien CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
use QuanLyDiemSinhvien;
/*=============DANH MUC KHOA==============*/
Create table DanhMucKhoa(
	MaKhoa char(2) primary key,
	TenKhoa nvarchar(30)not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DanhmucSinhVien(
MaSV char(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar (20),
MaKhoa char(2),
HocBong float
);
/*===================MON HOC========================*/
create table DanhMucMonHoc(
MaMH char (2) not null,
TenMH nvarchar (25)not null,
SoTiet tinyint,
Constraint DMMH_MaMH_pk primary key(MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua (
MaSV char(3) not null,
MaMH char (2)not null ,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV,MaMH,LanThi)
);

//*==========================TAO KHOA NGOAI==============================*/
ALTER TABLE DanhMucSinhVien
ADD CONSTRAINT DMKhoa_MaKhoa_fk FOREIGN KEY (MaKhoa)
REFERENCES DanhMucKhoa (MaKhoa);

ALTER TABLE KetQua
ADD CONSTRAINT KetQua_MaSV_fk FOREIGN KEY (MaSV)
REFERENCES DanhMucSinhVien (MaSV);

ALTER TABLE KetQua
ADD CONSTRAINT DMMH_MaMH_fk FOREIGN KEY (MaMH)
REFERENCES DanhMucMonHoc (MaMH);

/*==============NHAP DU LIEU DanhMucMonHoc=============*/
INSERT INTO DanhMucMonHoc (MaMH, TenMH, SoTiet)
VALUES ('01', 'Cơ Sở Dữ Liệu', 36);
INSERT INTO DanhMucMonHoc (MaMH, TenMH, SoTiet)
VALUES ('02', 'Trí Tuệ Nhân Tạo', 45);
INSERT INTO DanhMucMonHoc (MaMH, TenMH, SoTiet)
VALUES ('03', 'Truyền Tin', 39);
INSERT INTO DanhMucMonHoc (MaMH, TenMH, SoTiet)
VALUES ('04', 'Đồ Họa', 60);
INSERT INTO DanhMucMonHoc (MaMH, TenMH, SoTiet)
VALUES ('05', 'Văn Phạm', 60);

/*==============NHAP DU LIEU DanhMucKhoa=============*/
INSERT INTO DanhMucKhoa (MaKhoa, TenKhoa)
VALUES ('AV', 'Anh Văn');
INSERT INTO DanhMucKhoa (MaKhoa, TenKhoa)
VALUES ('TH', 'Tin Học');
INSERT INTO DanhMucKhoa (MaKhoa, TenKhoa)
VALUES ('TR', 'Triết');
INSERT INTO DanhMucKhoa (MaKhoa, TenKhoa)
VALUES ('VL', 'Vật Lý');

/*==============NHAP DU LIEU DanhMucSinhVien=============*/
INSERT INTO DanhMucSinhVien
VALUES ('A01', 'Nguyễn Thị', 'Hải', 'Nữ', '1990-03-20', 'Hà Nội', 'TH', 130000);
INSERT INTO DanhMucSinhVien
VALUES ('A02', 'Trần Văn', 'Chính', 'Nam', '1992-12-24', 'Bình Định', 'VL', 150000);
INSERT INTO DanhMucSinhVien
VALUES ('A03', 'Lê Thu Bạch', 'Yến', 'Nữ', '1990-02-21', 'TP Hồ Chí Minh', 'TH', 170000);
INSERT INTO DanhMucSinhVien
VALUES ('A04', 'Trần Anh', 'Tuấn', 'Nam', '1990-12-20', 'Hà Nội', 'AV', 800000);
INSERT INTO DanhMucSinhVien
VALUES ('B01', 'Trần Thanh', 'Mai', 'Nữ', '1991-08-12', 'Hải Phòng', 'TR', 0);
INSERT INTO DanhMucSinhVien
VALUES ('B02', 'Trần Thị Thu', 'Thủy', 'Nữ', '1991-01-02', 'TP Hồ Chí Minh', 'AV', 0);
INSERT INTO DanhMucSinhVien
VALUES ('B03', 'Lê Thanh', 'Nam', 'Nam', '2002-09-02', 'Nha Trang', 'TR', 60000);
INSERT INTO DanhMucSinhVien
VALUES ('B04', 'Phạm Vân', 'Bách', 'Nam', '2001-11-22', 'Cần Thơ', 'VL', 120000);
INSERT INTO DanhMucSinhVien
VALUES ('B05', 'Võ Tắc', 'Thiên', 'Nữ', '2003-06-02', 'Sóc Trăng', 'TH', 200000);
INSERT INTO DanhMucSinhVien
VALUES ('B06', 'Lưu', 'Ban', 'Nam', '1991-01-02', 'TP Hồ Chí Minh', 'AV', 0);

/*==============NHAP DU LIEU BANG KET QUA=============*/
 
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A01', '01', 1, 3);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A01', '01', 2, 6);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A01', '02', 2, 6);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A01', '03', 1, 5);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A02', '01', 1, 4.5);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A02', '01', 2, 7);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A02', '03', 1, 6);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A02', '04', 1, 3);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A02', '05', 1, 9);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A03', '01', 1, 4);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A03', '01', 2, 5);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A03', '03', 1, 2.5);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A03', '03', 2, 4);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('A04', '05', 2, 10);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B01', '01', 1, 7);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B01', '03', 1, 2.5);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B01', '03', 2, 5);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B02', '02', 1, 6);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B02', '04', 1, 10);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B03', '02', 1, 4);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B03', '02', 2, 3);
INSERT INTO KetQua (MaSV, MaMH, LanThi, Diem)
VALUES ('B03', '02', 3, 9);

-- 01.  Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần
SELECT MaSV, HoSV, TenSV, HocBong
FROM DanhMucSinhVien ORDER BY MaSV ASC;

-- 02. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh
FROM DanhMucSinhVien ORDER BY Phai;

-- 03. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, HocBong
FROM DanhMucSinhVien ORDER BY NgaySinh ASC, HocBong DESC;

-- 04. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên môn, Số tiết.
SELECT MaMH, TenMH, SoTiet
FROM DanhMucMonHoc
WHERE TenMH LIKE 'T%';

-- 05. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, NgaySinh, Phai
FROM DanhMucSinhVien
WHERE SUBSTRING(TenSV, -1) = 'I';

-- 06. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các thông tin: Mã khoa, Tên khoa.
SELECT MaKhoa, TenKhoa
FROM DanhMucKhoa
WHERE SUBSTRING(TenKhoa, 2, 1) = 'N';

-- 07. Liệt kê những sinh viên mà họ có chứa chữ Thị.
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen
FROM DanhMucSinhVien
WHERE HoSV LIKE '%Thị%';

-- 08. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã khoa giảm dần
SELECT DMSV.MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, DMSV.MaKhoa, DMSV.HocBong
FROM DanhMucSinhVien AS DMSV
WHERE HocBong > 100000
ORDER BY DMSV.MaKhoa DESC;

-- 09. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, MaKhoa, NoiSinh, HocBong
FROM DanhMucSinhVien
WHERE HocBong >= 150000 AND NoiSinh = 'Hà Nội';

-- 10. Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh viên, Mã khoa, Phái.
SELECT MaSV, MaKhoa, Phai
FROM DanhMucSinhVien
WHERE MaKhoa IN ('AV', 'VL');

-- 11. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.
SELECT MaSV, NgaySinh, NoiSinh, HocBong
FROM DanhMucSinhVien
WHERE NgaySinh BETWEEN '1991-01-01' AND '1992-06-05';

-- 12. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
SELECT MaSV, NgaySinh, Phai, MaKhoa
FROM DanhMucSinhVien
WHERE HocBong BETWEEN 80000 AND 150000;

-- 13. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
SELECT MaMH, TenMH, SoTiet
FROM DanhMucMonHoc
WHERE SoTiet > 30 AND SoTiet < 45;

-- 14. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
SELECT DMSV.MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen, DMKhoa.TenKhoa, DMSV.Phai
FROM DanhMucSinhVien AS DMSV
JOIN DanhMucKhoa AS DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE DMSV.Phai = 'Nam' AND (DMKhoa.TenKhoa = 'Anh Văn' OR DMKhoa.TenKhoa = 'Tin Học');

-- 15. Liệt kê những sinh viên nữ, tên có chứa chữ N
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTen
FROM DanhMucSinhVien
WHERE Phai = 'Nữ' AND TenSV LIKE '%N%';

-- 16. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
SELECT HoSV, TenSV, NoiSinh, NgaySinh
FROM DanhMucSinhVien
WHERE NoiSinh = 'Hà Nội' AND MONTH(NgaySinh) = 2;

-- 17. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, 
TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) AS Tuoi, HocBong
FROM DanhMucSinhVien
WHERE TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) > 20;

-- 18. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, 
       TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) AS Tuoi, 
       DanhMucKhoa.TenKhoa
FROM DanhMucSinhVien
JOIN DanhMucKhoa ON DanhMucSinhVien.MaKhoa = DanhMucKhoa.MaKhoa
WHERE TIMESTAMPDIFF(YEAR, NgaySinh, CURDATE()) BETWEEN 20 AND 25;

-- 19. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên,Phái, Ngày sinh.
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTen, Phai, NgaySinh
FROM DanhMucSinhVien
WHERE NgaySinh BETWEEN '1990-01-01' AND '1990-03-31';

-- 20. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”
SELECT MaSV, Phai, MaKhoa, 
       CASE  WHEN HocBong > 500000 THEN 'Học bổng cao'
       ELSE 'Mức trung bình' END AS MucHocBong
FROM DanhMucSinhVien;

-- 21. Cho biết tổng số sinh viên của toàn trường
SELECT COUNT(*) AS TongSoSinhVien FROM DanhMucSinhVien;

-- 22. Cho biết tổng sinh viên và tổng sinh viên nữ.
SELECT COUNT(*) AS TongSinhVien,
COUNT(CASE WHEN Phai = 'Nữ' THEN 1 ELSE NULL END) AS TongSinhVienNu
FROM DanhMucSinhVien;

-- 23. Cho biết tổng số sinh viên của từng khoa.
SELECT MaKhoa, COUNT(*) AS TongSinhVien
FROM DanhMucSinhVien
GROUP BY MaKhoa;

-- 24. Cho biết số lượng sinh viên học từng môn.
SELECT MaMH, COUNT(*) AS SoLuongSinhVien
FROM KetQua
GROUP BY MaMH;

-- 25. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có trong bảng kq)
SELECT MaSV, COUNT(DISTINCT MaMH) AS SoLuongMonHoc
FROM KetQua
GROUP BY MaSV;

-- 26. Cho biết tổng số học bổng của mỗi khoa.
SELECT MaKhoa, SUM(HocBong) AS TongHocBong
FROM DanhMucSinhVien
GROUP BY MaKhoa;

-- 27. Cho biết học bổng cao nhất của mỗi khoa.
SELECT MaKhoa, MAX(HocBong) AS HocBongCaoNhat
FROM DanhMucSinhVien
GROUP BY MaKhoa;

-- 28. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
SELECT MaKhoa, 
       SUM(CASE WHEN Phai = 'Nam' THEN 1 ELSE 0 END) AS TongSinhVienNam,
       SUM(CASE WHEN Phai = 'Nữ' THEN 1 ELSE 0 END) AS TongSinhVienNu
FROM DanhMucSinhVien
GROUP BY MaKhoa;

-- 29. Cho biết số lượng sinh viên theo từng độ tuổi.
SELECT
    FLOOR(DATEDIFF(CURDATE(), NgaySinh) / 365) AS DoTuoi,
    COUNT(*) AS SoLuongSinhVien
FROM DanhMucSinhVien
GROUP BY DoTuoi
ORDER BY DoTuoi;

-- 30. Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
SELECT YEAR(NgaySinh) AS NamSinh, COUNT(*) AS SoLuongSinhVien
FROM DanhMucSinhVien
GROUP BY YEAR(NgaySinh)
HAVING SoLuongSinhVien = 2;

-- 31. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
SELECT NoiSinh, COUNT(*) AS SoLuongSinhVien
FROM DanhMucSinhVien
GROUP BY NoiSinh
HAVING SoLuongSinhVien > 2;


-- 32. Cho biết những môn nào có trên 3 sinh viên dự thi.
SELECT MaMH, COUNT(*) AS SoLuongSinhVien
FROM KetQua
GROUP BY MaMH
HAVING SoLuongSinhVien > 3;

-- 33. Cho biết những sinh viên thi lại trên 2 lần.
SELECT MaSV, COUNT(DISTINCT LanThi) AS SoLanThi
FROM KetQua
GROUP BY MaSV
HAVING SoLanThi > 2;

-- 34. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
SELECT DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, DMSV.Phai, AVG(KetQua.Diem) AS DiemTrungBinh
FROM DanhMucSinhVien DMSV
INNER JOIN KetQua ON DMSV.MaSV = KetQua.MaSV
WHERE DMSV.Phai = 'Nam'
AND KetQua.LanThi = 1
GROUP BY DMSV.MaSV, DMSV.HoSV, DMSV.TenSV, DMSV.Phai
HAVING DiemTrungBinh > 7.0;

-- 35. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
SELECT KQ.MaSV, DMSV.HoSV, DMSV.TenSV
FROM KetQua KQ
INNER JOIN DanhMucSinhVien DMSV ON KQ.MaSV = DMSV.MaSV
WHERE KQ.LanThi = 1
GROUP BY KQ.MaSV, DMSV.HoSV, DMSV.TenSV
HAVING SUM(CASE WHEN KQ.Diem < 5 THEN 1 ELSE 0 END) > 2;


-- 36. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
SELECT DMSV.MaKhoa, COUNT(*) AS SoLuongSinhVienNam
FROM DanhMucSinhVien DMSV
WHERE DMSV.Phai = 'Nam'
GROUP BY DMSV.MaKhoa
HAVING SoLuongSinhVienNam > 2;

-- 37. Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
SELECT MaKhoa
FROM DanhMucSinhVien
WHERE HocBong BETWEEN 100000 AND 300000
GROUP BY MaKhoa
HAVING COUNT(*) = 2;

-- 38. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 
SELECT MaMH, LanThi,
       SUM(CASE WHEN Diem >= 5 THEN 1 ELSE 0 END) AS SoSinhVienDau,
       SUM(CASE WHEN Diem < 5 THEN 1 ELSE 0 END) AS SoSinhVienRot
FROM KetQua
GROUP BY MaMH, LanThi;

-- 39. Cho biết sinh viên nào có học bổng cao nhất.
SELECT MaSV, HoSV, TenSV, MaKhoa, HocBong
FROM DanhMucSinhVien
ORDER BY HocBong DESC
LIMIT 1;

-- 40. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
SELECT KQ.MaSV, DMSV.HoSV, DMSV.TenSV, DMSV.Phai, KQ.Diem
FROM KetQua KQ
JOIN DanhMucSinhVien DMSV ON KQ.MaSV = DMSV.MaSV
WHERE KQ.LanThi = 1 AND KQ.MaMH = 'CD'
ORDER BY KQ.Diem DESC
LIMIT 1;

-- 41. Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
SELECT MaKhoa, MaSV, HoSV, TenSV, Phai, NgaySinh
FROM DanhMucSinhVien
WHERE MaKhoa = 'AV'
ORDER BY NgaySinh DESC
LIMIT 1;

-- 42. Cho biết khoa nào có đông sinh viên nhất.
SELECT MaKhoa, COUNT(*) AS SoLuongSinhVien
FROM DanhMucSinhVien
GROUP BY MaKhoa
ORDER BY SoLuongSinhVien DESC
LIMIT 1;

-- 43. Cho biết khoa nào có đông nữ nhất.
SELECT MaKhoa, COUNT(*) AS SoLuongNu
FROM DanhMucSinhVien
WHERE Phai = 'Nữ'
GROUP BY MaKhoa
ORDER BY SoLuongNu DESC
LIMIT 1;

-- 44. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
SELECT MaMH, COUNT(*) AS SoLuongSinhVienRot
FROM KetQua
WHERE LanThi = 1 AND Diem < 5
GROUP BY MaMH
ORDER BY SoLuongSinhVienRot DESC
LIMIT 1;

-- 45. Cho biết sinh viên không học khoa anh văn có điểm thi môn văn phạm lớn hơn điểm thi văncủa sinh viên học khoa anh văn.
SELECT S1.MaSV, S1.HoSV, S1.TenSV, S3.Diem AS DiemVanPham, S2.Diem AS DiemVan
FROM DanhmucSinhVien S1
JOIN KetQua S2 ON S1.MaSV = S2.MaSV AND S2.MaMH = 'VN' 
LEFT JOIN KetQua S3 ON S1.MaSV = S3.MaSV AND S3.MaMH = 'VP'
WHERE S1.MaKhoa <> 'AV' AND S3.Diem > S2.Diem;

-- 46. Cho biết sinh viên có nơi sinh cùng với Hải.
SELECT MaSV, HoSV, TenSV
FROM DanhMucSinhVien
WHERE NoiSinh = (SELECT NoiSinh FROM DanhMucSinhVien WHERE HoSV = 'Nguyễn Thị' AND TenSV = 'Hải');

-- 47. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn.
SELECT S1.MaSV, S1.HoSV, S1.TenSV, S1.HocBong
FROM DanhMucSinhVien S1
WHERE HocBong > ALL (SELECT HocBong FROM DanhMucSinhVien S2 WHERE S2.MaKhoa = 'AV');

-- 48. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn
SELECT S1.MaSV, S1.HoSV, S1.TenSV, S1.HocBong
FROM DanhMucSinhVien S1
WHERE HocBong > ANY (SELECT HocBong FROM DanhMucSinhVien S2 WHERE S2.MaKhoa = 'AV');

-- 49. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.
SELECT S1.MaSV, S1.HoSV, S1.TenSV, KQ1.Diem AS DiemLan1, KQ2.Diem AS DiemLan2
FROM DanhMucSinhVien S1
JOIN KetQua KQ1 ON S1.MaSV = KQ1.MaSV AND KQ1.MaMH = 'CD' AND KQ1.LanThi = 1
JOIN KetQua KQ2 ON S1.MaSV = KQ2.MaSV AND KQ2.MaMH = 'CD' AND KQ2.LanThi = 2
WHERE KQ2.Diem > ALL (SELECT Diem FROM KetQua WHERE MaMH = 'CD' AND LanThi = 1 AND MaSV <> S1.MaSV);

-- 50. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
SELECT KQ.MaMH, MAX(KQ.Diem) AS DiemCaoNhat
FROM KetQua KQ
GROUP BY KQ.MaMH;

-- 51. Cho biết những khoa không có sinh viên học.
SELECT MaKhoa
FROM DanhMucKhoa
WHERE MaKhoa NOT IN (SELECT DISTINCT MaKhoa FROM DanhMucSinhVien);

-- 52. Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
SELECT MaSV, HoSV, TenSV
FROM DanhMucSinhVien
WHERE MaSV NOT IN (SELECT DISTINCT MaSV FROM KetQua WHERE MaMH = 'CD');

-- 53. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
SELECT MaSV, HoSV, TenSV
FROM DanhMucSinhVien
WHERE MaSV IN (SELECT DISTINCT MaSV FROM KetQua WHERE LanThi = 2)
  AND MaSV NOT IN (SELECT DISTINCT MaSV FROM KetQua WHERE LanThi = 1);

-- 54. Cho biết môn nào không có sinh viên khoa anh văn học.
SELECT MaMH, TenMH
FROM DanhMucMonHoc
WHERE MaMH NOT IN (SELECT DISTINCT MaMH FROM KetQua WHERE MaSV IN 
(SELECT MaSV FROM DanhMucSinhVien WHERE MaKhoa = 'AV'));

-- 55. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.
SELECT MaSV, HoSV, TenSV
FROM DanhMucSinhVien
WHERE MaKhoa = 'AV'
  AND MaSV NOT IN (SELECT DISTINCT MaSV FROM KetQua WHERE MaMH = 'VP');

-- 56. Cho biết những sinh viên không rớt môn nào.
SELECT S1.MaSV, S1.HoSV, S1.TenSV
FROM DanhMucSinhVien S1
WHERE NOT EXISTS (SELECT 1 FROM KetQua KQ WHERE KQ.MaSV = S1.MaSV AND KQ.Diem < 5);

-- 57. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên chưa bao giờ rớt.
SELECT S1.MaSV, S1.HoSV, S1.TenSV
FROM DanhMucSinhVien S1
WHERE MaKhoa = 'AV'
  AND HocBong > 0
  AND NOT EXISTS (SELECT 1 FROM KetQua KQ WHERE KQ.MaSV = S1.MaSV AND KQ.Diem < 5);

-- 58.Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít sinh viên nhận học bổng nhất.
SELECT MaKhoa, COUNT(*) AS SoLuongSinhVienHocBongNhieuNhat
FROM DanhMucSinhVien
WHERE HocBong > 0
GROUP BY MaKhoa
ORDER BY SoLuongSinhVienHocBongNhieuNhat DESC
LIMIT 1;

SELECT MaKhoa, COUNT(*) AS SoLuongSinhVienHocBongItNhat
FROM DanhMucSinhVien
WHERE HocBong > 0
GROUP BY MaKhoa
ORDER BY SoLuongSinhVienHocBongItNhat ASC
LIMIT 1;

-- 59. Cho biết 3 sinh viên có học nhiều môn nhất.
SELECT MaSV, COUNT(*) AS SoLuongMonHoc
FROM KetQua
GROUP BY MaSV
ORDER BY SoLuongMonHoc DESC
LIMIT 3;

-- 60. Cho biết những môn được tất cả các sinh viên theo học.
SELECT MaMH, TenMH
FROM DanhMucMonHoc
WHERE MaMH NOT IN (
    SELECT DISTINCT DMH.MaMH
    FROM DanhMucMonHoc DMH
    WHERE NOT EXISTS (
        SELECT MaSV
        FROM DanhMucSinhVien
        WHERE MaMH <> ALL (
            SELECT MaMH
            FROM DanhMucMonHoc
        )
    )
);

-- 61. Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
SELECT S1.MaSV, S1.HoSV, S1.TenSV
FROM DanhMucSinhVien S1
WHERE S1.MaSV <> 'A02'
  AND NOT EXISTS (SELECT DISTINCT MaMH FROM KetQua KQ1 WHERE KQ1.MaSV = 'A02'
                  EXCEPT
                  SELECT DISTINCT MaMH FROM KetQua KQ2 WHERE KQ2.MaSV = S1.MaSV);

-- 62. Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 học.
SELECT S1.MaSV, S1.HoSV, S1.TenSV
FROM DanhmucSinhVien S1
WHERE S1.MaSV <> 'A02'
  AND NOT EXISTS (
    SELECT DISTINCT MaMH FROM KetQua KQ_A02
    WHERE KQ_A02.MaSV = 'A02'
    EXCEPT
    SELECT DISTINCT MaMH FROM KetQua KQ_S1
    WHERE KQ_S1.MaSV = S1.MaSV
  )
  AND NOT EXISTS (
    SELECT DISTINCT MaMH FROM KetQua KQ_S1
    WHERE KQ_S1.MaSV = S1.MaSV
    EXCEPT
    SELECT DISTINCT MaMH FROM KetQua KQ_A02
    WHERE KQ_A02.MaSV = 'A02'
  );