-- Active: 1780514413646@@localhost@5432@postgres@public
-- Active: 1780514413646@@localhost@5432@postgres

-- approch <<<<<
-- quetionn - ***********

SELECT employee_id,first_name,last_name, count(email) AS EMAIL_COUNT FROM employee
GROUP BY employee_id
having count(*)=1

--q1-Find department-wise employee count

--<<<<<<<<<approach 1
selec department_id,count(employee_id) from employee_table
group by department_id

--<<<<<<<<<approach 2

select d.department_name, count(e.employee_id) from department_table d
LEFT join employee_table e
on d.department_id=e.department_id
group by d.department_name -- if department with no employee id, it will show the null

----**************************************************************************
--Q2- Find departments having more than 5 employees
select department_id,count(employee_id) from employee_table
group by department_id
having count(employee_id)>5; -- 

--COUNT(employee_id) ignores NULLs
--COUNT(*) does not
 
 --<<<<<<<<<<< next approach using join()

select employee_id, count(e.employee_id) as employee_count from department_table d 
join employee_table e on
d.department_id=e.department_id
group by d.department_id
having count(e.employee_id)>5;

---***************************************************************************

--Q3- Find employees earning more than the average salary
select employee_id, employee_name, salary from employee_table 
where salary>(select avg(salary) avg_salary from employee_table); 
-- AVG(salary) ignores NULLs (fine), 

----- <<<<<<<<<<<<< approach 2 windof funtion
select employee_id,employee_name,salary from 
( select employee_id, employee_name, 
   avg(salary) over() as avg_salary from employee_table)t 
where salary>avg_salary;

-- Q4- 

select * from employee;

CREATE TABLE customer_event (
    customerid INT,
    event_type VARCHAR(20),
    event_timestamp TIMESTAMP
);


INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (101, 'login', '2026-08-09 09:00:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (101, 'order_purchased', '2026-08-09 09:05:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (101, 'logout', '2026-08-09 09:10:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (102, 'login', '2026-08-09 11:00:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (102, 'logout', '2026-08-09 10:00:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (103, 'login', '2026-08-09 10:07:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (103, 'logout', '2026-08-09 10:15:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (104, 'login', '2026-08-09 11:10:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (104, 'logout', '2026-08-09 11:18:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (105, 'login', '2026-08-09 11:30:00');

INSERT INTO customer_event (customerid, event_type, event_timestamp)
VALUES (105, 'order_purchased', '2026-08-09 11:35:00');


select * from customer_event;

-- customers who made order after purchased
select DISTINCT l.customerid,p.event_timestamp from customer_event l  
join customer_event p 
on l.customerid=p.customerid
WHERE l.event_type='login' and p.event_type='order_purchased'
and p.event_timestamp>l.event_timestamp;

-- another approach 

WITH ordered_events AS (
    SELECT
        customerid,
        event_type,
        event_timestamp,
        LAG(event_type) OVER (
            PARTITION BY customerid
            ORDER BY event_timestamp
        ) AS previous_event
    FROM customer_event
)
SELECT customerid,event_timestamp
FROM ordered_events
WHERE event_type = 'order_purchased'
  AND previous_event = 'login';