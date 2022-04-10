create table JOBS_XYZHOTEL
 ( Job_Id number(3)  primary key,
 Job_name varchar2(20) not null
 );
desc JOBS_XYZHOTEL

select * from JOBS_XYZHOTEL;


drop table  JOBS_XYZHOTEL
Drop table JOBS_XYZHOTE cascade constraints; 

insert into JOBS_XYZHOTEL values( 1 , ' Manager' );
insert into JOBS_XYZHOTEL values( 2 , ' Recipient' );
insert into JOBS_XYZHOTEL values( 3 , 'Room Service' );
select * from JOBS_XYZHOTEL;



create table Employees_XYZHOTEL
( Emp_id number(4) primary key,
First_Name varchar2(20) not null,
Last_Name varchar2(20) not null,
Hire_date DATE  ,
Sex varchar2(10) not null,     
Salary_in_SR number(12,2) not null,
Email varchar2(50) not null,
Phone_number varchar(10)  null  ,
Mobile_Number varchar(10) not null unique ,
Job_Id number(3),
Foreign key (Job_Id) references JOBS_XYZHOTEL(Job_Id));


Drop table Employees_XYZHOTEL cascade constraints; 

insert into Employees_XYZHOTEL values('1000', 'Ali', 'saad', TO_DATE('2000-12-02', 'YYYY-MM-DD'), 'male', '3000.50', '1000@gmail.com', '0125975455', '0554721591', '3');
insert into Employees_XYZHOTEL values('1100', 'Omar', 'Adel', TO_DATE('2009-08-04', 'YYYY-MM-DD'), 'male', '10500.50', '1100@gmail.com', '', '0552135784', '1');
insert into Employees_XYZHOTEL values('2000', 'mahmed', 'Hassan', TO_DATE('2010-05-17', 'YYYY-MM-DD'), 'male', '2000', '2000@gmail.com', '', '0556879248', '3');
insert into Employees_XYZHOTEL values('2500', 'Fahed', 'Omran', TO_DATE('2012-01-16', 'YYYY-MM-DD'), 'male', '12000', '2500@gmail.com', '', '0557982457', '2');
insert into Employees_XYZHOTEL values('3500', 'waleed', 'Naseer', TO_DATE('2017-05-02', 'YYYY-MM-DD'), 'male', '2000', '3500@gmail.com', '0125973471', '0559730249', '3');
select * from Employees_XYZHOTEL;

Drop table Employees_XYZHOTEL cascade constraints; 


create table Room_Types_XYZHOTEL

( Room_Type_ID  number(2) primary key,    
name_room_type  varchar2(25) not null,
room_Capacity number(2) not null,
Price_in_SR number(12,2) not null ,
Description_of_room varchar2(200) null );

Drop table Employees_and_Rooms_XYZHOTEL cascade constraints; 

insert into Room_Types_XYZHOTEL values(1,' single',1, 100 ,'A room assigned to one person. May have one or more beds.' );
insert into Room_Types_XYZHOTEL values(2,' Double',2, 200 ,'A room assigned to two people. May have one or more beds.' );
insert into Room_Types_XYZHOTEL values(3,' Triple',3, 300 ,'A room assigned to three people. May have two or more beds..' );
insert into Room_Types_XYZHOTEL values(4,' Studioe',2, 500 ,'' );
select * from Room_Types_XYZHOTEL;


create table Rooms_XYZHOTEL
( Room_no number(4) primary key ,
Floor_number number(2) not null ,
Room_Type_ID number(2) not null ,
Room_Extension number(4) not null ,
status varchar2(50) not null ,
Services varchar2(150) null ,
Foreign key (Room_Type_ID) references Room_Types_XYZHOTEL(Room_Type_ID));

insert into  Rooms_XYZHOTEL values(101,1,1, 101 ,'Reserved' ,'' ); 
insert into  Rooms_XYZHOTEL values(102,1,2, 102 ,'Reserved' ,'' );
insert into  Rooms_XYZHOTEL values(201,2,3, 201 ,'free' ,'' );
insert into  Rooms_XYZHOTEL values(202,2,4, 202 ,'free' ,'' );
insert into  Rooms_XYZHOTEL values(301,3,1, 301 ,'Reserved' ,'' );
insert into  Rooms_XYZHOTEL values(302,3,2, 302 ,'Reserved' ,'' );
insert into  Rooms_XYZHOTEL values(401,4,3, 401 ,'free' ,'' );
insert into  Rooms_XYZHOTEL values(402,4,4, 402 ,'Reserved' ,'' );

update Rooms_XYZHOTEL set status ='Free';
select * from Rooms_XYZHOTEL;

Drop table Rooms_XYZHOTEL cascade constraints; 


create table Employees_and_Rooms_XYZHOTEL
( Room_no number(4) primary key ,
Employee_id number(4) not null ,
IS_Cleaned varchar2(20) not null ,
Foreign key (Employee_id) references Employees_XYZHOTEL(Emp_id));

insert into  Employees_and_Rooms_XYZHOTEL values(101,1000, 'Yes'  );
insert into  Employees_and_Rooms_XYZHOTEL values(102,1000, 'No'  );
insert into  Employees_and_Rooms_XYZHOTEL values(201,2500, 'Yes'  );
insert into  Employees_and_Rooms_XYZHOTEL values(202,2500, 'yes'  );
insert into  Employees_and_Rooms_XYZHOTEL values(301,3500, 'No'  );
insert into  Employees_and_Rooms_XYZHOTEL values(302,1000, 'Yes'  );
insert into  Employees_and_Rooms_XYZHOTEL values(401,2500, 'Yes'  );
insert into  Employees_and_Rooms_XYZHOTEL values(401,1000, 'No'  );
insert into  Employees_and_Rooms_XYZHOTEL values(401,3500, 'No'  );
insert into  Employees_and_Rooms_XYZHOTEL values(402,3500, 'Yes'  );
insert into  Employees_and_Rooms_XYZHOTEL values(402,3500, 'Yes'  );
insert into  Employees_and_Rooms_XYZHOTEL values(402,2500, 'yes'  );
select * from Employees_and_Rooms_XYZHOTEL;



Drop table Employees_and_Rooms_XYZHOTEL cascade constraints; 


create table Guests_XYZHOTEL
( National_ID number(10) Primary key ,
Full_Name varchar2(50) not null ,
Registration_Date date ,
Email varchar2(50) not null unique ,
Phone_number number(7) null ,
Mobile_Number number(9) not null unique,
Address varchar2(100) null );

insert into Guests_XYZHOTEL values(1234567891,'Guest1xxxxxx', TO_DATE('01-11-10', 'YY-MM-DD') , 'guest1@gmail.com' ,2218888,555012344,'abha street 12378' );
insert into Guests_XYZHOTEL values(1234567892,'Guest2xxxxxx', TO_DATE('02-11-10', 'YY-MM-DD') , 'guest2@gmail.com' ,2218889,555012346,'abha street 6595' );
insert into Guests_XYZHOTEL values(1234567893,'Guest3xxxxxx1', TO_DATE('03-11-10', 'YY-MM-DD') , 'guest3@gmail.com' ,'',555012347,'' );
insert into Guests_XYZHOTEL values(1234567894,'Guest4xxxxxx1', TO_DATE('03-11-10', 'YY-MM-DD') , 'guest4@gmail.com' ,2218891,555012348,'abha street 12378' );
insert into Guests_XYZHOTEL values(1234567895,'Guest5xxxxxx1', TO_DATE('04-11-10', 'YY-MM-DD') , 'guest5@gmail.com' ,'',555012349,'' );
insert into Guests_XYZHOTEL values(1234567896,'Guest6xxxxxx1', TO_DATE('05-11-10', 'YY-MM-DD') , 'guest6@gmail.com' ,'',555012350,'' );
insert into Guests_XYZHOTEL values(1234567897,'Guest7xxxxxx1', TO_DATE('06-11-10', 'YY-MM-DD') , 'guest7@gmail.com' ,2218894,555012351,'Riyadh street 3788' );
insert into Guests_XYZHOTEL values(1234567898,'Guest8xxxxxx1', TO_DATE('07-11-10', 'YY-MM-DD') , 'guest8@gmail.com' ,'',555012352,'' );
insert into Guests_XYZHOTEL values(1234567899,'Guest9xxxxxx1', TO_DATE('08-11-10', 'YY-MM-DD') , 'guest9@gmail.com' ,2218896,555012353,'Jeddah street 8929' );
insert into Guests_XYZHOTEL values(1234567900,'Guest10xxxxxx1', TO_DATE('09-11-10', 'YY-MM-DD') , 'guest10@gmail.com' ,2218897,555012354,'Riyadh street 3052' );
insert into Guests_XYZHOTEL values(1234567901,'Guest11xxxxxx1', TO_DATE('10-11-10', 'YY-MM-DD') , 'guest11@gmail.com' ,'',555012356,'abha street 12378' );
insert into Guests_XYZHOTEL values(1234567902,'Guest12xxxxxx1', TO_DATE('11-11-10', 'YY-MM-DD') , 'guest12@gmail.com' ,2218899,555012357,'abha street 12378' );
insert into Guests_XYZHOTEL values(1234567903,'Guest13xxxxxx1', TO_DATE('12-11-10', 'YY-MM-DD') , 'guest13@gmail.com' ,'',555012358,'khamis street 2658' );
insert into Guests_XYZHOTEL values(1234567904,'Guest14xxxxxx1', TO_DATE('13-11-10', 'YY-MM-DD') , 'guest14@gmail.com' ,22189001,555012359,'abha street 6458' );
select * from Guests_XYZHOTEL;

DELETE FROM Guests_XYZHOTEL
WHERE Registration_Date = TO_DATE('01-11-10', 'YY-MM-DD')
   select * from Guests_XYZHOTEL;


   select * from Guests_XYZHOTEL;


delete  from Guests_XYZHOTEL
 where trunc(Registration_Date) = TO_DATE('01-11-10', 'YY-MM-DD')  
 
   select * from Guests_XYZHOTEL;

Drop table Guests_XYZHOTEL cascade constraints; 






create table Reservation_XYZHOTEL
( Reservation_no number(5) primary key ,
Date_of_reservation date ,
Room_Type_ID number(2) not null ,
Room_no number(4) ,
Entry_date date ,
Leave_date date ,
Guest_National_Id number(10) not null ,
Foreign key (Room_Type_ID) references Room_Types_XYZHOTEL(Room_Type_ID),
Foreign key (Room_no) references Rooms_XYZHOTEL(Room_no),
Foreign key (Guest_National_Id) references Guests_XYZHOTEL(National_ID));


insert into Reservation_XYZHOTEL values(10101,TO_DATE('16-02-10', 'YY-MM-DD'),1,101,TO_DATE('16-02-10', 'YY-MM-DD'),TO_DATE('16-02-12', 'YY-MM-DD') ,1234567891);
insert into Reservation_XYZHOTEL values(10102,TO_DATE('16-02-11', 'YY-MM-DD'),2,102,TO_DATE('16-02-11', 'YY-MM-DD'),TO_DATE('16-02-13', 'YY-MM-DD') ,1234567892);
insert into Reservation_XYZHOTEL values(10103,TO_DATE('16-02-12', 'YY-MM-DD'),3,201,TO_DATE('16-02-12', 'YY-MM-DD'),TO_DATE('16-02-14', 'YY-MM-DD') ,1234567893);
insert into Reservation_XYZHOTEL values(10104,TO_DATE('16-02-13', 'YY-MM-DD'),4,202,TO_DATE('16-02-13', 'YY-MM-DD'),TO_DATE('16-02-17', 'YY-MM-DD') ,1234567894);
insert into Reservation_XYZHOTEL values(10105,TO_DATE('16-02-14', 'YY-MM-DD'),3,401,TO_DATE('16-02-14', 'YY-MM-DD'),TO_DATE('16-02-19', 'YY-MM-DD') ,1234567894);
insert into Reservation_XYZHOTEL values(10106,TO_DATE('16-02-15', 'YY-MM-DD'),4,402,TO_DATE('16-02-15', 'YY-MM-DD'),TO_DATE('16-02-24', 'YY-MM-DD') ,1234567893);
select * from Reservation_XYZHOTEL;

select days_between( Leave_date, Entry_date );
    
alter table Reservation_XYZHOTEL add duration date;


Drop table Reservation_XYZHOTEL cascade constraints; 


create table Bills_XYZHOTEL
( Invoice_No number(5) primary key ,
Reservation_no number(5) not null ,
Date_of_payment date ,
Room_Type_ID number(2) not null , 
Room_no number(4) not null ,
Total number(12,2) not null ,
Payment_method varchar2(50) not null ,
Foreign key (Reservation_no) references Reservation_XYZHOTEL(Reservation_no),
Foreign key (Room_Type_ID) references Room_Types_XYZHOTEL(Room_Type_ID),
Foreign key (Room_no) references Rooms_XYZHOTEL(Room_no));


insert into Bills_XYZHOTEL values(11000,10101, TO_DATE('16-02-10', 'YY-MM-DD'),1,101,400,'Cash');
insert into Bills_XYZHOTEL values(11001,10102, TO_DATE('16-02-11', 'YY-MM-DD'),2,102,500,'Cash');
insert into Bills_XYZHOTEL values(11002,10103, TO_DATE('16-02-13', 'YY-MM-DD'),3,201,200,'Credit card');
insert into Bills_XYZHOTEL values(11003,10104, TO_DATE('16-02-13', 'YY-MM-DD'),4,202,1500,'Cash');
insert into Bills_XYZHOTEL values(11004,10105, TO_DATE('16-02-15', 'YY-MM-DD'),3,401,600,'Credit card');
insert into Bills_XYZHOTEL values(11006,10106, TO_DATE('16-02-16', 'YY-MM-DD'),4,402,1300,'Credit card');
select * from Reservation_XYZHOTEL;



Drop table Bills_XYZHOTEL cascade constraints; 


update * from Rooms_XYZHOTEL set status='Free';