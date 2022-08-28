create database Assignment3

create table tblEmp
(
    empNum Numeric(10),
	Ename VARCHAR(20),
	Job VARCHAR(20),
	MGR_ID NUMERIC(10),
	HireDate DATE,
	Sal NUMERIC(10),
	COMM NUMERIC(10),	 
	DeptNum NUMERIC(10)
	);
Insert into tblEmp values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,Null,20),(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30),(7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30),
(7566,'JONES','MANAGER',7839,'02-APR-81',2975,Null,20),(7654,'MARTIN','SALESMAN',7698,'28-FEB-81',1250,1400,30),(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,Null,30),
(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,Null,10),(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,Null,20),(7839,'KING','PRESIDENT',Null,'17-NOV-81',5000,Null,10),
(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30),(7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,Null,20),(7900,'JAMES','CLERK',7698,'03-DEC-81',950,Null,30),
(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,Null,20),(7934,'MILLER','CLERK',7782,'23-JAN-82',1300,Null,10);

Create table tblDept
(
    deptNum NUMERIC(10),
	dName VARCHAR(20),
	Loc VARCHAR(20)
	);
Insert into tblDept values(10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');

--1
Select empNum,Ename,Job from tblEmp WHERE Job='MANAGER'

--2
Select Ename,Sal from tblEmp WHERE Sal>1000

--3
Select Ename,Sal from tblEmp WHERE Ename!='JAMES'

--4
Select * from tblEmp WHERE Ename like 'S%'

--5
Select Ename from tblEmp WHERE Ename like '%A%'

--6
Select Ename from tblEmp WHERE Ename like '__L%'

--7
Select empNum,Ename,Sal,(Sal/30) as DailySal from tblEmp WHERE Ename='JONES'

--8
Select Sum(Sal) as TotalSal from tblEmp

--9
Select Avg(Sal)*12 as AvgSalary from tblEmp

--10
Select e.empNum, e.Ename, e.Job, e.Sal, e.DeptNum from tblEmp e except (Select empNum, Ename, Job, Sal, DeptNum from tblEmp WHERE DeptNum = 30 and Job = 'SALESMAN')

--11
Select DISTINCT(e.DeptNum), d.dName from tblEmp e join tblDept d on e.DeptNum=d.deptNum

--12
Select Ename as 'EmpName', Sal as 'MonthlySal', DeptNum from tblEmp WHERE Sal>1500 and DeptNum in (10,30)

--13
Select Ename, Job, Sal from tblEmp WHERE Job in ('MANAGER', 'ANALYST') and Sal not in (1000,3000,5000)

--14
Select Ename, Sal, Comm from tblEmp WHERE Comm>(Sal+(Sal+10/100))

--15
Select * from tblEmp WHERE Ename like '%L%l%' and DeptNum=30 or MGR_ID=7782

--16
Select Ename, year(getDate()) - year(HireDate) as 'YearsOfExp' from tblEmp WHERE year(getdate()) - year(HireDate) in (10,20)

--17
Select d.DeptNum, d.dName, e.Ename from tblEmp e, tblDept d WHERE d.DeptNum = e.DeptNum ORDER BY d.dName, e.Ename desc

--18
Select eName, year(getDate()) - year(hireDate) as 'Exp' from tblEmp WHERE eName = 'MILLER'

