--1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력

SELECT empno, ename, job, sal, sal*1.15 as new_salary, sal*1.15 - sal as increase
from emp;



--2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력

select ename, hiredate, next_day(add_months(hiredate,6),2)
from emp;



--3.이름, 입사일, 입사일로부터 현재까지의  년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력

select ename, hiredate, trunc(months_between(sysdate,hiredate)/12,0) as workyear,
sal, sal*trunc(months_between(sysdate,hiredate)/12,0) as sumsal
from emp;

--select ename, hiredate, sal,
--to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY') as workyear,
--sal*(to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')) as sumsal
--from emp;


--4.이름, 업무, 입사일, 입사한 요일을 출력

select ename, job, hiredate, to_char(hiredate,'day') as 입사요일
from emp;


--5. 업무별, 부서별 급여 합계와 인원수를 출력하되, 

   10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.

select job, deptno, sum(sal) as sumsal, count(deptno) as count
from emp
where  deptno != 10
group by job, deptno
having job in( 'SALESMAN', 'MANAGER');



--6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬

select job, trunc(avg(sal)) as avg, max(sal) as max
from emp
group by job
having avg(sal) >=2000
order by avg(sal) desc;


--7. 같은 입사년도 별로 인원수를 출력

select count(deptno)
from emp
group by to_char(hiredate,'YYYY');


--8. 5개씩 급여합계와 인원수를 출력 (rownum이용)




--9. 다음과 같이 출력

select job, count(job)
from emp
where job not in('PRESIDENT', 'ANALYST')
group by job;





select *
from( 
    select job  from emp
)
pivot(
    count(job) for job in ('CLERK','SALESMAN','MANAGER')
);


--10. 다음과 같이 업무별, 부서별 출력

select job, deptno, sum(sal) as sumsal
from emp
group by job, deptno;





