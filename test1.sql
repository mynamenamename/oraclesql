--아래는 employee 테이블의 출력 결과입니다.


--1. 급여가 2000 이상 3000 이하인 사원의 이름과 사원번호, 입사일, 급여를 출력하되 이름을  오름차순 정렬하세요.


SELECT ENAME, ENO, HIREDATE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 2000 AND SALARY <= 3000
ORDER BY ENAME ASC;



--2.커미션이 NULL 인 사원이름과, 입사일 부서번호를 출력하되 부서번호를 오를차순 정렬하되 부서번호가 같은 항목이 있을 경우 이름을 오름차순으로 정렬하세요.


SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE COMMISSION IS NULL
ORDER BY DNO, ENAME;




--3.커미션이 300 이거나 500 이거나 1400인 사원의 사원번호와 이름, 월급, 커미션을 출력 하되 커미션을 내림차순 정렬하세요 
--IN 연산자를 사용해서 출력 하세요.


SELECT ENO, ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IN (300,500,1400)
ORDER BY COMMISSION DESC;



--4.이름의 첫 글자가 ’S’로 시작하는 사원의 이름을 출력하세요.

SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE 'S%%';


--5.LIKE 연산자와 와일드 카드를 사용해서 '81'년도에 입사하지 않은 사원의 이름과 입사일을 출력하세요.

SELECT ENAME, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE NOT LIKE '81%%';




--6.부서 번호를 중복 제거후 오름차순으로 정렬해서 출력하세요.

SELECT DISTINCT DNO 
FROM EMPLOYEE
ORDER BY DNO;


--7.이름에 ‘A’  와 ‘E’ 를 모두 포함하는 사원의 이름을 출력하세요.

SELECT ENAME
FROM EMPLOYEE
WHERE ENAME LIKE '%A%' AND ENAME LIKE'%E%';



--8.substr 함수를 사용해서 12월 달에 입사한 사원의 사원번호, 이름, 입사일을 출력하세요.

SELECT ENO, ENAME, HIREDATE
FROM EMPLOYEE
WHERE  SUBSTR (TO_CHAR(HIREDATE,'MM'),1,2) =12; 


--9.NVL 함수를 사용해서 사원의 연봉을 계산해서 사원이름, 월급, 커미션 , 연봉을 출력하되 연봉이 많은 순서대로 출력하세요.

--연봉 > NVL(SALARY*12,0) 
--커미션 > NVL(COMMISSION,0)

SELECT ENAME, SALARY, NVL(COMMISSION,0) COMM, NVL(SALARY*12,0)  YEARSAL
FROM EMPLOYEE
ORDER BY NVL(SALARY*12,0) DESC;



--10.NVL2 함수를 사용해서 사원의 연봉을 계산해서 사원이름, 월급, 커미션 , 연봉을 출력하되 연봉이 많은 순서대로 출력하세요.

SELECT ENAME, SALARY, NVL(COMMISSION,0) COMM, NVL2(SALARY*12,SALARY*12,0)  YEARSAL
FROM EMPLOYEE
ORDER BY NVL2(SALARY*12,SALARY*12,0) DESC;


--11.   사원들의 급여 총액 , 평균액, 최고액, 최소액을 출력 하세요. 각 컬럼을 “급여총액”, “평균액, “최고액”, “최소액”으로 별칭이름으로 출력하세요.

SELECT SUM(SALARY) 급여총액,  ROUND(AVG(SALARY)) 평균액, MAX(SALARY)최고액, MIN(SALARY)최소액
FROM EMPLOYEE;


--12. 직업 종류의 갯수를 출력 하세요.  출력컬럼을 “직업 종류의 갯수”로 별칭이름으로 출력 하세요.

SELECT COUNT(DISTINCT JOB) 직업종류의갯수 
FROM EMPLOYEE;



--13.  각 부서별 평균 월급을 구해서 부서번호와 평균 월급을 출력 하되  각각 “부서번호”, “평균월급” 으로 별칭이름으로 출력하세요.

SELECT DNO 부서번호, ROUND(AVG(SALARY)) 평균월급
FROM EMPLOYEE
GROUP BY DNO;


--14.담당 업무가 동일한 사원의 수를 구하시오. (참고 , count 함수 사용)

SELECT JOB, COUNT(*)
FROM EMPLOYEE
GROUP BY JOB;



--15.직급별 사원의 최저 급여를 출력하시오, 관리자를 알수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외 시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력 하세요.
--JOB별 사원의 최저급

SELECT JOB, MIN(SALARY)
FROM EMPLOYEE
WHERE MANAGER IS NOT NULL
GROUP BY JOB
HAVING MIN(SALARY) >= 2000
ORDER BY MIN(SALARY) DESC;



--16.서브 쿼리를 사용해서 사원번호가 7788인 사원과 담당업무가 같은 사원을 출력 하시오  <담당이름, 담당업무> 출력 하시오

--사원번호가 7788인 사원의 담당업무
SELECT JOB FROM EMPLOYEE WHERE ENO=7788;


SELECT ENAME 담당이름, JOB 담당업무
FROM EMPLOYEE
WHERE JOB = (SELECT JOB FROM EMPLOYEE WHERE ENO=7788);

--17. 서브 쿼리를 사용해서 사원번호가 7499 인 사원보다 급여가 많은 사원을 출력 하시오. <사원이름, 담당업무> 출력 하시오.

--사원번호가 7499인 사원의 급여
SELECT SALARY FROM EMPLOYEE WHERE ENO=7499;

SELECT ENAME 사원이름, JOB 담당업무
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE ENO=7499);


--18.서브 쿼리를 사용해서 각 부서의 최소 급여를 받는 사원의 이름 , 급여, 부서번호를 출력하시오.

--각 부서별 최소 급여
SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO;

SELECT ENAME 이름, SALARY 급여, DNO 부서번호
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEE GROUP BY DNO);




--19.   서브 쿼리를 사용해서 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.

--평균급여 
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;

SELECT ENO 사원번호, ENAME 이름
FROM EMPLOYEE
WHERE SALARY > (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE)
ORDER BY SALARY ASC;


--20.서브 쿼리를 사용해서 DEPT 테이블에 있는 부서명 DNAME 컬럼에서  ‘RESEARCH’ 부서의 부서번호, 사원이름 및 담당 업무를 표시하시오.

--research 부서의 부서번호
SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH';


SELECT D.DEPTNO 부서번호, E.ENAME 사원이름, E.JOB 담당업무
FROM EMP E, DEPT D
WHERE E.DEPTNO= D.DEPTNO
    AND E.DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
    
    
    
    
--컬럼 이름 변경 

--research 부서의 부서번호
SELECT DNO FROM DEPT WHERE DNAME = 'RESEARCH';

SELECT D.NO 부서번호, E.ENAME 사원이름, E.JOB 담당업무
FROM EMP E, DEPT D
WHERE E.DNO= D.DNO
    AND E.NO=(SELECT DNO FROM DEPT WHERE DNAME = 'RESEARCH');