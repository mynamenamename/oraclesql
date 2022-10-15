

------VIEW------

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp;
           
SELECT * FROM v_emp;

DESC v_emp;

INSERT INTO V_EMP VALUES (1000, '홍길동', 20);
SELECT * FROM EMP;
--가상에 입력해도 원본에도 입력됨

INSERT INTO V_EMP VALUES (1000, '홍홍이', 20); --안됨 1000 겹쳐서
INSERT INTO V_EMP VALUES (2000, '홍홍이', 90); --외래키에 걸림 90 부서 없음

--원본이 훼손되니까 뷰는 읽기전용으로 많이 만듬! 원래가 아니고 

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
           WITH READ ONLY;
           
INSERT INTO V_EMP VALUES (2000, '홍홍이', 30);           


--(1) updatable 뷰
--[ 연습 ] EMP 테이블에서 30번 부서만 
--EMPNO를 EMP_NO로 ENAME을 NAME로 SAL를 SALARY로 바꿔서 
--EMP_30 뷰를 생성하시오

CREATE OR REPLACE VIEW V_EMP_30  AS
           select empno EMP_NO, ename NAME, sal SALARY 
           from emp 
           WHERE deptno=30
           WITH READ ONLY;
                 
SELECT * FROM V_EMP_30;


--(3) 복합뷰
--조인 매번 하기 힘드니 ,,, 우리는 프로젝트에서 안쓴다 ㅋㅋ 
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

INSERT INTO V_EMP_INFO(EMPNO, ENAME, DNAME) VALUES (3333,'맹꽁이', 30); --안됨
INSERT INTO V_EMP_INFO(EMPNO, ENAME) VALUES (3333,'맹꽁이'); --됨

DELETE FROM V_EMP_INFO WHERE EMPNO=7788; --여기서 지웠는데 원본도 지워짐 무조건 읽기전용으로

SELECT * FROM V_EMP_INFO;
SELECT * FROM EMP;

--[ 연습 ] 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하여라.
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
VALUES(4444,'호이',9000,20);  --원본이 바뀌면 VIEW도 바뀐다!


------SEQUENCE------

CREATE  SEQUENCE   seq_temp;

SELECT seq_temp.NEXTVAL FROM DUAL; --하나씩 증가

SELECT seq_temp.currVAL FROM DUAL; --NEXTVAL 한번이라도 해야 가능 현재값 

--5000번 부터 10씩 증가하는 자동증가수(시퀀스)

CREATE SEQUENCE seq_plus
START WITH 5000 INCREMENT BY 10;

INSERT INTO EMP(EMPNO,ENAME) VALUES (  seq_plus.NEXTVAL ,'박씨');

SELECT * FROM EMP;

------INDEX------ >> 데이터베이스 관리자가 >> 여기서부터 HR
DESC EMP;
select empno, ename, job, rowid from emp;
--ROWID >

SELECT index_name, index_type
FROM user_indexes
WHERE table_name='EMPLOYEES';

--속도 빨라짐~~> 인덱스
CREATE INDEX idx_emp_salary ON employees(salary);


SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE salary=3000; 


SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE employee_id=8000; 

commit;






