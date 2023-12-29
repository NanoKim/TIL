/*
    DDL (DATA DEFINITION LANGUAGE) : ������ ���� ���
    
    ��ü���� ����(CREATE), ����(ALTER), ����(DROP) �ϴ� ����
    
    < ALTER >
    ��ü�� �����ϴ� ����
    
    [ǥ����]
    ALTER TABLE ���̺�� �����ҳ���;
    
    * �����ҳ���
    1) �÷� �߰�/����/���� 
    1_1) �÷� �߰�(ADD)
         ALTER TABLE ���̺�� ADD �÷��� �ڷ��� [DEFAULT] ��������
    1_2) �÷� ����(MODIFY)
         ALTER TABLE ���̺�� MODIFY �÷��� �ٲٰ����ϴ� �ڷ���
         >> ���� ���� ����
    1_3) �÷� ����(DROP COLUMN)
         ALTER TABLE ���̺�� DROP COLUMN �����ϰ��� �ϴ� �÷���
         >> ���� ���� �Ұ���
    
    2) �������� �߰�/���� --> ������ �Ұ� (�����ϰ��� �Ѵٸ� ���� �� ������ �߰�)
    2_1) �������� �߰�(ADD)
         PRIMARY KEY : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] PRIMARY KEY(�÷���)
         FOREIGN KEY : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] FOREIGN KEY(�÷���) REFERENCES ������ ���̺��[(�������÷���)]
         UNIQUE      : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] UNIQUE(�÷���)
         CHECK       : ALTER TABLE ���̺�� ADD [CONSTRAINT �������Ǹ�] CHECK(�÷��� ���� ����)
         NOT NULL    : ALTER TABLE ���̺�� MODIFY �÷��� [CONSTRAINT �������Ǹ�] NOT NULL | NULL
    2_2) �������� ����(DROP)
         NOT NULL �� : ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�
         NOT NULL : ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL | NULL
         
    3) �÷���/�������Ǹ�/���̺�� ����
    3_1) �÷��� ����
         ALTER TABLE ���̺�� RENAME COLUMN ���� �÷��� TO ������ �÷���
    3_2) �������Ǹ� ����
         ALTER TABLE ���̺�� RENAME CONSTRAINT �������Ǹ� TO ������ �������Ǹ�
    3_3) ���̺�� ����
         ALTER TABLE ���̺�� RENAME [�������̺��] TO �ٲ����̺��
*/

/*
    < DROP >
    ���̺� ����
    
    [ǥ����]
    DROP TABLE ���̺��;
    
    ��, ��򰡿��� �����ǰ� �ִ� �θ����̺��� �Ժη� ���� �� ��

    > ���1. �ڽ����̺� ���� ���� �� �θ����̺� ����
    
    > ���2. �θ����̺� �����ϴµ� �������Ǳ��� ���� ����
      DROP TABLE ���̺�� CASCADE CONSTRAINT;
*/
