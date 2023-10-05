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

if문

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

case문

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

loop문

declare
    test_number integer;
    result_num integer;
begin
    test_number := 1;
    
    loop
        result_num := 2 * test_number;
        if result_num > 20 then
            exit; -- 블록 종료
        else
            dbms_output.put_line(result_num);
            end if;
            
            test_number := test_number + 1;
    end loop;
    --loop 블럭을 빠져나오면 아래 코드를 실행함
    dbms_output.put_line('프로그램 끝');
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


while-loop문

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

for loop문

declare
    test_number integer;
    result_num integer;
begin
    
    for test_number in 1..10 loop
        result_num := 2 * test_number;
        dbms_output.put_line(result_num);
    end loop;
end;

--반대로 출력되게 하려면 in reverse
declare
    test_number integer;
    result_num integer;
begin
    
    for test_number in reverse 1..10 loop
        result_num := 2 * test_number;
        dbms_output.put_line(result_num);
    end loop;
end;

커서
SELECT 문장을 실행하면 조건에 따른 결과가 추출된다.
추출되는 결과는 한 건이 될 수도 있고 여러 건이 될 수도 있으므로 이를 결과 셋(Result Set)혹은 결과 집합이라고 부르기도 한다.
쿼리에 의해 반환되는 결과는 메모리 상에 위치하게 되는데 PL/SQL에서는 바로 커서(CURSOR)를 사용하여 이 결과집합에 접근할 수 있다.
즉, 커서를 사용하면 결과집합의 각 개별 데이터에 접근이 가능.

declare
    cursor emp_csr is
    SELECT empno
    FROM emp
    WHERE deptno=10;
    
    emp_no emp.empno%type;
begin
    --커서 열기 : 커서로 정의된 커리를 실행하는 역할
    open emp_csr;
    
    loop
        fetch emp_csr into emp_no; --커서를 이용해서 행에 접근. 컬럼값을 emp_no에 할당(fetch 역할)
        --%notfound : 커서에서만 사용 가능한 속성
        --더 이상 패치(할당)할 로우가 없음을 의미
        exit when emp_csr%notfound;
        
        dbms_output.put_line(emp_no);
    end loop;
    close emp_csr;
end;

함수

입력받은 값으로부터 10%의 세율을 얻는 함수
create or replace function tax(p_value in number)
    return number
is 
begin
    return p_value * 0.1; 
end;

SELECT TAX(100) FROM dual;
SELECT ename,sal,TAX(sal) tax, sal-TAX(sal) "실지급 급여" FROM emp;

급여와 커미션을 합쳐서 세금 계산
create or replace function tax2(p_sal in emp.sal%type, p_bonus emp.comm%type) --p_bonus 뒤에 in 생략
    return number
is
begin
    return (p_sal + NVL(p_bonus,0)) * 0.1; 
end;

SELECT empno,ename,sal,comm,TAX2(sal,comm) AS tax FROM emp;

급여(커미션 포함)에 대한 세율을 다음과 같이 정의함. 급여가 월 $1,000보다 적으면
세율을 5% 적용하며, $1,000이상 $2,000이하이면 10%, $2,000을 초과하면 20%를 적용
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

사원번호를 통해서 급여를 알려주는 함수
create or replace function emp_salaries(emp_no number)
    return number
is
    nSalaries number(9);
begin
    nSalaries := 0;
    SELECT sal
    -- 결과행이 단일행일 경우 INTO를 이용해서 읽어온 값을 변수에 담을 수 있음.
    INTO nSalaries
    FROM emp
    WHERE empno =emp_no;
    
    return nSalaries;
end;

SELECT EMP_SALARIES(7839) FROM dual; --emp로하면 중복값 모두 나옴, dual 로 해야됨
SELECT EMP_SALARIES(9000) FROM dual; --없는 사원번호를 입력하면 NULL반환

부서번호를 전달하면 부서명을 구할 수 있는 함수
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

[실습]
1)두 숫자를 제공하면 덧셈을 해서 결과값을 반환하는 함수를 정의하시오.(함수명: add_num)
create or replace function add_num(num1 integer, num2 integer)
    return integer
is
begin
    return num1 + num2;
end;

SELECT ADD_NUM(2,5) FROM dual;
SELECT ename, ADD_NUM(sal,NVL(comm,0))"실급여" FROM emp;

2)부서번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 정의하시오(함수명: get_emp_count).
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

SELECT deptno,dname,GET_EMP_COUNT(deptno) 사원수 FROM dept;

3)emp 테이블의 입사일을 입력하면 근무연차를 구하는 함수를 정의하시오.(소수점 자리 절삭, 함수명: get_info_hiredate)
create or replace function get_info_hiredate(hire_date emp.hiredate%type)
    return number
is   
begin
    return TRUNC(MONTHS_BETWEEN(SYSDATE,hire_date)/12);
end;

SELECT ename,GET_INFO_HIREDATE(hiredate)근무연차 FROM emp;

4)emp 테이블을 이용해서 사원번호를 입력하면 해당 사원의 관리자 이름을 구하는 함수를 정의하시오.(함수명get_mgr_name)
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

SELECT empno,ename,GET_MGR_NAME(empno) "관리자이름" FROM emp;

5)emp테이블을 이용해서 사원번호를 입력하면 급여등급을 구하는 함수를 정의하시오.(함수명: get_sal_grade)
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
            END grade --SQL문 안에서는 END CASE 안됨, END 만 가능
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

SELECT ename,sal,GET_SAL_GRADE(empno) 급여등급 FROM emp ORDER BY sal DESC;

6)사원번호를 입력하면 근무지를 구하는 함수(함수명: find_loc)
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

.프로시저.

create or replace procedure hello_world(p_message in varchar2)

is
begin
    dbms_output.put_line(p_message);
end;

execute hello_world('KOREA');
exec hello_world('SEOUL');

부서테이블에 부서정보를 입력하는 프로시저를 생성
create or replace procedure add_department(
                                        p_deptno in dept.deptno%type,
                                        p_dname in dept.dname%type,
                                        p_loc in dept.loc%type)
is
begin
    INSERT INTO dept
    VALUES (p_deptno, p_dname,p_loc);   
    COMMIT; --SQL문장이 정상적으로 수행되면 COMMIT
    
    exception when others then
    dbms_output.put_line(p_dname || 'register is failed');
    ROLLBACK; -- SQL문장이 정상적으로 수행 되지 않으면 ROLLBACK
    
end;

exec add_department(60,'IT SERVICE','BUSAN');

사원테이블에 사원정보를 저장
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

부서번호를 통해서 부서명과 부서의 위치를 구하기 
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

입사연도를 입력해서 해당 연도에 입사한 사원의 사원번호,이름,급여를 출력
create or replace procedure info_hiredate(
                                        p_year in varchar2)
is
    --%rowtype으로 데이터 타입이 지정되어 있는 사원테이블(emp)의 하나의 행이 가지고 있는 모든 컬럼의 데이터 타입을 가져옴
    e_emp emp%rowtype;
begin
    SELECT empno,ename,sal
    INTO e_emp.empno,e_emp.ename,e_emp.sal
    FROM emp
    WHERE TO_CHAR(hiredate,'YYYY') = p_year;
    
    dbms_output.put_line(e_emp.empno || ' ' || e_emp.ename || ' ' || e_emp.sal);
end;

하나의 행이 반환되어 에러가 발생하지 않음
exec info_hiredate('1980');
여러개의 행이 반환되어 에러 발생
exec info_hiredate('1981');

커서 이용하기
커서를 이용하여 질의 수행 결과 반환되는 여러 행을 처리
create or replace procedure info_hiredate(
                                        p_year in varchar2)
is
    e_emp emp%rowtype;
    --커서의 선언
    cursor emp_cur is
    SELECT empno, ename, sal
    FROM emp
    WHERE TO_CHAR(hiredate, 'YYYY')  = p_year;
begin
    --커서 열기
    open emp_cur;
    
    loop
    --커서를 이용해서 데이터를 변수에 할당 
        fetch emp_cur into e_emp.empno, e_emp.ename, e_emp.sal;
        --더이상 읽을 레코드가 존재하지 않으면 loop를 빠져나감
        exit when emp_cur%notfound;
        dbms_output.put_line(e_emp.empno || ' ' || e_emp.ename || ' ' || e_emp.sal);
    end loop;
    --커서 닫기
    close emp_cur;
end;

exec info_hiredate('1981');

SALES 부서에 속한 사원의 정보 보기
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

[실습문제]
1)업무(job)를 입력하여 해당 업무를 수행하는 사원의 사원번호, 이름 , 급여, 업무를 출력하시오.(job_info)
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

2)사원번호와 새 업무를 입력하면 emp테이블의 해당 사원의 업무를 갱신할 수 있는 프로시저를 작성하시오.(change_job)
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

3)부서 이름을 입력받으면 해당 부서의 사원에 대해 급여가 많은 순으로 정보를 제공
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
    --%rowcount : 커서에서 얻은 레코드의 수를 반환
    dbms_output.put_line(p_dept || '전체 인원수 : ' || emp_cur%rowcount);
    close emp_cur;
end;

exec emp_salary_info('SALES');