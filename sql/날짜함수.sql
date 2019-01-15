
select curdate(), current_date;
select curtime(), current_time;
select now(),sysdate();

select emp_no,now() from employees; -- 처음 시작한 값과 전부 똑같다.
select emp_no,sysdate() from employees; -- 호출될때 마다 값이 바뀐다


-- 포맷팅
select first_name, date_format(hire_date,'%Y년-%m월-%d일  %h:%i:%s') from employees;

-- 각 직원들에 대해 직원의 이름과 근무 개월수 출력
SELECT 
    first_name,
    cast(
    PERIOD_DIFF(DATE_FORMAT(CURRENT_DATE(), '%Y%m'),
            DATE_FORMAT(hire_date, '%Y%m')) as char) as 개월
FROM
    employees;
    
    -- 입사 후, 6개월 뒤에 정직원으로 발령이 된다.
    -- 발령날은 언제??
    -- month,week, year,day
select first_name,hire_date, date_add(hire_date , interval 6 month) from employees;

select date_add(cast('19940805' as date), interval 100 day)