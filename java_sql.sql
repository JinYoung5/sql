oracle sql
SELECT문 : 데이터베이스로부터 저장되어 있는 데이터를 검색하는데 사용

전체 컬럼과 연결된 데이터를 읽어옴

SELECT * FROM emp;  -- " * " 모든 컬럼을 불러오는 키

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno, FROM emp; --전체 컬럼명 명시

일부 컬럼(열)과 연결된 데이터를 읽어옴

SELECT empno,ename,sal FROM emp;

주석
SELECT /*특정 컬럼명 지정*/ empno,ename,job From emp; --sql내부에 주석명시할 때는 "/**/" 로 표기
dual : 함수 및 계산의 결과를 볼 때 사용할 수 있는 공용(public) 테이블
SELECT SYSDATE FROM dual;
SELECT ASCII('A') FROM dual;
SELECT 7 + 10 FROM dual;

산술식 : 산술연산자(+,-,*,/)를 사용하여 숫자 및 날짜 데이터로 표현식을 작성
SELECT ename, sal, sal+300 FROM emp;

연산자 우선순위
SELECT ename, sal, (sal+300)*12 FROM emp;

NULL값 정의 : NULL은 사용할 수 없거나 할당되지 않았거나 알 수 없거나, 적용할 수 없는 값
            (NULL은 0 이나 공백과는 다름)
SELECT empno,ename,job,comm FROM emp; --오라클에서 null은 입력을 안한 데이터

산술식의 NULL값 : NULL값을 포함한 산술식은 NULL로 계산
SELECT ename, sal+300, comm+300 FROM emp;

열 알리아스 : 열의 별칭
열 이름을 바꿈
열 이름 바로 뒤에 나옴. 열 이름과 알리아스 사이에 선택 사항인 as 키워드가 올 수도 있음
알리아스에 큰따옴표를 사용하는 경우
- 대소문자 구별을 원할 때
- 공백 포함시
- _,#등 특수문자 사용시( _(언더바) 는 ""(큰따옴표)없이 중간에는 올수 있으나 맨 앞에 오면 오류 발생)
- 숫자로 시작할 경우

SELECT sal*12 ASal FROM emp;
SELECT sal*12 AS ASal FROM emp;
SELECT sal*12 "Annual Salary" FROM emp; --별칭을 넣고싶으면 "" 안에 작성해야됨

연결 연산자 : 열이나 문자열을 다른 열에 연결
SELECT ename || ' has$ ' || sal salary FROM emp;

연결연산자와 NULL값 : 문자열에 NULL값을 결합할 경우 결과는 문자열
SELECT ename || comm FROM emp;

DISTINCT : 중복행 삭제
SELECT DISTINCT deptno FROM emp;
SELECT DISTINCT(deptno) FROM emp;

[실습문제]
1) emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오.
2) emp 테이블에서 사원이름과 월급을 출력하는데 컬럼명은 "이 름","월 급" 으로 바꿔서 출력하시오.
3) emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 "사원번호","사원이름","월급","연봉"으로 출력하시오.
4) emp 테이블에서 업무를 중복되지 않게 표시하시오.
5) emp 테이블에서 사원명과 업무를 쉼표(,)로 연결해서 표시하고 컬럼명은 Employee and Job으로 표시하시오.

SELECT empno,ename,sal FROM emp;
SELECT ename "이 름", sal "월 급" FROM emp;
SELECT empno 사원번호, ename 사원이름, sal 월급, sal*12 연봉 FROM emp;
SELECT DISTINCT Job FROM emp;
SELECT ename || ',' || job "Employee and Job" FROM emp;

WHERE 절 : 조건을 체크해서 행 선택 제한
         알리아스는 사용할 수 없음.
SELECT * FROM emp WHERE deptno=10;
SELECT ename, job, deptno FROM emp WHERE ename = 'SMITH';
SELECT ename,hiredate FROM emp WHERE hiredate>'81/04/02';

(주의)WHERE절에서는 알리아스를 사용할 수 없음
SELECT ename,sal,sal*12 ansal FROM emp WHERE sal*12 > 15000;

비교연산자의 사용
SELECT ename,hiredate FROM emp WHERE hiredate = '81/06/09';
SELECT ename,hiredate FROM emp WHERE hiredate <> '81/06/09';
SELECT ename,hiredate FROM emp WHERE hiredate != '81/06/09';
SELECT ename,hiredate FROM emp WHERE hiredate ^= '81/06/09';

이상 ~ 이하
SELECT ename, job, sal FROM emp WHERE sal >= 2000 AND sal<= 5000;

BETWEEN ~ AND ~ : 두 값 사이(지정한 값 포함)
SELECT ename,job,sal FROM emp WHERE sal BETWEEN 2000 AND 5000;
SELECT ename,job,sal FROM emp WHERE sal NOT BETWEEN 2000 AND 5000;

SELECT ename,job,deptno FROM emp WHERE ename BETWEEN 'KING' AND 'SMITH';
SELECT ename,job,deptno FROM emp
WHERE ename NOT BETWEEN 'KING' AND 'SMITH'; --부정 NOT

IN : 값 목록 중의 값과 일치
SELECT ename,sal,deptno FROM emp WHERE sal IN(1300,2450,3000);
SELECT ename,sal,deptno FROM emp WHERE sal NOT IN(1300,2450,3000); --부정 NOT

SELECT ename, job, hiredate FROM emp WHERE ename IN ('ALLEN','FORD');

LIKE : 패턴을 이용한 검색 가능
% 는 0개 이상의 문자를 나타냄
_ 는 한 문자를 나타냄

SELECT ename,job,hiredate FROM emp WHERE ename LIKE '%S%';
SELECT ename,job,hiredate FROM emp WHERE ename NOT LIKE '%S%';

SELECT ename,job,sal,hiredate FROM emp WHERE ename LIKE 'S%'; -- s로 시작하는이름
SELECT empno,ename,hiredate FROM emp WHERE hiredate LIKE '%22'; -- 22로 끝나는 입사일

SELECT ename,sal FROM emp WHERE ename LIkE 'FOR_'; --FOR 다음에 꼭 한 글자

[실습문제]
1) emp 테이블에서 사원번호가 7698인 사원의 이름, 업무, 급여를 출력하시오. 
SELECT ename,job,sal FROM emp WHERE empno IN(7698);

2) emp 테이블에서 사원 이름이 SMITH인 사람의 이름과 월급, 부서 번호를 출력하시오
SELECT ename,sal,deptno FROM emp WHERE ename = 'SMITH';

3) 월급이 2500이상 3500미만인 사원의 이름,입사일,월급을 구하시오.
SELECT ename,hiredate,sal FROM emp WHERE sal >= 2500 AND sal < 3500;

4) 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름,업무,급여를 출력하시오.
SELECT ename,job,sal FROM emp where sal NOT BETWEEN 2000 AND 3000;

5) 81년05월01일과 81년12월03일 사이에 입사한 사원의 이름,급여,입사일을 출력하시오.
SELECT ename,sal,hiredate FROM emp WHERE hiredate BETWEEN '81/05/01' AND '81/12/03';

6) emp테이블에서 사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호,이름,월급을 출력하시오
SELECT empno,ename,sal FROM emp WHERE empno NOT IN(7566,7782,7934);

7) 부서번호(deptno)가 30에서 근무하며 월2,000달러 이하를 받는 81년05월01일 이전에 입사한 사원의 이름, 부서번호, 입사일을 출력하시오.
SELECT ename,deptno,hiredate FROM emp WHERE deptno = 30 AND sal <= 2000 AND hiredate < '81/05/01'; 

NULL 조건 사용
SELECT ename,sal,comm FROM emp WHERE comm IS NULL;
SELECT ename,sal,comm FROM emp WHERE comm IS NOI NULL;
 
논리연산자(AND,OR,NOT)를 사용하여 조건 정의
SELECT empno,ename,job,sal FROM emp WHERE sal>=2000 AND job LIKE '%MAN%';
SELECT empno,ename,job,sal FROM emp WHERE sal>=2000 OR job LIKE '%MAN%';
SELECT ename,job FROM emp WHERE job NOT IN ('CLERK','SALESMAN');

8) emp 테이블에서 사원이름 중 s가 포함되지 않은 사람들 중 부서번호가 20인 사원들의 이름과 부서번호를 출력하시오.
SELECT ename,deptno FROM emp WHERE ename NOT LIKE '%S%' AND deptno = 20;

9) emp 테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오.
SELECT ename FROM emp WHERE ename LIKE '%A%' AND ename LIKE '%E%';

10) emp 테이블에서 관리자(mgr)가 없는 모든 사원의 이름과 업무를 표시하시오. --EMP테이블에서 MGR은 직속상관
SELECT ename,job FROM emp WHERE mgr IS NULL;

11) emp 테이블에서 커미션 항목이 입력된 사원들의 이름과 급여,커미션을 구하시오. -NULL을 제외
SELECT ename,sal,comm FROM emp WHERE comm IS NOT  NULL;

ORDER BY 절 : 정렬
SELECT * FROM emp ORDER BY sal ASC; -- ORDER BY ~ ASC 오름차순
SELECT * FROM emp ORDER BY sal; -- ASC 생략해도 오름차순

SELECT * FROM emp ORDER BY sal DESC; -- DESC: 내림차순
SELECT * FROM emp ORDER BY sal DESC, ename DESC; --중복값이 있으면 순차적으로 앞에서부터 내림차순 설정됨
SELECT * FROM emp ORDER BY job ASC, ename DESC;

SELECT ename,job,deptno,hiredate FROM emp ORDER BY hiredate DESC;
열 알리아스를 기준으로 정렬
SELECT empno, ename, sal*12 annsal FROM emp ORDER BY annsal; --ASC 빠진 오름차순정렬

열의 숫자 위치를 사용하여 정렬
SELECT ename,job,deptno,hiredate FROM emp ORDER BY 3; --ORDER BY 뒤에 숫자를 입력하면 해당되는 행에서 오름차순 
SELECT * FROM emp ORDER BY 2; -- 테이블 생성시 명시한 컬럼 순으로 번호 부여

- NULLS FIRST 또는 NULLS LAST 키워드를 사용하여 반환된 행 중 NULL값을 포함하는 행이
정렬 순서상 맨 처음에 나타나거나 마지막에 나타나도록 지정
SELECT * FROM emp ORDER BY comm DESC NULLS LAST; --내림차순 정렬, NULL값은 마지막에 정렬
SELECT * FROM emp ORDER BY comm ASC NULLS FIRST; --오름차순 정렬, NULL값은 처음에 정렬
SELECT * FROM emp ORDER BY comm ASC NULLS FIRST, ename DESC;

[실습문제]
1) emp 테이블에서 사원번호, 사원이름, 입사일을 출력하는데 입사일이 빠른 사람순으로 정렬하시오.
SELECT empno,ename,hiredate FROM emp ORDER BY hiredate; --my answer

2) emp 테이블에서 사원이름, 급여, 연봉을 구하고 연봉이 많은 순으로 정렬하시오.
SELECT ename,sal,sal*12 FROM emp ORDER BY sal*12 DESC; --my answer
--SELECT ename,sal,sal*12 annsal FROM emp ORDER BY annsal DESC; --알리아스 부여

3)10번 부서 또는 20번 부서에서 근무하고 있는 사원의 이름과 부서번호를 출력하는데 이름을 영문자 순으로 표시하시오.
SELECT ename,deptno FROM emp WHERE deptno=10 or deptno=20 ORDER BY ename; --my answer
--SELECT ename,deptno FROM emp WHERE deptno IN (10,20) ORDER BY ename ASC;

4) 커미션 계약을 맺은 모든 사원의 이름, 급여, 커미션을 출력하는데 커미션을 기준으로 내림차순 정렬하시오.
--SELECT ename,sal,comm FROM emp ORDER BY comm DESC NULLS LAST; --my answer
SELECT ename,sal,comm FROM emp WHERE comm IS NOT NULL ORDER BY comm DESC;

함수
문자함수
대소문자 조작 함수 : LOWER, UPPER, INITCAP
SELECT LOWER('HELLO') FROM dual; --소문자로 변환
SELECT LOWER(ename) FROM emp;

SELECT UPPER('welcome') FROM dual; --대문자로 변환

SELECT INITCAP('hello wORLD') FROM dual; --문장의 첫글자를 대문자로 변환 하고 그 다음은 소문자로 변환
SELECT INITCAP(ename) FROM emp;

문자 조작 함수 : CONCAT, SUBSTR, LENGTH, INSTR, LPAD, RPAD, TRIM, REPLACE
CONCAT(문자열1,문자열2) : 문자열1과 문자열2를 연결하여 하나의 문자열로 반환
SELECT CONCAT('Hello','World') FROM dual;
SELECT CONCAT(ename,job) FROM emp;

SUBSTR(대상문자열,인덱스) : 대상문자열에서 지정한 인덱스부터 문자열을 추출
(주의) 인덱스 1부터 시작
SELECT SUBSTR('Hello World',3) FROM dual;
SELECT SUBSTR('Hello World',3,3) FROM dual; --지정한 인덱스부터 3개만 추출
SELECT SUBSTR('Hello World',-3) FROM dual; -- 뒤에서 세번째부터 끝까지 추출
SELECT SUBSTR('Hello World',-3,2) FROM dual; -- 뒤에서 세번째부터 2개만 추출

LENGTH(문자열) : 문자열의 길이
SELECT LENGTH('Hello World') FROM dual;

INSTR(대상문자열 검색문자) : 검색문자의 위치값 검색
SELECT INSTR('Hello World','e') FROM dual;

검색문자가 없을 경우 0
SELECT INSTR('Hello World','E') FROM dual;
SELECT INSTR('Hello World','o') FROM dual;
SELECT INSTR('Hello World','o',6) FROM dual; --(대상문자열, 검색문자, 검색인덱스 : 해당위치부터 검색)
            (대상문자열,검색문자,검색인덱스,반복횟수)
SELECT INSTR('HEllo World','o',1,2) FROM dual;

LPAD(대상문자열,총길이,문자) : 지정한 길이에 문자열을 출력하는데 공백은 왼쪽에 지정한 문자로 채움
SELECT LPAD('Hello',10,'*') FROM dual;

RPAD(대상문자열,총길이,문자) : 지정한 길이에 문자열을 출력하는데 공백은 오른쪽에 지정한 문자로 채움
SELECT RPAD('Hello',10,'~') FROM dual;

TRIM : 문자열에서 공백이나 특정 문자를 제거한 다음 값을 반환
방향 : 왼쪽 ->LEADING, 오른쪽->TRALLING, 양쪽->BOTH(DEFAULT)
SELECT TRIM(LEADING 'h' FROM 'hanchh') FROM dual;
SELECT TRIM(BOTH 'h' FROM 'habchh') FROM dual;

REPLACE(대상문자열,old,new) : 대상문자열에서 old문자를 new문자로 대체
SELECT REPLACE('010.1234.5678','.','-') FROM dual;

함수 중첩
SELECT ename, LOWER(SUBSTR(ename,1,3)) FROM emp;

[실습문제]
1) emp 테이블의 업무(job)을 첫글자는 대문자 나머지는 소문자로 출력하시오.
SELECT INITCAP(job) FROM emp;

2) emp 테이블에서 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 추출하시오.
SELECT SUBSTR(ename, 1,3) FROM emp WHERE ename LIKE '%A%';

3) 이름의 세번째 문자가 A인 모든 사원의 이름을 표시하시오
SELECT ename FROM emp WHERE SUBSTR(ename,3,1)='A';
SELECT ename FROM emp WHERE ename LIKE '__A%';

4) 이름의 글자수가 6자 이상인 사원의 이름을 소문자로 이름만 출력하시오.
SELECT LOWER(ename) FROM emp WHERE LENGTH(ename)>=6;

5) 모든 사원의 이름과 급여를 표시하는데 급여는 15자 길이로 왼쪽에 $기호가 채워진 형식으로 표기하고 열 레이블 SALARY로 지정하시오
SELECT ename,LPAD(sal,15,'$') "SALARY" FROM emp;

숫자함수
CEIL(실수) : 올림처리한 정수값을 반환
SELECT CEIL(1.4) FROM dual;

FLOOR(실수) : 버림 처리한 정수값을 반환

SELECT FLOOR(1.7) FROM dual;

ROUND(대상숫자, 지정자릿수) : 반올림
SELECT ROUND(45.926,2) FROM dual;
SELECT ROUND(45.926) FROM dual;
SELECT empno,ename,sal, ROUND(sal*1.15) "NEW Salary", ROUND(sal*1.15)-sal "Increase" FROM emp;

TRUNC(대상숫자,지정자리수) : 절삭
SELECT TRUNC(45.926,2) FROM dual;
SELECT TRUNC(45.926) FROM dual;

MOD(대상숫자,나눌숫자) : 나머지값
SELECT MOD(17,2) FROM dual;

날짜함수
SYSDATE : ORACLE 서버의 현재 날짜와 시간을 반환
SELECT SYSDATE FROM dual;

날짜에 산술 연산자 사용
SELECT ename, (SYSDATE - hiredate)/7 AS WEEKS FROM emp WHERE deptno=10;

MONTHS_BETWEEN(날짜1,날짜2) : 두 날짜 간의 월 수 -- 큰 날짜를 앞에둬야 마이너스가 안뜸
SELECT MONTHS_BETWEEN('2023-03-23','2022-01-23') FROM dual; 
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) month_worked FROM emp ORDER BY month_worked;

ADD_MONTHS : 특정 날짜의 월에 정수를 더한 다음 해당 날짜를 반환하는 함수
SELECT ADD_MONTHS('2023-09-10',8) FROM dual;

NEXT_DAY : 지정된 요일의 다음 날짜
SELECT NEXT_DAY('2023-09-05','월요일') FROM dual;
1(일요일) ~ 7(토요일)
SELECT NEXT_DAY('2023-09-05',1) FROM dual;

LAST_DAY : 월의 마지막 날

SELECT LAST_DAY('2023-09-22') FROM dual;

EXTRACT : 날짜 정보에서 특정한 연도,월,일,시간,분,초 등을 추출
SELECT EXTRACT(YEAR FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE), EXTRACT(DAY FROM SYSDATE) FROM dual;

[실습]
1) 오늘부터 이번 달의 마지막날까지의 남은 날 수를 구하시오.
SELECT LAST_DAY(SYSDATE) - SYSDATE AS "남은 날 수" FROM dual;

2) emp테이블에서 각 사원에 대해 사원번호,이름,급여 및 15% 인상된 급여를 정수(반올림)로 표시하시오.
  인상된 급여열의 레이블을 NEW Salary로 지정하시오.
SELECT empno,ename,sal,ROUND(sal*1.15) "NEW Salary" FROM emp;

3) 각 사원의 이름을 표시하고 근무 달 수(입사일부터 현재까지의 달 수)를 계산하여 열 레이블을 MONTHS_WORKED로 지정하시오.
  결과는 정수로 반올림하여 표시하고 근무 달 수를 기준으로 오름차순 정렬
SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE,hiredate)) "MONTHS_WORKED" FROM emp ORDER BY MONTHS_WORKED;
  
4) emp테이블에서 이름(소문자로 표시),업무,근무연차를 출력하시오.
SELECT LOWER(ename),job, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) 근무연차 FROM emp;

변환함수
TO_CHAR : 숫자 -> 문자, 날짜 -> 문자
TO_NUMBER : 문자 -> 숫자
TO_DATE : 문자 -> 날짜

TO_CHAR : 날짜 -> 문자
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM dual; -- YYYY MM DD 뒤에 한글로 표기 못함

TO_CHAR : 숫자 -> 문자
실제 자리수와 일치
SELECT TO_CHAR(1234,9999) FROM dual; -- 9999 포맷문자
SELECT TO_CHAR(1234,'9999') FROM dual;
SELECT TO_CHAR(1234,0000) FROM dual; -- 오류발생
SELECT TO_CHAR(1234,'0000') FROM dual;

실제 자리수보다 자리수가 작을 경우 : 오류 발생
SELECT TO_CHAR(1234,999) FROM dual;
SELECT TO_CHAR(1234.'999') FROM dual;
SELECT TO_CHAR(1234,'000') FROM dual;

실제 자리수보다 많은 자리수 지정
SELECT TO_CHAR(1234,99999) FROM dual; --공백1234 형태가 됨
SELECT TO_CHAR(1234,'99999') FROM dual; --공백1234 형태가 됨
SELECT TO_CHAR(1234,'00000') FROM dual; --01234

소수점 자리
SELECT TO_CHAR(1234,9999.99) FROM dual; --1234.00 원래 없는 자리인데 00추가됨
SELECT TO_CHAR(1234,'9999.99') FROM dual;
SELECT TO_CHAR(1234,'0000.00') FROM dual;

반올림해서 소수점 둘째자리까지 표시
SELECT TO_CHAR(25.897,'99.99') FROM dual; -- ROUND는 정수 또는 실수, TO_CHAR 는 물자열로 표기가 됨 살짝 다름
인상된 급여를 소수점 첫째자리까지 표시
SELECT TO_CHAR(sal*1.1,'9,999.9') FROM emp;

통화표시
SELECT TO_CHAR(1234,'$0000') FROM dual;
SELECT TO_CHAR(1234,'L0000') FROM dual; --L자를 넣으면 각 나라의 통화표시가 됨

TO_DATE : 문자 -> 날짜
SELECT TO_DATE('23-09-22','YYYY-MM-DD') FROM dual;
SELECT TO_DATE('2023-09-30') FROM dual; --포맷형식 생략 가능

TO_NUMBER : 문자 -> 숫자
SELECT TO_NUMBER('100','999') FROM dual; -- 결과에 나오는 100은 숫자
SELECT TO_NUMBER('200') FROM dual; --포맷형식 생략 가능

[실습문제]
1) emp테이블에서 월급을 나눠서 4의 배수인 월급을 받는 사원의 이름과 월급을 출력하시오.(세자리 단위 쉼표 표시)
SELECT ename, TO_CHAR(sal,'9,999') FROM emp WHERE MOD(sal,4)=0;

2)각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달 수)를 계산하여 표시 근무 달 수는 정수로 표시하는데 TO_CHAR를 활용.
SELECT ename, TO_CHAR(MONTHS_BETWEEN(SYSDATE,hiredate),'999') MONTHS_WOKED FROM emp;

일반함수
NVL(value,value2) : value1이 NULL이면 value2를 사용(value1과 value2의 자료형 일치)
SELECT ename,sal,comm, sal+NVL(comm ,0) 실급여 FROM emp; -- comm 숫자고, 0도 숫자여서 정상작동(자료형이 일치하기때문에)
--SELECT ename,NVL(comm,'No Commission') "COMM." FROM emp; --오류가 남 이유: comm이 숫자기 때문 'NO Commission'은 문자열이여서.
SELECT ename,NVL(TO_CHAR(comm),'NO Commission') "COMM." FROM emp; --TO_CHAR를 이용해서 숫자를 문자로 바꿈

NVL2(value,value2,value3) : value1이 NULL인지 평가. NULL이면 value3, NULL이 아니면 value2사용.(자료형이 일치하지 않아도 됨)
SELECT ename,comm, NVL2(comm,'commission','no commission') FROM emp;

NULLIF(value1,value2) : 두개의 값이 일치하면 NULL, 두개의 값이 일치하지 않으면 value1
SELECT NULLIF(LENGTH(ename),LENGTH(job)) "NULLIF" FROM emp;

COALESCE(value1,value2,value3....) : NULL값이 아닌 값을 사용(자료형 일치)
SELECT comm,mgr,sal, COALESCE(comm,mgr,sal) FROM emp; --ORDER BY comm,mgr NULLS LAST; NULL값을 아래로 보냄 my practice

CASE 컬럼 WHEN 비교값 THEN 결과값   -- CASE WHEN THEN ELSE 많이 사용 외우기.
          WHEN       THEN
          WHEN       THEN
        (ELSE 결과값)
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

EDCODE : 오라클 전용, = 비교만 가능 --일반적으로는 WHEN THEN ELSE 이용, 오라클에서 =비교하려면 EDCODE도 사용 가능
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

그룹함수
그룹함수는 행 집합 연산을 수행하여 그룹별로 하나의 결과를 산출

AVG() : NULL을 제외한 모든 값들의 평균을 반환, NULL값은 평균 계산에서 무시됨
SELECT ROUND(AVG(sal)) FROM emp;

COUNT() : NULL을 제외한 값을 가진 모든 레코드의 수를 반환. COUNT(*) 형식을 사용하면 NULL도 계산에 포함
SELECT COUNT(empno) FROM emp;
SELECT COUNT(comm) FROM emp;
SELECT COUNT(*) FROM emp;

MAX() : 레코드 내에 있는 여러 값 중 가장 큰 값을 반환
SELECT MAX(sal) FROM emp;

MIN() : 레코드 내에 있는 여러 값 중 가장 작은 값을 반환
SELECT MIN(sal) FROM emp;

SUM() : 레코드 들이 포함하고 있는 모든 값을 더하여 반환
SELECT SUM(sal) FROM emp;

SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp;
SELECT MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp WHERE deptno=10;

SELECT COUNT(*) FROM emp WHERE deptno=10; --10번 부서에서 근무하는 사원수
SELECT COUNT(empno) FROM emp WHERE deptno=20; -- 20번 부서에서 근무하는 사원수
SELECT COUNT(comm), FROM emp; --커미션 계약이 되어있는 사람수
SELECT COUNT(NVL(comm,0)) FROM emp;

GROUP BY & HAVING
SELECT절에 집합함수 적용시 개별 컬럼을 지정할 수 없음
개별 컬럼을 지정할 경우에는 반드시 GROUP BY 절에 지정된 컬럼만 가능

SELECT deptno, MAX(sal), MIN(sal), ROUND(AVG(sal)), SUM(sal) FROM emp GROUP BY deptno;
SELECT job, MAX(sal), MIN(sal) FROM emp GROUP BY job;

다중 열에서 GROUP BY 절 사용
SELECT deptno, job, SUM(sal) FROM emp GROUP BY deptno, job ORDER BY deptno;

SELECT deptno, job, SUM(sal) FROM emp WHERE deptno=10 GROUP BY deptno,job ORDER BY deptno;

[오류발생]
SELECT deptno,AVG(sal) FROM emp WHERE AVG(sal)>2000 GROUP BY deptno;

[정상구문]
그룹처리 결과를 제한하고자 할 때 HAVING 절 이용
WHERE절에는 집합함수(그룹함수) 사용할 수 없고 HAVING절에서만 사용 가능
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno HAVING AVG(sal)>=2000;

HAVING 절의 이용 : HAVING 절에는 알리아스 사용 X
SELECT deptno, MAX(sal) maximum FROM emp GROUP BY deptno HAVING maximum>2000;
--SELECT deptno department, MAX(sal) maximum FROM emp GROUP BY deptno HAVING MAX(sal)>2000; 사용가능 구문

그룹함수 중첩
SELECT MAX(AVG(sal)) FROM emp GROUP BY deptno;

그룹함수의 이용
분기별로 입사한 사원의 수
SELECT CEIL(EXTRACT(MONTH FROM hiredate)/3) AS quarter, COUNT(empno) AS COUNT_member FROM emp 
GROUP BY CEIL(EXTRACT(MONTH FROM hiredate)/3) ORDER BY quarter;

OR 

SELECT TO_CHAR(hiredate,'Q') AS quarter, COUNT(empno) AS count_member
FROM emp GROUP BY TO_CHAR(hiredate,'Q') ORDER BY quarter;

[실습]
1) emp테이블에서 사원이름, 월급, 월급과 커미션을 더한 값을 컬럼명 실급여라고 해서 출력하시오. 단,NULL값은 나타나지 않게 작성하시오.
--SELECT ename,sal,sal+comm as 실급여 FROM emp WHERE comm is not null;
SELECT ename,sal,sal+NVL(comm,0) 실급여 FROM emp;

2) 월급과 커미션을 합친 금액이 2,000이상인 급여를 받는 사원의 이름, 업무,월급,커미션,고용날짜를 출력하시오. 단 고용날짜는 1980-12-17 형태로 출력하시오.
SELECT ename, job, sal, comm,TO_DATE(hiredate,'YYYY-MM-DD') hiredate FROM emp WHERE sal+NVL(comm,0)>=2000;

3) 모든 사원의 급여 최고액,최저액,총액 및 평균액을 표시하시오. 열 레이블을 각각 maximum,minimum, sum 및 average 로 지정하고 결과를 정수로 반올림하고 세자리 단위로 ,를 명시하시오.
SELECT TO_CHAR(MAX(sal),'9,999') maximum, TO_CHAR(MIN(sal),'9,999') minimum, TO_CHAR(SUM(sal),'99,999') sum, TO_CHAR(AVG(sal),'9,999') average FROM emp;

4) emp테이블에서 급여와 커미션을 더한 금액의 최고, 최저, 평균금액을 구하시오. 평균금액은 소수점 첫째자리 까지 표시하시오.
SELECT MAX(sal+NVL(comm,0))최고, MIN(sal+NVL(comm,0))최저, ROUND(AVG(sal+NVL(comm,0)),1)평균 FROM emp;

5)업무와 업무가 동일한 사원수를 표시하시오.(업무별 사원수를 구하시오)
SELECT job,COUNT(*) FROM emp GROUP BY job;

6) 20번 부서의 급여 합계를 구하고 급여 합계 금액을 출력하시오.
SELECT SUM(sal) FROM emp WHERE deptno=20;

7) 부서별로 지급된 총월급에서 금액이 9,000이상을 받는 사원들의 부서번호, 총월급을 출력하시오.
SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal)>=9000;

8) 업무별로 사원번호가 제일 늦은 사람을 구하고 그 결과 내에서 사원번호가 79로 시작하는 결과만 보여주시오.
SELECT job, MAX(empno) FROM emp GROUP BY job HAVING MAX(empno) LIKE '%79%';

9) 업무별 총월급을 출력하는데 업무가 'MANAGER'인 사원들은 제외하고 총월급이 5,000보다 많은 업무와 총 월급만 출력하시오.
SELECT job,SUM(sal) FROM emp WHERE job <> 'MANAGER' GROUP BY job HAVING SUM(sal)>5000;

10) 업무별로 사원수가 4명 이상인 업무와 인원수를 출력하시오.
SELECT job, COUNT(empno) FROM emp GROUP BY job HAVING COUNT(empno)>=4;

RANK() : 순위를 표현할 때 사용하는 함수
RANK(조건값) WITHIN GROUP (ORDER BY 조건값 컬럼명 [ASC|DESC]) : 특정 데이터의 순위 확인하기
(주의) RANK 뒤에 나오는 데이터와 ORDER BY 뒤에 나오는 데이터는 같은 컬럼이어야 함.
SELECT RANK ('SMITH') WITHIN GROUP (ORDER BY ename DESC) "RANK" FROM emp;

전체순위 보기
RANK() OVER (ORDER BY 컬럼명)
사원들의 empno,ename,sal,급여 순위를 출력
SELECT empno,ename,sal,RANK() OVER(ORDER BY sal) AS RANK_ASC,
RANK() OVER(ORDER BY sal DESC) AS RANK_DESC FROM emp;

emp테이블에서 10번부서에 속한 사원들의 사번과 이름,급여,해당 부서 내의 급여 순위를 출력
SELECT empno,ename,sal, RANK () OVER(ORDER BY sal DESC) RANK FROM emp WHERE deptno=10;

emp테이블을 조회하여 사번,이름,급여,부서번호,부서별 급여 순위를 출력
SELECT empno,ename,sal,deptno, RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) RNAK FROM emp;
--PARTITION BY : RANK() OVER()에서 그룹을 나타내고자 할때 사용

emp테이블을 조회하여 empno,ename,sal,deptno,job 같은 부서 내 job별로 급여 순위 출력.
SELECT empno,ename,sal,deptno,job, RANK() OVER(PARTITION BY deptno,job ORDER BY sal DESC) RANK FROM emp;

조인(JOIN) : 둘 이상의 테이블을 연결하여 데이터를 검색하는 방법
            보통 둘 이상의 행들의 공통된 값 PRIMARY KEY 및 FOREIGN KEY 값을 사용하여 조인 
            두 개의 테이블을 SELECT 문장 안에서 조인하려면 적어도 하나의 컬럼이 그 두 테이블 사이에 공유되어야 함
            
카티션 곱(Cartesian Product)
검색하고자 했던 데이터 뿐 
아니라 조인에 사용된 테이블의 보든 데이터가 반환되는 형상
SELECT * FROM emp,dept;

[ORACLE 전용]
- 동등 조인(Equi JOIN) : 조건절 Equality Condition(=)에 의하여 조인이 이루어 짐
SELECT emp.ename,dept.dname FROM emp,dept WHERE emp.deptno = dept.deptno;

테이블에 알리아스 부여하기
SELECT e.ename,d.dname FROM emp e, dept d WHERE e.deptno = d.deptno;

컬럼명을 호출할 때 테이블명 또는 테이블 알리아스를 생략
SELECT ename, e.deptno, dname FROM emp e, dept d WHERE e.deptno=d.deptno;

추가적인 조건 명시하기
SELECT e.ename,d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND e.ename='ALLEN';

SELECT e.ename,e.sal,d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND e.sal BETWEEN 3000 AND 4000;

-비동등 조인(Non Equi Join)
테이블이 어떤 컬럼도 조인할 테이블의 컬럼에 일치하지 않을 때 사용하고 조인 조건은 동등(=)의외의 연산자를 갖음(betwenn ad, is null, in)

사원이름,급여,급여등급 구하기(emp,salgrade 테이블 이용)
SELECT e.ename,e.sal,s.grade FROM emp e, salgrade s WHERE e.sal BETWEEN s.losal AND s.hisal;

-SELF JOIN 
사원 이름과 해당 사원의 관리자 이름 구하기(관리자가 없는 사원 제외)
SELECT e.ename 사원이름, m.ename 관리자이름 FROM emp e, emp m WHERE e.mgr=m.empno;

외부조인 (Outer Join)
조인할 때 조인에 참가한 테이블의 두 개 컬럼에서 공통된 값이 없다면 테이블로부터 데이터를 반환하지 않음.
누락되는 행을 보여지게 하려면 외부 조인 사용
(주의)외부 조인을 표시할 때 누락된 행의 반대 테이블에 + 기호 표시

SELECT DISTINCT(e.deptno), d.deptno FROM emp e, dept d WHERE e.deptno(+)=d.deptno; -- (+) 을 dept테이블의 반대쪽인 e.deptno에 넣어주면 누락된값도 보임

사원이름과 해당 사원의 관리자 이름 구하기(관리자가 없는 사원도 표시)
SELECT e.ename 사원이름, m.ename 관리자이름 FROM emp e, emp m WHERE e.mgr=m.empno(+);

[실습문제]
1)모든 사원의 이름, 부서번호,부서이름을 표시하시오.(emp,dept)
SELECT e.ename,e.deptno,d.dname FROM emp e , dept d WHERE e.deptno=d.deptno;

2)업무가 MANAGER인 사원의 정보를 이름,업무,부서명,근무지 순으로 출력하시오.(emp,dept)
SELECT e.ename,e.job,d.dname,d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.job='MANAGER';

3)커미션을 받고 급여가 1,600이상인 사원의 이름,급여,부서명,근무지를 출력하시오.(emp,dept)
SELECT e.ename,e.sal,d.dname,d.loc FROM emp e, dept d WHERE e.sal>=1600 AND e.comm>=0;
SELECT e.ename,e.sal,d.dname,d.loc FROM emp e, dept d WHERE e.deptno=d.deptno AND e.comm IS NOT NULL AND e.sal>=1600;

4)근무지가 CHICAGO인 모든 사원의 이름,업무,부서번호 및 부서이름을 표시하시오.(emp,dept)
SELECT e.ename,e.job,e.deptno,d.dname FROM emp e, dept d WHERE d.loc='CHICAGO';
SELECT e.ename,e.job,e.deptno,d.dname FROM emp e, dept d WHERE e.deptno=d.deptno AND d.loc = 'CHICAGO';

5)근무지(loc)별로 근무하는 사원의 수가 5명 이하인 경우, 인원이 적은 도시 순으로 정렬하시오.(근무인원이 0명)
SELECT d.loc, COUNT(e.empno) emp_member FROM emp e, dept d WHERE e.deptno(+)=d.deptno GROUP BY d.loc;

6)사원의 이름 및 사원번호를 관리자의 이름과 관리자 번호와 함께 표시하고 각각의 열 레이블은 emplyee,emp#,manager,mgr#로 지정하시오.(관리자 없는 사원 미출력)

7)관리자보다 먼저 입사한 모든사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 표시하고 열 레이블을 각각 employee,emp hired, manager, mgr hired로 지정하시오.

8)지정한 부서번호,사원이름 및 지정한 사원과 동일한 부서에서 근무하는 모든 사월을 표시하도록 질의를 작성하고 부서번호는 department,사원이름은 emplyee, 동일한 부서에서 근무하는 사원은 colleague
  로 표시하시오.(부서번호,사원이름,동료 순으로 오름차순 정렬)
