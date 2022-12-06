//create DDL STATESMENTS and create tables and constraints.\\
mysql> create table author (author_id int primary key, name varchar(20), email varchar(20), ph_no int, status varchar (20));
Query OK, 0 rows affected (0.03 sec)

mysql> create table book_author(book_id int primary key,author_id int);
Query OK, 0 rows affected (0.02 sec)

mysql> create table publisher(publisher_id int primary key , name varchar(20),address varchar(20));
Query OK, 0 rows affected (0.02 sec)
mysql> create table member (member_id int(10) primary key, name varchar (20),branch_code int(10), roll_no int(10), email varchar(20),date_of_join date,status varchar(20),ph_no int(20));
Query OK, 0 rows affected, 4 warnings (0.03 sec)
mysql> create table language(lang_id int(10) primary key,name varchar(20));
Query OK, 0 rows affected, 1 warning (0.03 sec)
mysql> create table book_issue(issue_id int(20) primary key, date_of_issue date, book_id int(10), member_id int(10), FOREIGN KEY (book_id) REFERENCES book(book_id),FOREIGN KEY (member_id) REFERENCES member(member_id),expected_date_of_return date, status varchar(10));
Query OK, 0 rows affected, 3 warnings (0.05 sec)

mysql> create table book_return (issue_id int(10) primary key ,actual_date_of_return date,late_fee int(10),FOREIGN KEY(issue_id) REFERENCES book_issue(issue_id));
Query OK, 0 rows affected, 2 warnings (0.03 sec)

mysql> create table late__fee_rule(from_days int(10), to_days int(10),amount int(5), primary key(from_days,to_days,amount));
Query OK, 0 rows affected, 3 warnings (0.02 sec)

mysql> show tables;
+--------------------+
| Tables_in_library1 |
+--------------------+
| author             |
| book               |
| book_author        |
| book_issue         |
| book_return        |
| language           |
| late__fee_rule     |
| member             |
| publisher          |
+--------------------+
9 rows in set (0.00 sec)
