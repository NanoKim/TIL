# 목차

- [STEP 1](#step-1)
- [STEP 2](#step-2)
- [STEP 3](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
- [STEP 4](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
- [STEP 5](#step-5)
- [STEP 6](#step-6)

# STEP 1
1_1. JOB 테이블의 모든 정보 조회
```sql
SELECT *
FROM   JOB;
```  

<br/>
  
1_2. JOB 테이블의 직급 이름 조회
```sql
SELECT JOB_NAME AS "직급 이름"
FROM   JOB;
```

<br/>

1_3. DEPARTMENT 테이블의 모든 정보 조회
```sql
SELECT *
FROM   DEPARTMENT;
```

<br/>

1_4. EMPLOYEE테이블의 직원명, 이메일, 전화번호, 고용일 조회
```sql
SELECT EMP_NAME  AS "직원명",
       EMAIL     AS "이메일",
       PHONE     AS "전화번호",
       HIRE_DATE AS "고용일"
FROM   EMPLOYEE; 
```

<br/>

1_5. EMPLOYEE테이블의 고용일, 사원 이름, 월급 조회
```sql
SELECT HIRE_DATE AS "고용일", 
       EMP_NAME  AS "사원 이름", 
       SALARY    AS "월급"
FROM   EMPLOYEE;
```

<br/>

1_6. EMPLOYEE테이블에서 이름, 연봉, 총수령액(보너스포함), 실수령액(총수령액 - (연봉*세금 3%)) 조회
```sql
SELECT EMP_NAME                                 AS "이름", 
       SALARY*12                                AS "연봉", 
       (SALARY*(1+BONUS))*12                    AS "총수령액(보너스포함)", 
       (SALARY*(1+BONUS))*12 - (SALARY*12*0.03) AS "실수령액"
FROM   EMPLOYEE;
```

<br/>

1_7. EMPLOYEE테이블에서 SAL_LEVEL이 S1인 사원의 이름, 월급, 고용일, 연락처 조회
```sql
SELECT EMP_NAME  AS "이름", 
       SALARY    AS "월급", 
       HIRE_DATE AS "고용일", 
       PHONE     AS "연락처"
FROM   EMPLOYEE
WHERE  SAL_LEVEL = 'S1';
```

<br/>

1_8. EMPLOYEE테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회
```sql
SELECT EMP_NAME                                 AS "이름", 
       SALARY                                   AS "월급", 
       (SALARY*(1+BONUS))*12 - (SALARY*12*0.03) AS "실수령액", 
       HIRE_DATE                                AS "고용일"
FROM   EMPLOYEE
WHERE  (SALARY*(1+BONUS))*12 - (SALARY*12*0.03) >= 50000000;
```

<br/>

1_9. EMPLOYEE테이블에 월급이 4000000이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
```sql
SELECT *
FROM   EMPLOYEE
WHERE  SALARY >= 4000000
       AND JOB_CODE = 'J2';
```

<br/>

1_10. EMPLOYEE테이블에 DEPT_CODE가 D9이거나 D5인 사원 중 고용일이 02년 1월 1일보다 빠른 사원의 이름, 부서코드, 고용일 조회
```sql
SELECT EMP_NAME  AS "이름", 
       DEPT_CODE AS "부서코드", 
       HIRE_DATE AS "고용일"
FROM   EMPLOYEE
WHERE  DEPT_CODE IN('D9','D5')
       AND HIRE_DATE < '02/01/01';
```

<br/>

1_11. EMPLOYEE테이블에 고용일이 90/01/01 ~ 01/01/01인 사원의 전체 내용을 조회
```sql
SELECT *
FROM   EMPLOYEE
WHERE  HIRE_DATE BETWEEN '90/01/01'
       AND '01/01/01';
```

<br/>

1_12. EMPLOYEE테이블에서 이름 끝이 '연'으로 끝나는 사원의 이름 조회
```sql
SELECT EMP_NAME AS "이름"
FROM   EMPLOYEE
WHERE  EMP_NAME LIKE '%연';
```

<br/>

1_13. EMPLOYEE테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 조회
```sql
SELECT EMP_NAME AS "이름", 
       PHONE AS "전화번호"
FROM   EMPLOYEE
WHERE  PHONE NOT LIKE '010%';
```

<br/>

1_14. EMPLOYEE테이블에서 메일주소 '_'의 앞이 4자이면서 DEPT_CODE가 D9 또는 D6이고 고용일이 90/01/01 ~ 00/12/01이고, 급여가 270만 이상인 사원의 전체를 조회
```sql
SELECT *
FROM   EMPLOYEE
WHERE  EMAIL LIKE '____$_%' ESCAPE '$' 
       AND DEPT_CODE IN('D9','D6') 
       AND HIRE_DATE BETWEEN '90/01/01'
       AND '00/12/01' 
       AND SALARY >= 2700000;
```

<br/>

1_15. EMPLOYEE테이블에서 사원 명과 직원의 주민번호를 이용하여 생년, 생월, 생일 조회
```sql
SELECT EMP_NAME           AS "사원 명", 
       SUBSTR(EMP_NO,1,2) AS "생년", 
       SUBSTR(EMP_NO,3,2) AS "생월", 
       SUBSTR(EMP_NO,5,2) AS "생일"
FROM   EMPLOYEE;
```

<br/>

1_16. EMPLOYEE테이블에서 사원명, 주민번호 조회 (단, 주민번호는 생년월일만 보이게 하고, '-'다음 값은 '*'로 바꾸기)
```sql
SELECT EMP_NAME                            AS "사원명", 
       CONCAT(SUBSTR(EMP_NO,1,8),'******') AS "주민번호"
FROM   EMPLOYEE;
```

```sql
SELECT EMP_NAME AS "사원명", 
       RPAD(SUBSTR(EMP_NO,1,8),14,'*') AS "주민번호"
FROM   EMPLOYEE;
```

<br/>

1_17. EMPLOYEE테이블에서 사원명, 입사일-오늘, 오늘-입사일 조회 (단, 각 별칭은 근무일수1, 근무일수2가 되도록 하고 모두 정수(내림), 양수가 되도록 처리)
```sql
SELECT EMP_NAME                        AS "사원명", 
       ABS(FLOOR(HIRE_DATE - SYSDATE)) AS "근무일수1", 
       ABS(FLOOR(SYSDATE - HIRE_DATE)) AS "근무일수2"
FROM   EMPLOYEE
ORDER  BY "근무일수1";
```

<br/>

1_18. EMPLOYEE테이블에서 사번이 홀수인 직원들의 정보 모두 조회
```sql
SELECT *
FROM   EMPLOYEE
WHERE  MOD(EMP_ID, 2) = 1;
```

```sql
SELECT *
FROM   EMPLOYEE
WHERE  EMP_ID LIKE '%1' OR EMP_ID LIKE '%3' OR EMP_ID LIKE '%5' OR EMP_ID LIKE '%7' OR EMP_ID LIKE '%9';
```

<br/>

1_19. EMPLOYEE테이블에서 근무 년수가 20년 이상인 직원 정보 조회
```sql
SELECT *
FROM   EMPLOYEE
WHERE  (SYSDATE-HIRE_DATE) >= 365.25*20;
```

<br/>

1_20. EMPLOYEE 테이블에서 사원명, 급여 조회 (단, 급여는 '\9,000,000' 형식으로 표시)
```sql
SELECT EMP_NAME                        AS "사원명", 
       TO_CHAR(SALARY, 'L999,999,999') AS "급여"
FROM   EMPLOYEE;
```

<br/>

1_21. EMPLOYEE테이블에서 직원 명, 부서코드, 생년월일, 나이(만) 조회 (단, 생년월일은 주민번호에서 추출해서 00년 00월 00일로 출력되게 하며 나이는 주민번호에서 출력해서 날짜데이터로 변환한 다음 계산)
```sql
SELECT EMP_NAME                                                        AS "직원 명", 
       DEPT_CODE                                                       AS "부서코드", 
       EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO, 1, 6)))
       ||'년 '
       || EXTRACT(MONTH FROM TO_DATE(SUBSTR(EMP_NO, 1, 6)))
       ||'월 '
       || EXTRACT(DAY FROM TO_DATE(SUBSTR(EMP_NO, 1, 6)))
       ||'일'                                                          AS "생년월일",
       FLOOR((SYSDATE - TO_DATE(SUBSTR(EMP_NO,1,6)))/365.25 - 1)||'세' AS "나이(만)"
FROM   EMPLOYEE;
```

<br/>

1_22. EMPLOYEE테이블에서 부서코드가 D5, D6, D9인 사원만 조회하되 D5면 총무부, D6면 기획부, D9면 영업부로 처리 (단, 부서코드 오름차순으로 정렬)
```sql
SELECT EMP_NAME,
       CASE
         WHEN DEPT_CODE = 'D5' THEN '총무부'
         WHEN DEPT_CODE = 'D6' THEN '기획부'
         ELSE '영업부'
       END AS "부서"
FROM   EMPLOYEE
WHERE  DEPT_CODE IN('D5','D6','D9')
ORDER  BY DEPT_CODE;
```

```sql
SELECT EMP_NAME,
       DECODE(DEPT_CODE,'D5','총무부','D6','기획부','D9','영업부') AS "부서"
FROM   EMPLOYEE
WHERE  DEPT_CODE IN ('D5','D6','D9')
ORDER  BY DEPT_CODE;
```

<br/>

1_23. EMPLOYEE테이블에서 사번이 201번인 사원명, 주민번호 앞자리, 주민번호 뒷자리, 주민번호 앞자리와 뒷자리의 합 조회
```sql
SELECT EMP_NAME                               AS "사원명", 
       SUBSTR(EMP_NO,1,6)                     AS "주민번호 앞자리", 
       SUBSTR(EMP_NO,8,14)                    AS "주민번호 뒷자리", 
       SUBSTR(EMP_NO,1,6)+SUBSTR(EMP_NO,8,14) AS "주민번호 앞뒤의 합"
FROM   EMPLOYEE
WHERE  EMP_ID = 201;
```

<br/>

1_24. EMPLOYEE테이블에서 부서코드가 D5인 직원의 보너스 포함 연봉 합 조회
```sql
SELECT SALARY*(1+NVL(BONUS,0))*12
FROM   EMPLOYEE
WHERE  DEPT_CODE = 'D5';
```

<br/>

1_25. EMPLOYEE테이블에서 직원들의 입사일로부터 년도만 가지고 각 년도별 입사 인원수 조회 전체 직원 수, 2001년, 2002년, 2003년, 2004
```sql
SELECT SUM(CASE
            WHEN TO_CHAR(HIRE_DATE, 'YYYY') = '2001' THEN 1
            ELSE 0
           END) AS "2001년",
       SUM(CASE
            WHEN TO_CHAR(HIRE_DATE, 'YYYY') = '2002' THEN 1
            ELSE 0
           END) AS "2002년",
       SUM(CASE
            WHEN TO_CHAR(HIRE_DATE, 'YYYY') = '2003' THEN 1
            ELSE 0
           END) AS "2003년",
       SUM(CASE
            WHEN TO_CHAR(HIRE_DATE, 'YYYY') = '2004' THEN 1
            ELSE 0
           END) AS "2004년"
FROM   EMPLOYEE;
```

```sql
SELECT COUNT(*) AS "전체 직원 수",
       COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), '2001',1)) AS "2001년",
       COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), '2002',1)) AS "2002년",
       COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), '2003',1)) AS "2003년",
       COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), '2004',1)) AS "2004년"
FROM   EMPLOYEE;
```
**\*COUNT(1) → '2001'이 맞으면 카운팅을 1 하는 의도 (1이 아닌 숫자도 결과 동일)**

<br/>

# STEP 2
2_1. EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회
```sql
SELECT *
FROM   EMP
WHERE  COMM IS NOT NULL;
```  

<br/>
  
2_2.EMP테이블에서 커미션을 받지 못하는 직원 조회
```sql
SELECT *
FROM   EMP
WHERE  COMM IS NULL;
```  

<br/>

2_3. EMP테이블에서 관리자가 없는 직원 정보 조회
```sql
SELECT *
FROM   EMP
WHERE  MGR IS NULL;
```

<br/>

2_4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회
```sql
SELECT *
FROM   EMP
ORDER  BY SAL DESC;
```

<br/>

2_5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
```sql
SELECT *
FROM   EMP
ORDER  BY SAL DESC,
          COMM DESC;
```

<br/>

2_6. EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)
```sql
SELECT EMPNO    AS "사원번호",
       ENAME    AS "사원명",
       JOB      AS "직급",
       HIREDATE AS "입사일"
FROM   EMP
ORDER  BY HIREDATE;
```

<br/>

2_7. EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
```sql
SELECT EMPNO AS "사원번호",
       ENAME AS "사원명"
FROM   EMP
ORDER  BY EMPNO DESC;
```

<br/>

2_8. EMP테이블에서 사번, 입사일, 사원명, 급여 조회 (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)
```sql
SELECT EMPNO    AS "사번",
       HIREDATE AS "입사일",
       ENAME    AS "사원명",
       SAL      AS "급여"
FROM   EMP
ORDER  BY DEPTNO,
          HIREDATE;
```

<br/>

2_9. 오늘 날짜에 대한 정보 조회
```sql
SELECT SYSDATE
FROM   DUAL;
```

<br/>

2_10. EMP테이블에서 사번, 사원명, 급여 조회 (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)
```sql
SELECT EMPNO         AS "사번",
       ENAME         AS "사원명",
       ROUND(SAL,-2) AS "급여"
FROM   EMP
ORDER  BY SAL DESC;
```

```sql
SELECT EMPNO                 AS "사번",
       ENAME                 AS "사원명",
       100 * CEIL(SAL / 100) AS "급여"
FROM   EMP
ORDER  BY "급여" DESC;
```

<br/>

2_11. EMP테이블에서 사원번호가 홀수인 사원들을 조회
```sql
SELECT *
FROM   EMP
WHERE  MOD(EMPNO,2) = 1;
```

<br/>

2_12. EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
```sql
SELECT ENAME                    AS "사원명",
       TO_CHAR(HIREDATE,'YYYY') AS "입사년도",
       TO_CHAR(HIREDATE, 'MM')  AS "입사월"
FROM   EMP;
```

<br/>

2_13. EMP테이블에서 9월에 입사한 직원의 정보 조회
```sql
SELECT *
FROM   EMP
WHERE  TO_CHAR(HIREDATE,'MM') = 09;
```

<br/>

2_14. EMP테이블에서 81년도에 입사한 직원 조회
```sql
SELECT *
FROM   EMP
WHERE  TO_CHAR(HIREDATE,'RR') = 81;
```

<br/>

2_15. EMP테이블에서 이름이 'E'로 끝나는 직원 조회
```sql
SELECT *
FROM   EMP
WHERE  ENAME LIKE '%E';
```

<br/>

2_16. EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
```sql
SELECT *
FROM   EMP
WHERE  ENAME LIKE '__R%';
```

```sql
SELECT *
FROM   EMP
WHERE  SUBSTR(ENAME,3,1) = 'R';
```

<br/>

2_17. EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
```sql
SELECT EMPNO,
       ENAME,
       HIREDATE,
       ADD_MONTHS(HIREDATE,40*12)
FROM   EMP;
```

<br/>

2_18. EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
```sql
SELECT *
FROM   EMP
WHERE  TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(HIREDATE,'YYYY') >= 38;
```

<br/>

2_19. 오늘 날짜에서 년도만 추출
```sql
SELECT TO_CHAR(SYSDATE,'YYYY')
FROM   DUAL;
```
