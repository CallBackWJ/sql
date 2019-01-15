SELECT * FROM employees;

-- 기본 select 
select emp_no,first_name,hire_date from employees;

-- alias
select emp_no as '번호',first_name  as '이름',hire_date  as '입사일' from employees;

-- concat() 컬럼의 값을 합치는것 
select emp_no as '번호',concat(first_name,' ',last_name)as '이름',hire_date  as '입사일' from employees;

-- distinct 중복제거
select distinct title as '직책' from titles;

-- order by 예제
SELECT concat( first_name, ' ', last_name) AS 이름,
           gender AS 성별, 
           hire_date AS 입사일
      FROM employees
  ORDER BY hire_date desc;

SELECT emp_no as '사번', salary as '급여'
      FROM salaries
     WHERE from_date like '2001-%' 
  ORDER BY salary DESC;
  
  SELECT  first_name AS 이름,
         gender AS 성별, 
         hire_date AS 입사일
    FROM employees
   WHERE hire_date < '1991-01-01';
   
   SELECT concat( first_name, ' ', last_name ) AS 이름,
         hire_date AS 입사일
    FROM employees
   WHERE gender='f'
     AND hire_date < '1989-01-01' ;
     
     select * from dept_emp where dept_no='d005' or dept_no='d009';
     
     SELECT emp_no, dept_no FROM dept_emp WHERE dept_no in( 'd005', 'd009' );
     
SELECT 
    first_name AS 이름,
    gender AS '성별',
    hire_date AS 입사일
FROM
    employees
WHERE
    hire_date LIKE '1989%';

	

