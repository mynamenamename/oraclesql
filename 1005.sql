--1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���

SELECT empno, ename, job, sal, sal*1.15 as new_salary, sal*1.15 - sal as increase
from emp;



--2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���

select ename, hiredate, next_day(add_months(hiredate,6),2)
from emp;



--3.�̸�, �Ի���, �Ի��Ϸκ��� ���������  ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���

select ename, hiredate, trunc(months_between(sysdate,hiredate)/12,0) as workyear,
sal, sal*trunc(months_between(sysdate,hiredate)/12,0) as sumsal
from emp;

--select ename, hiredate, sal,
--to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY') as workyear,
--sal*(to_char(sysdate,'YYYY')-to_char(hiredate,'YYYY')) as sumsal
--from emp;


--4.�̸�, ����, �Ի���, �Ի��� ������ ���

select ename, job, hiredate, to_char(hiredate,'day') as �Ի����
from emp;


--5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 

   10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.

select job, deptno, sum(sal) as sumsal, count(deptno) as count
from emp
where  deptno != 10
group by job, deptno
having job in( 'SALESMAN', 'MANAGER');



--6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����

select job, trunc(avg(sal)) as avg, max(sal) as max
from emp
group by job
having avg(sal) >=2000
order by avg(sal) desc;


--7. ���� �Ի�⵵ ���� �ο����� ���

select count(deptno)
from emp
group by to_char(hiredate,'YYYY');


--8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)




--9. ������ ���� ���

select job, count(job)
from emp
where job not in('PRESIDENT', 'ANALYST')
group by job;





select *
from( 
    select job  from emp
)
pivot(
    count(job) for job in ('CLERK','SALESMAN','MANAGER')
);


--10. ������ ���� ������, �μ��� ���

select job, deptno, sum(sal) as sumsal
from emp
group by job, deptno;





