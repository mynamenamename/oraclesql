create table Customer
(

name varchar2(30),
pNo varchar2(14),
s_Pno varchar2(14),
addr varchar2(60),
email varchar2(30),
constraints pk_Customer_pNo primary key(pNo)
);

create sequence seq_Video;

create table Video
(
videoNo char(10),
genere varchar2(21),
title varchar2(60),
director varchar2(30),
actor varchar2(30),
expl varchar2(4000),

constraints pk_Video_videoNo primary key (videoNo)
);

DROP TABLE VIDEO;

ALTER TABLE VIDEO MODIFY VIDEONO VARCHAR2(15);



create table Rent
(
pNo varchar2(14),
videoNo varchar2(20),
rentNo varchar2(15),
returnYN char(1),
rentDate date,

constraints pk_Rent_rentNo primary key (rentNo),
constraints fk_Customer_pNo foreign key (pNo) references Customer (pNo),
constraints fk_Video_videoNo foreign key (videoNo) references Video (videoNo)
);


CREATE SEQUENCE SEQ_RENT1
            increment by 10              -- 증가치
            start with 5000;                -- 시작숫자

INSERT INTO Rent(rentNo) VALUES (seq_rent1.NEXTVAL);            


SELECT V.VIDEONO 비디오번호, V.TITLE 제목 , 
       C.NAME 고객명, C.PNO 전화번호,
       R.RENTDATE+ 3 반납예정일, 'N' 반납여부
FROM CUSTOMER C, VIDEO V, RENT R
WHERE C.PNO=R.PNO AND V.VIDEONO=R.VIDEONO
     AND R.RETURNYN='N';

--표준화
SELECT V.VIDEONO 비디오번호, V.TITLE 제목 , 
       C.NAME 고객명, C.PNO 전화번호,
       R.RENTDATE+ 3 반납예정일, 'N' 반납여부
FROM CUSTOMER C INNER JOIN RENT R ON C.PNO=R.PNO 
INNER JOIN VIDEO V
ON  V.VIDEONO=R.VIDEONO
WHERE  R.RETURNYN='N';


ALTER TABLE RENT DROP CONSTRAINT fk_Customer_pNo;

ALTER TABLE RENT ADD
constraints fk_Customer_pNo foreign key (pno) references customer (pno)
ON DELETE CASCADE;


ALTER TABLE RENT DROP CONSTRAINT FK_VIDEO_VIDEONO;

ALTER TABLE RENT ADD
constraints fk_Video_videoNo foreign key (videoNo) references Video (videoNo)
ON DELETE CASCADE;

ALTER TABLE RENT DROP CONSTRAINT fk_Customer_pNo;



------------------------------------------------
--1014

create table account (
account_num	varchar2(20),
customer  varchar2(20),
amount	number);


insert into account (customer, account_num, amount) 
values ('홍길동','111-11-111',10000);
insert into account (customer, account_num, amount) 
values ('맹자','999-99-9999',5000);

commit;

--1)업무별 평균 월급
select  round(avg(sal)) avgsal, NVL(job, '미정') JOB
from emp
group by job;

--2)월급을 많이 받는 10명



select  ename, nvl(sal,0) sal
from ( select ename, nvl(sal,0) sal from emp order by nvl(sal,0) desc )
where rownum <=10;


--3) 월별 입사한 인원수

select NVL(to_char(hiredate, 'mm'),'없음') month , count(*) count
from emp
group by to_char(hiredate, 'mm')
order by to_char(hiredate, 'mm');
