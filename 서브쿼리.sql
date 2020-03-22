<<<<<<< HEAD
select d.DEPTNO,d.dname,round(avg(e.sal)) as avg_sal,max(e.sal) as max_sal, min(e.sal) as min_sal,
count(*) as cnt
from emp e join dept d on (e.deptno = d.deptno)
group by d.DEPTNO,d.dname;

select d.deptno,d.dname,round(avg(e.sal)) as avg_Sal,max(e.sal) as max_sal,min(e.sal) as min_sal,
count(*) as cnt
from emp e ,dept d
where e.deptno = d.deptno
group by d.deptno,d.dname;

select job,e.empno,e.ename,sal,d.deptno ,d.dname
 from emp e , dept d
 where e.deptno = d.deptno
 and job in (select job
            from emp
            where ename = 'ALLEN');
            
            
select e.empno,e.ename,d.dname,e.hiredate,d.loc,e.sal,s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal
and  e.sal > (select  avg(sal)
                from emp
             )
    order by e.sal desc, e.deptno;
    
 select e.empno,e.ename,e.job,e.deptno,d.dname,d.loc
 from emp e , dept d
 where e.deptno = d.deptno
 and e.deptno = 10
 and job not in ( select job
                    from emp
                    where deptno =30 );
                    

select e.empno,e.ename,e.sal,s.grade
    FROM EMP E, SALGRADE S
    WHERE e.sal between s.losal and s.hisal
    AND E.SAL > (SELECT MAX(SAL)   
                    FROM EMP
                    WHERE JOB = 'SALESMAN'
                    GROUP BY DEPTNO);
                
=======
select d.DEPTNO,d.dname,round(avg(e.sal)) as avg_sal,max(e.sal) as max_sal, min(e.sal) as min_sal,
count(*) as cnt
from emp e join dept d on (e.deptno = d.deptno)
group by d.DEPTNO,d.dname;

select d.deptno,d.dname,round(avg(e.sal)) as avg_Sal,max(e.sal) as max_sal,min(e.sal) as min_sal,
count(*) as cnt
from emp e ,dept d
where e.deptno = d.deptno
group by d.deptno,d.dname;

select job,e.empno,e.ename,sal,d.deptno ,d.dname
 from emp e , dept d
 where e.deptno = d.deptno
 and job in (select job
            from emp
            where ename = 'ALLEN');
            
            
select e.empno,e.ename,d.dname,e.hiredate,d.loc,e.sal,s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal
and  e.sal > (select  avg(sal)
                from emp
             )
    order by e.sal desc, e.deptno;
    
 select e.empno,e.ename,e.job,e.deptno,d.dname,d.loc
 from emp e , dept d
 where e.deptno = d.deptno
 and e.deptno = 10
 and job not in ( select job
                    from emp
                    where deptno =30 );
                    

select e.empno,e.ename,e.sal,s.grade
    FROM EMP E, SALGRADE S
    WHERE e.sal between s.losal and s.hisal
    AND E.SAL > (SELECT MAX(SAL)   
                    FROM EMP
                    WHERE JOB = 'SALESMAN'
                    GROUP BY DEPTNO);
                
>>>>>>> 5f480b9fdf80c02c50eb1bc3a63b35272afb86f9
  