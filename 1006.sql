--1. ����� ��L���ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ���
--�������
SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e , dept d
WHERE e.deptno = d.deptno  AND 
      e.ename like '%L%';
--GROUP BY
--HAVING
--ORDER BY?

--ǥ��ȭ
SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e inner join dept d
on e.deptno = d.deptno  
where  e.ename like '%L%';





--2. �����ں��� ���� �Ի��� ����� ���� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ���

SELECT e1.ename ename, e1.hiredate hire, e2.ename mgrname, e2.hiredate mgrhire
FROM  emp e1, emp e2
WHERE e1.mgr = e2.empno 
AND e1.hiredate <  e2.hiredate;

--ǥ��ȭ
SELECT e1.ename ename, e1.hiredate hire, e2.ename mgrname, e2.hiredate mgrhire
FROM  emp e1 inner join emp e2
ON e1.mgr = e2.empno(+)
WHERE e1.hiredate <  e2.hiredate;




--3. �Ʒ��� ����� ��� ( �����ڰ� ���� KING�� �����Ͽ� ��� ����� ��� )
--��������


--�������
SELECT e1.empno no, e1.ename ename, e1.mgr mgrno, e2.ename mgrname
FROM emp e1, emp e2
WHERE e1.mgr=e2.empno(+);

--ǥ��ȭ
SELECT e1.empno, e1.ename, e1.mgr, e2.ename
FROM emp e1 left outer join emp e2
ON e1.mgr=e2.empno;

----------<�������� ������>----------
--��ü ����� �� ��� �޿����� ���� �޿��� �޴� ����� ����� ��ȸ
--��� �޿� ���ϱ�
select round(avg(sal)) from emp;

--�� ��� �޿����� ���� ��� ���� ��ȸ
select ename, sal 
from emp 
where sal < (select round(avg(sal)) from emp ); 
             --�������� 1���϶��� ����, 2�� �̻��̸� in, not in...
 
             
-- ������ ���� ���� ����� ���� ��ȸ             
select  max(sal)  from emp;   

select ename, sal
from emp
where sal = (select  max(sal) from emp); 




-- ��� �޿����� ���� �ִ� �޿����� ���� ������ �޴� ����� ������ ��ȸ

select *
from emp
where sal > (select round(avg(sal))  from emp) 
AND   sal <  (select  max(sal) from emp);

SELECT e.*
FROM emp e,
  ( select round(avg(sal)) avg,  max(sal) max from emp ) ext
WHERE e.sal > ext.avg AND e.sal < ext.max;

-- ���޼����� ���� 10���� ����� ���
--�Ǽ������ϱ�
select ename, sal
from emp
where rownum <=10
order by sal desc;

select e.*
from (select ename, sal from emp order by sal desc) e
where rownum <11;



----------<�������� ������>----------

-- �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ������, �޿��� ���

--������ �ּ� �޿�
select job, min(sal) from emp group by job;

--������ �ּ� �޿� �޴� ��� ���� ���
select empno, ename, job, sal
from emp
where (job,sal) in (select job, min(sal) from emp group by job);

insert into emp(empno,ename,job,sal) values (9999,'test','CLERK',1250);



-- 10�� �μ� ������� ������ ������ ������ �˻�
--10�� �μ� ������� ����
select deptno,job from emp where deptno =10;

-- 10�� �μ� ������� ������ ������ ������ �˻�
select ename, job
from emp
where job in (select job from emp where deptno =10);

-->> ANY: �ϳ��� �ɸ���  �ٵ� �̰� ���� ���� 
select ename, job
from emp
where job = ANY (select job from emp where deptno =10);




-- ��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
-- �������� mgr�� �� ����� �ִ� ��� ����
select empno, ename, job 
from emp e1
where  exists (select * from emp e2 where e1.empno = e2.mgr );


-- ��� ����(�������� mgr�� �� ����� ���� ���)
select empno, ename, job 
from emp e1
where not exists (select * from emp e2 where e1.empno = e2.mgr );


-------------------���� �κ�---------------------------

create table stat_salary ( 
stat_date date not null, -- ��¥
dept_no number, -- �μ�
emp_count number, -- �����
tot_salary number, -- �޿��Ѿ�
avg_salary number ); -- �޿����

desc stat_salary;

select sysdate, deptno from emp group by deptno;

insert into stat_salary(stat_date, dept_no)
 select sysdate, deptno from emp group by deptno;
 
select * from stat_salary;

--�μ��� ����� ,�����Ѿ�, �������
select  count(*), sum(sal), round(avg(sal)) from emp group by deptno;

update stat_salary ss
set( emp_count, tot_salary, avg_salary) 
 = (select count(*), sum(sal), round(avg(sal)) 
    from emp e
    where ss.dept_no=e.deptno
    group by deptno);

select * from stat_salary;

create table emp_cp as select * from emp;

--�μ����� 'sales'�� ����� ������ ���� ( emp_cp����)
--DELETE FROM table_name WHERE condition;
--�μ����� sales
delete 
from emp_cp
where deptno = (select deptno from dept where dname = 'SALES');















