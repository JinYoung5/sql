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
is begin
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