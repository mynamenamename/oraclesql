--1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���

SELECT empno, ename, job, sal, sal*1.15 as Newsal, sal*1.15- sal as Increase
FROM   emp;

?

--2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���

SELECT ename, hiredate, next_day(add_months(hiredate, 6),2)
FROM emp;


?

--3.�̸�, �Ի���, �Ի��Ϸκ��� ���������  ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���

SELECT ename, hiredate, sal, to_char(sysdate,'YYYY')- to_char(hiredate,'YYYY') as workyear, 
       sal*(to_char(sysdate,'YYYY')- to_char(hiredate,'YYYY')) as sumsal
FROM emp;
?

--4.�̸�, ����, �Ի���, �Ի��� ������ ���

select ename, job, hiredate, to_char(hiredate,'day')
from emp;

?

--5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 

  -- 10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.

SELECT JOB, DEPTNO, SUM(SAL) AS SUM, COUNT(*) AS �ο���
FROM EMP
WHERE DEPTNO !=10
GROUP BY JOB,DEPTNO
HAVING JOB IN('SALESMAN','MANAGER');

?

--6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����


select job, trunc(avg(sal)), max(sal)
from emp
group by job
having avg(sal) >=2000
order by avg(sal) desc;



?

--7. ���� �Ի�⵵ ���� �ο����� ���

?select count(*)
from emp
?group by to_char(hiredate,'yyyy');

?

--8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)

?

?

--9. ������ ���� ���

 
?


?

    

?

--10. ������ ���� ������, �μ��� ���


?


?