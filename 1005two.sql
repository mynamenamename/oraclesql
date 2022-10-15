--사원테이블(emp)에 사원명과 부서테이블(dept)에 그 사원의 부서명을 출력
select ename, dname
from emp, dept;


select emp.ename, dept.dname,dept.deptno
from emp, dept;


--이런 패턴으로 join!!

--내부조인 
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno= d.deptno;

--요즘방식ㅋㅎ
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e inner join dept d
on e.deptno= d.deptno;


--외부조인
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno= d.deptno(+); 

--표준화
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e left outer join dept d
on e.deptno = d.deptno;
-----------------------------------------


select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno(+)= d.deptno;

--표준화
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e right outer join dept d
on e.deptno = d.deptno;

------------------------------------------


select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno(+)= d.deptno(+);  --안됨 

--표준화
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e full outer join dept d
on e.deptno = d.deptno;

------------------------------------------

--사원테이블(emp)에 각 사원의 매니저를 조회

SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr= e2.empno;

--내부조인
SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1 inner join emp e2
on e1.mgr= e2.empno;

--외부조인
SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr= e2.empno(+);

--외부조인 표준화
SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1 left outer join emp e2
ON e1.mgr= e2.empno;


--[집합] 조인은 아니다~

SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
      -- SMITH/ ADAMS / JAMES/ MILLER
      --INTERSECT 교집합
      --UNION ALL 다 나오게
      -- MINUS 차집합 
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
      --CLARK/ KING /MILLER
  



