--������̺�(emp)�� ������ �μ����̺�(dept)�� �� ����� �μ����� ���
select ename, dname
from emp, dept;


select emp.ename, dept.dname,dept.deptno
from emp, dept;


--�̷� �������� join!!

--�������� 
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno= d.deptno;

--�����Ĥ���
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e inner join dept d
on e.deptno= d.deptno;


--�ܺ�����
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno= d.deptno(+); 

--ǥ��ȭ
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e left outer join dept d
on e.deptno = d.deptno;
-----------------------------------------


select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno(+)= d.deptno;

--ǥ��ȭ
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e right outer join dept d
on e.deptno = d.deptno;

------------------------------------------


select e.ename ename , d.dname dname ,d.deptno deptno
from emp e, dept d
where e.deptno(+)= d.deptno(+);  --�ȵ� 

--ǥ��ȭ
select e.ename ename , d.dname dname ,d.deptno deptno
from emp e full outer join dept d
on e.deptno = d.deptno;

------------------------------------------

--������̺�(emp)�� �� ����� �Ŵ����� ��ȸ

SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr= e2.empno;

--��������
SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1 inner join emp e2
on e1.mgr= e2.empno;

--�ܺ�����
SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr= e2.empno(+);

--�ܺ����� ǥ��ȭ
SELECT e1.empno, e1.ename,e1.mgr, e2.empno, e2.ename
FROM emp e1 left outer join emp e2
ON e1.mgr= e2.empno;


--[����] ������ �ƴϴ�~

SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
      -- SMITH/ ADAMS / JAMES/ MILLER
      --INTERSECT ������
      --UNION ALL �� ������
      -- MINUS ������ 
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
      --CLARK/ KING /MILLER
  



