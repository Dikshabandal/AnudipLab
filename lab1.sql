/*     
Create Database StudentManagementSystem

1.Create Table student

with attribute:  ●StudentID (Primary Key)
●Name
●Age
●Address


2.Create a table with named Feedback with attributes: 
● FeedbackID (Primary Key) 
● StudentID (Foreign key) 
● Date 
● InstructorName 
● Feedback

Add 5 Records in table

 */


mysql> create database StudentManagementSystem;
Query OK, 1 row affected (0.38 sec)

mysql> use StudentManagementSystem;
Database changed
mysql> create table student(StudentID varchar(10) not null primary key,Name varchar(30) not null,Age int not null,Address varchar(50) not null);
Query OK, 0 rows affected (1.06 sec)

mysql> desc student;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| StudentID | varchar(10) | NO   | PRI | NULL    |       |
| Name      | varchar(30) | NO   |     | NULL    |       |
| Age       | int         | NO   |     | NULL    |       |
| Address   | varchar(50) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.30 sec)

mysql> insert into student values('1','Arnav Patil',21,'Kharghar'),('2','Siddhi Rasal',22,'Mumbai'),('3','Saloni Dharne',20,'Panvel'),('4','Saniya Mhatre',20,'Pen'),('5','Isha Bandal',21,'Khopoli');
Query OK, 5 rows affected (0.43 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from student;
+-----------+---------------+-----+----------+
| StudentID | Name          | Age | Address  |
+-----------+---------------+-----+----------+
| 1         | Arnav Patil   |  21 | Kharghar |
| 2         | Siddhi Rasal  |  22 | Mumbai   |
| 3         | Saloni Dharne |  20 | Panvel   |
| 4         | Saniya Mhatre |  20 | Pen      |
| 5         | Isha Bandal   |  21 | Khopoli  |
+-----------+---------------+-----+----------+
5 rows in set (0.00 sec)

mysql> create table Feedback(FeedbackID varchar(10) not null primary key,StudentID varchar(10) not null,Date datetime not null,InstructorName varchar(30) not null,Feedback varchar(50) not null,foreign key(StudentID) references student(StudentID));
Query OK, 0 rows affected (0.47 sec)

mysql> desc Feedback;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| FeedbackID     | varchar(10) | NO   | PRI | NULL    |       |
| StudentID      | varchar(10) | NO   | MUL | NULL    |       |
| Date           | datetime    | NO   |     | NULL    |       |
| InstructorName | varchar(30) | NO   |     | NULL    |       |
| Feedback       | varchar(50) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
5 rows in set (0.13 sec)

mysql> insert into Feedback values('101','1','2026-06-08','Priti Mam','Good presentation.'),('102','2','2026-06-08','Ankita Mam','Good learning experience.'),('103','3','2026-06-08','Minakshi Mam','Well explained.'),('104','4','2026-06-08','Aniket Sir','Very informative.'),('105','5','2026-06-08','Shubham Sir','Great session.');
Query OK, 5 rows affected (0.46 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Feedback;
+------------+-----------+---------------------+----------------+---------------------------+
| FeedbackID | StudentID | Date                | InstructorName | Feedback                  |
+------------+-----------+---------------------+----------------+---------------------------+
| 101        | 1         | 2026-06-08 00:00:00 | Priti Mam      | Good presentation.        |
| 102        | 2         | 2026-06-08 00:00:00 | Ankita Mam     | Good learning experience. |
| 103        | 3         | 2026-06-08 00:00:00 | Minakshi Mam   | Well explained.           |
| 104        | 4         | 2026-06-08 00:00:00 | Aniket Sir     | Very informative.         |
| 105        | 5         | 2026-06-08 00:00:00 | Shubham Sir    | Great session.            |
+------------+-----------+---------------------+----------------+---------------------------+
5 rows in set (0.00 sec)

mysql>