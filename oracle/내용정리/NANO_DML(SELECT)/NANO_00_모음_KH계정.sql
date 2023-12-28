/*
    < 계정 생성 및 권한 부여 >
    SELECT * FROM USER_TABLES; : 현재 이 계정이 가지고 있는 테이블 구조 볼 수 있음
    SELECT * FROM USER_TAB_COLUMNS; : 이 사용자가 가지고 있는 테이블 상의 모든 컬럼 볼 수 있음
    SELECT * FROM DBA_USERS; : 모든 계정 조회
    CREATE USER kh IDENTIFIED BY kh; 
    GRANT CONNECT, RESOURCE TO kh;
    
    < 시스템 설정 - 로컬 언어 변경 >
    SELECT * FROM NLS_SESSION_PARAMETERS; : 자동으로 생기는 테이블, 여기서 PARAMETER LANGUAGE 의 VALUE 를 영어로 변경
    ALTER(변경하다) SESSION<테이블이름> SET NLS_LANGUAGE = AMERICAN; -- KOREAN(원본이 KOREAN 이라는 것을 알려주도록 백업 메모 남기는 습관)
    ALTER(변경하다) SESSION<테이블이름> SET NLS_LANGUAGE = KOREAN;

    < 문자열 처리 >
    LENGTH(컬럼|'문자열값') : 문자열 길이 반환
    LENGTHB(컬럼|'문자열값') : 바이트 길이 반환
    INSTR(컬럼|'문자열', '찾고자 하는 문자', ['찾을 위치의 시작값', [순번]]) : 찾으려는 문자 위치 반환
    SUBSTR(STRING, POSITION, [LENGTH]) : 문자열 자르기
    LPAD(STRING, 최종적으로 반환할 문자의 길이, [덧붙이고자 하는 문자]) : 오른쪽 정렬 후 빈칸 채움
    RPAD(STRING, 최종적으로 반환할 문자의 길이, [덧붙이고자 하는 문자]) : 왼쪽 정렬 후 빈칸 채움
    LTRIM (STRING, ['제거할 문자들']) : 특정문자 왼쪽부터 제거 (생략=공백제거)
    RTRIM (STRING, ['제거할 문자들']) : 특정문자 오른쪽부터 제거 (생략=공백제거)
    TRIM([[LEADING]TRAILING]BOTH] 특정 제거하고자 하는 문자들 FROM]STRING) : 특정문자 앞/뒤/양쪽 특정문자 제거
    LOWER (STRING) : 소문자로 변경
    UPPER (STRING) : 대문자로 변경
    INITCAP (STRING) : 단어 앞 글자마다 대문자로 변경
    CONCAT(STRING, STRING) : STRING 2개 합치기
    CONNECT || : STRING 합치기
    REPLACE(STRING, STR1, STR2) : STRING 내 특정 STR을 다른 STR로 변경

    < 숫자 처리 >
    ABS(NUMBER) : 절대값
    MOD(NUMBER, NUMBER)  : 나머지
    ROUND(NUMBER, [위치1]) : 반올림
    CEIL(NUMBER) : 올림
    FLOOR(NUMBER) : 버림
    TRUNC(NUMBER, [위치지정]) : 위치지정해서 버림

    < 날짜 처리 >
    SYSDATE : 시스템의 현재 날짜 및 시간
    MONTHS_BETWEEN(DATE1, DATE2) : DATE 사이의 개월 수
    ADD_MONTHS(DATE, NUMBER) : DATE 에 NUMBER 개월 더하기
    NEXT_DAY(DATE, 요일(문자|숫자)) : DATE 이후의 가까운 요일 날짜 반환
    LAST_DAY(DATE) : 해당 월의 마지막 날짜 반환
    EXTRACT(YEAR|MONTH|DAY FROM DATE) : 특정 날짜로부터 년도|월|일 값 리턴
    
    < 형변환 >
    TO_CHAR(숫자|날짜, [포맷]) : 숫자|날짜 타입 값을 문자타입으로 변환
        숫자 > 문자 변환
            TO_CHAR(NUMBER) : 문자타입으로 변환
            TO_CHAR(NUMBER, '99999') : 5칸짜리 문자타입으로 변환, 오른쪽 정렬, 빈칸 공백
            TO_CHAR(NUMBER, '00000') : 5칸짜리 문자타입으로 변환, 오른쪽 정렬, 빈칸 0으로 채우기
            TO_CHAR(NUMBER, 'L99999') : 로컬의 화폐단위 문자타입으로 변환
            TO_CHAR(NUMBER, '$99999') : 달러 단위 문자타입으로 변환
            TO_CHAR(NUMBER, 'L99,999') : 구분자 포함하여 문자타입으로 변환
        날짜 > 문자 변환
            SYSDATE : 현재 날짜
            TO_CHAR(DATE) FROM DUAL; : 문자타입으로 변환
            TO_CHAR(DATE, 'PM HH:MI;SS') -- HH : 12시간 형식
            TO_CHAR(DATE, 'HH24:MI:SS') -- HH24 : 24시간 형식
            TO_CHAR(DATE, 'YYYY-MM-DD DAY') : 요일까지 출력 VER1
            TO_CHAR(DATE, 'YYYY-MM-DD DDY') : 요일까지 출력 VER2
            TO_CHAR(DATE, 'MON, YYYY')
            TO_CHAR(DATE, 'YYYY-MM-DD')
            
            TO_CHAR(SYSDATE, 'YYYY년-MM월-DD일') -- 이건 오류
            -- 존재하지 않는 포맷 제시할 때는 "" 묶기
            TO_CHAR(SYSDATE, 'YYYY"년"-MM"월"-DD"일"')
    TO_DATE(숫자|문자, [포맷]) : 숫자|문자 타입 값을 날짜타입으로 변환
        TO_DATE(YYYYMMDD)
        TO_DATE(YYMMDD)
        TO_DATE('070101') : 0으로 시작할 경우 문자타입으로 변경
        TO_DATE('041030 143000', 'YYMMDD HH24MISS') : 24시간형식
        
        YY : 무조건 현재 세기로 반영
        RR : 해당 두 자리 년도 값이 50 미만일 경우, 현재 세기를 반영
                                     이상일 경우, 이전 세기를 반영
        
        년도 포맷
            TO_CHAR(SYSDATE, 'YYYY'), -- 2023
            TO_CHAR(SYSDATE, 'YY'), -- 23
            TO_CHAR(SYSDATE, 'RRRR'), -- 2023
            TO_CHAR(SYSDATE, 'RR'), -- 23
            TO_CHAR(SYSDATE, 'YEAR') -- TWENTY TWENTY-THREE
        월 포맷
            TO_CHAR(SYSDATE, 'MM'), -- 12
            TO_CHAR(SYSDATE, 'MON'), -- 12월
            TO_CHAR(SYSDATE, 'MONTH'), -- 12월
            TO_CHAR(SYSDATE, 'RM') -- XII 
        일 포맷
            TO_CHAR(SYSDATE, 'DDD'), -- 올해 기준으로 오늘이 며칠째인지
            TO_CHAR(SYSDATE, 'DD'), -- 월 기준으로 오늘이 며칠째인지
            TO_CHAR(SYSDATE, 'D') -- 주 기준으로 오늘이 며칠째인지(목요일이면, 일월화수목 이니 5 리턴)
        요일 포맷
            TO_CHAR(SYSDATE, 'DAY'), -- 목요일
            TO_CHAR(SYSDATE, 'DY') -- 목
    TO_NUMBER(문자, [포맷]) : 문자 타입 값을 숫자타입으로 변환
        TO_NUMBER('0123456789') : 0빠지고 숫자타입으로 저장
        '1000000' + '55000' : 자동형변환으로 인해 1055000 출력
        TO_NUMBER('1,000,000', '9,999,999') + TO_NUMBER('55,000', '99,999') : (안에 숫자외의 것이 있을 경우 강제 형변환)

    < NULL 처리 >
    NVL(컬럼, 해당 컬럼값이 NULL일 경우 반환할 값)
    NVL2(컬럼, 반환값1, 반환값2) : 컬럼값이 존재할 경우 반환값1 반환
                                 컬럼값이 NULL일 경우 반환값2 반환
    NULLIF(비교대상1, 비교대상2) : 두 값이 일치하면 NULL 반환
                                 두 값이 일치하지않으면 비교대상 1 반환
                                 
    < 선택 함수 >                             
    DECODE(비교하고자 하는 대상(컬럼|산술연산|함수식), 비교값1, 결과값1, 비교값2, 결과값2,...)
    CASE WHEN 조건식1 THEN 결과값1
         WHEN 조건식2 THEN 결과값2
         ...
         ELSE 결과값
    END
    
    < 그룹 함수 >
    SUM(숫자타입) : 해당 컬럼 값들의 총 합계를 구해서 반환
    AVG(숫자타입) : 해당 컬럼값의 평균값을 구해서 반환
    MIN(여러 타입) : 해당 컬럼값들 중에 가장 작은 값 구해서 반환
    MAX(여러 타입) : 해당 컬럼값들 중에 가장 큰 값 구해서 반환
    COUNT(*|컬럼|DISTINCT 컬럼)
       COUNT(*)              : 조회된 결과의 모든 행 개수를 세서 반환
       COUNT(컬럼)           : 제시한 해당 컬럼값이 NULL이 아닌 것만 행 개수를 세서 반환
       COUNT(DISTINCT 컬럼)  : 해당 컬럼값 중복을 제거한 후 행 개수를 세서 반환
    
    < 집계함수 >
    GROUP BY 절에 기술
    ROLL UP() : 마지막 행으로 전체 총 합까지 조회
    CUBE() : 그룹의 중간 집계를 계산
    
    < 집합 연산자 - SET OPERATION >
    UNION            : OR  | 합집합의 개념 (두 쿼리문을 수행한 결과값을 더한 후 중복되는 값은 한 번만 더해지도록)
    INTERSECT        : AND | 교집합의 개념 (두 쿼리문 수행한 결과값에 중복된 결과값)
    UNION ALL        : 합집합 + 교집합의 개념 (중복되는 부분이 두 번 표현될 수 있음)
    MINUS            : 차집합의 개념 (선행 결과값에서 후행 결과값을 뺀 나머지)
*/
