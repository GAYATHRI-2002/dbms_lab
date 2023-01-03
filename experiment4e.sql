create and execute sql commands to build indices on member_id and book_id on table book_issue .

mysql> desc book_issue;
+-------------------------+-------------+------+-----+---------+-------+
| Field                   | Type        | Null | Key | Default | Extra |
+-------------------------+-------------+------+-----+---------+-------+
| issue_id                | int         | NO   | PRI | NULL    |       |
| date_of_issue           | date        | YES  |     | NULL    |       |
| book_id                 | int         | YES  | MUL | NULL    |       |
| member_id               | int         | YES  | MUL | NULL    |       |
| expected_date_of_return | date        | YES  |     | NULL    |       |
| status                  | varchar(10) | YES  |     | NULL    |       |
+-------------------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

mysql> show index from book_issue;
+------------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name  | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| book_issue |          0 | PRIMARY   |            1 | issue_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| book_issue |          1 | book_id   |            1 | book_id     | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| book_issue |          1 | member_id |            1 | member_id   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+------------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
3 rows in set (0.01 sec)

mysql> create index abc on book_issue(member_id, book_id);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index from book_issue;
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| book_issue |          0 | PRIMARY  |            1 | issue_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| book_issue |          1 | book_id  |            1 | book_id     | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| book_issue |          1 | abc      |            1 | member_id   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| book_issue |          1 | abc      |            2 | book_id     | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.00 sec)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create and execute sql commands to insert data into each of the tables designed.

mysql> desc book;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| book_id        | int         | NO   | PRI | NULL    |       |
| title          | varchar(20) | YES  |     | NULL    |       |
| lang_id        | int         | YES  |     | NULL    |       |
| mrp            | int         | YES  |     | NULL    |       |
| publisher_id   | int         | YES  |     | NULL    |       |
| published_date | date        | YES  |     | NULL    |       |
| volume         | int         | YES  |     | NULL    |       |
| status         | varchar(20) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> select *from book;
Empty set (0.01 sec)

mysql> insert into book values( 101,'hidden world',1,100,01,'1-2-13',2,'yes');
Query OK, 1 row affected (0.01 sec)

mysql> insert into book values(102,'good day',3,200,02,'2-3-14',4,'yes');
Query OK, 1 row affected (0.01 sec)

mysql> select *from book;
+---------+--------------+---------+------+--------------+----------------+--------+--------+
| book_id | title        | lang_id | mrp  | publisher_id | published_date | volume | status |
+---------+--------------+---------+------+--------------+----------------+--------+--------+
|     101 | hidden world |       1 |  100 |            1 | 0001-02-13     |      2 | yes    |
|     102 | good day     |       3 |  200 |            2 | 0002-03-14     |      4 | yes    |
+---------+--------------+---------+------+--------------+----------------+--------+--------+
2 rows in set (0.00 sec)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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
5 rows in set (0.01 sec)

mysql> select *from author;
Empty set (0.01 sec)

mysql> insert into author values(501,'delna','delna@gmail.com',9988776655,'yes');
Query OK, 1 row affected (0.01 sec)

mysql> insert into author values(502,'veena','veena@gmail.com',1122334455,'yes');
Query OK, 1 row affected (0.01 sec)

mysql> select *from author;
+-----------+-------+-----------------+------------+--------+
| author_id | name  | email           | ph_no      | status |
+-----------+-------+-----------------+------------+--------+
|       501 | delna | delna@gmail.com | 9988776655 | yes    |
|       502 | veena | veena@gmail.com | 1122334455 | yes    |
+-----------+-------+-----------------+------------+--------+
2 rows in set (0.00 sec)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
mysql> desc language;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| lang_id | int         | NO   | PRI | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into language values(1,'english');
Query OK, 1 row affected (0.01 sec)

mysql> insert into language values(2,'sanskrit');
Query OK, 1 row affected (0.01 sec)

mysql> select *from language;
+---------+----------+
| lang_id | name     |
+---------+----------+
|       1 | english  |
|       2 | sanskrit |
+---------+----------+
2 rows in set (0.00 sec)






