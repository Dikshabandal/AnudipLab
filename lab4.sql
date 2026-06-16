/* 

Create database Studentmanagementsystem contain  "Student" table with the following a columns:StudentId,FirstName,lastName and "Course" table with the following a columns: CourseId,CourseName  and Enrollment table with the following a columns:EnrollmentID,StudentID(Foreign key),CourseID(Foreign Key).

You want to use inner join to generate a list of all possible student-course combinations.

*/



mysql> create database StudentManagementSystem;
Query OK, 1 row affected (0.05 sec)

mysql> use StudentManagementSystem;
Database changed
mysql> create table Student(StudentId int primary key, FirstName varchar(70) not null, lastName varchar(70) not null);
Query OK, 0 rows affected (0.77 sec)

mysql> create table Course(CourseId int primary key, CourseName varchar(100) not null);
Query OK, 0 rows affected (0.54 sec)

mysql> create table Enrollment(EnrollmentID int primary key, StudentID int, CourseID int, FOREIGN KEY (StudentID) REFERENCES Student(StudentId), FOREIGN KEY (CourseID) REFERENCES Course(CourseId));
Query OK, 0 rows affected (0.73 sec)

mysql> desc Student;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| StudentId | int         | NO   | PRI | NULL    |       |
| FirstName | varchar(70) | NO   |     | NULL    |       |
| lastName  | varchar(70) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.48 sec)

mysql> desc Course;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| CourseId   | int          | NO   | PRI | NULL    |       |
| CourseName | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
2 rows in set (0.33 sec)

mysql> desc Enrollment;
+--------------+------+------+-----+---------+-------+
| Field        | Type | Null | Key | Default | Extra |
+--------------+------+------+-----+---------+-------+
| EnrollmentID | int  | NO   | PRI | NULL    |       |
| StudentID    | int  | YES  | MUL | NULL    |       |
| CourseID     | int  | YES  | MUL | NULL    |       |
+--------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into Student(StudentId, FirstName, LastName)values(1, 'Saniya', 'Mhatre'),(2, 'Diksha', 'Bandal'),(3, 'Harsh', 'Jadhav');
Query OK, 3 rows affected (0.43 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into Course(CourseId, CourseName)values(101, 'DBMS'),(102, 'Web Development'),(103, 'Data Structures');
Query OK, 3 rows affected (0.36 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+-----------+-----------+----------+
| StudentId | FirstName | lastName |
+-----------+-----------+----------+
|         1 | Saniya    | Mhatre   |
|         2 | Diksha    | Bandal   |
|         3 | Harsh     | Jadhav   |
+-----------+-----------+----------+
3 rows in set (0.00 sec)

mysql> select * from Course;
+----------+-----------------+
| CourseId | CourseName      |
+----------+-----------------+
|      101 | DBMS            |
|      102 | Web Development |
|      103 | Data Structures |
+----------+-----------------+
3 rows in set (0.00 sec)

mysql> insert into Enrollment(EnrollmentID, StudentID, CourseID)values(1, 1, 101),(2, 1, 102),(3, 2, 103),(4, 3, 101);
Query OK, 4 rows affected (0.57 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from Enrollment;
+--------------+-----------+----------+
| EnrollmentID | StudentID | CourseID |
+--------------+-----------+----------+
|            1 |         1 |      101 |
|            2 |         1 |      102 |
|            3 |         2 |      103 |
|            4 |         3 |      101 |
+--------------+-----------+----------+
4 rows in set (0.00 sec)

mysql> select Student.StudentId, Student.FirstName, Student.LastName, Course.CourseId, Course.CourseName from Enrollment INNER JOIN Student ON Enrollment.StudentID = Student.StudentId INNER JOIN Course ON Enrollment.CourseID = Course.CourseID;
+-----------+-----------+----------+----------+-----------------+
| StudentId | FirstName | LastName | CourseId | CourseName      |
+-----------+-----------+----------+----------+-----------------+
|         1 | Saniya    | Mhatre   |      101 | DBMS            |
|         1 | Saniya    | Mhatre   |      102 | Web Development |
|         2 | Diksha    | Bandal   |      103 | Data Structures |
|         3 | Harsh     | Jadhav   |      101 | DBMS            |
+-----------+-----------+----------+----------+-----------------+
4 rows in set (0.00 sec)

mysql>