-- 8000번 사원으로 <본인 이름>과 급여 10000를 저장
--INSERT INTO table_name( column_names ) VALUES ( values );
INSERT INTO  emp( empno, ename, sal ) 
VALUES ( 8000,'soyun',10000 );

SELECT * FROM emp;

-- 7788번 사원으로 <본인 이름>과 급여 10000를 저장
INSERT INTO  emp( empno, ename, sal ) 
VALUES ( 7788,'soyun',10000 );
-- 7788에 이미 scott이 있어서 (key가 사번!) > key 충돌

INSERT INTO  emp( empno, ename, sal,deptno ) 
VALUES ( 8001,'홍길국',10000, 20 );

INSERT INTO  emp( empno, ename, sal,deptno ) 
VALUES ( 8002,'홍길동',10000, 50 );
-- dept에 50번 부서가 없어서 > key가 없어서
---------------------------------------------------
INSERT INTO info_tab(tel, name, jumin, gender, age, home)
VALUES('032','홍자','801212','남자','33','제주'); 
--순서 달라도 들어감
SELECT * FROM info_tab;

INSERT INTO info_tab
VALUES('032','홍자','801212','남자','33','제주');
--전체컬럼명 넣을때는 컬럼명 생략 가능 >> 권장하지 않음 순서 안맞고 컬럼 추가됐을때 오류남

INSERT INTO info_tab(tel,name)
VALUES('1001','홍길동');

INSERT INTO info_tab(tel,name)
VALUES('1002','김길동');

INSERT INTO info_tab(tel,name)
VALUES('1002','둘리');
--primary key(tel) 중복때문에 안됨!

INSERT INTO info_tab(name,jumin)
VALUES('김길동','901212-1234567'); 
--primary key(tel) 안넣어서 안됨!

INSERT INTO info_tab(gender,age)
VALUES('남자',22);
--primary  key 안넣어서 안됨!

INSERT INTO info_tab(tel,gender,age)
VALUES('9999','남자',22);
--name >> null이라서 안됨!


DELETE FROM info_tab;
commit;

-- 만들고 나서 제약조건
ALTER  TABLE   info_tab
ADD  CONSTRAINT  pk_info_tel  PRIMARY  KEY ( tel );
                -- 여기 이름 가급적 이렇게 설정 pk_테이블_키

DROP TABLE info_tab;


CREATE TABLE info_tab
(
    name        varchar2(10),
    jumin        char(15),
    tel          varchar2(20),
    gender       varchar2(10),
    age          number(3),
    home         varchar2(20),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel)
);
--처음부터 만들면서 
--NOT NULL >> 필수 입력사항

ALTER  TABLE   info_tab
MODIFY ( name varchar2(10) not null);
-- 테이블 만들고 나서 not null 추가 (primary key 아님)
-- 다른 방법도 있지만 이 방법 권장~~ not null은 많으니께


ALTER TABLE info_tab
ADD CONSTRAINT uq_info_jumin UNIQUE (jumin); 
-- unique >> 안들어올 수 있지만 들어오면 유일해야함

INSERT INTO info_tab (tel, name, jumin) 
VALUES ('20001','홍길이','990101');

INSERT INTO info_tab (tel, name, jumin) 
VALUES ('20001','홍길이','990101');

INSERT INTO info_tab (tel, name) 
VALUES ('20003','홍홍이');

ALTER TABLE info_tab
ADD CONSTRAINT ck_info_gender CHECK (gender in('남성','여성'));
--입력값 제한

INSERT INTO info_tab(tel,name,gender)
VALUES('10001','홍돌이','남성');

INSERT INTO info_tab(tel,name,gender)
VALUES('10001','홍돌이','남자');

INSERT INTO info_tab(tel,name,gender)
VALUES('30001','홍돌이','여성');

INSERT INTO info_tab(tel,name,gender)
VALUES('10001','홍돌이','여자');

drop table info_tab;

SELECT * FROM info_tab;

ALTER TABLE info_tab
 MODIFY (gender varchar2(6) default '남성' );
 --값 안들어왔을때 기본값
 
 
INSERT INTO info_tab (tel,name)
VALUES ('7777','홍홍');
 
INSERT INTO info_tab( name, tel, jumin ) 
VALUES('갑순이', '02-777-4444', '990909-1234567');
--들어감

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('갑갑이','03-555-5555', '880808-1234567', '남자', 27,'경기');
?--안들어감 남자라서 

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('홍길동','03-031-0310', '900909-1234567', '남성', 27,'경기');
--들어감
?
INSERT INTO info_tab( name, jumin)
VALUES('홍길자', '550505-1234567');
--안들어감 primary key(tel) 없어서

INSERT INTO info_tab( tel, jumin ) 
VALUES('031-777-7777', '700707-1234567');
--안들어감 name 없어서

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('갑동이', '031-000-0000', '700707-1234567');
--들어감


 
 --------------------------------------------
 --만들면서 제약조건, not null, default 같이 넣기
 CREATE TABLE info_tab
(
    name        varchar2(10) NOT NULL,
    jumin        char(15),
    tel          varchar2(20),
    gender       varchar2(10) default '남성',
    age          number(3),
    home         varchar2(20),
    deptno       number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gender CHECK (gender in('남성','여성')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    
);
 
INSERT INTO info_tab(tel,name,deptno)
VALUES('7777','맹꽁이',20);
--됨
 
INSERT INTO info_tab(tel,name,deptno)
VALUES('8888','꽁이',22);
--22번 부서 없으니까 안됨

INSERT INTO info_tab(tel,name)
VALUES('9999','짱이');
--됨
------------------------연습문제-------------------------
--1,2 
 CREATE TABLE sawon
(
    sabun        number(6),
    sawon_name   varchar2(15),
    ubmu         varchar2(30),
    weolgub      number(10,2),
    buseo        number(3),
 CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun)
    
);

SELECT * FROM sawon;
--3
ALTER TABLE sawon ADD(jiyeok varchar2(30) not null);
--4
ALTER TABLE sawon
modify (weolgub number(7));
--5
ALTER TABLE sawon
ADD CONSTRAINT ck_sawon_ubmu CHECK (ubmu in('개발','유지보수','관리'));
--6
ALTER TABLE sawon
 MODIFY (ubmu varchar2(30) default '개발' );
--7
CREATE TABLE buseo
(
    buseo_no      number(3),
    buseo_name   varchar2(30),
   
 CONSTRAINT pk_buseo_buseono PRIMARY KEY (buseo_no)
    
);
--8
ALTER TABLE sawon
ADD CONSTRAINT fk_sawon_bueso FOREIGN KEY (buseo) REFERENCES buseo (buseo_no)

--9
INSERT INTO  buseo(buseo_no,buseo_name) VALUES ( 101, '소프트웨어유지보수부');
INSERT INTO  buseo(buseo_no,buseo_name) VALUES ( 202, '관리부');
INSERT INTO  buseo(buseo_no,buseo_name) VALUES ( 303, '인적자원부');

--10
INSERT INTO  sawon(sabun, sawon_name,weolgub,buseo,jiyeok ) 
VALUES (8001,'홍길동이군',100000,101,'부산' );
INSERT INTO  sawon(sabun, sawon_name,ubmu,weolgub,buseo,jiyeok ) 
VALUES (8002,'홍길자','사무',200000, 202,'인천' ); 
--안되는 이유: 등록된 업무에 사무가 없어서
INSERT INTO  sawon(sabun, sawon_name,ubmu,buseo,jiyeok ) 
VALUES (8003,'홍길순','개발',111,'대전' ); 
--안되는 이유: buseo 테이블에 없음 111 없음
INSERT INTO  sawon(sabun, sawon_name,weolgub,jiyeok ) 
VALUES (8004,'홍길석',12345678,'서울' );
--안되는 이유:월급글자가 6자리를 넘어서
INSERT INTO  sawon(sabun, sawon_name,ubmu,buseo,jiyeok ) 
VALUES (8005,'홍길철','유지보수',303,'판교' ); 

--11
ALTER TABLE sawon
DROP (jiyeok);

--12
DELETE FROM buseo
WHERE ( buseo_name='인적자원부');
--sawon에서 303(인적자원부) 없으면 가능 
--실무에서는 delete로 안쓴다~~ 


--13
drop table sawon;
--truncate 로 삭제하면 메모리까지 다 날라감~~

--14
 CREATE TABLE sawon
(
    sabun        number(6),
    sawon_name   varchar2(15),
    ubmu         varchar2(30) default '개발',
    weolgub      number(7),
    buseo        number(3),
    jiyeok       varchar2(30) not null,
 CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
 CONSTRAINT ck_sawon_ubmu CHECK (ubmu in('개발','유지보수','관리')),
 CONSTRAINT fk_sawon_bueso FOREIGN KEY (buseo) REFERENCES buseo (buseo_no) 
);

CREATE TABLE buseo
(
    buseo_no      number(3),
    buseo_name   varchar2(30),
   
 CONSTRAINT pk_buseo_buseono PRIMARY KEY (buseo_no)

);


