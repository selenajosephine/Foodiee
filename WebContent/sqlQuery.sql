
create table userTable(
	user_id number(8) primary key,
	user_name varchar2(30) not null,
	phone number(10) not null unique,
	email varchar2(30) not null unique,
	user_type varchar2(10) not null check (user_type in ('Vendor', 'Customer', 'Admin')),
	password varchar2(16) not null,
	center_id number(5) not null
)

insert into userTable values(1465142, 'Nick', 1234567890, 'a@a.com', 'Customer', '123', 101);

insert into userTable values(1100000, 'TCSADMIN', 1234, 'aja@a.com','Admin', '123', 101);
select * from USERTABLE;
delete from USERTABLE
where center_id = 1;

==== this is my table ===

create table productRelationTable(
productId number(10),
centerId number(10),
orderedQuantity number(10)
);

delete from productrelationtable
drop table productrelationtable

select * from productRelationTable

insert into productrelationtable values(1,101,0);
insert into productrelationtable values(2,101,0);
insert into productrelationtable values(3,101,0);
insert into productrelationtable values(4,101,0);
insert into productrelationtable values(5,101,0);
insert into productrelationtable values(6,101,0);

 
create table itemTable(
orderId varchar(30) ,
productId number(10),
orderQuantity number(10)
)

delete from itemtable
drop table itemTable
select * from itemtable

create table orderTable(
orderId varchar(30) primary key,
customerId number(10),
paymentType varchar(20) check (paymentType in('card','salary')),
orderDate timestamp,
orderStatus varchar(20) check (orderStatus in('accepted','preparing','delivered')),
totalAmount number(10),
centerId number(10)
)

delete from ordertable
select * from ordertable

drop table orderTable
======my table ends =====

select * from orderItemTable

create table productTable (
	product_id number(5) primary key,
	product_name varchar2(30) not null unique,
	price number(10,2) not null,
	category varchar2(50) not null
)

insert into PRODUCTTABLE values(1, 'Kashmiri Pulav', 50, 'North Indian, Veg');
insert into PRODUCTTABLE values(2, 'Maggi', 30, 'North Indian, Veg, Snacks');
insert into PRODUCTTABLE values(3, 'Chole Bhature', 60, 'North Indian, Veg, Breakfast');
insert into PRODUCTTABLE values(4, 'North Indian Meal', 55, 'North Indian, Veg, Lunch');
insert into PRODUCTTABLE values(5, 'Pani Puri', 30, 'Veg, Snacks');
insert into PRODUCTTABLE values(6, 'Pav Bhaji', 50, 'Veg, Snacks');
insert into PRODUCTTABLE values(7, 'Dosa', 30, 'South Indian, Veg');

select * from PRODUCTTABLE
select PRODUCTTABLE.*, centerProductTable.center_id, centerProductTable.quantity from PRODUCTTABLE 
inner join centerproducttable on PRODUCTTABLE.product_id = centerProductTable.product_id and centerProductTable.center_id = 1

create table centerProductTable(
	center_id number not null,
	product_id number(5) not null,
	quantity number(3) not null
) 

select * from CARTTABLE
delete from CARTTABLE

delete from centerProductTable
insert into centerProductTable values(101, 1, 100);
insert into centerProductTable values(101, 2, 100);
insert into centerProductTable values(101, 3, 100);
insert into centerProductTable values(101, 4, 100);
insert into centerProductTable values(101, 5, 100);
insert into centerProductTable values(101, 6, 10);
insert into centerProductTable values(103, 1, 100);
insert into centerProductTable values(103, 5, 100);
insert into centerProductTable values(2, 6, 100);


update CENTERPRODUCTTABLE
set quantity = 10
where product_id = 6 and center_id = 101
select * from CARTTABLE
select CARTTABLE.PRODUCT_ID, CARTTABLE.PRODUCT_NAME, PRODUCTTABLE.PRICE, CARTTABLE.QUANTITY from CARTTABLE 
inner join PRODUCTTABLE 
on PRODUCTTABLE.PRODUCT_ID = CARTTABLE.PRODUCT_ID and CARTTABLE.CUSTOMER_ID=1465142
delete from CARTTABLE


create table cartTable(
	customer_id number(8) not null,
	product_id number(5) not null,
	product_name varchar2(30) not null,
	quantity number(3) not null
)


drop table carttable    
select * from carttable
create table city (
	city_id number primary key,
	city_name varchar2(30) not null unique
)
drop table city
create table center (
	center_id number primary key,
	city_id number references city(city_id) not null,
	center_name varchar2(50) not null unique
)

insert into CITY values(1, 'Ahmedabad');
insert into CITY values(2, 'Chennai');

insert into CENTER values(101, 1, 'Garima Park, Gandhinagar');
insert into CENTER values(102, 1, 'Ahmedabad-STP');
insert into CENTER values(103, 2, 'Karapakkam, OMR');
insert into CENTER values(104, 2, 'Tidle Park');

+++++++++++++++++++
select productId,orderedQuantity from productRelationTable where centerId=101
select product_name from productTable where product_id=2


select p.*,i.orderQuantity from productTable p, itemTable i where i.orderId='1888225b:1632535351a:-7ffe' and i.productId=p.product_id

select p.*, i.orderQuantity from productTable p,itemTable i where (select product_id from (i.productId=p.product_id and i.orderId ='-6862ccb2:16320d3709f:-8000')

select * from (select productId,orderQuantity from  itemTable where orderId='1888225b:1632535351a:-7ffe')  join productTable on productId=product_id

{{{{{
select *,sum( from PRODUCTTABLE,(select productId,sum(orderQuantity) from itemTable,(select orderId as a from orderTable where customerId=1465490 and orderDate<To_Date('03/05/2018','dd/mm/yyyy')) where orderId=a group by productId) where productId=product_id
view as 


select sum(orderQuantity),PRODUCTID from producttable , itemtable , ordertable  where customerId=1465490 and orderDate<To_Date('03/05/2018','dd/mm/yyyy') and productId=product_id and ordertable.orderid=itemtable.orderid GROUP BY PRODUCTID

sele

select * from itemtable
select * from ordertable

insert into usertable values()
select productId,sum(orderQuantity) from itemTable where orderId='1888225b:1632535351a:-7ffe' group by productId
select * from usertable
select center_name from center where city_id = (select city_id from city where city_name='Ahmedabad')