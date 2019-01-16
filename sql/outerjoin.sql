desc department;
desc employee;

select * from employee a, department b;

-- inner join 
select * from employee a  join department b on a.department_no=b.no;


-- outer join (left)
select * from employee a left outer join department b on a.department_no=b.no;
-- outer join (right)
select * from employee a left outer join department b on a.department_no=b.no;
-- outer join (full) mysql 은 지원하지 않는다alter

select a.name, ifnull(b.name,'부서없음') from employee a left outer join department b on a.department_no=b.no;



