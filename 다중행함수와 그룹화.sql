<<<<<<< HEAD
--Q1 소수점을 제외하고 부서번호 별로 출력하기
SELECT DEPTNO,TRUNC(AVG(SAL)) AS AVG_SAL,MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;

--Q2 같은 직책에 종사하는 사원이 3명이상인 직책과 인원수 구하기
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*)>=3
ORDER BY JOB,COUNT(*)
;

--Q3 부서별로 입사연도를 기준으로 몇명이 입사했는지 알아보기
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR , DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO
;

--Q4 
SELECT NVL2(COMM,'O','X') AS EXIST_COMM , COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM,'O','X');

--Q5 
SELECT DEPTNO,TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,COUNT(*) AS CNT,
MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL,AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP( TO_CHAR(HIREDATE,'YYYY'),DEPTNO)
ORDER BY DEPTNO;

=======
--Q1 소수점을 제외하고 부서번호 별로 출력하기
SELECT DEPTNO,TRUNC(AVG(SAL)) AS AVG_SAL,MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO;

--Q2 같은 직책에 종사하는 사원이 3명이상인 직책과 인원수 구하기
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*)>=3
ORDER BY JOB,COUNT(*)
;

--Q3 부서별로 입사연도를 기준으로 몇명이 입사했는지 알아보기
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR , DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO
;

--Q4 
SELECT NVL2(COMM,'O','X') AS EXIST_COMM , COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM,'O','X');

--Q5 
SELECT DEPTNO,TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,COUNT(*) AS CNT,
MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL,AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY ROLLUP( TO_CHAR(HIREDATE,'YYYY'),DEPTNO)
ORDER BY DEPTNO;

>>>>>>> 5f480b9fdf80c02c50eb1bc3a63b35272afb86f9
