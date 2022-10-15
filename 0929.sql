-- �������
/*
   �̸�         name       varchar2(10) 
   �ֹι�ȣ     jumin      char(15)
   ��ȭ��ȣ     tel        varchar2(20)
   ����        gender      varchar2(10)
   ����        age         number(3)
   �����      home        varchar2(20)

*/

--CREATE TABLE table_name ( [column_name data_type] );

CREATE TABLE info_tab
(
   name       varchar2(10),
   jumin      char(15),
   tel        varchar2(20),
   gender      varchar2(10),
   age         number(3),
   home        varchar2(20)
   
);

--���̺� ����Ȯ��
DESC info_tab;

--������ Ȯ��
SELECT * FROM info_tab;

/* ���̺�� : student_score

�й�       id         char (4)             --���ڿ���
�л���     name       varchar2 (20)
����       kor        number(3)
����       eng        number(3)
����      total       number               --����Ʈ : 10�ڸ�
���       avg        numer(5,2)           --���ڸ��� ��ü�ڸ���!! �����ϱ�


*/

CREATE TABLE student_score
(

id         char (4),
name       varchar2 (20),
kor        number(3),
eng        number(3),
total      number,
avg        number(5,2)

);

--���̺� ����Ȯ��
DESC student_score;

--������ Ȯ��
SELECT * FROM student_score;

--DROP TABLE table_name [CASCADE CONSTRAINT];

DROP TABLE student_score;

DESC student_score;

-- ���� �÷� �߰�
--ALTER TABLE table_name ADD ( [ column_name data_type ] );
-- ��ġ�� �ű� �� ����

ALTER TABLE student_score ADD(math number(3));

--���� �÷� ����
-- ALTER TABLE table_name DROP ( [ column_name ] );
ALTER TABLE student_score DROP (TOTAL);


--��� �÷����� �Ҽ��� 1�ڸ��� ����
--ALTER TABLE table_name MODIFY ( [ column_name data_type ] );
ALTER TABLE student_score MODIFY( AVG NUMBER(4,1));


--������ �Է�
--INSERT INTO table_name( column_names ) VALUES ( values );
-- ���� : ' '
-- 

INSERT INTO student_score( id,name,kor,eng ) 
VALUES ( '0001','ȫ�浿',50,80 );

--������ Ȯ��
SELECT * FROM student_score;

--2000�� �й��� ȫ������ ����� ���������� ���� 60, 90������ �����ϼ���

INSERT INTO student_score( id,name,kor,eng ) 
VALUES ( '2000','ȫ����',60,90 );

COMMIT;
ROLLBACK;

--1000�� �л� ȫ��� ������ ����
INSERT INTO student_score( id,name,kor,eng ) 
VALUES ( '3000','ȫ���',60,90 );
SELECT * FROM student_score;

--�̸��� ȫ����� �л��� ���ڵ带 ����
--DELETE FROM table_name WHERE condition;
DELETE FROM student_score WHERE (name='ȫ���');

-- 0001�� �л��� ���������� 100������ �����ϱ�
--UPDATE table_name SET column=value WHERE condition;
UPDATE student_score SET kor=100 WHERE (id='0001');
SELECT * FROM student_score;

commit;

-- ȫ������ ���������� 90������ �Է��ϼ���   // insert�� �ƴϴ�! �����ϱ���
--UPDATE table_name SET column=value WHERE condition;
UPDATE student_score SET math=90 WHERE name='ȫ����';
SELECT * FROM student_score;

--�л����� ��� ���ϱ�
UPDATE student_score
SET avg= (kor+ eng+ nvl(math,0))/3 ;
--WHERE ��������
--nvl >> null�� 0���� ��ġ


CREATE TABLE emp_copy
AS SELECT * FROM emp;

DESC emp_copy;

SELECT * FROM emp_copy;
/*
[ �������� ] emp ��ü emp_copy ���纻 ���̺� ���� ��

1. �����ȣ�� 7788�� ����� �μ��� 10������ ����

2. �����ȣ�� 7782�� ����� �̸��� ȫ������� �����ϰ� �޿��� 3500���� ����

3. ��� �μ����� ���ʽ��� 300�� �λ� ����

4. �����ȣ�� 7499�� ����� ������ ����

5. �Ի����ڰ� 81�� 6�� 1�� ������ ����� ������ ����

*/
--1.
UPDATE emp_copy SET deptno=10 WHERE empno=7788;
SELECT * FROM emp_copy;
--2.
UPDATE emp_copy SET sal=3500 WHERE empno=7782;
UPDATE emp_copy SET ename='ȫ���' WHERE empno=7782;
--sal=3500,ename= 'ȫ���' ���� �ᵵ ��
--3.
UPDATE emp_copy SET comm= nvl(comm,0)+ 300 ;

--4.
DELETE FROM emp_copy WHERE empno=7499;
--5.
DELETE FROM emp_copy WHERE hiredate<'81/06/01';


commit;
rollback;

commit;

SELECT * FROM emp_copy;

commit;

delete from emp_copy;


rollback;


truncate table emp_copy;

rollback;












