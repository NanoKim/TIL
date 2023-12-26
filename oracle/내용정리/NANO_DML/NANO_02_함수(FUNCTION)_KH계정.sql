/*
    < 함수 FUNCTION >
    전달된 컬럼값을 읽어들여서 함수를 실행한 결과를 반환
    
    - 단일행 함수 : N개의 값을 읽어들여서 N개의 결과값을 리턴 (매 행마다 함수 실행 결과 반환)
    - 그룹 함수 : N개의 값을 읽어들여서 1개의 결과값을 리턴 (그룹을 지어 그룹별로 함수 실행 결과 반환)

    >> SELECT 절에 단일행 함수랑 그룹 함수를 함께 사용 못 함
       왜? 결과 행의 개수가 다르기 때문
       
    >> 함수식을 기술할 수 있는 위치 : SELECT 절, WHERE 절, ORDER BY 절, GROUP BY 절, HAVING 절
*/

--------------------------------< 문자 처리 함수 >--------------------------------

/*
    * LENGTH / LENGHTB          => 결과값 NUMBER 타입
    
    LENGTH(컬럼|'문자열값') : 해당 문자열 값의 글자수 반환
    LENGTHB(컬럼|'문자열값') : 해당 문자열 값의 바이트 수 반환
    
    '김', '나', 'ㄱ' 한 글자당 3BYTE       차은우 => 9BYTE
    영문자, 숫자, 특문 한 글자당 1BYTE

    * INSTR
    문자열로부터 특정 문자의 시작 위치를 찾아서 반환
    
    INSTR(컬럼|'문자열', '찾고자 하는 문자', ['찾을 위치의 시작값', [순번]])    => 결과값은 NUMBER 타입

    * SUBSTR
    문자열에서 특정 문자열을 추출해서 반환 (자바에서 substring() 메소드와 유사)
    
    SUBSTR(STRING, POSITION, [LENGTH])      => 결과값이 CHARACTER 타입
    - STRING : 문자타입컬럼|'문자열값'
    - POSITION : 문자열을 추출할 시작 위치 값
    - LENGTH : 추출할 문자 개수 (생략 시 끝까지 의미)

    SELECT EMP_NAME, EMAIL, EMP_NO, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) AS "아이디"
    FROM EMPLOYEE;
    

    * LPAD / RPAD
    문자열을 조회할 때 통일감 있게 조회하고자 할 때 사용
    
    LPAD/RPAD(STRING, 최종적으로 반환할 문자의 길이, [덧붙이고자 하는 문자])
    
    문자열에 덧붙이고자 하는 문자를 왼쪽 또는 오른쪽에 덧붙여서 최종 N길이 만큼의 문자열 반환
    -- 주민번호 마스킹 처리 예시
    SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') AS "주민등록번호"
    FROM EMPLOYEE;

    * LTRIM / RTRIM (STRING, ['제거할 문자들'])
    문자열에서 특정 문자를 제거한 나머지를 반환

    => 생략하면 공백 제거.
    
    문자열의 왼쪽 혹은 오른쪽에서 제거하고자 하는 문자들을 찾아서 제거 후 문자열 반환

    SELECT LTRIM('123123KH123', '123') FROM DUAL; -- '123' 중의 하나 찾아서 제거하고, '123' 중의 하나가 아닌 문자 나오면 그대로 종료

    * TRIM
    문자열의 앞 / 뒤 / 양쪽에 있는 지정한 문자들을 제거한 나머지 문자열 반환
    TRIM([[LEADING]TRAILING]BOTH] 특정 제거하고자 하는 문자들 FROM]STRING)
*/

SELECT TRIM('         K        H      ') FROM DUAL;
-- SELECT TRIM('ZZZZZZZKHZZZZZZZZZZZZZ', 'Z') FROM DUAL; -- 문법이 잘못되어 오류
SELECT TRIM('Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL; -- 유사 LTRIM
SELECT TRIM(TRAILING 'Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL; -- 유사 RTRIM
SELECT TRIM(BOTH 'Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL; -- 생략 시 기본값 BOTH

/*
    * LOWER / UPPER / INITCAP(STRING)     => 결과값 CHARACTER 타입

    LOWER : 소문자로 변경한 문자열 반환
    UPPER : 대문자로 변경한 문자열 반환
    INITCAP : 단어 앞 글자마다 대문자로 변경한 문자열 반환
    *공백을 기준으로 한 단어로 취급

    * CONCAT(STRING, STRING)      => 결과값 CHARACTER 타입
    문자열 두개를 전달 받아 하나로 합친 후 결과 반환
    
    * REPLACE(STRING, STR1, STR2)     => 결과값은 CHARACTER 타입
    STR1 을 STR2 로 변환
    
    SELECT EMP_NAME, EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'gmail.com')
    FROM EMPLOYEE;
*/

--------------------------------< 숫자 처리 함수 >--------------------------------

/*  
    * ABS(NUMBER)     => 결과값 NUMBER 타입
    숫자의 절대값을 구해주는 함수
    
    * MOD(NUMBER, NUMBER)        => 결과값 NUMBER 타입
    두 수를 나눈 나머지값을 반환해주는 함수

    * ROUND(NUMBER, [위치1])    => 결과값은 NUMBER 타입
    반올림한 결과를 반환
      
    위치 생략 시 0번째 자리에서 반올림
    SELECT ROUND(123.456, 7) FROM DUAL; -- 위치보다 크게 입력해도 오류는 안 나긴 함

    * CEIL(NUMBER)
    올림처리 해주는 함수

    * FLOOR(NUMBER)
    소수점 아래 버림처리하는 함수

    * TRUNC (NUMBER, [위치지정])(절삭하다)
    위치 지정 가능한 버림처리 해주는 함수
    
    SELECT TRUNC(123.456) FROM DUAL; -- 위치지정 안하면 FLOOR 이랑 동일
*/

--------------------------------< 날짜 처리 함수 >--------------------------------

-- * SYSDATE : 시스템 날짜 및 시간 반환(현재 날짜 및 시간)

/*
    * MONTHS_BETWEEN(DATE1, DATE2)      >> 결과값 : NUMBER 타입
    두 날짜 사이의 개월수 
    >> 내부적으로 DATE1 - DATE2 후 나누기 30|31이 진행
    
    * ADD_MONTHS(DATE, NUMBER)          >> 결과값 : DATE 타입
    특정날짜에 NUMBER만큼의 개월 수를 더해서 날짜를 리턴

    * NEXT_DAY(DATE, 요일(문자|숫자))     >> 결과값 : DATE 타입
    특정날짜 이후에 가까운 해당 요일의 날짜를 반환해주는 함수

    1. 일요일, 2. 월요일, ... 7. 토요일


    * LAST_DAY(DATE)         >> 결과값 : DATE 타입
    해당 월의 마지막 날짜를 구해서 반환

    * EXTRACT(YEAR|MONTH|DAY FROM DATE)
    특정 날짜로부터 년도|월|일 값을 추출해서 반환하는 함수

*/

---------------------------------< 형변환 함수 >---------------------------------

/*
    * TO_CHAR(숫자|날짜, [포맷])   >> 결과값 : CHARACTER 타입
    숫자 타입 또는 날짜 타입의 값을 문자타입으로 변환 시켜주는 함수
*/

-- 숫자타입 => 문자타입
SELECT TO_CHAR(1234) FROM DUAL; -- '1234' 로 바뀐 거
SELECT TO_CHAR(1234, '99999') FROM DUAL; -- ' 1234' 로 바뀐 거 => 5칸짜리 공간 확보, 오른쪽 정렬, 빈칸 공백
SELECT TO_CHAR(1234, '00000') FROM DUAL; -- '01234' 로 바뀐 거 => 빈칸 0으로 채움
SELECT TO_CHAR(1234, 'L99999') FROM DUAL; -- 현재 설정된 나라 (LOCAL 나라)의 화폐단위
SELECT TO_CHAR(1234, '$99999') FROM DUAL;
SELECT TO_CHAR(1234, 'L99,999') FROM DUAL;

-- 날짜타입 => 문자타입
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'PM HH:MI;SS') FROM DUAL; -- HH : 12시간 형식
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL; -- HH24 : 24시간 형식
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON, YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY년-MM월-DD일') FROM DUAL; -- 이건 오류
-- 존재하지 않는 포맷 제시할 때는 "" 묶기
SELECT TO_CHAR(SYSDATE, 'YYYY"년"-MM"월"-DD"일"') FROM DUAL;

-- 년도와 관련된 포맷
SELECT 
    TO_CHAR(SYSDATE, 'YYYY'), -- 2023
    TO_CHAR(SYSDATE, 'YY'), -- 23
    TO_CHAR(SYSDATE, 'RRRR'), -- 2023
    TO_CHAR(SYSDATE, 'RR'), -- 23
    TO_CHAR(SYSDATE, 'YEAR') -- TWENTY TWENTY-THREE
FROM DUAL;

-- 월과 관련된 포맷
SELECT 
    TO_CHAR(SYSDATE, 'MM'), -- 12
    TO_CHAR(SYSDATE, 'MON'), -- 12월
    TO_CHAR(SYSDATE, 'MONTH'), -- 12월
    TO_CHAR(SYSDATE, 'RM') -- XII 
FROM DUAL;

-- 일과 관련된 포맷
SELECT
    TO_CHAR(SYSDATE, 'DDD'), -- 올해 기준으로 오늘이 며칠째인지
    TO_CHAR(SYSDATE, 'DD'), -- 월 기준으로 오늘이 며칠째인지
    TO_CHAR(SYSDATE, 'D') -- 주 기준으로 오늘이 며칠째인지(목요일이면, 일월화수목 이니 5 리턴)
FROM DUAL;

-- 요일과 관련된 포맷
SELECT
    TO_CHAR(SYSDATE, 'DAY'), -- 목요일
    TO_CHAR(SYSDATE, 'DY') -- 목
FROM DUAL;

--------------------------------------------------------------------------------

/*
    * TO_DATE(숫자|문자, [포맷])          >> 결과값 : DATE 타입
    숫자타입 또는 문자타입 데이터를 날짜타입으로 변환시켜주는 함수 
*/

SELECT TO_DATE(20100101) FROM DUAL;
SELECT TO_DATE(100101) FROM DUAL;

-- SELECT TO_DATE(070101) FROM DUAL; -- 이건 앞에 0이 붙어있어서 오류
SELECT TO_DATE('070101') FROM DUAL; -- 첫글자가 0인 경우는 문자타입으로 변경 필요 : 앞에 있는 0이 소실되지 않도록 감싸주기('')

-- SELECT TO_DATE('041030 143000') FROM DUAL; -- 시간을 24시간형식으로 줄때는 그냥 주면 안 됨
SELECT TO_DATE('041030 143000', 'YYMMDD HH24MISS') FROM DUAL; -- 이렇게 포맷 제시해줄 것

SELECT TO_DATE('140630', 'YYMMDD') FROM DUAL; -- 2014년
SELECT TO_DATE('980630', 'YYMMDD') FROM DUAL; -- 2098년 
-- YY : 무조건 현재 세기로 반영

SELECT TO_DATE('140630', 'RRMMDD') FROM DUAL; -- 2014년
SELECT TO_DATE('980630', 'RRMMDD') FROM DUAL; -- 1998년
-- RR : 해당 두 자리 년도 값이 50 미만일 경우, 현재 세기를 반영
--                              이상일 경우, 이전 세기를 반영

--------------------------------------------------------------------------------

/*
    * TO_NUMBER(문자, [포맷])       >> 결과값 : NUMBER 타입
    문자 타입의 데이터를 숫자 타입으로 변환시켜주는 함수
*/

SELECT TO_NUMBER('0123456789') FROM DUAL; -- 0빠지고 숫자타입으로 저장

SELECT '1000000' + '55000' FROM DUAL;
-- 자바에서는 결과값이 100000055000 이 출력되나, 오라클에서는 자동형변환으로 인해 1055000 출력

-- SELECT '1,000,000' + '55,000' FROM DUAL; -- INVALID NUMBER 오류 (안에 숫자만 있어야 자동 형변환)
SELECT TO_NUMBER('1,000,000', '9,999,999') + TO_NUMBER('55,000', '99,999') FROM DUAL; -- 강제형변환 한 것

--------------------------------< NULL 처리 함수 >-------------------------------

/*
    NVL(컬럼, 해당 컬럼값이 NULL일 경우 반환할 값)
    
    NVL2(컬럼, 반환값1, 반환값2)
    컬럼값이 존재할 경우 반환값1 반환
    컬럼값이 NULL일 경우 반환값2 반환

    NULLIF(비교대상1, 비교대상2)
    두 값이 일치하면 NULL 반환
    두 값이 일치하지않으면 비교대상 1 반환
*/
SELECT NULLIF('123','123') FROM DUAL;
SELECT NULLIF('123','456') FROM DUAL;

----------------------------------< 선택 함수 >----------------------------------

/*
    * DECODE(비교하고자 하는 대상(컬럼|산술연산|함수식), 비교값1, 결과값1, 비교값2, 결과값2,...)
    
    자바에서 SWITCH-CASE 구문과 유사
*/

-- 사번, 사원명, 주민번호
SELECT
    EMP_ID,
    EMP_NAME,
    EMP_NO,
    SUBSTR(EMP_NO,8,1),
    DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여',3,'남',4,'여') AS "성별"
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    * CASE WHEN THEN
    
    CASE WHEN 조건식1 THEN 결과값1
         WHEN 조건식2 THEN 결과값2
         ...
         ELSE 결과값
    END
*/

SELECT 
    EMP_NAME, 
    SALARY,
    CASE WHEN SALARY >= 5000000 THEN '고급 개발자'
         WHEN SALARY >= 3500000 THEN '중급 개발자'
         ELSE '초급 개발자'
    END AS "레벨"
FROM EMPLOYEE;

----------------------------------< 그룹 함수 >----------------------------------

/*
    1. SUM(숫자타입컬럼) : 해당 컬럼 값들의 총 합계를 구해서 반환
    2. AVG(숫자타입) : 해당 컬럼값의 평균값을 구해서 반환
    3. MIN(여러 타입) : 해당 컬럼값들 중에 가장 작은 값 구해서 반환
    4. MAX(여러 타입) : 해당 컬럼값들 중에 가장 큰 값 구해서 반환
    5. COUNT(*|컬럼|DISTINCT 컬럼)
       COUNT(*)              : 조회된 결과의 모든 행 개수를 세서 반환
       COUNT(컬럼)           : 제시한 해당 컬럼값이 NULL이 아닌 것만 행 개수를 세서 반환
       COUNT(DISTINCT 컬럼)  : 해당 컬럼값 중복을 제거한 후 행 개수를 세서 반환
*/
