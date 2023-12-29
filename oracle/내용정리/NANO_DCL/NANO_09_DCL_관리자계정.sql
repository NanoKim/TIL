/*
    < DCL : DATA CONTROL LANGUAGE >
    데이터 제어 언어
    
    계정에게 시스템 권한 또는 객체접근 권한을 부여(GRANT) 하거나 회수(REVOKE) 하는 구문
    
    > 시스템 권한 : DB에 접근하는 권한, 객체들을 생성할 수 있는 권한
    > 객체접근 권한 : 특정 객체들을 조작할 수 있는 권한
    
    
*/

/*
    * 시스템 권한 종류
    - CREATE SESSION : 접속할 수 있는 권한
    - CREATE TABLE : 테이블을 생성할 수 있는 권한
    - CREATE VIEW : 뷰를 생성하는 권한
    - CREATE SEQUENCE : 시퀀스를 생성할 수 있는 권한
    .....ETC : 일부는 커넥트안에 이미 포함
*/

/*
    * 객체 접근 권한 종류
      특정 객체에 접근해서 조작할 수 있는 권한
      
      권한종류                  특정객체
      ---------------------------------------
      SELECT     |      TABLE, VIEW, SEQUENCE
      INSERT     |      TABLE, VIEW
      UPDATE     |      TABLE, VIEW
      DELETE     |      TABLE, VIEW
      ...ETC
      
      [표현법]
      GRANT 권한종류 ON 특정객체 TO 계정
*/

/*
    1. SAMPLE / SAMPLE 계정 생성
    CREATE USER 유저이름 IDENTIFIED BY 유저비밀번호;
    
    2. 접속을 위해 CREATE SESSION 권한 부여
    GRANT CREATE SESSION TO 계정;
    
    3_1. 테이블 생성할 수 있는 CREATE TABLE 권한 부여
    GRANT CREATE TABLE TO 계정;
    
    3_2. TABLESPACE 할당 (SAMPLE 계정 변경)
    ALTER USER 계정 QUOTA 2M ON SYSTEM;
    
    4. 객체 접근 권한 부여
    GRANT 권한종류 ON 특정객체 TO 계정
*/

SELECT *
FROM ROLE_SYS_PRIVS
WHERE ROLE IN ('CONNECT', 'RESOURCE')
ORDER BY 1;
--> ROLE 조회 방법
