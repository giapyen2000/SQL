create database DBLab2
USE DBLab2
create table student(
RN int constraint pk_student primary key,
Name varchar(20),
Age int
)

create table Test (
Testid int constraint pk_Test primary key,
Name varchar (20)
)
create table studentTest
(
RN int constraint fk_studentTest_student foreign key(RN) references student(RN),
Testid int constraint fk_studentTest__Test foreign key(Testid) references Test(Testid),
Date date,
Marks float
)
insert into student (RN,Name, Age)
values    (1,'nguyen hong ha',20),
          (2,'truong ngoc anh',30),
		  (3,' tuan minh',25),
		  (4,' dan truong',22);
insert into Test(Testid,Name)
values    (1,'EPC'),
           (2,'DWMX'),
		   (3,'SQL1'),
		   (4,'SQL2');
insert into studentTest(RN,Testid,Date,Marks)
values          (1,1,'7/17/2006',8),
                 (1,2,'7/18/2006',5),
				 (1,3,'7/19/2006',7),
				 (2,1,'7/17/2006',7),
				 (2,2,'7/18/2006',4),
				 (2,3,'7/19/2006',2),
				 (3,1,'7/17/2006',10),
				 (3,3,'7/18/2006',1);
				 SELECT * FROM studentTest
select CONVERT(numeric(4,2),Marks) as diemso  from studentTest
select * from student
where Age>25
select* from student
where (Age=30) or (Age=20)
select * from Test
where Name like '%S%'
select * from studentTest
where Marks>5
select * from student
where Name like '% ____'
select * from student
where Name like '______ %'
select * from student
where Name like '[^r][^r][^r][^r][^r][^r] %'
alter table student add Status varchar(10) not null default 'young'
select * from student
alter table studentTest
drop constraint fk_studentTest_student
alter table studentTest
drop constraint fk_studentTest__Test
alter table student
drop constraint pk_student
alter table Test
drop constraint pk_Test
drop table student
drop table Test
drop table studentTest
use master
drop database DBLab2
--1
select  avg(age) as tuoitb from student
--2
select top 1 with ties age ,name from student
order by age desc
--3
select top 1 with ties age ,name from student
order by age asc
--4
select top 1  Marks,tt.Name from studentTest  as st join test as tt on st.Testid=tt.Testid
order by Marks desc
--5
select top 1 Marks,tt.Name from studentTest  as st join test as tt on st.Testid=tt.Testid
order by Marks asc
--6
select distinct top 1 with ties name ,[Date] from studentTest  as st join student as tt on st.RN=tt.RN
order by [Date] desc
--7
select distinct  top 1 with ties name ,[Date] from studentTest  as st join student as tt on st.RN=tt.RN
order by [Date] asc
--8
select sum(age) as tongtuoi from student
--9
select distinct  getdate()as ngayhientai, [date],name,DATEDIFF(dd,date,getdate()) as soluongngay from studentTest as st join Test as t on st.Testid=t.Testid
--10
select  distinct top 1 with ties Name ,Marks from student as st join studentTest as tt on st.RN=tt.RN
order by Marks desc
--11
select distinct top 1 with ties Name ,Marks from student as st join studentTest as tt on st.RN=tt.RN
order by Marks asc
--12
select distinct  CONVERT(numeric(4,2),avg(marks)) as diemtb,Name from studentTest as tt full join student as st on tt.RN=st.RN
group by Name
order by diemtb desc
--13
select distinct st.Name,t.Name from student as st join studentTest as tt on st.RN=tt.RN join Test as t on tt.Testid=t.Testid
group by st.Name,t.Name
--14
select distinct  Name  from student 
where rn not in( select RN from studentTest)
--cach 2
select name from student as st left join studentTest as tt on 
st.RN=tt.RN
where Testid is null
--15
select distinct  st.name,t.Name AS monthilai,date as ngaythilai from student as st join studentTest as tt on st.RN=tt.RN join Test as t on tt.Testid=t.Testid
where Marks<5
--16
select distinct  top 1 avg(marks) as diemtb ,name from student as st join studenttest as tt on st.rn=tt.rn
group by name 
order by  avg(Marks) desc
--17
select distinct  top 1 avg(marks) as diemtb ,name from student as st  join studenttest as tt on st.rn=tt.rn
group by name 
order by  avg(Marks) asc
--18
select distinct  max(tt.Marks) as diem,Name  from Test as t join studenttest as tt on t.Testid=tt.Testid
group by name
--19
select distinct  st.name,t.Name AS mon from student as st full join
 studentTest as tt on st.RN=tt.RN  left join Test as t on tt.Testid=t.Testid
 go
 create proc nhap (@namsinh int ,@ten nvarchar(20),@masv int )
 as
 begin
 if (( year(getdate())-@namsinh)<YEAR (GETdate())-17)
 begin 
 print N' BAN KHONG DU 18 '
 RETURN 
 END
 DECLARE @tontai int 
 set @tontai=0
 select @tontai= count(RN) FROM student where age=@namsinh and name=@ten and RN=@masv
 IF (@tontai>=1)
 begin
 print ' da ton tai sv'
 return
 end
 end
 nhap 16,'yen',20
 go
 CREATE proc sua (@masv1 int ,@ten1 varchar(20),@namsinh1 int ,
  @masv2 int , @ten2 varchar(20), @namsinh2 int )
 as
 begin
 if (( year(getdate())-@namsinh1)>YEAR (GETdate())-17)
 begin 
 print N' BAN KHONG DU 18 '
 RETURN 
 END
 
 DECLARE @tontai int 
 set @tontai=0
 select @tontai= count(RN) FROM student where age=@namsinh1 and name=@ten1 and RN<>@masv1
 IF (@tontai>=1)
   begin
      print ' da ton tai sv'
   return
 end
 update dbo.student SET RN=@masv1, NAME=@ten1,AGE=@namsinh1 where age=@namsinh2 AND NAME=@ten2 AND RN=@masv2
 end
 exec sua 7,'nguyen van an ',25,1,'nguyen hong ha',20
 select *from student