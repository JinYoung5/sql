PL/SQL
Procedural language extension to Structured Query Language(SQL)의 약자
SQL을 확장한 순차적 처리 언어

PL/SQL의 기본 구조
익명 블럭
1)선언부(declarative part) : 사용할 변수나 상수를 선언(선언부에만 변수와 상수 선언 가능)
2)실행부(executable part) : 실제 처리할 로직을 담당하는 부분
3)예외처리부(exception-building part) : 실행부에서 로직을 처리하던 중 발생할 수 있는 각종 오류들에 대해 처리

기본 구조--오라클 콘솔에 출력 dbms_output_line();  ex) 이클립스에서 system.out.println();

begin
    --실행부
    dbms_output.put_line('Hello World');
end;


declare
    --변수를 선언 할 수 있는 선언부
    message varchar2(100);
begin
    --실행부에 사용할 변수는 선언부에서 미리 선언되어야 함
    message :='Hello Oracle'; --message 뒤에 들어갈 대입 연산자 : ':='
    dbms_output.put_line(message);
end;


declare
    message varchar2(100) := 'Hello PL/SQL';
begin
    dbms_output.put_line(message);
end;


declare
    counter integer; --대입을 하지 않으면 counter 는 null
begin
    counter := counter + 1; --> null + 1 = null
    if counter is null then --null이면 true null이 아니면 false
    dbms_output.put_line('Result : counter is null');
    end if;
end;


declare
    --변수 선언
    counter integer;
    i integer;
begin
    --반복문
    for i in 1..9 loop --for  loop 사이에서 조건체크
        counter := 2 * i;
        dbms_output.put_line('2 * ' || i || ' = ' || counter);
    end loop;
end;

예외처리부 사용

declare
    counter integer;
begin
    counter := 10;
    counter := counter/0;
    dbms_output.put_line(counter);
    
    exception when others then
        dbms_output.put_line('errors');
end;

콜렉션
varray는 variable array의 약자로 고정 길이(fixed number)를 가진 배열

declare
    type varray_test is varray(3) of integer;
    varray1 varray_test; --위에서 선언한 varray_test 타입 변수
begin
    varray1 := varray_test(10,20,30);
    
    dbms_output.put_line(varray1(1));
    dbms_output.put_line(varray1(2));
    dbms_output.put_line(varray1(3));
end;

중첩 테이블
중첩 테이블은 varray와 흡사하지만 중첩 테이블은 선언 시에 전체 크기를 명시할 필요가 없다

declare
    type nested_test is table of varchar2(10);
    nested1 nested_test; --위에 선언한 nested_test 타입의 변수
begin
    nested1 := nested_test('A','B','C','D');
    
    dbms_output.put_line(nested1(2));
end;

연관배열(Associative Array) : index-by table이라고도 하며 키와 값의 쌍으로 구성된 콜렉션, 하나의 키는 하나의 값과 연관되어 있다.

declare
    type assoc_array is table of number index by pls_integer;
    --키는 pls_integer형이며, 값은 number형인 요소들로 구성
    assoc1 assoc_array;
begin
    assoc1(3) := 33; --키는 3, 값은 33
    dbms_output.put_line(assoc1(3));
end;

레코드
테이블의 컬럼들이 서로 다른 유형의 데이터 타입으로 구성되듯이 레코드 역시 해당 필드들이 각기 다른 데이터 타입을 가질 수 있음

declare
    type record1 is record(deptno number,dname varchar2(14),loc varchar2(13));
    rec1 record1; --위에서 선언한 record1을 받는 변수 선언
begin
    rec1.deptno := 50;
    rec1.dname := 'RECORD';
    rec1.loc := 'SEOUL';
    
    --rec1 레코드값을 dept 테이블에 insert
    INSERT INTO dept VALUES rec1;
    COMMIT;

    exception when others then
        ROLLBACK;
end;