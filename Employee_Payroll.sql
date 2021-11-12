//UC1..Ability to create a payroll service database

  MySQL  localhost:3306 ssl  SQL > show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| addressbookservice   |
| information_schema   |
| mysql                |
| payroll_services     |
| performance_schema   |
| sakila               |
| sys                  |
| world                |
+----------------------+
9 rows in set (0.0028 sec)
 MySQL  localhost:3306 ssl  SQL > CREATE DATABASE payrollservice;
Query OK, 1 row affected (0.2728 sec)
====================================================================================================================================

//UC2..Ability to create a employee payroll table
Query OK, 1 row affected (0.2728 sec)
 MySQL  localhost:3306 ssl  SQL > USE payrollservice;
Default schema set to `payrollservice`.

 MySQL  localhost:3306 ssl  payrollservice  SQL > CREATE TABLE employee_payroll (
                                               -> id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                               -> name VARCHAR(30) NOT NULL,
                                               -> salary DOUBLE NOT NULL,
                                               -> start DATE NOT NULL,
                                               -> PRIMARY KEY (id) );
Query OK, 0 rows affected (2.5890 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >
=========================================================================================================================================
  
//UC3..INSERT DATA INTO employee_payroll
  MySQL  localhost:3306 ssl  payrollservice  SQL >
 MySQL  localhost:3306 ssl  payrollservice  SQL > INSERT INTO employee_payroll (name,salary,start)
                                               -> values  ('Prashant', 60000.0, '2021-01-10'),
                                               -> ('Ajit', 40000.0, '2021-04-10'),
                                               -> ('Geeta', 55000.0, '2020-02-20'),
                                               -> ('Akash', 70000.0, '2020-10-10');
Query OK, 4 rows affected (0.5130 sec)

Records: 4  Duplicates: 0  Warnings: 0
 ==========================================================================================================================================
 
 
//UC4..retrieve  the  payroll data 

 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | Prashant |  60000 | 2021-01-10 |
|  2 | Ajit     |  40000 | 2021-04-10 |
|  3 | Geeta    |  55000 | 2020-02-20 |
|  4 | Akash    |  70000 | 2020-10-10 |
+----+----------+--------+------------+
4 rows in set (0.0021 sec)
 =========================================================================================================================================
 //UC5.. Ability to retrieve salary data for a particular employee
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll where name = 'prashant';
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | Prashant |  60000 | 2021-01-10 |
+----+----------+--------+------------+
1 row in set (0.0022 sec)

1 row in set (0.0022 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll where salary=70000;
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  4 | Akash |  70000 | 2020-10-10 |
+----+-------+--------+------------+
1 row in set (0.0025 sec)

 MySQL  localhost:3306 ssl  payrollservice  SQL > SELECT * FROM employee_payroll WHERE START  BETWEEN CAST('2021-04-10' AS DATE) AND DATE (NOW());
+----+------+--------+------------+
| id | name | salary | start      |
+----+------+--------+------------+
|  2 | Ajit |  40000 | 2021-04-10 |
+----+------+--------+------------+
1 row in set (0.0025 sec)
=============================================================================================================================================
 

//UC6..Ability to add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender

 MySQL  localhost:3306 ssl  payrollservice  SQL > alter table employee_payroll add gender char(1);
Query OK, 0 rows affected (2.2924 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(30)  | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.0797 sec)

 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll ;
+----+----------+--------+------------+--------+
| id | name     | salary | start      | gender |
+----+----------+--------+------------+--------+
|  1 | Prashant |  60000 | 2021-01-10 | NULL   |
|  2 | Ajit     |  40000 | 2021-04-10 | NULL   |
|  3 | Geeta    |  55000 | 2020-02-20 | NULL   |
|  4 | Akash    |  70000 | 2020-10-10 | NULL   |
+----+----------+--------+------------+--------+
4 rows in set (0.0023 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'M' WHERE id =1;
Query OK, 1 row affected (0.1364 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'M' WHERE id =2;
Query OK, 1 row affected (0.3798 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'F' WHERE id =3;
Query OK, 1 row affected (0.2184 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > UPDATE employee_payroll set gender = 'M' WHERE id =4;
Query OK, 1 row affected (0.0846 sec)

Rows matched: 1  Changed: 1  Warnings: 0

 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+
| id | name     | salary | start      | gender |
+----+----------+--------+------------+--------+
|  1 | Prashant |  60000 | 2021-01-10 | M      |
|  2 | Ajit     |  40000 | 2021-04-10 | M      |
|  3 | Geeta    |  55000 | 2020-02-20 | F      |
|  4 | Akash    |  70000 | 2020-10-10 | M      |
+----+----------+--------+------------+--------+
4 rows in set (0.0022 sec)
 ===============================================================================================================================================

//UC7..Ability to find sum, average, min, max and number of male and female employees
  MySQL  localhost:3306 ssl  payrollservice  SQL >
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,sum(salary) from employee_payroll;
+--------+-------------+
| gender | sum(salary) |
+--------+-------------+
| M      |      225000 |
+--------+-------------+
1 row in set (0.0021 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,min(salary) from employee_payroll;
+--------+-------------+
| gender | min(salary) |
+--------+-------------+
| M      |       40000 |
+--------+-------------+
1 row in set (0.0023 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,max(salary) from employee_payroll;
+--------+-------------+
| gender | max(salary) |
+--------+-------------+
| M      |       70000 |
+--------+-------------+
1 row in set (0.0017 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,Avg(salary) from employee_payroll;
+--------+-------------+
| gender | Avg(salary) |
+--------+-------------+
| M      |       56250 |
+--------+-------------+
1 row in set (0.0021 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >
 MySQL  localhost:3306 ssl  payrollservice  SQL > select gender,sum(salary) from employee_payroll Where gender = 'M' group by gender;
+--------+-------------+
| gender | sum(salary) |
+--------+-------------+
| M      |      170000 |
+--------+-------------+
1 row in set (0.0022 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >

============================================================================================================================================
//UC8 Extend employee_payroll data to store employee information like employee phone, address and department. 

1 row in set (0.0022 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > alter table employee_payroll add phone varchar(15) ,add address varchar(20) default 'address1',add department varchar(20) not null;
Query OK, 0 rows affected (2.5463 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > desc employee_payroll;
+------------+--------------+------+-----+----------+----------------+
| Field      | Type         | Null | Key | Default  | Extra          |
+------------+--------------+------+-----+----------+----------------+
| id         | int unsigned | NO   | PRI | NULL     | auto_increment |
| name       | varchar(30)  | NO   |     | NULL     |                |
| salary     | double       | NO   |     | NULL     |                |
| start      | date         | NO   |     | NULL     |                |
| gender     | char(1)      | YES  |     | NULL     |                |
| phone      | varchar(15)  | YES  |     | NULL     |                |
| address    | varchar(20)  | YES  |     | address1 |                |
| department | varchar(20)  | NO   |     | NULL     |                |
+------------+--------------+------+-----+----------+----------------+
8 rows in set (0.0986 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+-------+----------+------------+
| id | name     | salary | start      | gender | phone | address  | department |
+----+----------+--------+------------+--------+-------+----------+------------+
|  1 | Prashant |  60000 | 2021-01-10 | M      | NULL  | address1 |            |
|  2 | Ajit     |  40000 | 2021-04-10 | M      | NULL  | address1 |            |
|  3 | Geeta    |  55000 | 2020-02-20 | F      | NULL  | address1 |            |
|  4 | Akash    |  70000 | 2020-10-10 | M      | NULL  | address1 |            |
+----+----------+--------+------------+--------+-------+----------+------------+
4 rows in set (0.0025 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >    UPDATE employee_payroll
                                               ->    SET  department = 'Finance' WHERE name IN ('akash' , 'ajit');
Query OK, 2 rows affected (0.1639 sec)

Rows matched: 2  Changed: 2  Warnings: 0
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+-------+----------+------------+
| id | name     | salary | start      | gender | phone | address  | department |
+----+----------+--------+------------+--------+-------+----------+------------+
|  1 | Prashant |  60000 | 2021-01-10 | M      | NULL  | address1 |            |
|  2 | Ajit     |  40000 | 2021-04-10 | M      | NULL  | address1 | Finance    |
|  3 | Geeta    |  55000 | 2020-02-20 | F      | NULL  | address1 |            |
|  4 | Akash    |  70000 | 2020-10-10 | M      | NULL  | address1 | Finance    |
+----+----------+--------+------------+--------+-------+----------+------------+
4 rows in set (0.0140 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >

============================================================================================================================================
//UC9 Ability to extendemployee_payroll tableto have Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay

 MySQL  localhost:3306 ssl  payrollservice  SQL >  alter table employee_payroll
                                               ->  add basic_pay int,
                                               ->  add deductions int,
                                               ->  add taxable_pay int  ,
                                               ->  add tax int,
                                               ->  add net_pay int;
Query OK, 0 rows affected (2.4271 sec)

Records: 0  Duplicates: 0  Warnings: 0

================================================================================================================================================
//UC10  Ability to make Terissa as part of Sales and Marketing Department

 MySQL  localhost:3306 ssl  payrollservice  SQL > insert into employee_payroll
											   -> (name,department,gender,basic_pay,deductions,taxable_pay,tax,net_pay,start,salary) values
                                               -> ('Terissa',' Finance','F',4000000,2000000,1000000,300000,2000000,'2021-08-06',19000);
Query OK, 1 row affected (0.1181 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL >
 
 MySQL  localhost:3306 ssl  payrollservice  SQL > insert into employee_payroll 
											   -> (name,department,gender,basic_pay ,deductions,taxable_pay,tax,net_pay,start,salary) values
                                               -> ('Terissa','Sales','F',4000000,0,0,0,0,'2021-06-03',89999);
Query OK, 1 row affected (0.2245 sec) 


13 rows in set (0.1586 sec)
 MySQL  localhost:3306 ssl  payrollservice  SQL > select * from employee_payroll;
+----+----------+--------+------------+--------+-------+----------+------------+-----------+------------+-------------+--------+---------+
| id | name     | salary | start      | gender | phone | address  | department | basic_pay | deductions | taxable_pay | tax    | net_pay |
+----+----------+--------+------------+--------+-------+----------+------------+-----------+------------+-------------+--------+---------+
|  1 | Prashant |  60000 | 2021-01-10 | M      | NULL  | address1 |            |      NULL |       NULL |        NULL |   NULL |    NULL |
|  2 | Ajit     |  40000 | 2021-04-10 | M      | NULL  | address1 | Finance    |      NULL |       NULL |        NULL |   NULL |    NULL |
|  3 | Geeta    |  55000 | 2020-02-20 | F      | NULL  | address1 |            |      NULL |       NULL |        NULL |   NULL |    NULL |
|  4 | Akash    |  70000 | 2020-10-10 | M      | NULL  | address1 | Finance    |      NULL |       NULL |        NULL |   NULL |    NULL |
|  5 | Terissa  |  19000 | 2021-08-06 | F      | NULL  | address1 |  Finance   |   4000000 |    2000000 |     1000000 | 300000 | 2000000 |
|  6 | Terissa  |  89999 | 2021-06-03 | F      | NULL  | address1 | Sales      |   4000000 |          0 |           0 |      0 |       0 |
+----+----------+--------+------------+--------+-------+----------+------------+-----------+------------+-------------+--------+---------+
6 rows in set (0.0023 sec)
(i-search)`':
