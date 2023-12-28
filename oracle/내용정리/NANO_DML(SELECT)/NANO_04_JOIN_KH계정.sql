/*
    < JOIN >
    2 개 이상의 테이블에서 데이터를 조회하고자 할 때 사용되는 구문
    조회 결과는 하나의 결과물(RESULT SET)로 나옴
    
    관계형 데이터베이스는 최소한의 데이터로 각각의 테이블에 데이터를 담고 있음
    
    -- 어떤 사원이 어떤 부서에 속해있는지 궁금함..
    -- 이 때, 코드(D9, D5,...) 말고 부서명으로 조회하고 싶음
    
    >> 관계형 데이터베이스에서 SQL문을 이용한 테이블간에 "관계"를 맺는 방법
    (무작정 다 조회를 해오는 게 아니라, 각 테이블간 연결고리로써의 데이터를 매칭해서 조회해야 함)
    
    JOIN 은 크게 "오라클 전용구문" 과 "ANSI 구문" 로 나뉨
    *ANSI -- 미국국립표준협회 --> 아스키코드표 만드는 곳이 ANSI임
*/

/*
    1. 등가조인(EQUAL JOIN) / 내부조인(INTER JOIN)
       연결시키는 컬럼의 값이 일치하는 행들만 조인돼서 조회 (= 일치하는 값이 없는 행은 조회에서 제외)
       
       오라클 전용 구문
       - FROM 절에 조회하고자 하는 테이블을 나열
       - WHERE 절에 매칭시킬 컬럼(연결고리)에 대한 조건을 제시
       * 연결할 두 컬럼명이 같은 경우, 테이블명이나 별칭으로 구분 필요
       
       ANSI 구문
       - FROM 절에 기준이 되는 테이블을 하나만 기술 한 후
       - JOIN 절에 같이 조회하고자 하는 테이블 기술 + 매칭시킬 컬럼에 대한 조건도 같이 기술
       - JOIN USING, JOIN ON
       * 연결할 두 컬럼명이 다른 경우, JOIN ON 만 가능
       * 연결할 두 컬렴명이 같은 경우, JOIN ON 과 JOIN USING 모두 가능
*/

-----------------------------------[참고사항]------------------------------------

/*
    2. 자연조인 (NATURAL JOIN
    각 테이블마다 동일한 컬럼이 단 한개만 존재할 경우 
    
        ANSI 구문
*/
SELECT
    EMP_ID AS "사번",
    EMP_NAME AS "이름",
    JOB_CODE AS "직급 코드",
    JOB_NAME AS "직급"
FROM EMPLOYEE
NATURAL JOIN JOB;

--------------------------------------------------------------------------------

/*
    3. 포괄조인 / 외부조인 (OUTER JOIN)
    두 테이블간의 JOIN 시 일치하지 않는 행도 포함시켜서 조회 가능
    단, 반드시 LEFT, RIGHT 지정 필요
*/

SELECT
    EMP_NAME AS "사원명",
    DEPT_TITLE AS "부서명",
    SALARY AS "급여",
    SALARY * 12 AS "연봉"
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- 부서배치가 안 된 사원 2명 정보가 없어 조회되지 않아 21명 조회

/*
    3-1) LEFT [OUTER] JOIN
    두 테이블 중 왼편에 기술된 테이블 기준으로 JOIN
*/

--  3-1) ANSI 구문
SELECT
    EMP_NAME AS "사원명",
    DEPT_TITLE AS "부서명",
    SALARY AS "급여",
    SALARY * 12 AS "연봉"
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--  3-1) 오라클 전용 구문
SELECT
    EMP_NAME AS "사원명",
    DEPT_TITLE AS "부서명",
    SALARY AS "급여",
    SALARY * 12 AS "연봉"
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);
-- 기준 테이블(FROM 절) 의 반대되는 컬럼(WHERE 절) 뒤에 (+)

/*
    3-2) RIGHT [OUTER] JOIN
    두 테이블 중 오른편에 기술된 테이블을 기준으로 JOIN
*/

--  3-2) ANSI 구문
SELECT
    EMP_NAME AS "사원명",
    DEPT_TITLE AS "부서명",
    SALARY AS "급여",
    SALARY * 12 AS "연봉"
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--  3-2) 오라클 전용 구문
SELECT
    EMP_NAME AS "사원명",
    DEPT_TITLE AS "부서명",
    SALARY AS "급여",
    SALARY * 12 AS "연봉"
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID;

-- 3) FULL [OUTER] JOIN : 두 테이블이 가진 모든 행을 조회 (단, 오라클 전용구문으로는 안 됨)
SELECT
    EMP_NAME AS "사원명",
    DEPT_TITLE AS "부서명",
    SALARY AS "급여",
    SALARY * 12 AS "연봉"
FROM EMPLOYEE
FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

/*
    4. 자체조인 (SELF JOIN)
    같은 테이블을 다시 한 번 조인
*/

--  4-1) 오라클 전용 구문
SELECT
    E.EMP_ID AS "사원의 사번",
    E.EMP_NAME AS "사원의 이름",
    E.DEPT_CODE AS "사원의 부서코드",
    M.EMP_ID AS "사수의 사번",
    M.EMP_NAME AS "사수의 이름",
    M.DEPT_CODE AS "사수의 부서코드"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;

--  4-2) ANSI 구문
SELECT
    E.EMP_ID AS "사원의 사번",
    E.EMP_NAME AS "사원의 이름",
    E.DEPT_CODE AS "사원의 부서코드",
    M.EMP_ID AS "사수의 사번",
    M.EMP_NAME AS "사수의 이름",
    M.DEPT_CODE AS "사수의 부서코드"
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);

--------------------------------------------------------------------------------

/*
    < 다중 JOIN >
    2개 이상의 테이블을 JOIN 
*/
