
DECLARE
    sql_stmt VARCHAR2(4000);
    table_name VARCHAR2(30);
BEGIN
    FOR t IN (
        SELECT table_name
        FROM user_tables
        WHERE table_name IN ('COMMUNITY', 'COMMUNITY_MEMBER', 'SERVICEGIVER', 'CONSULTING',
                             'BABYSITTING', 'CLEANING', 'TOLEDETSERVICEGIVER', 'TIMES')
    ) LOOP
        table_name := t.table_name;
        FOR r IN (
            SELECT constraint_name, constraint_type
            FROM user_constraints
            WHERE table_name = table_name
        ) LOOP
            IF r.constraint_type = 'R' THEN
                sql_stmt := 'ALTER TABLE ' || table_name || ' DROP CONSTRAINT ' || r.constraint_name;
            ELSE
                sql_stmt := 'ALTER TABLE ' || table_name || ' DISABLE CONSTRAINT ' || r.constraint_name;
            END IF;
            DBMS_OUTPUT.PUT_LINE(sql_stmt); -- ����� ������ ������
            EXECUTE IMMEDIATE sql_stmt;
        END LOOP;
    END LOOP;
END;
/


-- ��� 2: ����� ������� ������ ����� COMMUNITY
ALTER TABLE COMMUNITY ADD (
    c_name VARCHAR2(20),
    c_location VARCHAR2(20)
);

-- ��� 2: ����� ������� ������ ����� COMMUNITY_MEMBER
ALTER TABLE COMMUNITY_MEMBER ADD (
    join_date DATE,
    mail VARCHAR2(50)
);
ALTER TABLE COMMUNITY_MEMBER MODIFY (address VARCHAR2(100));

-- ��� 2: ���� ����� ����� TIMES
ALTER TABLE TIMES DROP COLUMN t_constraints;

-- ��� 2: ���� ����� ����� YOLEDETSERVICEGIVER
alter table YOLEDETSERVICEGIVER rename column ym_id to member_id;

-- ����� ����� ����� ����� COMMUNITY �� �-ID �� ����
INSERT INTO COMMUNITY (community_id, name, location, community_type, monthly_donation, phone_number)
SELECT c_id, c_name, c_location, NULL, NULL, NULL
FROM COMMUNITY2
WHERE c_id NOT IN (SELECT community_id FROM COMMUNITY);

-- ����� ����� ����� ����� COMMUNITY �� �-ID ����
MERGE INTO COMMUNITY c
USING COMMUNITY2 c2
ON (c.community_id = c2.c_id)
WHEN MATCHED THEN
  UPDATE SET
    c.name = NVL(c.name, c2.c_name),
    c.location = NVL(c.location, c2.c_location);


-- ����� ����� ����� ����� COMMUNITY_MEMBER �� �-ID �� ����
INSERT INTO COMMUNITY_MEMBER (member_id, address, date_of_birth, community_id, person_id, join_date, mail)
SELECT m_id, m_address, NULL, NULL, NULL, m_dateofjoining, m_mail
FROM CMEMBER
WHERE m_id NOT IN (SELECT member_id FROM COMMUNITY_MEMBER);

-- ����� ����� ����� ����� COMMUNITY_MEMBER �� �-ID ����
MERGE INTO COMMUNITY_MEMBER cm
USING CMEMBER m
ON (cm.member_id = m.m_id)
WHEN MATCHED THEN
  UPDATE SET
    cm.address = NVL(cm.address, m.m_address),
    cm.join_date = NVL(cm.join_date, m.m_dateofjoining),
    cm.mail = NVL(cm.mail, m.m_mail);


-- ���� ����� ��� �����
ALTER TABLE YOLEDETSERVICEGIVER DROP CONSTRAINT YOLEDETSERVICEGIVER_MEMBER_ID_FK;

-- ����� ����� ��� ����
ALTER TABLE YOLEDETSERVICEGIVER ADD CONSTRAINT YOLEDETSERVICEGIVER_COMMUNITY_MEMBER_FK
FOREIGN KEY (member_id) REFERENCES COMMUNITY_MEMBER (member_id);

-- ����� ����� YOLEDET
DROP TABLE YOLEDET CASCADE CONSTRAINTS;

-- ����� ����� COMMUNITY2MEMBER
DROP TABLE COMMUNITY2MEMBER CASCADE CONSTRAINTS;

-- ����� ����� COMMUNITY2
DROP TABLE COMMUNITY2 CASCADE CONSTRAINTS;


-- ���� ����� ��� ����� ����� �-CMEMBER
ALTER TABLE SERVICEGIVER DROP CONSTRAINT SERVICEGIVER_SGM_ID_FK;
-- ����� ����� ��� ���� ����� �-COMMUNITY_MEMBER
ALTER TABLE SERVICEGIVER ADD CONSTRAINT SERVICEGIVER_COMMUNITY_MEMBER_FK
FOREIGN KEY (sgm_id) REFERENCES COMMUNITY_MEMBER (member_id);

-- ���� ������� ����� ������� ������� �������
ALTER TABLE BABYSITTING DROP CONSTRAINT BABYSITTING_SGM_ID_FK;
ALTER TABLE CLEANING DROP CONSTRAINT CLEANING_SGM_ID_FK;
ALTER TABLE CONSULTING DROP CONSTRAINT CONSULTING_SGM_ID_FK;
ALTER TABLE TIMES DROP CONSTRAINT TIMES_SGM_ID_FK;
ALTER TABLE YOLEDETSERVICEGIVER DROP CONSTRAINT YOLEDETSERVICEGIVER_SGM_ID_FK;

-- ����� ������� ����� ������ ������� �������
ALTER TABLE BABYSITTING ADD CONSTRAINT BABYSITTING_SERVICEGIVER_FK
FOREIGN KEY (sgm_id) REFERENCES SERVICEGIVER (sgm_id);

ALTER TABLE CLEANING ADD CONSTRAINT CLEANING_SERVICEGIVER_FK
FOREIGN KEY (sgm_id) REFERENCES SERVICEGIVER (sgm_id);

ALTER TABLE CONSULTING ADD CONSTRAINT CONSULTING_SERVICEGIVER_FK
FOREIGN KEY (sgm_id) REFERENCES SERVICEGIVER (sgm_id);

ALTER TABLE TIMES ADD CONSTRAINT TIMES_SERVICEGIVER_FK
FOREIGN KEY (sgm_id) REFERENCES SERVICEGIVER (sgm_id);

ALTER TABLE YOLEDETSERVICEGIVER ADD CONSTRAINT YOLEDETSERVICEGIVER_SERVICEGIVER_FK
FOREIGN KEY (sgm_id) REFERENCES SERVICEGIVER (sgm_id);





-- ��� 3: ����� ������ ������� ����� COMMUNITY
UPDATE COMMUNITY c
SET 
    c.c_name = (SELECT c_name FROM COMMUNITY2 WHERE c.community_id = c_id),
    c.location = (SELECT c_location FROM COMMUNITY2 WHERE c.community_id = c_id)
WHERE EXISTS (SELECT 1 FROM COMMUNITY2 WHERE c.community_id = c_id);

-- ��� 3: ����� ������ ������� ����� COMMUNITY_MEMBER
UPDATE COMMUNITY_MEMBER cb
SET 
    cb.join_date = (SELECT m_dateofjoining FROM CMEMBER WHERE cb.member_id = m_id),
    c.mail = (SELECT m_mail FROM CMEMBER WHERE cb.member_id = m_id)
WHERE EXISTS (SELECT 1 FROM CMEMBER WHERE c.member_id = m_id);


-- ��� 4: ����� ������ ������ ������ COMMUNITY2 ����� COMMUNITY
INSERT INTO COMMUNITY (community_id, monthly_donation, community_type, phone_number, name, location)
SELECT c_id, 
       0,  -- ��� ����� ���� ���� monthly_donation, �� ����� ����� �����
       'unknown',  -- ��� ����� ���� ���� community_type, �� ����� ����� �����
       '0000000000',  -- ��� ����� ���� ���� phone_number, �� ����� ����� �����
       c_name, 
       c_location 
FROM COMMUNITY2
WHERE c_id NOT IN (SELECT community_id FROM COMMUNITY);

-- ��� 5: ����� ���� ����� ������� ������ DATAGENERATOR
UPDATE COMMUNITY c
SET 
    c.monthly_donation = (SELECT d.monthly_donation FROM DATAGENERATOR d WHERE c.community_id = d.community_id),
    c.community_type = (SELECT d.community_type FROM DATAGENERATOR d WHERE c.community_id = d.community_id),
    c.phone_number = (SELECT d.phone_number FROM DATAGENERATOR d WHERE c.community_id = d.community_id),
    c.name = (SELECT d.name FROM DATAGENERATOR d WHERE c.community_id = d.community_id),
    c.location = (SELECT d.location FROM DATAGENERATOR d WHERE c.community_id = d.community_id)
WHERE c.monthly_donation IS NULL 
   OR c.community_type IS NULL 
   OR c.phone_number IS NULL 
   OR c.name IS NULL 
   OR c.location IS NULL;

-- ��� 6: ����� ����� COMMUNITY2
DROP TABLE COMMUNITY2;

-- ��� 7: ����� ������� �� ����� COMMUNITY
DECLARE
    sql_stmt VARCHAR2(4000);
BEGIN
    FOR r IN (
        SELECT constraint_name, constraint_type
        FROM user_constraints
        WHERE table_name = 'COMMUNITY' AND status = 'DISABLED'
    ) LOOP
        sql_stmt := 'ALTER TABLE COMMUNITY ENABLE CONSTRAINT ' || r.constraint_name;
        DBMS_OUTPUT.PUT_LINE(sql_stmt); -- ����� ������ ������
        EXECUTE IMMEDIATE sql_stmt;
    END LOOP;
END;
/



commit;
--savepoint inside;

ROLLBACK TO inside;


