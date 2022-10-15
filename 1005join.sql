--<< ���� ���� >>


--1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���

select e.ename ename , e.job job , e.deptno deptno , d.dname dname , d.loc dloc
from emp e inner join dept d
on e.deptno=d.deptno;

--select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
--from emp e left join dept d
--on e.deptno = d.deptno;


--2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���

select e.empno, e.ename, e.sal, d.dname, d.loc
from emp e left join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';



--3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���

select  e.ename ename , d.dname dname , d.loc dloc
from emp e inner join dept d
on e.deptno=d.deptno and e.comm is not null;

--select  e.ename, d.dname, d.loc
--from emp e left outer join dept d
--on e.deptno = d.deptno
--where e.comm>0;


--4. �μ��� �μ���� �޿� �հ踦 ���

select d.dname, sum(e.sal) as sumsal
from emp e right outer join dept d
on e.deptno = d.deptno
group by d.dname;



-- 5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ��� 

select  e.ename ename , e.job ejob, d.dname dname , d.loc dloc
from emp e inner join dept d
on e.deptno=d.deptno and e.job = 'MANAGER';

--select e.ename, e.job, d.dname, d.loc
--from emp e left outer join dept d
--on e.deptno = d.deptno
--where e.job = 'MANAGER';

