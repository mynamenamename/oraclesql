--=====================================================



--# HR ��������



--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )

--ǥ��ȭ
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME
from employees e right outer join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.last_name= 'King';
 
--���� ���
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME
from employees e, departments d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
      and e.last_name= 'King';



--2. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )


--ǥ��ȭ
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_ID
from employees e inner join departments d 
      on e.DEPARTMENT_ID = d.DEPARTMENT_ID
      inner join jobs j
      on e.JOB_ID = j.JOB_ID
where e.last_name= 'King';

--���� ���
select e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_ID
from employees e, departments d , jobs j
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
     and e.JOB_ID= j.JOB_ID
     and e.last_name= 'King';
 

--����� Ǯ��

-- 3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���
-- (*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
select e.employee_id as ��� , e.first_name||' '||e.last_name as �̸�, e.hire_date as �Ի���,
       d.department_name as �μ���
from employees e full outer join departments d
on e.department_id = d.department_id
where to_char(e.HIRE_DATE,'YYYY/MM') BETWEEN '2007/01' and '2007/06';

-- 4.'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���
-- (*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
select e1.first_name||' '||e1.last_name as �̸�, e2.first_name||' '||e2.last_name as ����̸�
from employees e1 left outer join departments d
                on e1.department_id = d.department_id 
                FULL OUTER join employees e2
                on e1.manager_id = e2.employee_id
where d.department_name like 'Executive';

------------------------�Ի繮��-----------------------------------------------

--SQL-����-1) �Ʒ� ��Ű���� ���� ������ 3.0 �̻��� �л����� �̸��� �����ִ� SQL�ۼ��Ͻÿ�

--<��Ű��>

--�� ����ģ �Ӽ��� �⺻Ű(Primary Key)�̸� ENROLL�� �й��� STUDENT�� �й��� �����ϴ� �ܷ�Ű(Foreign Key)�̰�, ENROLL�� ���¹�ȣ�� CLASS�� ���¹�ȣ�� �����ϴ� �ܷ�Ű�̴�. 

 

--STUDENT(�й� , �а�, �̸�) 

--CLASS(���¹�ȣ, �ð�, �����̸�) 

--ENROLL(�й�, ���¹�ȣ, ����)


SELECT s.�̸�
FROM student s, class c, enroll e
WHERE s.�й�=e.�й�
and   c.���¹�ȣ=e.���¹�ȣ
and  e.���� >= 3.0;

--select s.�̸�
--from student s left join enroll e
--on s.�й� = e.�й�
--left join class c
--on e.���¹�ȣ = c.���¹�ȣ
--where e.����>=3.0;


--SQL-����-2) ���� �� �Ʒ��� ���� ���̺��� Full Outer Join�� ����� �ۼ��Ͻÿ�

--<DEPT>

--<EMP>


--���ļ� �� ���´� 
--DEPTNO DNAME
--------------------
2��
DEPTNO DNAME
--------------------
30 SALES
NULL NULL
10 RESERCH
