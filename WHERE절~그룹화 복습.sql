select EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE ENAME LIKE '%S';

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO IN(20,30)
AND SAL > 2000;

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO IN (20,30)
INTERSECT
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE SAL > 2000;

SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE SAL >=2000 
AND SAL <=3000;

SELECT ENAME,EMPNO,SAL,DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%'
AND DEPTNO = 30
AND SAL NOT BETWEEN 1000 AND 2000;

SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE ENAME NOT LIKE '_L%'
AND COMM IS NULL
AND JOB IN ('MANAGER','CLERK');

SELECT EMPNO,RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,SUBSTR(ENAME,1,5) AS ENAME,
RPAD(SUBSTR(ENAME,1,1),5,'*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >=5
AND LENGTH(ENAME)<6;

SELECT EMPNO,ENAME,SAL,TRUNC((SAL/21.5),2) AS DAY_PAY,ROUND((SAL/21.5/8),1) AS TIME_PAY
FROM EMP;

SELECT EMPNO,ENAME,HIREDATE,
TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������'),'YYYY-MM-DD') AS R_JOB,
NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM EMP;

SELECT EMPNO,ENAME,MGR, 
CASE
WHEN MGR IS NULL THEN '0000'
WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
WHEN SUBSTR(MGR,1,2) = '76' THEN '6666'
WHEN SUBSTR(MGR,1,2) = '77' THEN '7777'
WHEN SUBSTR(MGR,1,2) = '78' THEN '8888'
ELSE TO_CHAR(MGR)
END AS CHG_MGR
FROM EMP;

SELECT DEPTNO,TRUNC(AVG(SAL)) AS AVG_SAL,MAX(SAL) AS MAX_SAL,MIN(SAL) AS MIN_SAL,
COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;

SELECT JOB,COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*)>=3
;

SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,DEPTNO,COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO;

SELECT TO_CHAR(NVL2(COMM,'O','X')) AS EXIST_COMM,COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(NVL2(COMM,'O','X'));

SELECT DEPTNO,TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,COUNT(*) AS CNT,
MAX(SAL) AS MAX_SAL,MIN(SAL) AS MIN_SAL,AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY DEPTNO,ROLLUP(TO_CHAR(HIREDATE,'YYYY'))
ORDER BY DEPTNO;

