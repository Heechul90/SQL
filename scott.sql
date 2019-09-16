# 계정 내 테이블 확인
SELECT TABLE_NAME
FROM USER_TABLES;

CREATE TABLE STUDENT(
STU_NO CHAR(9),
STU_NAME VARCHAR2(12),
STU_DEPT VARCHAR2(20),
STU_GRADE NUMBER(1),
STU_CLASS CHAR(1),
STU_GENDER CHAR(1),
STU_HEIGHT NUMBER(5,2),
STU_WEIGHT NUMBER(5,2),
    CONSTRAINT P_STU_NO PRIMARY KEY(STU_NO));

DESC STUDENT;

CREATE TABLE SUBJECT(
SUB_NO CHAR(3),
SUB_NAME VARCHAR2(30),
SUB_PROF VARCHAR2(12),
SUB_GRADE NUMBER(1),
SUB_DEPT VARCHAR(20),
    CONSTRAINT P_SUB_NO PRIMARY KEY(SUB_NO));
    
DESC SUBJECT;

CREATE TABLE ENROL(
SUB_NO CHAR(3),
STU_NO CHAR(9),
ENR_GRADE NUMBER(3),
    CONSTRAINT P_COURSE PRIMARY KEY(SUB_NO,STU_NO));
    
DESC ENROL;

insert into STUDENT values(20153075, '옥한빛', '기계', '1', 'C', 'M', 177, 80);
insert into STUDENT values(20153088, '이태연', '기계', '1', 'C', 'F', 162, 50);
insert into STUDENT values(20143054, '유가인', '기계', '2', 'F', 'C', 154, 47);
insert into STUDENT values(20152088, '조민우', '전기전자', '1', 'C', 'M', 188, 90);
insert into STUDENT values(20142021, '심수정', '전기전자', '2', 'A', 'F', 168, 45);
insert into STUDENT values(20132003, '박희철', '전기전자', '3', 'B', 'M', null, 63);
insert into STUDENT values(20151062, '김인중', '컴퓨터정보', '1', 'B', 'M', 166, 67);
insert into STUDENT values(20141007, '진현무', '컴퓨터정보', '2', 'A', 'M', 174, 64);
insert into STUDENT values(20131001, '김종헌', '컴퓨터정보', '3', 'C', 'M', null, 72);
insert into STUDENT values(20131025, '옥성우', '컴퓨터정보', '3', 'A', 'F', 172, 63);

insert into SUBJECT values('111','데이터베이스','이재영','2','컴퓨터정보');
insert into SUBJECT values('110','자동제어','정순정','2','전기전자');
insert into SUBJECT values('109','자동화설계','박민영','3','기계');
insert into SUBJECT values('101','컴퓨터개론','강종영','3','컴퓨터정보');
insert into SUBJECT values('102','기계공작법','김태영','1','기계');
insert into SUBJECT values('103','기초전자실험','김유석','2','전기전자');
insert into SUBJECT values('104','시스템분석설계','강석현','2','컴퓨터정보');
insert into SUBJECT values('105','기계요소설계','김명성','2','기계');
insert into SUBJECT values('106','전자회로실험','최영민','2','전기전자');
insert into SUBJECT values('107','CAD응용실습','구봉규','2','기계');
insert into SUBJECT values('108','소프트웨어공학','권민성','2','컴퓨터정보');

insert into ENROL values('101','20131001',80);
insert into ENROL values('104','20131001',56);
insert into ENROL values('106','20132003',72);
insert into ENROL values('103','20152088',45);
insert into ENROL values('101','20131025',65);
insert into ENROL values('104','20131025',65);
insert into ENROL values('108','20151062',81);
insert into ENROL values('107','20143054',41);
insert into ENROL values('102','20153075',66);
insert into ENROL values('105','20153075',56);
insert into ENROL values('102','20153088',61);
insert into ENROL values('105','20153088',78);

select * from student
select * from STUDENT;
select * from SUBJECT;
select * from ENROL;

--문제1
select *
from emp natural join dept;

--문제2
select emp.empno, ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

--문제3
select empno, ename, dept.dname
from emp natural join dept;

--문제4
select empno, ename, dept.dname
from emp join dept using(deptno);

--문제5
select empno, ename, dept.dname
from emp join dept on emp.deptno = dept.deptno;

--문제6
select ename, loc
from emp, dept
where emp.deptno = dept.deptno
and loc = 'NEW YORK';

--문제8
select ename, loc
from emp join dept using(deptno)
where loc = 'NEW YORK';

--문제10
select empno, ename, loc
from emp join dept using(deptno)
where loc = 'NEW YORK'
order by 1;

--문제 12
select ename, dname, loc
from emp join dept using(deptno)
where ename = 'ADAMS';

--문제 14
select ename, dname, loc
from emp natural join dept
where ename = 'ADAMS';

--문제 16
select empno, ename, dname, sal
from emp, dept
where emp.deptno = dept.deptno
and sal between 1000 and 2000
order by 1;

--문제 18
select empno, ename, loc
from emp, dept
where emp.deptno = dept.deptno
and loc in ('NEW YORK', 'DALLAS')
order by 1;

--문제 20
select empno, ename, loc
from emp natural join dept
where loc in ('NEW YORK', 'DALLAS')
order by 1;

--문제 22
select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal
order by 4, 1;

--문제 24
select a.empno, a.ename, b.empno, b.ename
from emp a join emp b on a.mgr = b.empno;

--문제 26
select b.ename, b.sal
from emp a, emp b
where b.sal > a.sal
and a.ename = 'BLAKE';

--문제 28
select empno
from emp
where sal = (select sal from emp where ename = 'FORD');

--문제 30
select b.empno, b.ename,count(*)
from emp a join emp b on a.mgr = b.empno
group by b.empno, b.ename, a.mgr
order by 3 desc;

--문제 32
select *
from emp
where sal > (select sal from emp where ename = 'SCOTT');

--문제 34
select *
from emp where deptno <> 20
and job in (select job from emp where deptno = 20);

--문제 36
select *
from emp
where sal > all(select avg(sal) from emp group by deptno);

--문제 38
select *
from emp
where deptno = (select deptno from dept where loc = 'CHICAGO');