-- disable onstraints
DECLARE
    sql_stmt VARCHAR2(4000);
BEGIN
    FOR t IN (SELECT table_name FROM all_tables WHERE owner = 'CHELI') LOOP
        FOR r IN (
            SELECT constraint_name, constraint_type
            FROM all_constraints
            WHERE table_name = t.table_name AND owner = 'CHELI'
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
-- בדיקה שהאילוצים אכן לא פועלים
SELECT table_name, constraint_name, status
FROM all_constraints
WHERE owner = 'CHELI' AND status = 'DISABLED';


-- enable constraints
DECLARE
    sql_stmt VARCHAR2(4000);
BEGIN
    FOR t IN (SELECT table_name FROM all_tables WHERE owner = 'CHELI') LOOP
        FOR r IN (
            SELECT constraint_name
            FROM all_constraints
            WHERE table_name = t.table_name AND owner = 'CHELI' AND status = 'DISABLED'
        ) LOOP
            sql_stmt := 'ALTER TABLE CHELI.' || t.table_name || ' ENABLE CONSTRAINT ' || r.constraint_name;
            DBMS_OUTPUT.PUT_LINE(sql_stmt); -- הדפסת הפקודה לבדיקה
            EXECUTE IMMEDIATE sql_stmt;
        END LOOP;
    END LOOP;
END;
/
