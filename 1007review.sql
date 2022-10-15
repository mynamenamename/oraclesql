--11. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력
select sal from emp where ename like 'SCOTT';
select sal from emp where ename like 'WARD';


select e.ename, e.job, e.sal
from emp e
where  e.sal =(select sal from emp where ename='SCOTT') or
       e.sal = (select sal from emp where ename='WARD') ;
?

?

--12. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력

--chicago에서 근무하는 사원의 업무
select e.job from emp e,dept d where e.deptno=d.deptno and d.loc= 'CHICAGO';
      
select e.ename, e.job     
from emp e
where e.job in (select e.job from emp e,dept d where e.deptno=d.deptno and d.loc= 'CHICAGO');
    

?

--13. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력
-- 부서별로 부서별 월급이 부서별 평균 월급보다 높은거!!!

 --내가 한것
--평균 월급 
select round(avg(sal)) from emp;

--부서별 월급
SELECT DEPTNO, SAL
FROM EMP
GROUP BY DEPTNO, SAL;

select deptno,ename, sal
from  emp
group by deptno,ename, sal
having sal > (select round(avg(sal)) from emp);



SELECT E1.DEPTNO, E1.ENAME, E1.SAL
FROM EMP E1,(SELECT DEPTNO,TRUNC(AVG(SAL)) AVG FROM EMP GROUP BY DEPTNO) E
WHERE E1.DEPTNO=E.DEPTNO
AND E1.SAL> E.AVG;



