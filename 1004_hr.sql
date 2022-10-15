

--1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���

SELECT  employee_id,concat(first_name,last_name) as fullname, hire_date
FROM employees
WHERE to_char(hire_date,'YYYY')= 2003;




--2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���

SELECT *
FROM employees
WHERE job_id in ('FI_ACCOUNT', 'FI_MGR', 'SA_MAN', 'SA_REP');



--3. Ŀ�̼��� �޴� ������� ����� ���

SELECT *
FROM employees
WHERE COMMISSION_PCT is not null;


--4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���

SELECT JOB_ID, decode( JOB_ID, 'SA_MAN', '�Ǹźμ�', 'SA_REP', '�Ǹźμ�', '�� �� �μ�') AS buseo
FROM employees;



--5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�

SELECT to_char(hire_date,'YYYY'), min(salary), max(salary), sum(salary), round(avg(salary),-2)
FROM employees
GROUP BY to_char(hire_date,'YYYY')
ORDER BY to_char(hire_date,'YYYY');




--6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )

SELECT round(avg(salary),-2), department_id
FROM employees
GROUP BY department_id
HAVING avg(salary) >=10000
ORDER BY avg(salary) desc;


--7. �μ��� �ִ� �޿��� ���Ͻÿ�

SELECT department_id, max(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

---------------------------------------------------------------

--###### ����Ŭ ���Խ� ǥ��

--# �Ʒ��� ���� ���̺��� �����ϰ� ���ڵ带 �Է��� ��

--# REGEXP_LIKE  �ܿ� REGEXP_REPALCE, REGEXP_INSTR, REGEXP_SUBSTR, REGEXP_COUNT �Լ��� ���� �׷��� �Ʒ��� ������ regexp_like �Լ��� �̿��Ͽ��� ������.

CREATE TABLE reg_tab( text varchar2(20) );

-- ���ڵ� �Է�

INSERT INTO reg_tab VALUES('TIGER');

INSERT INTO reg_tab VALUES('TIGGER');

INSERT INTO reg_tab VALUES('elephant');

INSERT INTO reg_tab VALUES('tiger');

INSERT INTO reg_tab VALUES('tiger2');

INSERT INTO reg_tab VALUES('tiger3');

INSERT INTO reg_tab VALUES('doggy');

INSERT INTO reg_tab VALUES('5doggy');

INSERT INTO reg_tab VALUES('DOG');

INSERT INTO reg_tab VALUES('DOG2');

INSERT INTO reg_tab VALUES('��');

INSERT INTO reg_tab VALUES('cat');

INSERT INTO reg_tab VALUES('catty');

INSERT INTO reg_tab VALUES('9catty');

INSERT INTO reg_tab VALUES('catwoman');

INSERT INTO reg_tab VALUES('�����');

INSERT INTO reg_tab VALUES('BAT');

INSERT INTO reg_tab VALUES('BATMAN');

INSERT INTO reg_tab VALUES('BATGIRL'); 

INSERT INTO reg_tab VALUES('0BATGIRL'); 

INSERT INTO reg_tab VALUES('����');

?

-- Ŀ��

COMMIT;

[ ���� ]

?

-- 1.  text �÷��� ���ڿ����� 't'�� �����ϴ� ������ �˻�



select *
from reg_tab
--where substr(lower(text),1,1) = 't';
where substr(text,1,1) = 't';

select *
from reg_tab
where regexp_like (text, '^t');



-- 2.  text �÷��� ���ڿ����� 't'�� ������ ������ �˻�

select *
from reg_tab
--where substr(lower(text),-1,1) = 't';
where substr(text,-1,1) = 't';
?
select *
from reg_tab
where regexp_like (text, 't$');

?

-- 3. ù��° 't'�� �����Ͽ� 5��° 'r'�� �ִ� ������ �˻�


select *
from reg_tab
--where substr(lower(text),1,1) = 't' and substr(lower(text),5,1) = 'r';
where substr(text,1,1) = 't' and substr(text,5,1) = 'r';


select *
from reg_tab
where regexp_like (text, '^t|r');

?

-- 4. ���ڷ� ������ ������ �˻�

select *
from reg_tab
where regexp_like (text, '[0-9]$');

?

-- 5. ���ڷ� �����ϴ� ����Ÿ �˻�

select *
from reg_tab
where regexp_like (text, '^[0-9]');


?

-- 6. ���ڰ� �ƴ� ���ڷ� �����ϴ� ������ �˻�

select *
from reg_tab
where not regexp_like (text, '^[0-9]');


?

-- 7. �빮�ڷ� �����ϴ� ������ �˻�

select *
from reg_tab
where regexp_like (text, '^[A-Z]', 'c');



-- 8. �ҹ��� ���� ���ڷ� �����ϴ� ������ �˻�

select *
from reg_tab
where not regexp_like (text, '^[a-z]','c');
?

-- 9. �ѱ۷� �����ϴ� ������ �˻�

select *
from reg_tab
where regexp_like (text, '^[��-��]');

?
-- 10. ������ �� 'gg'�� 'GG'�� ����ִ� ������ �˻�


select *
from reg_tab
where regexp_like (text, 'gg|GG');
--where regexp_like (text, gg, 'I');