-- subquery



SELECT 
    a.emp_no, a.first_name
FROM
    employees a,
    dept_emp b
WHERE
    a.emp_no = b.emp_no
        AND b.dept_no = (SELECT 
            b.dept_no
        FROM
            employees a,
            dept_emp b
        WHERE
            a.emp_no = b.emp_no
                AND CONCAT(a.first_name, ' ', a.last_name) = 'Fai Bale'
                AND b.to_date = '9999-01-01');
                

-- ex2)
SELECT 
    a.first_name, b.salary
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01'
        AND salary < (SELECT 
            AVG(salary)
        FROM
            salaries
        WHERE
            to_date > NOW())
ORDER BY salary DESC;


-- 직책별 평균 급여
select title, avg(salary) from salaries a,titles b
where a.emp_no=b.emp_no
and a.to_date='9999-01-01'
and b.to_date='9999-01-01'
group by title order by avg(salary);


    SELECT title, AVG(salary) AS avg_salary
    FROM salaries a, titles b
    WHERE a.emp_no = b.emp_no
            AND a.to_date = '9999-01-01'
            AND b.to_date = '9999-01-01'
    GROUP BY title
    ORDER BY AVG(salary) limit 1;
    
    
    

-- 다중행  서브쿼리
-- =any (in 과 완전 동일) >any, <>any, <= any ....
-- all 
-- all, >all, <all, <>all,....   단일행에서 사용

select emp_no,salary
from salaries 
where salary in(  100, 200,30);

-- ex)

select concat(a.first_name,' ',a.last_name),b.salary
from employees a, salaries b
where 
a.emp_no=b.emp_no
and (a.emp_no,b.salary)=any (
select a.emp_no,a.salary
from salaries a 
where a.to_date='9999-01-01'
and a.salary > 50000
);

SELECT 
    CONCAT(a.first_name, ' ', a.last_name), b.salary
FROM
    employees a,
    (SELECT 
        emp_no, salary
    FROM
        salaries a
    WHERE
        a.to_date = '9999-01-01'
            AND a.salary > 50000) b
            WHERE  a.emp_no=b.emp_no;





