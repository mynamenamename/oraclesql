-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력
SELECT  ename, sal, sal/12, round(sal/12, -1) as wolgub
FROM  emp;

-- 사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
SELECT  ename, sal, sal*0.033, trunc(sal*0.033,-1) as tax
FROM  emp;

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력

SELECT empno, ename, LOWER(job) as job
FROM   emp
WHERE ename = 'SMITH';
--WHERE ename = UPPER('smith');
--WHERE lower(ename) = 'SMITH';
--WHERE lower(ename) = lower('SMITH');

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력

SELECT  empno, INITCAP(ename) as ename, INITCAP(job) as job
FROM emp;

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬

select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;
--between > 포함이 안되어서 못쓴다


-- 이름이 5글자 이상인 사원들을 출력

SELECT *
FROM   emp
WHERE  LENGTH (ename) >= 5;


-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다

SELECT RPAD (ename, 15, '*')
FROM   emp;



-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다

SELECT LPAD (sal, 10, '-')
FROM   emp;

-- info_tab
select name, substr(jumin,8,1) as gender, substr(jumin,1,2) as birth
from info_tab;

select '-' || trim(' 이순신 ') || '-' as col1, 
       '-' || ltrim(' 이순신 ') || '-' as col2, 
       '-' || rtrim(' 이순신 ') || '-' as col3
from dual;

SELECT sysdate
FROM  dual; 
--가상테이블 dual 오라클에만 잇음

-- 급여를 숫자에서 ‘영일이삼사오육칠팔구’ 글자로 대체
SELECT sal, translate(sal, '0123456789', '영일이삼사오육칠팔구') as kor
FROM emp; 


-- 급여의 숫자에서 0을 ‘$’로 바꾸어 출력
SELECT sal, replace(sal,0,'$') as char_sal
FROM emp;


--------*****많이사용!! 안쪽공백까지 제거
SELECT replace('        이   순   신           ', ' ' ,'') as ename
FROM dual;
--------------------------------------


-- 현재까지 근무일 수가 많은 사람 순으로 출력

SELECT ename, hiredate, sysdate - Nvl(hiredate,sysdate),
       ceil(sysdate - Nvl(hiredate,sysdate))
FROM  emp
ORDER BY sysdate - hiredate desc;

SELECT ename, hiredate
FROM  emp
ORDER BY sysdate - hiredate desc NULLS LAST;



-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력


select ename, sysdate-hiredate, 
     trunc((sysdate-hiredate)/7,0) as weeks,
     floor(mod(sysdate-hiredate,7)) as days
from emp;




-- 10번 부서의 사원의 현재까지의 근무 월수를 계산 


SELECT ename, floor(months_between(sysdate,hiredate)) as month
FROM  emp
WHERE deptno = 10;
--내려주는게 낫다


-- 현재 날짜에서 3개월 후의 날짜 구하기

select add_months( sysdate, 3 ) as mydate 
from dual;


-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기

select next_day( sysdate, 2 ) 
from dual;


select next_day( sysdate, '월') 
from dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기

SELECT  LAST_DAY(sysdate)
FROM  dual;

-- 입사일자에서 입사년도를 출력

SELECT  ename, hiredate, to_char(hiredate, 'YYYY') as hire_year
FROM emp;


-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
SELECT  ename, hiredate, to_char(hiredate, 'YYYY"년" MM"월" DD"일"') as hire_date
FROM emp;

-- 1981년도에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY')= 1981;
--like는 문자열만 가넝

-- 5월에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate,'mm')= 05;

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력

SELECT ename, sal, to_char(sal,'$999,999,999,999') as dollar
from emp;
--넉넉하게 숫자 찍기

--81년 2월에 입사한 사원 검색
SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY-MM')= '1981-02';


--81년에 입사하지 않은 사원 검색
SELECT *
FROM emp
WHERE NOT to_char(hiredate,'YYYY')=  1981;
--WHERE  to_char(hiredate,'YYYY') !=  1981;

--81년 하반기에 입사한 사원 검색

SELECT *
FROM emp
WHERE to_char(hiredate,'YYYY-MM') between '1981-07' and '1981-12';
--between은 값 포함 된다!!

--where To_char(hiredate,'yyyy-mm') >= '1981-07' and
--      To_char(hiredate,'yyyy-mm') < '1982-01'


-- 주민번호에서 성별 구하기

SELECT jumin, decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자') AS gender
FROM info_tab;


SELECT jumin, CASE substr( jumin, 8, 1)  
   WHEN '1' THEN '남자'
   WHEN '3' THEN '남자'
   ELSE '여자'
   END as gender
FROM info_tab;

--둘다 사용함


-- 부서번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력

--1

SELECT deptno, decode( deptno, 10, '영업부', 20, '관리부', 30, 'IT부', '기술부') AS part
FROM emp;
--문자 숫자 구분 잘하기


--2
SELECT deptno, CASE deptno
   WHEN 10 THEN '영업부'
   WHEN 20 THEN '관리부'
   WHEN 30 THEN 'IT부'
   ELSE '기술부'
   END as part
FROM emp;



-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우
--사원번호, 사원명, 업무, 급여, 증가한 급여를 출력

--1
SELECT empno, ename, job, sal, decode(job, 'ANALYST', sal*1.1, 'CLERK', sal*1.15, 'MANAGER', sal*1.2) AS change
FROM emp;


--2

SELECT empno, ename, job, sal, CASE job 
    WHEN 'ANALYST' THEN sal*1.1
    WHEN 'CLERK' THEN  sal*1.15
    WHEN 'MANAGER' THEN sal*1.2
    ELSE sal
    END as change
FROM emp;


-------------------------------------------

select all job from emp;

select distinct job from emp;
--중복 제거

desc emp;
select rownum, empno, ename, job from emp;
--rownum >> 가상컬럼 숫자 
select rownum, empno, ename, job from emp 
where rownum<=5;

-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기
SELECT  avg(sal) as avg, sum(sal) as sum, min(sal) as min, max(sal) as max
FROM  emp
WHERE job= 'SALESMAN';
--null값 있어도 그냥 계산 해줌

INSERT INTO emp(empno,ename,job)
VALUES(9001,'홍길국','SALESMAN');

-- 커미션(COMM)을 받는 사람들의 수는
SELECT count(comm)
FROM emp
WHERE comm>0;


-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
SELECT deptno, count(*),round(avg(sal),-2), min(sal), max(sal), sum(sal)
FROM  emp
--WHERE
GROUP BY deptno;
--HAVING
--그룹바이 컬럼만 올수 있당 select에
--출력> where , groupby > having


-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 ( 부서별 급여의 합이 높은 순으로)

SELECT deptno, count(*),round(avg(sal),-2), min(sal), max(sal), sum(sal)
FROM  emp
--WHERE
GROUP BY deptno
ORDER BY sum(sal) desc;

-- 부서별 업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기

SELECT deptno, job, count(deptno), avg(sal), sum(sal)
FROM  emp
--WHERE
GROUP BY deptno, job;




-- 최대 급여가 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 출력

SELECT deptno, round(avg(sal),-2), sum(sal)
FROM  emp
HAVING max(sal) >=2900
GROUP BY deptno;






-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력

SELECT job, round(avg(sal),-2), sum(sal)
FROM  emp
HAVING avg(sal) >=3000
GROUP BY job;



-- 전체 합계 급여가 5000를 초과하는 각 업무에 대해서 업무와 급여 합계를 출력
--단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬


SELECT job, sum(sal)
FROM  emp
WHERE job != 'SALESMAN'
HAVING sum(sal) >5000
GROUP BY job
ORDER BY sum(sal) desc;




-- 업무별 최고 급여와 최소 급여의 차이를 구하라


SELECT job, max(sal), min(sal), max(sal)-min(sal)
FROM  emp
GROUP BY job;





-- 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력


SELECT deptno, count(deptno), sum(sal)
FROM  emp
HAVING count(deptno) >= 4
GROUP BY deptno;


