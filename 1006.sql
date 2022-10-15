--1. 사원명에 ‘L’자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력
--옛날방식
SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e , dept d
WHERE e.deptno = d.deptno  AND 
      e.ename like '%L%';
--GROUP BY
--HAVING
--ORDER BY?

--표준화
SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e inner join dept d
on e.deptno = d.deptno  
where  e.ename like '%L%';





--2. 관리자보다 먼저 입사한 사원에 대해 이름, 입사일, 관리자 이름, 관리자 입사일을 출력

SELECT e1.ename ename, e1.hiredate hire, e2.ename mgrname, e2.hiredate mgrhire
FROM  emp e1, emp e2
WHERE e1.mgr = e2.empno 
AND e1.hiredate <  e2.hiredate;

--표준화
SELECT e1.ename ename, e1.hiredate hire, e2.ename mgrname, e2.hiredate mgrhire
FROM  emp e1 inner join emp e2
ON e1.mgr = e2.empno(+)
WHERE e1.hiredate <  e2.hiredate;




--3. 아래의 결과를 출력 ( 관리자가 없는 KING을 포함하여 모든 사원을 출력 )
--셀프조인


--옛날방식
SELECT e1.empno no, e1.ename ename, e1.mgr mgrno, e2.ename mgrname
FROM emp e1, emp e2
WHERE e1.mgr=e2.empno(+);

--표준화
SELECT e1.empno, e1.ename, e1.mgr, e2.ename
FROM emp e1 left outer join emp e2
ON e1.mgr=e2.empno;

----------<서브쿼리 단일행>----------
--전체 사원들 중 평균 급여보다 낮은 급여를 받는 사원의 명단을 조회
--평균 급여 구하기
select round(avg(sal)) from emp;

--그 평균 급여보다 낮은 사원 정보 조회
select ename, sal 
from emp 
where sal < (select round(avg(sal)) from emp ); 
             --서브쿼리 1개일때만 가능, 2개 이상이면 in, not in...
 
             
-- 월급이 가장 많은 사원의 정보 조회             
select  max(sal)  from emp;   

select ename, sal
from emp
where sal = (select  max(sal) from emp); 




-- 평균 급여보다 높고 최대 급여보다 낮은 월급을 받는 사원의 정보를 조회

select *
from emp
where sal > (select round(avg(sal))  from emp) 
AND   sal <  (select  max(sal) from emp);

SELECT e.*
FROM emp e,
  ( select round(avg(sal)) avg,  max(sal) max from emp ) ext
WHERE e.sal > ext.avg AND e.sal < ext.max;

-- 월급순으로 상위 10명의 명단을 출력
--실수주의하기
select ename, sal
from emp
where rownum <=10
order by sal desc;

select e.*
from (select ename, sal from emp order by sal desc) e
where rownum <11;



----------<서브쿼리 다중행>----------

-- 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력

--업무별 최소 급여
select job, min(sal) from emp group by job;

--업무별 최소 급여 받는 사원 정보 출력
select empno, ename, job, sal
from emp
where (job,sal) in (select job, min(sal) from emp group by job);

insert into emp(empno,ename,job,sal) values (9999,'test','CLERK',1250);



-- 10번 부서 사원들의 업무와 동일한 직원들 검색
--10번 부서 사원들의 업무
select deptno,job from emp where deptno =10;

-- 10번 부서 사원들의 업무와 동일한 직원들 검색
select ename, job
from emp
where job in (select job from emp where deptno =10);

-->> ANY: 하나라도 걸리면  근데 이거 권장 안함 
select ename, job
from emp
where job = ANY (select job from emp where deptno =10);




-- 적어도 한명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무를 출력
-- 누군가의 mgr에 내 사번이 있는 사람 추출
select empno, ename, job 
from emp e1
where  exists (select * from emp e2 where e1.empno = e2.mgr );


-- 사원 추출(누군가의 mgr에 내 사번이 없는 사람)
select empno, ename, job 
from emp e1
where not exists (select * from emp e2 where e1.empno = e2.mgr );


-------------------밑의 부분---------------------------

create table stat_salary ( 
stat_date date not null, -- 날짜
dept_no number, -- 부서
emp_count number, -- 사원수
tot_salary number, -- 급여총액
avg_salary number ); -- 급여평균

desc stat_salary;

select sysdate, deptno from emp group by deptno;

insert into stat_salary(stat_date, dept_no)
 select sysdate, deptno from emp group by deptno;
 
select * from stat_salary;

--부서별 사원수 ,월급총액, 월급평균
select  count(*), sum(sal), round(avg(sal)) from emp group by deptno;

update stat_salary ss
set( emp_count, tot_salary, avg_salary) 
 = (select count(*), sum(sal), round(avg(sal)) 
    from emp e
    where ss.dept_no=e.deptno
    group by deptno);

select * from stat_salary;

create table emp_cp as select * from emp;

--부서명이 'sales'인 사원의 정보를 삭제 ( emp_cp에서)
--DELETE FROM table_name WHERE condition;
--부서명이 sales
delete 
from emp_cp
where deptno = (select deptno from dept where dname = 'SALES');















