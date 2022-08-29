Create database Assignment4

Create Table book
(
    Id Numeric(2),
	Title VARCHAR(20) Not Null,
	Author VARCHAR(20) Not Null,
	isbn NUMERIC(12) UNIQUE,
	PublishedDate DATE Not Null,
	Primary Key(ID)
	);
Insert into book values(1,'My First SQL Books','Mary Parker',981483029127,'2012-02-22'),(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03'),
(3,'My Third SQL Book','Cary Flint',523120967812,'2015-10-18');

Select * from book WHERE Author like '%er'

--2
Create table reviews
(
    Id Numeric(2),
	BookId Numeric(2) Not Null,
	ReviewerName VARCHAR(20),
	Content VARCHAR(20),
	Rating NUMERIC(2),
	PublishedDate Date Not Null,
	Primary Key(Id),
	Foreign Key(BookId) references book(id)
	);
Insert into reviews values(1,1,'John Smith','My First Review',4,'2017-12-10'),(2,2,'John Smith','My Second Review',5,'2017-10-13'),
(3,2,'Alice Walker','Another Review',1,'2017-10-22');

Select b.Title,b.Author,r.ReviewerName from book b, reviews r  WHERE b.Id = r.BookId;

--3
Select ReviewerName, Count(ReviewerName) as 'Number Of Reviews' from reviews GROUP BY ReviewerName HAVING COUNT(ReviewerName)>1

--4
Create table Customer
(
    Id Numeric(2),
	Name VARCHAR(20) Not Null,
	Age NUMERIC(2) Not Null,
	Address VARCHAR(50) Unique,
	Salary NUMERIC(10) Not Null,
	Primary Key(Id)
	);
Insert into Customer values(1,'Ramesh',32,'Ahmedabad',2000),(2,'Khilan',25,'Delhi',1500),(3,'Kaushik',23,'Kota',2000),(4,'Chaitali',25,'Mumbai',6500),
(5,'Hardik',27,'Bhopal',8500),(6,'Komal',22,'MP',4500),(7,'Muffy',24,'Indore',10000);

Select * from Customer WHERE Address like '%o%';

--5
Create table Orders
(
    OID NUMERIC(4),
	DateOfOrder DATE Not Null,
	CustomerId NUMERIC(2) Not Null,
	Amount Numeric(10) Not Null,
	Primary Key(OID),
	Foreign Key(CustomerId) references Customer(Id)
	);

Select DateOfOrder,Count(DateOfOrder) as TotalNumOfCustomer from Orders GROUP BY DateOfOrder 