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
