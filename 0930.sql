-- 8000�� ������� <���� �̸�>�� �޿� 10000�� ����
--INSERT INTO table_name( column_names ) VALUES ( values );
INSERT INTO  emp( empno, ename, sal ) 
VALUES ( 8000,'soyun',10000 );

SELECT * FROM emp;

-- 7788�� ������� <���� �̸�>�� �޿� 10000�� ����
INSERT INTO  emp( empno, ename, sal ) 
VALUES ( 7788,'soyun',10000 );
-- 7788�� �̹� scott�� �־ (key�� ���!) > key �浹

INSERT INTO  emp( empno, ename, sal,deptno ) 
VALUES ( 8001,'ȫ�汹',10000, 20 );

INSERT INTO  emp( empno, ename, sal,deptno ) 
VALUES ( 8002,'ȫ�浿',10000, 50 );
-- dept�� 50�� �μ��� ��� > key�� ���
---------------------------------------------------
INSERT INTO info_tab(tel, name, jumin, gender, age, home)
VALUES('032','ȫ��','801212','����','33','����'); 
--���� �޶� ��
SELECT * FROM info_tab;

INSERT INTO info_tab
VALUES('032','ȫ��','801212','����','33','����');
--��ü�÷��� �������� �÷��� ���� ���� >> �������� ���� ���� �ȸ°� �÷� �߰������� ������

INSERT INTO info_tab(tel,name)
VALUES('1001','ȫ�浿');

INSERT INTO info_tab(tel,name)
VALUES('1002','��浿');

INSERT INTO info_tab(tel,name)
VALUES('1002','�Ѹ�');
--primary key(tel) �ߺ������� �ȵ�!

INSERT INTO info_tab(name,jumin)
VALUES('��浿','901212-1234567'); 
--primary key(tel) �ȳ־ �ȵ�!

INSERT INTO info_tab(gender,age)
VALUES('����',22);
--primary  key �ȳ־ �ȵ�!

INSERT INTO info_tab(tel,gender,age)
VALUES('9999','����',22);
--name >> null�̶� �ȵ�!


DELETE FROM info_tab;
commit;

-- ����� ���� ��������
ALTER  TABLE   info_tab
ADD  CONSTRAINT  pk_info_tel  PRIMARY  KEY ( tel );
                -- ���� �̸� ������ �̷��� ���� pk_���̺�_Ű

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
--ó������ ����鼭 
--NOT NULL >> �ʼ� �Է»���

ALTER  TABLE   info_tab
MODIFY ( name varchar2(10) not null);
-- ���̺� ����� ���� not null �߰� (primary key �ƴ�)
-- �ٸ� ����� ������ �� ��� ����~~ not null�� �����ϲ�


ALTER TABLE info_tab
ADD CONSTRAINT uq_info_jumin UNIQUE (jumin); 
-- unique >> �ȵ��� �� ������ ������ �����ؾ���

INSERT INTO info_tab (tel, name, jumin) 
VALUES ('20001','ȫ����','990101');

INSERT INTO info_tab (tel, name, jumin) 
VALUES ('20001','ȫ����','990101');

INSERT INTO info_tab (tel, name) 
VALUES ('20003','ȫȫ��');

ALTER TABLE info_tab
ADD CONSTRAINT ck_info_gender CHECK (gender in('����','����'));
--�Է°� ����

INSERT INTO info_tab(tel,name,gender)
VALUES('10001','ȫ����','����');

INSERT INTO info_tab(tel,name,gender)
VALUES('10001','ȫ����','����');

INSERT INTO info_tab(tel,name,gender)
VALUES('30001','ȫ����','����');

INSERT INTO info_tab(tel,name,gender)
VALUES('10001','ȫ����','����');

drop table info_tab;

SELECT * FROM info_tab;

ALTER TABLE info_tab
 MODIFY (gender varchar2(6) default '����' );
 --�� �ȵ������� �⺻��
 
 
INSERT INTO info_tab (tel,name)
VALUES ('7777','ȫȫ');
 
INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '02-777-4444', '990909-1234567');
--��

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('������','03-555-5555', '880808-1234567', '����', 27,'���');
?--�ȵ� ���ڶ� 

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('ȫ�浿','03-031-0310', '900909-1234567', '����', 27,'���');
--��
?
INSERT INTO info_tab( name, jumin)
VALUES('ȫ����', '550505-1234567');
--�ȵ� primary key(tel) ���

INSERT INTO info_tab( tel, jumin ) 
VALUES('031-777-7777', '700707-1234567');
--�ȵ� name ���

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '031-000-0000', '700707-1234567');
--��


 
 --------------------------------------------
 --����鼭 ��������, not null, default ���� �ֱ�
 CREATE TABLE info_tab
(
    name        varchar2(10) NOT NULL,
    jumin        char(15),
    tel          varchar2(20),
    gender       varchar2(10) default '����',
    age          number(3),
    home         varchar2(20),
    deptno       number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gender CHECK (gender in('����','����')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
    
);
 
INSERT INTO info_tab(tel,name,deptno)
VALUES('7777','�Ͳ���',20);
--��
 
INSERT INTO info_tab(tel,name,deptno)
VALUES('8888','����',22);
--22�� �μ� �����ϱ� �ȵ�

INSERT INTO info_tab(tel,name)
VALUES('9999','¯��');
--��
------------------------��������-------------------------
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
ADD CONSTRAINT ck_sawon_ubmu CHECK (ubmu in('����','��������','����'));
--6
ALTER TABLE sawon
 MODIFY (ubmu varchar2(30) default '����' );
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
INSERT INTO  buseo(buseo_no,buseo_name) VALUES ( 101, '����Ʈ��������������');
INSERT INTO  buseo(buseo_no,buseo_name) VALUES ( 202, '������');
INSERT INTO  buseo(buseo_no,buseo_name) VALUES ( 303, '�����ڿ���');

--10
INSERT INTO  sawon(sabun, sawon_name,weolgub,buseo,jiyeok ) 
VALUES (8001,'ȫ�浿�̱�',100000,101,'�λ�' );
INSERT INTO  sawon(sabun, sawon_name,ubmu,weolgub,buseo,jiyeok ) 
VALUES (8002,'ȫ����','�繫',200000, 202,'��õ' ); 
--�ȵǴ� ����: ��ϵ� ������ �繫�� ���
INSERT INTO  sawon(sabun, sawon_name,ubmu,buseo,jiyeok ) 
VALUES (8003,'ȫ���','����',111,'����' ); 
--�ȵǴ� ����: buseo ���̺� ���� 111 ����
INSERT INTO  sawon(sabun, sawon_name,weolgub,jiyeok ) 
VALUES (8004,'ȫ�漮',12345678,'����' );
--�ȵǴ� ����:���ޱ��ڰ� 6�ڸ��� �Ѿ
INSERT INTO  sawon(sabun, sawon_name,ubmu,buseo,jiyeok ) 
VALUES (8005,'ȫ��ö','��������',303,'�Ǳ�' ); 

--11
ALTER TABLE sawon
DROP (jiyeok);

--12
DELETE FROM buseo
WHERE ( buseo_name='�����ڿ���');
--sawon���� 303(�����ڿ���) ������ ���� 
--�ǹ������� delete�� �Ⱦ���~~ 


--13
drop table sawon;
--truncate �� �����ϸ� �޸𸮱��� �� ����~~

--14
 CREATE TABLE sawon
(
    sabun        number(6),
    sawon_name   varchar2(15),
    ubmu         varchar2(30) default '����',
    weolgub      number(7),
    buseo        number(3),
    jiyeok       varchar2(30) not null,
 CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
 CONSTRAINT ck_sawon_ubmu CHECK (ubmu in('����','��������','����')),
 CONSTRAINT fk_sawon_bueso FOREIGN KEY (buseo) REFERENCES buseo (buseo_no) 
);

CREATE TABLE buseo
(
    buseo_no      number(3),
    buseo_name   varchar2(30),
   
 CONSTRAINT pk_buseo_buseono PRIMARY KEY (buseo_no)

);


