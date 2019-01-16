-- equijoin(inner join)


-- 현재근무중인 직원의 이름과 직책을 출력하세요alter
select a.emp_no,a.first_name,b.title from employees a,titles b where a.emp_no=b.emp_no and b.to_date='9999-01-01';

-- 현재근무중인 직책이 senio enginner인  직원의 이름과 직책을 출력하세요alter
select a.emp_no,a.first_name,b.title from employees a,titles b where a.emp_no=b.emp_no and b.to_date='9999-01-01' and b.title='Senior Engineer';

-- 1. natural join 
select a.emp_no, a.first_name,b.title from employees a  natural join titles b where b.to_date='9999-01-01';

-- 2. join ~ using
select a.emp_no, a.first_name,b.title from employees a   join titles b  using(emp_no) where b.to_date='9999-01-01';

-- 3. join ~ on 
select a.emp_no, a.first_name,b.title from employees a   join titles b  on(a.emp_no=b.emp_no) where b.to_date='9999-01-01';

-- equijoin 실습문제
select  a.emp_no ,concat(a.first_name,' ',a.last_name), c.dept_name from employees a, dept_emp b, departments c  where a.emp_no=b.emp_no and b.dept_no=c.dept_no and b.to_date='9999-01-01' order by a.emp_no asc;

