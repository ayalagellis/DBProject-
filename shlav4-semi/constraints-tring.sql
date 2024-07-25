SELECT owner, table_name, constraint_name, constraint_type, status
FROM all_constraints
WHERE owner = 'CHELI'
AND table_name = 'COMMUNITY';

BEGIN
   FOR r IN (
       SELECT constraint_name
       FROM all_constraints
       WHERE owner = 'CHELI' AND table_name = 'COMMUNITY'
   ) LOOP
       EXECUTE IMMEDIATE 'ALTER TABLE CHELI.COMMUNITY DISABLE CONSTRAINT ' || r.constraint_name;
   END LOOP;
END;
/


DECLARE
    sql_stmt VARCHAR2(4000);
BEGIN
    FOR t IN (SELECT table_name FROM all_tables WHERE owner = 'CHELI') LOOP
        FOR r IN (
            SELECT constraint_name, constraint_type
            FROM all_constraints
            WHERE table_name = 'COMMUNITY' AND owner = 'CHELI'
           -- WHERE table_name = t.table_name AND owner = 'CHELI'
        ) LOOP
            IF r.constraint_type = 'R' THEN
                sql_stmt := 'ALTER TABLE CHELI.' || t.table_name || ' DROP CONSTRAINT ' || r.constraint_name;
            ELSE
                sql_stmt := 'ALTER TABLE CHELI.' || t.table_name || ' DISABLE CONSTRAINT ' || r.constraint_name;
            END IF;
            DBMS_OUTPUT.PUT_LINE(sql_stmt); -- הדפסת הפקודה לבדיקה
            EXECUTE IMMEDIATE sql_stmt;
        END LOOP;
    END LOOP;
END;
/
