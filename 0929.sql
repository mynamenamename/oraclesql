-- 구조잡기
/*
   이름         name       varchar2(10) 
   주민번호     jumin      char(15)
   전화번호     tel        varchar2(20)
   성별        gender      varchar2(10)
   나이        age         number(3)
   출신지      home        varchar2(20)

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

--테이블 구조확인
DESC info_tab;

--데이터 확인
SELECT * FROM info_tab;

/* 테이블명 : student_score

학번       id         char (4)             --문자열로
학생명     name       varchar2 (20)
국어       kor        number(3)
영어       eng        number(3)
총점      total       number               --디폴트 : 10자리
평균       avg        numer(5,2)           --앞자리는 전체자리수!! 주의하기


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

--테이블 구조확인
DESC student_score;

--데이터 확인
SELECT * FROM student_score;

--DROP TABLE table_name [CASCADE CONSTRAINT];

DROP TABLE student_score;

DESC student_score;

-- 수학 컬럼 추가
--ALTER TABLE table_name ADD ( [ column_name data_type ] );
-- 위치는 옮길 수 없음

ALTER TABLE student_score ADD(math number(3));

--총점 컬럼 삭제
-- ALTER TABLE table_name DROP ( [ column_name ] );
ALTER TABLE student_score DROP (TOTAL);


--평균 컬럼에서 소수점 1자리로 변경
--ALTER TABLE table_name MODIFY ( [ column_name data_type ] );
ALTER TABLE student_score MODIFY( AVG NUMBER(4,1));


--데이터 입력
--INSERT INTO table_name( column_names ) VALUES ( values );
-- 문자 : ' '
-- 

INSERT INTO student_score( id,name,kor,eng ) 
VALUES ( '0001','홍길동',50,80 );

--데이터 확인
SELECT * FROM student_score;

--2000번 학번인 홍길자의 국어와 영어점수를 각각 60, 90점으로 저장하세요

INSERT INTO student_score( id,name,kor,eng ) 
VALUES ( '2000','홍길자',60,90 );

COMMIT;
ROLLBACK;

--1000번 학생 홍길숙 정보를 저장
INSERT INTO student_score( id,name,kor,eng ) 
VALUES ( '3000','홍길숙',60,90 );
SELECT * FROM student_score;

--이름이 홍길숙인 학생의 레코드를 삭제
--DELETE FROM table_name WHERE condition;
DELETE FROM student_score WHERE (name='홍길숙');

-- 0001번 학생의 국어점수를 100점으로 수정하기
--UPDATE table_name SET column=value WHERE condition;
UPDATE student_score SET kor=100 WHERE (id='0001');
SELECT * FROM student_score;

commit;

-- 홍길자의 수학점수를 90점으로 입력하세요   // insert가 아니다! 수정하기임
--UPDATE table_name SET column=value WHERE condition;
UPDATE student_score SET math=90 WHERE name='홍길자';
SELECT * FROM student_score;

--학생들의 평균 구하기
UPDATE student_score
SET avg= (kor+ eng+ nvl(math,0))/3 ;
--WHERE 빠져도됨
--nvl >> null값 0으로 대치


CREATE TABLE emp_copy
AS SELECT * FROM emp;

DESC emp_copy;

SELECT * FROM emp_copy;
/*
[ 연습문제 ] emp 전체 emp_copy 복사본 테이블 생성 후

1. 사원번호가 7788인 사원의 부서를 10번으로 변경

2. 사원번호가 7782인 사원의 이름을 홍길숙으로 변경하고 급여를 3500으로 변경

3. 모든 부서원의 보너스를 300씩 인상 변경

4. 사원번호가 7499인 사원의 정보를 삭제

5. 입사일자가 81년 6월 1일 이전인 사원의 정보를 삭제

*/
--1.
UPDATE emp_copy SET deptno=10 WHERE empno=7788;
SELECT * FROM emp_copy;
--2.
UPDATE emp_copy SET sal=3500 WHERE empno=7782;
UPDATE emp_copy SET ename='홍길숙' WHERE empno=7782;
--sal=3500,ename= '홍길숙' 같이 써도 됨
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












