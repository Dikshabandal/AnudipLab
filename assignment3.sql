mysql> create table orders(order_id int primary key, department varchar(50) not null,amount double not null);
Query OK, 0 rows affected (0.15 sec)

mysql> insert into orders values(1,'sales',1000),(2,'sales',1500),(3,'HR',800);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+----------+------------+--------+
| order_id | department | amount |
+----------+------------+--------+
|        1 | sales      |   1000 |
|        2 | sales      |   1500 |
|        3 | HR         |    800 |
+----------+------------+--------+
3 rows in set (0.00 sec)

mysql> select department, sum(amount) as total_amount from orders group by department;
+------------+--------------+
| department | total_amount |
+------------+--------------+
| sales      |         2500 |
| HR         |          800 |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> select department, avg(amount) as total_avg from orders group by department;
+------------+-----------+
| department | total_avg |
+------------+-----------+
| sales      |      1250 |
| HR         |       800 |
+------------+-----------+
2 rows in set (0.00 sec)

mysql> select department, sum(amount) as total_amount from orders group by department having sum(amount) > 1000;
+------------+--------------+
| department | total_amount |
+------------+--------------+
| sales      |         2500 |
+------------+--------------+
1 row in set (0.00 sec)

mysql> select * from orders;
+----------+------------+--------+
| order_id | department | amount |
+----------+------------+--------+
|        1 | sales      |   1000 |
|        2 | sales      |   1500 |
|        3 | HR         |    800 |
+----------+------------+--------+
3 rows in set (0.00 sec)

mysql>

mysql> create table employee_details(employeeID int not null,name varchar(70) not null,department varchar(90) not null,salary double not null);
Query OK, 0 rows affected (0.62 sec)

mysql> insert into employee_details values(1,'Diksha Bandal','IT',9000),(2,'Saniya Mhatre','IT',7000),(3,'Riddhi Rasal','HR',8000),(4,'Saloni Dharne','HR',6500),(5,'Siddhi Patil','Finance',5000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

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
5 rows in set (0.00 sec)

mysql> select department, count(*) as total_employee from employee_details group by department;
+------------+----------------+
| department | total_employee |
+------------+----------------+
| IT         |              2 |
| HR         |              2 |
| Finance    |              1 |
+------------+----------------+
3 rows in set (0.00 sec)

mysql> select department, sum(salary) as total_salary from employee_details group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| IT         |        16000 |
| HR         |        14500 |
| Finance    |         5000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, avg(salary) as total_avg from employee_details group by department;
+------------+-----------+
| department | total_avg |
+------------+-----------+
| IT         |      8000 |
| HR         |      7250 |
| Finance    |      5000 |
+------------+-----------+
3 rows in set (0.00 sec)

mysql> select department, sum(salary) as total_salary from employee_details group by department;
+------------+--------------+
| department | total_salary |
+------------+--------------+
| IT         |        16000 |
| HR         |        14500 |
| Finance    |         5000 |
+------------+--------------+
3 rows in set (0.00 sec)

mysql> select department, salary, count(*) from employee_details group by department,salary;
+------------+--------+----------+
| department | salary | count(*) |
+------------+--------+----------+
| IT         |   9000 |        1 |
| IT         |   7000 |        1 |
| HR         |   8000 |        1 |
| HR         |   6500 |        1 |
| Finance    |   5000 |        1 |
+------------+--------+----------+
5 rows in set (0.00 sec)

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
5 rows in set (0.00 sec)

mysql> select department, count(*) as total from employee_details group by department having count(*) > 1;
+------------+-------+
| department | total |
+------------+-------+
| IT         |     2 |
| HR         |     2 |
+------------+-------+
2 rows in set (0.00 sec)

mysql> select department, count(*) as total from employee_details group by department having count(*) <= 1;
+------------+-------+
| department | total |
+------------+-------+
| Finance    |     1 |
+------------+-------+
1 row in set (0.00 sec)

mysql> select * from employee_details where salary > 6600;
+------------+---------------+------------+--------+
| employeeID | name          | department | salary |
+------------+---------------+------------+--------+
|          1 | Diksha Bandal | IT         |   9000 |
|          2 | Saniya Mhatre | IT         |   7000 |
|          3 | Riddhi Rasal  | HR         |   8000 |
+------------+---------------+------------+--------+
3 rows in set (0.00 sec)

mysql> select * from employee_details order by salary desc;
+------------+---------------+------------+--------+
| employeeID | name          | department | salary |
+------------+---------------+------------+--------+
|          1 | Diksha Bandal | IT         |   9000 |
|          3 | Riddhi Rasal  | HR         |   8000 |
|          2 | Saniya Mhatre | IT         |   7000 |
|          4 | Saloni Dharne | HR         |   6500 |
|          5 | Siddhi Patil  | Finance    |   5000 |
+------------+---------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select * from employee_details order by salary;
+------------+---------------+------------+--------+
| employeeID | name          | department | salary |
+------------+---------------+------------+--------+
|          5 | Siddhi Patil  | Finance    |   5000 |
|          4 | Saloni Dharne | HR         |   6500 |
|          2 | Saniya Mhatre | IT         |   7000 |
|          3 | Riddhi Rasal  | HR         |   8000 |
|          1 | Diksha Bandal | IT         |   9000 |
+------------+---------------+------------+--------+
5 rows in set (0.00 sec)

mysql>