create database baithuchanh;


use baithuchanh;

create table Employee(
Employeeid varchar(10) primary key not null,
Fullname varchar(100) not null,
HireDate date not null,
Department ENUM('IT', 'HR', 'Sales', 'Marketing', 'Finance') not null DEFAULT 'IT',
Email VARCHAR(255) not null unique,
Salary DECIMAL(10, 2)
);

create table Project(
ProjectId VARCHAR(10) primary key not null,
ProjectName VARCHAR(100) not null,
StartDate date not null,
EndDate date not null,
Budget DECIMAL(12, 2) not null
);

create table ProjectAssignment(
EmployeeId VARCHAR(10) not null,
ProjectId VARCHAR(10) not null,
Role VARCHAR(50) not null,
HoursWorked int not null,
PRIMARY KEY (EmployeeId, ProjectId),
foreign key (EmployeeId) references Employee(EmployeeId),
foreign key (ProjectId) references Project(ProjectId)
);

insert into Employee (EmployeeId,FullName,HireDate,Department,Email,Salary)
values
('EMP001','Nguyen Van An','2020-03-15','IT','an.nguyen@company.com',25000000),
('EMP002','Tran Thi Binh','2021-06-10','HR','binh.tran@company.com',18000000),
('EMP003','Le Van Cuong','2019-11-25','Sales','cuong.le@company.com',22000000),
('EMP004','Pham Thi Dung','2022-01-30','Marketing','dung.pham@company.com',20000000),
('EMP005','Hoang Van Em','2020-08-12','Finance','em.hoang@company.com',28000000);

INSERT INTO ProjectAssignment (EmployeeId, ProjectId, Role, HoursWorked) VALUES
('EMP001', 'PJ001', 'Developer', 120),
('EMP001', 'PJ002', 'Lead Developer', 200),
('EMP002', 'PJ001', 'HR Coordinator', 80),
('EMP002', 'PJ003', 'HR Manager', 60),
('EMP003', 'PJ002', 'Sales Consultant', 100),
('EMP003', 'PJ004', 'Business Analyst', 150),
('EMP004', 'PJ003', 'Marketing Lead', 180),
('EMP004', 'PJ001', 'UX Designer', 90),
('EMP005', 'PJ004', 'Finance Controller', 160);

INSERT INTO Project (ProjectId, ProjectName, StartDate, EndDate, Budget) VALUES
('PJ001', 'Website Redesign', '2023-01-10', '2023-06-30', 500000000),
('PJ002', 'Mobile App Development', '2023-02-15', '2023-09-30', 750000000),
('PJ003', 'Marketing Campaign Q2', '2023-04-01', '2023-06-30', 300000000),
('PJ004', 'ERP System Upgrade', '2023-03-01', '2023-12-31', 1200000000);

update Project
set ProjectName = 'Corporate Website Redesign 2023'
where ProjectId = 'PJ001';

update ProjectAssignment
set HoursWorked = 110
where EmployeeId = 'EMP004' and ProjectId ='PJ003';

delete from ProjectAssignment
where EmployeeId = 'EMP002' and ProjectId ='PJ003';
-- phần 2 

select * from Employee
where Department = 'IT';

select ProjectId, ProjectName, StartDate, EndDate
from Project
where EndDate < '2023-07-01';

select * 
from ProjectAssignment
where ProjectId = 'PJ002'
order by HoursWorked desc;

select *
from Employee
where FullName like'Tran%';

select * 
from ProjectAssignment
where HoursWorked >=100 and HoursWorked <=200;

select * 
from Employee
order by HireDate asc
limit 3;

select Department, count(*) as soluong
from Employee
group by Department;

select e.EmployeeId, e.FullName, sum(p.HoursWorked) as sogiolam
from ProjectAssignment p
join Employee e on e.EmployeeId = p.EmployeeId
group by e.EmployeeId, e.FullName;
