/*
    DQL (QUERY 데이터 질의 언어) : SELECT
    
    DML (MANIPULATION 데이터 조작 언어) : (SELECT), INSERT, UPDATE, DELETE
    DDL (DEFINITION 데이터 정의 언어) : CREATE, ALTER, DROP
    DCL (CONTROL, 데이터 제어 언어) : GRANT, REVOKE [COMMIT, ROLLBACK]
    
    TCL (TRANSACTION 트랜잭션 제어 언어) : COMMIT, ROLLBACK
*/

/*
    1. INSERT
       테이블에 새로운 행을 추가하는 구문
       
       [표현법]
       1) INSERT INTO 테이블명 VALUES(값1, 값2, ...);
          테이블에 모든 컬럼에 대한 값을 직접 제시해서 한 행 INSERT 하고자 할 때 사용
          컬럼 순번을 지켜서 VALUES 에 값을 나열
          
          부족하게 값을 제시했을 경우 : not enough value 오류
          값을 더 많이 제시했을 경우 : too many values 오류
          
       2) INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) VALUES(값1, 값2, ...);
          테이블에 내가 선택한 컬럼에 대한 값만 INSERT 할 때 사용
          그래도 한 행 단위로 추가되기에 선택이 안 된 컬럼은 기본적으로 NULL 이 INSERT
           
          >> NOT NULL 제약조건이 걸려있는 컬럼은 반드시 선택해서 직접 값 제시
          단, DEFAULT 값이 있는 경우는 NULL이 아닌 DEFAULT 값이 들어감
          
       3) INSERT INTO 테이블명 (서브쿼리)
          서브쿼리로 조회된 결과값을 INSERT (여러행 INSERT 에 유용)
          
       4) INSERT ALL
           INTO 테이블명1 VALUES(컬럼명1, 컬럼명2, ...)
           INTO 테이블명2 VALUES(컬럼명2, 컬럼명2, ...)
                서브쿼리;
       
       * 조건을 사용해서도 각 테이블에 값 INSERT 가능
       [표현법]
        INSERT ALL
        WHEN 조건1 THEN 
            INTO 테이블명1 VALUES(컬럼명, 컬럼명, ...)
        WHEN 조건2 THEN
            INTO 테이블명2 VALUES(컬럼명, 컬럼명, ...)
        서브쿼리;
*/

/*
    2. UPDATE
       테이블에 기록되어 있는 기존의 데이터를 수정하는 구문
       
       [표현법]
       UPDATE 테이블명
       SET 컬럼명 = 바꿀값,
           컬럼명 = 바꿀값,
           ...
       [WHERE 조건];      --> 생략 시 전체 행의 모든 데이터가 변경되니 웬만하면 조건 반드시 기술
       
       >> 여러개의 컬럼값 동시 변경 가능 (, 로 나열)
*/

/*
    3. DELETE
       테이블에 기록된 데이터를 삭제하는 구문 (한 행 단위로 삭제)
       
       [표현법]
       DELETE FROM 테이블명
       [WHERE 조건]; --> WHERE 절 제시 안 하면 전체 행 다 삭제
*/

/*
    * TRUNCATE : 테이블의 전체 행을 삭제할 때 사용되는 구문
                 DELETE 보다 수행속도가 빠름
                 별도의 조건 제시 불가, ROLLBACK 불가
    
    [표현법]
    TRUNCATE TABLE 테이블명;
*/














