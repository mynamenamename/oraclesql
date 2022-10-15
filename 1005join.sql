--<< 기초 문제 >>


--1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력

select e.ename ename , e.job job , e.deptno deptno , d.dname dname , d.loc dloc
from emp e inner join dept d
on e.deptno=d.deptno;

--select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
--from emp e left join dept d
--on e.deptno = d.deptno;


--2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력

select e.empno, e.ename, e.sal, d.dname, d.loc
from emp e left join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';



--3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력

select  e.ename ename , d.dname dname , d.loc dloc
from emp e inner join dept d
on e.deptno=d.deptno and e.comm is not null;

--select  e.ename, d.dname, d.loc
--from emp e left outer join dept d
--on e.deptno = d.deptno
--where e.comm>0;


--4. 부서별 부서명과 급여 합계를 출력

select d.dname, sum(e.sal) as sumsal
from emp e right outer join dept d
on e.deptno = d.deptno
group by d.dname;



-- 5. 업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력 

select  e.ename ename , e.job ejob, d.dname dname , d.loc dloc
from emp e inner join dept d
on e.deptno=d.deptno and e.job = 'MANAGER';

--select e.ename, e.job, d.dname, d.loc
--from emp e left outer join dept d
--on e.deptno = d.deptno
--where e.job = 'MANAGER';

