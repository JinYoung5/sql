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
