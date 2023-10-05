PL/SQL
Procedural language extension to Structured Query Language(SQL)�� ����
SQL�� Ȯ���� ������ ó�� ���

PL/SQL�� �⺻ ����
�͸� ��
1)�����(declarative part) : ����� ������ ����� ����(����ο��� ������ ��� ���� ����)
2)�����(executable part) : ���� ó���� ������ ����ϴ� �κ�
3)����ó����(exception-building part) : ����ο��� ������ ó���ϴ� �� �߻��� �� �ִ� ���� �����鿡 ���� ó��

�⺻ ����--����Ŭ �ֿܼ� ��� dbms_output_line();  ex) ��Ŭ�������� system.out.println();

begin
    --�����
    dbms_output.put_line('Hello World');
end;


declare
    --������ ���� �� �� �ִ� �����
    message varchar2(100);
begin
    --����ο� ����� ������ ����ο��� �̸� ����Ǿ�� ��
    message :='Hello Oracle'; --message �ڿ� �� ���� ������ : ':='
    dbms_output.put_line(message);
end;


declare
    message varchar2(100) := 'Hello PL/SQL';
begin
    dbms_output.put_line(message);
end;


declare
    counter integer; --������ ���� ������ counter �� null
begin
    counter := counter + 1; --> null + 1 = null
    if counter is null then --null�̸� true null�� �ƴϸ� false
    dbms_output.put_line('Result : counter is null');
    end if;
end;


declare
    --���� ����
    counter integer;
    i integer;
begin
    --�ݺ���
    for i in 1..9 loop --for  loop ���̿��� ����üũ
        counter := 2 * i;
        dbms_output.put_line('2 * ' || i || ' = ' || counter);
    end loop;
end;

����ó���� ���

declare
    counter integer;
begin
    counter := 10;
    counter := counter/0;
    dbms_output.put_line(counter);
    
    exception when others then
        dbms_output.put_line('errors');
end;

�ݷ���
varray�� variable array�� ���ڷ� ���� ����(fixed number)�� ���� �迭

declare
    type varray_test is varray(3) of integer;
    varray1 varray_test; --������ ������ varray_test Ÿ�� ����
begin
    varray1 := varray_test(10,20,30);
    
    dbms_output.put_line(varray1(1));
    dbms_output.put_line(varray1(2));
    dbms_output.put_line(varray1(3));
end;

��ø ���̺�
��ø ���̺��� varray�� ��������� ��ø ���̺��� ���� �ÿ� ��ü ũ�⸦ ����� �ʿ䰡 ����

declare
    type nested_test is table of varchar2(10);
    nested1 nested_test; --���� ������ nested_test Ÿ���� ����
begin
    nested1 := nested_test('A','B','C','D');
    
    dbms_output.put_line(nested1(2));
end;

�����迭(Associative Array) : index-by table�̶�� �ϸ� Ű�� ���� ������ ������ �ݷ���, �ϳ��� Ű�� �ϳ��� ���� �����Ǿ� �ִ�.

declare
    type assoc_array is table of number index by pls_integer;
    --Ű�� pls_integer���̸�, ���� number���� ��ҵ�� ����
    assoc1 assoc_array;
begin
    assoc1(3) := 33; --Ű�� 3, ���� 33
    dbms_output.put_line(assoc1(3));
end;

���ڵ�
���̺��� �÷����� ���� �ٸ� ������ ������ Ÿ������ �����ǵ��� ���ڵ� ���� �ش� �ʵ���� ���� �ٸ� ������ Ÿ���� ���� �� ����

declare
    type record1 is record(deptno number,dname varchar2(14),loc varchar2(13));
    rec1 record1; --������ ������ record1�� �޴� ���� ����
begin
    rec1.deptno := 50;
    rec1.dname := 'RECORD';
    rec1.loc := 'SEOUL';
    
    --rec1 ���ڵ尪�� dept ���̺� insert
    INSERT INTO dept VALUES rec1;
    COMMIT;

    exception when others then
        ROLLBACK;
end;

if��

declare
    grade char(1); 
begin
    grade := 'B';
    if grade = 'A' then
   dbms_output.put_line('Execllent');
   elsif grade = 'B' then
   dbms_output.put_line('Good');
   elsif grade = 'C' then
   dbms_output.put_line('Fair');
   elsif grade = 'D' then
   dbms_output.put_line('Poor');
   end if;
end;

case��

declare
    grade char(1);
begin
    grade := 'B';
    
    case grade
    when 'A' then
    dbms_output.put_line('Excellent');
    when 'B' then
    dbms_output.put_line('Good');
    when 'C' then
    dbms_output.put_line('Fair');
    when 'D' then
    dbms_output.put_line('Poor');
    end case;
end;

loop��

declare
    test_number integer;
    result_num integer;
begin
    test_number := 1;
    
    loop
        result_num := 2 * test_number;
        if result_num > 20 then
            exit; -- ��� ����
        else
            dbms_output.put_line(result_num);
            end if;
            
            test_number := test_number + 1;
    end loop;
    --loop ���� ���������� �Ʒ� �ڵ带 ������
    dbms_output.put_line('���α׷� ��');
end;

declare
    test_number integer;
    result_num integer;
begin
    test_number := 1;
    
    loop
        result_num := 2 * test_number;
        
        exit when result_num >20;
        
        dbms_output.put_line(result_num);
        test_number := test_number + 1;
    end loop;
end;


while-loop��

declare
    test_number integer;
    result_num integer;
begin
    test_number := 1;
    result_num := 0;
    
    while result_num < 20 loop
        result_num := 2 * test_number;
        dbms_output.put_line(result_num);
        test_number := test_number + 1;
    end loop;   
end;

for loop��

declare
    test_number integer;
    result_num integer;
begin
    
    for test_number in 1..10 loop
        result_num := 2 * test_number;
        dbms_output.put_line(result_num);
    end loop;
end;

--�ݴ�� ��µǰ� �Ϸ��� in reverse
declare
    test_number integer;
    result_num integer;
begin
    
    for test_number in reverse 1..10 loop
        result_num := 2 * test_number;
        dbms_output.put_line(result_num);
    end loop;
end;

Ŀ��
SELECT ������ �����ϸ� ���ǿ� ���� ����� ����ȴ�.
����Ǵ� ����� �� ���� �� ���� �ְ� ���� ���� �� ���� �����Ƿ� �̸� ��� ��(Result Set)Ȥ�� ��� �����̶�� �θ��⵵ �Ѵ�.
������ ���� ��ȯ�Ǵ� ����� �޸� �� ��ġ�ϰ� �Ǵµ� PL/SQL������ �ٷ� Ŀ��(CURSOR)�� ����Ͽ� �� ������տ� ������ �� �ִ�.
��, Ŀ���� ����ϸ� ��������� �� ���� �����Ϳ� ������ ����.

declare
    cursor emp_csr is
    SELECT empno
    FROM emp
    WHERE deptno=10;
    
    emp_no emp.empno%type;
begin
    --Ŀ�� ���� : Ŀ���� ���ǵ� Ŀ���� �����ϴ� ����
    open emp_csr;
    
    loop
        fetch emp_csr into emp_no; --Ŀ���� �̿��ؼ� �࿡ ����. �÷����� emp_no�� �Ҵ�(fetch ����)
        --%notfound : Ŀ�������� ��� ������ �Ӽ�
        --�� �̻� ��ġ(�Ҵ�)�� �ο찡 ������ �ǹ�
        exit when emp_csr%notfound;
        
        dbms_output.put_line(emp_no);
    end loop;
    close emp_csr;
end;

�Լ�

�Է¹��� �����κ��� 10%�� ������ ��� �Լ�
create or replace function tax(p_value in number)
    return number
is 
begin
    return p_value * 0.1; 
end;

SELECT TAX(100) FROM dual;
SELECT ename,sal,TAX(sal) tax, sal-TAX(sal) "������ �޿�" FROM emp;

�޿��� Ŀ�̼��� ���ļ� ���� ���
create or replace function tax2(p_sal in emp.sal%type, p_bonus emp.comm%type) --p_bonus �ڿ� in ����
    return number
is
begin
    return (p_sal + NVL(p_bonus,0)) * 0.1; 
end;

SELECT empno,ename,sal,comm,TAX2(sal,comm) AS tax FROM emp;

�޿�(Ŀ�̼� ����)�� ���� ������ ������ ���� ������. �޿��� �� $1,000���� ������
������ 5% �����ϸ�, $1,000�̻� $2,000�����̸� 10%, $2,000�� �ʰ��ϸ� 20%�� ����
create or replace function tax3(p_sal emp.sal%type, p_bonus emp.comm%type)
    return number
is
    e_sum number;
    e_tax number;
begin
    e_sum := p_sal + NVL(p_bonus,0);
    
    if e_sum < 1000 then
        e_tax := e_sum * 0.05;
    elsif e_sum <= 2000 then
        e_tax := e_sum * 0.1;
    else
        e_tax := e_sum * 0.2;
    end if;
    
    return e_tax;
end;

SELECT empno,ename,sal,comm,TAX3(sal,comm) AS tax FROM emp;

�����ȣ�� ���ؼ� �޿��� �˷��ִ� �Լ�
create or replace function emp_salaries(emp_no number)
    return number
is
    nSalaries number(9);
begin
    nSalaries := 0;
    SELECT sal
    -- ������� �������� ��� INTO�� �̿��ؼ� �о�� ���� ������ ���� �� ����.
    INTO nSalaries
    FROM emp
    WHERE empno =emp_no;
    
    return nSalaries;
end;

SELECT EMP_SALARIES(7839) FROM dual; --emp���ϸ� �ߺ��� ��� ����, dual �� �ؾߵ�
SELECT EMP_SALARIES(9000) FROM dual; --���� �����ȣ�� �Է��ϸ� NULL��ȯ

�μ���ȣ�� �����ϸ� �μ����� ���� �� �ִ� �Լ�
create or replace function get_dept_name(dept_no number)
    return varchar2
is
    sDeptName varchar2(30);
begin
    SELECT dname
    INTO sDeptName
    FROM dept
    WHERE deptno = dept_no;
    
    return sDeptName;
end;

SELECT GET_DEPT_NAME(50) FROM dual;

[�ǽ�]
1)�� ���ڸ� �����ϸ� ������ �ؼ� ������� ��ȯ�ϴ� �Լ��� �����Ͻÿ�.(�Լ���: add_num)
create or replace function add_num(num1 integer, num2 integer)
    return integer
is
begin
    return num1 + num2;
end;

SELECT ADD_NUM(2,5) FROM dual;
SELECT ename, ADD_NUM(sal,NVL(comm,0))"�Ǳ޿�" FROM emp;

2)�μ���ȣ�� �Է��ϸ� �ش� �μ����� �ٹ��ϴ� ��� ���� ��ȯ�ϴ� �Լ��� �����Ͻÿ�(�Լ���: get_emp_count).
create or replace function get_emp_count(dept_no emp.deptno%type)
    return integer  
is
   emp_count integer;
begin
    
    SELECT COUNT(empno)
    INTO emp_count
    FROM emp
    WHERE deptno = dept_no;
    
    return emp_count;
end;

SELECT deptno,dname,GET_EMP_COUNT(deptno) ����� FROM dept;

3)emp ���̺��� �Ի����� �Է��ϸ� �ٹ������� ���ϴ� �Լ��� �����Ͻÿ�.(�Ҽ��� �ڸ� ����, �Լ���: get_info_hiredate)
create or replace function get_info_hiredate(hire_date emp.hiredate%type)
    return number
is   
begin
    return TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12);
end;

SELECT ename,GET_INFO_HIREDATE(hiredate)�ٹ����� FROM emp;

4)emp ���̺��� �̿��ؼ� �����ȣ�� �Է��ϸ� �ش� ����� ������ �̸��� ���ϴ� �Լ��� �����Ͻÿ�.(�Լ���get_mgr_name)
create or replace function get_mgr_name(emp_no emp.empno%type)
    return varchar2
is
    m_name varchar2(10);
begin
    SELECT ename
    INTO m_name
    FROM emp
    WHERE empno = (SELECT mgr FROM emp WHERE empno = emp_no);
    
    return m_name;
end;

create or replace function get_mgr_name(emp_no emp.empno%type)
    return varchar2
is
    m_name varchar2(10);
begin
    SELECT m.ename
    INTO m_name
    FROM emp a, emp m
    WHERE a.mgr = m.empno AND a.empno = emp_no;
    
    return m_name;
end;

SELECT empno,ename,GET_MGR_NAME(empno) "�������̸�" FROM emp;

5)emp���̺��� �̿��ؼ� �����ȣ�� �Է��ϸ� �޿������ ���ϴ� �Լ��� �����Ͻÿ�.(�Լ���: get_sal_grade)
create or replace function get_sal_grade(emp_no emp.empno%type)
    return char
is
    sgrade char(1);
begin
    SELECT CASE WHEN sal >=4000 THEN 'A'
                WHEN sal >=3000 THEN 'B'
                WHEN sal >=2000 THEN 'C'
                WHEN sal >=1000 THEN 'D'
                ELSE 'F'
            END grade --SQL�� �ȿ����� END CASE �ȵ�, END �� ����
    INTO sgrade
    FROM emp
    WHERE empno = emp_no;
    
    return sgrade;
end;

create or replace function get_sal_grade(emp_no emp.empno%type)
    return number
is
    sgrade number;
begin
    SELECT s.grade
    INTO sgrade
    FROM emp e, salgrade s
    WHERE e.sal BETWEEN s.losal AND s.hisal
    AND e.empno = emp_no;
    return sgrade;
end;

SELECT ename,sal,GET_SAL_GRADE(empno) �޿���� FROM emp ORDER BY sal DESC;

6)�����ȣ�� �Է��ϸ� �ٹ����� ���ϴ� �Լ�(�Լ���: find_loc)
create or replace function find_loc(emp_no number)
    return varchar2
is
    dept_loc varchar2(14);
begin
    SELECT loc
    INTO dept_loc
    FROM dept
    WHERE deptno = (SELECT deptno FROM emp WHERE empno = emp_no);
    
    return dept_loc;
end;

create or replace function find_loc(emp_no number)
    return varchar2
is
    dept_loc varchar2(14);
begin
    SELECT d.loc
    INTO dept_loc
    FROM emp e INNER JOIN dept d
    ON e.deptno = d.deptno
    WHERE e.empno = emp_no;
    return dept_loc;
end;

SELECT FIND_LOC (7698) FROM dual;
SELECT empno,ename,FIND_LOC(empno) FROM emp;

.���ν���.

create or replace procedure hello_world(p_message in varchar2)

is
begin
    dbms_output.put_line(p_message);
end;

execute hello_world('KOREA');
exec hello_world('SEOUL');

�μ����̺� �μ������� �Է��ϴ� ���ν����� ����
create or replace procedure add_department(
                                        p_deptno in dept.deptno%type,
                                        p_dname in dept.dname%type,
                                        p_loc in dept.loc%type)
is
begin
    INSERT INTO dept
    VALUES (p_deptno, p_dname,p_loc);   
    COMMIT; --SQL������ ���������� ����Ǹ� COMMIT
    
    exception when others then
    dbms_output.put_line(p_dname || 'register is failed');
    ROLLBACK; -- SQL������ ���������� ���� ���� ������ ROLLBACK
    
end;

exec add_department(60,'IT SERVICE','BUSAN');

������̺� ��������� ����
create or replace procedure register_emp(
                                        e_no number,
                                        e_name varchar2,
                                        e_work varchar2,
                                        e_mgr number,
                                        e_sal number,
                                        e_comm number,
                                        e_deptno number)

is
begin
    INSERT INTO emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
    VALUES (e_no,e_name,e_work,e_mgr,SYSDATE,e_sal,e_comm,e_deptno);
    COMMIT;
    
    exception when others then
    dbms_output.put_line(e_name || ' register is failed');
    ROLLBACK;
end;

execute register_emp(9000,'PETER','MANAGER',7902,6000,200,30);

�μ���ȣ�� ���ؼ� �μ���� �μ��� ��ġ�� ���ϱ� 
create or replace procedure output_department(p_dept_no in dept.deptno%type)
is
    d_dname dept.dname%type;
    d_loc dept.loc%type;
begin
    SELECT dname,loc
    INTO d_dname,d_loc
    FROM dept
    WHERE deptno=p_dept_no;
    
    dbms_output.put_line(d_dname || ',' || d_loc);
end;

exec output_department(10);

�Ի翬���� �Է��ؼ� �ش� ������ �Ի��� ����� �����ȣ,�̸�,�޿��� ���
create or replace procedure info_hiredate(
                                        p_year in varchar2)
is
    --%rowtype���� ������ Ÿ���� �����Ǿ� �ִ� ������̺�(emp)�� �ϳ��� ���� ������ �ִ� ��� �÷��� ������ Ÿ���� ������
    e_emp emp%rowtype;
begin
    SELECT empno,ename,sal
    INTO e_emp.empno,e_emp.ename,e_emp.sal
    FROM emp
    WHERE TO_CHAR(hiredate,'YYYY') = p_year;
    
    dbms_output.put_line(e_emp.empno || ' ' || e_emp.ename || ' ' || e_emp.sal);
end;

�ϳ��� ���� ��ȯ�Ǿ� ������ �߻����� ����
exec info_hiredate('1980');
�������� ���� ��ȯ�Ǿ� ���� �߻�
exec info_hiredate('1981');

Ŀ�� �̿��ϱ�
Ŀ���� �̿��Ͽ� ���� ���� ��� ��ȯ�Ǵ� ���� ���� ó��
create or replace procedure info_hiredate(
                                        p_year in varchar2)
is
    e_emp emp%rowtype;
    --Ŀ���� ����
    cursor emp_cur is
    SELECT empno, ename, sal
    FROM emp
    WHERE TO_CHAR(hiredate, 'YYYY')  = p_year;
begin
    --Ŀ�� ����
    open emp_cur;
    
    loop
    --Ŀ���� �̿��ؼ� �����͸� ������ �Ҵ� 
        fetch emp_cur into e_emp.empno, e_emp.ename, e_emp.sal;
        --���̻� ���� ���ڵ尡 �������� ������ loop�� ��������
        exit when emp_cur%notfound;
        dbms_output.put_line(e_emp.empno || ' ' || e_emp.ename || ' ' || e_emp.sal);
    end loop;
    --Ŀ�� �ݱ�
    close emp_cur;
end;

exec info_hiredate('1981');

SALES �μ��� ���� ����� ���� ����
create or replace procedure emp_info(  
                                    p_dept dept.dname%type)
is
    e_emp_no emp.empno%type;
    e_emp_name emp.ename%type;
    
    cursor emp_cur is
    SELECT empno, ename
    FROM emp e JOIN dept d
    ON e.deptno = d.deptno
    WHERE dname = UPPER(p_dept);
begin
    open emp_cur;
    
    loop
        fetch emp_cur into e_emp_no, e_emp_name;
        exit when emp_cur%notfound;
        dbms_output.put_line(e_emp_no || ' ' || e_emp_name);
    end loop;
    
    close emp_cur;

end;

exec emp_info('SALES');

[�ǽ�����]
1)����(job)�� �Է��Ͽ� �ش� ������ �����ϴ� ����� �����ȣ, �̸� , �޿�, ������ ����Ͻÿ�.(job_info)
create or replace procedure job_info(p_job emp.job%type)
is
    e_emp emp%rowtype;
    cursor emp_cur is
    SELECT empno, ename, sal, job
    FROM emp
    WHERE job = p_job;
begin
    open emp_cur;
    loop
        fetch emp_cur into e_emp.empno, e_emp.ename, e_emp.sal, e_emp.job;
        exit when emp_cur%notfound;
        dbms_output.put_line(e_emp.empno || ' ' || e_emp.ename || ' ' || e_emp.sal || ' ' || e_emp.job);
    end loop;
    close emp_cur;
end;

exec job_info('MANAGER');

2)�����ȣ�� �� ������ �Է��ϸ� emp���̺��� �ش� ����� ������ ������ �� �ִ� ���ν����� �ۼ��Ͻÿ�.(change_job)
create or replace procedure change_job(e_no emp.empno%type, e_job emp.job%type)
is

begin
    UPDATE emp SET job = e_job WHERE empno = e_no;
    COMMIT;
    
    exception when others then
        dbms_output.put_line(e_no || ' update is failed');
    ROLLBACK;
end;

exec change_job(7369,'DRIVER');

3)�μ� �̸��� �Է¹����� �ش� �μ��� ����� ���� �޿��� ���� ������ ������ ����
create or replace procedure emp_salary_info(
                                            p_dept dept.dname%type)
is
    cursor emp_cur is
    SELECT empno, ename, sal
    FROM emp e JOIN dept d
    ON e.deptno = d.deptno
    WHERE d.dname  = UPPER(p_dept)
    ORDER BY sal DESC;
    
    e_emp emp%rowtype;
begin
    open emp_cur;
    loop
        fetch emp_cur into e_emp.empno, e_emp.ename, e_emp.sal;
        exit when emp_cur%notfound;
        dbms_output.put_line(e_emp.empno || ' ' || e_emp.ename || ' ' || e_emp.sal);
    end loop;
    --%rowcount : Ŀ������ ���� ���ڵ��� ���� ��ȯ
    dbms_output.put_line(p_dept || '��ü �ο��� : ' || emp_cur%rowcount);
    close emp_cur;
end;

exec emp_salary_info('SALES');