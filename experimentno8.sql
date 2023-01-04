mysql> create database employee;
Query OK, 1 row affected (0.01 sec)

mysql> use employee;
Database changed
mysql> create table city(city_name varchar(10) , postal_code int(10) primary key, state varchar(10));
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> desc city;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| city_name   | varchar(10) | YES  |     | NULL    |       |
| postal_code | int         | NO   | PRI | NULL    |       |
| state       | varchar(10) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table employee(emp_id int(10) primary key, first_name varchar(10) , last_name varchar(10),email varchar(10) , ph_no int(10), hire_date date, salary int(10), postal_code int(10), foreign key (postal_code) references city(postal_code));
Query OK, 0 rows affected, 4 warnings (0.14 sec)
mysql> desc employee;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| emp_id      | int         | NO   | PRI | NULL    |       |
| first_name  | varchar(10) | YES  |     | NULL    |       |
| last_name   | varchar(10) | YES  |     | NULL    |       |
| email       | varchar(10) | YES  |     | NULL    |       |
| ph_no       | int         | YES  |     | NULL    |       |
| hire_date   | date        | YES  |     | NULL    |       |
| salary      | int         | YES  |     | NULL    |       |
| postal_code | int         | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> create table department(manager_id int(10) primary key, dept_name varchar(20), foreign key(manager_id) references employee(emp_id));
Query OK, 0 rows affected, 1 warning (0.03 sec)
mysql> desc department;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| manager_id | int         | NO   | PRI | NULL    |       |
| dept_name  | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)



mysql> insert into city values('abc',112233,'aaaa');
Query OK, 1 row affected (0.01 sec)

mysql> insert into city values('def',445566,'bbbb');
Query OK, 1 row affected (0.01 sec)

mysql> insert into city values('ghi',778899,'cccc');
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values(1,'adi','k','adi@gmail.com',1234,'2001-1-1',10000,112233);
ERROR 1406 (22001): Data too long for column 'email' at row 1
mysql> alter table employee modify column email varchar(20);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee values(1,'adi','k','adi@gmail.com',1234,'2001-1-1',10000,112233);
Query OK, 1 row affected (0.01 sec)


mysql> insert into employee values(1,'adi','k','adi@gmail.com',1234,'2001-1-1',10000,112233);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values(2,'dev','p','dev@gamil.com',5678,'2002-2-2',20000,445566);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values(3,'venu','c','venu@gmail.com',4332,'2003-3-3',15000,778899);
Query OK, 1 row affected (0.01 sec)

mysql> select *from employee;
+--------+------------+-----------+----------------+-------+------------+--------+-------------+
| emp_id | first_name | last_name | email          | ph_no | hire_date  | salary | postal_code |
+--------+------------+-----------+----------------+-------+------------+--------+-------------+
|      1 | adi        | k         | adi@gmail.com  |  1234 | 2001-01-01 |  10000 |      112233 |
|      2 | dev        | p         | dev@gamil.com  |  5678 | 2002-02-02 |  20000 |      445566 |
|      3 | venu       | c         | venu@gmail.com |  4332 | 2003-03-03 |  15000 |      778899 |
+--------+------------+-----------+----------------+-------+------------+--------+-------------+
3 rows in set (0.00 sec)



mysql> Delimiter //
mysql> create procedure test(IN sal int)
    -> begin
    -> (select count(emp_id)no_employees1 from employee where salary > sal);
    -> (select count(emp_id)no_employees1 from employee where salary < sal);
    -> (select count(emp_id)no_employees1 from employee where salary = sal);
    -> end //
Query OK, 0 rows affected (0.03 sec)

mysql> Delimiter ;
mysql> call test(10000);
+---------------+
| no_employees1 |
+---------------+
|             2 |
+---------------+
1 row in set (0.01 sec)

+---------------+
| no_employees1 |
+---------------+
|             0 |
+---------------+
1 row in set (0.02 sec)

+---------------+
| no_employees1 |
+---------------+
|             1 |
+---------------+
1 row in set (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

