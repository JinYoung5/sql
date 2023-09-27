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