-- 1. 다음 dbms 중 기본 사용 포트는 몇 번 인가요
ORACLE : 1521
MS-SQL : 1433
MY-SQL : 3306

-- 2.  오라클 DBMS 에서 아래 보기와 같이 SCOTT 계정에 비밀번호를 'TIGER' 로 변경할 때 쿼리 구문을 생성 하세요. 
ALTER USER SCOTT IDENTIFIED BY TIGER;


-- 3. 오라클 DBMS 에서 아래 보기와 같이 SCOTT 계정을 생성하는 쿼리를 작성하세요. 

   -- 계정명 : SCOTT
   -- 패스워드: 1234
   -- 부여된 롤 (관리권한과 함께 부여, 기본롤) : DBA

CREATE USER SCOTT IDENTIFIED BY 1234;

GRANT CONNECT, DBA, RESOURCE TO SCOTT;



--4. 오라클 DBMS 에서 위에서 생성한 SCOTT 계정의 접속을 생성한 아래를 참고하여  테이블을 생성하는 쿼리를 작성 하시오 .

CREATE TABLE EMP (

  ENO NUMBER(4),
  ENAME VARCHAR2(10),
  JOB VARCHAR2(9),
  MANAGER NUMBER(4),
  HIREDATE DATE,
  SALARY NUMBER(7,2),
  COMMISSION NUMBER(7,2),
  DNO NUMBER(2),
  
CONSTRAINT PK_EMP_ENO PRIMARY KEY (ENO),
CONSTRAINT FK_EMP_DNO FOREIGN KEY (DNO)
REFERENCES DEPT (DNO)

);

CREATE TABLE DEPT(

   DNO NUMBER(2),
   DNAME VARCHAR2(14),
   LOC VARCHAR2(13),
CONSTRAINT PK_DEPT_DNO PRIMARY KEY (DNO)

);





--5. 오라클 DBMS 에서 위에서 생성한 SCOTT 계정의 접속을 생성한 아래를 참고하여  테이블을 생성하는 쿼리를 작성 하시오 .


CREATE TABLE SALG(

GRADE NUMBER,
LOSAL NUMBER,
HISAL NUMBER );

-- 6.아래와 같이 DEPT 테이블의 값을 Insert 하는 쿼리문를 작성 하시오
--( 첫번째 레코드 입력 쿼리만 기술합니다 )
INSERT INTO DEPT (DNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');



--7. 아래와 같이 EMP 테이블의 값을 Insert 하는 쿼리문를 작성 하시오
--( 첫번째 레코드 입력 쿼리만 기술합니다 )
INSERT INTO EMP (ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY,DNO)
VALUES (7369, 'SMITH', 'CLERK', 7902, '80/12/17', 800, 20);


--8. 아래와 같이 SALG 테이블의 값을 Insert 하는 쿼리문를 작성 하시오 .( 첫번째 레코드 입력 쿼리만 기술합니다 )
INSERT INTO SALG (GRADE, LOSAL, HISAL) VALUES (1, 700, 1200);


? 9. DEPT , EMP, SALG 테이블의 모든 내용을 삭제하는 쿼리문을 작성하시오. 

    ?  (delete 문) 사용 :  
    DELETE FROM DEPT;
    DELETE FROM EMP;
    DELETE FROM SALG;
    
    

    ? (truncate 문) 사용 : 
    TRUNCATE TABLE DEPT;
    TRUNCATE TABLE EMP;
    TRUNCATE TABLE SALG;
     





?10. DEPT , EMP, SALG 테이블 삭제 쿼리문을 작성 하세요.

DROP TABLE DEPT;
DROP TABLE EMP;
DROP TABLE SALG;


