create database dodan_quanlicuahang
USE dodan_quanlicuahang
 GO
 CREATE TABLE DmNhanVien
 (
 DmNhanVienID	Nvarchar(50)	Primary Key,
HoNV			Nvarchar(50)	Not null,
TenNV			Nvarchar(50)	Not null,
GioiTinh		Nvarchar(50)	Null,
NgaySinh		Datetime		Not null,
DiaChi			Nvarchar(200)	Null,
DienThoai		Nvarchar(50)	Null
 )
 create table DmKhachHang
(
DmKhachHangID	Nvarchar(50)	Primary Key,
HoKH		Nvarchar(50)	Not null,
TenKH		Nvarchar(50)	Not null,
DiaChi		Nvarchar(200)	Null,
DienThoai	Nvarchar(50)	Null,
SoTaiKhoan	Nvarchar(50)	Null,
MaSoThue	Nvarchar(50)	Null
)

 create table DmSanPham
(
DmSanPhamID	Nvarchar(50)	Primary Key,
TenSP		Nvarchar(50)	Not null,
DonViTinh	Nvarchar(50)	Not null,
XuatXu		Nvarchar(200)	Null
)

create table HoaDon
(
HoaDonID		Nvarchar(50) primary Key,
NgayLapHD		Datetime	 Not null,
HinhThucTT		Nvarchar(50) Not null,
TongTien		Bigint		 Null Default 0 check (TongTien >=0),
DmNhanVienREF	Nvarchar(50) constraint fk2 foreign key references DmNhanVien(DmNhanVienID),

DmKhachHangREF	Nvarchar(50) foreign key references DmKhachHang(DmKhachHangID)
	
)

create table kho(
DmSanPhamID	Nvarchar(50),
TenSP 	Nvarchar(50),
soluongsp int,
constraint fk1 foreign key (DmSanPhamID) REFERENCES DmSanPham(DmSanPhamID)
)

create table ChiTietHoaDon
(
ChiTietHoaDonID	Nvarchar(50) Primary Key,
SoLuongmua		Int		Not null Default 0 Check (SoLuongmua >=0),
DonGia			Bigint	Not null Default 0 Check (DonGia >=0),
ThanhTien		Bigint	Null	Default 0 Check (ThanhTien >=0),
HoaDonFK		Nvarchar(50)	foreign key references HoaDon(HoaDonID),
DmSanPhamREF	Nvarchar(50)	foreign key references DmSanPham(DmSanPhamID)
	
)
INSERT INTO [dbo].[DmNhanVien]
           ([DmNhanVienID]
           ,[HoNV]
           ,[TenNV]
           ,[GioiTinh]
           ,[NgaySinh]
           ,[DiaChi]
           ,[DienThoai])
VALUES
('NV1',	 N'Nguyễn Văn', N'Hùng',   N'Nam', '10/12/1978', N'8,Trường Chinh, Hà Nội',     '0912345678')
,('NV2', N'Hoàng Thu',	N'Hương',  N'Nữ',  '07/12/1979', N'34, Lê Chân, Hải phòng',	    '0915765888')
,('NV3', N'Lê Trà',		N'My',	   N'Nữ',  '02/27/1990', N'25, Đinh Tiên Hoàng, TPHCM', '0337654378')
,('NV4', N'Lê Kim',		N'Thiên',  N'Nam', '02/25/1972', N'245, Bà Triệu, Hà Nội',	    '0278765492')
,('NV5', N'Nguyễn Văn',	N'Nguyên', N'Nam', '09/10/1982', N'67, Chợ Gạo, Hưng Yên',	    '0816576577')
,('NV6', N'Trần Thị',	N'An'	 , N'Nữ',  '11/10/1995', N'567, Thiên Trường, Nam Định','0347612121')

INSERT INTO [dbo].[DmKhachHang]
           ([DmKhachHangID]
           ,[HoKH]
           ,[TenKH]
           ,[DiaChi]
           ,[DienThoai]
           ,[SoTaiKhoan]
           ,[MaSoThue])
VALUES
('KH1',		N'Nguyễn Trường', N'Giang',	N'23, Nguyễn Lương Bằng, Hà Nội,',	'0912657423',	'8760001213',	'1234')
,('KH2',	N'Hoa Hải',		  N'Hằng',	N'36, Quang Trung, Vinh, Nghệ An',	'0317756854',	'1200013455',	'6753')
,('KH3V',	N'Trần Hồng',     N'Thanh',	N'237, Lê Mao, TP.HCM',				'0337656892',	'1010001234',	'3568')
,('KH4',	N'Mai Trung',     N'Dũng',	N'560, Tân Định, TP.HCM',			'0248763091',	'9800034401',	'1278')
,('KH5B',	N'Nguyễn Trung',  N'Dũng',	N'98, Lê Lợi, Thanh Hóa',			'0885465896',	'4500000012',	'9845')
,('KH6',	N'Đinh Thu',      N'Trang',	N'45, Kỳ Nam, TP.HCM',				'0814548991',	'2976558001',	'1465')
,('KH7Đ',	N'Mai Tường',     N'Vân',	N'45, Hàng Bài, Hà Nội',			'0912658912',	'0912000001',	'7823')
,('KH8',	N'Hoàng Minh',    N'Hải',	N'88, Trần Khát Chân, Hà Nội',		'0915676767',	'0230000012',	'5689')


INSERT INTO [dbo].[DmSanPham]
           ([DmSanPhamID]
           ,[TenSP]
           ,[DonViTinh]
           ,[XuatXu])
VALUES
('SP1',		N'RƯỢU',		N'chai',	N'Pháp')
,('SP2',	N'GIA VỊ',		N'thùng',	N'Việt Nam')
,('SP3',	N'BÁNH KEM',	N'cái',		N'Malaysia')
,('SP4',	N'BƠ',			N'kg',		N'Pháp')
,('SP5',	N'BÁNH MÌ',		N'cái',		N'Nga')
,('SP6',	N'NEM',			N'kg',		N'Việt Nam')
,('SP7',	N'TÁO',			N'kg',		N'Úc')
,('SP8',	N'CÁ HỘP',		N'thùng',	N'Nhật')
,('SP9',	N'KẸO',			N'thùng',	N'Thái Lan')
,('SP10',	N'CUA',			N'kg',		N'Mỹ')


INSERT INTO [dbo].[HoaDon]
           ([HoaDonID]
           ,[NgayLapHD]
           ,[HinhThucTT]
           ,[TongTien]
           ,[DmNhanVienREF]
           ,[DmKhachHangREF])
VALUES
('HD1',		'10/10/2019',	'TM', null, 'NV1', 'KH2')
,('HD2',	'09/12/2019',	'CK', null, 'NV2', 'KH3V')
,('HD3',	'09/03/2019',	'TM', null, 'NV2', 'KH2')
,('HD4',	'08/03/2019',	'CK', null, 'NV4', 'KH5B')
,('HD5',	'07/25/2019',	'CK', null, 'NV6', 'KH3V')
,('HD6',	'05/21/2019',	'TM', null, 'NV6', 'KH4')
,('HD7',	'06/20/2019',	'TM', null, 'NV1', 'KH2')
           

INSERT INTO [dbo].[kho]
           ([DmSanPhamID],
		    [TenSP],
			[soluongsp])
VALUES 
('SP1',		N'RƯỢU',2000)
,('SP2',	N'GIA VỊ',	900)
,('SP3',	N'BÁNH KEM',400)
,('SP4',	N'BƠ',700)
,('SP5',	N'BÁNH MÌ',		1200)
,('SP6',	N'NEM',	300)
,('SP7',	N'TÁO',	1250)
,('SP8',	N'CÁ HỘP',860)
,('SP9',	N'KẸO',	990)
,('SP10',	N'CUA',	780)
select * from DmKhachHang
INSERT INTO [dbo].[ChiTietHoaDon]
           ([ChiTietHoaDonID]
           ,[SoLuongmua]
           ,[DonGia]
           ,[ThanhTien]
           ,[HoaDonFK]
           ,[DmSanPhamREF])
VALUES
('CTHD1',	23,		12,	null,	'HD2',	'SP1')
,('CTHD2',	12,		16,	null,	'HD3',	'SP2')
,('CTHD3',	56,		23,	null,	'HD2',	'SP2')
,('CTHD4',	76,		45,	null,	'HD4',	'SP4')
,('CTHD5',	234,	67,	null,	'HD4',	'SP5')
,('CTHD6',	267,	87,	null,	'HD2',	'SP5')
,('CTHD7',	12,		21,	null,	'HD2',	'SP6')
,('CTHD8',	89,		12,	null,	'HD3',	'SP10')
,('CTHD9',	26,		56,	null,	'HD3',	'SP8')
,('CTHD10',	76,		78,	null,	'HD6',	'SP1')
,('CTHD11',	89,		43,	null,	'HD5',	'SP3')
,('CTHD12',	12,		67,	null,	'HD6',	'SP7')
,('CTHD13',	45,		90,	null,	'HD6',	'SP8')
,('CTHD14',	67,		12,	null,	'HD1',	'SP4')
,('CTHD15',	17,		34,	null,	'HD2',	'SP9')
,('CTHD16',	87,		56,	null,	'HD1',	'SP7')
,('CTHD17',	34,		78,	null,	'HD3',	'SP3')
,('CTHD18',	56,		91,	null,	'HD5',	'SP2')
,('CTHD19',	187,	13,	null,	'HD3',	'SP6')
,('CTHD20',	192,	129,null,	'HD4',	'SP6')
select *from DmKhachHang
INSERT INTO [dbo].[HoaDon]
           ([HoaDonID]
           ,[NgayLapHD]
           ,[HinhThucTT]
           ,[TongTien]
           ,[DmNhanVienREF]
           ,[DmKhachHangREF])
VALUES
('HD10',		'10/10/2019',	'TM', null, 'NV1', 'KH1'),
('HD11',		'11/10/2019',	'TM', null, 'NV3', 'kh10'),
('HD12',		'10/10/2019',	'TM', null, 'NV1', 'KH5'),
create table dangnhap (
[user] nvarchar(30),
pass varchar(30)
)


GO
SELECT * FROM DmKhachHang
select *from DmSanPham
select *from DmNhanVien
select *from kho
select*from ChiTietHoaDon
select*from HoaDon
--cau1
insert into DmKhachHang(DmKhachHangID,HoKH,TenKH,DiaChi,DienThoai,SoTaiKhoan,MaSoThue)
values (N'KH59',N'Giáp Thị',N'Yến',N'Bắc Giang',N'097867588',N'67869',N'7887')
go
create trigger deletesp on dbo.DmSanPham instead of delete
as
begin
declare @masp nvarchar(50)
select @masp=DmSanPhamID from deleted
delete from kho where DmSanPhamID=@masp
delete from ChiTietHoaDon where DmSanPhamREF=@masp
delete from DmSanPham where DmSanPhamID=@masp
end
delete from DmSanPham where DmSanPhamID=N''
go
alter view thongke as
select DmKhachHangID,TenSp,sum(Soluongmua) from DmSanPham a join ChiTietHoaDon b on  a.DmSanPhamID=b.DmSanPhamREF join HoaDon c on b.HoaDonFK=c.HoaDonID 
join DmKhachHang d on c.DmKhachHangREF=d.DmKhachHangID
group by DmKhachHangID,TenSP
select * from dangnhap
select * from thongke1
go
alter view thongke1 as
select DmKhachHangID,Soluongmua from DmSanPham a join ChiTietHoaDon b on  a.DmSanPhamID=b.DmSanPhamREF join HoaDon c on b.HoaDonFK=c.HoaDonID 
join DmKhachHang d on c.DmKhachHangREF=d.DmKhachHangID
group by b.DmKhachHangID,SoLuongmua
alter view tksanpham as
select DmSanPhamID,TenSP,sum(SoLuongmua) as soluongmua from ChiTietHoaDon  a join DmSanPham b 
on b.DmSanPhamID=a.DmSanPhamREF
group by TenSP ,b.DmSanPhamID
select * from tksanpham
create table tkkhachhang (
Makh nvarchar (50) primary key,
Hokh nvarchar(50),
tenkh nvarchar(50),
tensp nvarchar(50),
soluongmua nvarchar(50),
hinhthuc nvarchar(50),
)
insert into tkkhachhang(Makh,Hokh,tenkh,tensp,soluongmua,hinhthuc)
values ('KH1',N'Giáp thị',N'an',N'áo','5','TM'),
('KH8',N'Hoàng Minh',N'Hải',N'lúa','50','TM'),
('KH1',N'Giáp thị',N'an',N'TÁO','20','TM'),
('kh10',N'Lê Thị ',N'Ngọc',N'áo','7','CK'),
('KH5',N'Lê anh',N'thu',N'bơ','10','CK'),
('KH4',N'Mai Trung',N'Dũng',N'Nem ','15','TM'),
('KH9',N'Phạm Hồng',N'Quân',N'mì tôm','30','CK'),
('KH9',N'Phạm Hồng',N'Quân',N'TÁO','20','CK'),
('KH9',N'Phạm Hồng',N'Quân',N'CÁ HỘP','320','CK'),
('KH3V',N'Trần Hồng',N'Thanh',N'mì tôm','30','TM'),
('KH3V',N'Trần Hồng',N'Thanh',N'áo','2','TM'),
('KH3V',N'Trần Hồng',N'Thanh',N'kẹo','30','TM'),
('kh7C',N'Nguyễn bình ',N'Minh',N'Bánh Kem','1','TM'),
('KH1k',N'Giáp Thị',N'Yến',N'CÁ HỘP','300','CK')







select * from tkkhachhang
select * from DmSanPham