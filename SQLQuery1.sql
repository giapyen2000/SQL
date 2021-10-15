CREATE DATABASE QLySinhVien
GO
USE QLySinhVien
GO

CREATE TABLE KHOA
(
	MaKhoa VARCHAR(2) CHECK (MaKhoa LIKE '[A-Z][A-Z]'),
	TenKhoa nvarchar(30),
	SoDienThoai VARCHAR(12) CHECK (SoDienThoai LIKE '0[0-9][0-9][0-9].[0-9][0-9][0-9].[0-9][0-9][0-9]'),
	CONSTRAINT pk_MaKhoa PRIMARY KEY (MaKhoa)
)
GO

CREATE TABLE CHUONG_TRINH
(
	MaCT VARCHAR(2) CHECK (MaCT IN ('ĐH','CĐ','LT')),
	TenCT nvarchar(30),
	CONSTRAINT pk_MaCT PRIMARY KEY (MaCT)
)
GO

CREATE TABLE LOP
(
	MaLop VARCHAR(7) CHECK (MaLop LIKE '[A-Z][A-Z][0-9][0-9].[0-9][0-9]'),
	TenLop nvarchar(30),
	MaKhoa VARCHAR(2) NOT NULL,
	MaCT VARCHAR(2) NOT NULL,
	CONSTRAINT pk_MaLop PRIMARY KEY (MaLop)
)
GO


CREATE TABLE SINH_VIEN
(
	MaSV VARCHAR(8) CHECK (MaSV LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	MaLop VARCHAR(7) NOT NULL,
	HoTen nvarchar(50),
	NamSinh DATE,
	GioiTinh BIT,
	QueQuan nvarchar(30),
	CONSTRAINT pk_MaSV PRIMARY KEY (MaSV)
)
GO

CREATE TABLE MON_HOC
(
	MaMon SMALLINT IDENTITY(1,1),
	TenMon nvarchar(50),
	MaKhoa VARCHAR(2) NOT NULL,
	SoTin TINYINT CHECK (SoTin IN (2,4)),
	CONSTRAINT pk_MaMon PRIMARY KEY (MaMon)
)
GO

CREATE TABLE KET_QUA
(
	MaSV VARCHAR(8) CHECK (MaSV LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	MaMon SMALLINT,
	LanThi TINYINT CHECK (LanThi IN (1,2)),
	Diem FLOAT,
	CONSTRAINT pk_KetQua PRIMARY KEY (MaSV, MaMon, LanThi)
)
GO


ALTER TABLE dbo.SINH_VIEN
ADD CONSTRAINT fk_MaLop FOREIGN KEY (MaLop) REFERENCES dbo.LOP(MaLop)
ALTER TABLE dbo.LOP
ADD CONSTRAINT fk_MaCT FOREIGN KEY (MaCT) REFERENCES dbo.CHUONG_TRINH(MaCT)
ALTER TABLE dbo.KET_QUA
ADD CONSTRAINT fk_MaSV FOREIGN KEY (MaSV) REFERENCES dbo.SINH_VIEN(MaSV)
ALTER TABLE dbo.KET_QUA
ADD CONSTRAINT fk_MaMon FOREIGN KEY (MaMon) REFERENCES dbo.MON_HOC(MaMon)
ALTER TABLE dbo.LOP
ADD CONSTRAINT fk_MaKhoa FOREIGN KEY (MaKhoa) REFERENCES dbo.KHOA(MaKhoa)
ALTER TABLE dbo.MON_HOC
ADD CONSTRAINT fk_MaKhoa2 FOREIGN KEY (MaKhoa) REFERENCES dbo.KHOA(MaKhoa)



INSERT INTO dbo.KHOA
(
    MaKhoa,
    TenKhoa,
    SoDienThoai
)
VALUES
(   'YD',  -- MaKhoa - varchar(2)
    N'Khoa Y - Dược', -- TenKhoa - nvarchar(20)
    '0598.655.858'   -- SoDienThoai - varchar(10)
    ),
	('KT', N'Khoa Kinh Tế - Xã Hội', '0598.655.959'),
	('CK', N'Khoa Công Nghệ - Kĩ Thuật', '0598.657.070'),
	('NN', N'Khoa Ngoại Ngữ', '0598.657.171')
GO

SELECT * FROM dbo.KHOA

INSERT INTO dbo.CHUONG_TRINH
(
    MaCT,
    TenCT
)
VALUES
(   'ĐH', -- MaCT - varchar(2)
    N'Đại học' -- TenCT - nvarchar(20)
    ),
	('CĐ', N'Cao đẳng'),
	('LT', N'Liên thông')

SELECT * FROM dbo.CHUONG_TRINH

INSERT INTO dbo.LOP
(
    MaLop,
    MaKhoa,
    MaCT
)
VALUES
(   'TH23.37', -- TenLop - varchar(7)
    'CK', -- MaKhoa - varchar(2)
    'ĐH'  -- MaCT - varchar(2)
    ),
	('TH24.40', 'CK', 'ĐH'),
	('DL23.12', 'KT', 'ĐH'),
	('TH23.20', 'CK', 'ĐH'),
	('QL24.30', 'KT', 'ĐH'),
	('RM23.17', 'YD', 'ĐH'),
	('DL22.34', 'KT', 'ĐH'),
	('YK24.18', 'YD', 'ĐH'),
	('NH22.08', 'KT', 'ĐH'),
	('TR23.40', 'NN', 'ĐH')


INSERT INTO dbo.SINH_VIEN
        ( MaSV ,
          MaLop ,
          HoTen ,
          NamSinh ,
          GioiTinh ,
          QueQuan
        )
VALUES  ( '18115634' , -- MaSV - varchar(8)
          'TH23.37' , -- MaLop - varchar(7)
          N'Nguyễn Thái Lai' , -- HoTen - ntext
          '2000-05-31' , -- NamSinh - date
          1 , -- GioiTinh - bit
          N'Hưng Yên'  -- QueQuan - ntext
        ),
		('18118888', 'TH23.37', N'Giáp Thị Yến', '2000-09-20',0,N'Bắc Giang'),
		('18101163', 'DL23.12', N'Hoàng Thành Du', '2000-03-10', 1, N'Bắc Giang'),
		('18115630', 'TH24.40', N'Lê Thị Ngọc', '2000-05-05', 0, N'Bắc Giang'),
		('18106789', 'NH22.08', N'Cao Nhật Bằng', '2000-08-13', 1, N'Nghệ An'),
		('18106724', 'NH22.08', N'Trần Đức Hiếu', '2000-04-27', 1, N'Hải Dương'),
		('18111111', 'TH23.37', N'Nguyễn Thiên Bảo', '2000-12-31', 1, N'Nghệ An'),
		('18111188', 'RM23.17', N'Vũ Nguyễn Nhật Linh', '2000-03-27', 0, N'Hà Nội'),
		('18102000', 'QL24.30', N'Phạm Giang Nam', '2000-12-12', 1, N'Lào Cai'),
		('18102222', 'TR23.40', N'Mai Minh Chiến', '2000-11-14', 1, N'Ninh Bình')

INSERT INTO dbo.MON_HOC
        ( TenMon, MaKhoa, SoTin )
VALUES  ( N'Java', -- TenMon - ntext
          'CK', -- MaKhoa - varchar(2)
          4  -- SoTin - tinyint
          ),
		  (N'C++', 'CK', 4),
		  (N'Quản trị cơ sở dữ liệu', 'CK', 4),
		  (N'Thần kinh học', 'YD', 4),
		  (N'Xương khớp học', 'YD', 2),
		  (N'Thám hiểm học', 'KT', 4),
		  (N'Đại cương Triết học', 'KT', 2),
		  (N'Ngôn Ngữ Trung', 'NN', 4),
		  (N'Ngôn Ngữ Anh', 'NN', 2),
		  (N'Lịch sử Đảng Trung Quốc học', 'NN', 2)


INSERT INTO dbo.KET_QUA
        ( MaSV, MaMon, LanThi, Diem )
VALUES  ( '18115634', -- MaSV - varchar(8)
			'1',
          1, -- LanThi - tinyint
          10.0  -- Diem - numeric
          ),
		  ('18115634', '2', 1, 9.9),
		  ('18118888', '3', 1, 10.0),
		  ('18106789', '6', 1, 9.2),
		  ('18111188', '4', 1, 8.9),
		  ('18111188', '5', 2, 9.0),
		  ('18111111', '1', 2, 8.7),
		  ('18106724', '7', 1, 9.9),
		  ('18111111', '3', 1, 10.0),
		  ('18102222', '10', 1, 0),
		  ('18102000', '6', 2, 7.2)

SELECT sv.MaSV, sv.HoTen FROM dbo.SINH_VIEN sv JOIN dbo.KET_QUA kq
ON kq.MaSV = sv.MaSV
JOIN dbo.MON_HOC mh
ON mh.MaMon = kq.MaMon 
WHERE kq.Diem < 9.0 AND kq.LanThi = 2 AND mh.SoTin = 4 AND sv.HoTen LIKE '%b%'

SELECT TOP(1) sv.HoTen FROM dbo.SINH_VIEN sv JOIN dbo.KET_QUA kq
ON kq.MaSV = sv.MaSV
WHERE kq.LanThi = 2
ORDER BY kq.Diem DESC

SELECT TOP(1) kq.MaSV, sv.HoTen FROM dbo.SINH_VIEN sv JOIN dbo.KET_QUA kq
ON kq.MaSV = sv.MaSV
GROUP BY sv.HoTen
select  top 1  with ties SINH_VIEN.MaSV,SINH_VIEN.HoTen,count (KET_QUA.MaMon) as solan  from dbo.SINH_VIEN join dbo.KET_QUA on SINH_VIEN.MaSV=KET_QUA.MaSV
group by SINH_VIEN.MaSV,SINH_VIEN.HoTen
order by solan desc

CREATE TRIGGER XoaSV
ON dbo.SINH_VIEN
INSTEAD OF Delete
AS
	BEGIN
		DECLARE @MaSV VARCHAR(8)
		SELECT @MaSV = MaSV FROM Deleted
		ALTER TABLE dbo.KET_QUA DROP CONSTRAINT fk_MaSV
		DELETE FROM dbo.SINH_VIEN WHERE @MaSV = MaSV
		DELETE FROM dbo.KET_QUA WHERE @MaSV = MaSV
		ALTER TABLE dbo.KET_QUA ADD CONSTRAINT fk_MaSV FOREIGN KEY (MaSV) REFERENCES dbo.SINH_VIEN(MaSV)
	END

DELETE FROM SINH_VIEN WHERE MaSV = '18115634'

CREATE TRIGGER ThemSV
ON dbo.SINH_VIEN
INSTEAD OF Insert
AS
	BEGIN
		DECLARE @NamSinh DATE
		DECLARE @MaSV VARCHAR(8)
		DECLARE @MaLop VARCHAR(7)
		DECLARE @HoTen NVARCHAR(30)
		DECLARE @GioiTinh BIT
		DECLARE @QueQuan NVARCHAR(30)

		SELECT @MaSV = MaSV, @MaLop = MaLop, @HoTen = HoTen, @NamSinh = NamSinh, 
				@GioiTinh = GioiTinh, @QueQuan = QueQuan FROM Inserted

		IF (YEAR(GETDATE()) - YEAR(@NamSinh) > 18)
			BEGIN
				INSERT INTO dbo.SINH_VIEN (MaSV, MaLop, HoTen, NamSinh, GioiTinh, QueQuan)
				VALUES (@MaSV, @MaLop, @HoTen, @NamSinh, @GioiTinh, @QueQUan)
			END
		ELSE
			BEGIN
				PRINT 'SINH VIEN BAN VUA NHAP CHUA DU 18 TUOI'
				ROLLBACK TRAN
			END
	END


INSERT INTO SINH_VIEN
VALUES ('18667234', 'TH23.37', N'Hoàng Cu Tí', '2000-06-06', 1, N'Hà Nội')

ALTER PROC TimSV
@Ten NVARCHAR(30)
AS
	BEGIN
		IF (EXISTS (SELECT HoTen FROM SINH_VIEN WHERE HoTen LIKE '%' + @Ten))
			BEGIN
				SELECT * FROM SINH_VIEN WHERE HoTen LIKE '%' + @Ten
			END
		ELSE
			PRINT 'KHONG CO TEN SINH VIEN NAO NHU VAY'
	END

TimSV N'Yến'

ALTER PROC NhapLop
@TenLop VARCHAR(7)
AS
	BEGIN
		IF (EXISTS (SELECT MaLop FROM LOP WHERE @TenLop = MaLop))
			BEGIN
				SELECT sv.* FROM SINH_VIEN sv JOIN LOP l
				ON sv.MaLop = l.MaLop
				WHERE @TenLop = sv.MaLop
			END
		ELSE
			BEGIN
				PRINT 'KHONG CO LOP BAN VUA NHAP'
			END
	END

NhapLop 'TH23.37'
GO

ALTER FUNCTION TBDiem
(@Lop VARCHAR(7))
RETURNS FLOAT
AS
	BEGIN
		DECLARE @Kq FLOAT
		SELECT @Kq = ROUND(AVG(kq.Diem),2) FROM SINH_VIEN sv JOIN LOP l
		ON sv.MaLop = l.MaLop
		JOIN KET_QUA kq
		ON sv.MaSV = kq.MaSV
		GROUP BY (l.MaLop)
		HAVING l.MaLop = @Lop
		RETURN @Kq
	END

SELECT dbo.TBDiem ('TH23.37')








