-- 문제 1번:사번이 10944인 사원의 이름은(전체 이름)
select concat(first_name,' ',last_name) from employees where emp_no=10944;

-- 문제 2번: 전체직원의 다음 정보를 조회하세요. 가장 선임부터 출력이 되도록 하세요. 출력은 이름, 성별,  입사일 순서이고 “이름”, “성별”, “입사일로 컬럼 이름을 대체해 보세요.
select first_name as '이름',gender as '성별', hire_date as '입사일' from employees order by hire_date ;

-- 문제 3번:여직원과 남직원은 각 각 몇 명이나 있나요?
select gender , count(*) from employees group by gender;

-- 문제 4번:현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
select count(distinct emp_no) from salaries;

-- 문제 5번: 부서는 총 몇 개가 있나요?
select count(*) from departments;

-- 문제 6번: 현재 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
select count(distinct emp_no) from dept_managerdept_manager;

-- 문제 7번: 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
select dept_name from departments order by char_length(dept_name) desc;

-- 문제 8번 :현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까?
select count(distinct emp_no) from salaries where salary>120000 ;

-- 문제 9번: 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요.

select distinct title from titles  order by char_length(title) desc;

-- 문제 10번:현재 Enginner 직책의 사원은 총 몇 명입니까?
select count(distinct emp_no) from titles where title like '%Engineer%';

-- 문제 11번: 사번이 13250(Zeydy)인 지원이 직책 변경 상황을 시간순으로 출력해보세요.
select from_date, to_date from titles where emp_no=13250 order by from_date ;


