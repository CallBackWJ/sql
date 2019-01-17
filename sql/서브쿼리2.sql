-- 서브쿼리

-- ex5

	select title,avg(b.salary),count(*)
		from employees a, salaries b, titles c
		where a.emp_no=b.emp_no
			and a.emp_no=c.emp_no
			and b.to_date='9999-01-01'
			and c.to_date='9999-01-01'
		group by c.title
        having count(*) >100;

-- ex6
	
    select d.dept_name,avg(e.salary)
		from employees a, dept_emp b, titles c, departments d, salaries e
		where a.emp_no=b.emp_no
			and a.emp_no=c.emp_no
            and b.dept_no=d.dept_no
            and a.emp_no=e.emp_no
			and b.to_date='9999-01-01'
			and c.to_date='9999-01-01'
            and c.title='Engineer'
		group by d.dept_name;
        
        
-- ex7


    select c.title,sum(e.salary)
		from employees a,  titles c, salaries e
		where a.emp_no=c.emp_no
            and a.emp_no=e.emp_no
			and c.to_date='9999-01-01'
			and e.to_date='9999-01-01'
            and c.title <> 'Engineer'
		group by c.title
        having sum(e.salary) > 2000000000;
             
        
		