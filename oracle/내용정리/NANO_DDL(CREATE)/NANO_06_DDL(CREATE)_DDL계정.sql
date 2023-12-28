/*
    * DDL (DATA DEFINITION LANGUAGE) : 데이터 정의 언어
    오라클에서 제공하는 객체(OBJECT)를 새로이 만들고, 구조를 변경 (ALTER)하고, 구조 자체를 삭제(DROP) 하는 언어
    즉, 실제 데이터 값이 아닌 구조 자체를 정의하는 언어
    주로 DB 관리자, 설계자가 사용
    
    오라클에서 제공하는 객체(구조) : 테이블(TABLE), 뷰(VIEW), 시퀀스(SEQUENCE),
                                  인덱스(INDEX), 패키지(PACKAGE), 트리거(TRIGGER),
                                  프로시져(PROCEDURE), 함수(FUNCTION), 동의어(SYNONYM), 사용자(USER)
    < CREATE >
    객체를 새로이 생성하는 구문
*/

/*
    1. 테이블 생성
    - 테이블이란? 행(ROW) 과 열(COLUMN) 로 구성되는 가장 기본적인 데이터베이스 객체
      모든 데이터들은 테이블을 통해서 저장됨
      (DBMS 용어 중 하나로, 데이터를 일종의 표 형태로 표현한 것)
      
    [표현법]
    CREATE TABLE 테이블명(
        컬럼명 자료형(크기),
        컬럼명 자료형(크기),
        컬럼명 자료형         <<---- 크기 지정을 안해줘도 되는 컬럼도 있다.
        ...
    );
    
    * 자료형
    - 문자 (CHAR(바이트크기) | VARCHAR2(바이트크기)) => 반드시 크기 지정 해야함
    > CHAR : 
        최대 2000 바이트 까지 지정 가능
        고정된 글자수의 데이터 만이 담길 경우 사용
            EX) 성별(F/M) 이나 탈퇴여부(Y/N) 같이 1글자 정도? 외에는 거의 VARCHAR2
        지정된 범위 안에서만 써야함
        고정길이 (지정한 크기보다 더 적은 값이 들어오면 공백으로 채워줌)
            EX) EMP_NAME : CHAR(11 바이트) => 김뫄뫄 => 9 바이트 => '김뫄뫄  ' 이렇게 어떻게든 11 바이트를 맞춰줌
    > VARCHAR2 : 
        최대 4000 바이트 까지 지정 가능
        몇 글자의 데이터가 들어올지 모를 경우 사용
        가변길이 (담긴 값에 따라서 공간의 크기 맞춰짐)
            EX) EMP_NAME : CHAR(11 바이트) => 김뫄뫄 => 9 바이트 => '김뫄뫄' 이렇게 공백없이 9 바이트를 맞춰줌
        
    - 숫자 (NUMBER)           <<---- 숫자는 무조건 NUMBER, 크기지정 안해도 OK
        
    - 날짜 (DATE)             <<---- 날짜는 무조건 DATE, 크기지정 안해도 OK
       
*/

/*
    2. 컬럼에 주석 달기 (컬럼에 대한 설명)
    
    [표현법]
    COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
*/

/*
    유저 삭제하고자 할 때 : DROP USER 유저명
    테이블 삭제하고자 할 때 : DROP TABLE 테이블명
    
    테이블에 데이터 추가 : INSERT INTO 테이블명 VALUES(값1, 값2, ...)
    
    < 제약조건 CONSTRAINTS >
    원하는 데이터 값 (유효한 형식의 값) 만 유지하기 위해 특정 컬럼에 설정하는 제약 조건
    
    >> 데이터의 무결성 보장 목적
    
    * 종류 : NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY
*/

/*
    * NOT NULL 제약조건
      해당 컬럼에 반드시 값이 존재해야만 할 경우 (즉, 해당 컬럼에 절대 NULL이 들어와서는 안되는 경우)
      삽입 / 수정 시 NULL 값을 허용하지 않도록 제한
      
    * UNIQUE 제약조건
      해당 컬럼에 중복된 값이 들어가서는 안 될 경우
      컬럼값에 중복값을 제한하는 제약조건
      삽입 / 수정 시 기존에 있는 데이터 값 중 중복값이 있을 경우 오류발생
      
    * CHECK(조건식) 제약조건
      해당 컬럼에 들어올 수 있는 값에 대한 조건을 제시해둘 수 있음
      해당 조건에 만족하는 데이터 값만 담길 수 있음
    
    * PRIMARY KEY(기본키) 제약조건
      테이블에서 각 행들을 식별하기 위해 사용될 컬럼에 부여하는 제약조건 (식별자의 역할)
      
      >> 유의사항 : 한 테이블당 오로지 한 개만 설정가능
      >> PRIMART KEY 제약조건을 부여하면 그 컬럼에 자동으로 NOT NULL + UNIQUE 제약조건을 가진다.
    
    ** PRIMARY KEY(복합키 대상 컬럼1, 복합키 대상 컬럼2)
       복합키
       
    * FOREIGN KEY(외래키) 제약조건
      다른 테이블에 존재하는 값만 들어와야 되는 특정 컬럼에 부여하는 제약조건
      
      >> 다른 테이블을 참조한다고 표현
      >> 주로 FOREIGN KEY 제약조건에 의해 테이블 간의 관계가 형성
    
      > 컬럼 레벨 방식
      컬럼명 자료형 [CONSTRAINT 제약조건명] REFERENCES 참조할 테이블명[(참조할 컬럼명)]
    
      > 테이블 레벨 방식
      [CONSTRAINT 제약조건명] FOREIGN KEY(컬렴명) REFERENCES 참조할 테이블명[(참조할 컬럼명)]
    
      * 컬럼이든, 테이블 레벵방식이든,
      [(참조할 컬럼명)] 을 생략 시, 참조할 테이블에 PRIMARY KEY로 지정된 컬럼으로 자동 매칭
*/

/*
    [제약조건을 부여하는 방식]
    * NOT NULL 제약조건은 오로지 컬럼레벨방식 밖에 안 됨
      
    [컬럼레벨방식]
    CREATE TABLE 테이블명(
        컬럼명 자료형 [CONSTRAINT 제약조건명] 제약조건
    );
      
    [테이블레벨방식]
    CREATE TABLE 테이블명(
        컬럼명 자료형,
        컬럼명 자료형,
        ...
        [CONSTRAINT 제약조건명] 제약조건(컬럼명)
    );
*/

/*
    자식 테이블 생성 시 외래키 제약조건 부여할 때 삭제옵션 지정가능
    * 삭제옵션 : 부모테이블의 데이터 삭제 시 그 데이터를 사용하고 있는 자식테이블의 값을 어떻게 처리할건지
    
    FOREIGN KEY 설정할 때 아무것도 안하면 (기본값)
    - ON DELETE RESTRICTED  : 삭제제한 옵션으로, 자식데이터로 쓰이는 부모데이터는 삭제 안되게끔

    FOREIGN KEY 설정할 때 별도 설정
    - ON DELETE SET NULL : 부모데이터 삭제시 해당 데이터를 쓰고 있는 자식데이터의 값을 NULL로 변경
    - ON DELETE CASCADE : 부모데이터 삭제시 해당 데이터를 쓰고 있는 자식데이터도 같이 삭제
*/

/*
    < DEFAULT 기본값 > ** 제약조건 아님 **
    컬럼을 선정하지 않고, INSERT 시 NULL 이 아닌 기본값을 INSERT 하고자 할 때 세팅해둘 수 있는 값

    [컬럼레벨방식]
    CREATE TABLE 테이블명(
        컬럼명 자료형 [DEFAULT '기본값'] [CONSTRAINT 제약조건명] 제약조건
    );
      
    [테이블레벨방식]
    CREATE TABLE 테이블명(
        컬럼명 자료형 [DEFAULT '기본값'],
        컬럼명 자료형 [DEFAULT '기본값'],
        ...
        [CONSTRAINT 제약조건명] 제약조건(컬럼명)
    );
*/

/*
    < SUBQUERY 를 이용한 테이블 생성 >
    테이블 복사 개념
    
    [표현법]
    CREATE TABLE 테이블명
    AS 서브쿼리;
    
    * 데이터는 제외하고, 구조만 복사하고 싶다면 서브쿼리의 WHERE 절에 1 = 0 과 같이 FALSE 조건 기술
    * 컬럼, 데이터값, 제약조건 같은 경우 NOT NULL만 복사
    * 함수식 OR 산술식은 별칭을 부여해야만 복사 가능
*/

/*
    * 테이블 다 생성된 후 제약조건 추가
    ALTER TABLE 테이블명 변경할내용;
    
    - PRIMARY KEY : ALTER TABLE 테이블명 ADD PRIMARY KEY(컬럼명);
    - FOREIGN KEY : ALTER TABLE 테이블명 ADD FOREIGN KEY(컬럼명) REFERENCES 참조할 테이블명[(참조할 컬럼명)];
    - UNIQUE      : ALTER TABLE 테이블명 ADD UNIQUE(컬럼명);
    - CHECK       : ALTER TABLE 테이블명 ADD CHECK(컬럼에 대한 조건식);
    - NOT NULL    : ALTER TABLE 테이블명 MODIFY 컬럼명 NOT NULL;
*/

































