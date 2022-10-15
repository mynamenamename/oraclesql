

------VIEW------

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp;
           
SELECT * FROM v_emp;

DESC v_emp;

INSERT INTO V_EMP VALUES (1000, 'ȫ�浿', 20);
SELECT * FROM EMP;
--���� �Է��ص� �������� �Էµ�

INSERT INTO V_EMP VALUES (1000, 'ȫȫ��', 20); --�ȵ� 1000 ���ļ�
INSERT INTO V_EMP VALUES (2000, 'ȫȫ��', 90); --�ܷ�Ű�� �ɸ� 90 �μ� ����

--������ �ѼյǴϱ� ��� �б��������� ���� ����! ������ �ƴϰ� 

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
           WITH READ ONLY;
           
INSERT INTO V_EMP VALUES (2000, 'ȫȫ��', 30);           


--(1) updatable ��
--[ ���� ] EMP ���̺��� 30�� �μ��� 
--EMPNO�� EMP_NO�� ENAME�� NAME�� SAL�� SALARY�� �ٲ㼭 
--EMP_30 �並 �����Ͻÿ�

CREATE OR REPLACE VIEW V_EMP_30  AS
           select empno EMP_NO, ename NAME, sal SALARY 
           from emp 
           WHERE deptno=30
           WITH READ ONLY;
                 
SELECT * FROM V_EMP_30;


--(3) ���պ�
--���� �Ź� �ϱ� ����� ,,, �츮�� ������Ʈ���� �Ⱦ��� ���� 
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

INSERT INTO V_EMP_INFO(EMPNO, ENAME, DNAME) VALUES (3333,'�Ͳ���', 30); --�ȵ�
INSERT INTO V_EMP_INFO(EMPNO, ENAME) VALUES (3333,'�Ͳ���'); --��

DELETE FROM V_EMP_INFO WHERE EMPNO=7788; --���⼭ �����µ� ������ ������ ������ �б���������

SELECT * FROM V_EMP_INFO;
SELECT * FROM EMP;

--[ ���� ] �μ����� �μ���, �ּұ޿�, �ִ� �޿�, �μ��� ��� �޿��� �����ϴ� V_DEPT_SUM �並 �����Ͽ���.
select d.dname dname, min(e.sal) minsal, max(e.sal) maxsal, round(avg(e.sal)) avgsal
from emp e, dept d
where e.deptno=d.deptno(+)
group by d.dname;



CREATE OR REPLACE VIEW V_DEPT_SUM  AS
select d.dname dname, min(e.sal) minsal, max(e.sal) maxsal, round(avg(e.sal)) avgsal
from emp e, dept d
where e.deptno=d.deptno(+)
group by d.dname
with read only;
       
          
select * from  V_DEPT_SUM ;     


INSERT INTO EMP(EMPNO,ENAME,SAL,DEPTNO) 
VALUES(4444,'ȣ��',9000,20);  --������ �ٲ�� VIEW�� �ٲ��!


------SEQUENCE------

CREATE  SEQUENCE   seq_temp;

SELECT seq_temp.NEXTVAL FROM DUAL; --�ϳ��� ����

SELECT seq_temp.currVAL FROM DUAL; --NEXTVAL �ѹ��̶� �ؾ� ���� ���簪 

--5000�� ���� 10�� �����ϴ� �ڵ�������(������)

CREATE SEQUENCE seq_plus
START WITH 5000 INCREMENT BY 10;

INSERT INTO EMP(EMPNO,ENAME) VALUES (  seq_plus.NEXTVAL ,'�ھ�');

SELECT * FROM EMP;

------INDEX------ >> �����ͺ��̽� �����ڰ� >> ���⼭���� HR
DESC EMP;
select empno, ename, job, rowid from emp;
--ROWID >

SELECT index_name, index_type
FROM user_indexes
WHERE table_name='EMPLOYEES';

--�ӵ� ������~~> �ε���
CREATE INDEX idx_emp_salary ON employees(salary);


SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE salary=3000; 


SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE employee_id=8000; 

commit;






