DROP DATABASE IF EXISTS  Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
/* ------------------------ thiep lap bang --------------------- */
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) NOT NULL 
);
SELECT * FROM Department;

-- tao bag position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE  Testing_System_Assignment_1.Position(
 PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL
);


SELECT * FROM Position;
DROP TABLE IF EXISTS Testing_System_Assignment_1.Account ;
CREATE TABLE Account(
AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
Email VARCHAR(30)  NOT NULL UNIQUE KEY,
Username VARCHAR(30)  NOT NULL UNIQUE KEY,
FullName VARCHAR(30)  NOT NULL UNIQUE KEY,
DepartmentID TINYINT UNSIGNED NOT NULL,
PositionID TINYINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
FOREIGN KEY(PositionID) REFERENCES Testing_System_Assignment_1.Position(PositionID) ON DELETE CASCADE 
);
SELECT * FROM Account;

-- TAO BANG Group
DROP TABLE IF EXISTS Testing_System_Assignment_1.Group ;
CREATE TABLE `Group`(
GroupID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
GroupName VARCHAR(30)  NOT NULL ,
CreatorID TINYINT not null,
CreateDate DATETIME 
);
SELECT * FROM `Group`;

-- tao bang GroupAccount
DROP TABLE IF EXISTS Testing_System_Assignment_1.GroupAccount ;
CREATE TABLE `GroupAccount`(
GroupID TINYINT UNSIGNED ,
AccountID TINYINT UNSIGNED ,
JoinDate DATETIME ,
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID) ON DELETE CASCADE,
FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE 
);
SELECT * FROM `GroupAccount`;

-- tao bang TypeQuestion
DROP TABLE IF EXISTS Testing_System_Assignment_1.TypeQuestion ;
CREATE TABLE `TypeQuestion`(
TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
TypeName ENUM ('Essay', 'Multiple-Choice')
);
SELECT * FROM `TypeQuestion`;

-- tao bang CategoryQuestion
DROP TABLE IF EXISTS Testing_System_Assignment_1.CategoryQuestion ;
CREATE TABLE `CategoryQuestion`(
CategoryID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
 CategoryName VARCHAR(30) NOT NULL
);
SELECT * FROM `CategoryQuestion`;


-- tao bang Question
DROP TABLE IF EXISTS Testing_System_Assignment_1.GroupAccounQuestion ;
CREATE TABLE `Question`(
QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
Content NVARCHAR(50) not null,
CategoryID TINYINT UNSIGNED not  null,
TypeID TINYINT UNSIGNED not  null,
CreatorID TINYINT not null,
CreateDate DATETIME,
FOREIGN KEY(CategoryID) REFERENCES `CategoryQuestion`(CategoryID) ON DELETE CASCADE,
FOREIGN KEY(TypeID) REFERENCES `TypeQuestion`(TypeID) ON DELETE CASCADE 
);
SELECT * FROM `Question`;



-- tao bang Answer
DROP TABLE IF EXISTS Testing_System_Assignment_1.Answer ;
CREATE TABLE `Answer`(
AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
Content NVARCHAR(50) not null,
QuestionID TINYINT UNSIGNED ,
isCorrect ENUM('correct', 'incorrect'),
FOREIGN KEY(QuestionID) REFERENCES `Question`(QuestionID) ON DELETE CASCADE

);
SELECT * FROM `Answer`;



-- tao bang Exam
DROP TABLE IF EXISTS Testing_System_Assignment_1.Exam;
CREATE TABLE `Exam`(
ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
Code  NVARCHAR(50) not null unique key,
Title  NVARCHAR(50) not null ,
CategoryID TINYINT UNSIGNED not null,
 Duration TINYINT not NULL,
 CreatorID datetime not nULL, 
 CreateDate datetime not nULL
);
SELECT * FROM `Exam`;
ALTER TABLE Exam
MODIFY COLUMN CreatorID TINYINT NOT NULL;

-- tao bang ExamQuestion
DROP TABLE IF EXISTS Testing_System_Assignment_1.ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID TINYINT UNSIGNED NOT NULL,
QuestionID TINYINT UNSIGNED,
FOREIGN KEY(QuestionID) REFERENCES `Question`(QuestionID) ON DELETE CASCADE,
FOREIGN KEY(ExamID) REFERENCES `Exam`(ExamID) ON DELETE CASCADE
);
SELECT * FROM ExamQuestion;


/* ------------------------ nhap du lieu --------------------- */
-- Table 1:Department
INSERT INTO Department(DepartmentName)
VALUES ('Marketing'),
		('Sale'),
        ('Employee');
        
SELECT * FROM Department;
-- Table 2: Position
INSERT INTO `Position`(PositionName)
VALUES ('Dev'),
		('Test'),
        ('Scrum Master'),
        ('PM');
 SELECT * FROM Position;  
 -- Table 3: Account
INSERT INTO Account(Email, Username, Fullname, DepartmentID, PositionID)
VALUES 				('nguyen@gmail.com', 'van', 'nguyen', 2, 2),
					('nguyen1@gmail.com', 'van1', 'nguyen1', 1, 3),
					('nguysen1@gmail.com', 'vasn1', 'nguyden1', 3, 4);
 SELECT * FROM Account;   
 -- Table 4: Group
INSERT INTO `Group`( GroupName, CreatorID,  CreateDate)
VALUES 				( 'study', 3, '2024-1-07'),
					( 'study1', 2, '2023-2-07'),
                    ( 'study2', 1, '2023-6-7');
 SELECT * FROM `Group`;   
 -- Table 5: GroupAccount
 INSERT INTO GroupAccount( GroupID, AccountID,  JoinDate)
VALUES 				( 3, 2, '2023-2-07'),
                   ( 1, 3, '2023-4-07'),
                   ( 2, 1, '2024-4-07');
 SELECT * FROM  GroupAccount;   
 -- Table 6: TypeQuestion
INSERT INTO TypeQuestion( TypeName)
VALUES 				( 'Essay'),
                   ( 'Multiple-Choice');
                
 SELECT * FROM  TypeQuestion;   
 
 
 -- Table 7: CategoryQuestion
INSERT INTO CategoryQuestion(CategoryName)
VALUES 				( 'NET'),
                   ( 'Postman'),
                   ('java');
                
 SELECT * FROM  CategoryQuestion;   
 
 
 -- Table 8: Question 
 INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate )
VALUES 				('buider', 1, 2, 3,'2023-12-4'),
				('buiders', 3, 2, 4,'2023-11-4');
	 SELECT * FROM  Question ;   			
 -- Table 9: Answer
INSERT INTO Answer (Content, QuestionID,isCorrect )
VALUES 				('exact', 2, 'correct'),
				('exactly', 1, 'incorrect');
SELECT * FROM  Answer; 

-- Table 10: Exam
INSERT INTO Exam ( Code,Title,CategoryID,Duration,CreatorID,CreateDate )
VALUES 				('M243','Duh', 2, '60',3,'2023-4-5'),
			('M24','Sux', 1,'60',1,'2023-4-25');
SELECT * FROM  Exam; 
DESCRIBE Exam;
-- Table 11: ExamQuestion

 INSERT INTO ExamQuestion( ExamID, QuestionID)
VALUES 				(2, 1),
			(1,2);
SELECT * FROM  Exam;

/* ----------------------------------- 03-1-2025 8:40 PM ---------------------------------------------*/




        
        
