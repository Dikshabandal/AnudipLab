mysql> show databases;
+-------------------------+
| Database                |
+-------------------------+
| bankmanagement          |
| college                 |
| e_commerce              |
| employee                |
| information_schema      |
| joins                   |
| mysql                   |
| performance_schema      |
| sakila                  |
| student_info            |
| studentmanagementsystem |
| sys                     |
| world                   |
+-------------------------+
13 rows in set (0.65 sec)

mysql> use e_commerce;
Database changed
mysql> show tables;
+----------------------+
| Tables_in_e_commerce |
+----------------------+
| bankaccount          |
| customer             |
| employee_details     |
| orders               |
+----------------------+
4 rows in set (0.14 sec)

mysql> select * from employee_details;
+------------+---------------+------------+--------+
| employeeID | name          | department | salary |
+------------+---------------+------------+--------+
|          1 | Diksha Bandal | IT         |   9000 |
|          2 | Saniya Mhatre | IT         |   7000 |
|          3 | Riddhi Rasal  | HR         |   8000 |
|          4 | Saloni Dharne | HR         |   6500 |
|          5 | Siddhi Patil  | Finance    |   5000 |
+------------+---------------+------------+--------+
5 rows in set (0.13 sec)

mysql> delimiter //
mysql> create procedure getEmployeeDetails()
    -> begin
    ->     select * from employee_details;
    -> end//
Query OK, 0 rows affected (1.16 sec)

mysql> delimiter ;
mysql> call getEmployeeDetails();
+------------+---------------+------------+--------+
| employeeID | name          | department | salary |
+------------+---------------+------------+--------+
|          1 | Diksha Bandal | IT         |   9000 |
|          2 | Saniya Mhatre | IT         |   7000 |
|          3 | Riddhi Rasal  | HR         |   8000 |
|          4 | Saloni Dharne | HR         |   6500 |
|          5 | Siddhi Patil  | Finance    |   5000 |
+------------+---------------+------------+--------+
5 rows in set (0.40 sec)

Query OK, 0 rows affected (0.41 sec)

mysql> delimiter //
mysql> create procedure getEmployeeByDepartment()
    -> ^C
mysql> delimiter //
mysql> create procedure getEmployeeByDepartment(in name varchar(50))
    -> begin
    -> select * from employee_details where department = name;
    -> end//
Query OK, 0 rows affected (0.20 sec)

mysql> delimiter ;
mysql> call getEmployeeByDepartment('HR');
+------------+---------------+------------+--------+
| employeeID | name          | department | salary |
+------------+---------------+------------+--------+
|          3 | Riddhi Rasal  | HR         |   8000 |
|          4 | Saloni Dharne | HR         |   6500 |
+------------+---------------+------------+--------+
2 rows in set (0.13 sec)

Query OK, 0 rows affected (0.14 sec)

mysql> delimiter //
mysql> create procedure getEmployeeCount(out total int)
    -> begin
    -> select count(*) into total
    -> from employee_details;
    -> end//
Query OK, 0 rows affected (0.12 sec)

mysql> delimiter ;
mysql> call getEmployeeCount(@total);
Query OK, 1 row affected (0.42 sec)

mysql> select @total;
+--------+
| @total |
+--------+
|      5 |
+--------+
1 row in set (0.00 sec)

mysql> delimiter //
mysql> create procedure addEmployee(in id int,in name varchar(50),in department varchar(50),in salary double)
    -> begin
    -> insert into employee_details values(id,name,department,salary);
    -> end //
Query OK, 0 rows affected (0.52 sec)

mysql> delimiter ;
mysql> call addEmployee(6,'Esha','Marketing',6000);
Query OK, 1 row affected (0.14 sec)

mysql> select * from employee_details;
+------------+---------------+------------+--------+
| employeeID | name          | department | salary |
+------------+---------------+------------+--------+
|          1 | Diksha Bandal | IT         |   9000 |
|          2 | Saniya Mhatre | IT         |   7000 |
|          3 | Riddhi Rasal  | HR         |   8000 |
|          4 | Saloni Dharne | HR         |   6500 |
|          5 | Siddhi Patil  | Finance    |   5000 |
|          6 | Esha          | Marketing  |   6000 |
+------------+---------------+------------+--------+
6 rows in set (0.00 sec)

mysql>
