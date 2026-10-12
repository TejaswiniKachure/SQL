create table Customer
(
CID number primary key,
CNAME varchar2(20),
CADD varchar2(20),
C_CONTACT number,
C_CREDITDAYS number,
CJ_DATE date,
SEX varchar2(10)
);

select * from customer

INSERT INTO CUSTOMER VALUES (1001,'CYONA BLAKE','NEW YORK',1235684,20,TO_DATE('20-JAN-11','DD-MON-YY'),'FEMALE');
INSERT INTO CUSTOMER VALUES (1002,'JOHN SMITH','NEW JERSI',1341684,20,TO_DATE('21-FEB-11','DD-MON-YY'),'MALE');
INSERT INTO CUSTOMER VALUES (1003,'JORDAN WOOD','PARG',1805184,20,TO_DATE('22-MAR-11','DD-MON-YY'),'MALE');
INSERT INTO CUSTOMER VALUES (1004,'CHRISTNA','MANHATTON',1125684,31,TO_DATE('23-APR-11','DD-MON-YY'),'FEMALE');
INSERT INTO CUSTOMER VALUES (1005,'TOM HILL','LANDON',1239284,10,TO_DATE('25-JUN-15','DD-MON-YY'),'MALE');
INSERT INTO CUSTOMER VALUES (1006,'KAMILA JOSEF','PARISE',124568,9,TO_DATE('28-JUL-11','DD-MON-YY'),'FEMALE');
INSERT INTO CUSTOMER VALUES (1007,'ANDRU SYMON','TAXES',125654,15,TO_DATE('01-APR-16','DD-MON-YY'),'MALE');
INSERT INTO CUSTOMER VALUES (1008,'SANJU SAMSUNG','NEW  YORK',12346341,4,TO_DATE('20-JAN-16','DD-MON-YY'),'MALE');



CREATE TABLE Vendors
(
VID NUMBER primary key,
VNAME VARCHAR2(20),
VADD VARCHAR2(20),
VCONTACT NUMBER,
VCREDITDAYS NUMBER,
VJ_DATE DATE
);

SELECT * FROM Vendors;

INSERT INTO VENDORS VALUES (2001,'KIRAN PATIL','PUNE',20535535,20,TO_DATE('20-JAN-10','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2002,'PRAKASH JAIN','MUMBAI',2063564,10,TO_DATE('05-NOV-11','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2003,'SWAPNIL THETE','NASHIK',25355352,15,TO_DATE('18-MAR-10','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2004,'AMOL SHENDE','SATARA',23674776,18,TO_DATE('07-APR-15','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2005,'KARAN SINTRE','BULDHANA',256756,30,TO_DATE('22-APR-09','DD-MON-YY'));
INSERT INTO VENDORS VALUES (2006,'RAM KULKARNI','OSMANABAD',20367454,21,TO_DATE('09-JUL-10','DD-MON-YY'));



CREATE TABLE Employee1
(
EID NUMBER primary key,
ENAME VARCHAR2(20),
EJOB VARCHAR2(20),
EADD VARCHAR2(20),
ECONTACT NUMBER,
ESAL NUMBER,
EDOJ DATE,
EDOL DATE
);

SELECT * FROM Employee1;

INSERT INTO Employee1 VALUES (3001,'STEVEN KING','PAINTER','NEW YORK',10367454,1200,TO_DATE('09-JUL-10','DD-MON-YY'),NULL);
INSERT INTO Employee1 VALUES (3002,'DAVID AUSTIN','FITTER','MAN HATON',10367434,1100,TO_DATE('19-AUG-10','DD-MON-YY'),NULL);
INSERT INTO Employee1 VALUES (3003,'BRUCE ERNST','MECHANIC','NEW JERCY',10367264,2200,TO_DATE('08-SEP-10','DD-MON-YY'),NULL);
INSERT INTO Employee1 VALUES (3004,'LUIS POPP','MECHANIC','NEW JERCY',10367264,1700,TO_DATE('19-OCT-09','DD-MON-YY'),TO_DATE('06-SEP-10','DD-MON-YY'));
INSERT INTO Employee1 VALUES (3005,'SHERI GOMES','FITTER','PARIS',10327264,1000,TO_DATE('19-OCT-09','DD-MON-YY'),TO_DATE('01-AUG-10','DD-MON-YY'));
INSERT INTO Employee1 VALUES (3000,'STEVEN KING','FITTER','PARIS',10322264,NULL,TO_DATE('01-JAN-08','DD-MON-YY'),NULL);

SELECT * FROM Employee1;


CREATE TABLE Sparepart
( SPID NUMBER PRIMARY KEY,
SPNAME VARCHAR2(30),
SPRATE NUMBER,
SPUNIT VARCHAR2(10)
)

SELECT * FROM SPAREPART;


INSERT INTO SPAREPART VALUES (4001,'TWO WHEELER TUBE',250,'NOS');
INSERT INTO SPAREPART VALUES (4002,'TWO WHEELER ENGINE OIL',400,'LTRS');
INSERT INTO SPAREPART VALUES (4003,'FOUR WHEELER ENGINE OIL',5000,'LTRS');
INSERT INTO SPAREPART VALUES (4004,'TWO WHEELER CARBORATOR',680,'NOS');
INSERT INTO SPAREPART VALUES (4005,'TWO WHEELER CLUTCH WIRE',129,'MTRS');
INSERT INTO SPAREPART VALUES (4006,'TWO WHEELER TAIL LIGHT',100,'NOS');
INSERT INTO SPAREPART VALUES (4007,'TWO WHEELER INDICATORS',150,'NOS');
INSERT INTO SPAREPART VALUES (4008,'FOUR WHEELER GASKIT',1340,'NOS');
INSERT INTO SPAREPART VALUES (4009,'WHITE COLOUR',340,'LTRS');
INSERT INTO SPAREPART VALUES (4010,'BLACK COLOUR',240,'LTRS');
INSERT INTO SPAREPART VALUES (4011,'TWO WHEELER SIDE MIRROR',250,'NOS');
INSERT INTO SPAREPART VALUES (4012,'FOUR WHEELER SIDE MIRROR',450,'NOS');
INSERT INTO SPAREPART VALUES (4013,'TWO WHEELER SHOCKUP',1320,'PAIR');
INSERT INTO SPAREPART VALUES (4014,'FOUR WHEELER BUMPER',6000,'NOS');
INSERT INTO SPAREPART VALUES (4015,'FOUR WHEELER FRONT GLASS',7000,'PCS');

SELECT * FROM SPAREPART;


CREATE TABLE Purchase(
PID NUMBER PRIMARY KEY,
VID NUMBER,
SPID NUMBER,
PQTY NUMBER,
SPRATE NUMBER,
SPGST NUMBER,
PDATE DATE,
TRANCOST NUMBER,
TOTAL NUMBER,
RCV_EID NUMBER,


CONSTRAINT FK_PURCHASE_VID FOREIGN KEY(VID) REFERENCES Vendors(VID),
CONSTRAINT FK_PURCHASE_SPID FOREIGN KEY(SPID) REFERENCES SPAREPART(SPID),
CONSTRAINT FK_PURCHASE_EID FOREIGN KEY(RCV_EID) REFERENCES EMPLOYEE1(EID)
);


SELECT * FROM PURCHASE;

INSERT INTO PURCHASE VALUES(5001,2001,4001,10,250,350,TO_DATE('01-JAN-11','DD-MON-YY'),1300,4150,3001);
INSERT INTO PURCHASE VALUES(5002,2002,4002,4,400,288,TO_DATE('02-MAR-11','DD-MON-YY'),100,1988,3001);
INSERT INTO PURCHASE VALUES(5003,2003,4004,8,680,761.6,TO_DATE('12-JUN-11','DD-MON-YY'),50,6251.6,3003);
INSERT INTO PURCHASE VALUES(5004,2004,4005,10,129,154.8,TO_DATE('22-AUG-11','DD-MON-YY'),125,1569.8,3004);
INSERT INTO PURCHASE VALUES(5005,2005,4006,20,100,300,TO_DATE('07-SEP-11','DD-MON-YY'),20,2320,3003);
INSERT INTO PURCHASE VALUES(5006,2006,4007,30,150,630,TO_DATE('12-OCT-11','DD-MON-YY'),60,5190,3000);
INSERT INTO PURCHASE VALUES(5007,2001,4003,20,5000,14000,TO_DATE('07-SEP-11','DD-MON-YY'),1000,115000,3000);
INSERT INTO PURCHASE VALUES(5008,2006,4005,1,129,15.48,TO_DATE('12-OCT-11','DD-MON-YY'),50,194.48,3005);
INSERT INTO PURCHASE VALUES(5009,2006,4005,1,129,15.48,TO_DATE('15-OCT-11','DD-MON-YY'),50,194.48,3005);
INSERT INTO PURCHASE VALUES(5010,2006,4009,5,340,238,TO_DATE('20-OCT-11','DD-MON-YY'),0,2938,3005);


CREATE TABLE SER_DET(
SID NUMBER PRIMARY KEY,
CID NUMBER,
EID NUMBER,
SPID NUMBER,
TYP_VEH VARCHAR2(30),
VEH_NO VARCHAR2(20),
TYP_SER VARCHAR2(20),
SER_DATE DATE,
QTY NUMBER,
SP_RATE NUMBER,
SP_AMT NUMBER,
SP_GST NUMBER,
SER_AMT NUMBER,
COMM NUMBER,
TOTAL NUMBER,

CONSTRAINT FK_SER_DET_CID FOREIGN KEY(CID) REFERENCES CUSTOMER(CID),
CONSTRAINT FK_SER_DET_EID FOREIGN KEY(EID) REFERENCES EMPLOYEE1(EID),
CONSTRAINT FK_SER_DET_SPID FOREIGN KEY (SPID)REFERENCES SPAREPART(SPID)
); 

SELECT * FROM SER_DET;
--DELETE  FROM SER_DET;
INSERT INTO SER_DET VALUES(6001,1001,3001,4001,'TWO WHEELER','MH15CA3228','TUBE DAMAGED',
TO_DATE('02-JAN-11','DD-MON-YY'),1,250,250,35,50,0,335)

INSERT INTO SER_DET VALUES(6002,1002,3002,4002,'TWO WHEELER','MH16U5713','FULL SERVICING',
 TO_DATE('04-MAR-11','DD-MON-YY'),1,400,400,52,300,50,752);

INSERT INTO SER_DET VALUES
(6003,1003,3004,4005,'TWO WHEELER','MH12P3133','CLUTCH WIRE',
 TO_DATE('22-AUG-11','DD-MON-YY'),1,129,129,0,10,0,139);

INSERT INTO SER_DET VALUES(6004,1002,3002,4002,'TWO WHEELER','MH16U5713','FULL SERVICING',
 TO_DATE('05-MAY-11','DD-MON-YY'),1,400,400,52,300,50,752);

INSERT INTO SER_DET VALUES(6005,1004,3001,4009,'TWO WHEELER','MH14PA335','COLOR',
 TO_DATE('21-OCT-11','DD-MON-YY'),2.5,340,850,119,500,150,1469);

INSERT INTO SER_DET VALUES(6006,1006,3001,4009,'TWO WHEELER','MH12WE334','COLOR',
 TO_DATE('01-DEC-11','DD-MON-YY'),2.5,340,850,119,500,150,1469);

INSERT INTO SER_DET VALUES(6007,1007,3001,4001,'FOUR WHEELER','MH17BB1345','TUBE DAMAGED',
 TO_DATE('01-JAN-12','DD-MON-YY'),1,250,250,35,150,0,435);

SELECT * FROM SER_DET;


--Q.1 List all the customers serviced.
SELECT * FROM CUSTOMER
 
SELECT  C.CID,C.CNAME
FROM CUSTOMER C
INNER JOIN SER_DET S
ON C.CID=S.CID;

--Q.2 Customers who are not serviced.
select C.CID,C.CNAME
FROM CUSTOMER C
LEFT JOIN SER_DET S
ON C.CID=S.CID
WHERE S.CID IS NULL



--Q.3 Employees who have not received the commission.
SELECT E.EID,E.ENAME
FROM EMPLOYEE1 E
LEFT JOIN SER_DET S
ON E.EID=S.EID
WHERE S.COMM=0


---OR
SELECT E.EID,E.ENAME
FROM EMPLOYEE1 E
LEFT JOIN SER_DET S
ON E.EID=S.EID
WHERE S.COMM=0 or s.comm IS NULL

--Q.4 Name the employee who have maximum Commission.
SELECT  E.*
FROM EMPLOYEE1 E
INNER JOIN SER_DET S
ON E.EID=S.EID
WHERE S.COMM =(SELECT MAX(COMM)FROM SER_DET)



--Q.5 Show employee name and minimum commission amount received by an employee.

SELECT E.EID,E.ENAME,MIN(S.COMM)
FROM EMPLOYEE1 E
INNER JOIN SER_DET S
ON E.EID=S.EID
GROUP BY E.EID,E.ENAME



--Q.6 Display the Middle record from any table.
select * from
(select e.*,row_number() over(order by eid) as rn
from employee1 e
)
where rn= 
select( ceil(count(*)/2)) employee1

--Q.7 Display last 4 records of any table.

select *from ( select *from employee1
order by eid desc
)
where rownum <= 4;



--Q.8 Count the number of records without count function from any table.

select max(rn)
from(select c.* , row_number()over(order by cid) rn from customer c);

--or
select max(rownum) as total_records
from employee1;



--Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).
delete from ser_det
where sid not in (
    select min(sid)
    from ser_det
    group by cid
);


rollback;

--Q.10 Show the name of Customer who have paid maximum amount 
select c.* from customer c
inner join ser_det s
on c.cid=s.cid
where s.ser_amt=(select max(ser_amt)from ser_det)

--Q.11 Display Employees who are not currently working.
select * from employee1
where edol is not null
 
select * from ser_det
--Q.12 How many customers serviced their two wheelers.

select count(distinct cid) as total_customers
from ser_det
where typ_veh = 'TWO WHEELER';

 

--Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.

select s.cid,p.pid, sp.spid,sp.spname ,sp.spunit 
from sparepart sp 
join purchase p 
on sp.spid=p.spid 
join ser_det s 
on p.spid=s.spid





--Q.14 Customers who have Colored their vehicles.
SELECT * FROM SER_DET
WHERE TYP_SER ='COLOR'



--Q.15 Find the annual income of each employee inclusive of Commission.





--Q.16 Vendor Names who provides the engine oil.
SELECT * FROM VENDORS




--Q.17 Total Cost to purchase the Color and name the color purchased.








--Q.18 Purchased Items which are not used in "Ser_det".




--Q.19 Spare Parts Not Purchased but existing in Sparepart
select sp.spname
from sparepart sp
left join purchase p on sp.spid = p.spid
where p.pid is null;




--Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation.

select sum(s.total)-sum(e.esal) 
from employee1 e 
join ser_det s 
on e.eid=s.eid 

---.21 Specify the names of customers who have serviced their vehicles more than one time.
select c.cname,count(s.cid) service_count 
from customer c 
join ser_det s
 on c.cid=s.cid 
group by c.cname 
having count(s.cid)>1;

--Q.22 List the Items purchased from vendors locationwise.


--Q.23 Display count of two wheeler and four wheeler from ser_details
SELECT TYP_VEH ,COUNT(*) AS TOTAL_COUNT
FROM SER_DET
WHERE TYP_VEH in('TWO WHEELER','FOUR WHEELER') 
GROUP BY TYP_VEH



SELECT * FROM SER_DET

--Q24 Display name of customers who paid highest SPGST and for which item.
 SELECT C.* 
 FROM CUSTOMER C
 INNER JOIN SER_DET S
 ON C.CID=S.SID
 WHERE MAX(SP_GST) AS HIGEST_PAID
 GROUP BY C.CNAME
--Q25 Display vendors name who have charged highest SPGST rate  for which item

select v.vname,s.spname,p.spgst
from vendors v
join purchase p   
on v.vid = p.vid
join sparepart s  
on p.spid = s.spid
where p.spgst = (select max(spgst) from purchase);

--Q26   list name of item and employee name who have received item 

select s.spname as item_name,e.ename  as employee_name
from purchase p
join sparepart s 
on p.spid = s.spid
join employee1 e 
on p.rcv_eid = e.eid;



--Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, And Name the Item used for Service, And specify the purchase date of that Item with his vendor and Item Unit and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".'



--Q28 who belong this vehicle  MH-14PA335" Display the customer name 

select c.cname
from customer c
join ser_det s on c.cid = s.cid
where s.veh_no = 'MH-14PA335';

------ in que [-] is their thats why we use [-] in above query byt we not insert[-] in vehical no. thats why we write tha 2nd query
select c.cname
from customer c
join ser_det s on c.cid = s.cid
where s.veh_no = 'MH14PA335';

--Q29 Display the name of customer who belongs to New York and when he /she service their  vehicle on which date    

select c.cname,
       s.ser_date
from customer c
join ser_det s on c.cid = s.cid
where c.cadd = 'NEW YORK';




--Q 30 from whom we have purchased items having maximum cost?

select v.vname
from vendors v
join purchase p on v.vid = p.vid
where p.total = (select max(total) from purchase);

--Q31 Display the names of employees who are not working as Mechanic and that employee done services   .

select distinct e.ename
from employee1 e
join ser_det s on e.eid = s.eid
where e.ejob not in 'MECHANIC';


--Q32 Display the various jobs along with total number of employees in each job. The output should
--contain only those jobs with more than two employees.
select ejob,
count(*) as total_employees
from employee1
group by ejob
having count(*) > 2;


--Q33 Display the details of employees who done service  and give them rank according to their no. of services .
select e.eid,e.ename,e.ejob,count(s.sid) as total_services,
rank() over (order by count(s.sid) desc) as service_rank
from employee1 e
join ser_det s on e.eid = s.eid
group by e.eid, e.ename, e.ejob
order by service_rank;

--Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter  
select e.eid,e.ename,e.ejob,
count(s.sid) as total_services
from employee1 e
join ser_det s on e.eid = s.eid
where e.ejob in ('PAINTER', 'FITTER')
group by e.eid, e.ename, e.ejob
order by e.ejob;






--Q35 Display employee salary and as per highest  salary provide Grade to employee 
select e.ename,e.esal,
rank() over (order by e.esal desc) as grade
from employee1 e
order by grade;



--Q36  display the 4th record of emp table without using group by and rowid

select *from (select e.*, rownum as rn
from employee1 e
order by e.eid
)
where rn = 4;

--Q37 Provide a commission 100 to employees who are not earning any commission.
update employee1
set comm = 100
where comm is null or comm = 0;





--Q38 write a query that totals no. of services  for each day and place the results in descending order
select s.ser_date,
count(*) as total_services
from ser_det s
group by s.ser_date
order by total_services desc;

select * from ser_det





--Q39 Display the service details of those customer who belong from same city

select s.*from ser_det s
join customer c on s.cid = c.cid
where c.cadd in (select cadd
from customer
group by cadd
having count(*) > 1
);
 

--Q40 write a query join customers table to itself to find all pairs of customers service by a single employee
select c1.cname, c2.cname, s1.eid
from ser_det s1
join ser_det s2 
on s1.eid = s2.eid and s1.cid < s2.cid
join customer c1 
on s1.cid = c1.cid
join customer c2 
on s2.cid = c2.cid;



--Q41 List each service number follow by name of the customer who made  that service

select s.sid,c.cname
from ser_det s
join customer c 
on s.cid = c.cid
order by s.sid;

--Q42 Write a query to get details of employee and provide rating on basis of  maximum services provide by employee  .Note (rating should be like A,B,C,D)
--Q43 Write a query to get maximum service amount of each customer with their customer details ?
select c.cname , max(s.ser_amt)
from customer c join ser_det s on c.cid=s.cid 
group by c.cname



--Q44 Get the details of customers with his total no of services ?
select c.cname ,count(s.cid) total_no_ser 
from customer c 
join ser_det s 
on c.cid=s.cid 
group by c.cname

--Q45 From which location sparpart purchased  with highest cost ?




--Q46 Get the details of employee with their service details who has salary is null
select e.*, s.*
from employee1 e
join ser_det s on e.eid = s.eid
where e.esal is null;

--Q47 find the sum of purchase location wise 
select v.vadd , sum(p.total) from vendors v 
join purchase p 
on v.vid=p.vid 
group by v.vadd;

--Q48 write a query sum of purchase amount in word location wise ?



--Q49 Has the customer who has spent the largest amount money has been give highest rating
select c.cname,s.total, 
dense_rank()over(order by s.total desc)rating 
from customer c 
join ser_det s 
on c.cid=s.cid ;

--Q50 select the total amount in service for each customer for which the total is greater than the amount of the largest service amount in the table
select cid,sum(total) 
from ser_det
group by cid 
having sum(total)>(select max(total) from ser_det); 
  

--Q51  List the customer name and sparepart name used for their vehicle and  vehicle type
select c.cname,sp.spname,s.typ_veh
from ser_det s
join customer c 
on s.cid = c.cid
join sparepart sp 
on s.spid = sp.spid;

--Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 
select sp.spname,e.ename,c.cname,s.qty,s.sp_rate,s.total
from ser_det s
join sparepart sp 
on s.spid = sp.spid
join employee1 e 
on s.eid = e.eid
join customer c 
on s.cid = c.cid;

select * from ser_det


--Q53 specify the vehicles owners who’s tube damaged.

select c.cname, s.typ_ser from customer c 
join ser_det s 
on c.cid=s.cid 
where s.typ_ser='TUBE DAMAGED';

--Q.54 Specify the details who have taken full service.
select distinct (c.cname), s.typ_ser 
from customer c 
join ser_det s on c.cid=s.cid 
where s.typ_ser='FULL SERVICING';





--Q.55 Select the employees who have not worked yet and left the job.
select *from employee1
where edol is not null and esal is null;

---or ???
select * from employee1 
where eid not in 
(select eid from ser_det) and esal is null;



--Q.56  Select employee who have worked first ever.

select *from employee1
where edoj = (select min(edoj) from employee1);

--Q.57 Display all records falling in odd date

select *
from ser_det
where to_number(to_char(sdate,'DD')) mod 2 = 1;


select * from ser_det
where mod(extract(day from(ser_date)),2)<>0;



--Q.58 Display all records falling in even date

select * from ser_det
where mod(extract(day from(ser_date)),2)=0;




--Q.59 Display the vendors whose material is not yet used.

select vname from vendors
where vid in (select vid from purchase
where spid in(select spid from purchase
where spid not in(select spid from ser_det)));

--or
select v.vname
from vendors v
left join purchase p on v.vid = p.vid
left join ser_det s on p.spid = s.spid
where s.sid is null;

--Q.60 Difference between purchase date and used date of spare part.
 select p.pid,
       sp.spname,
       p.pdate,
       s.sdate,
       s.sdate - p.pdate as days_diff
from purchase p
join ser_det s on p.spid = s.spid;


