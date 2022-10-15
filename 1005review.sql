--1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력

SELECT empno, ename, job, sal, sal*1.15 as Newsal, sal*1.15- sal as Increase
FROM   emp;

?

--2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력

SELECT ename, hiredate, next_day(add_months(hiredate, 6),2)
FROM emp;


?

--3.이름, 입사일, 입사일로부터 현재까지의  년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력

SELECT ename, hiredate, sal, to_char(sysdate,'YYYY')- to_char(hiredate,'YYYY') as workyear, 
       sal*(to_char(sysdate,'YYYY')- to_char(hiredate,'YYYY')) as sumsal
FROM emp;
?

--4.이름, 업무, 입사일, 입사한 요일을 출력

select ename, job, hiredate, to_char(hiredate,'day')
from emp;

?

--5. 업무별, 부서별 급여 합계와 인원수를 출력하되, 

  -- 10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.

SELECT JOB, DEPTNO, SUM(SAL) AS SUM, COUNT(*) AS 인원수
FROM EMP
WHERE DEPTNO !=10
GROUP BY JOB,DEPTNO
HAVING JOB IN('SALESMAN','MANAGER');

?

--6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬


select job, trunc(avg(sal)), max(sal)
from emp
group by job
having avg(sal) >=2000
order by avg(sal) desc;



?

--7. 같은 입사년도 별로 인원수를 출력

?select count(*)
from emp
?group by to_char(hiredate,'yyyy');

?

--8. 5개씩 급여합계와 인원수를 출력 (rownum이용)

?

?

--9. 다음과 같이 출력

 
?


?

    

?

--10. 다음과 같이 업무별, 부서별 출력


?


?