--<< �������� >>



--1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���

select e.empno,e.ename,e.job, e.sal 
from emp e,
    (select empno, ename, job, sal from emp where ename='SCOTT') ext
where e.sal > ext.sal;


--2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���
--�� �μ��� �ּ� �޿� >
SELECT deptno, min(sal) 
FROM emp
GROUP BY deptno
HAVING min(sal) > (select min(sal) from emp where deptno=30);

--30�� �μ��� �ּұ޿� >
select min(sal) from emp where deptno=30;



--30�� �μ��� �ּұ޿� > select min(sal) from emp where deptno=30;
--�� �μ��� �ּ� �޿� > select deptno, min(sal) from emp group by deptno;
--����Ǭ�� ��
select d.dname
from emp e, dept d
where (select min(e.sal) from emp where e.deptno= '30') <
       (select min(e.sal) from emp group by e.deptno) ;




--3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���
-- ������ ��� �޿� 
select job, round(avg(sal))
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job);

--���� ���� �޿�
select min(avg(sal)) from emp group by job;



-- 4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���
--�ٽ��غ���
SELECT e.*
FROM emp e,
( SELECT * FROM emp WHERE empno = 7521 ) s1,
( SELECT * FROM emp WHERE empno = 7934 ) s2
WHERE e.job = s1.job AND e.sal > s2.sal;




--5. 'WARD'�� �μ��� ������ ���� ��� ��� ���

select e.*
from emp e,
    (select deptno, job from emp where ename ='WARD') ward
where e.deptno= ward.deptno and e.job=ward.job;




