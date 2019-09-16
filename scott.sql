# ���� �� ���̺� Ȯ��
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

insert into STUDENT values(20153075, '���Ѻ�', '���', '1', 'C', 'M', 177, 80);
insert into STUDENT values(20153088, '���¿�', '���', '1', 'C', 'F', 162, 50);
insert into STUDENT values(20143054, '������', '���', '2', 'F', 'C', 154, 47);
insert into STUDENT values(20152088, '���ο�', '��������', '1', 'C', 'M', 188, 90);
insert into STUDENT values(20142021, '�ɼ���', '��������', '2', 'A', 'F', 168, 45);
insert into STUDENT values(20132003, '����ö', '��������', '3', 'B', 'M', null, 63);
insert into STUDENT values(20151062, '������', '��ǻ������', '1', 'B', 'M', 166, 67);
insert into STUDENT values(20141007, '������', '��ǻ������', '2', 'A', 'M', 174, 64);
insert into STUDENT values(20131001, '������', '��ǻ������', '3', 'C', 'M', null, 72);
insert into STUDENT values(20131025, '������', '��ǻ������', '3', 'A', 'F', 172, 63);

insert into SUBJECT values('111','�����ͺ��̽�','���翵','2','��ǻ������');
insert into SUBJECT values('110','�ڵ�����','������','2','��������');
insert into SUBJECT values('109','�ڵ�ȭ����','�ڹο�','3','���');
insert into SUBJECT values('101','��ǻ�Ͱ���','������','3','��ǻ������');
insert into SUBJECT values('102','�����۹�','���¿�','1','���');
insert into SUBJECT values('103','�������ڽ���','������','2','��������');
insert into SUBJECT values('104','�ý��ۺм�����','������','2','��ǻ������');
insert into SUBJECT values('105','����Ҽ���','���','2','���');
insert into SUBJECT values('106','����ȸ�ν���','�ֿ���','2','��������');
insert into SUBJECT values('107','CAD����ǽ�','������','2','���');
insert into SUBJECT values('108','����Ʈ�������','�ǹμ�','2','��ǻ������');

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

--����1
select *
from emp natural join dept;

--����2
select emp.empno, ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

--����3
select empno, ename, dept.dname
from emp natural join dept;

--����4
select empno, ename, dept.dname
from emp join dept using(deptno);

--����5
select empno, ename, dept.dname
from emp join dept on emp.deptno = dept.deptno;

--����6
select ename, loc
from emp, dept
where emp.deptno = dept.deptno
and loc = 'NEW YORK';

--����8
select ename, loc
from emp join dept using(deptno)
where loc = 'NEW YORK';

--����10
select empno, ename, loc
from emp join dept using(deptno)
where loc = 'NEW YORK'
order by 1;

--���� 12
select ename, dname, loc
from emp join dept using(deptno)
where ename = 'ADAMS';

--���� 14
select ename, dname, loc
from emp natural join dept
where ename = 'ADAMS';

--���� 16
select empno, ename, dname, sal
from emp, dept
where emp.deptno = dept.deptno
and sal between 1000 and 2000
order by 1;

--���� 18
select empno, ename, loc
from emp, dept
where emp.deptno = dept.deptno
and loc in ('NEW YORK', 'DALLAS')
order by 1;

--���� 20
select empno, ename, loc
from emp natural join dept
where loc in ('NEW YORK', 'DALLAS')
order by 1;

--���� 22
select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal
order by 4, 1;

--���� 24
select a.empno, a.ename, b.empno, b.ename
from emp a join emp b on a.mgr = b.empno;

--���� 26
select b.ename, b.sal
from emp a, emp b
where b.sal > a.sal
and a.ename = 'BLAKE';

--���� 28
select empno
from emp
where sal = (select sal from emp where ename = 'FORD');

--���� 30
select b.empno, b.ename,count(*)
from emp a join emp b on a.mgr = b.empno
group by b.empno, b.ename, a.mgr
order by 3 desc;

--���� 32
select *
from emp
where sal > (select sal from emp where ename = 'SCOTT');

--���� 34
select *
from emp where deptno <> 20
and job in (select job from emp where deptno = 20);

--���� 36
select *
from emp
where sal > all(select avg(sal) from emp group by deptno);

--���� 38
select *
from emp
where deptno = (select deptno from dept where loc = 'CHICAGO');