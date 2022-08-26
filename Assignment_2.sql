Create database Assignmnet2
create table tblEmp
(
    empNum NUMERIC(8),
	Ename VARCHAR(20),
	job VARCHAR(20),
	MGR_ID NUMERIC(8),
	HireDate DATE,
	SAL NUMERIC(8),
	COMM NUMERIC(4),
	DeptNum NUMERIC(4)
	);

Insert into tblEmp values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,20,Null),(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30),(7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30),
(7566,'JONES','MANAGER',7839,'02-APR-81',2975,20,NULL),(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30),(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,Null,30),(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,Null,10),
(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,Null,20),(7839,'KING','PRESIDENT',Null,'17-NOV-81',5000,Null,10),(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30),(7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,Null,20),
(7900,'JAMES','CLERK',7698,'03-DEC-81',950,30,Null),(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,20,Null),(7934,'Miller','CLERK',7782,'23-JAN-82',1300,Null,10);

Create table tblDept
(
    deptNum Numeric(2),
	dName VARCHAR(20),
	Loc VARCHAR(20)
	);

--1
Insert into tblDept values(10,'ACCOUNTING','New York'),(20,'RESEARCH','Dallas'),(30,'SALES','Chicago'),(40,'OPERATIONS','Boston');

--2
Select * from tblEmp where Ename like 'A%'

Select empNum,Ename,Job from tblEmp WHERE MGR_ID IS Null

--3
Select Ename,empNum,Sal from tblEmp WHERE Sal BETWEEN 1200 and 1400

--4
Select empNum,Ename,Sal as 'Monthly Salary', (Sal+0.10*Sal) as 'Incr Sal' from tblEmp 

--5
Select COUNT(*) as "NumOfClerks" from tblEmp WHERE Job='CLERK'

--6
Select Job, AVG(Sal) as Avg_Sal, COUNT(*) as "NumOfEmp" from tblEmp Group BY Job

--7
Select Job, MAX(Sal) as "MaxSal", Min(Sal) as "MinSal" from tblEmp Group By Job 

--8
Select * from tblDept where deptNum not in (Select deptNum from tblEmp)

--9
Select eName as "EmpName", SAL as "Salary" from tblEmp WHERE Sal>1200 and Job='Analyst' and DeptNum=20 order by Ename

--10
Select deptNum, count(empNum) as "NumOfEmp", sum(Sal) as "TotalSalary" from tblEmp Group By deptNum

--11
Select Ename,Sal as 'Salary' from tblEmp WHERE Ename = 'MILLER' or Ename = 'SMITH'

--12
Select Ename as 'Employee Name' from tblEmp WHERE Ename like '[AM]%'

--13
Select Sal*12 as 'Yearly_Salary', Ename from tblEmp WHERE Ename = 'SMITH'

--14
Select Ename, Sal from tblEmp WHERE Sal not BETWEEN 1500 and 2850

--15
Select COUNT(empNum) as 'Num Of Employees', MGR_ID from tblEmp Group By MGR_ID HAVING(COUNT(empNum)>2)