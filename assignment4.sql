mysql> create database joins;
Query OK, 1 row affected (0.16 sec)

mysql> use joins;
Database changed
mysql> create table department(department_id int not null primary key, department_name varchar(50) not null);
Query OK, 0 rows affected (0.43 sec)

mysql> desc department;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| department_id   | int         | NO   | PRI | NULL    |       |
| department_name | varchar(50) | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
2 rows in set (0.19 sec)

mysql> insert into department values(1,'HR'),(2,'IT'),(3,'Finance'),(4,'Marketing');
Query OK, 4 rows affected (0.37 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | HR              |
|             2 | IT              |
|             3 | Finance         |
|             4 | Marketing       |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> create table employee(employeeId int not null primary key, employee_name varchar(50) not null, department_id int, foreign key(department_id) references department(department_id));
Query OK, 0 rows affected (0.58 sec)

mysql> insert into employee values(1,'Harsh',1),(2,'Diksha',2),(3,'Saniya',1),(4,'Saloni',null),(5,'Sushant',4);
Query OK, 5 rows affected (0.16 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+------------+---------------+---------------+
| employeeId | employee_name | department_id |
+------------+---------------+---------------+
|          1 | Harsh        |             1 |
|          2 | Diksha        |             2 |
|          3 | Saniya       |             1 |
|          4 | Saloni        |          NULL |
|          5 | Sushant        |             4 |
+------------+---------------+---------------+
5 rows in set (0.31 sec)

mysql> select * from department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | HR              |
|             2 | IT              |
|             3 | Finance         |
|             4 | Marketing       |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> select employee_name, department_name from employee inner join department on employee.department_id=department.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harsh        | HR              |
| Saniya       | HR              |
| Diksha        | IT              |
| Sushant        | Marketing       |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> select employee_name, department_name from employee left join department on employee.department_id=department.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harsh        | HR              |
| Diksha        | IT              |
| Saniya      | HR              |
| Saloni        | NULL            |
| Sushant     | Marketing       |
+---------------+-----------------+
5 rows in set (0.01 sec)

mysql> select * from department;
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | HR              |
|             2 | IT              |
|             3 | Finance         |
|             4 | Marketing       |
+---------------+-----------------+
4 rows in set (0.00 sec)

mysql> select * from employee;
+------------+---------------+---------------+
| employeeId | employee_name | department_id |
+------------+---------------+---------------+
|          1 | Harsh        |             1 |
|          2 | Diksha        |             2 |
|          3 | Saniya       |             1 |
|          4 | Saloni         |          NULL |
|          5 | Sushant        |             4 |
+------------+---------------+---------------+
5 rows in set (0.00 sec)

mysql> select employee_name, department_name from employee right join department on employee.department_id=department.department_id;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harsh        | HR              |
| Saniya        | HR              |
| Diksha       | IT              |
| NULL          | Finance         |
| Sushant       | Marketing       |
+---------------+-----------------+
5 rows in set (0.00 sec)

mysql> select employee_name, department_name from employee cross join department;
+---------------+-----------------+
| employee_name | department_name |
+---------------+-----------------+
| Harsh        | Marketing       |
| Harsh        | Finance         |
| Harsh        | IT              |
| Harsh        | HR              |
| Diksha        | Marketing       |
| Diksha        | Finance         |
| Diksha        | IT              |
| Diksha        | HR              |
| Saniya       | Marketing       |
| Saniya       | Finance         |
| Saniya       | IT              |
| Saniya       | HR              |
| Saloni        | Marketing       |
| Saloni        | Finance         |
| Saloni        | IT              |
| Saloni       | HR              |
| Sushant        | Marketing       |
| Sushant        | Finance         |
| Sushant         | IT              |
| Sushant        | HR              |
+---------------+-----------------+
20 rows in set (0.00 sec)

mysql>