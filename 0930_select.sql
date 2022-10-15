
/*
 SELECT �˻��� �׸��
 FROM   ���̺��
 WHERE  ���� ;
*/


-- ��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���
SELECT   ename, sal,  sal+nvl(comm,0) AS totl_sal  --������, �Լ� �ϳ��� �߰��Ǹ� ��Ī �������̱� as ��������
FROM         emp;
--WHERE ��� ����̶� �ʿ����

SELECT ename||' '||job AS staff
FROM    emp;
--ename + job  >> || ��ȣ�� ǥ��

SELECT distinct job FROM emp;
--�ߺ��� ���ֱ�

-- 1- 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT     empno,ename,deptno
FROM           emp
WHERE      deptno=20;

-- 2- �Ի����� 81/01/01���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���

SELECT    empno,ename,hiredate
FROM           emp
WHERE        hiredate between '81/01/01' and '81/06/09';
--WHERE        hiredate>= '81/01/01' <= '81/06/09';      ���Կ��� Ȯ���ϱ�

-- 3- �������� salesman, clerk�� ������� �̸��� ������ ���

SELECT ENAME,JOB
FROM    EMP
WHERE   JOB ='SALESMAN' OR JOB='CLERK';
--WHERE JOB = upper('salesman') OR JOB=upper('clerk') ;
--WHERE JOB IN ('SALESMAN','CLERK');

-- 4- ������ president�̰� �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���

SELECT *
FROM EMP
WHERE (JOB='PRESIDENT' AND SAL>=1500) OR JOB='SALESMAN';

--��ȣó�� �ϱ�! and�� �켱���� ����
-- 5- ������ president �Ǵ� salesman�̰� �޿��� 1500�̻��� ����� ������ ���

SELECT *
FROM EMP
WHERE (JOB='PRESIDENT' OR JOB='SALESMAN') AND SAL>=1500;



-- 6- Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���


SELECT    ename,sal,comm
FROM           emp
WHERE        comm is null or comm = 0;
-- comm= 0�� ��� �������� �ȵ�!!

--  7- �����, �޿�, Ŀ�̼�, �ѱ޿�( �޿� + Ŀ�̼�)�� ���
SELECT   ename, sal,  sal+nvl(comm,0) AS totl_sal  
FROM         emp;



-- 8- �̸� A�� �����ϴ� ����� ���

SELECT   ename
FROM      emp
WHERE   ename like 'A%';



-- 9- �̸��� �ι�° ���ڰ� L�� ����� ���

SELECT   ename
FROM      emp
WHERE   ename like '_L%';


-- 10- �̸��� L�� �� �� �̻� ���Ե� ����� ���
--  %LL% �ϸ� LoL >> �Ȱɸ� 
SELECT   ename
FROM      emp
WHERE   ename like '%L%L%';



-- 11- Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���

SELECT         *
FROM           emp
WHERE        comm is NOT null;


-- 12- ���ʽ��� �޿����� 10%�̻� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���

select ename, sal, comm
from emp
where comm>= (sal*1.1);


-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���

select *
from emp
where (job= 'CLERK' or job= 'ANALYST') and sal != 1000 and sal != 3000 and sal != 5000;
--WHERE   job in ('CLERK','ANALYST') AND sal not in(1000,3000,5000);


-- 14- �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���

SELECT *
FROM EMP
WHERE DEPTNO =30 OR MGR=7782;
