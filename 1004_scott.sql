-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
SELECT  ename, sal, sal/12, round(sal/12, -1) as wolgub
FROM  emp;

-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
SELECT  ename, sal, sal*0.033, trunc(sal*0.033,-1) as tax
FROM  emp;

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���

SELECT empno, ename, LOWER(job) as job
FROM   emp
WHERE ename = 'SMITH';
--WHERE ename = UPPER('smith');
--WHERE lower(ename) = 'SMITH';
--WHERE lower(ename) = lower('SMITH');

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���

SELECT  empno, INITCAP(ename) as ename, INITCAP(job) as job
FROM emp;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����

select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;
--between > ������ �ȵǾ ������


-- �̸��� 5���� �̻��� ������� ���

SELECT *
FROM   emp
WHERE  LENGTH (ename) >= 5;


-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���

SELECT RPAD (ename, 15, '*')
FROM   emp;



-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���

SELECT LPAD (sal, 10, '-')
FROM   emp;

-- info_tab
select name, substr(jumin,8,1) as gender, substr(jumin,1,2) as birth
from info_tab;

select '-' || trim(' �̼��� ') || '-' as col1, 
       '-' || ltrim(' �̼��� ') || '-' as col2, 
       '-' || rtrim(' �̼��� ') || '-' as col3
from dual;

SELECT sysdate
FROM  dual; 
--�������̺� dual ����Ŭ���� ����

-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
SELECT sal, translate(sal, '0123456789', '�����̻�����ĥ�ȱ�') as kor
FROM emp; 


-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
SELECT sal, replace(sal,0,'$') as char_sal
FROM emp;


--------*****���̻��!! ���ʰ������ ����
SELECT replace('        ��   ��   ��           ', ' ' ,'') as ename
FROM dual;
--------------------------------------


-- ������� �ٹ��� ���� ���� ��� ������ ���

SELECT ename, hiredate, sysdate - Nvl(hiredate,sysdate),
       ceil(sysdate - Nvl(hiredate,sysdate))
FROM  emp
ORDER BY sysdate - hiredate desc;

SELECT ename, hiredate
FROM  emp
ORDER BY sysdate - hiredate desc NULLS LAST;



-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���


select ename, sysdate-hiredate, 
     trunc((sysdate-hiredate)/7,0) as weeks,
     floor(mod(sysdate-hiredate,7)) as days
from emp;




-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 


SELECT ename, floor(months_between(sysdate,hiredate)) as month
FROM  emp
WHERE deptno = 10;
--�����ִ°� ����


-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�

select add_months( sysdate, 3 ) as mydate 
from dual;


-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�

select next_day( sysdate, 2 ) 
from dual;


select next_day( sysdate, '��') 
from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�

SELECT  LAST_DAY(sysdate)
FROM  dual;

-- �Ի����ڿ��� �Ի�⵵�� ���

SELECT  ename, hiredate, to_char(hiredate, 'YYYY') as hire_year
FROM emp;


-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
SELECT  ename, hiredate, to_char(hiredate, 'YYYY"��" MM"��" DD"��"') as hire_date
FROM emp;

-- 1981�⵵�� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY')= 1981;
--like�� ���ڿ��� ����

-- 5���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate,'mm')= 05;

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���

SELECT ename, sal, to_char(sal,'$999,999,999,999') as dollar
from emp;
--�˳��ϰ� ���� ���

--81�� 2���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY-MM')= '1981-02';


--81�⿡ �Ի����� ���� ��� �˻�
SELECT *
FROM emp
WHERE NOT to_char(hiredate,'YYYY')=  1981;
--WHERE  to_char(hiredate,'YYYY') !=  1981;

--81�� �Ϲݱ⿡ �Ի��� ��� �˻�

SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY-MM') between '1981-07' and '1981-12';
--between�� �� ���� �ȴ�!!

--where To_char(hiredate,'yyyy-mm') >= '1981-07' and
--      To_char(hiredate,'yyyy-mm') < '1982-01'


-- �ֹι�ȣ���� ���� ���ϱ�

SELECT jumin, decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') AS gender
FROM info_tab;


SELECT jumin, CASE substr( jumin, 8, 1)  
   WHEN '1' THEN '����'
   WHEN '3' THEN '����'
   ELSE '����'
   END as gender
FROM info_tab;

--�Ѵ� �����


-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���

--1

SELECT deptno, decode( deptno, 10, '������', 20, '������', 30, 'IT��', '�����') AS part
FROM emp;
--���� ���� ���� ���ϱ�


--2
SELECT deptno, CASE deptno
   WHEN 10 THEN '������'
   WHEN 20 THEN '������'
   WHEN 30 THEN 'IT��'
   ELSE '�����'
   END as part
FROM emp;



-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ���
--�����ȣ, �����, ����, �޿�, ������ �޿��� ���

--1
SELECT empno, ename, job, sal, decode(job, 'ANALYST', sal*1.1, 'CLERK', sal*1.15, 'MANAGER', sal*1.2) AS change
FROM emp;


--2

SELECT empno, ename, job, sal, CASE job 
    WHEN 'ANALYST' THEN sal*1.1
    WHEN 'CLERK' THEN  sal*1.15
    WHEN 'MANAGER' THEN sal*1.2
    ELSE sal
    END as change
FROM emp;


-------------------------------------------

select all job from emp;

select distinct job from emp;
--�ߺ� ����

desc emp;
select rownum, empno, ename, job from emp;
--rownum >> �����÷� ���� 
select rownum, empno, ename, job from emp 
where rownum<=5;

-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
SELECT  avg(sal) as avg, sum(sal) as sum, min(sal) as min, max(sal) as max
FROM  emp
WHERE job= 'SALESMAN';
--null�� �־ �׳� ��� ����

INSERT INTO emp(empno,ename,job)
VALUES(9001,'ȫ�汹','SALESMAN');

-- Ŀ�̼�(COMM)�� �޴� ������� ����
SELECT count(comm)
FROM emp
WHERE comm>0;


-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
SELECT deptno, count(*),round(avg(sal),-2), min(sal), max(sal), sum(sal)
FROM  emp
--WHERE
GROUP BY deptno;
--HAVING
--�׷���� �÷��� �ü� �ִ� select��
--���> where , groupby > having


-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� ( �μ��� �޿��� ���� ���� ������)

SELECT deptno, count(*),round(avg(sal),-2), min(sal), max(sal), sum(sal)
FROM  emp
--WHERE
GROUP BY deptno
ORDER BY sum(sal) desc;

-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�

SELECT deptno, job, count(deptno), avg(sal), sum(sal)
FROM  emp
--WHERE
GROUP BY deptno, job;




-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���

SELECT deptno, round(avg(sal),-2), sum(sal)
FROM  emp
HAVING max(sal) >=2900
GROUP BY deptno;






-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���

SELECT job, round(avg(sal),-2), sum(sal)
FROM  emp
HAVING avg(sal) >=3000
GROUP BY job;



-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
--��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����


SELECT job, sum(sal)
FROM  emp
WHERE job != 'SALESMAN'
HAVING sum(sal) >5000
GROUP BY job
ORDER BY sum(sal) desc;




-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�


SELECT job, max(sal), min(sal), max(sal)-min(sal)
FROM  emp
GROUP BY job;





-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���


SELECT deptno, count(deptno), sum(sal)
FROM  emp
HAVING count(deptno) >= 4
GROUP BY deptno;


