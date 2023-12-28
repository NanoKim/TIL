/*
    < �Լ� FUNCTION >
    ���޵� �÷����� �о�鿩�� �Լ��� ������ ����� ��ȯ
    
    - ������ �Լ� : N���� ���� �о�鿩�� N���� ������� ���� (�� �ึ�� �Լ� ���� ��� ��ȯ)
    - �׷� �Լ� : N���� ���� �о�鿩�� 1���� ������� ���� (�׷��� ���� �׷캰�� �Լ� ���� ��� ��ȯ)

    >> SELECT ���� ������ �Լ��� �׷� �Լ��� �Բ� ��� �� ��
       ��? ��� ���� ������ �ٸ��� ����
       
    >> �Լ����� ����� �� �ִ� ��ġ : SELECT ��, WHERE ��, ORDER BY ��, GROUP BY ��, HAVING ��
*/

--------------------------------< ���� ó�� �Լ� >--------------------------------

/*
    * LENGTH / LENGHTB          => ����� NUMBER Ÿ��
    
    LENGTH(�÷�|'���ڿ���') : �ش� ���ڿ� ���� ���ڼ� ��ȯ
    LENGTHB(�÷�|'���ڿ���') : �ش� ���ڿ� ���� ����Ʈ �� ��ȯ
    
    '��', '��', '��' �� ���ڴ� 3BYTE       ������ => 9BYTE
    ������, ����, Ư�� �� ���ڴ� 1BYTE

    * INSTR
    ���ڿ��κ��� Ư�� ������ ���� ��ġ�� ã�Ƽ� ��ȯ
    
    INSTR(�÷�|'���ڿ�', 'ã���� �ϴ� ����', ['ã�� ��ġ�� ���۰�', [����]])    => ������� NUMBER Ÿ��

    * SUBSTR
    ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ (�ڹٿ��� substring() �޼ҵ�� ����)
    
    SUBSTR(STRING, POSITION, [LENGTH])      => ������� CHARACTER Ÿ��
    - STRING : ����Ÿ���÷�|'���ڿ���'
    - POSITION : ���ڿ��� ������ ���� ��ġ ��
    - LENGTH : ������ ���� ���� (���� �� ������ �ǹ�)

    SELECT EMP_NAME, EMAIL, EMP_NO, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) AS "���̵�"
    FROM EMPLOYEE;
    

    * LPAD / RPAD
    ���ڿ��� ��ȸ�� �� ���ϰ� �ְ� ��ȸ�ϰ��� �� �� ���
    
    LPAD/RPAD(STRING, ���������� ��ȯ�� ������ ����, [�����̰��� �ϴ� ����])
    
    ���ڿ��� �����̰��� �ϴ� ���ڸ� ���� �Ǵ� �����ʿ� ���ٿ��� ���� N���� ��ŭ�� ���ڿ� ��ȯ
    -- �ֹι�ȣ ����ŷ ó�� ����
    SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') AS "�ֹε�Ϲ�ȣ"
    FROM EMPLOYEE;

    * LTRIM / RTRIM (STRING, ['������ ���ڵ�'])
    ���ڿ����� Ư�� ���ڸ� ������ �������� ��ȯ

    => �����ϸ� ���� ����.
    
    ���ڿ��� ���� Ȥ�� �����ʿ��� �����ϰ��� �ϴ� ���ڵ��� ã�Ƽ� ���� �� ���ڿ� ��ȯ

    SELECT LTRIM('123123KH123', '123') FROM DUAL; -- '123' ���� �ϳ� ã�Ƽ� �����ϰ�, '123' ���� �ϳ��� �ƴ� ���� ������ �״�� ����

    * TRIM
    ���ڿ��� �� / �� / ���ʿ� �ִ� ������ ���ڵ��� ������ ������ ���ڿ� ��ȯ
    TRIM([[LEADING]TRAILING]BOTH] Ư�� �����ϰ��� �ϴ� ���ڵ� FROM]STRING)
*/

SELECT TRIM('         K        H      ') FROM DUAL;
-- SELECT TRIM('ZZZZZZZKHZZZZZZZZZZZZZ', 'Z') FROM DUAL; -- ������ �߸��Ǿ� ����
SELECT TRIM('Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL; -- ���� LTRIM
SELECT TRIM(TRAILING 'Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL; -- ���� RTRIM
SELECT TRIM(BOTH 'Z' FROM 'ZZZZZZZKHZZZZZZZZZZZZZ') FROM DUAL; -- ���� �� �⺻�� BOTH

/*
    * LOWER / UPPER / INITCAP(STRING)     => ����� CHARACTER Ÿ��

    LOWER : �ҹ��ڷ� ������ ���ڿ� ��ȯ
    UPPER : �빮�ڷ� ������ ���ڿ� ��ȯ
    INITCAP : �ܾ� �� ���ڸ��� �빮�ڷ� ������ ���ڿ� ��ȯ
    *������ �������� �� �ܾ�� ���

    * CONCAT(STRING, STRING)      => ����� CHARACTER Ÿ��
    ���ڿ� �ΰ��� ���� �޾� �ϳ��� ��ģ �� ��� ��ȯ
    
    * REPLACE(STRING, STR1, STR2)     => ������� CHARACTER Ÿ��
    STR1 �� STR2 �� ��ȯ
    
    SELECT EMP_NAME, EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'gmail.com')
    FROM EMPLOYEE;
*/

--------------------------------< ���� ó�� �Լ� >--------------------------------

/*  
    * ABS(NUMBER)     => ����� NUMBER Ÿ��
    ������ ���밪�� �����ִ� �Լ�
    
    * MOD(NUMBER, NUMBER)        => ����� NUMBER Ÿ��
    �� ���� ���� ���������� ��ȯ���ִ� �Լ�

    * ROUND(NUMBER, [��ġ1])    => ������� NUMBER Ÿ��
    �ݿø��� ����� ��ȯ
      
    ��ġ ���� �� 0��° �ڸ����� �ݿø�
    SELECT ROUND(123.456, 7) FROM DUAL; -- ��ġ���� ũ�� �Է��ص� ������ �� ���� ��

    * CEIL(NUMBER)
    �ø�ó�� ���ִ� �Լ�

    * FLOOR(NUMBER)
    �Ҽ��� �Ʒ� ����ó���ϴ� �Լ�

    * TRUNC (NUMBER, [��ġ����])(�����ϴ�)
    ��ġ ���� ������ ����ó�� ���ִ� �Լ�
    
    SELECT TRUNC(123.456) FROM DUAL; -- ��ġ���� ���ϸ� FLOOR �̶� ����
*/

--------------------------------< ��¥ ó�� �Լ� >--------------------------------

-- * SYSDATE : �ý��� ��¥ �� �ð� ��ȯ(���� ��¥ �� �ð�)

/*
    * MONTHS_BETWEEN(DATE1, DATE2)      >> ����� : NUMBER Ÿ��
    �� ��¥ ������ ������ 
    >> ���������� DATE1 - DATE2 �� ������ 30|31�� ����
    
    * ADD_MONTHS(DATE, NUMBER)          >> ����� : DATE Ÿ��
    Ư����¥�� NUMBER��ŭ�� ���� ���� ���ؼ� ��¥�� ����

    * NEXT_DAY(DATE, ����(����|����))     >> ����� : DATE Ÿ��
    Ư����¥ ���Ŀ� ����� �ش� ������ ��¥�� ��ȯ���ִ� �Լ�

    1. �Ͽ���, 2. ������, ... 7. �����


    * LAST_DAY(DATE)         >> ����� : DATE Ÿ��
    �ش� ���� ������ ��¥�� ���ؼ� ��ȯ

    * EXTRACT(YEAR|MONTH|DAY FROM DATE)
    Ư�� ��¥�κ��� �⵵|��|�� ���� �����ؼ� ��ȯ�ϴ� �Լ�

*/

---------------------------------< ����ȯ �Լ� >---------------------------------

/*
    * TO_CHAR(����|��¥, [����])   >> ����� : CHARACTER Ÿ��
    ���� Ÿ�� �Ǵ� ��¥ Ÿ���� ���� ����Ÿ������ ��ȯ �����ִ� �Լ�
*/

-- ����Ÿ�� => ����Ÿ��
SELECT TO_CHAR(1234) FROM DUAL; -- '1234' �� �ٲ� ��
SELECT TO_CHAR(1234, '99999') FROM DUAL; -- ' 1234' �� �ٲ� �� => 5ĭ¥�� ���� Ȯ��, ������ ����, ��ĭ ����
SELECT TO_CHAR(1234, '00000') FROM DUAL; -- '01234' �� �ٲ� �� => ��ĭ 0���� ä��
SELECT TO_CHAR(1234, 'L99999') FROM DUAL; -- ���� ������ ���� (LOCAL ����)�� ȭ�����
SELECT TO_CHAR(1234, '$99999') FROM DUAL;
SELECT TO_CHAR(1234, 'L99,999') FROM DUAL;

-- ��¥Ÿ�� => ����Ÿ��
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'PM HH:MI;SS') FROM DUAL; -- HH : 12�ð� ����
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL; -- HH24 : 24�ð� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON, YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY��-MM��-DD��') FROM DUAL; -- �̰� ����
-- �������� �ʴ� ���� ������ ���� "" ����
SELECT TO_CHAR(SYSDATE, 'YYYY"��"-MM"��"-DD"��"') FROM DUAL;

-- �⵵�� ���õ� ����
SELECT 
    TO_CHAR(SYSDATE, 'YYYY'), -- 2023
    TO_CHAR(SYSDATE, 'YY'), -- 23
    TO_CHAR(SYSDATE, 'RRRR'), -- 2023
    TO_CHAR(SYSDATE, 'RR'), -- 23
    TO_CHAR(SYSDATE, 'YEAR') -- TWENTY TWENTY-THREE
FROM DUAL;

-- ���� ���õ� ����
SELECT 
    TO_CHAR(SYSDATE, 'MM'), -- 12
    TO_CHAR(SYSDATE, 'MON'), -- 12��
    TO_CHAR(SYSDATE, 'MONTH'), -- 12��
    TO_CHAR(SYSDATE, 'RM') -- XII 
FROM DUAL;

-- �ϰ� ���õ� ����
SELECT
    TO_CHAR(SYSDATE, 'DDD'), -- ���� �������� ������ ��ĥ°����
    TO_CHAR(SYSDATE, 'DD'), -- �� �������� ������ ��ĥ°����
    TO_CHAR(SYSDATE, 'D') -- �� �������� ������ ��ĥ°����(������̸�, �Ͽ�ȭ���� �̴� 5 ����)
FROM DUAL;

-- ���ϰ� ���õ� ����
SELECT
    TO_CHAR(SYSDATE, 'DAY'), -- �����
    TO_CHAR(SYSDATE, 'DY') -- ��
FROM DUAL;

--------------------------------------------------------------------------------

/*
    * TO_DATE(����|����, [����])          >> ����� : DATE Ÿ��
    ����Ÿ�� �Ǵ� ����Ÿ�� �����͸� ��¥Ÿ������ ��ȯ�����ִ� �Լ� 
*/

SELECT TO_DATE(20100101) FROM DUAL;
SELECT TO_DATE(100101) FROM DUAL;

-- SELECT TO_DATE(070101) FROM DUAL; -- �̰� �տ� 0�� �پ��־ ����
SELECT TO_DATE('070101') FROM DUAL; -- ù���ڰ� 0�� ���� ����Ÿ������ ���� �ʿ� : �տ� �ִ� 0�� �ҽǵ��� �ʵ��� �����ֱ�('')

-- SELECT TO_DATE('041030 143000') FROM DUAL; -- �ð��� 24�ð��������� �ٶ��� �׳� �ָ� �� ��
SELECT TO_DATE('041030 143000', 'YYMMDD HH24MISS') FROM DUAL; -- �̷��� ���� �������� ��

SELECT TO_DATE('140630', 'YYMMDD') FROM DUAL; -- 2014��
SELECT TO_DATE('980630', 'YYMMDD') FROM DUAL; -- 2098�� 
-- YY : ������ ���� ����� �ݿ�

SELECT TO_DATE('140630', 'RRMMDD') FROM DUAL; -- 2014��
SELECT TO_DATE('980630', 'RRMMDD') FROM DUAL; -- 1998��
-- RR : �ش� �� �ڸ� �⵵ ���� 50 �̸��� ���, ���� ���⸦ �ݿ�
--                              �̻��� ���, ���� ���⸦ �ݿ�

--------------------------------------------------------------------------------

/*
    * TO_NUMBER(����, [����])       >> ����� : NUMBER Ÿ��
    ���� Ÿ���� �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
*/

SELECT TO_NUMBER('0123456789') FROM DUAL; -- 0������ ����Ÿ������ ����

SELECT '1000000' + '55000' FROM DUAL;
-- �ڹٿ����� ������� 100000055000 �� ��µǳ�, ����Ŭ������ �ڵ�����ȯ���� ���� 1055000 ���

-- SELECT '1,000,000' + '55,000' FROM DUAL; -- INVALID NUMBER ���� (�ȿ� ���ڸ� �־�� �ڵ� ����ȯ)
SELECT TO_NUMBER('1,000,000', '9,999,999') + TO_NUMBER('55,000', '99,999') FROM DUAL; -- ��������ȯ �� ��

--------------------------------< NULL ó�� �Լ� >-------------------------------

/*
    NVL(�÷�, �ش� �÷����� NULL�� ��� ��ȯ�� ��)
    
    NVL2(�÷�, ��ȯ��1, ��ȯ��2)
    �÷����� ������ ��� ��ȯ��1 ��ȯ
    �÷����� NULL�� ��� ��ȯ��2 ��ȯ

    NULLIF(�񱳴��1, �񱳴��2)
    �� ���� ��ġ�ϸ� NULL ��ȯ
    �� ���� ��ġ���������� �񱳴�� 1 ��ȯ
*/
SELECT NULLIF('123','123') FROM DUAL;
SELECT NULLIF('123','456') FROM DUAL;

----------------------------------< ���� �Լ� >----------------------------------

/*
    * DECODE(���ϰ��� �ϴ� ���(�÷�|�������|�Լ���), �񱳰�1, �����1, �񱳰�2, �����2,...)
    
    �ڹٿ��� SWITCH-CASE ������ ����
*/

-- ���, �����, �ֹι�ȣ
SELECT
    EMP_ID,
    EMP_NAME,
    EMP_NO,
    SUBSTR(EMP_NO,8,1),
    DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��',3,'��',4,'��') AS "����"
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    * CASE WHEN THEN
    
    CASE WHEN ���ǽ�1 THEN �����1
         WHEN ���ǽ�2 THEN �����2
         ...
         ELSE �����
    END
*/

SELECT 
    EMP_NAME, 
    SALARY,
    CASE WHEN SALARY >= 5000000 THEN '��� ������'
         WHEN SALARY >= 3500000 THEN '�߱� ������'
         ELSE '�ʱ� ������'
    END AS "����"
FROM EMPLOYEE;

----------------------------------< �׷� �Լ� >----------------------------------

/*
    1. SUM(����Ÿ���÷�) : �ش� �÷� ������ �� �հ踦 ���ؼ� ��ȯ
    2. AVG(����Ÿ��) : �ش� �÷����� ��հ��� ���ؼ� ��ȯ
    3. MIN(���� Ÿ��) : �ش� �÷����� �߿� ���� ���� �� ���ؼ� ��ȯ
    4. MAX(���� Ÿ��) : �ش� �÷����� �߿� ���� ū �� ���ؼ� ��ȯ
    5. COUNT(*|�÷�|DISTINCT �÷�)
       COUNT(*)              : ��ȸ�� ����� ��� �� ������ ���� ��ȯ
       COUNT(�÷�)           : ������ �ش� �÷����� NULL�� �ƴ� �͸� �� ������ ���� ��ȯ
       COUNT(DISTINCT �÷�)  : �ش� �÷��� �ߺ��� ������ �� �� ������ ���� ��ȯ
*/
