create database Qlthuvien
use QLthuvien

create table Sach(
Masach nvarchar(10) primary key,
Tensach nvarchar(50),
TenNXB nvarchar(50)
)
create table Docgia(
Madocgia nvarchar(30) primary key,
Hoten nvarchar(50),
Ngaysinh nvarchar(50)
)

create table Muon(
Masach nvarchar(10)primary key,
Madocgia nvarchar(30),
Ngay_muon nvarchar(50),
Tensach nvarchar(50),
Ngay_hethan nvarchar(50),
constraint fk_Muon_Sach foreign key (Masach) references Sach(Masach),
constraint fk_Muon_Docgia foreign key (Madocgia) references Docgia(Madocgia)
)   
create table Trasach(
Tensach nvarchar(50),
Masach nvarchar(10),
Ngay_muon nvarchar(50),
Madocgia nvarchar(30),
Ngay_hethan nvarchar(50),
Ngay_tra nvarchar(50),
Tienmuon nvarchar(30),
constraint pk primary key (Masach,Ngay_muon),
constraint fk_Trasach_Sach foreign key (Masach) references sach(Masach)
)  
create table Dausach(
Masach nvarchar(10) primary key,
bia nvarchar(50),
trangthai nvarchar(20),
constraint fk_Dausach_Sach foreign key (Masach) references sach(Masach)
)

insert into Dausach(Masach,bia,trangthai)
values  ('001','Dac Nhan Tam','moi'),
        ('002','Ban dat gia bao nhieu', 'moi'),
		('003','Doc vi bat ky ai', 'moi'),
		('004','Doi ngan dung ngu dai','moi'),
		('005','Tuoi tre dang gia bao nhieu','moi'),
		('006','I Can Do it','moi'),
		('007','Tren duong bang','moi')
 insert into Sach(Masach,Tensach,TenNXB)
 values ('001','Dac Nhan Tam','Simon & Schuster'),
        ('002','Ban dat gia bao nhieu', 'Nha Xuat Ban The Gioi'),
		('003','Doc vi bat ky ai', 'Nha Xuat Ban Lao Dong'),
		('004','Doi ngan dung ngu dai','Nha Xuat Ban Tre'),
		('005','Tuoi tre dang gia bao nhieu','Hoi nha van'),
		('006','I Can Do it','Nha xuat ban tong hop TP Ho Chi Minh'),
		('007','Tren duong bang','Nha Xuat Ben Tre')

insert into Docgia(Madocgia,Hoten,Ngaysinh)
values ('dg1','Nguyen Van A','19/12/2000'),
       ('dg2','Nguyen Van B','25/12/2000'),
	   ('dg3','Nguyen Van C','03/10/2000'),
	   ('dg4','Nguyen Van D','20/10/2000'),
	   ('dg5','Nguyen Van E','27/04/2000'),
	   ('dg6','Nguyen Van F','31/05/2000'),
	   ('dg7','Nguyen Van G','25/05/2000'),
	   ('dg8','Nguyen Van H','15/08/2000')

insert into Muon (Masach,Madocgia,Ngay_muon,Tensach,Ngay_hethan)
values ('001','dg1','01/01/2020','Dac Nhan Tam','01/02/2020'),
       ('002','dg2','03/01/2020','Ban dat gia bao nhieu','03/02/2020'),
	   ('003','dg3','06/02/2020','Doc vi bat ky ai','06/03/2000'),
	   ('004','dg4','10/03/2020','Doi ngan dung ngu dai','10/04/2020'),
	   ('005','dg5','25/02/2020','Tuoi tre dang gia bao nhieu','25/03/2020'),
	   ('006','dg6','20/04/2020','I Can Do it','20/05/2020'),
	   ('007','dg7','14/05/2020','Tren duong bang','14/06/2020')

insert into Trasach(Tensach,Masach,Ngay_muon,Madocgia,Ngay_hethan,Ngay_tra,Tienmuon)
values ('Dac Nhan Tam','001','01/01/2020','dg1','01/02/2020','25/01/2000',25000),
       ('Ban dat gia bao nhieu','002','03/01/2020','dg2','03/02/2020','03/02/2020',30000),
	   ('Doc vi bat ky ai','003','06/02/2020','dg3','06/03/2000','04/03/2020',28000),
	   ('Doi ngan dung ngu dai','004','10/03/2020','dg4','10/04/2020','10/04/2020',30000),
	   ('Tuoi tre dang gia bao nhieu','005','25/02/2020','dg5','25/03/2020','20/03/2020',25000),
	   ('I Can Do it','006','20/04/2020','dg6','20/05/2020','20/05/2020',30000),
	   ('Tren duong bang','007','14/05/2020','dg7','14/06/2020','14/06/2020',30000)


select *from Trasach
select *from Sach
select * from Muon
select * from Docgia

drop table Sach
drop table Muon
drop table Trasach
drop table Docgia


create proc Xoa
@Masach nvarchar(10) 
AS
BEGIN   
   DELETE FROM dbo.Muon WHERE Masach = @Masach
   DELETE FROM dbo.Sach WHERE Masach = @Masach  
END
Xoa '1'
create proc dele
@Madocgia nvarchar(30)
as
begin 
   DELETE FROM dbo.Muon WHERE Madocgia = @Madocgia 
    DELETE FROM dbo.Docgia WHERE Madocgia = @Madocgia
END
dele 'dg1'
select *from Docgia
select a.Madocgia,MaSach,Ngay_muon,Tensach from Docgia a join Muon b on a.Madocgia=b.Madocgia
select * from Trasach where Masach='001'
update Docgia set Hoten=N'nguyễn thị linh' where Madocgia='dg1'
delete from Trasach where Madocgia='dg2'
create view xemdl as
select a.Madocgia,MaSach,Ngay_muon,Tensach from Docgia a join Muon b on a.Madocgia=b.Madocgia

select * from xemdl
go

CREATE TRIGGER delete_trigg
    ON dbo.Muon
    FOR Delete
    AS
    IF((Select count(*) From deleted)>2)
    BEGIN
    PRINT 'Ban khong duoc xoa cung luc 2 ban ghi'
    ROLLBACK TRAN
    END
 delete from Dbo.Muon where Masach='002'
 go
 alter TRIGGER Col_Update_trig
    ON Dbo.Docgia
    FOR UPDATE
    AS
    IF UPDATE(Madocgia)
    BEGIN
	alter table dbo.Muon
	drop [fk_Muon_Docgia] 
	begin
    PRINT N'Ban khong the update cot mã đọc giả'
    ROLLBACK TRAN
end
	alter table dbo.Muon
	add constraint fk_Muon_Docgia foreign key (Madocgia) references Docgia(Madocgia)
    END
	go
	create trigger xoaa on [dbo].Docgia instead of delete
as
begin
 declare @Madocgia nvarchar(30)
 select @Madocgia=Madocgia from deleted
  DELETE FROM dbo.Muon WHERE Madocgia = @Madocgia 
    DELETE FROM dbo.Docgia WHERE Madocgia = @Madocgia
 end
delete from Docgia where Madocgia='dg4'
    