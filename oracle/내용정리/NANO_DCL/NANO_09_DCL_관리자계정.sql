/*
    < DCL : DATA CONTROL LANGUAGE >
    ������ ���� ���
    
    �������� �ý��� ���� �Ǵ� ��ü���� ������ �ο�(GRANT) �ϰų� ȸ��(REVOKE) �ϴ� ����
    
    > �ý��� ���� : DB�� �����ϴ� ����, ��ü���� ������ �� �ִ� ����
    > ��ü���� ���� : Ư�� ��ü���� ������ �� �ִ� ����
    
    
*/

/*
    * �ý��� ���� ����
    - CREATE SESSION : ������ �� �ִ� ����
    - CREATE TABLE : ���̺��� ������ �� �ִ� ����
    - CREATE VIEW : �並 �����ϴ� ����
    - CREATE SEQUENCE : �������� ������ �� �ִ� ����
    .....ETC : �Ϻδ� Ŀ��Ʈ�ȿ� �̹� ����
*/

/*
    * ��ü ���� ���� ����
      Ư�� ��ü�� �����ؼ� ������ �� �ִ� ����
      
      ��������                  Ư����ü
      ---------------------------------------
      SELECT     |      TABLE, VIEW, SEQUENCE
      INSERT     |      TABLE, VIEW
      UPDATE     |      TABLE, VIEW
      DELETE     |      TABLE, VIEW
      ...ETC
      
      [ǥ����]
      GRANT �������� ON Ư����ü TO ����
*/

/*
    1. SAMPLE / SAMPLE ���� ����
    CREATE USER �����̸� IDENTIFIED BY ������й�ȣ;
    
    2. ������ ���� CREATE SESSION ���� �ο�
    GRANT CREATE SESSION TO ����;
    
    3_1. ���̺� ������ �� �ִ� CREATE TABLE ���� �ο�
    GRANT CREATE TABLE TO ����;
    
    3_2. TABLESPACE �Ҵ� (SAMPLE ���� ����)
    ALTER USER ���� QUOTA 2M ON SYSTEM;
    
    4. ��ü ���� ���� �ο�
    GRANT �������� ON Ư����ü TO ����
*/

SELECT *
FROM ROLE_SYS_PRIVS
WHERE ROLE IN ('CONNECT', 'RESOURCE')
ORDER BY 1;
--> ROLE ��ȸ ���
