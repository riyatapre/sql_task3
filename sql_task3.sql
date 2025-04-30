Create Table Users (
    UserID INT Primary Key,
    Name VARCHAR ,
    Email VARCHAR 
); 
insert into users( UserID, Name,Email)
values
(101,'joy','joy@gmail.com'),
(102,'kunal','kunal21@gmail.com'),
(103,'rani','rani56@gmail.com'),
(104,'rahul','rahul@gmail.com'),
(105,'nik','nikkkk34@gmail.com');

select *from users

Create Table Orders (
    OrderID INT  Primary Key,
    UserID INT,
    OrderDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
insert into orders(OrderID ,UserID , OrderDate)
values
(1,101,'04-23-2025'),
(2,102,'04-24-2025'),
(3,103,'04-25-2025'),
(4,104,'04-23-2025'),
(5,105,'04-24-2025');

select *from orders


Create Table Products (
    ProductID INT  Primary Key,
    Name VARCHAR,
    Price int 
);
insert into products(ProductID, Name,Price )
values
(12,'bag',400),
(13,'bottle',300),
(14,'shoes',1000),
(15,'football',500),
(16,'top',450);
select * from products


Create Table OrderDetails (
    OrderDetailID INT  Primary Key,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Foreign Key (OrderID) REFERENCES Orders(OrderID),
     Foreign Key (ProductID) REFERENCES Products(ProductID)
);
insert into OrderDetails (OrderDetailID,OrderID, ProductID,Quantity)
values
(11,1,12,1),
(12,2,13,3),
(13,3,14,2),
(14,4,15,2),
(15,5,16,1);
select *from OrderDetails

Create Table Shipping (
    ShippingID INT Primary Key,
    OrderID INT,
    ShippingDate DATE,
    Address VARCHAR(255),
     Foreign Key (OrderID) REFERENCES Orders(OrderID)
);
insert into shipping(shippingid,orderid,shippingdate,address)
values
(44,1,'04-28-2025','nagpure'),
(55,2,'04-30-2025','pune'),
(66,3,'04-28-2025','mumbai'),
(77,4,'05-01-2025','pune'),
(88,5,'05-02-2025','nagpur');
select*from shipping

select* from users;
select name from users;
select email from users;
select distinct name from users;
select 'email','name' from users;


select *from orders ;
select orderid from orders ;
select userid,orderid from orders ;
select  orderid,orderdate from orders ;
select distinct orderdate from orders ;


select* from products ;
select name from products;
select productid,price from products;
select distinct price from products ;
select productid, name from products ;

select *from  OrderDetails;
select  OrderDetailid from  OrderDetails;
select  OrderDetailid ,quantity from  OrderDetails;
select orderid,productid from  OrderDetails;
select distinct quantity from  OrderDetails;

select*from shipping;
select orderid from shipping;
select address from shipping;
select orderid , address from shipping;
select distinct shippingdate from shipping;

--where clause
select* from users where userid<105 ;
select name from users where name =joy;
select email from users where userid=104;
select userid from users userid>=103;
select email from users where userid>101;


select *from orders where userid>=105 ;
select orderid from orders where orderdate =  '2025-04-25' ;
select userid from orders where orderdate = '2025-04-25'  ;
select  orderid from orders where userid >=103 ;
select orderdate from orders where userid=104 ;

select* from products where productid=15 ;
select name from products productid => 13;
select productid,price from products where name = 'shoes';
select price from products where price>500;
select price  from products where price >=300;

select *from  OrderDetails where quantity=3;
select  OrderDetailid from  OrderDetails where orderid<=4;
select  OrderDetailid ,quantity from  OrderDetails where productid=15;
select orderid from  OrderDetails where orderid>=3;
select quantity from  OrderDetails where quantity=2;

select*from shipping where orderid=3;
select orderid from shipping where address='pune';
select address from shipping where shippingid=66;
select orderid , address from shipping where orderid>=77;
select distinct shippingdate from shipping where shippingid=88;

--And
select* from users where userid<105 and name='joy' ;
select name from users where name =joy and userid>103;
select email from users where userid=104 and email=rani56@gmail.com;
select useuserid=101rid from users userid=105 and name='nik';
select email from users where  userid=101 and userid=104;

select *from orders where userid>=105 and orderdate='2025-04-24' ;
select orderid from orders where orderdate =  '2025-04-25' and orderid=3 ;
select userid from orders where orderid =4 and userid=104  ;
select  orderid from orders where userid >=103 and orderdate=2025-04-25 ;
select orderdate from orders where userid=104 and orderdate is  not null ;

select* from products where productid=15 and name ='football' ;
select name from products productid => 13 and productid is not null;
select productid,price from products where name = 'shoes'and price =>500 ;
select price from products where price>500 and price is not null;
select price  from products where price >=300 and name ='shoes';

select *from  OrderDetails where quantity=3 and orderid>=3;
select  from  OrderDetails where orderid<=4 and productid=15;
select  OrderDetailid ,quantity from  OrderDetails where productid=15 and  quantity=<5;
select orderid from  OrderDetails where orderid>=3 and orderid is not null;
select quantity from  OrderDetails where quantity=2 and productid=14;


select*from shipping where orderid=3 and address='mumbai';
select orderid from shipping where address='pune' and shippingid=55;
select address from shipping where shippingid=66 and orderid=3;
select orderid , address from shipping where orderid>=77 and shippingid is not null;
select distinct shippingdate from shipping where shippingid=88 and orderid>=5;

--or
select * FROM Users where UserID = 101 or Name = 'joy' ;
select UserID, name from Users where UserID = 102 or  UserID = 105;
select Email from Users where UserID = 103 or  Email = 'nikkkk34@gmail.com';
select name from Users where UserID = 101 or UserID = 104;
select * from Users where  Name = 'rahul' or UserID = 101;

select * from orders where orderid = 1 or userid = 102 ;
select orderid, userid from orders where orderdate = '2025-04-25' or userid = 104;
select orderid from orders where orderdate = '2025-04-23' or orderid = 2;
select * from orders where userid = 105 or orderid = 1;
select userid, orderdate from orders where orderid = 4 or userid =106;

select * from products where productid = 12 or name = 'shoes' ;
select productid, price from products whereproductid = 13 or price >= 450 ;
select name from products where price = 500 or productid = 16  ;
select productid from products where price > 300 or name = 'bottle';
select * from products where productid = 15 or price >= 300 ;

select * from orderdetails where orderdetailid = 11 or orderid = 2 ;
select orderdetailid, productid from orderdetails where orderid = 3 or quantity = 2 ;
select orderid from orderdetails where productid = 13 or orderdetailid = 12 ;
select quantity from orderdetails where orderdetailid = 11 or orderid = 1 ;
select * from orderdetails where quantity = 2 or orderid = 5;

select * from shipping where shippingid = 44 or orderid = 3 ;
select shippingid, address from shipping where shippingdate = '2025-04-30' or orderid = 2 ;
select orderid from shipping where shippingid = 55 or shippingdate = '2025-04-28' ;
select * from shipping where  shippingid = 66 or shippingdate = '2025-04-28' ;
select shippingid from shipping where orderid = 5 or shippingdate = '2025-05-02' ;

--not
select* from users where not userid<105 ;
select * from orders where not orderid = 1   ;
select * from products where  not productid = 12 or name = 'shoes' ;
select * from orderdetails where not orderdetailid = 11 or orderid = 2 ;
select distinct shippingdate from shipping where not shippingid=88 and orderid>=5;

--all
select name from users where name = 'kunal' and userid!=104;
select name from users where  not name ='joy' or userid=102 ;
select email from users where userid=104 and name='rani';
select userid from users where name!=joy;

select *from orders where userid>=105 or orderid=3;
select orderid from orders where orderdate =  '2025-04-25' and orderid=5;
select userid from orders where orderdate = '2025-04-25' or userid<105 ;
select  orderid from orders where userid >=103 and is orderdate not null ;
select orderdate from orders where userid=104 and orderid =4 or orderdate ='2025-04-23';

select * from products where price > 500;  
select name from products where productid = 10 or productid = 15;  
select productid, price from products where price between 300 and 700;  
select distinct price from products where price is not null;  
select productid, name from products where price > 100 and name != 'joy';  

select * from orderdetails where quantity > 2;  
select orderdetailid from orderdetails where orderid = 1 or orderid = 5;  
select orderdetailid, quantity from orderdetails where quantity != 0;  
select orderid, productid from orderdetails where productid = 10 and quantity >= 2;  
select distinct quantity from orderdetails where quantity is not null; 

select * from shipping where address != 'nagpur';  
select orderid from shipping where address = 'pune' or orderid = 77;  
select address from shipping where shippingid = 66 and address is not null;  
select orderid, address from shipping where orderid >= 77 and address != 'delhi';  
select distinct shippingdate from shipping where shippingdate is not null;  

