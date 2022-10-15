--<< 연습문제 >>



--1. SCOTT의 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력

select e.empno,e.ename,e.job, e.sal 
from emp e,
    (select empno, ename, job, sal from emp where ename='SCOTT') ext
where e.sal > ext.sal;


--2. 30번 부서의 최소 급여보다 각부서의 최소 급여가 높은 부서를 출력
--각 부서의 최소 급여 >
SELECT deptno, min(sal) 
FROM emp
GROUP BY deptno
HAVING min(sal) > (select min(sal) from emp where deptno=30);

--30번 부서의 최소급여 >
select min(sal) from emp where deptno=30;



--30번 부서의 최소급여 > select min(sal) from emp where deptno=30;
--각 부서의 최소 급여 > select deptno, min(sal) from emp group by deptno;
--내가푼거 ㅋ
select d.dname
from emp e, dept d
where (select min(e.sal) from emp where e.deptno= '30') <
       (select min(e.sal) from emp group by e.deptno) ;




--3. 업무별로 평균 급여 중에서 가장 적은 급여를 가진 직업을 출력
-- 업무별 평균 급여 
select job, round(avg(sal))
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job);

--가장 작은 급여
select min(avg(sal)) from emp group by job;



-- 4. 사원번호가 7521의 업무와 같고 사번 7934인 직원보다 급여를 많이 받는 사원의 정보를 출력
--다시해보기
SELECT e.*
FROM emp e,
( SELECT * FROM emp WHERE empno = 7521 ) s1,
( SELECT * FROM emp WHERE empno = 7934 ) s2
WHERE e.job = s1.job AND e.sal > s2.sal;




--5. 'WARD'와 부서와 업무가 같은 사원 명단 출력

select e.*
from emp e,
    (select deptno, job from emp where ename ='WARD') ward
where e.deptno= ward.deptno and e.job=ward.job;




