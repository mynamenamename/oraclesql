--�Ʒ��� employee ���̺��� ��� ����Դϴ�.


--1. �޿��� 2000 �̻� 3000 ������ ����� �̸��� �����ȣ, �Ի���, �޿��� ����ϵ� �̸���  �������� �����ϼ���.


SELECT ENAME, ENO, HIREDATE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 2000 AND SALARY <= 3000
ORDER BY ENAME ASC;



--2.Ŀ�̼��� NULL �� ����̸���, �Ի��� �μ���ȣ�� ����ϵ� �μ���ȣ�� �������� �����ϵ� �μ���ȣ�� ���� �׸��� ���� ��� �̸��� ������������ �����ϼ���.


SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE COMMISSION IS NULL
ORDER BY DNO, ENAME;




--3.Ŀ�̼��� 300 �̰ų� 500 �̰ų� 1400�� ����� �����ȣ�� �̸�, ����, Ŀ�̼��� ��� �ϵ� Ŀ�̼��� �������� �����ϼ��� 
--IN �����ڸ� ����ؼ� ��� �ϼ���.


SELECT ENO, ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IN (300,500,1400)
ORDER BY COMMISSION DESC;



--4.�̸��� ù ���ڰ� ��S���� �����ϴ� ����� �̸��� ����ϼ���.

SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE 'S%%';


--5.LIKE �����ڿ� ���ϵ� ī�带 ����ؼ� '81'�⵵�� �Ի����� ���� ����� �̸��� �Ի����� ����ϼ���.

SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE NOT LIKE '81%%';




--6.�μ� ��ȣ�� �ߺ� ������ ������������ �����ؼ� ����ϼ���.

SELECT DISTINCT DNO 
FROM EMPLOYEE
ORDER BY DNO;


--7.�̸��� ��A��  �� ��E�� �� ��� �����ϴ� ����� �̸��� ����ϼ���.

SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE '%A%' AND ENAME LIKE'%E%';



--8.substr �Լ��� ����ؼ� 12�� �޿� �Ի��� ����� �����ȣ, �̸�, �Ի����� ����ϼ���.

SELECT ENO, ENAME, HIREDATE
FROM EMPLOYEE
WHERE  SUBSTR (TO_CHAR(HIREDATE,'MM'),1,2) =12; 


--9.NVL �Լ��� ����ؼ� ����� ������ ����ؼ� ����̸�, ����, Ŀ�̼� , ������ ����ϵ� ������ ���� ������� ����ϼ���.

--���� > NVL(SALARY*12,0) 
--Ŀ�̼� > NVL(COMMISSION,0)

SELECT ENAME, SALARY, NVL(COMMISSION,0) COMM, NVL(SALARY*12,0)  YEARSAL
FROM EMPLOYEE
ORDER BY NVL(SALARY*12,0) DESC;



--10.NVL2 �Լ��� ����ؼ� ����� ������ ����ؼ� ����̸�, ����, Ŀ�̼� , ������ ����ϵ� ������ ���� ������� ����ϼ���.

SELECT ENAME, SALARY, NVL(COMMISSION,0) COMM, NVL2(SALARY*12,SALARY*12,0)  YEARSAL
FROM EMPLOYEE
ORDER BY NVL2(SALARY*12,SALARY*12,0) DESC;


--11.   ������� �޿� �Ѿ� , ��վ�, �ְ��, �ּҾ��� ��� �ϼ���. �� �÷��� ���޿��Ѿס�, ����վ�, ���ְ�ס�, ���ּҾס����� ��Ī�̸����� ����ϼ���.

SELECT SUM(SALARY) �޿��Ѿ�,  ROUND(AVG(SALARY)) ��վ�, MAX(SALARY)�ְ��, MIN(SALARY)�ּҾ�
FROM EMPLOYEE;


--12. ���� ������ ������ ��� �ϼ���.  ����÷��� ������ ������ �������� ��Ī�̸����� ��� �ϼ���.

SELECT COUNT(DISTINCT JOB) ���������ǰ��� 
FROM EMPLOYEE;



--13.  �� �μ��� ��� ������ ���ؼ� �μ���ȣ�� ��� ������ ��� �ϵ�  ���� ���μ���ȣ��, ����տ��ޡ� ���� ��Ī�̸����� ����ϼ���.

SELECT DNO �μ���ȣ, ROUND(AVG(SALARY)) ��տ���
FROM EMPLOYEE
GROUP BY DNO;


--14.��� ������ ������ ����� ���� ���Ͻÿ�. (���� , count �Լ� ���)

SELECT JOB, COUNT(*)
FROM EMPLOYEE
GROUP BY JOB;



--15.���޺� ����� ���� �޿��� ����Ͻÿ�, �����ڸ� �˼� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���� ��Ű�� ����� �޿��� ���� ������������ �����Ͽ� ��� �ϼ���.
--JOB�� ����� ������

SELECT JOB, MIN(SALARY)
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY JOB
HAVING MIN(SALARY) >= 2000
ORDER BY MIN(SALARY) DESC;



--16.���� ������ ����ؼ� �����ȣ�� 7788�� ����� �������� ���� ����� ��� �Ͻÿ�  <����̸�, ������> ��� �Ͻÿ�

--�����ȣ�� 7788�� ����� ������
SELECT JOB FROM EMPLOYEE WHERE ENO=7788;


SELECT ENAME ����̸�, JOB ������
FROM EMPLOYEE
WHERE JOB = (SELECT JOB FROM EMPLOYEE WHERE ENO=7788);

--17. ���� ������ ����ؼ� �����ȣ�� 7499 �� ������� �޿��� ���� ����� ��� �Ͻÿ�. <����̸�, ������> ��� �Ͻÿ�.

--�����ȣ�� 7499�� ����� �޿�
SELECT SALARY FROM EMPLOYEE WHERE ENO=7499;

SELECT ENAME ����̸�, JOB ������
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE ENO=7499);


--18.���� ������ ����ؼ� �� �μ��� �ּ� �޿��� �޴� ����� �̸� , �޿�, �μ���ȣ�� ����Ͻÿ�.

--�� �μ��� �ּ� �޿�
SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO;

SELECT ENAME �̸�, SALARY �޿�, DNO �μ���ȣ
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);




--19.   ���� ������ ����ؼ� �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ������������ �����Ͻÿ�.

--��ձ޿� 
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;

SELECT ENO �����ȣ, ENAME �̸�
FROM EMPLOYEE
WHERE SALARY > (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE)
ORDER BY SALARY ASC;


--20.���� ������ ����ؼ� DEPT ���̺� �ִ� �μ��� DNAME �÷�����  ��RESEARCH�� �μ��� �μ���ȣ, ����̸� �� ��� ������ ǥ���Ͻÿ�.

--research �μ��� �μ���ȣ
SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH';


SELECT D.DEPTNO �μ���ȣ, E.ENAME ����̸�, E.JOB ������
FROM EMP E, DEPT D
WHERE E.DEPTNO= D.DEPTNO
    AND E.DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
    
    
    
    
--�÷� �̸� ���� 

--research �μ��� �μ���ȣ
SELECT DNO FROM DEPT WHERE DNAME = 'RESEARCH';

SELECT D.NO �μ���ȣ, E.ENAME ����̸�, E.JOB ������
FROM EMP E, DEPT D
WHERE E.DNO= D.DNO
    AND E.NO=(SELECT DNO FROM DEPT WHERE DNAME = 'RESEARCH');