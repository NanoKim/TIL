# 목차

- [STEP 1](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part1.md)
- [STEP 2](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part1.md)
- [STEP 3](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
- [STEP 4](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
  - [Basic](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
  - [Additional](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
  - [Additional Option](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
  - [DDL](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
  - [DML](https://github.com/NanoKim/TIL/blob/main/oracle/%EB%AC%B8%EC%A0%9C%ED%92%80%EC%9D%B4(%EA%B8%B0%EC%B4%88)_part2.md)
- [STEP 5](#step-5)
- [STEP 6](#step-6)

# STEP 5
5-1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUBLISHER) <br>
컬럼: PUB_NO(출판사번호) --기본키(PUBLISHER_PK) <br>
PUB_NAME(출판사명) --NOT NULL(PUBLICHSER_NN) <br>
PHONE(출판사전화번호) --제약조건 없음 <br>
3개 정도의 샘플 데이터 추가하기
```sql
CREATE TABLE TB_PUBLISHER(
    PUB_NO NUMBER CONSTRAINT PUBLISHER_PK PRIMARY KEY
  , PUB_NAME VARCHAR2(20) CONSTRAINT PUBLISHER_NN NOT NULL
  , PHONE VARCHAR2(20)
);

COMMENT ON COLUMN TB_PUBLISHER.PUB_NO IS '출판사번호';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NAME IS '출판사명';
COMMENT ON COLUMN TB_PUBLISHER.PHONE IS '출판사전화번호';

INSERT INTO TB_PUBLISHER VALUES(1001,'은송출판사','010-1111-2222');
INSERT INTO TB_PUBLISHER VALUES(1002, '화종출판사', NULL);
INSERT INTO TB_PUBLISHER (PUB_NO, PUB_NAME) VALUES(1003, '나노출판사');
```

 <br>

5-2. 도서들에 대한 데이터를 담기 위한 도서 테이블(TB_BOOK) <br>
컬럼: BK_NO(도서번호) --기본키(BOOK_PK) <br>
BK_TITLE(도서명) --NOT NULL(BOOK_NN_TITLE) <br>
BK_AUTHOR(저자명) --NOT NULL(BOOK_NN_AUTHOR) <br>
BK_PRICE(가격) <br>
BK_STOCK(재고) --기본값 1로 지정 <br>
BK_PUB_NO(출판사번호) --외래키(BOOK_FK)(TB_PUBLISHER 테이블을 참조하도록) <br>
이때 참조하고 있는 부모데이터 삭제 시 자식데이터도 삭제되도록 설정 <br>
5개 정도의 샘플 데이터 추가하기
```sql
CREATE TABLE TB_BOOK(
    BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY
  , BK_TITLE VARCHAR2(50) CONSTRAINT BOOK_NN_TITLE NOT NULL
  , BK_AUTHOR VARCHAR2(20) CONSTRAINT BOOK_NN_AUTHOR NOT NULL
  , BK_PRICE NUMBER
  , BK_STOCK NUMBER DEFAULT 1
  , BK_PUB_NO NUMBER CONSTRAINT BOOK_FK REFERENCES TB_PUBLISHER ON DELETE CASCADE
);

COMMENT ON COLUMN TB_BOOK.BK_NO IS '도서번호';
COMMENT ON COLUMN TB_BOOK.BK_TITLE IS '도서명';
COMMENT ON COLUMN TB_BOOK.BK_AUTHOR IS '저자명';
COMMENT ON COLUMN TB_BOOK.BK_PRICE IS '가격';
COMMENT ON COLUMN TB_BOOK.BK_STOCK IS '재고';
COMMENT ON COLUMN TB_BOOK.BK_PUB_NO IS '출판사번호';

INSERT INTO TB_BOOK VALUES(1, '피카츄는 왜 몬스터볼을 싫어할까', '지우', 100000, 3, 1001);
INSERT INTO TB_BOOK VALUES(2, '리자몽은 불효자식인가', '지우', 150000, 2, 1001);
INSERT INTO TB_BOOK VALUES(3, '간헐적단식 하는 잠만보', '지우', 200000, 3, 1002);
INSERT INTO TB_BOOK (BK_NO, BK_TITLE, BK_AUTHOR, BK_PUB_NO) VALUES(4, '지우는 왜 요리를 안하는가', '웅이', 1003);
INSERT INTO TB_BOOK (BK_NO, BK_TITLE, BK_AUTHOR, BK_PUB_NO) VALUES(5, '웅이눈은 태어날때부터 작았을까', '이슬', 1002);
```

 <br>
 
5-3. 회원에 대한 데이터를 담기 위한 회원 테이블(TB_MEMBER) <br>
컬럼명: MEMBER_NO(회원번호) --기본키(MEMBER_PK) <br>
MEMBER_ID(아이디) --중복금지(MEMBER_UQ) <br>
MEMBER_PWD(비밀번호) NOT NULL(MEMBER_NN_PWD) <br>
MEMBER_NAME(회원명) NOT NULL(MEMBER_NN_NAME) <br>
GENDER(성별) 'M' 또는 'F'로 입력되도록 제한(MEMBER_CK_GEN) <br>
ADDRESS(주소) <br>
PHONE(연락처) <br>
STATUS(탈퇴여부) --기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건(MEMBER_CK_STA) <br>
ENROLL_DATE(가입일) --기본값으로 SYSDATE, NOT NULL 조건(MEMBER_NN_EN) <br>
5개 정도의 샘플 데이터 추가하기
```sql
CREATE TABLE TB_MEMBER(
    MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY
  , MEMBER_ID VARCHAR2(20) CONSTRAINT MEMBER_UQ UNIQUE
  , MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_NN_PWD NOT NULL
  , MEMBER_NAME VARCHAR2(24) CONSTRAINT MEMBER_NN_NAME NOT NULL
  , GENDER CHAR(3) CONSTRAINT MEMBER_CK_GEN CHECK(GENDER IN('M','F'))
  , ADDRESS VARCHAR2(50)
  , PHONE VARCHAR2(20)
  , STATUS CHAR(3) DEFAULT 'N' CONSTRAINT MEMBER_CK_STA CHECK(STATUS IN('N','Y'))
  , ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT MEMBER_NN_EN NOT NULL
);

COMMENT ON COLUMN TB_MEMBER.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN TB_MEMBER.MEMBER_ID IS '아이디';
COMMENT ON COLUMN TB_MEMBER.MEMBER_PWD IS '비밀번호';
COMMENT ON COLUMN TB_MEMBER.MEMBER_NAME IS '회원명';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '성별';
COMMENT ON COLUMN TB_MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN TB_MEMBER.PHONE IS '연락처';
COMMENT ON COLUMN TB_MEMBER.STATUS IS '탈퇴여부';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '가입일';

INSERT INTO TB_MEMBER VALUES(1, 'user01', 'pass01', '피카츄', 'M', NULL, NULL, 'N', '23/01/02');
INSERT INTO TB_MEMBER VALUES(2, 'user02', 'pass02', '라이츄', 'F', null, '010-0101-1010', 'N', '23/01/02');
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NAME, GENDER, STATUS) VALUES(3, 'user03', 'pass03', '파이리', 'M', 'N');
INSERT INTO TB_MEMBER VALUES(4, 'user04', 'pass04', '꼬부기', 'F', '나도 사고싶군 신라면 222-3', null, 'N', '23/05/01');
INSERT INTO TB_MEMBER (MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NAME, GENDER, STATUS) VALUES(5, 'user05', 'pass05', '버터풀', 'F', 'Y');
```

 <br>
 
5-4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여목록 테이블(TB_RENT) <br>
컬럼: <br>
RENT_NO(대여번호) --기본키(RENT_PK) <br>
RENT_MEM_NO(대여회원번호) --외래키(RENT_FK_MEM) TB_MEMBER와 참조하도록 <br>
이때 부모데이터 삭제 시 NULL값이 되도록 옵션 설정 <br>
RENT_BOOK_NO(대여도서번호) --외래키(RENT_FK_BOOK) TB_BOOK와 참조하도록 <br>
이때 부모데이터 삭제 시 NULL값이 되도록 옵션설정 <br>
RENT_DATE(대여일) --기본값 SYSDATE <br>
샘플데이터 3개정도 추가하기
```sql
CREATE TABLE TB_RENT(
    RENT_NO NUMBER CONSTRAINT RENT_PK PRIMARY KEY
  , RENT_MEM_NO NUMBER CONSTRAINT RENT_FK_MEM REFERENCES TB_MEMBER ON DELETE SET NULL
  , RENT_BOOK_NO NUMBER CONSTRAINT RENT_FK_BOOK REFERENCES TB_BOOK ON DELETE SET NULL
  , RENT_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN TB_RENT.RENT_NO IS '대여번호';
COMMENT ON COLUMN TB_RENT.RENT_MEM_NO IS '대여회원번호';
COMMENT ON COLUMN TB_RENT.RENT_BOOK_NO IS '대여도서번호';
COMMENT ON COLUMN TB_RENT.RENT_DATE IS '대여일';

INSERT INTO TB_RENT VALUES(1001, 1, 3, '23/12/01');
INSERT INTO TB_RENT VALUES(1002, 2, 2, '23/09/22');
INSERT INTO TB_RENT (RENT_NO, RENT_MEM_NO, RENT_BOOK_NO) VALUES(1003, 3, 5);
INSERT INTO TB_RENT VALUES(1004, 4, 1, '23/11/11');
INSERT INTO TB_RENT (RENT_NO, RENT_MEM_NO, RENT_BOOK_NO) VALUES(1005, 5, 4);
```

 <br>
 
5-5. 2번 도서를 대여한 회원의 이름, 아이디, 대여일, 반납예정일(대여일+7)을 조회하시오.
```sql
SELECT
       MEMBER_NAME     AS "회원이름"
     , MEMBER_ID       AS "아이디"
     , RENT_DATE       AS "대여일"
     , (RENT_DATE + 7) AS "반납예정일"
  FROM TB_MEMBER
  JOIN TB_RENT ON(MEMBER_NO = RENT_MEM_NO)
  JOIN TB_BOOK ON(BK_NO = RENT_BOOK_NO)
 WHERE BK_NO = 2;
```

<br>

# STEP 6
6-1. 4개 테이블에 포함된 데이터 건 수를 구하는 SQL 구문을 만드는 SQL 구문을 작성하시오. 
```sql
SELECT
       (SELECT COUNT(*) FROM TB_BOOK)        AS "TB_BOOK"
     , (SELECT COUNT(*) FROM TB_WRITER)      AS "TB_WRITER"
     , (SELECT COUNT(*) FROM TB_PUBLISHER)   AS "TB_PUBLISHER"
     , (SELECT COUNT(*) FROM TB_BOOK_AUTHOR) AS "TB_BOOK_AUTHOR"
  FROM DUAL;

SELECT
       'SELECT COUNT(*) FROM ' || TABLE_NAME || ';' AS " "
  FROM USER_TABLES
 ORDER
    BY 1;
```

<br>

6-2. 4개 테이블의 구조를 파악하려고 한다. 제시된 결과처럼 TABLE_NAME, COLUMN_NAME, DATA_TYPE, DATA_DEFAULT, NULLABLE, CONSTRAINT_NAME, CONSTRAINT_TYPE, R_CONSTRAINT_NAME 값을 조회하는 SQL 구문을 작성하시오.
```sql
SELECT
        TABLE_NAME
      , COLUMN_NAME
      , DATA_TYPE
      , DATA_DEFAULT
      , NULLABLE
      , CONSTRAINT_NAME
      , CONSTRAINT_TYPE
      , R_CONSTRAINT_NAME
   FROM USER_TAB_COLS
   LEFT JOIN USER_CONS_COLUMNS USING (TABLE_NAME, COLUMN_NAME)
   LEFT JOIN USER_CONSTRAINTS USING (TABLE_NAME, CONSTRAINT_NAME)
  ORDER
     BY 1
      , 2;

SELECT 
       a.table_name        AS "TABLE_NAME"
     , a.column_name       AS "COLUMN_NAME"
     , a.data_type         AS "DATA_TYPE"
     , a.data_default      AS "DATA_DEFAULT"
     , a.nullable          AS "NULLABLE"
     , c.constraint_name   AS "CONSTRAINT_NAME"
     , b.constraint_type   AS "CONSTRAINT_TYPE"
     , b.r_constraint_name AS "R_CONSTRAINT_NAME"
  FROM user_tab_columns a
  LEFT JOIN user_constraints b ON a.table_name = b.table_name
  LEFT JOIN user_cons_columns c ON b.constraint_name = c.constraint_name AND a.column_name = c.column_name
 WHERE a.table_name IN ('TB_BOOK', 'TB_WRITER', 'TB_PUBLISHER', 'TB_BOOK_AUTHOR');
```

<br>

6-3. 도서명이 25자 이상인 책 번호와 도서명을 화면에 출력하는 SQL 문을 작성하시오.
```sql
SELECT 
       BOOK_NO AS "책 번호"
     , BOOK_NM AS "도서명" 
  FROM TB_BOOK
 WHERE LENGTH(BOOK_NM) >= 25;
```

<br>

6-4. 휴대폰 번호가 ‘019’로 시작하는 김씨 성을 가진 작가를 이름순으로 정렬했을 때 가장 먼저 표시되는 작가 이름과 사무실 전화번호, 집 전화번호, 휴대폰 전화번호를 표시하는 SQL 구문을 작성하시오.
```sql
SELECT
       E.WRITER_NM    AS "작가 이름"
     , E.OFFICE_TELNO AS "사무실 전화번호"
     , E.HOME_TELNO   AS "집 전화번호"
     , E.MOBILE_NO    AS "휴대폰 전화번호"
  FROM (SELECT
               *
          FROM TB_WRITER
         WHERE WRITER_NM LIKE '김%'
           AND MOBILE_NO LIKE '019%'
         ORDER
            BY WRITER_NM) E
 WHERE ROWNUM = 1;
```

<br>

6-5. 저작 형태가 “옮김”에 해당하는 작가들이 총 몇 명인지 계산하는 SQL 구문을 작성하시오. (결과 헤더는 “작가(명)”으로 표시되도록 할 것)
```sql
SELECT 
       COUNT(DISTINCT WRITER_NM) AS "작가(명)"
  FROM TB_WRITER W
     , TB_BOOK_AUTHOR BA
 WHERE W.WRITER_NO = BA.WRITER_NO
   AND COMPOSE_TYPE = '옮김';
```

<br>

6-6. 300권 이상 등록된 도서의 저작 형태 및 등록된 도서 수량을 표시하는 SQL 구문을 작성하시오. (저작 형태가 등록되지 않은 경우는 제외할 것)
```sql
SELECT
       COMPOSE_TYPE AS "저작 형태"
     , COUNT(*)     AS "등록된 도서 수량"
  FROM TB_BOOK_AUTHOR
 GROUP
    BY COMPOSE_TYPE
HAVING COUNT(*) >= 300
   AND COMPOSE_TYPE IS NOT NULL;
```

```sql
SELECT
       COMPOSE_TYPE AS "저작 형태"
     , COUNT(*) AS "등록된 도서 수량"
  FROM TB_BOOK_AUTHOR
 WHERE COMPOSE_TYPE IS NOT NULL
 GROUP
    BY COMPOSE_TYPE
HAVING COUNT(*) >= 300;
```

<br>

6-7. 가장 최근에 발간된 최신작 이름과 발행일자, 출판사 이름을 표시하는 SQL 구문을 작성하시오.
```sql
SELECT 
       E.*
  FROM (SELECT
               BOOK_NM      AS "이름"
             , ISSUE_DATE   AS "발행일자"
             , PUBLISHER_NM AS "출판사 이름" 
          FROM TB_BOOK 
         ORDER
            BY ISSUE_DATE DESC) E
 WHERE ROWNUM = 1;
```

<br>

6-8. 가장 많은 책을 쓴 작가 3명의 이름과 수량을 표시하되, 많이 쓴 순서대로 표시하는 SQL 구문을 작성하시오. 단, 동명이인(同名異人) 작가는 없다고 가정한다. (결과 헤더는 “작가 이름”, “권 수”로 표시되도록 할 것)
```sql
SELECT 
       E.*
  FROM (SELECT
               WRITER_NM      AS "작가 이름"
             , COUNT(BOOK_NM) AS "권 수"
          FROM TB_BOOK B
             , TB_WRITER W
             , TB_BOOK_AUTHOR BA
         WHERE B.BOOK_NO = BA.BOOK_NO
           AND BA.WRITER_NO = W.WRITER_NO
         GROUP
            BY WRITER_NM
         ORDER
            BY 2 DESC) E
 WHERE ROWNUM <= 3;
```

<br>

6-9. 작가 정보 테이블의 모든 등록일자 항목이 누락되어 있는 걸 발견하였다. 누락된 등록일자 값을 각 작가의 ‘최초 출판도서의 발행일과 동일한 날짜’로 변경시키는 SQL 구문을 작성하시오. (COMMIT 처리할 것)
```sql
UPDATE
       TB_WRITER W
   SET W.REGIST_DATE = (SELECT
                               MIN(B.ISSUE_DATE)
                          FROM TB_BOOK B
                          JOIN TB_BOOK_AUTHOR BA ON (B.BOOK_NO = BA.BOOK_NO)
                         WHERE W.WRITER_NO = BA.WRITER_NO);
COMMIT;
```

<br>

6-10. 현재 도서저자 정보 테이블은 저서와 번역서를 구분 없이 관리하고 있다. 앞으로는 번역서는 따로 관리하려고 한다. 제시된 내용에 맞게 “TB_BOOK_ TRANSLATOR” 테이블을 생성하는 SQL 구문을 작성하시오. (Primary Key 제약 조건 이름은 “PK_BOOK_TRANSLATOR”로 하고, Reference 제약 조건 이름은 “FK_BOOK_TRANSLATOR_01”, “FK_BOOK_TRANSLATOR_02”로 할 것)
```sql
CREATE TABLE TB_BOOK_TRANSLATOR(
    BOOK_NO VARCHAR2(10) CONSTRAINT FK_BOOK_TRANSLATOR_01 REFERENCES TB_BOOK
  , WRITER_NO VARCHAR2(10) CONSTRAINT FK_BOOK_TRANSLATOR_02 REFERENCES TB_WRITER
  , TRANS_LANG VARCHAR2(60)
  , CONSTRAINT PK_BOOK_TRANSLATOR PRIMARY KEY(BOOK_NO, WRITER_NO)
);

COMMENT ON COLUMN TB_BOOK_TRANSLATOR.BOOK_NO IS '도서 번호';
COMMENT ON COLUMN TB_BOOK_TRANSLATOR.WRITER_NO IS '작가 번호';
COMMENT ON COLUMN TB_BOOK_TRANSLATOR.TRANS_LANG IS '번역 언어';
```

<br>

6-11. 도서 저작 형태(compose_type)가 '옮김', '역주', '편역', '공역'에 해당하는 데이터는 도서 저자 정보 테이블에서 도서 역자 정보 테이블(TB_BOOK_ TRANSLATOR)로 옮기는 SQL 구문을 작성하시오. 단, “TRANS_LANG” 컬럼은 NULL 상태로 두도록 한다. (이동된 데이터는 더 이상 TB_BOOK_AUTHOR 테이블에 남아 있지 않도록 삭제할 것)
```sql
INSERT 
  INTO TB_BOOK_TRANSLATOR
     (
       BOOK_NO
     , WRITER_NO
     )
     (
SELECT 
       BOOK_NO
     , WRITER_NO 
  FROM TB_BOOK_AUTHOR
 WHERE COMPOSE_TYPE IN ('옮김','역주','편역','공역')
     )
;

DELETE
  FROM TB_BOOK_AUTHOR
 WHERE COMPOSE_TYPE IN ('옮김','역주','편역','공역');
```

<br>

6-12. 2007년도에 출판된 번역서 이름과 번역자(역자)를 표시하는 SQL 구문을 작성하시오.
```sql
SELECT
       BOOK_NM   AS "번역서 이름"
     , WRITER_NM AS "번역자(역자)"
  FROM TB_BOOK
  JOIN TB_BOOK_TRANSLATOR USING(BOOK_NO)
  JOIN TB_WRITER USING(WRITER_NO)
 WHERE EXTRACT(YEAR FROM ISSUE_DATE) = 2007;
```

<br>

6-13. 12번 결과를 활용하여 대상 번역서들의 출판일을 변경할 수 없도록 하는 뷰를 생성하는 SQL 구문을 작성하시오. (뷰 이름은 “VW_BOOK_TRANSLATOR”로 하고 도서명, 번역자, 출판일이 표시되도록 할 것)
```sql
CREATE OR REPLACE VIEW VW_BOOK_TRANSLATOR
    AS SELECT
              BOOK_NM    AS "도서명"
            , WRITER_NM  AS "번역자"
            , ISSUE_DATE AS "출판일"
         FROM TB_BOOK
         JOIN TB_BOOK_TRANSLATOR USING(BOOK_NO)
         JOIN TB_WRITER USING(WRITER_NO)
        WHERE EXTRACT(YEAR FROM ISSUE_DATE) = 2007
WITH READ ONLY;
```

<br>

6-14. 새로운 출판사(춘 출판사)와 거래 계약을 맺게 되었다. 제시된 다음 정보를 입력하는 SQL 구문을 작성하시오.(COMMIT 처리할 것)
```sql
INSERT 
  INTO TB_PUBLISHER
     (
       PUBLISHER_NM
     , PUBLISHER_TELNO
     )
VALUES
     (
       '춘 출판사'
     , '02-6710-3737'
     );

COMMIT;
```

<br>

6-15. 동명이인(同名異人) 작가의 이름을 찾으려고 한다. 이름과 동명이인 숫자를 표시하는 SQL 구문을 작성하시오.
```sql
SELECT
       WRITER_NM
     , COUNT(*)
  FROM TB_WRITER
 GROUP
    BY WRITER_NM
HAVING COUNT(*) > 1;
```

<br>

6-16. 도서의 저자 정보 중 저작 형태(compose_type)가 누락된 데이터들이 적지 않게 존재한다. 해당 컬럼이 NULL인 경우 '지음'으로 변경하는 SQL 구문을 작성하시오.(COMMIT 처리할 것)
```sql
UPDATE
       TB_BOOK_AUTHOR
   SET COMPOSE_TYPE = '지음'
 WHERE COMPOSE_TYPE IS NULL;

COMMIT;
```

<br>

6-17. 서울지역 작가 모임을 개최하려고 한다. 사무실이 서울이고, 사무실 전화 번호 국번이 3자리인 작가의 이름과 사무실 전화 번호를 표시하는 SQL 구문을 작성하시오.
```sql
SELECT
       WRITER_NM
     , OFFICE_TELNO
  FROM TB_WRITER
 WHERE OFFICE_TELNO LIKE '02-___-%';
```

<br>

6-18. 2006년 1월 기준으로 등록된 지 31년 이상 된 작가 이름을 이름순으로 표시하는 SQL 구문을 작성하시오.
```sql
SELECT
       WRITER_NM
     , REGIST_DATE
  FROM TB_WRITER
 WHERE TO_DATE('06/01/01') >=  REGIST_DATE + (365.25*31)
 ORDER
    BY 1;
```

```sql
SELECT
       WRITER_NM
     , REGIST_DATE
  FROM TB_WRITER
 WHERE MONTHS_BETWEEN(TO_DATE('06/01/01'),REGIST_DATE) >= (31*12)
 ORDER
    BY 1;
```

<br>

6-19. 요즘 들어 다시금 인기를 얻고 있는 '황금가지' 출판사를 위한 기획전을 열려고 한다. '황금가지' 출판사에서 발행한 도서 중 재고 수량이 10권 미만인 도서명과 가격, 재고상태를 표시하는 SQL 구문을 작성하시오. 재고 수량이 5권 미만인 도서는 ‘추가주문필요’로, 나머지는 ‘소량보유’로 표시하고, 재고수량이 많은 순, 도서명 순으로 표시되도록 한다. 
```sql
SELECT
       BOOK_NO AS "도서명"
     , PRICE   AS "가격"
     , CASE
        WHEN STOCK_QTY < 5 THEN '추가주문필요'
        ELSE '소량보유'
       END AS "재고수량"
  FROM TB_BOOK
 WHERE PUBLISHER_NM = '황금가지'
   AND STOCK_QTY < 10
 ORDER
    BY 재고수량
     , 도서명;
```

<br>

6-20. '아타트롤' 도서 작가와 역자를 표시하는 SQL 구문을 작성하시오. (결과 헤더는 ‘도서명’,’저자’,’역자’로 표시할 것)
```sql
SELECT
       BOOK_NM      AS "도서명"
     , WA.WRITER_NM AS "저자"
     , WT.WRITER_NM AS "역자"
  FROM TB_BOOK B
  -- 저자 JOIN
  JOIN TB_BOOK_AUTHOR BA ON(BA.BOOK_NO = B.BOOK_NO)
  JOIN TB_WRITER WA ON(BA.WRITER_NO = WA.WRITER_NO)
  -- 역자 JOIN
  JOIN TB_BOOK_TRANSLATOR BT ON(BT.BOOK_NO = B.BOOK_NO)
  JOIN TB_WRITER WT ON(BT.WRITER_NO = WT.WRITER_NO)
 WHERE BOOK_NM = '아타트롤';
```

<br>

6-21. 현재 기준으로 최초 발행일로부터 만 30년이 경과되고, 재고 수량이 90권 이상인 도서에 대해 도서명, 재고수량, 원래 가격, 20% 인하 가격을 표시하는 SQL 구문을 작성하시오. (결과 헤더는 “도서명”, “재고수량”, “가격(Org)”, “가격(New)”로 표시할 것. 재고 수량이 많은 순, 할인 가격이 높은 순, 도서명 순으로 표시되도록 할 것
```sql
SELECT 
       BOOK_NM   AS "도서명"
     , STOCK_QTY AS "재고수량"
     , PRICE     AS "가격(Org)"
     , PRICE*0.8 AS "가격(New)"
  FROM TB_BOOK
 WHERE SYSDATE > ISSUE_DATE + (365.25*30)
   AND STOCK_QTY >= 90
 ORDER
    BY 2 DESC
     , 4 DESC
     , 1;
```

```sql
SELECT 
       BOOK_NM   AS "도서명"
     , STOCK_QTY AS "재고수량"
     , PRICE     AS "가격(Org)"
     , PRICE*0.8 AS "가격(New)"
  FROM TB_BOOK
 WHERE MONTHS_BETWEEN(SYSDATE, ISSUE_DATE) > (12*30)
   AND STOCK_QTY >= 90
 ORDER
    BY 2 DESC
     , 4 DESC
     , 1;
```
