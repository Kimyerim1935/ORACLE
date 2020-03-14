INSERT INTO TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('TEST_ID_01','PWD01','010-1234-5678');

SELECT * FROM TABLE_UNIQUE;

insert into TABLE_UNIQUE(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('TEST_ID_02','PWD01','010-1234-5678');

SELECT * FROM TABLE_UNIQUE;

SELECT OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME
FROM USER TABLE_NAME LIKE 'TABLE_PK%';

SELECT OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME,R_OWNER,R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP','DEPT');


CREATE TABLE DEPT_FK(
DEPTNO NUMBER(2) CONSTRAINT DEPTPK_DEPTNO_PK PRIMARY KEY,
DNAM VARCHAR2(14),
LOC VARCHAR2(13)
);

DESC DEPT_FK;

CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER (7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES
    DEPT_FK (DEPTNO)
);

DESC EMP_FK;

INSERT INTO EMP_FK
VALUES(9999, 'TEST_NMAME', 'TEST_JOB',NULL,
    TO_DATE('2001/01/01','YYYY/MM/DD'),
    3000,NULL,10);
INSERT INTO DEPT_FK
VALUES(10,'TEST_DNAME','TEST_LOC');

SELECT * FROM DEPT_FK;

INSERT INTO EMP_FK
VALUES(9999,'TEST_NMAME','TEST_JOB',NULL,TO_DATE('2001/01/01','YYYY/MM/DD'),
3000,NULL,10);

DELETE FROM DEPT_FK
WHERE DEPTNO = 10;    

CREATE TABLE TABLE_CHECK(0
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOHINPW_CK CHECK (LENGTH(LOGIN_PWD) > 3 ),
TEL VARCHAR2(20)
);

DESC TABLE_CHECK;

