-- 1. ���� dbms �� �⺻ ��� ��Ʈ�� �� �� �ΰ���
ORACLE : 1521
MS-SQL : 1433
MY-SQL : 3306

-- 2.  ����Ŭ DBMS ���� �Ʒ� ����� ���� SCOTT ������ ��й�ȣ�� 'TIGER' �� ������ �� ���� ������ ���� �ϼ���. 
ALTER USER SCOTT IDENTIFIED BY TIGER;


-- 3. ����Ŭ DBMS ���� �Ʒ� ����� ���� SCOTT ������ �����ϴ� ������ �ۼ��ϼ���. 

   -- ������ : SCOTT
   -- �н�����: 1234
   -- �ο��� �� (�������Ѱ� �Բ� �ο�, �⺻��) : DBA

CREATE USER SCOTT IDENTIFIED BY 1234;

GRANT CONNECT, DBA, RESOURCE TO SCOTT;



--4. ����Ŭ DBMS ���� ������ ������ SCOTT ������ ������ ������ �Ʒ��� �����Ͽ�  ���̺��� �����ϴ� ������ �ۼ� �Ͻÿ� .

CREATE TABLE EMP (

  ENO NUMBER(4),
  ENAME VARCHAR2(10),
  JOB VARCHAR2(9),
  MANAGER NUMBER(4),
  HIREDATE DATE,
  SALARY NUMBER(7,2),
  COMMISSION NUMBER(7,2),
  DNO NUMBER(2),
  
CONSTRAINT PK_EMP_ENO PRIMARY KEY (ENO),
CONSTRAINT FK_EMP_DNO FOREIGN KEY (DNO)
REFERENCES DEPT (DNO)

);

CREATE TABLE DEPT(

   DNO NUMBER(2),
   DNAME VARCHAR2(14),
   LOC VARCHAR2(13),
CONSTRAINT PK_DEPT_DNO PRIMARY KEY (DNO)

);





--5. ����Ŭ DBMS ���� ������ ������ SCOTT ������ ������ ������ �Ʒ��� �����Ͽ�  ���̺��� �����ϴ� ������ �ۼ� �Ͻÿ� .


CREATE TABLE SALG(

GRADE NUMBER,
LOSAL NUMBER,
HISAL NUMBER );

-- 6.�Ʒ��� ���� DEPT ���̺��� ���� Insert �ϴ� �������� �ۼ� �Ͻÿ�
--( ù��° ���ڵ� �Է� ������ ����մϴ� )
INSERT INTO DEPT (DNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');



--7. �Ʒ��� ���� EMP ���̺��� ���� Insert �ϴ� �������� �ۼ� �Ͻÿ�
--( ù��° ���ڵ� �Է� ������ ����մϴ� )
INSERT INTO EMP (ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY,DNO)
VALUES (7369, 'SMITH', 'CLERK', 7902, '80/12/17', 800, 20);


--8. �Ʒ��� ���� SALG ���̺��� ���� Insert �ϴ� �������� �ۼ� �Ͻÿ� .( ù��° ���ڵ� �Է� ������ ����մϴ� )
INSERT INTO SALG (GRADE, LOSAL, HISAL) VALUES (1, 700, 1200);


? 9. DEPT , EMP, SALG ���̺��� ��� ������ �����ϴ� �������� �ۼ��Ͻÿ�. 

    ?  (delete ��) ��� :  
    DELETE FROM DEPT;
    DELETE FROM EMP;
    DELETE FROM SALG;
    
    

    ? (truncate ��) ��� : 
    TRUNCATE TABLE DEPT;
    TRUNCATE TABLE EMP;
    TRUNCATE TABLE SALG;
     





?10. DEPT , EMP, SALG ���̺� ���� �������� �ۼ� �ϼ���.

DROP TABLE DEPT;
DROP TABLE EMP;
DROP TABLE SALG;


