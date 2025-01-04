-- xoa db
drop DATABASE if exists testingsystem;
-- tao database
CREATE DATABASE TestingSystem;
-- su dung database
USE TestingSystem;
CREATE TABLE Department(
DepartmentID int UNSIGNED PRIMARY KEY,
DepartmentName VARCHAR(20)
);

-- INSERT INTO Department
INSERT INTO Department(DepartmentID,DepartmentName)
VALUE				(1, "Sale");

INSERT INTO Department(DepartmentID,DepartmentName)
VALUE				(-1, "Sales");
select * from testingsystem;