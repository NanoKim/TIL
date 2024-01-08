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
4-1-1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열" 으로 표시하도록 한다
```sql
SELECT DEPARTMENT_NAME AS "학과 명",
       CATEGORY        AS "계열"
FROM   TB_DEPARTMENT;
```

<br/>

4-1-2. 학과의 학과 정원을 화면에 출력한다.
```sql
SELECT DEPARTMENT_NAME
       || '의 정원은'
       || CAPACITY
       || '명 입니다.' AS "학과 정원"
FROM   TB_DEPARTMENT;
```

<br/>

4-1-3. "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이들어왔다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)
```sql
SELECT STUDENT_NAME
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO = 001 
       AND SUBSTR(STUDENT_SSN,8,1) IN(2,4) 
       AND ABSENCE_YN = 'Y';
```

<br/>

4-1-4. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 한다. 그 대상자들의 학번이 다음(A513079, A513090, A513091, A513110, A513119)과 같을 때 대상자들을 찾는 적절한 SQL 구문을 작성하시오.
```sql
SELECT STUDENT_NAME
FROM   TB_STUDENT
WHERE  STUDENT_NO IN('A513079','A513090','A513091','A513110','A513119')
ORDER  BY STUDENT_NAME DESC;
```

<br/>

4-1-5. 입학정원이 20 명 이상 30 명 이하인 학과들의 학과 이름과 계열을 출력하시오.
```sql
SELECT DEPARTMENT_NAME,
       CATEGORY
FROM   TB_DEPARTMENT
WHERE  CAPACITY BETWEEN 20 AND 30;
```

<br/>

4-1-6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 그럼 춘기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.
```sql
SELECT PROFESSOR_NAME
FROM   TB_PROFESSOR
WHERE  DEPARTMENT_NO IS NULL;
```

<br/>

4-1-7. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다. 어떠한 SQL 문장을 사용하면 될 것인지 작성하시오.
```sql
SELECT STUDENT_NAME
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO IS NULL;
```

<br/>

4-1-8. 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는 과목들은 어떤 과목인지 과목번호를 조회해보시오
```sql
SELECT CLASS_NO
FROM   TB_CLASS
WHERE  PREATTENDING_CLASS_NO IS NOT NULL;
```

<br/>

4-1-9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.
```sql
SELECT DISTINCT CATEGORY
FROM   TB_DEPARTMENT
ORDER  BY CATEGORY;
```

<br/>

4-1-10. 02 학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들은 제외한 재학중인 학생들의 학번, 이름, 주민번호를 출력하는 구문을 작성하시오.
```sql
SELECT STUDENT_NO,
       STUDENT_NAME,
       STUDENT_SSN
FROM   TB_STUDENT
WHERE  STUDENT_ADDRESS LIKE '전주%' 
       AND ABSENCE_YN = 'N' 
       AND STUDENT_NO LIKE 'A2%'
ORDER  BY STUDENT_NAME,
          STUDENT_SSN,
          STUDENT_NO;
```

<br/>

## Additional
4-2-1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른순으로 표시하는 SQL 문장을 작성하시오. (단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)
```sql
SELECT STUDENT_NO                          AS "학번",
       STUDENT_NAME                        AS "이름",
       TO_CHAR(ENTRANCE_DATE,'RRRR-MM-DD') AS "입학년도"
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO = 002
ORDER  BY ENTRANCE_DATE;
```

<br/>

4-2-2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. (* 이때 올바르게 작성한 SQL 문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)
```sql
SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM   TB_PROFESSOR
WHERE  LENGTH(PROFESSOR_NAME) ^= 3;
```

```sql
SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM   TB_PROFESSOR
WHERE  PROFESSOR_NAME NOT LIKE '___';
```

<br/>

4-2-3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 단 이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 만드시오. (단, 교수 중 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 한다. 나이는 ‘만’으로 계산한다.)
```sql
SELECT PROFESSOR_NAME AS "교수이름",
       EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE('19'||SUBSTR(PROFESSOR_SSN,1,6))) AS "나이"
FROM   TB_PROFESSOR
 WHERE SUBSTR(PROFESSOR_SSN,8,1) IN(1,3)
 ORDER BY 2;
```

<br/>

4-2-4. 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL 문장을 작성하시오. 출력 헤더는 "이름" 이 찍히도록 한다. (성이 2 자인 경우는 교수는 없다고 가정하시오)
```sql
SELECT SUBSTR(PROFESSOR_NAME,2,2) AS "이름"
FROM   TB_PROFESSOR;
```

```sql
SELECT SUBSTR(PROFESSOR_NAME,2,LENGTH(PROFESSOR_NAME)-1) AS "이름 "
FROM   TB_PROFESSOR;
```

<br/>

4-2-5. 춘 기술대학교의 재수생 입학자를 구하려고 한다. 어떻게 찾아낼 것인가? 이때,19 살에 입학하면 재수를 하지 않은 것으로 간주한다
```sql
SELECT STUDENT_NO,
       STUDENT_NAME
  FROM TB_STUDENT
 WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,6))) > 19;
```

<br/>

4-2-6. 2020 년 크리스마스는 무슨 요일인가?
```sql
SELECT TO_CHAR(TO_DATE(20201225), 'DAY')
FROM   DUAL;
```

<br/>

4-2-7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') 은 각각 몇 년 몇 월 몇 일을 의미할까? 또 TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD') 은 각각 몇 년 몇 월 몇 일을 의미할까?
```sql
SELECT TO_DATE('99/10/11','YY/MM/DD')
FROM   DUAL;                           -- 2099/10/11

SELECT TO_DATE('49/10/11','YY/MM/DD')
FROM   DUAL;                           -- 2049/10/11

SELECT TO_DATE('99/10/11','RR/MM/DD')
FROM   DUAL;                           -- 1999/10/11

SELECT TO_DATE('49/10/11','RR/MM/DD')
FROM   DUAL;                           -- 2049/10/11
```

<br/>

4-2-8. 춘 기술대학교의 2000 년도 이후 입학자들은 학번이 A 로 시작하게 되어있다. 2000 년도 이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오.
```sql
SELECT STUDENT_NO,
       STUDENT_NAME
FROM   TB_STUDENT
WHERE  SUBSTR(STUDENT_NO,1,1) <> 'A';
```

<br/>

4-2-9. 학번이 A517178 인 한아름 학생의 학점 총 평점을 구하는 SQL 문을 작성하시오. 단, 이때 출력 화면의 헤더는 "평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한 자리까지만 표시한다.
```sql
SELECT ROUND(AVG(POINT),1) AS "평점"
FROM   TB_GRADE
WHERE  STUDENT_NO = 'A517178';
```

<br/>

4-2-10. 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 만들어 결과값이 출력되도록 하시오.
```sql
SELECT DEPARTMENT_NO       AS "학과번호",
       COUNT(STUDENT_NAME) AS "학생수(명)"
FROM   TB_STUDENT
GROUP  BY DEPARTMENT_NO;
```

<br/>

4-2-11. 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는지 알아내는 SQL 문을 작성하시오.
```sql
SELECT COUNT(*)
FROM   TB_STUDENT
WHERE  COACH_PROFESSOR_NO IS NULL;
```

<br/>

4-2-12. 학번이 A112113 인 김고운 학생의 년도 별 평점을 구하는 SQL 문을 작성하시오. 단, 이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한 자리까지만 표시한다.
```sql
SELECT DISTINCT TO_CHAR(SUBSTR(TERM_NO,1,4)) AS "년도",
       ROUND(AVG(POINT),1)                   AS "년도 별 평점"
FROM   TB_GRADE
WHERE  STUDENT_NO = 'A112113'
GROUP  BY SUBSTR(TERM_NO,1,4)
ORDER  BY 1;
```

<br/>

4-2-13. 학과 별 휴학생 수를 파악하고자 한다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을 작성하시오.
```sql
SELECT DEPARTMENT_NO                   AS "학과코드명",
       COUNT(DECODE(ABSENCE_YN,'Y',1)) AS "휴학생 수"
FROM   TB_STUDENT
GROUP  BY DEPARTMENT_NO
ORDER  BY 1;
```

<br/>

4-2-14. 춘 대학교에 다니는 동명이인(同名異人) 학생들의 이름을 찾고자 한다. 어떤 SQL 문장을 사용하면 가능하겠는가?
```sql
SELECT STUDENT_NAME AS "동일이름",
       COUNT(*)     AS "동명인 수"
FROM   TB_STUDENT
GROUP  BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER  BY 1;
```

<br/>

4-2-15. 학번이 A112113 인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점 , 총 평점을 구하는 SQL 문을 작성하시오. (단, 평점은 소수점 1 자리까지만 반올림하여 표시한다.)
```sql
SELECT NVL(SUBSTR(TERM_NO,1,4),' ') AS "년도",
       NVL(SUBSTR(TERM_NO,5,2),' ') AS "학기",
       ROUND(AVG(POINT),1)          AS "평점"
FROM   TB_GRADE
WHERE  STUDENT_NO = 'A112113'
GROUP  BY ROLLUP(SUBSTR(TERM_NO,1,4),
          SUBSTR(TERM_NO,5,2));
```

<br/>

## Additional Option
4-3-1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다.
```sql
SELECT STUDENT_NAME    AS "학생 이름",
       STUDENT_ADDRESS AS "주소지"
FROM   TB_STUDENT
ORDER  BY 1;
```

<br/>

4-3-2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.
```sql
SELECT STUDENT_NAME,
       STUDENT_SSN
FROM   TB_STUDENT
WHERE  ABSENCE_YN = 'Y'
ORDER  BY SUBSTR(STUDENT_SSN,1,6) DESC;
```

<br/>

4-3-3. 주소지가 강원도나 경기도인 학생들 중 1900 년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다.
```sql
SELECT STUDENT_NAME    AS "학생이름",
       STUDENT_NO      AS "학번",
       STUDENT_ADDRESS AS "거주지 주소"
FROM   TB_STUDENT
WHERE  (STUDENT_ADDRESS LIKE '강원%' OR STUDENT_ADDRESS LIKE '%경기%') 
       AND SUBSTR(ENTRANCE_DATE,1,1) = 9
ORDER BY 1;
```

<br/>

4-3-4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오. (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아내도록 하자)
```sql
SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM   TB_PROFESSOR
WHERE  DEPARTMENT_NO = 005
ORDER  BY 2;
```

<br/>

4-3-5. 2004 년 2 학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다. 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.
```sql
SELECT STUDENT_NO,
       TO_CHAR(POINT,9.99) AS "POINT"
FROM   TB_GRADE
WHERE  SUBSTR(TERM_NO,1,6) = 200402 
       AND CLASS_NO = 'C3118100'
ORDER  BY 2 DESC,
          STUDENT_NO;
```

<br/>

4-3-6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL 문을 작성하시오.
```sql
SELECT STUDENT_NO,
       STUDENT_NAME,
       DEPARTMENT_NAME
FROM   TB_STUDENT
JOIN   TB_DEPARTMENT USING(DEPARTMENT_NO);
```

<br/>

4-3-7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL 문장을 작성하시오.
```sql
SELECT CLASS_NAME,
       DEPARTMENT_NAME
FROM   TB_CLASS
JOIN   TB_DEPARTMENT USING(DEPARTMENT_NO);
```

<br/>

4-3-8. 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
```sql
SELECT CLASS_NAME,
       PROFESSOR_NAME
FROM   TB_CLASS
JOIN   TB_CLASS_PROFESSOR USING(CLASS_NO)
JOIN   TB_PROFESSOR USING(PROFESSOR_NO);
```

<br/>

4-3-9. 8 번의 결과 중 ‘인문사회’ 계열에 속한 과목의 교수 이름을 찾으려고 한다. 이에 해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
```sql
SELECT CLASS_NAME,
       PROFESSOR_NAME
FROM   TB_CLASS C
JOIN   TB_CLASS_PROFESSOR USING(CLASS_NO)
JOIN   TB_PROFESSOR USING(PROFESSOR_NO)
JOIN   TB_DEPARTMENT D ON(C.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE  CATEGORY = '인문사회';
```

<br/>

4-3-10. ‘음악학과’ 학생들의 평점을 구하려고 한다. 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 출력하는 SQL 문장을 작성하시오. (단, 평점은 소수점 1 자리까지만 반올림하여 표시한다.)
```sql
SELECT STUDENT_NO          AS "학번",
       STUDENT_NAME        AS "학생 이름",
       ROUND(AVG(POINT),1) AS "전체 평점"
FROM   TB_STUDENT
JOIN   TB_GRADE USING(STUDENT_NO)
JOIN   TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE  DEPARTMENT_NAME = '음악학과'
GROUP  BY (STUDENT_NO, STUDENT_NAME)
ORDER  BY 1;
```

<br/>

4-3-11. 학번이 A313047 인 학생이 학교에 나오고 있지 않다. 지도 교수에게 내용을 전달하기 위한 학과 이름, 학생 이름과 지도 교수 이름이 필요하다. 이때 사용할 SQL 문을 작성하시오. 단, 출력헤더는 ?학과이름?, ?학생이름?, ?지도교수이름?으로 출력되도록 한다.
```sql
SELECT DEPARTMENT_NAME AS "학과이름",
       STUDENT_NAME    AS "학생이름",
       PROFESSOR_NAME  AS "지도교수이름"
FROM   TB_STUDENT
JOIN   TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN   TB_PROFESSOR ON (COACH_PROFESSOR_NO=PROFESSOR_NO)
WHERE  STUDENT_NO = 'A313047';
```

<br/>

4-3-12. 2007 년도에 '인간관계론' 과목을 수강한 학생을 찾아 학생이름과 수강학기름 표시하는 SQL 문장을 작성하시오.
```sql
SELECT STUDENT_NAME,
       TERM_NO AS "TERM_NAME"
FROM   TB_STUDENT
JOIN   TB_GRADE USING(STUDENT_NO)
JOIN   TB_CLASS USING(CLASS_NO)
WHERE  SUBSTR(TERM_NO,1,4) = 2007 
       AND CLASS_NAME = '인간관계론';
```

<br/>

4-3-13. 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아 그 과목 이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.
```sql
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM   TB_CLASS C,
       TB_CLASS_PROFESSOR CP,
       TB_DEPARTMENT D
WHERE  C.CLASS_NO = CP.CLASS_NO
       AND C.DEPARTMENT_NO = D.DEPARTMENT_NO
       AND PROFESSOR_NO IS NULL
       AND CATEGORY = '예체능';
```

<br/>

4-3-14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다. 학생이름과 지도교수 이름을 찾고 만일 지도 교수가 없는 학생일 경우 "지도교수 미지정?으로 표시하도록 하는 SQL 문을 작성하시오. 단, 출력헤더는 "학생이름", "지도교수"로 표시하며 고학번 학생이 먼저 표시되도록 한다.
```sql
SELECT STUDENT_NAME                         AS "학생이름",
       NVL(PROFESSOR_NAME,'지도교수 미지정') AS "지도교수"
FROM   TB_STUDENT S, TB_DEPARTMENT D, TB_PROFESSOR P
WHERE  S.DEPARTMENT_NO = D.DEPARTMENT_NO
       AND S.COACH_PROFESSOR_NO = P.PROFESSOR_NO(+)
       AND DEPARTMENT_NAME = '서반아어학과';
```

<br/>

4-3-15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 그 학생의 학번, 이름, 학과 이름, 평점을 출력하는 SQL 문을 작성하시오.
```sql
SELECT S.STUDENT_NO        AS "학번",
       STUDENT_NAME        AS "이름",
       DEPARTMENT_NAME     AS "학과 이름",
       ROUND(AVG(POINT),5) AS "평점"
FROM   TB_STUDENT S,
       TB_DEPARTMENT D,
       TB_GRADE G
WHERE  ABSENCE_YN = 'N'
       AND S.DEPARTMENT_NO = D.DEPARTMENT_NO
       AND S.STUDENT_NO = G.STUDENT_NO
GROUP  BY (S.STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME)
HAVING AVG(POINT) >= 4.0;
```

<br/>

4-3-16. 환경조경학과 전공과목들의 과목 별 평점을 파악할 수 있는 SQL 문을 작성하시오.
```sql
SELECT C.CLASS_NO,
       CLASS_NAME,
       ROUND(AVG(POINT),8) AS "AVG(POINT)"
FROM   TB_CLASS C,
       TB_GRADE G,
       TB_DEPARTMENT D
WHERE  D.DEPARTMENT_NO = C.DEPARTMENT_NO
       AND G.CLASS_NO = C.CLASS_NO
       AND D.DEPARTMENT_NAME = '환경조경학과'
       AND CLASS_TYPE LIKE '전공%'
GROUP  BY (C.CLASS_NO, CLASS_NAME)
ORDER  BY 1;
```

<br/>

4-3-17. 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는 SQL 문을 작성하시오.
```sql
SELECT STUDENT_NAME,
       STUDENT_ADDRESS
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                        FROM   TB_STUDENT 
                        WHERE  STUDENT_NAME = '최경희');
```

<br/>

4-3-18. 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 표시하는 SQL 문을 작성하시오.
```sql
SELECT STUDENT_NO,
       STUDENT_NAME
FROM   (SELECT S.STUDENT_NO,
               STUDENT_NAME
        FROM   TB_STUDENT S,
               TB_DEPARTMENT D,
               TB_GRADE G
        WHERE  S.DEPARTMENT_NO = D.DEPARTMENT_NO
               AND D.DEPARTMENT_NAME = '국어국문학과'
               AND S.STUDENT_NO = G.STUDENT_NO
        GROUP  BY S.STUDENT_NO,
                  STUDENT_NAME
        ORDER  BY AVG(POINT) DESC)
WHERE  ROWNUM = 1;
```

<br/>

4-3-19. 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 학과 별 전공과목 평점을 파악하기 위한 적절한 SQL 문을 찾아내시오. 단, 출력헤더는 "계열 학과명", "전공평점"으로 표시되도록 하고, 평점은 소수점 한 자리까지만 반올림하여 표시되도록 한다.
```sql
SELECT DEPARTMENT_NAME     AS "계열 학과명",
       ROUND(AVG(POINT),1) AS "전공평점"
FROM   TB_DEPARTMENT D,
       TB_GRADE G,
       TB_STUDENT S
WHERE  CATEGORY = (SELECT CATEGORY
                   FROM   TB_DEPARTMENT
                   WHERE  DEPARTMENT_NAME = '환경조경학과') 
       AND D.DEPARTMENT_NO = S.DEPARTMENT_NO
       AND S.STUDENT_NO = G.STUDENT_NO
GROUP  BY DEPARTMENT_NAME
ORDER  BY 1;
```

<br/>

## DDL
4-4-1. 계열 정보를 저장할 카테고리 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오.
```sql
CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);
```

<br/>

4-4-2. 과목 구분을 저장할 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오.
```sql
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5),
    NAME VARCHAR2(10),
    PRIMARY KEY(NO)
);
```

<br/>

4-4-3. TB_CATEGORY 테이블의 NAME 컬럼에 PRIMARY KEY 를 생성하시오. (KEY 이름을 생성하지 않아도 무방함. 만일 KEY 이를 지정하고자 한다면 이름은 본인이 알아서 적당한 이름을 사용한다.)
```sql
ALTER TABLE TB_CATEGORY ADD CONSTRAINT NAME_PK PRIMARY KEY(NAME);
```

<br/>

4-4-4. TB_CLASS_TYPE 테이블의 NAME 컬럼에 NULL 값이 들어가지 않도록 속성을 변경하시오.
```sql
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;
```

<br/>

4-4-5. 두 테이블에서 컬럼 명이 NO 인 것은 기존 타입을 유지하면서 크기는 10 으로, 컬럼명이 NAME 인 것은 마찬가지로 기존 타입을 유지하면서 크기 20 으로 변경하시오.
```sql
ALTER TABLE TB_CATEGORY 
MODIFY NAME VARCHAR2(20);

ALTER TABLE TB_CLASS_TYPE
MODIFY NO VARCHAR2(10)
MODIFY NAME VARCHAR2(20);
```

<br/>

4-4-6. 두 테이블의 NO 컬럼과 NAME 컬럼의 이름을 각 각 TB_ 를 제외한 테이블 이름이 앞에 붙은 형태로 변경한다. (ex. CATEGORY_NAME)
```sql
ALTER TABLE TB_CATEGORY 
RENAME COLUMN NAME TO CATEGORY_NAME;

ALTER TABLE TB_CLASS_TYPE 
RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CLASS_TYPE 
RENAME COLUMN NAME TO CLASS_TYPE_NAME;
```

<br/>

4-4-7. TB_CATEGORY 테이블과 TB_CLASS_TYPE 테이블의 PRIMARY KEY 이름을 다음과 같이 변경하시오. Primary Key 의 이름은 "PK_ + 컬럼이름"으로 지정하시오. (ex. PK_CATEGORY_NAME )
```sql
ALTER TABLE TB_CATEGORY 
RENAME CONSTRAINT NAME_PK TO PK_CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE 
RENAME CONSTRAINT SYS_C007215 TO PK_CLASS_TYPE_NO;
```

<br/>

4-4-8. 다음과 같은 INSERT 문을 수행한다
```sql
INSERT INTO TB_CATEGORY VALUES ('공학','Y');
INSERT INTO TB_CATEGORY VALUES ('자연과학','Y');
INSERT INTO TB_CATEGORY VALUES ('의학','Y');
INSERT INTO TB_CATEGORY VALUES ('예체능','Y');
INSERT INTO TB_CATEGORY VALUES ('인문사회','Y');
COMMIT; 
```

<br/>

4-4-9. TB_DEPARTMENT 의 CATEGORY 컬럼이 TB_CATEGORY 테이블의 CATEGORY_NAME 컬럼을 부모 값으로 참조하도록 FOREIGN KEY 를 지정하시오. 이 때 KEY 이름은 FK_테이블이름_컬럼이름으로 지정한다. (ex. FK_DEPARTMENT_CATEGORY )
```sql
```

<br/>

4-4-10. 춘 기술대학교 학생들의 정보만이 포함되어 있는 학생일반정보 VIEW 를 만들고자 한다. 아래 내용을 참고하여 적절한 SQL 문을 작성하시오.
```sql
CREATE OR REPLACE VIEW VW_학생일반정보
( 학번,
  학생이름,
  주소
)
AS SELECT
          STUDENT_NO
        , STUDENT_NAME
        , STUDENT_ADDRESS
     FROM TB_STUDENT;
```

<br/>

4-4-11. 춘 기술대학교는 1 년에 두 번씩 학과별로 학생과 지도교수가 지도 면담을 진행한다. 이를 위해 사용할 학생이름, 학과이름, 담당교수이름 으로 구성되어 있는 VIEW 를 만드시오. 이때 지도 교수가 없는 학생이 있을 수 있음을 고려하시오 (단, 이 VIEW 는 단순 SELECT 만을 할 경우 학과별로 정렬되어 화면에 보여지게 만드시오.)
```sql
CREATE OR REPLACE VIEW VW_지도면담
( 학생이름,
  학과이름,
  지도교수이름
)
AS SELECT
          STUDENT_NAME
        , DEPARTMENT_NAME
        , PROFESSOR_NAME
     FROM TB_STUDENT
     JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
     LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO=PROFESSOR_NO)
    GROUP BY STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
    ORDER BY 2;
```

<br/>

4-4-12. 모든 학과의 학과별 학생 수를 확인할 수 있도록 적절한 VIEW 를 작성해 보자.
```sql
CREATE OR REPLACE VIEW VW_학과별학생수
AS SELECT
        DEPARTMENT_NAME,
        COUNT(*) AS "STUDENT_COUNT"
     FROM TB_STUDENT
     JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    GROUP BY DEPARTMENT_NAME
    ORDER BY 1;
```

<br/>

4-4-13. 위에서 생성한 학생일반정보 View 를 통해서 학번이 A213046 인 학생의 이름을 본인 이름으로 변경하는 SQL 문을 작성하시오.
```sql
UPDATE VW_학생일반정보
   SET STUDENT_NAME = '김재영'
 WHERE STUDENT_NO = 'A213046';
```

<br/>

4-4-14. 13 번에서와 같이 VIEW 를 통해서 데이터가 변경될 수 있는 상황을 막으려면 VIEW 를 어떻게 생성해야 하는지 작성하시오.
```sql
CREATE OR REPLACE VIEW VW_학생일반정보
AS SELECT
          STUDENT_NO
        , STUDENT_NAME
        , STUDENT_ADDRESS
     FROM TB_STUDENT
WITH READ ONLY;
```

<br/>

4-4-15. 춘 기술대학교는 매년 수강신청 기간만 되면 특정 인기 과목들에 수강 신청이 몰려 문제가 되고 있다. 최근 3 년을 기준으로 수강인원이 가장 많았던 3 과목을 찾는 구문을 작성해보시오.
```sql
SELECT E.*
  FROM (SELECT
               G.CLASS_NO AS "과목번호"
             , CLASS_NAME AS "과목이름"
             , COUNT(*) AS "누적수강생수(명)"
          FROM TB_GRADE G, TB_CLASS C
         WHERE C.CLASS_NO = G.CLASS_NO
           AND SUBSTR(G.TERM_NO,1,4) IN ('2005','2006','2007','2008','2009')
         GROUP BY G.CLASS_NO, CLASS_NAME
         ORDER BY 3 DESC) E
 WHERE ROWNUM <= 3;
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
