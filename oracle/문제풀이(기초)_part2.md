# 목차

- [STEP 1](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88).md?plain=1)
- [STEP 2](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88).md?plain=1)
- [STEP 3](#step-3)
- [STEP 4](#step-4)
  - [Basic](#basic)
  - [Additional](#additional)
  - [Additional Option](#additional-option)
  - [DDL](#ddl)
  - [DML](#dml)
- [STEP 5](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part3.md)
- [STEP 6](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part3.md)

# STEP 3
3-1. 70년대 생(1970~1979) 중 여자이면서 전씨인 사원의 이름과 주민번호, 부서 명, 직급 조회

**Oracle**
```sql
SELECT EMP_NAME,
       EMP_NO,
       DEPT_TITLE,
       JOB_NAME
FROM   EMPLOYEE E, DEPARTMENT, JOB J
WHERE  DEPT_CODE = DEPT_ID
       AND E.JOB_CODE = J.JOB_CODE
       AND SUBSTR(EMP_NO,1,1) = 7
       AND SUBSTR(EMP_NO,8,1) IN (2,4)
       AND EMP_NAME LIKE '전%';
```

**ANSI**
```sql
SELECT EMP_NAME,
       EMP_NO,
       DEPT_TITLE,
       JOB_NAME
FROM   EMPLOYEE
JOIN   DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN   JOB USING(JOB_CODE)
WHERE  SUBSTR(EMP_NO,1,1) = 7
       AND SUBSTR(EMP_NO,8,1) IN (2,4)
       AND EMP_NAME LIKE '전%';
```

<br/>

3-2. 나이 상 가장 막내의 사원 코드, 사원 명, 나이, 부서 명, 직급 명 조회

**Oracle**
```sql
SELECT *
FROM   (SELECT EMP_ID,
               EMP_NAME,
               FLOOR((SYSDATE - TO_DATE(SUBSTR(EMP_NO,1,6),'RR/MM/DD'))/365.25) AS 나이,
               DEPT_TITLE,
               JOB_NAME
        FROM   EMPLOYEE E, DEPARTMENT, JOB J
        WHERE  DEPT_CODE = DEPT_ID
               AND E.JOB_CODE = J.JOB_CODE
        ORDER  BY 3)
WHERE  ROWNUM = 1;
```

**ANSI**
```sql
SELECT *
FROM   (SELECT EMP_ID,
               EMP_NAME,
               FLOOR((SYSDATE - TO_DATE(SUBSTR(EMP_NO,1,6),'RR/MM/DD'))/365.25) AS 나이,
               DEPT_TITLE,
               JOB_NAME
        FROM   EMPLOYEE
        JOIN   DEPARTMENT ON(DEPT_CODE = DEPT_ID)
        JOIN   JOB USING(JOB_CODE)
        ORDER  BY 3)
WHERE  ROWNUM = 1;
```

<br/>

3-3. 이름에 ‘형’이 들어가는 사원의 사원 코드, 사원 명, 직급 조회

**Oracle**
```sql
SELECT EMP_ID,
       EMP_NAME,
       JOB_NAME
FROM   EMPLOYEE E, JOB J
WHERE  E.JOB_CODE = J.JOB_CODE
       AND EMP_NAME LIKE '%형%';
```

**ANSI**
```sql
SELECT EMP_ID,
       EMP_NAME,
       JOB_NAME
FROM   EMPLOYEE
JOIN   JOB USING(JOB_CODE)
WHERE  EMP_NAME LIKE '%형%';
```

<br/>

3-4. 부서코드가 D5이거나 D6인 사원의 사원 명, 직급 명, 부서 코드, 부서 명 조회

**Oracle**
```sql
SELECT EMP_NAME,
       JOB_NAME,
       DEPT_CODE,
       DEPT_TITLE
FROM   EMPLOYEE E, JOB J, DEPARTMENT
WHERE  E.JOB_CODE = J.JOB_CODE
       AND DEPT_CODE = DEPT_ID
       AND DEPT_CODE IN ('D5','D6')
ORDER  BY 3 DESC,
          1;
```

**ANSI**
```sql
SELECT EMP_NAME,
       JOB_NAME,
       DEPT_CODE,
       DEPT_TITLE
FROM   EMPLOYEE
JOIN   JOB USING(JOB_CODE)
JOIN   DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE  DEPT_CODE IN ('D5','D6')
ORDER  BY 3 DESC,
          1;
```

<br/>

3-5. 보너스를 받는 사원의 사원 명, 부서 명, 지역 명 조회

**Oracle**
```sql
SELECT EMP_NAME,
       BONUS,
       DEPT_TITLE,
       LOCAL_NAME
FROM   EMPLOYEE, DEPARTMENT, LOCATION
WHERE  DEPT_CODE = DEPT_ID
       AND LOCAL_CODE = LOCATION_ID
       AND BONUS IS NOT NULL;  
```

**ANSI**
```sql
SELECT EMP_NAME,
       BONUS,
       DEPT_TITLE,
       LOCAL_NAME
FROM   EMPLOYEE
JOIN   DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN   LOCATION ON(LOCAL_CODE = LOCATION_ID)
WHERE  BONUS IS NOT NULL;
```

<br/>

3-6. 사원 명, 직급 명, 부서 명, 지역 명 조회

**Oracle**
```sql
SELECT EMP_NAME,
       JOB_NAME,
       DEPT_TITLE,
       LOCAL_NAME
FROM   EMPLOYEE E, JOB J, DEPARTMENT, LOCATION
WHERE  E.JOB_CODE = J.JOB_CODE
       AND DEPT_CODE = DEPT_ID
       AND LOCAL_CODE = LOCATION_ID;
```

**ANSI**
```sql
SELECT EMP_NAME,
       JOB_NAME,
       DEPT_TITLE,
       LOCAL_NAME
FROM   EMPLOYEE
JOIN   JOB USING(JOB_CODE)
JOIN   DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN   LOCATION ON (LOCAL_CODE = LOCATION_ID);
```

<br/>

3-7. 한국이나 일본에서 근무 중인 사원의 사원 명, 부서 명, 지역 명, 국가 명 조회

**Oracle**
```sql
SELECT EMP_NAME,
       DEPT_TITLE,
       LOCAL_NAME,
       NATIONAL_NAME
FROM   EMPLOYEE, DEPARTMENT, LOCATION L, NATIONAL N
WHERE  DEPT_ID = DEPT_CODE
       AND LOCAL_CODE = LOCATION_ID
       AND L.NATIONAL_CODE = N.NATIONAL_CODE
       AND NATIONAL_NAME IN ('한국','일본');
```

**ANSI**
```sql
SELECT EMP_NAME,
       DEPT_TITLE,
       LOCAL_NAME,
       NATIONAL_NAME
FROM   EMPLOYEE
JOIN   DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN   LOCATION ON (LOCAL_CODE = LOCATION_ID)
JOIN   NATIONAL USING (NATIONAL_CODE)
WHERE  NATIONAL_NAME IN ('한국','일본');
```

<br/>

3-8. 한 사원과 같은 부서에서 일하는 사원의 이름 조회

**Oracle**
```sql
SELECT E.EMP_NAME,
       E.DEPT_CODE,
       D.EMP_NAME
FROM   EMPLOYEE E, EMPLOYEE D
WHERE  E.DEPT_CODE = D.DEPT_CODE
       AND E.EMP_NAME != D.EMP_NAME
ORDER  BY 1;
```

**ANSI**
```sql
SELECT E.EMP_NAME,
       DEPT_CODE,
       D.EMP_NAME
FROM   EMPLOYEE E
JOIN   EMPLOYEE D USING(DEPT_CODE)
WHERE  E.EMP_NAME != D.EMP_NAME
ORDER  BY 1;
```

<br/>

3-9. 보너스가 없고 직급 코드가 J4이거나 J7인 사원의 이름, 직급 명, 급여 조회(NVL 이용)

**Oracle**
```sql
SELECT EMP_NAME,
       JOB_NAME,
       SALARY
FROM   EMPLOYEE E, JOB J
WHERE  E.JOB_CODE = J.JOB_CODE
       AND E.JOB_CODE IN ('J4','J7')
       AND BONUS IS NULL;
```

**ANSI**
```sql
SELECT EMP_NAME,
       JOB_NAME,
       SALARY
FROM   EMPLOYEE
JOIN   JOB USING(JOB_CODE)
WHERE  JOB_CODE IN ('J4','J7')
       AND BONUS IS NULL;
```

<br/>

3-10. 보너스 포함한 연봉이 높은 5명의 사번, 이름, 부서 명, 직급, 입사일, 순위 조회

**Oracle**
```sql
SELECT *
FROM   (SELECT EMP_ID,
               EMP_NAME,
               DEPT_TITLE,
               JOB_NAME,
               HIRE_DATE,
               ROWNUM
        FROM   EMPLOYEE E, DEPARTMENT, JOB J
        WHERE  DEPT_CODE = DEPT_ID
               AND E.JOB_CODE = J.JOB_CODE
        ORDER  BY (SALARY*(1+NVL(BONUS,0)))*12 DESC)
WHERE  ROWNUM <= 5;
```

**ANSI**
```sql
SELECT *
FROM   (SELECT EMP_ID,
               EMP_NAME,
               DEPT_TITLE,
               JOB_NAME,
               HIRE_DATE,
               ROWNUM
        FROM   EMPLOYEE
        JOIN   DEPARTMENT ON (DEPT_CODE = DEPT_ID)
        JOIN   JOB USING (JOB_CODE)
        ORDER  BY (SALARY*(1+NVL(BONUS,0)))*12 DESC)
WHERE  ROWNUM <= 5;
```

<br/>

3-11. 부서 별 급여 합계가 전체 급여 총 합의 20%보다 많은 부서의 부서 명, 부서 별 급여 합계 조회

**ANSI**
```sql
SELECT DEPT_TITLE,
       SUM(SALARY)
FROM   EMPLOYEE
JOIN   DEPARTMENT ON (DEPT_CODE = DEPT_ID)
HAVING SUM(SALARY) >= ((SELECT SUM(SALARY)
                        FROM   EMPLOYEE)/5)
GROUP  BY DEPT_TITLE;
```

<br/>

3-12. 부서 명과 부서 별 급여 합계 조회

**Oracle**
```sql
SELECT DEPT_TITLE,
       SUM(SALARY) AS "TOTAL"
FROM   DEPARTMENT, EMPLOYEE
WHERE  DEPT_CODE = DEPT_ID(+)
GROUP  BY DEPT_TITLE;
```

**ANSI**
```sql
SELECT DEPT_TITLE,
       SUM(SALARY) AS "TOTAL"
FROM   DEPARTMENT D
RIGHT  JOIN EMPLOYEE E ON (DEPT_CODE = DEPT_ID)
GROUP  BY DEPT_TITLE;
```

<br/>

# STEP 4

## Basic
4-1-1.
```sql
```

<br/>

4-1-2.
```sql
```

<br/>

4-1-3.
```sql
```

<br/>

4-1-4.
```sql
```

<br/>

4-1-5.
```sql
```

<br/>

4-1-6.
```sql
```

<br/>

4-1-7.
```sql
```

<br/>

4-1-8.
```sql
```

<br/>

4-1-9.
```sql
```

<br/>

4-1-10.
```sql
```

<br/>

## Additional
4-2-1.
```sql
```

<br/>

4-2-2.
```sql
```

<br/>

4-2-3.
```sql
```

<br/>

4-2-4.
```sql
```

<br/>

4-2-5.
```sql
```

<br/>

4-2-6.
```sql
```

<br/>

4-2-7.
```sql
```

<br/>

4-2-8.
```sql
```

<br/>

4-2-9.
```sql
```

<br/>

4-2-10.
```sql
```

<br/>

4-2-11.
```sql
```

<br/>

4-2-12.
```sql
```

<br/>

4-2-13.
```sql
```

<br/>

4-2-14.
```sql
```

<br/>

4-2-15.
```sql
```

<br/>

## Additional Option
4-3-1.
```sql
```

<br/>

4-3-2.
```sql
```

<br/>

4-3-3.
```sql
```

<br/>

4-3-4.
```sql
```

<br/>

4-3-5.
```sql
```

<br/>

4-3-6.
```sql
```

<br/>

4-3-7.
```sql
```

<br/>

4-3-8.
```sql
```

<br/>

4-3-9.
```sql
```

<br/>

4-3-10.
```sql
```

<br/>

4-3-11.
```sql
```

<br/>

4-3-12.
```sql
```

<br/>

4-3-13.
```sql
```

<br/>

4-3-14.
```sql
```

<br/>

4-3-15.
```sql
```

<br/>

4-3-16.
```sql
```

<br/>

4-3-17.
```sql
```

<br/>

4-3-18.
```sql
```

<br/>

4-3-19.
```sql
```

<br/>

## DDL
4-4-1.
```sql
```

<br/>

4-4-2.
```sql
```

<br/>

4-4-3.
```sql
```

<br/>

4-4-4.
```sql
```

<br/>

4-4-5.
```sql
```

<br/>

4-4-6.
```sql
```

<br/>

4-4-7.
```sql
```

<br/>

4-4-8.
```sql
```

<br/>

4-4-9.
```sql
```

<br/>

4-4-10.
```sql
```

<br/>

4-4-11.
```sql
```

<br/>

4-4-12.
```sql
```

<br/>

4-4-13.
```sql
```

<br/>

4-4-14.
```sql
```

<br/>

4-4-15.
```sql
```

<br/>

## DML
4-5-1.
```sql
```

<br/>

4-5-2.
```sql
```

<br/>

4-5-3.
```sql
```

<br/>

4-5-4.
```sql
```

<br/>

4-5-5.
```sql
```

<br/>

4-5-6.
```sql
```

<br/>

4-5-7.
```sql
```

<br/>

4-5-8.
```sql
```
