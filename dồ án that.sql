use doanqlbh
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
select *from DmKhachHang
where DmKhachHangID='KH4'
--2
select top 1 ct.DonGia,sp.TenSP,sp.XuatXu from DmSanPham as sp join ChiTietHoaDon as ct on sp.DmSanPhamID=ct.DmSanPhamREF
order by DonGia asc
--3
select * from ChiTietHoaDon
where DmSanPhamREF<>'SP3'
--4
select top 3 sum(SoLuongmua ) as [tongsoluong] from  ChiTietHoaDon 
group by  DmSanPhamREF
order by [tongsoluong] desc
--5
select sum(SoLuongmua*dongia) as tonghoadon,hd.HoaDonID from HoaDon as hd join ChiTietHoaDon as ct on hd.HoaDonID=ct.HoaDonFK
group by hd.HoaDonID
--6
select top 3
sum(ct.SoLuongmua*ct.DonGia) as tonghoadon ,hd.HoaDonID into hoa_don_vip 
from HoaDon as hd join ChiTietHoaDon as ct on hd.HoaDonID=ct.HoaDonFK
 group by hd.HoaDonID
 order by tonghoadon desc
--7
select count(MaSoThue) as nguoikhongcoma from DmKhachHang
 where MaSoThue is null
--8
select  top (99.99)PERCENT dongia , sp.TenSP,sp.DmSanPhamID from DmSanPham as sp join ChiTietHoaDon as ct on sp.DmSanPhamID=ct.DmSanPhamREF
order by DonGia desc
--10
select top 5
count(DmSanPhamREF) as somathang,HoaDonFK from  ChiTietHoaDon 
group by HoaDonFK
order by somathang desc
select 
SP.TenSP,CT.SoLuongmua,CT.DonGia,ThanhTien=(SoLuongmua*DonGia) ,HD.NgayLapHD from DmKhachHang as kh join  HoaDon AS hd
on kh.DmKhachHangID=hd.DmKhachHangREF
 join ChiTietHoaDon as ct on  hd.HoaDonID=ct.HoaDonFK join DmSanPham as sp on
ct.DmSanPhamREF=sp.DmSanPhamID
where hd.DmKhachHangREF ='KH3V'
select 
kh.HoKH,kh.TenKH,sp.TenSP,CT.SoLuongmua,CT.DonGia,ThanhTien=(SoLuongmua*DonGia) ,HD.NgayLapHD from DmKhachHang as kh join  HoaDon AS hd
on kh.DmKhachHangID=hd.DmKhachHangREF join DmNhanVien as nv on hd.DmNhanVienREF=nv.DmNhanVienID
 join ChiTietHoaDon as ct on  hd.HoaDonID=ct.HoaDonFK join DmSanPham as sp on
ct.DmSanPhamREF=sp.DmSanPhamID
where nv.DmNhanVienID ='NV2' and month(hd.NgayLapHD)=9                                    



select TenSP, count(DMkhachHangREF) as soluong from DmSanpham join ChiTietHoaDon on DmSanPham.DmSanPhamID=ChiTietHoaDon.DmSanPhamREF 
join Hoadon on Hoadon.HoaDonID=Chitiethoadon.HoadonFK
group by TenSP
UPDATE KHO SET soluongsp=3000 WHERE DmSanPhamID='SP1'
go
create view spcview as
   select TenSP,SoLuongmua from DBO.DmSanPham a join DBO.ChiTietHoaDon b 
   on a.DmSanPhamID=b.DmSanPhamREF
    WHERE A.DmSanPhamID=B.DmSanPhamREF
  select * from spcview
   go
    create clustered index SP on dbo.kho(DmSanphamID)
go
create view khachang as
select TenKH,TenSP,SoLuongmua  from DmSanPham join ChiTietHoaDon on DmSanPham.DmSanPhamID=ChiTietHoaDon.DmSanPhamREF join HoaDon 
on ChiTietHoaDon.HoaDonFK=HoaDon.HoaDonID join DmKhachHang on HoaDon.DmKhachHangREF=DmKhachHang.DmKhachHangID
go 
select * from khachang
go
create proc ten(@name nvarchar(50))
as
begin
if( exists( select DmSanPhamID from DmSanPham where TenSP like '%'+@name+'%'))

 select DISTINCT DmSanPhamID,TenKH,TenSP,SoLuongmua from DBO.DmSanPham join DBO.ChiTietHoaDon
 on DmSanPham.DmSanPhamID=ChiTietHoaDon.DmSanPhamREF join HoaDon
 ON ChiTietHoaDon.HoaDonFK=HoaDon.HoaDonID join DmKhachHang 
 on DmKhachHang.DmKhachHangID=HoaDon.DmKhachHangREF
 
where TenSP like '%'+@name+'%'

else
print N'KHONG CÓ TÊN CẦN TÌM'

END
 EXEC ten N'BƠ'
 go
 create proc mahd( @mahd nvarchar(50))
 AS
 begin 
      if( exists( select * from HoaDon where HoaDonID=@mahd))
      select distinct * from HoaDon 
      where HoaDonID=@mahd
  end
 exec mahd N'HD4'
 GO
 create function DBO.soluongton (@mahang nvarchar (50))
 returns int
 as 
 begin
 declare @soluongton int
 declare @soluongban int
 declare @soluong int 
       select @soluong=soluongsp from dbo.kho where DmSanPhamID=@mahang
       select @soluongban=soluongmua from dbo.ChiTietHoaDon where DmSanPhamREF=@mahang
 BEGIN
       select @soluongton=@soluong-@soluongban from dbo.ChiTietHoaDon 
       where DmSanPhamREF=@mahang
 END
   return @soluongton
  end
 GO
select DBO.soluongton (N'SP2')
go
CREATE FUNCTION DBO.TIMTEN (@makhach nvarchar (50))
  returns nvarchar
as
begin 
  declare @name nvarchar(50)
      begin
      select @name=TenKH from DBO.DmKhachHang
      WHERE  DmKhachHangID=@makhach
      RETURN @name 
      END
end
go
select DBO.TIMTEN(N'Giang')
go
CREATE trigger nay on dbo.hoadon for insert as
begin 
   declare @mahoadon nvarchar(50)
   declare @ngay date
   select @ngay=NgayLapHD ,@mahoadon=HoaDonID from inserted 

if (( @ngay)>getdate())
  begin
    print N'ngay sai'
    rollback tran
  end
else
   begin
   update HoaDon set NgayLapHD=getdate()
    where @mahoadon=HoaDonID
 END
 end

 insert into HoaDon(HoaDonID,NgayLapHD,HinhThucTT,TongTien,DmNhanVienREF,DmKhachHangREF)
 values            ('HD9',		'10/10/2017',	'TM', null, 'NV2', 'KH2')
 select *from HoaDon
 go

 drop table hoa_don_vip
 

 CREATE TRIGGER NV ON Dbo.dmnhanvien after delete 
 as
 begin
   alter table dbo.hoadon drop constraint fk2
        declare @num char
        select @num=count(*) from deleted
        print 'so luong nhan vien da xoa'+@num
      end
 delete from DmNhanVien where DmNhanVienID='NV10'
 go
 
 select *from ChiTietHoaDon 
 go
 create trigger updatenhanvien on dmnhanvien for update 
 as 
 if update(dmnhanvienid)
  begin
      print N'khong the thay doi ma nhan vien'
      rollback tran 
   end
 update DmNhanVien set DmNhanVienID='NV10' WHERE DmNhanVienID='NV2'
 go
CREATE proc sua (@mahang nvarchar(50) ,@tenhang nvarchar(20),@donvi nvarchar(50) ,@xuatxu nvarchar(200),
 @mahang1 nvarchar(50) ,@tenhang1 nvarchar(20),@donvi1 nvarchar(50) ,@xuatxu1 nvarchar(200))
 as
 begin
 if( exists( select *from DmSanPham where DmSanPhamID=@mahang)

 
 end
 create proc test1
 as
 print ' hello yen'
 exec test1
 go
 CREATE PROC NHAP (@makh nvarchar(50),@ho nvarchar(50),@ten nvarchar(50),
 @diachi nvarchar(50),@dt nvarchar(50))
   as
   begin 
   declare @tontai int 
   set @tontai=0
   if (@makh not like '%'+ 'K'+'%')
   begin 
   print N' NHAP ma khach hang phai co chu K o dau  '
   RETURN 
   END
   ELSE
   select @tontai=COUNT(DmKhachHangID) from DmKhachHang where DmKhachHangID=@makh and HoKH=@ho
   and TenKH=@ten and DiaChi=@diachi and DienThoai=@dt
   if (@tontai>=1)
   begin 
   print 'da ton tai khach hang '
   return
   end
   end
   go
   insert into  NHAP (@makh,@ho,@ten,@diachi,@dt)
   values                 (N'KH9',N'Giap',N'Yen',N'Bac Giang','09866444')
   go
   GO 
   ALTER TRIGGER THEM ON dbo.DmKhachHang
   INSTEAD OF INSERT 
   AS 
   BEGIN
   --SET NOCOUNT ON
  -- INSERT INTO 
   declare @makh nvarchar(50) 
   SELECT @makh  =DmKhachHangID from inserted
   if (@makh IN (select DmKhachHangID from DmKhachHang))
   begin
   print N'mã khách hàng này đã tồn tại'
   rollback tran
   end
  
   end
    insert into DmKhachHang (DmKhachHangID)
	values (N'KH10')
	go
   alter trigger ktdelete on dbo.DmKhachHang 
  for delete
   as
   begin
   declare @makh nvarchar(50)
   select @makh=DmKhachHangID from deleted
	IF (exists(select * from HoaDon where DmKhachHangREF=@makh))
	begin
	alter table hoadon
	drop constraint FK__HoaDon__DmKhachH__0F975522
	delete from HoaDon where DmKhachHangREF=@makh
	delete from DmKhachHang where DmKhachHangID=@makh
	end
	else
	delete from DmKhachHang where DmKhachHangID=@makh
	end
	delete from DmKhachHang where DmKhachHangID=N'KH2'

	select * from DmKhachHang
	select * from HoaDon