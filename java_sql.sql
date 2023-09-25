oracle sql
SELECT�� : �����ͺ��̽��κ��� ����Ǿ� �ִ� �����͸� �˻��ϴµ� ���

��ü �÷��� ����� �����͸� �о��

SELECT * FROM emp;  -- " * " ��� �÷��� �ҷ����� Ű

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno, FROM emp; --��ü �÷��� ���

�Ϻ� �÷�(��)�� ����� �����͸� �о��

SELECT empno,ename,sal FROM emp;

�ּ�
SELECT /*Ư�� �÷��� ����*/ empno,ename,job From emp; --sql���ο� �ּ������ ���� "/**/" �� ǥ��
dual : �Լ� �� ����� ����� �� �� ����� �� �ִ� ����(public) ���̺�
SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT 7 + 10 FROM dual;

����� : ���������(+,-,*,/)�� ����Ͽ� ���� �� ��¥ �����ͷ� ǥ������ �ۼ�
SELECT ename, sal, sal+300 FROM emp;

������ �켱����
SELECT ename, sal, (sal+300)*12 FROM emp;

NULL�� ���� : NULL�� ����� �� ���ų� �Ҵ���� �ʾҰų� �� �� ���ų�, ������ �� ���� ��
            (NULL�� 0 �̳� ������� �ٸ�)
SELECT empno,ename,job,comm FROM emp; --����Ŭ���� null�� �Է��� ���� ������

������� NULL�� : NULL���� ������ ������� NULL�� ���
SELECT ename, sal+300, comm+300 FROM emp;

�� �˸��ƽ� : ���� ��Ī
�� �̸��� �ٲ�
�� �̸� �ٷ� �ڿ� ����. �� �̸��� �˸��ƽ� ���̿� ���� ������ as Ű���尡 �� ���� ����
�˸��ƽ��� ū����ǥ�� ����ϴ� ���
- ��ҹ��� ������ ���� ��
- ���� ���Խ�
- _,#�� Ư������ ����( _(�����) �� ""(ū����ǥ)���� �߰����� �ü� ������ �� �տ� ���� ���� �߻�)
- ���ڷ� ������ ���

SELECT sal*12 ASal FROM emp;
SELECT sal*12 AS ASal FROM emp;
SELECT sal*12 "Annual Salary" FROM emp; --��Ī�� �ְ������ "" �ȿ� �ۼ��ؾߵ�

���� ������ : ���̳� ���ڿ��� �ٸ� ���� ����
SELECT ename || ' has$ ' || sal salary FROM emp;

���Ῥ���ڿ� NULL�� : ���ڿ��� NULL���� ������ ��� ����� ���ڿ�
SELECT ename || comm FROM emp;

DISTINCT : �ߺ��� ����
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT(deptno) FROM emp;

[�ǽ�����]
1) emp ���̺��� �����ȣ, ����̸�, ������ ����Ͻÿ�.
2) emp ���̺��� ����̸��� ������ ����ϴµ� �÷����� "�� ��","�� ��" ���� �ٲ㼭 ����Ͻÿ�.
3) emp ���̺��� �����ȣ, ����̸�, ����, ������ ���ϰ� ���� �÷����� "�����ȣ","����̸�","����","����"���� ����Ͻÿ�.
4) emp ���̺��� ������ �ߺ����� �ʰ� ǥ���Ͻÿ�.
5) emp ���̺��� ������ ������ ��ǥ(,)�� �����ؼ� ǥ���ϰ� �÷����� Employee and Job���� ǥ���Ͻÿ�.

SELECT empno,ename,sal FROM emp;
SELECT ename "�� ��", sal "�� ��" FROM emp;
SELECT empno �����ȣ, ename ����̸�, sal ����, sal*12 ���� FROM emp;
SELECT DISTINCT Job FROM emp;
SELECT ename || ',' || job "Employee and Job" FROM emp;

WHERE �� : ������ üũ�ؼ� �� ���� ����
         �˸��ƽ��� ����� �� ����.
SELECT * FROM emp WHERE deptno=10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT ename,hiredate FROM emp WHERE hiredate>'81/04/02';

(����)WHERE�������� �˸��ƽ��� ����� �� ����
SELECT ename,sal,sal*12 ansal FROM emp WHERE sal*12 > 15000;

�񱳿������� ���
SELECT ename,hiredate FROM emp WHERE hiredate = '81/06/09';
SELECT ename,hiredate FROM emp WHERE hiredate <> '81/06/09';
SELECT ename,hiredate FROM emp WHERE hiredate != '81/06/09';
SELECT ename,hiredate FROM emp WHERE hiredate ^= '81/06/09';

�̻� ~ ����
SELECT ename, job, sal FROM emp WHERE sal >= 2000 AND sal<= 5000;

BETWEEN ~ AND ~ : �� �� ����(������ �� ����)
SELECT ename,job,sal FROM emp WHERE sal BETWEEN 2000 AND 5000;
SELECT ename,job,sal FROM emp WHERE sal NOT BETWEEN 2000 AND 5000;

SELECT ename,job,deptno FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT ename,job,deptno FROM emp
WHERE ename NOT BETWEEN 'KING' AND 'SMITH'; --���� NOT

IN : �� ��� ���� ���� ��ġ
SELECT ename,sal,deptno FROM emp WHERE sal IN(1300,2450,3000);
SELECT ename,sal,deptno FROM emp WHERE sal NOT IN(1300,2450,3000); --���� NOT

SELECT ename, job, hiredate FROM emp WHERE ename IN ('ALLEN','FORD');

LIKE : ������ �̿��� �˻� ����
% �� 0�� �̻��� ���ڸ� ��Ÿ��
_ �� �� ���ڸ� ��Ÿ��

SELECT ename,job,hiredate FROM emp WHERE ename LIKE '%S%';
SELECT ename,job,hiredate FROM emp WHERE ename NOT LIKE '%S%';

SELECT ename,job,sal,hiredate FROM emp WHERE ename LIKE 'S%'; -- s�� �����ϴ��̸�
SELECT empno,ename,hiredate FROM emp WHERE hiredate LIKE '%22'; -- 22�� ������ �Ի���

SELECT ename,sal FROM emp WHERE ename LIkE 'FOR_'; --FOR ������ �� �� ����

[�ǽ�����]
1) emp ���̺��� �����ȣ�� 7698�� ����� �̸�, ����, �޿��� ����Ͻÿ�. 
SELECT ename,job,sal FROM emp WHERE empno IN(7698);

2) emp ���̺��� ��� �̸��� SMITH�� ����� �̸��� ����, �μ� ��ȣ�� ����Ͻÿ�
SELECT ename,sal,deptno FROM emp WHERE ename = 'SMITH';

3) ������ 2500�̻� 3500�̸��� ����� �̸�,�Ի���,������ ���Ͻÿ�.
SELECT ename,hiredate,sal FROM emp WHERE sal >= 2500 AND sal < 3500;

4) �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸�,����,�޿��� ����Ͻÿ�.
SELECT ename,job,sal FROM emp where sal NOT BETWEEN 2000 AND 3000;

5) 81��05��01�ϰ� 81��12��03�� ���̿� �Ի��� ����� �̸�,�޿�,�Ի����� ����Ͻÿ�.
SELECT ename,sal,hiredate FROM emp WHERE hiredate BETWEEN '81/05/01' AND '81/12/03';

6) emp���̺��� �����ȣ�� 7566,7782,7934�� ����� ������ ������� �����ȣ,�̸�,������ ����Ͻÿ�
SELECT empno,ename,sal FROM emp WHERE empno NOT IN(7566,7782,7934);

7) �μ���ȣ(deptno)�� 30���� �ٹ��ϸ� ��2,000�޷� ���ϸ� �޴� 81��05��01�� ������ �Ի��� ����� �̸�, �μ���ȣ, �Ի����� ����Ͻÿ�.
SELECT ename,deptno,hiredate FROM emp WHERE deptno = 30 AND sal <= 2000 AND hiredate < '81/05/01'; 

NULL ���� ���
SELECT ename,sal,comm FROM emp WHERE comm IS NULL;
SELECT ename,sal,comm FROM emp WHERE comm IS NOI NULL;
 
��������(AND,OR,NOT)�� ����Ͽ� ���� ����
SELECT empno,ename,job,sal FROM emp WHERE sal>=2000 AND job LIKE '%MAN%';
SELECT empno,ename,job,sal FROM emp WHERE sal>=2000 OR job LIKE '%MAN%';
SELECT ename,job FROM emp WHERE job NOT IN ('CLERK','SALESMAN');

8) emp ���̺��� ����̸� �� s�� ���Ե��� ���� ����� �� �μ���ȣ�� 20�� ������� �̸��� �μ���ȣ�� ����Ͻÿ�.
SELECT ename,deptno FROM emp WHERE ename NOT LIKE '%S%' AND deptno = 20;

9) emp ���̺��� �̸��� A�� E�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT ename FROM emp WHERE ename LIKE '%A%' AND ename LIKE '%E%';

10) emp ���̺��� ������(mgr)�� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�. --EMP���̺��� MGR�� ���ӻ��
SELECT ename,job FROM emp WHERE mgr IS NULL;

11) emp ���̺��� Ŀ�̼� �׸��� �Էµ� ������� �̸��� �޿�,Ŀ�̼��� ���Ͻÿ�. -NULL�� ����
SELECT ename,sal,comm FROM emp WHERE comm IS NOT  NULL;

ORDER BY �� : ����
SELECT * FROM emp ORDER BY sal ASC; -- ORDER BY ~ ASC ��������
SELECT * FROM emp ORDER BY sal; -- ASC �����ص� ��������

SELECT * FROM emp ORDER BY sal DESC; -- DESC: ��������
SELECT * FROM emp ORDER BY sal DESC, ename DESC; --�ߺ����� ������ ���������� �տ������� �������� ������
SELECT * FROM emp ORDER BY job ASC, ename DESC;

SELECT ename,job,deptno,hiredate FROM emp ORDER BY hiredate DESC;
�� �˸��ƽ��� �������� ����
SELECT empno, ename, sal*12 annsal FROM emp ORDER BY annsal; --ASC ���� ������������

���� ���� ��ġ�� ����Ͽ� ����
SELECT ename,job,deptno,hiredate FROM emp ORDER BY 3; --ORDER BY �ڿ� ���ڸ� �Է��ϸ� �ش�Ǵ� �࿡�� �������� 
SELECT * FROM emp ORDER BY 2; -- ���̺� ������ ����� �÷� ������ ��ȣ �ο�

- NULLS FIRST �Ǵ� NULLS LAST Ű���带 ����Ͽ� ��ȯ�� �� �� NULL���� �����ϴ� ����
���� ������ �� ó���� ��Ÿ���ų� �������� ��Ÿ������ ����
SELECT * FROM emp ORDER BY comm DESC NULLS LAST; --�������� ����, NULL���� �������� ����
SELECT * FROM emp ORDER BY comm ASC NULLS FIRST; --�������� ����, NULL���� ó���� ����
SELECT * FROM emp ORDER BY comm ASC NULLS FIRST, ename DESC;

[�ǽ�����]
1) emp ���̺��� �����ȣ, ����̸�, �Ի����� ����ϴµ� �Ի����� ���� ��������� �����Ͻÿ�.
SELECT empno,ename,hiredate FROM emp ORDER BY hiredate; --my answer

2) emp ���̺��� ����̸�, �޿�, ������ ���ϰ� ������ ���� ������ �����Ͻÿ�.
SELECT ename,sal,sal*12 FROM emp ORDER BY sal*12 DESC; --my answer
--SELECT ename,sal,sal*12 annsal FROM emp ORDER BY annsal DESC; --�˸��ƽ� �ο�

3)10�� �μ� �Ǵ� 20�� �μ����� �ٹ��ϰ� �ִ� ����� �̸��� �μ���ȣ�� ����ϴµ� �̸��� ������ ������ ǥ���Ͻÿ�.
SELECT ename,deptno FROM emp WHERE deptno=10 or deptno=20 ORDER BY ename; --my answer
--SELECT ename,deptno FROM emp WHERE deptno IN (10,20) ORDER BY ename ASC;

4) Ŀ�̼� ����� ���� ��� ����� �̸�, �޿�, Ŀ�̼��� ����ϴµ� Ŀ�̼��� �������� �������� �����Ͻÿ�.
--SELECT ename,sal,comm FROM emp ORDER BY comm DESC NULLS LAST; --my answer
SELECT ename,sal,comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;

�Լ�
�����Լ�
��ҹ��� ���� �Լ� : LOWER, UPPER, INITCAP
SELECT LOWER('HELLO') FROM dual; --�ҹ��ڷ� ��ȯ
SELECT LOWER(ename) FROM emp;

SELECT UPPER('welcome') FROM dual; --�빮�ڷ� ��ȯ

SELECT INITCAP('hello wORLD') FROM dual; --������ ù���ڸ� �빮�ڷ� ��ȯ �ϰ� �� ������ �ҹ��ڷ� ��ȯ
SELECT INITCAP(ename) FROM emp;

���� ���� �Լ� : CONCAT, SUBSTR, LENGTH, INSTR, LPAD, RPAD, TRIM, REPLACE
CONCAT(���ڿ�1,���ڿ�2) : ���ڿ�1�� ���ڿ�2�� �����Ͽ� �ϳ��� ���ڿ��� ��ȯ
SELECT CONCAT('Hello','World') FROM dual;
SELECT CONCAT(ename,job) FROM emp;

SUBSTR(����ڿ�,�ε���) : ����ڿ����� ������ �ε������� ���ڿ��� ����
(����) �ε��� 1���� ����
SELECT SUBSTR('Hello World',3) FROM dual;
SELECT SUBSTR('Hello World',3,3) FROM dual; --������ �ε������� 3���� ����
SELECT SUBSTR('Hello World',-3) FROM dual; -- �ڿ��� ����°���� ������ ����
SELECT SUBSTR('Hello World',-3,2) FROM dual; -- �ڿ��� ����°���� 2���� ����

LENGTH(���ڿ�) : ���ڿ��� ����
SELECT LENGTH('Hello World') FROM dual;

INSTR(����ڿ� �˻�����) : �˻������� ��ġ�� �˻�
SELECT INSTR('Hello World','e') FROM dual;

�˻����ڰ� ���� ��� 0
SELECT INSTR('Hello World','E') FROM dual;
SELECT INSTR('Hello World','o') FROM dual;
SELECT INSTR('Hello World','o',6) FROM dual; --(����ڿ�, �˻�����, �˻��ε��� : �ش���ġ���� �˻�)
            (����ڿ�,�˻�����,�˻��ε���,�ݺ�Ƚ��)
SELECT INSTR('HEllo World','o',1,2) FROM dual;

LPAD(����ڿ�,�ѱ���,����) : ������ ���̿� ���ڿ��� ����ϴµ� ������ ���ʿ� ������ ���ڷ� ä��
SELECT LPAD('Hello',10,'*') FROM dual;

RPAD(����ڿ�,�ѱ���,����) : ������ ���̿� ���ڿ��� ����ϴµ� ������ �����ʿ� ������ ���ڷ� ä��
SELECT RPAD('Hello',10,'~') FROM dual;

TRIM : ���ڿ����� �����̳� Ư�� ���ڸ� ������ ���� ���� ��ȯ
���� : ���� ->LEADING, ������->TRALLING, ����->BOTH(DEFAULT)
SELECT TRIM(LEADING 'h' FROM 'hanchh') FROM dual;
SELECT TRIM(BOTH 'h' FROM 'habchh') FROM dual;

REPLACE(����ڿ�,old,new) : ����ڿ����� old���ڸ� new���ڷ� ��ü
SELECT REPLACE('010.1234.5678','.','-') FROM dual;

�Լ� ��ø
SELECT ename, LOWER(SUBSTR(ename,1,3)) FROM emp;

[�ǽ�����]
1) emp ���̺��� ����(job)�� ù���ڴ� �빮�� �������� �ҹ��ڷ� ����Ͻÿ�.
SELECT INITCAP(job) FROM emp;

2) emp ���̺��� ����̸� �� A�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� �����Ͻÿ�.
SELECT SUBSTR(ename, 1,3) FROM emp WHERE ename LIKE '%A%';

3) �̸��� ����° ���ڰ� A�� ��� ����� �̸��� ǥ���Ͻÿ�
SELECT ename FROM emp WHERE SUBSTR(ename,3,1)='A';
SELECT ename FROM emp WHERE ename LIKE '__A%';

4) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�.
SELECT LOWER(ename) FROM emp WHERE LENGTH(ename)>=6;

5) ��� ����� �̸��� �޿��� ǥ���ϴµ� �޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� �������� ǥ���ϰ� �� ���̺� SALARY�� �����Ͻÿ�
SELECT ename,LPAD(sal,15,'$') "SALARY" FROM emp;

�����Լ�
CEIL(�Ǽ�) : �ø�ó���� �������� ��ȯ
SELECT CEIL(1.4) FROM dual;

FLOOR(�Ǽ�) : ���� ó���� �������� ��ȯ

SELECT FLOOR(1.7) FROM dual;

ROUND(������, �����ڸ���) : �ݿø�
SELECT ROUND(45.926,2) FROM dual;
SELECT ROUND(45.926) FROM dual;
SELECT empno,ename,sal, ROUND(sal*1.15) "NEW Salary", ROUND(sal*1.15)-sal "Increase" FROM emp;

TRUNC(������,�����ڸ���) : ����
SELECT TRUNC(45.926,2) FROM dual;
SELECT TRUNC(45.926) FROM dual;

MOD(������,��������) : ��������
SELECT MOD(17,2) FROM dual;

��¥�Լ�
SYSDATE : ORACLE ������ ���� ��¥�� �ð��� ��ȯ
SELECT SYSDATE FROM dual;

��¥�� ��� ������ ���
SELECT ename, (SYSDATE - hiredate)/7 AS WEEKS FROM emp WHERE deptno=10;

MONTHS_BETWEEN(��¥1,��¥2) : �� ��¥ ���� �� �� -- ū ��¥�� �տ��־� ���̳ʽ��� �ȶ�
SELECT MONTHS_BETWEEN('2023-03-23','2022-01-23') FROM dual; 
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) month_worked FROM emp ORDER BY month_worked;

ADD_MONTHS : Ư�� ��¥�� ���� ������ ���� ���� �ش� ��¥�� ��ȯ�ϴ� �Լ�
SELECT ADD_MONTHS('2023-09-10',8) FROM dual;

NEXT_DAY : ������ ������ ���� ��¥
SELECT NEXT_DAY('2023-09-05','������') FROM dual;
1(�Ͽ���) ~ 7(�����)
SELECT NEXT_DAY('2023-09-05',1) FROM dual;

LAST_DAY : ���� ������ ��

SELECT LAST_DAY('2023-09-22') FROM dual;

EXTRACT : ��¥ �������� Ư���� ����,��,��,�ð�,��,�� ���� ����
SELECT EXTRACT(YEAR FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE), EXTRACT(DAY FROM SYSDATE) FROM dual;

[�ǽ�]
1) ���ú��� �̹� ���� �������������� ���� �� ���� ���Ͻÿ�.
SELECT LAST_DAY(SYSDATE) - SYSDATE AS "���� �� ��" FROM dual;

2) emp���̺��� �� ����� ���� �����ȣ,�̸�,�޿� �� 15% �λ�� �޿��� ����(�ݿø�)�� ǥ���Ͻÿ�.
  �λ�� �޿����� ���̺��� NEW Salary�� �����Ͻÿ�.
SELECT empno,ename,sal,ROUND(sal*1.15) "NEW Salary" FROM emp;

3) �� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϻ��� ��������� �� ��)�� ����Ͽ� �� ���̺��� MONTHS_WORKED�� �����Ͻÿ�.
  ����� ������ �ݿø��Ͽ� ǥ���ϰ� �ٹ� �� ���� �������� �������� ����
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) "MONTHS_WORKED" FROM emp ORDER BY MONTHS_WORKED;
  
4) emp���̺��� �̸�(�ҹ��ڷ� ǥ��),����,�ٹ������� ����Ͻÿ�.
SELECT LOWER(ename),job, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) �ٹ����� FROM emp;

��ȯ�Լ�
TO_CHAR : ���� -> ����, ��¥ -> ����
TO_NUMBER : ���� -> ����
TO_DATE : ���� -> ��¥

TO_CHAR : ��¥ -> ����
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual; -- YYYY MM DD �ڿ� �ѱ۷� ǥ�� ����

TO_CHAR : ���� -> ����
���� �ڸ����� ��ġ
SELECT TO_CHAR(1234,9999) FROM dual; -- 9999 ���˹���
SELECT TO_CHAR(1234,'9999') FROM dual;
SELECT TO_CHAR(1234,0000) FROM dual; -- �����߻�
SELECT TO_CHAR(1234,'0000') FROM dual;

���� �ڸ������� �ڸ����� ���� ��� : ���� �߻�
SELECT TO_CHAR(1234,999) FROM dual;
SELECT TO_CHAR(1234.'999') FROM dual;
SELECT TO_CHAR(1234,'000') FROM dual;

���� �ڸ������� ���� �ڸ��� ����
SELECT TO_CHAR(1234,99999) FROM dual; --����1234 ���°� ��
SELECT TO_CHAR(1234,'99999') FROM dual; --����1234 ���°� ��
SELECT TO_CHAR(1234,'00000') FROM dual; --01234

�Ҽ��� �ڸ�
SELECT TO_CHAR(1234,9999.99) FROM dual; --1234.00 ���� ���� �ڸ��ε� 00�߰���
SELECT TO_CHAR(1234,'9999.99') FROM dual;
SELECT TO_CHAR(1234,'0000.00') FROM dual;

�ݿø��ؼ� �Ҽ��� ��°�ڸ����� ǥ��
SELECT TO_CHAR(25.897,'99.99') FROM dual; -- ROUND�� ���� �Ǵ� �Ǽ�, TO_CHAR �� ���ڿ��� ǥ�Ⱑ �� ��¦ �ٸ�
�λ�� �޿��� �Ҽ��� ù°�ڸ����� ǥ��
SELECT TO_CHAR(sal*1.1,'9,999.9') FROM emp;

��ȭǥ��
SELECT TO_CHAR(1234,'$0000') FROM dual;
SELECT TO_CHAR(1234,'L0000') FROM dual; --L�ڸ� ������ �� ������ ��ȭǥ�ð� ��

TO_DATE : ���� -> ��¥
SELECT TO_DATE('23-09-22','YYYY-MM-DD') FROM dual;
SELECT TO_DATE('2023-09-30') FROM dual; --�������� ���� ����

TO_NUMBER : ���� -> ����
SELECT TO_NUMBER('100','999') FROM dual; -- ����� ������ 100�� ����
SELECT TO_NUMBER('200') FROM dual; --�������� ���� ����

[�ǽ�����]
1) emp���̺��� ������ ������ 4�� ����� ������ �޴� ����� �̸��� ������ ����Ͻÿ�.(���ڸ� ���� ��ǥ ǥ��)
SELECT ename, TO_CHAR(sal,'9,999') FROM emp WHERE MOD(sal,4)=0;

2)�� ����� �̸��� ǥ���ϰ� �ٹ� �� ��(�Ի��Ϸκ��� ��������� �� ��)�� ����Ͽ� ǥ�� �ٹ� �� ���� ������ ǥ���ϴµ� TO_CHAR�� Ȱ��.
SELECT ename, TO_CHAR(MONTHS_BETWEEN(SYSDATE,hiredate),'999') MONTHS_WOKED FROM emp;

�Ϲ��Լ�
NVL(value,value2) : value1�� NULL�̸� value2�� ���(value1�� value2�� �ڷ��� ��ġ)
SELECT ename,sal,comm, sal+NVL(comm ,0) �Ǳ޿� FROM emp; -- comm ���ڰ�, 0�� ���ڿ��� �����۵�(�ڷ����� ��ġ�ϱ⶧����)
--SELECT ename,NVL(comm,'No Commission') "COMM." FROM emp; --������ �� ����: comm�� ���ڱ� ���� 'NO Commission'�� ���ڿ��̿���.
SELECT ename,NVL(TO_CHAR(comm),'NO Commission') "COMM." FROM emp; --TO_CHAR�� �̿��ؼ� ���ڸ� ���ڷ� �ٲ�

NVL2(value,value2,value3) : value1�� NULL���� ��. NULL�̸� value3, NULL�� �ƴϸ� value2���.(�ڷ����� ��ġ���� �ʾƵ� ��)
SELECT ename,comm, NVL2(comm,'commission','no commission') FROM emp;

NULLIF(value1,value2) : �ΰ��� ���� ��ġ�ϸ� NULL, �ΰ��� ���� ��ġ���� ������ value1
SELECT NULLIF(LENGTH(ename),LENGTH(job)) "NULLIF" FROM emp;

COALESCE(value1,value2,value3....) : NULL���� �ƴ� ���� ���(�ڷ��� ��ġ)
SELECT comm,mgr,sal, COALESCE(comm,mgr,sal) FROM emp; --ORDER BY comm,mgr NULLS LAST; NULL���� �Ʒ��� ���� my practice

CASE �÷� WHEN �񱳰� THEN �����   -- CASE WHEN THEN ELSE ���� ��� �ܿ��.
          WHEN       THEN
          WHEN       THEN
        (ELSE �����)
SELECT ename,sal,job,
       CASE job WHEN 'SALESMAN' THEN sal*0.1
                WHEN 'MANAGER' THEN sal*0.2
                WHEN 'ANALYST' THEN sal*0.3
                ELSE sal*0.4
       END "BONUS"
FROM emp;

SELECT ename,sal,job,  
       CASE WHEN sal>=4000 AND sal<=5000 THEN 'A'
            WHEN sal>=3000 AND sal<4000 THEN 'B'
            WHEN sal>=2000 AND sal<3000 THEN 'C'
            WHEN sal>=1000 AND sal<2000 THEN 'D'
            ELSE 'F'
    END "Grade"
FROM emp ORDER BY "Grade" ASC, sal DESC;

EDCODE : ����Ŭ ����, = �񱳸� ���� --�Ϲ������δ� WHEN THEN ELSE �̿�, ����Ŭ���� =���Ϸ��� EDCODE�� ��� ����
SELECT ename,sal,job,
       DECODE(job,'SALESMAN',sal*0.1,
       'MANAGER',sal*0.2,
       'ANALYST',sal*0.3,
       sal*0.4) "Bonus" 
FROM emp;

SELECT ename,sal,job,
      DECODE(TRUNC(sal/1000),5,'A',
                             4,'A',
                             3,'B',
                             2,'C',
                             1,'D',
                             'F') "Grade"
FROM emp ORDER BY "Grade", sal DESC;

�׷��Լ�
�׷��Լ��� �� ���� ������ �����Ͽ� �׷캰�� �ϳ��� ����� ����

AVG() : NULL�� ������ ��� ������ ����� ��ȯ, NULL���� ��� ��꿡�� ���õ�
SELECT ROUND(AVG(sal)) FROM emp;

COUNT() : NULL�� ������ ���� ���� ��� ���ڵ��� ���� ��ȯ. COUNT(*) ������ ����ϸ� NULL�� ��꿡 ����
SELECT COUNT(empno) FROM emp;
SELECT COUNT(comm) FROM emp;
SELECT COUNT(*) FROM emp;

MAX() : ���ڵ� ���� �ִ� ���� �� �� ���� ū ���� ��ȯ
SELECT MAX(sal) FROM emp;

MIN() : ���ڵ� ���� �ִ� ���� �� �� ���� ���� ���� ��ȯ
SELECT MIN(sal) FROM emp;

SUM() : ���ڵ� ���� �����ϰ� �ִ� ��� ���� ���Ͽ� ��ȯ
SELECT SUM(sal) FROM emp;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp;
SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp WHERE deptno=10;

SELECT COUNT(*) FROM emp WHERE deptno=10; --10�� �μ����� �ٹ��ϴ� �����
SELECT COUNT(empno) FROM emp WHERE deptno=20; -- 20�� �μ����� �ٹ��ϴ� �����
SELECT COUNT(comm), FROM emp; --Ŀ�̼� ����� �Ǿ��ִ� �����
SELECT COUNT(NVL(comm,0)) FROM emp;

GROUP BY & HAVING
SELECT���� �����Լ� ����� ���� �÷��� ������ �� ����
���� �÷��� ������ ��쿡�� �ݵ�� GROUP BY ���� ������ �÷��� ����

SELECT deptno, MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp GROUP BY deptno;
SELECT job, MAX(sal), MIN(sal) FROM emp GROUP BY job;

���� ������ GROUP BY �� ���
SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job ORDER BY deptno;

SELECT deptno, job, SUM(sal) FROM emp WHERE deptno=10 GROUP BY deptno,job ORDER BY deptno;

[�����߻�]
SELECT deptno,AVG(sal) FROM emp WHERE AVG(sal)>2000 GROUP BY deptno;

[���󱸹�]
�׷�ó�� ����� �����ϰ��� �� �� HAVING �� �̿�
WHERE������ �����Լ�(�׷��Լ�) ����� �� ���� HAVING�������� ��� ����
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>=2000;

HAVING ���� �̿� : HAVING ������ �˸��ƽ� ��� X
SELECT deptno, MAX(sal) maximum FROM emp GROUP BY deptno HAVING maximum>2000;
--SELECT deptno department, MAX(sal) maximum FROM emp GROUP BY deptno HAVING MAX(sal)>2000; ��밡�� ����

�׷��Լ� ��ø
SELECT MAX(AVG(sal)) FROM emp GROUP BY deptno;

�׷��Լ��� �̿�
�б⺰�� �Ի��� ����� ��
SELECT CEIL(EXTRACT(MONTH FROM hiredate)/3) AS quarter, COUNT(empno) AS COUNT_member FROM emp 
GROUP BY CEIL(EXTRACT(MONTH FROM hiredate)/3) ORDER BY quarter;

OR 

SELECT TO_CHAR(hiredate,'Q') AS quarter, COUNT(empno) AS count_member
FROM emp GROUP BY TO_CHAR(hiredate,'Q') ORDER BY quarter;

[�ǽ�]
1) emp���̺��� ����̸�, ����, ���ް� Ŀ�̼��� ���� ���� �÷��� �Ǳ޿���� �ؼ� ����Ͻÿ�. ��,NULL���� ��Ÿ���� �ʰ� �ۼ��Ͻÿ�.
--SELECT ename,sal,sal+comm as �Ǳ޿� FROM emp WHERE comm is not null;
SELECT ename,sal,sal+NVL(comm,0) �Ǳ޿� FROM emp;

2) ���ް� Ŀ�̼��� ��ģ �ݾ��� 2,000�̻��� �޿��� �޴� ����� �̸�, ����,����,Ŀ�̼�,��볯¥�� ����Ͻÿ�. �� ��볯¥�� 1980-12-17 ���·� ����Ͻÿ�.
SELECT ename, job, sal, comm,TO_DATE(hiredate,'YYYY-MM-DD') hiredate FROM emp WHERE sal+NVL(comm,0)>=2000;

3) ��� ����� �޿� �ְ��,������,�Ѿ� �� ��վ��� ǥ���Ͻÿ�. �� ���̺��� ���� maximum,minimum, sum �� average �� �����ϰ� ����� ������ �ݿø��ϰ� ���ڸ� ������ ,�� ����Ͻÿ�.
SELECT TO_CHAR(MAX(sal),'9,999') maximum, TO_CHAR(MIN(sal),'9,999') minimum, TO_CHAR(SUM(sal),'99,999') sum, TO_CHAR(AVG(sal),'9,999') average FROM emp;

4) emp���̺��� �޿��� Ŀ�̼��� ���� �ݾ��� �ְ�, ����, ��ձݾ��� ���Ͻÿ�. ��ձݾ��� �Ҽ��� ù°�ڸ� ���� ǥ���Ͻÿ�.
SELECT MAX(sal+NVL(comm,0))�ְ�, MIN(sal+NVL(comm,0))����, ROUND(AVG(sal+NVL(comm,0)),1)��� FROM emp;

5)������ ������ ������ ������� ǥ���Ͻÿ�.(������ ������� ���Ͻÿ�)
SELECT job,COUNT(*) FROM emp GROUP BY job;

6) 20�� �μ��� �޿� �հ踦 ���ϰ� �޿� �հ� �ݾ��� ����Ͻÿ�.
SELECT SUM(sal) FROM emp WHERE deptno=20;

7) �μ����� ���޵� �ѿ��޿��� �ݾ��� 9,000�̻��� �޴� ������� �μ���ȣ, �ѿ����� ����Ͻÿ�.
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal)>=9000;

8) �������� �����ȣ�� ���� ���� ����� ���ϰ� �� ��� ������ �����ȣ�� 79�� �����ϴ� ����� �����ֽÿ�.
SELECT job, MAX(empno) FROM emp GROUP BY job HAVING MAX(empno) LIKE '%79%';

9) ������ �ѿ����� ����ϴµ� ������ 'MANAGER'�� ������� �����ϰ� �ѿ����� 5,000���� ���� ������ �� ���޸� ����Ͻÿ�.
SELECT job,SUM(sal) FROM emp WHERE job <> 'MANAGER' GROUP BY job HAVING SUM(sal)>5000;

10) �������� ������� 4�� �̻��� ������ �ο����� ����Ͻÿ�.
SELECT job, COUNT(empno) FROM emp GROUP BY job HAVING COUNT(empno)>=4;

RANK() : ������ ǥ���� �� ����ϴ� �Լ�
RANK(���ǰ�) WITHIN GROUP (ORDER BY ���ǰ� �÷��� [ASC|DESC]) : Ư�� �������� ���� Ȯ���ϱ�
(����) RANK �ڿ� ������ �����Ϳ� ORDER BY �ڿ� ������ �����ʹ� ���� �÷��̾�� ��.
SELECT RANK ('SMITH') WITHIN GROUP (ORDER BY ename DESC) "RANK" FROM emp;

��ü���� ����
RANK() OVER (ORDER BY �÷���)
������� empno,ename,sal,�޿� ������ ���
SELECT empno,ename,sal,RANK() OVER(ORDER BY sal) AS RANK_ASC,
RANK() OVER(ORDER BY sal DESC) AS RANK_DESC FROM emp;

emp���̺��� 10���μ��� ���� ������� ����� �̸�,�޿�,�ش� �μ� ���� �޿� ������ ���
SELECT empno,ename,sal, RANK () OVER(ORDER BY sal DESC) RANK FROM emp WHERE deptno=10;

emp���̺��� ��ȸ�Ͽ� ���,�̸�,�޿�,�μ���ȣ,�μ��� �޿� ������ ���
SELECT empno,ename,sal,deptno, RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) RNAK FROM emp;
--PARTITION BY : RANK() OVER()���� �׷��� ��Ÿ������ �Ҷ� ���

emp���̺��� ��ȸ�Ͽ� empno,ename,sal,deptno,job ���� �μ� �� job���� �޿� ���� ���.
SELECT empno,ename,sal,deptno,job, RANK() OVER(PARTITION BY deptno,job ORDER BY sal DESC) RANK FROM emp;

����(JOIN) : �� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���
            ���� �� �̻��� ����� ����� �� PRIMARY KEY �� FOREIGN KEY ���� ����Ͽ� ���� 
            �� ���� ���̺��� SELECT ���� �ȿ��� �����Ϸ��� ��� �ϳ��� �÷��� �� �� ���̺� ���̿� �����Ǿ�� ��
            
īƼ�� ��(Cartesian Product)
�˻��ϰ��� �ߴ� ������ �� 
�ƴ϶� ���ο� ���� ���̺��� ���� �����Ͱ� ��ȯ�Ǵ� ����
SELECT * FROM emp,dept;

[ORACLE ����]
- ���� ����(Equi JOIN) : ������ Equality Condition(=)�� ���Ͽ� ������ �̷�� ��
SELECT emp.ename,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno;

���̺� �˸��ƽ� �ο��ϱ�
SELECT e.ename,d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;

�÷����� ȣ���� �� ���̺�� �Ǵ� ���̺� �˸��ƽ��� ����
SELECT ename, e.deptno, dname FROM emp e, dept d WHERE e.deptno=d.deptno;

�߰����� ���� ����ϱ�
SELECT e.ename,d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND e.ename='ALLEN';

SELECT e.ename,e.sal,d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND e.sal BETWEEN 3000 AND 4000;

-�񵿵� ����(Non Equi Join)
���̺��� � �÷��� ������ ���̺��� �÷��� ��ġ���� ���� �� ����ϰ� ���� ������ ����(=)�ǿ��� �����ڸ� ����(betwenn ad, is null, in)

����̸�,�޿�,�޿���� ���ϱ�(emp,salgrade ���̺� �̿�)
SELECT e.ename,e.sal,s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

-SELF JOIN 
��� �̸��� �ش� ����� ������ �̸� ���ϱ�(�����ڰ� ���� ��� ����)
SELECT e.ename ����̸�, m.ename �������̸� FROM emp e, emp m WHERE e.mgr=m.empno;

�ܺ����� (Outer Join)
������ �� ���ο� ������ ���̺��� �� �� �÷����� ����� ���� ���ٸ� ���̺�κ��� �����͸� ��ȯ���� ����.
�����Ǵ� ���� �������� �Ϸ��� �ܺ� ���� ���
(����)�ܺ� ������ ǥ���� �� ������ ���� �ݴ� ���̺� + ��ȣ ǥ��

SELECT DISTINCT(e.deptno), d.deptno FROM emp e, dept d WHERE e.deptno(+)=d.deptno; -- (+) �� dept���̺��� �ݴ����� e.deptno�� �־��ָ� �����Ȱ��� ����

����̸��� �ش� ����� ������ �̸� ���ϱ�(�����ڰ� ���� ����� ǥ��)
SELECT e.ename ����̸�, m.ename �������̸� FROM emp e, emp m WHERE e.mgr=m.empno(+);

[�ǽ�����]
1)��� ����� �̸�, �μ���ȣ,�μ��̸��� ǥ���Ͻÿ�.(emp,dept)
SELECT e.ename,e.deptno,d.dname FROM emp e , dept d WHERE e.deptno=d.deptno;

2)������ MANAGER�� ����� ������ �̸�,����,�μ���,�ٹ��� ������ ����Ͻÿ�.(emp,dept)
SELECT e.ename,e.job,d.dname,d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.job='MANAGER';

3)Ŀ�̼��� �ް� �޿��� 1,600�̻��� ����� �̸�,�޿�,�μ���,�ٹ����� ����Ͻÿ�.(emp,dept)
SELECT e.ename,e.sal,d.dname,d.loc FROM emp e, dept d WHERE e.sal>=1600 AND e.comm>=0;
SELECT e.ename,e.sal,d.dname,d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.comm IS NOT NULL AND e.sal>=1600;

4)�ٹ����� CHICAGO�� ��� ����� �̸�,����,�μ���ȣ �� �μ��̸��� ǥ���Ͻÿ�.(emp,dept)
SELECT e.ename,e.job,e.deptno,d.dname FROM emp e, dept d WHERE d.loc='CHICAGO';
SELECT e.ename,e.job,e.deptno,d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND d.loc = 'CHICAGO';

5)�ٹ���(loc)���� �ٹ��ϴ� ����� ���� 5�� ������ ���, �ο��� ���� ���� ������ �����Ͻÿ�.(�ٹ��ο��� 0��)
SELECT d.loc, COUNT(e.empno) emp_member FROM emp e, dept d WHERE e.deptno(+)=d.deptno GROUP BY d.loc;

6)����� �̸� �� �����ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ� ������ �� ���̺��� emplyee,emp#,manager,mgr#�� �����Ͻÿ�.(������ ���� ��� �����)

7)�����ں��� ���� �Ի��� ������� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ǥ���ϰ� �� ���̺��� ���� employee,emp hired, manager, mgr hired�� �����Ͻÿ�.

8)������ �μ���ȣ,����̸� �� ������ ����� ������ �μ����� �ٹ��ϴ� ��� ����� ǥ���ϵ��� ���Ǹ� �ۼ��ϰ� �μ���ȣ�� department,����̸��� emplyee, ������ �μ����� �ٹ��ϴ� ����� colleague
  �� ǥ���Ͻÿ�.(�μ���ȣ,����̸�,���� ������ �������� ����)
