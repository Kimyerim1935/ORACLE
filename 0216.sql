--Q1
SELECT E.JOB,E.EMPNO,E.ENAME,E.SAL,E.DEPTNO,D.DNAME
FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
 AND JOB = (SELECT JOB
FROM EMP
WHERE ENAME = 'ALLEN');

--Q2
SELECT E.EMPNO,E.ENAME,D.DNAME,E.HIREDATE,D.LOC,E.SAL,S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND SAL > (SELECT AVG(SAL)
FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO;

--Q3
SELECT E.EMPNO,E.ENAME,E.JOB,E.DEPTNO,D.DNAME,D.LOC
FROM EMP E ,DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 10
AND JOB NOT IN (SELECT DISTINCT JOB
FROM EMP
WHERE DEPTNO = 30);

--Q4
--�������Լ� ������� ���� ��
SELECT E.EMPNO,E.ENAME,E.SAL,S.GRADE
FROM EMP E , SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL > (SELECT MAX(SAL)
               FROM EMP
              WHERE JOB = 'SALESMAN'
              GROUP BY DEPTNO);

--������ �Լ� ���
SELECT E.EMPNO,E.ENAME,E.SAL,S.GRADE
FROM EMP E , SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL > ALL (SELECT SAL
               FROM EMP
              WHERE JOB = 'SALESMAN');