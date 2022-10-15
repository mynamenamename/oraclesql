--=====================================================



--# HR 계정에서



--1. 이름의 성이 'King' 사원의 사번과 부서명을 출력 ( employees, departments )

--표준화
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME
from employees e right outer join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.last_name= 'King';
 
--옛날 방식
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME
from employees e, departments d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
      and e.last_name= 'King';



--2. 이름의 성이 'King' 사원의 사번과 부서명 그리고 업무명을 출력 ( employees, departments, jobs )


--표준화
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_ID
from employees e inner join departments d 
      on e.DEPARTMENT_ID = d.DEPARTMENT_ID
      inner join jobs j
      on e.JOB_ID = j.JOB_ID
where e.last_name= 'King';

--옛날 방식
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_ID
from employees e, departments d , jobs j
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
     and e.JOB_ID= j.JOB_ID
     and e.last_name= 'King';
 

--반장님 풀이

-- 3. 2007년 상반기에 입사한 사원들의 사번과 이름, 입사일 그리고 부서명을 출력
-- (*) Grant는 아직 부서가 배정받지 못한 상태이지만 Grant도 출력되려면
select e.employee_id as 사번 , e.first_name||' '||e.last_name as 이름, e.hire_date as 입사일,
       d.department_name as 부서명
from employees e full outer join departments d
on e.department_id = d.department_id
where to_char(e.HIRE_DATE,'YYYY/MM') BETWEEN '2007/01' and '2007/06';

-- 4.'Executive' 부서에서 사원과 해당 사원의 매니저(상사) 이름을 출력
-- (*) 매니저(상사)가 없는 사원인 'King'이 출력되려면
select e1.first_name||' '||e1.last_name as 이름, e2.first_name||' '||e2.last_name as 상사이름
from employees e1 left outer join departments d
                on e1.department_id = d.department_id 
                FULL OUTER join employees e2
                on e1.manager_id = e2.employee_id
where d.department_name like 'Executive';

------------------------입사문제-----------------------------------------------

--SQL-문제-1) 아래 스키마를 보고 평점이 3.0 이상인 학생들의 이름을 보여주는 SQL작성하시오

--<스키마>

--※ 밑줄친 속성은 기본키(Primary Key)이며 ENROLL의 학번은 STUDENT의 학번을 참조하는 외래키(Foreign Key)이고, ENROLL의 강좌번호는 CLASS의 강좌번호를 참조하는 외래키이다. 

 

--STUDENT(학번 , 학과, 이름) 

--CLASS(강좌번호, 시간, 강좌이름) 

--ENROLL(학번, 강좌번호, 학점)


SELECT s.이름
FROM student s, class c, enroll e
WHERE s.학번=e.학번
and   c.강좌번호=e.강좌번호
and  e.학점 >= 3.0;

--select s.이름
--from student s left join enroll e
--on s.학번 = e.학번
--left join class c
--on e.강좌번호 = c.강좌번호
--where e.학점>=3.0;


--SQL-문제-2) 다음 중 아래와 같은 테이블에서 Full Outer Join의 결과를 작성하시오

--<DEPT>

--<EMP>


--합쳐서 다 나온다 
--DEPTNO DNAME
--------------------
2번
DEPTNO DNAME
--------------------
30 SALES
NULL NULL
10 RESERCH
