--1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하십시오. 
-- Zlotkey는 제외하십시오.

--Zlotkey의 부서 구하기
select department_id  from employees where LAST_NAME='Zlotkey';
 
select concat(e.first_name,e.last_name), e.hire_date
from employees e, departments d
where e.department_id=d.department_id
and d.department_id =  (select department_id  from employees where LAST_NAME='Zlotkey')
    and not e.LAST_NAME= 'Zlotkey';  


--2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 
--   결과를 급여에 대해 오름차순으로 정렬하십시오.

-- 평균 급여 
select round(avg(salary)) from employees;


select employee_id, concat(first_name,last_name) name
from employees 
where salary > (select round(avg(salary)) from employees)
order by salary desc;




--3. 이름에 u가 포함된 사원과 같은 부서에서 일하는 모든 사원의 사원 번호와 이름을 표시하는
-- 질의를 작성하십시오.

--이름에 u 포함된 사원의 부서
select department_id from employees where concat(first_name,last_name) like '%u%';


select employee_id, concat(first_name,last_name) name
from employees 
where department_id in (select department_id from employees where concat(first_name,last_name) like '%u%');




--4. 부서 위치 ID가 1700인 모든 사원의 이름, 부서 번호 및 업무 ID를 표시하십시오.


select concat(e.first_name,e.last_name) name, e.department_id, e.job_id
from employees e, departments d
where e.department_id=d.department_id 
and d.location_id =1700;



?

--5. King에게 보고하는 모든 사원의 이름과 급여를 표시하십시오.
--king의 사번

SELECT   CONCAT(FIRST_NAME,LAST_NAME) 이름, SALARY
FROM     EMPLOYEES
WHERE    MANAGER_ID=100;




SELECT CONCAT(E1.first_name,E2.last_name) NAME, E1.SALARY
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
AND E2.LAST_NAME IN (SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE 'King');




--6. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하십시오.

--Executive 부서의 부서번호
select department_id from departments where department_name like 'Executive';



select e.department_id, concat(e.first_name,e.last_name) name, e.job_id
from employees e,departments d
where e.department_id=d.department_id
   and d.department_id = (select department_id from departments where department_name like 'Executive');




?

--7. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는 
--모든 사원의 사원 번호, 이름 및 급여를 표시하는 질의를 작성하십시오.

--평균급여
select round(avg(salary)) from employees;

--이름에 u포함된 사원의 부서번호
select department_id from employees where concat(first_name,last_name) like '%u%';

select employee_id, concat(first_name,last_name) as name, salary
from employees
where salary > (select round(avg(salary)) from employees) and
      department_id in (select department_id from employees where concat(first_name,last_name) like '%u%');



