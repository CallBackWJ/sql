-- 문제1. 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*) from employees a join salaries b on(a.emp_no=b.emp_no and b.to_date='9999-01-01')
where b.salary > (
select avg(salary) from salaries
where to_date='9999-01-01'
);

-- 문제2. 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
    
select a.emp_no as 사번, concat(a.first_name,' ',a.last_name) as 이름, b.dept_name as 부서, c.salary as 연봉
from employees a, departments b,salaries c,(
	select b.dept_no as dept_no ,max(salary) as max_salary
	from employees a join dept_emp b join salaries c
	on(a.emp_no=b.emp_no and  a.emp_no=c.emp_no)
	where b.to_date='9999-01-01' and c.to_date='9999-01-01'
	group by b.dept_no) d
where a.emp_no=c.emp_no and b.dept_no=d.dept_no and c.salary=d.max_salary
and c.to_date='9999-01-01'
order by c.salary desc ;



-- 문제3. 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
	
    select b.dept_no as dept_no ,avg(salary) as avg_salary
	from employees a join dept_emp b join salaries c
	on(a.emp_no=b.emp_no and  a.emp_no=c.emp_no)
	where b.to_date='9999-01-01' and c.to_date='9999-01-01'
	group by b.dept_no;


select a.emp_no as  사번, concat(a.first_name,' ',a.last_name) as 이름, b.salary as 연봉 
from employees a join salaries b join dept_emp c join
( select b.dept_no as dept_no ,avg(salary) as avg_salary
	from employees a join dept_emp b join salaries c
	on(a.emp_no=b.emp_no and  a.emp_no=c.emp_no)
	where b.to_date='9999-01-01' and c.to_date='9999-01-01'
	group by b.dept_no) d
 on(a.emp_no=b.emp_no and a.emp_no=c.emp_no and c.dept_no=d.dept_no)
where 
b.to_date='9999-01-01' and c.to_date='9999-01-01'
and b.salary>d.avg_salary;


-- 문제4. 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select a.emp_no,b.dept_no
from employees a join dept_manager b on(a.emp_no=b.emp_no )
where b.to_date='9999-01-01';

select a.emp_no as 사번, concat(a.first_name,' ',a.last_name) as 이름, concat(d.first_name,' ',d.last_name) as 매니저이름 ,c.dept_name as 부서
from employees a,dept_emp b,departments c,employees d,
(select a.emp_no as manager_no,b.dept_no as dept_no
from employees a join dept_manager b on(a.emp_no=b.emp_no )
where b.to_date='9999-01-01') e
where a.emp_no=b.emp_no
	and b.dept_no=c.dept_no
    and c.dept_no=e.dept_no
    and d.emp_no=e.manager_no
    and b.to_date='9999-01-01'
order by 이름;

    

-- 문제5. 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.


select a.emp_no as 사번, concat(a.first_name,' ',a.last_name) as 이름, b.title as 직책, c.salary as 연봉
from employees a, titles b,salaries c,dept_emp d
where a.emp_no=b.emp_no
	and a.emp_no=c.emp_no
    and a.emp_no=d.emp_no
    and b.to_date='9999-01-01'
    and c.to_date='9999-01-01'
    and d.to_date='9999-01-01'
	and d.dept_no=
    (select b.dept_no as dept_no 
	from employees a join dept_emp b join salaries c
	on(a.emp_no=b.emp_no and  a.emp_no=c.emp_no)
	where b.to_date='9999-01-01' and c.to_date='9999-01-01'
	group by b.dept_no
    order by avg(salary) desc limit 1)
order by c.salary desc;
    



-- 문제6. 평균 연봉이 가장 높은 부서는? 

select d.dept_name,d.dept_no
	from employees a join dept_emp b join salaries c join departments d
	on(a.emp_no=b.emp_no and  a.emp_no=c.emp_no and b.dept_no=d.dept_no)
	where b.to_date='9999-01-01' and c.to_date='9999-01-01'
	group by b.dept_no
    order by avg(salary) desc limit 1;


-- 문제7. 평균 연봉이 가장 높은 직책?
select b.title
	from employees a join titles b join salaries c
	on(a.emp_no=b.emp_no and  a.emp_no=c.emp_no )
	where b.to_date='9999-01-01' and c.to_date='9999-01-01'
	group by b.title
    order by avg(salary) desc limit 1;




-- 문제8.현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은? 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
  

select d.dept_name as 부서, concat(a.first_name,' ',a.last_name) as 이름, b.salary as 연봉, e.name as 매니저이름,e.salary as 매니저연봉
from employees a join salaries b join dept_emp c join departments d join
(select a.emp_no as emp_no,b.dept_no as dept_no,c.salary as salary, concat(a.first_name,' ',a.last_name) as name
from employees a join dept_manager b join salaries c on(a.emp_no=b.emp_no and a.emp_no=c.emp_no)
where b.to_date='9999-01-01' and c.to_date='9999-01-01'
) e
 on(a.emp_no=b.emp_no and a.emp_no=c.emp_no and c.dept_no=d.dept_no and c.dept_no=e.dept_no)
where 
b.to_date='9999-01-01' and c.to_date='9999-01-01'
and b.salary>e.salary
order by e.salary desc;

