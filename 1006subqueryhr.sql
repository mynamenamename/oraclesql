--1. Zlotkey�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�. 
-- Zlotkey�� �����Ͻʽÿ�.

--Zlotkey�� �μ� ���ϱ�
select department_id  from employees where LAST_NAME='Zlotkey';
 
select concat(e.first_name,e.last_name), e.hire_date
from employees e, departments d
where e.department_id=d.department_id
and d.department_id =  (select department_id  from employees where LAST_NAME='Zlotkey')
    and not e.LAST_NAME= 'Zlotkey';  


--2. �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� 
--   ����� �޿��� ���� ������������ �����Ͻʽÿ�.

-- ��� �޿� 
select round(avg(salary)) from employees;


select employee_id, concat(first_name,last_name) name
from employees 
where salary > (select round(avg(salary)) from employees)
order by salary desc;




--3. �̸��� u�� ���Ե� ����� ���� �μ����� ���ϴ� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ�
-- ���Ǹ� �ۼ��Ͻʽÿ�.

--�̸��� u ���Ե� ����� �μ�
select department_id from employees where concat(first_name,last_name) like '%u%';


select employee_id, concat(first_name,last_name) name
from employees 
where department_id in (select department_id from employees where concat(first_name,last_name) like '%u%');




--4. �μ� ��ġ ID�� 1700�� ��� ����� �̸�, �μ� ��ȣ �� ���� ID�� ǥ���Ͻʽÿ�.


select concat(e.first_name,e.last_name) name, e.department_id, e.job_id
from employees e, departments d
where e.department_id=d.department_id 
and d.location_id =1700;



?

--5. King���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���Ͻʽÿ�.
--king�� ���

SELECT   CONCAT(FIRST_NAME,LAST_NAME) �̸�, SALARY
FROM     EMPLOYEES
WHERE    MANAGER_ID=100;




SELECT CONCAT(E1.first_name,E2.last_name) NAME, E1.SALARY
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
AND E2.LAST_NAME IN (SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE 'King');




--6. Executive �μ��� ��� ����� ���� �μ� ��ȣ, �̸� �� ���� ID�� ǥ���Ͻʽÿ�.

--Executive �μ��� �μ���ȣ
select department_id from departments where department_name like 'Executive';



select e.department_id, concat(e.first_name,e.last_name) name, e.job_id
from employees e,departments d
where e.department_id=d.department_id
   and d.department_id = (select department_id from departments where department_name like 'Executive');




?

--7. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� 
--��� ����� ��� ��ȣ, �̸� �� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�.

--��ձ޿�
select round(avg(salary)) from employees;

--�̸��� u���Ե� ����� �μ���ȣ
select department_id from employees where concat(first_name,last_name) like '%u%';

select employee_id, concat(first_name,last_name) as name, salary
from employees
where salary > (select round(avg(salary)) from employees) and
      department_id in (select department_id from employees where concat(first_name,last_name) like '%u%');



