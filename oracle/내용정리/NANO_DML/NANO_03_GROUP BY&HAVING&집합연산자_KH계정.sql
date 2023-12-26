/*
    < GROUP BY 절 >
    그룹기준을 제시할 수 있는 구문 (해당 그룹기준별로 여러 그룹을 묶을 수 있음)
    여러 개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용
    
    GROUP BY 절에 함수식 기술 가능
    GROUP BY 절에 여러 칼럼 기술 가능
*/
--------------------------------------------------------------------------------
/*
    < HAVING 절 >
    그룹에 대한 조건을 제시할 때 사용되는 구문 (주로 그룹함수식을 가지고 조건을 제시할 때 사용)
*/
--------------------------------------------------------------------------------
/*
    < SELECT 문 실행순서 >
    SELECT * | 조회하고자 하는 컬럼 (별칭가능) | 산술식 (별칭가능) | 함수식 (별칭가능) --5
    FROM 조회하고자 하는 테이블명 --1 (처음)
    WHERE 조건식 (연산자를 가지고 기술) --2
    GROUP BY 그룹기준으로 삼을 컬럼 | 함수식 --3
    HAVING 조건식 (주로 그룹함수를 가지고 기술) --4
    ORDER BY 컬럼명 | 별칭 | 컬럼순번 [ASC | DESC] [NULLS FIRST | NULLS LAST] --6 (마지막)
*/
--------------------------------------------------------------------------------
/*
    < 집계함수 >
    그룹별 산출된 결과값에 중간집계를 계산해주는 함수
    
    >> GROUP BY 절에 기술하는 함수
    
    ROLL UP()
    >> 마지막 행으로 전체 총 합까지 같이 조회하고 싶을 때
    
    CUBE()
    >>  GROUP BY 를 통해 묶은 그룹의 중간 집계를 계산해주는 함수
*/
SELECT 
    JOB_CODE AS "직급코드",
    SUM(SALARY) AS "급여합"
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY 1;

SELECT 
    JOB_CODE AS "직급코드",
    DEPT_CODE AS "부서코드",
    SUM(SALARY) AS "급여합"
FROM EMPLOYEE
GROUP BY CUBE(JOB_CODE, DEPT_CODE)
ORDER BY 1;
/*
    < 집합 연산자 - SET OPERATION >
    여러개의 쿼리문을 가지고, 하나의 쿼리문으로 만드는 연산자
    
    - UNION            : OR  | 합집합의 개념 (두 쿼리문을 수행한 결과값을 더한 후 중복되는 값은 한 번만 더해지도록)
    - INTERSECT        : AND | 교집합의 개념 (두 쿼리문 수행한 결과값에 중복된 결과값)
    
    - UNION ALL        : 합집합 + 교집합의 개념 (중복되는 부분이 두 번 표현될 수 있음)
    - MINUS            : 차집합의 개념 (선행 결과값에서 후행 결과값을 뺀 나머지)
    
    집합 연산자 유의사항
    >> 이렇게 쿼리1과 쿼리2의 SELECT 절의 컬럼 갯수 OR 타입 일치하지 않으면 오류
    >> 이름(위치)이 다르다고 오류가 나는 건 X
*/

-- 1. UNION(합집합)
-- 부서코드가 D5인 사원 OR 급여가 300만원 초과인 사원들 조회 (사번, 이름, 부서코드, 급여)
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' --> 총 6개 행 출력 (박나라, 하이유, 김해술, 심봉선, 윤은해, 대북혼)
UNION --> 총 12개 행 출력 (선동일, 송종기, 노옹철, 유재식, 정중하, 박나라, 하이유, 김해술, 심봉선, 윤은해, 대북혼, 전지연)
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE SALARY > 3000000; --> 총 8개 행 출력 (선동일, 송종기, 노옹철, 유재식, 정중하, 심봉선, 대북혼, 전지연)

-- 2. INTERSECT(교집합)
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' --> 총 6개 행 출력 (박나라, 하이유, 김해술, 심봉선, 윤은해, 대북혼)
INTERSECT --> 총 2개 행 출력 (심봉선, 대북혼)
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE SALARY > 3000000; --> 총 8개 행 출력 (선동일, 송종기, 노옹철, 유재식, 정중하, 심봉선, 대북혼, 전지연)

-- 3. UNION ALL : 여러개의 쿼리 결과를 무조건 다 더하는 연산 (중복값 나옴)
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' --> 총 6개 행 출력 (박나라, 하이유, 김해술, 심봉선, 윤은해, 대북혼)
UNION ALL --> 총 14개 행 출력 (선동일, 송종기, 노옹철, 유재식, 정중하, 박나라, 하이유, 김해술, 심봉선, 심봉선, 윤은해, 대북혼, 대북혼, 전지연)
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE SALARY > 3000000; --> 총 8개 행 출력 (선동일, 송종기, 노옹철, 유재식, 정중하, 심봉선, 대북혼, 전지연)

-- 4. MINUS : 선행 SELECT 결과에서 후행 SELECT 결과를 뺀 나머지
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' --> 총 6개 행 출력 (박나라, 하이유, 김해술, 심봉선, 윤은해, 대북혼)
MINUS --> 총 4개 행 출력 (박나라, 하이유, 김해술, 윤은해)
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    DEPT_CODE AS "부서코드",
    SALARY AS "급여"
FROM EMPLOYEE
WHERE SALARY > 3000000; --> 총 8개 행 출력 (선동일, 송종기, 노옹철, 유재식, 정중하, 심봉선, 대북혼, 전지연)
