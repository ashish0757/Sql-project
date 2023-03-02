MariaDB [project]> select * from employee;
+--------+---------+-------------+------------+---------+
| Emp_no | Name    | Designation | Department | joining |
+--------+---------+-------------+------------+---------+
|   3058 | Sam     | Trainee     | Mfg        |    2020 |
|   3441 | Harshal | E-3         | HR         |    2018 |
|   3442 | Akash   | E-3         | Design     |    2020 |
|   3443 | Vikas   | E-2         | Assembly   |    2020 |
|   3444 | Jitesh  | M-1         | Molding    |    1998 |
|   3445 | Pankaj  | E-1         | IT         |    2003 |
|   3446 | Jayesh  | Trainee     | MFG        |    2022 |
|   3447 | NIket   | E-1         | ppc        |    2005 |
|   3448 | Akshay  | E-3s        | PEG        |    2017 |
|   3449 | Vishal  | E-3         | MFG        |    2017 |
|   3450 | Kumar   | Technician  | Mfg        |    2015 |
|   3451 | Ajay    | E-3         | Mfg        |    2017 |
|   3452 | Dinesh  | E-3         | Mfg        |    2017 |
|   3453 | Rushi   | Technician  | Mfg        |    2015 |
|   3454 | Sagar   | E-3         | Mfg        |    2013 |
|   3455 | Paresh  | E-3         | Mfg        |    2015 |
|   3456 | Vijay   | E-3         | Mfg        |    2000 |
|   3457 | Ray     | E-2         | Mfg        |    2010 |
|   3458 | Sam     | Trainee     | Mfg        |    2020 |
|   3459 | Ram     | Trainee     | Mfg        |    2021 |
|   3460 | Mohan   | E-1         | Mfg        |    2000 |
+--------+---------+-------------+------------+---------+
21 rows in set (0.046 sec)

MariaDB [project]> select * from ihp;
+--------+-------------+-----+--------+--------+
| Ord_no | Job_Name    | QTY | Opn_No | Emp_No |
+--------+-------------+-----+--------+--------+
| 100331 | H.R.BLOCK   |   1 |     30 |   3449 |
| 100338 | Inj Rod     |   4 |     10 |   3450 |
| 100339 | H.R.Block   |   1 |     40 |   3452 |
| 100337 | I.C.B       |   1 |     50 |   3453 |
| 100332 | I.C.BLK     |   1 |     10 |   3454 |
| 100336 | Cooling Rod |  10 |     30 |   3455 |
| 100333 | INJ.ROD     |   3 |     40 |   3456 |
| 100340 | Nozzle      |   7 |     30 |   3457 |
| 100334 | NOZZLE      |   5 |     20 |   3459 |
| 100335 | COND.POT    |   3 |     50 |   3460 |
+--------+-------------+-----+--------+--------+


MariaDB [project]> select * from kra;
+--------+------------+------------+-------------+-----------+
| EMP_NO | Attendance | Efficiency | Utilisation | Leave_Bal |
+--------+------------+------------+-------------+-----------+
|   3446 | 60%        | 95%        | 80%         |         2 |
|   3449 | 90%        | 100%       | 90%         |        13 |
|   3450 | 88%        | 70%        | 80%         |        15 |
|   3453 | 70%        | 70%        | 70%         |        10 |
|   3454 | 90%        | 80%        | 80%         |        12 |
|   3455 | 80%        | 90%        | 90%         |         7 |
|   3458 | 60%        | 80%        | 100%        |         3 |
|   3459 | 90%        | 80%        | 90          |         4 |
|   3460 | 80%        | 90%        | 90%         |      NULL |
+--------+------------+------------+-------------+-----------+


MariaDB [project]> select * from info;
+--------+---------+--------------+--------+-------------+
| Emp_no | Name    | Prev_Company | Salary | State       |
+--------+---------+--------------+--------+-------------+
|   3441 | Harshal | Amco         |  40000 | Bengol      |
|   3442 | Akash   | Abc          |  35000 | Kerala      |
|   3443 | Vikas   | Saini        |  45000 | Up          |
|   3444 | Jitesh  | Jsw          |  80000 | Asam        |
|   3445 | Pankaj  | Abc          |  70000 | Bihar       |
|   3446 | Jayesh  | Null         |  15000 | Zarkhand    |
|   3447 | Niket   | Pqr          |  70000 | Punjab      |
|   3448 | Akshay  | Abc          |  50000 | Up          |
|   3449 | Vishal  | Null         |  34000 | Maharashtra |
|   3450 | Kumar   | ZZZ          |  30000 | Maharashtra |
|   3452 | Dinesh  | ABC          |  35000 | Maharashtra |
|   3453 | Rushi   | NULL         |  25000 | kerala      |
|   3454 | Sagar   | PQR          |  35000 | Asam        |
|   3456 | Vijay   | ABC          |  33000 | Bengol      |
|   3457 | Ray     | ABC          |  30000 | Bihar       |
|   3458 | Sam     | NULL         |  20000 | UP          |
|   3459 | kk      | NULL         |  20000 | Maharashtra |
|   3460 | Mohan   | Jsw          |  70000 | Maharashtra |
+--------+---------+--------------+--------+-------------+


# give data of employees having salary<30k:

MariaDB [project]> select emp_no,name,joining from employee where emp_no in (select emp_no from info where salary<30000);
+--------+--------+---------+
| emp_no | name   | joining |
+--------+--------+---------+
|   3446 | Jayesh |    2022 |
|   3453 | Rushi  |    2015 |
|   3458 | Sam    |    2020 |
|   3459 | Ram    |    2021 |
+--------+--------+---------+
4 rows in set (0.038 sec)

# Give Record of Workdone by employee having utilisation between 90 to 100:
MariaDB [project]> select emp_no,ord_no,job_name,qty from ihp where emp_no in (select emp_no from kra where utilisation between 90 and 100);
+--------+--------+-------------+-----+
| emp_no | ord_no | job_name    | qty |
+--------+--------+-------------+-----+
|   3449 | 100331 | H.R.BLOCK   |   1 |
|   3455 | 100336 | Cooling Rod |  10 |
|   3459 | 100334 | NOZZLE      |   5 |
|   3460 | 100335 | COND.POT    |   3 |
+--------+--------+-------------+-----+
4 rows in set, 8 warnings (0.001 sec)

# Give information of an employee from 'Bengol':
MariaDB [project]> select * from employee where emp_no in(select emp_no from info where state = 'bengol');
+--------+---------+-------------+------------+---------+
| Emp_no | Name    | Designation | Department | joining |
+--------+---------+-------------+------------+---------+
|   3441 | Harshal | E-3         | HR         |    2018 |
|   3456 | Vijay   | E-3         | Mfg        |    2000 |
+--------+---------+-------------+------------+---------+

MariaDB [project]> select MAX(salary) from info;
+-------------+
| MAX(salary) |
+-------------+
|       80000 |
+-------------+

select data of employee having max salary:
MariaDB [project]> select * from info having MAX(salary);
+--------+---------+--------------+--------+--------+
| Emp_no | Name    | Prev_Company | Salary | State  |
+--------+---------+--------------+--------+--------+
|   3441 | Harshal | Amco         |  40000 | Bengol |
+--------+---------+--------------+--------+--------+

select data of employee having max salary [without using MAX function]:
MariaDB [project]> select * from info order by salary desc limit 1;
+--------+--------+--------------+--------+-------+
| Emp_no | Name   | Prev_Company | Salary | State |
+--------+--------+--------------+--------+-------+
|   3444 | Jitesh | Jsw          |  80000 | Asam  |
+--------+--------+--------------+--------+-------+

MariaDB [project]> select * from employee where emp_no in (select emp_no from info where salary>30000);
+--------+---------+-------------+------------+---------+
| Emp_no | Name    | Designation | Department | joining |
+--------+---------+-------------+------------+---------+
|   3441 | Harshal | E-3         | HR         |    2018 |
|   3442 | Akash   | E-3         | Design     |    2020 |
|   3443 | Vikas   | E-2         | Assembly   |    2020 |
|   3444 | Jitesh  | M-1         | Molding    |    1998 |
|   3445 | Pankaj  | E-1         | IT         |    2003 |
|   3447 | NIket   | E-1         | ppc        |    2005 |
|   3448 | Akshay  | E-3s        | PEG        |    2017 |
|   3449 | Vishal  | E-3         | MFG        |    2017 |
|   3460 | Mohan   | E-1         | Mfg        |    2000 |
+--------+---------+-------------+------------+---------+
9 rows in set (0.001 sec)

MariaDB [project]>
# Fetch record from table info & kra:

Inner Join:
MariaDB [PROJECT]> SELECT info.emp_no,INFO.NAME,KRA.EFFICIENCY FROM INFO INNER JOIN KRA ON KRA.EMP_NO = INFO.EMP_NO;
+--------+--------+------------+
| emp_no | NAME   | EFFICIENCY |
+--------+--------+------------+
|   3446 | Jayesh | 95%        |
|   3449 | Vishal | 100%       |
|   3450 | Kumar  | 70%        |
|   3453 | Rushi  | 70%        |
|   3454 | Sagar  | 80%        |
|   3458 | Sam    | 80%        |
|   3459 | kk     | 80%        |
|   3460 | Mohan  | 90%        |
+--------+--------+------------+
8 rows in set (0.001 sec)

Left Join:
MariaDB [PROJECT]> SELECT info.emp_no,INFO.NAME,KRA.EFFICIENCY FROM INFO LEFT JOIN KRA ON KRA.EMP_NO = INFO.EMP_NO;
+--------+---------+------------+
| emp_no | NAME    | EFFICIENCY |
+--------+---------+------------+
|   3441 | Harshal | NULL       |
|   3442 | Akash   | NULL       |
|   3443 | Vikas   | NULL       |
|   3444 | Jitesh  | NULL       |
|   3445 | Pankaj  | NULL       |
|   3446 | Jayesh  | 95%        |
|   3447 | Niket   | NULL       |
|   3448 | Akshay  | NULL       |
|   3449 | Vishal  | 100%       |
|   3450 | Kumar   | 70%        |
|   3452 | Dinesh  | NULL       |
|   3453 | Rushi   | 70%        |
|   3454 | Sagar   | 80%        |
|   3456 | Vijay   | NULL       |
|   3457 | Ray     | NULL       |
|   3458 | Sam     | 80%        |
|   3459 | kk      | 80%        |
|   3460 | Mohan   | 90%        |
+--------+---------+------------+
18 rows in set (0.001 sec)

Right Join:
MariaDB [PROJECT]> SELECT info.emp_no,INFO.NAME,KRA.EFFICIENCY FROM INFO RIGHT JOIN KRA ON KRA.EMP_NO = INFO.EMP_NO;
+--------+--------+------------+
| emp_no | NAME   | EFFICIENCY |
+--------+--------+------------+
|   3446 | Jayesh | 95%        |
|   3449 | Vishal | 100%       |
|   3450 | Kumar  | 70%        |
|   3453 | Rushi  | 70%        |
|   3454 | Sagar  | 80%        |
|   NULL | NULL   | 90%        |
|   3458 | Sam    | 80%        |
|   3459 | kk     | 80%        |
|   3460 | Mohan  | 90%        |
+--------+--------+------------+
9 rows in set (0.001 sec)


# List Top '3' Name that have most completed Quantity in desc order:

MariaDB [project]> SELECT EMPLOYEE.NAME, IHP.QTY FROM IHP INNER JOIN EMPLOYEE ON IHP.EMP_NO = EMPLOYEE.EMP_NO 
ORDER BY QTY DESC 
LIMIT 3;
+--------+-----+
| NAME   | QTY |
+--------+-----+
| Paresh |  10 |
| Ray    |   7 |
| Ram    |   5 |
+--------+-----+

Joins in 3 Tables:
Fetch data from IHP, INFO, KRA USING JOINS:
MariaDB [project]> select info.emp_no, info.name,info.salary,kra.efficiency,ihp.job_name,ihp.qty from info left join kra 
ON info.emp_no = kra.emp_no
    -> JOIN ihp on ihp.emp_no = info.emp_no;
+--------+--------+--------+------------+-----------+-----+
| emp_no | name   | salary | efficiency | job_name  | qty |
+--------+--------+--------+------------+-----------+-----+
|   3449 | Vishal |  34000 | 100%       | H.R.BLOCK |   1 |
|   3450 | Kumar  |  30000 | 70%        | Inj Rod   |   4 |
|   3452 | Dinesh |  35000 | NULL       | H.R.Block |   1 |
|   3453 | Rushi  |  25000 | 70%        | I.C.B     |   1 |
|   3454 | Sagar  |  35000 | 80%        | I.C.BLK   |   1 |
|   3456 | Vijay  |  33000 | NULL       | INJ.ROD   |   3 |
|   3457 | Ray    |  30000 | NULL       | Nozzle    |   7 |
|   3459 | kk     |  20000 | 80%        | NOZZLE    |   5 |
|   3460 | Mohan  |  70000 | 90%        | COND.POT  |   3 |
+--------+--------+--------+------------+-----------+-----+

FETCH data from 4 tables(IHP,INFO,KRA,& EMPLOYEE) using JOINS:
MariaDB [project]> select info.emp_no, info.name,info.salary,employee.joining,kra.efficiency,ihp.job_name from info left join kra 
ON info.emp_no = kra.emp_no
    -> JOIN ihp on ihp.emp_no = info.emp_no
    -> JOIN employee on employee.emp_no = info.emp_no;
+--------+--------+--------+---------+------------+-----------+
| emp_no | name   | salary | joining | efficiency | job_name  |
+--------+--------+--------+---------+------------+-----------+
|   3449 | Vishal |  34000 |    2017 | 100%       | H.R.BLOCK |
|   3450 | Kumar  |  30000 |    2015 | 70%        | Inj Rod   |
|   3452 | Dinesh |  35000 |    2017 | NULL       | H.R.Block |
|   3453 | Rushi  |  25000 |    2015 | 70%        | I.C.B     |
|   3454 | Sagar  |  35000 |    2013 | 80%        | I.C.BLK   |
|   3456 | Vijay  |  33000 |    2000 | NULL       | INJ.ROD   |
|   3457 | Ray    |  30000 |    2010 | NULL       | Nozzle    |
|   3459 | kk     |  20000 |    2021 | 80%        | NOZZLE    |
|   3460 | Mohan  |  70000 |    2000 | 90%        | COND.POT  |
+--------+--------+--------+---------+------------+-----------+
9 rows in set (0.001 sec)


SELF JOIN:
MariaDB [PROJECT]> SELECT T1.EMP_NO,T2.NAME FROM EMPLOYEE T1 JOIN EMPLOYEE T2 ON T1.EMP_NO <> T2.EMP_NO AND T1.NAME = T2.NAME;
+--------+------+
| EMP_NO | NAME |
+--------+------+
|   3458 | Sam  |
|   3058 | Sam  |
+--------+------+
2 rows in set (0.002 sec)

MariaDB [PROJECT]> SELECT T1.EMP_NO,T2.NAME,T1.DEPARTMENT FROM EMPLOYEE T1 JOIN EMPLOYEE T2 ON T1.EMP_NO <> T2.EMP_NO AND T1.NAME = T2.NAME;
+--------+------+------------+
| EMP_NO | NAME | DEPARTMENT |
+--------+------+------------+
|   3458 | Sam  | Mfg        |
|   3058 | Sam  | Mfg        |
+--------+------+------------+
2 rows in set (0.001 sec)
MariaDB [PROJECT]> SELECT T1.EMP_NO,T2.NAME,T1.DEPARTMENT FROM EMPLOYEE T1 JOIN EMPLOYEE T2 ON T1.EMP_NO <> T2.EMP_NO AND T1.JOINING = T2.JOINING;
+--------+--------+------------+
| EMP_NO | NAME   | DEPARTMENT |
+--------+--------+------------+
|   3442 | Sam    | Design     |
|   3443 | Sam    | Assembly   |
|   3458 | Sam    | Mfg        |
|   3058 | Akash  | Mfg        |
|   3443 | Akash  | Assembly   |
|   3458 | Akash  | Mfg        |
|   3058 | Vikas  | Mfg        |
|   3442 | Vikas  | Design     |
|   3458 | Vikas  | Mfg        |
|   3449 | Akshay | MFG        |
|   3451 | Akshay | Mfg        |
|   3452 | Akshay | Mfg        |
|   3448 | Vishal | PEG        |
|   3451 | Vishal | Mfg        |
|   3452 | Vishal | Mfg        |
|   3453 | Kumar  | Mfg        |
|   3455 | Kumar  | Mfg        |
|   3448 | Ajay   | PEG        |
|   3449 | Ajay   | MFG        |
|   3452 | Ajay   | Mfg        |
|   3448 | Dinesh | PEG        |
|   3449 | Dinesh | MFG        |
|   3451 | Dinesh | Mfg        |
|   3450 | Rushi  | Mfg        |
|   3455 | Rushi  | Mfg        |
|   3450 | Paresh | Mfg        |
|   3453 | Paresh | Mfg        |
|   3460 | Vijay  | Mfg        |
|   3058 | Sam    | Mfg        |
|   3442 | Sam    | Design     |
|   3443 | Sam    | Assembly   |
|   3456 | Mohan  | Mfg        |
+--------+--------+------------+
32 rows in set (0.001 sec)


View:

MariaDB [project]> CREATE VIEW IHP_VIEW AS SELECT ORD_NO,JOB_NAME,EMP_NO FROM IHP WHERE EMP_NO>3455;
Query OK, 0 rows affected (0.044 sec)

MariaDB [project]> SELECT * FROM IHP_VIEW;
+--------+----------+--------+
| ORD_NO | JOB_NAME | EMP_NO |
+--------+----------+--------+
| 100333 | INJ.ROD  |   3456 |
| 100340 | Nozzle   |   3457 |
| 100334 | NOZZLE   |   3459 |
| 100335 | COND.POT |   3460 |
+--------+----------+--------+
4 rows in set (0.004 sec)


MariaDB [project]> CREATE VIEW IHP_VIEW_2 AS SELECT ORD_NO,JOB_NAME,EMP_NO FROM IHP WHERE EMP_NO<3455;
Query OK, 0 rows affected (0.042 sec)

MariaDB [project]> SELECT * FROM IHP_VIEW_2;
+--------+-----------+--------+
| ORD_NO | JOB_NAME  | EMP_NO |
+--------+-----------+--------+
| 100331 | H.R.BLOCK |   3449 |
| 100338 | Inj Rod   |   3450 |
| 100339 | H.R.Block |   3452 |
| 100337 | I.C.B     |   3453 |
| 100332 | I.C.BLK   |   3454 |
+--------+-----------+--------+
5 rows in set (0.002 sec)

MariaDB [project]>

# mix Table-VIEW............................

MariaDB [project]> create view Mix1 as select info.name,info.emp_no,info.salary,info.state,
    -> kra.attendance,kra.efficiency
    -> from info,kra
    -> where info.emp_no = kra.emp_no;
Query OK, 0 rows affected (0.050 sec)

MariaDB [project]> select * from mix;
MariaDB [project]> select * from mix1;
+--------+--------+--------+-------------+------------+------------+
| name   | emp_no | salary | state       | attendance | efficiency |
+--------+--------+--------+-------------+------------+------------+
| Jayesh |   3446 |  15000 | Zarkhand    | 60%        | 95%        |
| Vishal |   3449 |  34000 | Maharashtra | 90%        | 100%       |
| Kumar  |   3450 |  30000 | Maharashtra | 88%        | 70%        |
| Ram    |   3459 |  20000 | Maharashtra | 90%        | 80%        |
| Mohan  |   3460 |  70000 | Maharashtra | 80%        | 90%        |
+--------+--------+--------+-------------+------------+------------+
5 rows in set (0.003 sec)

# update view............................................................
MariaDB [project]> update mix1 set name = 'kk' where emp_no = 3459;
Query OK, 1 row affected (0.045 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [project]> select * from mix1;
+--------+--------+--------+-------------+------------+------------+
| name   | emp_no | salary | state       | attendance | efficiency |
+--------+--------+--------+-------------+------------+------------+
| Jayesh |   3446 |  15000 | Zarkhand    | 60%        | 95%        |
| Vishal |   3449 |  34000 | Maharashtra | 90%        | 100%       |
| Kumar  |   3450 |  30000 | Maharashtra | 88%        | 70%        |
| kk     |   3459 |  20000 | Maharashtra | 90%        | 80%        |
| Mohan  |   3460 |  70000 | Maharashtra | 80%        | 90%        |
+--------+--------+--------+-------------+------------+------------+
5 rows in set (0.002 sec)

# Drop view..............................
MariaDB [project]> select * from mix;
+--------+--------+-------------+------------+------------+
| name   | salary | state       | attendance | efficiency |
+--------+--------+-------------+------------+------------+
| Jayesh |  15000 | Zarkhand    | 60%        | 95%        |
| Vishal |  34000 | Maharashtra | 90%        | 100%       |
| Kumar  |  30000 | Maharashtra | 88%        | 70%        |
| kk     |  20000 | Maharashtra | 90%        | 80%        |
| Mohan  |  70000 | Maharashtra | 80%        | 90%        |
+--------+--------+-------------+------------+------------+
5 rows in set (0.001 sec)

MariaDB [project]> drop view mix;
Query OK, 0 rows affected (0.003 sec)

MariaDB [project]> select * from mix;
ERROR 1146 (42S02): Table 'project.mix' doesn't exist