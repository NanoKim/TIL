/*
    DDL (DATA DEFINITION LANGUAGE) : 데이터 정의 언어
    
    객체들을 생성(CREATE), 변경(ALTER), 삭제(DROP) 하는 구문
    
    < ALTER >
    객체를 변경하는 구문
    
    [표현법]
    ALTER TABLE 테이블명 변경할내용;
    
    * 변경할내용
    1) 컬럼 추가/수정/삭제 
    1_1) 컬럼 추가(ADD)
         ALTER TABLE 테이블명 ADD 컬럼명 자료형 [DEFAULT] 제약조건
    1_2) 컬럼 수정(MODIFY)
         ALTER TABLE 테이블명 MODIFY 컬럼명 바꾸고자하는 자료형
         >> 다중 수정 가능
    1_3) 컬럼 삭제(DROP COLUMN)
         ALTER TABLE 테이블명 DROP COLUMN 삭제하고자 하는 컬럼명
         >> 다중 삭제 불가능
    
    2) 제약조건 추가/삭제 --> 수정은 불가 (수정하고자 한다면 삭제 후 새로이 추가)
    2_1) 제약조건 추가(ADD)
         PRIMARY KEY : ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] PRIMARY KEY(컬럼명)
         FOREIGN KEY : ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] FOREIGN KEY(컬럼명) REFERENCES 참조할 테이블명[(참조할컬럼명)]
         UNIQUE      : ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] UNIQUE(컬럼명)
         CHECK       : ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] CHECK(컬럼에 대한 조건)
         NOT NULL    : ALTER TABLE 테이블명 MODIFY 컬럼명 [CONSTRAINT 제약조건명] NOT NULL | NULL
    2_2) 제약조건 삭제(DROP)
         NOT NULL 외 : ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명
         NOT NULL : ALTER TABLE 테이블명 MODIFY 컬럼명 NOT NULL | NULL
         
    3) 컬럼명/제약조건명/테이블명 변경
    3_1) 컬럼명 변경
         ALTER TABLE 테이블명 RENAME COLUMN 기존 컬럼명 TO 변경할 컬럼명
    3_2) 제약조건명 변경
         ALTER TABLE 테이블명 RENAME CONSTRAINT 제약조건명 TO 변경할 제약조건명
    3_3) 테이블명 변경
         ALTER TABLE 테이블명 RENAME [기존테이블명] TO 바꿀테이블명
*/

/*
    < DROP >
    테이블 삭제
    
    [표현법]
    DROP TABLE 테이블명;
    
    단, 어딘가에서 참조되고 있는 부모테이블은 함부로 삭제 안 됨

    > 방법1. 자식테이블 먼저 삭제 후 부모테이블 삭제
    
    > 방법2. 부모테이블만 삭제하는데 제약조건까지 같이 삭제
      DROP TABLE 테이블명 CASCADE CONSTRAINT;
*/
