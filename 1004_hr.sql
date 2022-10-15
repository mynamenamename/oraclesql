

--1. 2003년에 입사한 사원들의 사번, 이름, 입사일을 출력

SELECT  employee_id,concat(first_name,last_name) as fullname, hire_date
FROM employees
WHERE to_char(hire_date,'YYYY')= 2003;




--2. 업무가 FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP 인 사원들의 정보를 출력

SELECT *
FROM employees
WHERE job_id in ('FI_ACCOUNT', 'FI_MGR', 'SA_MAN', 'SA_REP');



--3. 커미션을 받는 사원들의 명단을 출력

SELECT *
FROM employees
WHERE COMMISSION_PCT is not null;


--4.업무가 SA_MAN 또는 SA_REP이면 "판매부서"를 그 외는 "그 외 부서"라고 출력

SELECT JOB_ID, decode( JOB_ID, 'SA_MAN', '판매부서', 'SA_REP', '판매부서', '그 외 부서') AS buseo
FROM employees;



--5. 연도별로 입사자들의 최소급여, 최대 급여, 급여의 총합 그리고 평균 급여를 구하시오

SELECT to_char(hire_date,'YYYY'), min(salary), max(salary), sum(salary), round(avg(salary),-2)
FROM employees
GROUP BY to_char(hire_date,'YYYY')
ORDER BY to_char(hire_date,'YYYY');




--6. 부서별 평균 급여가 $10,000 이상인 부서만 구하시오. ( 평균급여가 높은 순으로 )

SELECT round(avg(salary),-2), department_id
FROM employees
GROUP BY department_id
HAVING avg(salary) >=10000
ORDER BY avg(salary) desc;


--7. 부서별 최대 급여를 구하시오

SELECT department_id, max(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

---------------------------------------------------------------

--###### 오라클 정규식 표현

--# 아래와 같이 테이블을 생성하고 레코드를 입력한 후

--# REGEXP_LIKE  외에 REGEXP_REPALCE, REGEXP_INSTR, REGEXP_SUBSTR, REGEXP_COUNT 함수도 있음 그러나 아래의 예문은 regexp_like 함수를 이용하여도 무방함.

CREATE TABLE reg_tab( text varchar2(20) );

-- 레코드 입력

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

INSERT INTO reg_tab VALUES('개');

INSERT INTO reg_tab VALUES('cat');

INSERT INTO reg_tab VALUES('catty');

INSERT INTO reg_tab VALUES('9catty');

INSERT INTO reg_tab VALUES('catwoman');

INSERT INTO reg_tab VALUES('고양이');

INSERT INTO reg_tab VALUES('BAT');

INSERT INTO reg_tab VALUES('BATMAN');

INSERT INTO reg_tab VALUES('BATGIRL'); 

INSERT INTO reg_tab VALUES('0BATGIRL'); 

INSERT INTO reg_tab VALUES('박쥐');

?

-- 커밋

COMMIT;

[ 문제 ]

?

-- 1.  text 컬럼의 문자열에서 't'로 시작하는 데이터 검색



select *
from reg_tab
--where substr(lower(text),1,1) = 't';
where substr(text,1,1) = 't';

select *
from reg_tab
where regexp_like (text, '^t');



-- 2.  text 컬럼의 문자열에서 't'로 끝나는 데이터 검색

select *
from reg_tab
--where substr(lower(text),-1,1) = 't';
where substr(text,-1,1) = 't';
?
select *
from reg_tab
where regexp_like (text, 't$');

?

-- 3. 첫번째 't'로 시작하여 5번째 'r'이 있는 데이터 검색


select *
from reg_tab
--where substr(lower(text),1,1) = 't' and substr(lower(text),5,1) = 'r';
where substr(text,1,1) = 't' and substr(text,5,1) = 'r';


select *
from reg_tab
where regexp_like (text, '^t|r');

?

-- 4. 숫자로 끝나는 데이터 검색

select *
from reg_tab
where regexp_like (text, '[0-9]$');

?

-- 5. 숫자로 시작하는 데이타 검색

select *
from reg_tab
where regexp_like (text, '^[0-9]');


?

-- 6. 숫자가 아닌 문자로 시작하는 데이터 검색

select *
from reg_tab
where not regexp_like (text, '^[0-9]');


?

-- 7. 대문자로 시작하는 데이터 검색

select *
from reg_tab
where regexp_like (text, '^[A-Z]', 'c');



-- 8. 소문자 외의 문자로 시작하는 데이터 검색

select *
from reg_tab
where not regexp_like (text, '^[a-z]','c');
?

-- 9. 한글로 시작하는 데이터 검색

select *
from reg_tab
where regexp_like (text, '^[가-히]');

?
-- 10. 데이터 중 'gg'나 'GG'가 들어있는 데이터 검색


select *
from reg_tab
where regexp_like (text, 'gg|GG');
--where regexp_like (text, gg, 'I');