--11. scott �Ǵ� ward�� ������ ���� ����� ������ �̸�, ����, �޿��� ���
select sal from emp where ename like 'SCOTT';
select sal from emp where ename like 'WARD';


select e.ename, e.job, e.sal
from emp e
where  e.sal =(select sal from emp where ename='SCOTT') or
       e.sal = (select sal from emp where ename='WARD') ;
?

?

--12. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���

--chicago���� �ٹ��ϴ� ����� ����
select e.job from emp e,dept d where e.deptno=d.deptno and d.loc= 'CHICAGO';
      
select e.ename, e.job     
from emp e
where e.job in (select e.job from emp e,dept d where e.deptno=d.deptno and d.loc= 'CHICAGO');
    

?

--13. �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���
-- �μ����� �μ��� ������ �μ��� ��� ���޺��� ������!!!

 --���� �Ѱ�
--��� ���� 
select round(avg(sal)) from emp;

--�μ��� ����
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



