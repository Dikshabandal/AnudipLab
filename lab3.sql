/* 
Task: Let's consider a scenario where you want to retrieve information about students

from a database table named student and display the results in ascending order based on their last names.

Student table contain column (stud_id,FirstName,LastName,Age,Phoneno,Address) add 5 records in tables.

Hint: Use orderBy clause in a ascending Order

*/


mysql> create database student_info;
Query OK, 1 row affected (0.38 sec)

mysql> use student_info;
Database changed
mysql> create table student(stud_id int primary key, FirstName varchar(50),  LastName varchar(50), Age int, Phoneno varchar(20), Address varchar(200));
Query OK, 0 rows affected (0.81 sec)

mysql> insert into student values(1,'Diksha', 'Bandal', 21, '8574967458', 'Panvel'),(2,'saniya', 'Mhatre', 21, '9685745698', 'Pen'),(3,'Saloni', 'Dharne', 20, '7744885599', 'Khopoli'),(4,'Riddhi', 'Rasal', 19, '8899775546','Mumbai'),(5, 'Siddhi', 'Patil', 22, '8855226693', 'Pune');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from student order by LastName ASC;
+---------+-----------+----------+------+------------+---------+
| stud_id | FirstName | LastName | Age  | Phoneno    | Address |
+---------+-----------+----------+------+------------+---------+
|       1 | Diksha    | Bandal   |   21 | 8574967458 | Panvel  |
|       3 | Saloni    | Dharne   |   20 | 7744885599 | Khopoli |
|       2 | saniya    | Mhatre   |   21 | 9685745698 | Pen     |
|       5 | Siddhi    | Patil    |   22 | 8855226693 | Pune    |
|       4 | Riddhi    | Rasal    |   19 | 8899775546 | Mumbai  |
+---------+-----------+----------+------+------------+---------+
5 rows in set (0.01 sec)

mysql>