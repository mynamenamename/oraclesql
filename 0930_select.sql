
/*
 SELECT 검색할 항목들
 FROM   테이블명
 WHERE  조건 ;
*/


-- 모든 사원의 사원명과 급여, 급여와 보너스를 더한 합계 출력
SELECT   ename, sal,  sal+nvl(comm,0) AS totl_sal  --연산자, 함수 하나라도 추가되면 별칭 습관들이기 as 생략가넝
FROM         emp;
--WHERE 모든 사원이라 필요없음

SELECT ename||' '||job AS staff
FROM    emp;
--ename + job  >> || 기호로 표현

SELECT distinct job FROM emp;
--중복값 없애기

-- 1- 20번 부서에서 근무하는 사원의 사원번호, 이름, 부서번호 출력
SELECT     empno,ename,deptno
FROM           emp
WHERE      deptno=20;

-- 2- 입사일이 81/01/01에서 81/06/09인 사원의 사원번호, 이름, 입사일을 출력

SELECT    empno,ename,hiredate
FROM           emp
WHERE        hiredate between '81/01/01' and '81/06/09';
--WHERE        hiredate>= '81/01/01' <= '81/06/09';      포함여부 확인하기

-- 3- 담당업무가 salesman, clerk인 사원들의 이름과 업무를 출력

SELECT ENAME,JOB
FROM    EMP
WHERE   JOB ='SALESMAN' OR JOB='CLERK';
--WHERE JOB = upper('salesman') OR JOB=upper('clerk') ;
--WHERE JOB IN ('SALESMAN','CLERK');

-- 4- 업무가 president이고 급여가 1500이상이거나 업무가 salesman인 사원의 정보를 출력

SELECT *
FROM EMP
WHERE (JOB='PRESIDENT' AND SAL>=1500) OR JOB='SALESMAN';

--괄호처리 하기! and가 우선순위 높음
-- 5- 업무가 president 또는 salesman이고 급여가 1500이상인 사원의 정보를 출력

SELECT *
FROM EMP
WHERE (JOB='PRESIDENT' OR JOB='SALESMAN') AND SAL>=1500;



-- 6- 커미션(comm)이 없는 사원의 이름, 급여, 커미션을 출력


SELECT    ename,sal,comm
FROM           emp
WHERE        comm is null or comm = 0;
-- comm= 0인 경우 빼먹으면 안됨!!

--  7- 사원명, 급여, 커미션, 총급여( 급여 + 커미션)을 출력
SELECT   ename, sal,  sal+nvl(comm,0) AS totl_sal  
FROM         emp;



-- 8- 이름 A로 시작하는 사원명 출력

SELECT   ename
FROM      emp
WHERE   ename like 'A%';



-- 9- 이름이 두번째 문자가 L인 사원명 출력

SELECT   ename
FROM      emp
WHERE   ename like '_L%';


-- 10- 이름에 L이 두 번 이상 포함된 사원명 출력
--  %LL% 하면 LoL >> 안걸림 
SELECT   ename
FROM      emp
WHERE   ename like '%L%L%';



-- 11- 커미션(COMM)이 NULL이 아닌 사원의 모든 정보를 출력

SELECT         *
FROM           emp
WHERE        comm is NOT null;


-- 12- 보너스가 급여보다 10%이상 많은 모든 사원에 대해 이름, 급여, 보너스를 출력

select ename, sal, comm
from emp
where comm>= (sal*1.1);


-- 13- 업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000이 아닌 모든 사원의 정보를 출력

select *
from emp
where (job= 'CLERK' or job= 'ANALYST') and sal != 1000 and sal != 3000 and sal != 5000;
--WHERE   job in ('CLERK','ANALYST') AND sal not in(1000,3000,5000);


-- 14- 부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력

SELECT *
FROM EMP
WHERE DEPTNO =30 OR MGR=7782;
