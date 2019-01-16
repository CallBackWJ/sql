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



