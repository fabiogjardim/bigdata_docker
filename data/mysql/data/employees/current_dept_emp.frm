TYPE=VIEW
query=select `l`.`emp_no` AS `emp_no`,`d`.`dept_no` AS `dept_no`,`l`.`from_date` AS `from_date`,`l`.`to_date` AS `to_date` from (`employees`.`dept_emp` `d` join `employees`.`dept_emp_latest_date` `l` on(((`d`.`emp_no` = `l`.`emp_no`) and (`d`.`from_date` = `l`.`from_date`) and (`l`.`to_date` = `d`.`to_date`))))
md5=dc43d5348ed69f469d450497cf1050fc
updatable=1
algorithm=0
definer_user=bigdata
definer_host=localhost
suid=2
with_check_option=0
timestamp=2020-03-18 22:57:24
create-version=1
source=SELECT l.emp_no, dept_no, l.from_date, l.to_date\n    FROM dept_emp d\n        INNER JOIN dept_emp_latest_date l\n        ON d.emp_no=l.emp_no AND d.from_date=l.from_date AND l.to_date = d.to_date
client_cs_name=latin1
connection_cl_name=latin1_swedish_ci
view_body_utf8=select `l`.`emp_no` AS `emp_no`,`d`.`dept_no` AS `dept_no`,`l`.`from_date` AS `from_date`,`l`.`to_date` AS `to_date` from (`employees`.`dept_emp` `d` join `employees`.`dept_emp_latest_date` `l` on(((`d`.`emp_no` = `l`.`emp_no`) and (`d`.`from_date` = `l`.`from_date`) and (`l`.`to_date` = `d`.`to_date`))))
