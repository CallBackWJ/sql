-- 문자열 함수 

select ucase('seoul'), upper('seoul');
select lcase('Seoul'), lower('SEOUL');

select substring('Happy Day',3,2) from dual;

select first_name, gender, hire_date from employees 
where substring(hire_date,1,4)='1989';

select LPAD('hi',10,'*') from dual;
select RPAD('hi',10,'*') from dual;

select emp_no,LPAD(cast(salary as char),10,' ') from salaries;

-- 공백 제거
SELECT concat('-----',LTRIM(' hello ')), concat(RTRIM(' hello '),'------'),concat('--------',TRIM('   hello   '),'------'); 
select trim(both 'x' from 'xxxhixxx');
select trim(leading 'x' from 'xxxhixxx');
select trim(trailing 'x' from 'xxxhixxx');
