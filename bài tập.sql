CREATE DATABASE DBLab6
use DBLab6
create table student (
RN INT CONSTRAINT pk1 primary key ,
name nvarchar(50),
AGE int ,
Gender bit
)
create table subject(
sID int constraint pk2 primary key ,
sNAME nvarchar(50)
)
create table studentsuject(
RN INT,
sID INT,
mark float constraint ck3 check (mark between 3 and 10),
Date date,
constraint pk3 primary key (RN,sID),
constraint fk1 foreign key (RN) references student(RN),
constraint fk2 foreign key (sID) references subject(sID)
)
insert into student(RN,name)
values     ( 1,N'mỹ linh'),
            (2,N'Đàm vinh hưng'),
			(3,N'Kim tử long'),
			(4,N'Tài linh'),
			(5,N'Mỹ lệ'),
			(6,N'Khánh linh')
insert into subject(sID,sNAME)
values          (1,'SQL'),
                (2,'LGC'),
				(3,'HTML'),
				(4,'CF')

insert into studentsuject(RN,sID,mark,Date)
values                   (1,1,8,'7/28/2005'),
                         (2,2,3,'7/29/2005'),
						 (3,3,9,'7/31/2005'),
						 (4,1,5,'7/30/2005'),
						 (5,4,10,'7/19/2005'),
						 (6,1,9,'7/25/2005')
update student set Gender=0 where RN in (1,4,5)
update student set Gender=1 where RN =3
insert into subject(sID,sNAME)
values (5,'codejava'),
       (6,'vb.net')
	   select sNAME,sID from subject 
	   where sID not in(select sID from studentsuject)
	   select st.sNAME ,max(m.mark) as diem from subject as st full join studentsuject as m on st.sID=m.sID
	   group by st.sNAME
	   order by max(m.mark) desc
	   select * from subject as st
	   where 1<
	   (
	   select count(mark )from studentsuject as m 
	   where st.sID=m.sID
	   )
	   select hs.RN,mh.sID,hs.name,mh.sNAME,age,date, Gender=case
	   when Gender=1 then 'male'
	   when Gender=0 then 'female'
	   else 
	   'unknown'
	   end 
	   from student as hs join studentsuject as m on hs.RN=m.RN join subject as mh on m.sID=mh.sID
	   create index so1 on student(Name)
	   
	   create index so2 on [subject]([sNAME])
	   CREATE INDEX so3 on studentsuject(RN,sID)
	   SELECT top 3 m.RN,NAME,sNAME,mark, ROW_NUMBER() over (order by mark desc) as rank ,GETDATE()  as date
	   into top3
	   from student as hs join studentsuject as m on hs.RN=m.RN join subject as mh ON m.sID=mh.sID
	   GROUP BY NAME,MARK ,sNAME,M.RN
	   ORDER BY mark DESC
	   SELECT AVG(MARK) AS DIEM,m.RN,NAME FROM student AS hs join studentsuject as m on hs.RN=m.RN 

	   group by m.RN,name
	   having avg(mark)>=8  AND MIN (MARk)>=5
	    SELECT AVG(MARK) AS DIEM,m.RN,NAME FROM student AS hs join studentsuject as m on hs.RN=m.RN 
	   WHERE mark >=3 and (select count (mark) from studentsuject where mark >=3 and mark<5)<=1
	   group by m.RN,name
	   having avg(mark)>=6.5  AND MIN (MARk)>=5
