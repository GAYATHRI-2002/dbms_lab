//create and execute alter table command in tables with data and without data.//
mysql> alter table author modify column ph_no varchar(10);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| author_id | int         | NO   | PRI | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| email     | varchar(20) | YES  |     | NULL    |       |
| ph_no     | int         | YES  |     | NULL    |       |
| status    | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> desc author;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| author_id | int         | NO   | PRI | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| email     | varchar(20) | YES  |     | NULL    |       |
| ph_no     | varchar(10) | YES  |     | NULL    |       |
| status    | varchar(20) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
mysql> desc late__fee_rule;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| from_days | int  | NO   | PRI | NULL    |       |
| to_days   | int  | NO   | PRI | NULL    |       |
| amount    | int  | NO   | PRI | NULL    |       |
+-----------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into late__fee_rule value(0,7,10);
Query OK, 1 row affected (0.01 sec)

mysql> insert into late__fee_rule value(7,30,100);
Query OK, 1 row affected (0.00 sec)

mysql> desc late__fee_rule;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| from_days | int  | NO   | PRI | NULL    |       |
| to_days   | int  | NO   | PRI | NULL    |       |
| amount    | int  | NO   | PRI | NULL    |       |
+-----------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select *from late__fee_rule;
+-----------+---------+--------+
| from_days | to_days | amount |
+-----------+---------+--------+
|         0 |       7 |     10 |
|         7 |      30 |    100 |
+-----------+---------+--------+
2 rows in set (0.00 sec)

mysql> alter table late__fee_rule drop amount;
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select *from late__fee_rule;
+-----------+---------+
| from_days | to_days |
+-----------+---------+
|         0 |       7 |
|         7 |      30 |
+-----------+---------+
2 rows in set (0.00 sec)



