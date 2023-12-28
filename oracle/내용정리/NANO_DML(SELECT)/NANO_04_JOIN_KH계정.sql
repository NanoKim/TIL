/*
    < JOIN >
    2 �� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ���Ǵ� ����
    ��ȸ ����� �ϳ��� �����(RESULT SET)�� ����
    
    ������ �����ͺ��̽��� �ּ����� �����ͷ� ������ ���̺� �����͸� ��� ����
    
    -- � ����� � �μ��� �����ִ��� �ñ���..
    -- �� ��, �ڵ�(D9, D5,...) ���� �μ������� ��ȸ�ϰ� ����
    
    >> ������ �����ͺ��̽����� SQL���� �̿��� ���̺��� "����"�� �δ� ���
    (������ �� ��ȸ�� �ؿ��� �� �ƴ϶�, �� ���̺� ������ν��� �����͸� ��Ī�ؼ� ��ȸ�ؾ� ��)
    
    JOIN �� ũ�� "����Ŭ ���뱸��" �� "ANSI ����" �� ����
    *ANSI -- �̱�����ǥ����ȸ --> �ƽ�Ű�ڵ�ǥ ����� ���� ANSI��
*/

/*
    1. �����(EQUAL JOIN) / ��������(INTER JOIN)
       �����Ű�� �÷��� ���� ��ġ�ϴ� ��鸸 ���εż� ��ȸ (= ��ġ�ϴ� ���� ���� ���� ��ȸ���� ����)
       
       ����Ŭ ���� ����
       - FROM ���� ��ȸ�ϰ��� �ϴ� ���̺��� ����
       - WHERE ���� ��Ī��ų �÷�(�����)�� ���� ������ ����
       * ������ �� �÷����� ���� ���, ���̺���̳� ��Ī���� ���� �ʿ�
       
       ANSI ����
       - FROM ���� ������ �Ǵ� ���̺��� �ϳ��� ��� �� ��
       - JOIN ���� ���� ��ȸ�ϰ��� �ϴ� ���̺� ��� + ��Ī��ų �÷��� ���� ���ǵ� ���� ���
       - JOIN USING, JOIN ON
       * ������ �� �÷����� �ٸ� ���, JOIN ON �� ����
       * ������ �� �÷Ÿ��� ���� ���, JOIN ON �� JOIN USING ��� ����
*/

-----------------------------------[�������]------------------------------------

/*
    2. �ڿ����� (NATURAL JOIN
    �� ���̺��� ������ �÷��� �� �Ѱ��� ������ ��� 
    
        ANSI ����
*/
SELECT
    EMP_ID AS "���",
    EMP_NAME AS "�̸�",
    JOB_CODE AS "���� �ڵ�",
    JOB_NAME AS "����"
FROM EMPLOYEE
NATURAL JOIN JOB;

--------------------------------------------------------------------------------

/*
    3. �������� / �ܺ����� (OUTER JOIN)
    �� ���̺��� JOIN �� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ ����
    ��, �ݵ�� LEFT, RIGHT ���� �ʿ�
*/

SELECT
    EMP_NAME AS "�����",
    DEPT_TITLE AS "�μ���",
    SALARY AS "�޿�",
    SALARY * 12 AS "����"
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- �μ���ġ�� �� �� ��� 2�� ������ ���� ��ȸ���� �ʾ� 21�� ��ȸ

/*
    3-1) LEFT [OUTER] JOIN
    �� ���̺� �� ���� ����� ���̺� �������� JOIN
*/

--  3-1) ANSI ����
SELECT
    EMP_NAME AS "�����",
    DEPT_TITLE AS "�μ���",
    SALARY AS "�޿�",
    SALARY * 12 AS "����"
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--  3-1) ����Ŭ ���� ����
SELECT
    EMP_NAME AS "�����",
    DEPT_TITLE AS "�μ���",
    SALARY AS "�޿�",
    SALARY * 12 AS "����"
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);
-- ���� ���̺�(FROM ��) �� �ݴ�Ǵ� �÷�(WHERE ��) �ڿ� (+)

/*
    3-2) RIGHT [OUTER] JOIN
    �� ���̺� �� ������ ����� ���̺��� �������� JOIN
*/

--  3-2) ANSI ����
SELECT
    EMP_NAME AS "�����",
    DEPT_TITLE AS "�μ���",
    SALARY AS "�޿�",
    SALARY * 12 AS "����"
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--  3-2) ����Ŭ ���� ����
SELECT
    EMP_NAME AS "�����",
    DEPT_TITLE AS "�μ���",
    SALARY AS "�޿�",
    SALARY * 12 AS "����"
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID;

-- 3) FULL [OUTER] JOIN : �� ���̺��� ���� ��� ���� ��ȸ (��, ����Ŭ ���뱸�����δ� �� ��)
SELECT
    EMP_NAME AS "�����",
    DEPT_TITLE AS "�μ���",
    SALARY AS "�޿�",
    SALARY * 12 AS "����"
FROM EMPLOYEE
FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

/*
    4. ��ü���� (SELF JOIN)
    ���� ���̺��� �ٽ� �� �� ����
*/

--  4-1) ����Ŭ ���� ����
SELECT
    E.EMP_ID AS "����� ���",
    E.EMP_NAME AS "����� �̸�",
    E.DEPT_CODE AS "����� �μ��ڵ�",
    M.EMP_ID AS "����� ���",
    M.EMP_NAME AS "����� �̸�",
    M.DEPT_CODE AS "����� �μ��ڵ�"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;

--  4-2) ANSI ����
SELECT
    E.EMP_ID AS "����� ���",
    E.EMP_NAME AS "����� �̸�",
    E.DEPT_CODE AS "����� �μ��ڵ�",
    M.EMP_ID AS "����� ���",
    M.EMP_NAME AS "����� �̸�",
    M.DEPT_CODE AS "����� �μ��ڵ�"
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);

--------------------------------------------------------------------------------

/*
    < ���� JOIN >
    2�� �̻��� ���̺��� JOIN 
*/
