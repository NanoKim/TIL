/*
    < ���� ���� �� ���� �ο� >
    SELECT * FROM USER_TABLES; : ���� �� ������ ������ �ִ� ���̺� ���� �� �� ����
    SELECT * FROM USER_TAB_COLUMNS; : �� ����ڰ� ������ �ִ� ���̺� ���� ��� �÷� �� �� ����
    SELECT * FROM DBA_USERS; : ��� ���� ��ȸ
    CREATE USER kh IDENTIFIED BY kh; 
    GRANT CONNECT, RESOURCE TO kh;
    
    < �ý��� ���� - ���� ��� ���� >
    SELECT * FROM NLS_SESSION_PARAMETERS; : �ڵ����� ����� ���̺�, ���⼭ PARAMETER LANGUAGE �� VALUE �� ����� ����
    ALTER(�����ϴ�) SESSION<���̺��̸�> SET NLS_LANGUAGE = AMERICAN; -- KOREAN(������ KOREAN �̶�� ���� �˷��ֵ��� ��� �޸� ����� ����)
    ALTER(�����ϴ�) SESSION<���̺��̸�> SET NLS_LANGUAGE = KOREAN;

    < ���ڿ� ó�� >
    LENGTH(�÷�|'���ڿ���') : ���ڿ� ���� ��ȯ
    LENGTHB(�÷�|'���ڿ���') : ����Ʈ ���� ��ȯ
    INSTR(�÷�|'���ڿ�', 'ã���� �ϴ� ����', ['ã�� ��ġ�� ���۰�', [����]]) : ã������ ���� ��ġ ��ȯ
    SUBSTR(STRING, POSITION, [LENGTH]) : ���ڿ� �ڸ���
    LPAD(STRING, ���������� ��ȯ�� ������ ����, [�����̰��� �ϴ� ����]) : ������ ���� �� ��ĭ ä��
    RPAD(STRING, ���������� ��ȯ�� ������ ����, [�����̰��� �ϴ� ����]) : ���� ���� �� ��ĭ ä��
    LTRIM (STRING, ['������ ���ڵ�']) : Ư������ ���ʺ��� ���� (����=��������)
    RTRIM (STRING, ['������ ���ڵ�']) : Ư������ �����ʺ��� ���� (����=��������)
    TRIM([[LEADING]TRAILING]BOTH] Ư�� �����ϰ��� �ϴ� ���ڵ� FROM]STRING) : Ư������ ��/��/���� Ư������ ����
    LOWER (STRING) : �ҹ��ڷ� ����
    UPPER (STRING) : �빮�ڷ� ����
    INITCAP (STRING) : �ܾ� �� ���ڸ��� �빮�ڷ� ����
    CONCAT(STRING, STRING) : STRING 2�� ��ġ��
    CONNECT || : STRING ��ġ��
    REPLACE(STRING, STR1, STR2) : STRING �� Ư�� STR�� �ٸ� STR�� ����

    < ���� ó�� >
    ABS(NUMBER) : ���밪
    MOD(NUMBER, NUMBER)  : ������
    ROUND(NUMBER, [��ġ1]) : �ݿø�
    CEIL(NUMBER) : �ø�
    FLOOR(NUMBER) : ����
    TRUNC(NUMBER, [��ġ����]) : ��ġ�����ؼ� ����

    < ��¥ ó�� >
    SYSDATE : �ý����� ���� ��¥ �� �ð�
    MONTHS_BETWEEN(DATE1, DATE2) : DATE ������ ���� ��
    ADD_MONTHS(DATE, NUMBER) : DATE �� NUMBER ���� ���ϱ�
    NEXT_DAY(DATE, ����(����|����)) : DATE ������ ����� ���� ��¥ ��ȯ
    LAST_DAY(DATE) : �ش� ���� ������ ��¥ ��ȯ
    EXTRACT(YEAR|MONTH|DAY FROM DATE) : Ư�� ��¥�κ��� �⵵|��|�� �� ����
    
    < ����ȯ >
    TO_CHAR(����|��¥, [����]) : ����|��¥ Ÿ�� ���� ����Ÿ������ ��ȯ
        ���� > ���� ��ȯ
            TO_CHAR(NUMBER) : ����Ÿ������ ��ȯ
            TO_CHAR(NUMBER, '99999') : 5ĭ¥�� ����Ÿ������ ��ȯ, ������ ����, ��ĭ ����
            TO_CHAR(NUMBER, '00000') : 5ĭ¥�� ����Ÿ������ ��ȯ, ������ ����, ��ĭ 0���� ä���
            TO_CHAR(NUMBER, 'L99999') : ������ ȭ����� ����Ÿ������ ��ȯ
            TO_CHAR(NUMBER, '$99999') : �޷� ���� ����Ÿ������ ��ȯ
            TO_CHAR(NUMBER, 'L99,999') : ������ �����Ͽ� ����Ÿ������ ��ȯ
        ��¥ > ���� ��ȯ
            SYSDATE : ���� ��¥
            TO_CHAR(DATE) FROM DUAL; : ����Ÿ������ ��ȯ
            TO_CHAR(DATE, 'PM HH:MI;SS') -- HH : 12�ð� ����
            TO_CHAR(DATE, 'HH24:MI:SS') -- HH24 : 24�ð� ����
            TO_CHAR(DATE, 'YYYY-MM-DD DAY') : ���ϱ��� ��� VER1
            TO_CHAR(DATE, 'YYYY-MM-DD DDY') : ���ϱ��� ��� VER2
            TO_CHAR(DATE, 'MON, YYYY')
            TO_CHAR(DATE, 'YYYY-MM-DD')
            
            TO_CHAR(SYSDATE, 'YYYY��-MM��-DD��') -- �̰� ����
            -- �������� �ʴ� ���� ������ ���� "" ����
            TO_CHAR(SYSDATE, 'YYYY"��"-MM"��"-DD"��"')
    TO_DATE(����|����, [����]) : ����|���� Ÿ�� ���� ��¥Ÿ������ ��ȯ
        TO_DATE(YYYYMMDD)
        TO_DATE(YYMMDD)
        TO_DATE('070101') : 0���� ������ ��� ����Ÿ������ ����
        TO_DATE('041030 143000', 'YYMMDD HH24MISS') : 24�ð�����
        
        YY : ������ ���� ����� �ݿ�
        RR : �ش� �� �ڸ� �⵵ ���� 50 �̸��� ���, ���� ���⸦ �ݿ�
                                     �̻��� ���, ���� ���⸦ �ݿ�
        
        �⵵ ����
            TO_CHAR(SYSDATE, 'YYYY'), -- 2023
            TO_CHAR(SYSDATE, 'YY'), -- 23
            TO_CHAR(SYSDATE, 'RRRR'), -- 2023
            TO_CHAR(SYSDATE, 'RR'), -- 23
            TO_CHAR(SYSDATE, 'YEAR') -- TWENTY TWENTY-THREE
        �� ����
            TO_CHAR(SYSDATE, 'MM'), -- 12
            TO_CHAR(SYSDATE, 'MON'), -- 12��
            TO_CHAR(SYSDATE, 'MONTH'), -- 12��
            TO_CHAR(SYSDATE, 'RM') -- XII 
        �� ����
            TO_CHAR(SYSDATE, 'DDD'), -- ���� �������� ������ ��ĥ°����
            TO_CHAR(SYSDATE, 'DD'), -- �� �������� ������ ��ĥ°����
            TO_CHAR(SYSDATE, 'D') -- �� �������� ������ ��ĥ°����(������̸�, �Ͽ�ȭ���� �̴� 5 ����)
        ���� ����
            TO_CHAR(SYSDATE, 'DAY'), -- �����
            TO_CHAR(SYSDATE, 'DY') -- ��
    TO_NUMBER(����, [����]) : ���� Ÿ�� ���� ����Ÿ������ ��ȯ
        TO_NUMBER('0123456789') : 0������ ����Ÿ������ ����
        '1000000' + '55000' : �ڵ�����ȯ���� ���� 1055000 ���
        TO_NUMBER('1,000,000', '9,999,999') + TO_NUMBER('55,000', '99,999') : (�ȿ� ���ڿ��� ���� ���� ��� ���� ����ȯ)

    < NULL ó�� >
    NVL(�÷�, �ش� �÷����� NULL�� ��� ��ȯ�� ��)
    NVL2(�÷�, ��ȯ��1, ��ȯ��2) : �÷����� ������ ��� ��ȯ��1 ��ȯ
                                 �÷����� NULL�� ��� ��ȯ��2 ��ȯ
    NULLIF(�񱳴��1, �񱳴��2) : �� ���� ��ġ�ϸ� NULL ��ȯ
                                 �� ���� ��ġ���������� �񱳴�� 1 ��ȯ
                                 
    < ���� �Լ� >                             
    DECODE(���ϰ��� �ϴ� ���(�÷�|�������|�Լ���), �񱳰�1, �����1, �񱳰�2, �����2,...)
    CASE WHEN ���ǽ�1 THEN �����1
         WHEN ���ǽ�2 THEN �����2
         ...
         ELSE �����
    END
    
    < �׷� �Լ� >
    SUM(����Ÿ��) : �ش� �÷� ������ �� �հ踦 ���ؼ� ��ȯ
    AVG(����Ÿ��) : �ش� �÷����� ��հ��� ���ؼ� ��ȯ
    MIN(���� Ÿ��) : �ش� �÷����� �߿� ���� ���� �� ���ؼ� ��ȯ
    MAX(���� Ÿ��) : �ش� �÷����� �߿� ���� ū �� ���ؼ� ��ȯ
    COUNT(*|�÷�|DISTINCT �÷�)
       COUNT(*)              : ��ȸ�� ����� ��� �� ������ ���� ��ȯ
       COUNT(�÷�)           : ������ �ش� �÷����� NULL�� �ƴ� �͸� �� ������ ���� ��ȯ
       COUNT(DISTINCT �÷�)  : �ش� �÷��� �ߺ��� ������ �� �� ������ ���� ��ȯ
    
    < �����Լ� >
    GROUP BY ���� ���
    ROLL UP() : ������ ������ ��ü �� �ձ��� ��ȸ
    CUBE() : �׷��� �߰� ���踦 ���
    
    < ���� ������ - SET OPERATION >
    UNION            : OR  | �������� ���� (�� �������� ������ ������� ���� �� �ߺ��Ǵ� ���� �� ���� ����������)
    INTERSECT        : AND | �������� ���� (�� ������ ������ ������� �ߺ��� �����)
    UNION ALL        : ������ + �������� ���� (�ߺ��Ǵ� �κ��� �� �� ǥ���� �� ����)
    MINUS            : �������� ���� (���� ��������� ���� ������� �� ������)
*/
