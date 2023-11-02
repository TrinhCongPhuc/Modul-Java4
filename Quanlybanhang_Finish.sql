create database quanlybanhang_finish;
use quanlybanhang_finish;
create table KhachHang(
MaKH nvarchar(4) primary key,
TenKH nvarchar(30) not null,
Diachi nvarchar(50),
Ngaysinh datetime,
SoDT nvarchar(15) unique
);

create table NhanVien(
MaNV nvarchar(4) primary key,
HoTen nvarchar(30) not null,
GioiTinh bit not null,
DiaChi nvarchar(50) not null,
Ngaysinh datetime not null,
DienThoai nvarchar(15) unique,
Email nvarchar(30) unique,
NoiSinh nvarchar(20) not null,
NgayVaoLam datetime,
MaNQL nvarchar(4)
);

create table NhaCungCap (
MaNCC nvarchar(5) primary key,
TenNCC nvarchar (50) not null,
Diachi nvarchar(50) not null,
DienThoai nvarchar(15) not null unique,
Email nvarchar(30) not null unique,
Website nvarchar(30)
);

create table LoaiSP(
MaLoaiSP nvarchar(5) primary key,
TenloaiSP nvarchar(30) not null,
GhiChu nvarchar(100) not null
);

create table SanPham(
MaSP nvarchar(4) primary key,
MaLoaiSP nvarchar(5) not null,
TenSP nvarchar(50) not null,
Donvitinh nvarchar(10) not null,
Ghichu nvarchar(100),
foreign key (MaLoaiSP) references LoaiSP(MaLoaiSP)
);

create table PhieuNhap (
SoPN nvarchar(5) primary key,
MaNV nvarchar(4) not null,
MaNCC nvarchar(5) not null,
Ngaynhap datetime not null default now(),
Ghichu nvarchar(100),
foreign key(MaNV) references NhanVien(MaNV),
foreign key(MaNCC) references NhaCungCap(MaNCC)
);

create table ChitietPhieuNhap (
MaSP nvarchar(4),
SoPN nvarchar(5),
Soluong smallint check(Soluong > 0),
Gianhap real not null check(Gianhap > 0) ,
primary key(MaSP,SoPN),
foreign key(MaSP) references SanPham(MaSP),
foreign key(SoPN) references PhieuNhap(SoPN)

);

create table PhieuXuat(
SoPX nvarchar(5) primary key,
MaNV nvarchar(4) not null,
MaKH nvarchar(4) not null,
NgayBan datetime not null,
Ghichu text,
foreign key(MaNV) references NhanVien(MaNV),
foreign key(makh) references khachhang(makh)
);

create table ChitietPhieuXuat (
SoPX nvarchar(5),
MaSP nvarchar(4),
Soluong smallint check(Soluong > 0),
Giaban real  check(Giaban > 0),
primary key(masp,sopx),
foreign key(sopx) references phieuxuat(sopx),
foreign key(masp) references sanpham(masp)
);

-- Bài 1: Tạo CSDL QUANLYBANHANG:
-- Bài 2: Dùng câu lệnh ALTER để thêm rằng buộc khóa ngoại cho các bảng 

-- Bài 3 Dùng lệnh INSERT thêm dữ liệu vào các bảng: 
-- 1.	Thêm 5 Phiếu nhập trong tháng hiện hành. Mỗi phiếu nhập có 2 sản phẩm. (Tùy chọn các thông tin liên quan còn lại)
-- 2.	Thêm 5 Phiếu xuất trong ngày hiện hành. Mỗi phiếu xuất có 3 sản phẩm. (Tùy chọn các thông tin liên quan còn lại)

INSERT INTO KhachHang (MaKH, TenKH, Diachi, Ngaysinh, SoDT)
VALUES
    ('KH01', 'Nguyễn Văn A', '123 Đường ABC', '1990-01-15', '0123456789'),
    ('KH02', 'Trần Thị B', '456 Đường XYZ', '1985-05-20', '0987654321'),
    ('KH03', 'Lê Văn C', '789 Đường PQR', '1992-09-10', '0369847521'),
    ('KH04', 'Nguyễn Thị D', '101 Đường LMN', '1988-12-05', '0741285963'),
    ('KH05', 'Phạm Văn E', '222 Đường KLM', '1995-03-25', '0321654987');

INSERT INTO NhanVien (MaNV, HoTen, GioiTinh, DiaChi, Ngaysinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES
    ('NV01', 'Nguyễn Văn Quang', 1, '456 Đường XYZ', '1980-07-10', '0987654321', 'quang@gmail.com', 'Hà Nội', '2005-04-15', 'NV02'),
    ('NV02', 'Trần Thị Hương', 0, '123 Đường ABC', '1982-05-20', '0123456789', 'huong@gmail.com', 'Hà Nội', '2006-03-18', 'NV01'),
    ('NV03', 'Lê Văn Hải', 1, '789 Đường PQR', '1984-09-25', '0369847521', 'hai@gmail.com', 'Hồ Chí Minh', '2008-02-22', 'NV01'),
    ('NV04', 'Nguyễn Thị Linh', 0, '101 Đường LMN', '1986-12-01', '0741285963', 'linh@gmail.com', 'Hà Nội', '2009-11-10', 'NV02'),
    ('NV05', 'Phạm Văn Tùng', 1, '222 Đường KLM', '1990-03-12', '0321654987', 'tung@gmail.com', 'Hồ Chí Minh', '2010-09-05', 'NV02');
    
INSERT INTO NhaCungCap (MaNCC, TenNCC, Diachi, DienThoai, Email, Website)
VALUES
    ('NCC01', 'Công ty A', '123 Đường ABC', '0123456789', 'congtyA@gmail.com', 'www.congtyA.com'),
    ('NCC02', 'Công ty B', '456 Đường XYZ', '0987654321', 'congtyB@gmail.com', 'www.congtyB.com'),
    ('NCC03', 'Công ty C', '789 Đường PQR', '0369847521', 'congtyC@gmail.com', 'www.congtyC.com'),
    ('NCC04', 'Công ty D', '101 Đường LMN', '0741285963', 'congtyD@gmail.com', 'www.congtyD.com'),
    ('NCC05', 'Công ty E', '222 Đường KLM', '0321654987', 'congtyE@gmail.com', 'www.congtyE.com');
    
INSERT INTO LoaiSP (MaLoaiSP, TenloaiSP, GhiChu)
VALUES
    ('LSP01', 'Điện thoại di động', 'Các sản phẩm điện thoại di động'),
    ('LSP02', 'Laptop', 'Các sản phẩm máy tính xách tay'),
    ('LSP03', 'Máy tính bàn', 'Các sản phẩm máy tính để bàn'),
    ('LSP04', 'Máy ảnh', 'Các sản phẩm máy ảnh số'),
    ('LSP05', 'Phụ kiện điện tử', 'Các sản phẩm phụ kiện điện tử');
    
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, Donvitinh, Ghichu)
VALUES
    ('SP01', 'LSP01', 'iPhone 12', 'Cái', 'Màu đen, 128GB'),
    ('SP02', 'LSP02', 'Dell XPS 13', 'Cái', 'Màn hình 13 inch, Core i7'),
    ('SP03', 'LSP03', 'HP Pavilion', 'Cái', 'Màn hình 21.5 inch, Core i5'),
    ('SP04', 'LSP04', 'Canon EOS 5D Mark IV', 'Cái', '20.2MP, 4K video'),
    ('SP05', 'LSP05', 'Tai nghe Bluetooth', 'Cặp', 'Kết nối Bluetooth, chất lượng âm thanh cao cấp');

INSERT INTO PhieuNhap (SoPN, MaNV, MaNCC, Ghichu)
VALUES
    ('PN001', 'NV01', 'NCC01', 'Phiếu nhập số 1'),
    ('PN002', 'NV02', 'NCC02', 'Phiếu nhập số 2'),
    ('PN003', 'NV03', 'NCC03', 'Phiếu nhập số 3'),
    ('PN004', 'NV04', 'NCC04', 'Phiếu nhập số 4'),
    ('PN005', 'NV05', 'NCC05', 'Phiếu nhập số 5');
    
INSERT INTO ChitietPhieuNhap (MaSP, SoPN, Soluong, Gianhap)
VALUES
    ('SP01', 'PN001', 50, 12000000),
    ('SP02', 'PN001', 30, 15000000),
    ('SP03', 'PN002', 20, 10000000),
    ('SP04', 'PN003', 10, 25000000),
    ('SP05', 'PN004', 40, 5000000);

INSERT INTO PhieuXuat (SoPX, MaNV, MaKH, NgayBan, Ghichu)
VALUES
    ('PX001', 'NV01', 'KH01', '2023-10-15', 'Phiếu xuất số 1'),
    ('PX002', 'NV02', 'KH02', '2023-10-16', 'Phiếu xuất số 2'),
    ('PX003', 'NV03', 'KH03', '2023-10-17', 'Phiếu xuất số 3'),
    ('PX004', 'NV04', 'KH04', '2023-10-18', 'Phiếu xuất số 4'),
    ('PX005', 'NV05', 'KH05', '2023-10-19', 'Phiếu xuất số 5');

INSERT INTO ChitietPhieuXuat (SoPX, MaSP, Soluong, Giaban)
VALUES
    ('PX001', 'SP01', 10, 15000000),
    ('PX001', 'SP02', 5, 20000000),
    ('PX002', 'SP03', 8, 12000000),
    ('PX003', 'SP04', 2, 35000000),
    ('PX004', 'SP05', 15, 6000000);
-- Bài 3.3	Thêm 1 nhân viên mới và 1 sản phẩm mới (Tùy chọn các thông tin liên quan còn lại)
INSERT INTO NhanVien (MaNV, HoTen, GioiTinh, DiaChi, Ngaysinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES  ('NV06', 'Nguyễn Văn Mới', 1, '678 Đường ABC', '1981-07-10', '0987321321', 'moi@gmail.com', 'Sài Gòn', '2005-04-15', 'NV01');

INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, Donvitinh, Ghichu) 
VALUES     ('SP06', 'LSP01', 'iPhone 14', 'Cái', 'Màu đen, 256GB');

-- Bài 4: Dùng lệnh UPDATE cập nhật dữ liệu các bảng
-- 1.	Cập nhật lại số điện thoại mới cho khách hàng mã KH10. (Tùy chọn các thông tin liên quan)
-- 2.	Cập nhật lại địa chỉ mới của nhân viên mã NV05 (Tùy chọn các thông tin liên quan)
UPDATE KhachHang SET SoDT = '0123456780' WHERE MaKH = 'KH01'; 
UPDATE NhanVien SET DiaChi = '123 Đường XYZ' WHERE MaNV = 'NV05'; 

-- Bài 5: Dùng lệnh DELETE xóa dữ liệu các bảng
-- 1.	Xóa nhân viên mới vừa thêm tại yêu cầu bài 3.3
-- 2.	Xóa sản phẩm mã SP06
DELETE FROM NhanVien WHERE MaNV = 'NV06'; 
DELETE FROM SanPham WHERE MaSP = 'SP06'; 

-- Bài 6: Dùng lệnh SELECT lấy dữ liệu từ các bảng
-- 1.	Liệt kê thông tin về nhân viên trong cửa hàng, gồm: mã nhân viên, họ tên nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi. Kết quả sắp xếp theo tuổi.

SELECT MaNV, HoTen, 
       CASE
           WHEN GioiTinh = 1 THEN 'Nam'
           ELSE 'Nữ'
       END AS GioiTinh,
       NgaySinh, DiaChi, DienThoai, 
       YEAR(CURRENT_DATE) - YEAR(NgaySinh) AS Tuoi
FROM quanlybanhang_finish.NhanVien
ORDER BY Tuoi;

-- 2.	Liệt kê các hóa đơn nhập hàng trong tháng 6/2018, gồm thông tin số phiếu nhập, mã nhân viên nhập hàng, họ tên nhân viên, họ tên nhà cung cấp, ngày nhập hàng, ghi chú.
SELECT PN.SoPN, NV.MaNV, NV.HoTen AS TenNhanVien, NCC.TenNCC, PN.NgayNhap, PN.GhiChu
FROM quanlybanhang_finish.PhieuNhap PN
JOIN quanlybanhang_finish.NhanVien NV ON PN.MaNV = NV.MaNV
JOIN quanlybanhang_finish.NhaCungCap NCC ON PN.MaNCC = NCC.MaNCC
WHERE YEAR(PN.NgayNhap) = 2023 AND MONTH(PN.NgayNhap) = 11;    

-- 3.	Liệt kê tất cả sản phẩm có đơn vị tính là cái và cặp, gồm tất cả thông tin về sản phẩm.
SELECT * FROM quanlybanhang_finish.SanPham WHERE Donvitinh IN ('Cặp');
SELECT * FROM quanlybanhang_finish.SanPham WHERE Donvitinh IN ('Cái');

-- 4.	Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: số phiếu nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá nhập, thành tiền.
SELECT PN.SoPN, CT.MaSP, SP.TenSP, LSP.TenloaiSP, SP.Donvitinh, CT.Soluong, CT.Gianhap, CT.Soluong * CT.Gianhap AS ThanhTien
FROM quanlybanhang_finish.ChitietPhieuNhap CT
JOIN quanlybanhang_finish.PhieuNhap PN ON CT.SoPN = PN.SoPN
JOIN quanlybanhang_finish.SanPham SP ON CT.MaSP = SP.MaSP
JOIN quanlybanhang_finish.LoaiSP LSP ON SP.MaLoaiSP = LSP.MaLoaiSP
WHERE YEAR(PN.NgayNhap) = YEAR(NOW()) AND MONTH(PN.NgayNhap) = MONTH(NOW());

-- 5.	Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm thông tin: mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại, email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng.
SELECT NCC.MaNCC, NCC.TenNCC, NCC.Diachi, NCC.DienThoai, NCC.Email, PN.SoPN, PN.NgayNhap
FROM NhaCungCap NCC
JOIN quanlybanhang_finish.PhieuNhap PN ON NCC.MaNCC = PN.MaNCC
WHERE YEAR(PN.NgayNhap) = YEAR(NOW()) AND MONTH(PN.NgayNhap) = MONTH(NOW())
ORDER BY PN.NgayNhap;

-- 6.	Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 2018 gồm thông tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
SELECT PX.SoPX, NV.HoTen AS NhanVienBanHang, PX.NgayBan, CT.MaSP, SP.TenSP, SP.Donvitinh, CT.Soluong, CT.Giaban, CT.Soluong * CT.Giaban AS DoanhThu
FROM quanlybanhang_finish.ChitietPhieuXuat CT
JOIN quanlybanhang_finish.PhieuXuat PX ON CT.SoPX = PX.SoPX
JOIN quanlybanhang_finish.NhanVien NV ON PX.MaNV = NV.MaNV
JOIN quanlybanhang_finish.SanPham SP ON CT.MaSP = SP.MaSP
WHERE YEAR(PX.NgayBan) = 2023 AND MONTH(PX.NgayBan) <= 11;

-- 7.	Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành (gồm tất cả thông tin của khách hàng)
SELECT * FROM KhachHang WHERE MONTH(Ngaysinh) = MONTH(NOW());

-- 8.	Liệt kê các hóa đơn bán hàng từ ngày 15/04/2018 đến 15/05/2018 gồm các thông tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
SELECT PX.SoPX, NV.HoTen AS NhanVienBanHang, PX.NgayBan, CT.MaSP, SP.TenSP, SP.Donvitinh, CT.Soluong, CT.Giaban, CT.Soluong * CT.Giaban AS DoanhThu
FROM quanlybanhang_finish.ChitietPhieuXuat CT
JOIN quanlybanhang_finish.PhieuXuat PX ON CT.SoPX = PX.SoPX
JOIN quanlybanhang_finish.NhanVien NV ON PX.MaNV = NV.MaNV
JOIN quanlybanhang_finish.SanPham SP ON CT.MaSP = SP.MaSP
WHERE PX.NgayBan >= '2023-10-11' AND PX.NgayBan <= '2023-11-11';

-- 9.	Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: số phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá.
SELECT PX.SoPX, PX.NgayBan, KH.MaKH, KH.TenKH, SUM(CT.Soluong * CT.Giaban) AS TriGia
FROM quanlybanhang_finish.PhieuXuat PX
JOIN quanlybanhang_finish.KhachHang KH ON PX.MaKH = KH.MaKH
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
GROUP BY PX.SoPX, PX.NgayBan, KH.MaKH, KH.TenKH;

-- 10.	 Cho biết tổng số Laptop, Máy tính bàn đã bán trong 6 tháng đầu năm 2018. Thông tin hiển thị: tổng số lượng.
SELECT SUM(CT.Soluong) AS TongSoLuong
FROM quanlybanhang_finish.ChitietPhieuXuat CT
JOIN quanlybanhang_finish.PhieuXuat PX ON CT.SoPX = PX.SoPX
JOIN quanlybanhang_finish.SanPham SP ON CT.MaSP = SP.MaSP
WHERE YEAR(PX.NgayBan) = 2023 AND MONTH(PX.NgayBan) <= 11
AND SP.MaLoaiSP IN ('LSP02', 'LSP03');

-- 11.	Tổng kết doanh thu theo từng khách hàng theo tháng, gồm các thông tin: tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền.
SELECT YEAR(PX.NgayBan) AS Nam, MONTH(PX.NgayBan) AS Thang, KH.MaKH, KH.TenKH, KH.Diachi, SUM(CT.Soluong * CT.Giaban) AS TongTien
FROM quanlybanhang_finish.PhieuXuat PX
JOIN quanlybanhang_finish.KhachHang KH ON PX.MaKH = KH.MaKH
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
GROUP BY YEAR(PX.NgayBan), MONTH(PX.NgayBan), KH.MaKH, KH.TenKH, KH.Diachi
ORDER BY Nam, Thang, KH.MaKH;

-- 12.	Thống kê tổng số lượng sản phẩm đã bán theo từng tháng trong năm, gồm thông tin: năm, tháng, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.
SELECT YEAR(PX.NgayBan) AS Nam, MONTH(PX.NgayBan) AS Thang, CT.MaSP, SP.TenSP, SP.Donvitinh, SUM(CT.Soluong) AS TongSoLuong
FROM quanlybanhang_finish.PhieuXuat PX
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
JOIN quanlybanhang_finish.SanPham SP ON CT.MaSP = SP.MaSP
GROUP BY YEAR(PX.NgayBan), MONTH(PX.NgayBan), CT.MaSP, SP.TenSP, SP.Donvitinh
ORDER BY Nam, Thang, CT.MaSP;

-- 13.	Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 2018, thông tin hiển thị gồm: tháng, doanh thu.
SELECT YEAR(PX.NgayBan) AS Nam, MONTH(PX.NgayBan) AS Thang, SUM(CT.Soluong * CT.Giaban) AS DoanhThu
FROM quanlybanhang_finish.PhieuXuat PX
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
WHERE YEAR(PX.NgayBan) = 2023 AND MONTH(PX.NgayBan) <= 11
GROUP BY YEAR(PX.NgayBan), MONTH(PX.NgayBan)
ORDER BY Nam, Thang;

-- 14.	Liệt kê các hóa đơn bán hàng của tháng 5 và tháng 6 năm 2018, gồm các thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng, tổng trị giá.
SELECT PX.SoPX, PX.NgayBan, NV.HoTen AS NhanVienBanHang, KH.TenKH, SUM(CT.Soluong * CT.Giaban) AS TongTriGia
FROM quanlybanhang_finish.PhieuXuat PX
JOIN quanlybanhang_finish.NhanVien NV ON PX.MaNV = NV.MaNV
JOIN quanlybanhang_finish.KhachHang KH ON PX.MaKH = KH.MaKH
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
WHERE YEAR(PX.NgayBan) = 2023 AND MONTH(PX.NgayBan) IN (10, 11)
GROUP BY PX.SoPX, PX.NgayBan, NhanVienBanHang, KH.TenKH
ORDER BY PX.NgayBan;

-- 15.	Cuối ngày, nhân viên tổng kết các hóa đơn bán hàng trong ngày, thông tin gồm: số phiếu xuất, mã khách hàng, tên khách hàng, họ tên nhân viên bán hàng, ngày bán, trị giá.
SELECT PX.SoPX, KH.MaKH, KH.TenKH, NV.HoTen AS NhanVienBanHang, PX.NgayBan, SUM(CT.Soluong * CT.Giaban) AS Trigia
FROM quanlybanhang_finish.PhieuXuat PX
JOIN quanlybanhang_finish.KhachHang KH ON PX.MaKH = KH.MaKH
JOIN quanlybanhang_finish.NhanVien NV ON PX.MaNV = NV.MaNV
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
WHERE DATE(PX.NgayBan) = '2023-10-16' 
GROUP BY PX.SoPX, KH.MaKH, KH.TenKH, NhanVienBanHang, PX.NgayBan
ORDER BY PX.SoPX;

-- 16.	Thống kê doanh số bán hàng theo từng nhân viên, gồm thông tin: mã nhân viên, họ tên nhân viên, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số lượng.
SELECT NV.MaNV, NV.HoTen AS TenNhanVien, SP.MaSP, SP.TenSP, SP.Donvitinh, SUM(CT.Soluong) AS TongSoLuong
FROM quanlybanhang_finish.NhanVien NV
JOIN quanlybanhang_finish.PhieuXuat PX ON NV.MaNV = PX.MaNV
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
JOIN quanlybanhang_finish.SanPham SP ON CT.MaSP = SP.MaSP
GROUP BY NV.MaNV, TenNhanVien, SP.MaSP, SP.TenSP, SP.Donvitinh
ORDER BY NV.MaNV;

-- 17.	Liệt kê các hóa đơn bán hàng cho khách vãng lai (KH01) trong quý 2/2018, thông tin gồm số phiếu xuất, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, đơn giá, thành tiền.
SELECT PX.SoPX, PX.NgayBan, CT.MaSP, SP.TenSP, SP.Donvitinh, CT.Soluong, CT.Giaban, CT.Soluong * CT.Giaban AS Thanhtien
FROM quanlybanhang_finish.PhieuXuat PX
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
JOIN quanlybanhang_finish.SanPham SP ON CT.MaSP = SP.MaSP
WHERE PX.MaKH = 'KH01' 
    AND YEAR(PX.NgayBan) = 2023
    AND (MONTH(PX.NgayBan) BETWEEN 10 AND 11)
ORDER BY PX.SoPX;

-- 18.	Liệt kê các sản phẩm chưa bán được trong 6 tháng đầu năm 2018, thông tin gồm: mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính.
SELECT SP.MaSP, SP.TenSP, LSP.TenloaiSP, SP.Donvitinh
FROM quanlybanhang_finish.SanPham SP
JOIN quanlybanhang_finish.LoaiSP LSP ON SP.MaLoaiSP = LSP.MaLoaiSP
WHERE SP.MaSP NOT IN (
    SELECT DISTINCT CT.MaSP
    FROM quanlybanhang_finish.ChitietPhieuXuat CT
    JOIN quanlybanhang_finish.PhieuXuat PX ON CT.SoPX = PX.SoPX
    WHERE YEAR(PX.NgayBan) = 2022 AND MONTH(PX.NgayBan) BETWEEN 10 AND 12
);

-- 19.	Liệt kê danh sách nhà cung cấp không giao dịch mua bán với cửa hàng trong quý 2/2018, gồm thông tin: mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số điện thoại.
SELECT NCC.MaNCC, NCC.TenNCC, NCC.Diachi, NCC.DienThoai
FROM quanlybanhang_finish.NhaCungCap NCC
WHERE NCC.MaNCC NOT IN (
    SELECT DISTINCT PX.MaNCC
    FROM quanlybanhang_finish.PhieuNhap PX
    WHERE YEAR(PX.Ngaynhap) = 2023 AND MONTH(PX.Ngaynhap) BETWEEN 1 AND 6
);

-- 20.	Cho biết khách hàng có tổng trị giá đơn hàng lớn nhất trong 6 tháng đầu năm 2018.
SELECT KH.MaKH, KH.TenKH, SUM(CT.Soluong * CT.Giaban) AS TongTrigia
FROM quanlybanhang_finish.KhachHang KH
JOIN quanlybanhang_finish.PhieuXuat PX ON KH.MaKH = PX.MaKH
JOIN quanlybanhang_finish.ChitietPhieuXuat CT ON PX.SoPX = CT.SoPX
WHERE YEAR(PX.NgayBan) = 2023 AND MONTH(PX.NgayBan) BETWEEN 6 AND 12
GROUP BY KH.MaKH, KH.TenKH
ORDER BY TongTrigia DESC
LIMIT 1;

-- 21.	Cho biết mã khách hàng và số lượng đơn đặt hàng của mỗi khách hàng. 
SELECT MaKH, COUNT(*) AS SoLuongDonDatHang
FROM quanlybanhang_finish.PhieuXuat
GROUP BY MaKH;

-- 22.Cho biết mã nhân viên, tên nhân viên, tên khách hàng kể cả những nhân viên không đại diện bán hàng.
SELECT NV.MaNV, NV.HoTen AS TenNhanVien, KH.TenKH
FROM quanlybanhang_finish.NhanVien NV
LEFT JOIN quanlybanhang_finish.PhieuXuat PX ON NV.MaNV = PX.MaNV
LEFT JOIN quanlybanhang_finish.KhachHang KH ON PX.MaKH = KH.MaKH;

-- 23.	Cho biết số lượng nhân viên nam, số lượng nhân viên nữ
SELECT
    SUM(CASE WHEN GioiTinh = 1 THEN 1 ELSE 0 END) AS SoLuongNam,
    SUM(CASE WHEN GioiTinh = 0 THEN 1 ELSE 0 END) AS SoLuongNu
FROM quanlybanhang_finish.NhanVien;

-- 24.	Cho biết mã nhân viên, tên nhân viên, số năm làm việc của những nhân viên có thâm niên cao nhất.
SELECT NV.MaNV, NV.HoTen AS TenNhanVien, DATEDIFF(NOW(), NV.NgayVaoLam) AS SoNamLamViec
FROM quanlybanhang_finish.NhanVien NV
WHERE DATEDIFF(NOW(), NV.NgayVaoLam) = (
    SELECT MAX(DATEDIFF(NOW(), NgayVaoLam))
    FROM quanlybanhang_finish.NhanVien
);

-- 25.	Hãy cho biết họ tên của những nhân viên đã đến tuổi về hưu (nam:60 tuổi, nữ: 55 tuổi)
SELECT HoTen
FROM quanlybanhang_finish.NhanVien
WHERE
    (GioiTinh = 1 AND YEAR(NOW()) - YEAR(NgaySinh) >= 30) OR
    (GioiTinh = 0 AND YEAR(NOW()) - YEAR(NgaySinh) >= 25);

-- 26.	Hãy cho biết họ tên của nhân viên và năm về hưu của họ.
SELECT HoTen, 
    CASE 
        WHEN GioiTinh = 1 THEN YEAR(NgaySinh) + 60 -- Nam về hưu ở tuổi 60
        WHEN GioiTinh = 0 THEN YEAR(NgaySinh) + 55 -- Nữ về hưu ở tuổi 55
        ELSE NULL -- Trường hợp khác không xác định
    END AS NamVeHuu
FROM quanlybanhang_finish.NhanVien;
-- 27.	Cho biết tiền thưởng tết dương lịch của từng nhân viên. Biết rằng - thâm niên <1 năm thưởng 200.000 - 1 năm <= thâm niên < 3 năm thưởng
-- 400.000 - 3 năm <= thâm niên < 5 năm thưởng 600.000 - 5 năm <= thâm niên < 10 năm thưởng 800.000 - thâm niên >= 10 năm thưởng 1.000.000
SELECT
    MaNV,
    HoTen,
    CASE
        WHEN DATEDIFF(NOW(), NgayVaoLam) < 365 THEN 200000
        WHEN DATEDIFF(NOW(), NgayVaoLam) >= 365 AND DATEDIFF(NOW(), NgayVaoLam) < 1095 THEN 400000
        WHEN DATEDIFF(NOW(), NgayVaoLam) >= 1095 AND DATEDIFF(NOW(), NgayVaoLam) < 1825 THEN 600000
        WHEN DATEDIFF(NOW(), NgayVaoLam) >= 1825 AND DATEDIFF(NOW(), NgayVaoLam) < 3650 THEN 800000
        ELSE 1000000
    END AS TienThuongTetDuongLich
FROM quanlybanhang_finish.NhanVien;

-- 28.	Cho biết những sản phẩm thuộc ngành hàng Hóa mỹ phẩm
SELECT SP.MaSP, SP.MaLoaiSP, SP.TenSP, SP.Donvitinh, SP.Ghichu
FROM quanlybanhang_finish.SanPham SP
JOIN quanlybanhang_finish.LoaiSP LS ON SP.MaLoaiSP = LS.MaLoaiSP
WHERE LS.TenloaiSP like 'Laptop';

-- 29.Cho biết những sản phẩm thuộc loại Quần áo.
SELECT SP.MaSP, SP.MaLoaiSP, SP.TenSP, SP.Donvitinh, SP.Ghichu
FROM quanlybanhang_finish.SanPham SP
JOIN quanlybanhang_finish.LoaiSP LS ON SP.MaLoaiSP = LS.MaLoaiSP
WHERE LS.TenloaiSP = 'Điện thoại di động';

-- 30.	Cho biết số lượng sản phẩm loại Quần áo.
SELECT COUNT(*) AS SoLuongSanPham
FROM quanlybanhang_finish.SanPham SP
JOIN quanlybanhang_finish.LoaiSP LS ON SP.MaLoaiSP = LS.MaLoaiSP
WHERE LS.TenloaiSP = 'Máy tính bàn';

-- 31.	Cho biết số lượng loại sản phẩm ngành hàng Hóa mỹ phẩm. 
SELECT COUNT(*) AS SoLuongLoaiSanPham
FROM quanlybanhang_finish.LoaiSP
WHERE LoaiSP.TenloaiSP = 'Phụ kiện điện tử';

-- 32.Cho biết số lượng sản phẩm theo từng loại sản phẩm.
SELECT LS.MaLoaiSP, LS.TenloaiSP, COUNT(SP.MaSP) AS SoLuongSanPham
FROM quanlybanhang_finish.LoaiSP LS
LEFT JOIN quanlybanhang_finish.SanPham SP ON LS.MaLoaiSP = SP.MaLoaiSP
GROUP BY LS.MaLoaiSP, LS.TenloaiSP;





