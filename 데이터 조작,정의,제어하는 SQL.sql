CREATE TABLE EMP_DDL(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2)
);

DESC EMP_DDL;



CREATE TABLE DEPT_DDL
AS SELECT * FROM DEPT;

DESC DEPT_DDL;


ALTER TABLE EMP_ALTER
ADD HP VARCHAR(20);

SELECT * FROM EMP;

ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

SELECT * FROM EMP_ALTER;


ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

DESC EMP_ALTER;

SELECT * 
FROM USER_TABLES;

SELECT * 
FROM ALL_TABLES;

SELECT * 
FROM DBA_TABLES;
-- SCOTT 계정은 관리자 테이블을 볼 수 있는 권한이 없다

SELECT * 
FROM USER_INDEXES;

SELECT * 
FROM USER_IND_COLUMNS;

CREATE INDEX IDT_EMP_SAL
ON EMP(SAL);

DROP INDEX IDX_EMP_SAL;

select * from emp;

create view vw_emp20
as (select empno,ename,job,deptno
from emp where deptno = 20);

select * from user_views;

select * from vw_emp20;


drop view vw_emp20;

select rownum, e.*
from emp e;

select rownum, e.*
from emp e
order by sal desc;


select rownum,e.*
from (select *      
     from emp e 
        order by sal desc) e;
        
 with e as (select * from emp order by sal desc)
 select rownum, e.*
 from e;
 
 create table dept_sequence
 as select * 
 from dept
 where 1 <> 1;
 
 select * from dept_sequence;
 
 create sequence seq_dept_sequence
 increment by 10
 start with 10
 maxvalue 90
 minvalue 0
 nocycle
 cache 2;
 
 insert into dept_sequence (deptno,dname,loc)
 values (seq_Dept,sequence.nextval, 'database','seoul');
 
 select * from dept_sequence order by deptno;