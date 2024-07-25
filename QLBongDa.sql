﻿CREATE DATABASE QL_BONGDA
USE QL_BONGDA
GO
CREATE TABLE SANVD
(
	MASAN VARCHAR(5)					NOT NULL,
	TENSAN NVARCHAR(100)				NOT NULL,
	DIACHI NVARCHAR(200)				NOT NULL,
	CONSTRAINT PK_SANVD PRIMARY KEY (MASAN),
)
CREATE TABLE TINH
(
	MATINH VARCHAR(5)				NOT NULL,
	TENTINH NVARCHAR(100)			NOT NULL,
	CONSTRAINT PK_TINH PRIMARY KEY (MATINH),
)
CREATE TABLE QUOCGIA
(
    MAQG VARCHAR(5)					NOT NULL,
	TENQG NVARCHAR(60)				NOT NULL,
	CONSTRAINT PK_QUOCGIA PRIMARY KEY (MAQG),
)
CREATE TABLE HUANLUYENVIEN
(
    MAHLV VARCHAR(5)				NOT NULL,
	TENHLV NVARCHAR(100)			NOT NULL,
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(200),
	DIENTHOAI NVARCHAR(20),
	MAQG VARCHAR(5)					NOT NULL,
	CONSTRAINT FK_HLV PRIMARY KEY (MAHLV),
	CONSTRAINT FK_HLV_QUOCGIA FOREIGN KEY (MAQG) REFERENCES QUOCGIA(MAQG),
)
CREATE TABLE CAULACBO
(
    MACLB VARCHAR(5)				NOT NULL,
	TENCLB NVARCHAR(100)			NOT NULL,
	MASAN VARCHAR(5)				NOT NULL,
	MATINH VARCHAR(5)				NOT NULL,
	CONSTRAINT PK_CAULACBO PRIMARY KEY (MACLB),
	CONSTRAINT FK_CLB_SAN FOREIGN KEY (MASAN) REFERENCES SANVD(MASAN),
	CONSTRAINT FK_CLB_TINH FOREIGN KEY (MATINH) REFERENCES TINH(MATINH),
)
CREATE TABLE HLV_CLB
(
    MAHLV VARCHAR(5)				NOT NULL,
	MACLB VARCHAR(5)				NOT NULL,
	VAITRO NVARCHAR(100)			NOT NULL,
	CONSTRAINT PK_HLVCLB PRIMARY KEY (MAHLV, MACLB),
	CONSTRAINT FK_HLVCLB_HLV FOREIGN KEY (MAHLV) REFERENCES HUANLUYENVIEN(MAHLV),
	CONSTRAINT FK_HLVCLB_CLB FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB),
)
CREATE TABLE CAUTHU
(
	MACT NUMERIC IDENTITY(1,1)		NOT NULL,
	HOTEN NVARCHAR(100)				NOT NULL,
	VITRI NVARCHAR(20)				NOT NULL,
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(200),
	MACLB VARCHAR (5)				NOT NULL,
	MAQG VARCHAR (5)				NOT NULL,
	SO INT							NOT NULL,
CONSTRAINT PK_CAUTHU PRIMARY KEY (MACT),
CONSTRAINT FK_CAUTHU_CAULACBO FOREIGN KEY(MACLB) REFERENCES CAULACBO(MACLB),
CONSTRAINT FK_CAUTHU_QUOCGIA FOREIGN KEY(MAQG) REFERENCES QUOCGIA(MAQG)
)
CREATE TABLE TRANDAU
(
	MATRAN NUMERIC IDENTITY(1,1)	NOT NULL,
	NAM INT							NOT NULL,
	VONG INT						NOT NULL,
	NGAYTD DATETIME					NOT NULL,
	MACLB1 VARCHAR(5)				NOT NULL,
	MACLB2 VARCHAR(5)				NOT NULL,
	MASAN VARCHAR(5)				NOT NULL,
	KETQUA VARCHAR(5)				NOT NULL,
	CONSTRAINT PK_TRANDAU PRIMARY KEY (MATRAN),
	CONSTRAINT FK_TRANDAU_CAULACBO1 FOREIGN KEY (MACLB1) REFERENCES CAULACBO(MACLB),
	CONSTRAINT FK_TRANDAU_CAULACBO2 FOREIGN KEY (MACLB2) REFERENCES CAULACBO(MACLB),
	CONSTRAINT FK_TRANDAU_SANVD FOREIGN KEY (MASAN) REFERENCES SANVD(MASAN),
)
CREATE TABLE BANGXH
(
    MACLB VARCHAR(5)				NOT NULL,
	NAM INT							NOT NULL,
	VONG INT						NOT NULL,
	SOTRAN INT						NOT NULL,
	THANG INT						NOT NULL,
	HOA INT							NOT NULL,
	THUA INT						NOT NULL,
	HIEUSO VARCHAR(5)				NOT NULL,
	DIEM INT						NOT NULL,
	HANG INT						NOT NULL,
	CONSTRAINT PK_BANGXH PRIMARY KEY (MACLB, NAM, VONG),
	CONSTRAINT FK_BANGXH_CLB FOREIGN KEY (MACLB) REFERENCES CAULACBO(MACLB),
)

INSERT INTO SANVD VALUES('GD',N'Gò Đậu',N'123 QL1, TX Thủ Dầu Một, Bình Dương')
INSERT INTO SANVD VALUES('PL',N'Pleiku',N'22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai')
INSERT INTO SANVD VALUES('CL',N'Chi Lăng',N'127 Võ Văn Tần, Đà Nẵng')
INSERT INTO SANVD VALUES('NT',N'Nha Trang',N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa')
INSERT INTO SANVD VALUES('TH',N'Tuy Hòa',N'57 Trường Chinh, Tuy Hòa, Phú Yên')
INSERT INTO SANVD VALUES('LA',N'Long An',N'102 Hùng Vương, Tp Tân An, Long An')

INSERT INTO TINH VALUES('BD',N'Bình Dương')
INSERT INTO TINH VALUES('GL',N'Gia Lai')
INSERT INTO TINH VALUES('DN',N'Đà Nẵng')
INSERT INTO TINH VALUES('KH',N'Khánh Hòa')
INSERT INTO TINH VALUES('PY',N'Phú Yên')
INSERT INTO TINH VALUES('LA',N'Long An')

INSERT INTO QUOCGIA VALUES('VN',N'Việt Nam')
INSERT INTO QUOCGIA VALUES('ANH',N'Anh Quốc')
INSERT INTO QUOCGIA VALUES('TBN',N'Tây Ban Nha')
INSERT INTO QUOCGIA VALUES('BDN',N'Bồ Đào Nha')
INSERT INTO QUOCGIA VALUES('BRA',N'Brazil')
INSERT INTO QUOCGIA VALUES('ITA',N'Ý')
INSERT INTO QUOCGIA VALUES('THA',N'Thái Lan')

INSERT INTO HUANLUYENVIEN (MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG)
VALUES 
('HLV01', N'Vital'			,'10/15/1955', NULL, '0918011075', 'BDN'),
('HLV02', N'Lê Huỳnh Đức'	,'05/20/1972', NULL, '01223456789', 'VN'),
('HLV03', N'Kiatisuk'		,'12/11/1970', NULL, '01990123456', 'THA'),
('HLV04', N'Hoàng Anh Tuấn'	,'06/10/1970', NULL, '0989112233', 'VN'),
('HLV05', N'Trần Công Minh'	,'07/07/1973', NULL, '0909099990', 'VN'),
('HLV06', N'Trần Văn Phúc'	,'03/02/1965', NULL, '01650101234', 'VN');

INSERT INTO CAULACBO VALUES('BBD',N'BECAMEX BÌNH DƯƠNG','GD','BD')
INSERT INTO CAULACBO VALUES('HAGL',N'HOÀNG ANH GIA LAI','PL','GL')
INSERT INTO CAULACBO VALUES('SDN',N'SHB ĐÀ NẴNG','CL','DN')
INSERT INTO CAULACBO VALUES('KKH',N'KHATOCO KHÁNH HÒA','NT','KH')
INSERT INTO CAULACBO VALUES('TPY',N'THÉP PHÚ YÊN','TH','PY')
INSERT INTO CAULACBO VALUES('GDT',N'GẠCH ĐỒNG TÂM LONG AN','LA','LA')

INSERT INTO HLV_CLB VALUES('HLV01','BBD',N'HLV Chính')
INSERT INTO HLV_CLB VALUES('HLV02','SDN',N'HLV Chính')
INSERT INTO HLV_CLB VALUES('HLV03','HAGL',N'HLV Chính')
INSERT INTO HLV_CLB VALUES('HLV04','KKH',N'HLV Chính')
INSERT INTO HLV_CLB VALUES('HLV05','GDT',N'HLV Chính')
INSERT INTO HLV_CLB VALUES('HLV06','BBD',N'HLV thủ môn')

SET IDENTITY_INSERT CAUTHU ON;
INSERT INTO CAUTHU (MACT,HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO)
VALUES
(1,N'Nguyễn Vũ Phong', N'Tiền vệ', '02-20-1990', NULL, 'BBD', 'VN', 17),
(2,N'Nguyễn Công Vinh', N'Tiền đạo', '03-10-1992', NULL, 'HAGL', 'VN', 9),
(4,N'Trần Tấn Tài', N'Tiền vệ', '11-12-1989', NULL, 'BBD', 'VN', 8),
(5,N'Phan Hồng Sơn', N'Thủ môn', '06-10-1991', NULL, 'HAGL', 'VN', 1),
(6,N'Ronaldo', N'Tiền vệ', '12-12-1989', NULL, 'SDN', 'BRA', 7),
(7,N'Robinho', N'Tiền vệ', '10-12-1989', NULL, 'SDN', 'BRA', 8),
(8,N'Vidic', N'Hậu vệ', '10-15-1987', NULL, 'HAGL', 'ANH', 3),
(9,N'Trần Văn Santos', N'Thủ môn', '10-21-1990', NULL, 'BBD', 'BRA', 1),
(10,N'Nguyễn Trường Sơn', N'Hậu vệ', '08-26-1993', NULL, 'BBD', 'VN', 4);
SET IDENTITY_INSERT CAUTHU OFF;

SET IDENTITY_INSERT TRANDAU ON;
INSERT INTO TRANDAU(MATRAN, NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, KETQUA)
VALUES
 (1,2009,1,'2/7/2009','BBD','SDN','GD','3-0'),
 (2,2009,1,'2/7/2009','KKH','GDT','NT','1-1'),
 (3,2009,2,'2/16/2009','SDN','KKH','CL','2-2'),
 (4,2009,2,'2/16/2009','TPY','BBD','TH','5-0'),
 (5,2009,3,'3/1/2009','TPY','GDT','TH','0-2'),
 (6,2009,3,'3/1/2009','KKH','BBD','NT','0-1'),
 (7,2009,4,'3/7/2009','KKH','TPY','NT','1-0'),
 (8,2009,4,'3/7/2009','BBD','GDT','GD','2-2');
SET IDENTITY_INSERT TRANDAU OFF;

INSERT INTO BANGXH (MACLB, NAM, VONG, SOTRAN, THANG, HOA, THUA, HIEUSO, DIEM, HANG)
VALUES
    ('BBD', 2009, 1, 1, 1, 0, 0, '3-0', 3, 1),
    ('KKH', 2009, 1, 1, 0, 1, 0, '1-1', 1, 2),
    ('GDT', 2009, 1, 1, 0, 1, 0, '1-1', 1, 3),
    ('TPY', 2009, 1, 0, 0, 0, 0, '0-0', 0, 4),
    ('SDN', 2009, 1, 1, 0, 1, 0, '0-3', 0, 5),
    ('TPY', 2009, 2, 1, 1, 0, 0, '5-0', 3, 1),
    ('BBD', 2009, 2, 2, 1, 0, 1, '3-5', 3, 2),
    ('KKH', 2009, 2, 2, 0, 2, 0, '3-3', 2, 3),
    ('GDT', 2009, 2, 1, 0, 1, 0, '1-1', 1, 4),
    ('SDN', 2009, 2, 2, 1, 0, 1, '2-5', 1, 5),
    ('BBD', 2009, 3, 3, 2, 0, 1, '4-5', 6, 1),
    ('GDT', 2009, 3, 2, 1, 0, 0, '3-1', 4, 2),
    ('TPY', 2009, 3, 2, 1, 0, 1, '5-2', 3, 3),
    ('KKH', 2009, 3, 3, 0, 2, 1, '3-4', 2, 4),
    ('SDN', 2009, 3, 2, 1, 0, 1, '2-5', 1, 5),
    ('BBD', 2009, 4, 4, 2, 1, 1, '6-7', 7, 1),
    ('GDT', 2009, 4, 3, 1, 2, 0, '5-1', 5, 2),
    ('KKH', 2009, 4, 4, 1, 2, 1, '4-4', 5, 3),
    ('TPY', 2009, 4, 3, 1, 0, 2, '5-3', 3, 4),
    ('SDN', 2009, 4, 2, 1, 1, 0, '2-5', 1, 5);


--PHÂN QUYỀN
----Tạo user và phân quyền cho BDAdmin được toàn quyền trên CSDL QLBongDa
CREATE LOGIN BDAdmin WITH PASSWORD = '1';
USE QLBongDa;
CREATE USER BDAdmin FOR LOGIN BDAdmin;
GO
ALTER ROLE db_owner ADD MEMBER BDAdmin;
GO

----Tạo user và phân quyền cho BDBK được phép backup CSDL QLBongDa
CREATE LOGIN BDBK WITH PASSWORD = '1';
USE QLBongDa;
CREATE USER BDBK FOR LOGIN BDBK;
GO
ALTER ROLE db_backupoperator ADD MEMBER BDBK;
GO

----Tạo user và phân quyền cho BDRead chỉ được phép xem dữ liệu trong CSDL QLBongDa
CREATE LOGIN BDRead WITH PASSWORD = '1';
USE QLBongDa;
CREATE USER BDRead FOR LOGIN BDRead;
GO
ALTER ROLE db_datareader ADD MEMBER BDRead;
GO

-- Tạo user và phân quyền cho BDProfile được phép thao tác SQL Profile
CREATE LOGIN BDProfile WITH PASSWORD = '1';
USE QLBongDa;
CREATE USER BDProfile FOR LOGIN BDProfile;
GO
ALTER ROLE db_datawriter ADD MEMBER BDProfile;
GO

----Tạo user và phân quyền cho BDU01 được phép thêm mới table
CREATE LOGIN BDU01 WITH PASSWORD = '1';
CREATE USER BDU01 FOR LOGIN BDU01;

USE QLBongDa;
GO
CREATE SCHEMA [BDU01];
GO
GRANT CREATE TABLE TO [BDU01];
GO
ALTER AUTHORIZATION ON SCHEMA::[BDU01] TO [BDU01];
GO

----Tạo user và phân quyền cho BDU02 được phép cập nhật các table, 
--không được phép thêm mới hoặc xóa table
CREATE LOGIN BDU02 WITH PASSWORD = '1';
CREATE USER BDU02 FOR LOGIN BDU02;
GRANT UPDATE ON SCHEMA::dbo TO BDU02;
DENY ALTER ON SCHEMA::dbo TO BDU02;
DENY CREATE TABLE TO BDU02;
DENY DELETE TO BDU02;

----Tạo user và phân quyền cho BDU03 chỉ được phép thao tác table CauLacBo 
--(select, insert, delete, update), không được phép thao tác các table khác
CREATE LOGIN BDU03 WITH PASSWORD = '1';
CREATE USER BDU03 FOR LOGIN BDU03;
GRANT SELECT, INSERT,DELETE, UPDATE ON dbo.CAULACBO TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.BANGXH TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.CAUTHU TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.HLV_CLB TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.HUANLUYENVIEN TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.QUOCGIA TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.SANVD TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.TINH TO BDU03;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.TRANDAU TO BDU03;

----Tạo user và phân quyền cho BDU04 chỉ được phép thao tác table CAUTHU:
--không được phép xem cột Ngày sinh (NGAYSINH)
--Không chỉnh sửa giá trị trong cột Vị trí (VITRI) 
--không được phép thao tác các table khác
CREATE LOGIN BDU04 WITH PASSWORD = '1';
CREATE USER BDU04 FOR LOGIN BDU04;
GRANT SELECT, INSERT, UPDATE, DELETE ON CAUTHU TO BDU04;
DENY SELECT ON CAUTHU(NGAYSINH) TO BDU04;
DENY UPDATE ON CAUTHU(VITRI) TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.BANGXH TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.CAULACBO TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.HLV_CLB TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.HUANLUYENVIEN TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.QUOCGIA TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.SANVD TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.TINH TO BDU04;
DENY SELECT, INSERT, DELETE, UPDATE ON dbo.TRANDAU TO BDU04;


--TẠO VIEW

USE QLBongDa;
go

CREATE VIEW vCau1 AS
SELECT CAUTHU.MACT, CAUTHU.HOTEN, CAUTHU.NGAYSINH, CAUTHU.DIACHI, CAUTHU.VITRI
FROM CAUTHU
JOIN CAULACBO ON CAUTHU.MACLB = CAULACBO.MACLB
JOIN QUOCGIA ON CAUTHU.MAQG = QUOCGIA.MAQG
WHERE CAULACBO.TENCLB = N'SHB Đà Nẵng' AND QUOCGIA.TENQG = 'Brazil'

go
select * from vCau1
go

CREATE VIEW vCau2 AS
SELECT TRANDAU.MATRAN, TRANDAU.NGAYTD, SANVD.TENSAN, clb1.TenCLB AS TenCLB1, clb2.TENCLB AS TENCLB2, TRANDAU.KETQUA
FROM TRANDAU
JOIN SANVD ON TRANDAU.MASAN = SANVD.MASAN 
JOIN CAULACBO clb1 ON clb1.MaCLB = TRANDAU.MACLB1 
JOIN CAULACBO clb2 ON clb2.MaCLB = TRANDAU.MACLB2 
WHERE TRANDAU.NAM = 2009 AND TRANDAU.VONG = 3;

go
select * from vCau2
go

CREATE VIEW vCau3 AS
SELECT HLV.MAHLV, HLV.TENHLV, HLV.NGAYSINH, HLV.DIACHI, HLVCLB.VAITRO, CLB.TENCLB
FROM HUANLUYENVIEN HLV
INNER JOIN QUOCGIA QG ON HLV.MAQG = QG.MAQG
INNER JOIN HLV_CLB HLVCLB ON HLV.MAHLV = HLVCLB.MAHLV
INNER JOIN CAULACBO CLB ON HLVCLB.MACLB = CLB.MACLB
WHERE QG.TENQG = N'Việt Nam';

go
select * from vCau3
go

 CREATE VIEW vCau4 AS
 SELECT CLB.MACLB, CLB.TENCLB, SANVD.TENSAN, SANVD.DIACHI, COUNT(DISTINCT CT.MACT) AS SOCAUTHUNN
 FROM CAUTHU CT
 INNER JOIN CAULACBO CLB ON CT.MACLB = CLB.MACLB
 INNER JOIN SANVD ON CLB.MASAN = SANVD.MASAN
 WHERE CT.MAQG <> 'VN'
 GROUP BY CLB.MACLB, CLB.TENCLB, SANVD.TENSAN, SANVD.DIACHI
 HAVING COUNT(DISTINCT CT.MACT) > 2;

go
select * from vCau4
go

CREATE VIEW vCau5 AS
SELECT T.TENTINH, COUNT(DISTINCT CT.MACT) AS SLTIENDAO
FROM CAUTHU CT
INNER JOIN CAULACBO CLB ON CT.MACLB = CLB.MACLB
INNER JOIN TINH T ON CLB.MATINH = T.MATINH
WHERE CT.VITRI = N'Tiền đạo'
GROUP BY T.TENTINH

go
select * from vCau5
go

CREATE VIEW vCau6 AS
SELECT TOP 1 CLB.TENCLB, T.TENTINH
FROM BANGXH BXH
INNER JOIN CAULACBO CLB ON BXH.MACLB = CLB.MACLB
INNER JOIN TINH T ON CLB.MATINH = T.MATINH
WHERE BXH.VONG = 3 AND BXH.NAM = 2009
ORDER BY BXH.HANG DESC

go
select * from vCau6
go

CREATE VIEW vCau7 AS
SELECT HLV.TENHLV
FROM HUANLUYENVIEN HLV
INNER JOIN HLV_CLB HLVCLB ON HLV.MAHLV = HLVCLB.MAHLV
INNER JOIN CAULACBO CLB ON HLVCLB.MACLB = CLB.MACLB
WHERE HLV.DIENTHOAI IS NULL

go
select * from vCau7
go

CREATE VIEW vCau8 AS
SELECT HLV.TENHLV
FROM HUANLUYENVIEN HLV
LEFT JOIN HLV_CLB HLVCLB ON HLV.MAHLV = HLVCLB.MAHLV
LEFT JOIN CAULACBO CLB ON HLVCLB.MACLB = CLB.MACLB
WHERE HLVCLB.VAITRO IS NULL AND HLV.MAQG = 'VN' AND CLB.MACLB IS NULL

go
select * from vCau8
go


CREATE VIEW vCau9 AS
SELECT td.NGAYTD, svd.TENSAN, clb1.TENCLB AS TENCLB1, clb2.TENCLB AS TENCLB2, td.KETQUA
FROM TRANDAU td
INNER JOIN SANVD svd ON td.MASAN = svd.MASAN
LEFT JOIN CAULACBO clb1 ON td.MACLB1 = clb1.MACLB
LEFT JOIN CAULACBO clb2 ON td.MACLB2 = clb2.MACLB
WHERE td.VONG <=3 AND td.NAM = 2009
AND clb1.MACLB IN (
    SELECT TOP 1  MACLB FROM BANGXH WHERE NAM = 2009 AND VONG <= 3 ORDER BY DIEM DESC)
OR  clb2.MACLB IN (
	SELECT TOP 1  MACLB FROM BANGXH WHERE NAM = 2009 AND VONG <= 3 ORDER BY DIEM DESC)

go
select * from vCau9
go



CREATE VIEW vCau10 AS
SELECT td.NGAYTD, svd.TENSAN, clb1.TENCLB AS TENCLB1, clb2.TENCLB AS TENCLB2, td.KETQUA
FROM TRANDAU td
INNER JOIN SANVD svd ON td.MASAN = svd.MASAN
LEFT JOIN CAULACBO clb1 ON td.MACLB1 = clb1.MACLB
LEFT JOIN CAULACBO clb2 ON td.MACLB2 = clb2.MACLB
WHERE td.VONG = 3 AND td.NAM = 2009
AND clb1.MACLB IN (
    SELECT TOP 1  MACLB FROM BANGXH WHERE NAM = 2009 AND VONG = 3 ORDER BY DIEM ASC)
OR  clb2.MACLB IN (
	SELECT TOP 1  MACLB FROM BANGXH WHERE NAM = 2009 AND VONG = 3 ORDER BY DIEM ASC)

go
select * from vCau10
go


----Phân quyền cho user được phép truy xuất các view theo bảng mô tả chi tiết:
----Phân quyền cho user BDRead được phép truy xuất tất cả các View
USE QLBongDa;
GRANT SELECT ON SCHEMA::dbo TO BDRead;


----Phân quyền cho user BDU01 chỉ được phép truy xuất các View vCau5 tới vCau10
GRANT SELECT ON dbo.vCau5 TO BDU01;
GRANT SELECT ON dbo.vCau6 TO BDU01;
GRANT SELECT ON dbo.vCau7 TO BDU01;
GRANT SELECT ON dbo.vCau8 TO BDU01;
GRANT SELECT ON dbo.vCau9 TO BDU01;
GRANT SELECT ON dbo.vCau10 TO BDU01;

----Phân quyền cho user BDU03 được phép truy xuất view vCau1, vCau2, vCau3, vCau4
GRANT SELECT ON dbo.vCau1 TO BDU03;
GRANT SELECT ON dbo.vCau2 TO BDU03;
GRANT SELECT ON dbo.vCau3 TO BDU03;
GRANT SELECT ON dbo.vCau4 TO BDU03;

----Phân quyền cho user BDU04 được phép truy xuất view vCau1, vCau2, vCau3, vCau4
GRANT SELECT ON dbo.vCau1 TO BDU04;
GRANT SELECT ON dbo.vCau2 TO BDU04;
GRANT SELECT ON dbo.vCau3 TO BDU04;
GRANT SELECT ON dbo.vCau4 TO BDU04;

















