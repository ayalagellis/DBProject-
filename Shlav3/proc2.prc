CREATE OR REPLACE PROCEDURE analyze_donations (out_donors OUT SYS_REFCURSOR) IS
    CURSOR donor_cursor IS
        SELECT p.person_id, p.fname, p.lname
        FROM person p;
    
    donor_id person.person_id%TYPE;
    fname person.fname%TYPE;
    lname person.lname%TYPE;
    last_year_donations NUMBER;
    previous_years_avg NUMBER;
    change_in_donations NUMBER;
    comments VARCHAR2(100);
    classification VARCHAR2(10);

    TYPE donor_record_type IS RECORD (
        donor_id person.person_id%TYPE,
        fname person.fname%TYPE,
        lname person.lname%TYPE,
        last_year_donations NUMBER,
        change_in_donations NUMBER,
        comments VARCHAR2(100),
        classification VARCHAR2(10)
    );
    donor_record donor_record_type;
    
BEGIN
    OPEN donor_cursor;
    LOOP
        FETCH donor_cursor INTO donor_id, fname, lname;
        EXIT WHEN donor_cursor%NOTFOUND;
        
        -- קבלת סכום התרומות של השנה האחרונה
        last_year_donations := get_last_year_donations(donor_id);
        
        -- קבלת ממוצע התרומות של השנים הקודמות
        BEGIN
            SELECT NVL(AVG(donation_amount), 0)
            INTO previous_years_avg
            FROM donation
            WHERE person_id = donor_id
            AND date_of_donation < ADD_MONTHS(SYSDATE, -12);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                previous_years_avg := 0;
            WHEN OTHERS THEN
                RAISE;
        END;
        
        -- חישוב השינוי בתרומות
        change_in_donations := last_year_donations - previous_years_avg;
        
        -- קביעת ההערות
        IF ABS(change_in_donations) > 1000 THEN
            comments := 'Need to update';
        ELSE
            comments := 'No update needed';
        END IF;
        
        -- סיווג התורם
        IF last_year_donations >= 5000 THEN
            classification := 'VIP';
        ELSE
            classification := 'Regular';
        END IF;

        -- עדכון הערות וסיווג בתורמים
        UPDATE external_donor
        SET donorDescription = comments
        WHERE person_id = donor_id;

        -- הכנת רשומה להצגה
        donor_record.donor_id := donor_id;
        donor_record.fname := fname;
        donor_record.lname := lname;
        donor_record.last_year_donations := last_year_donations;
        donor_record.change_in_donations := change_in_donations;
        donor_record.comments := comments;
        donor_record.classification := classification;
        
        -- הצגת התוצאות
        DBMS_OUTPUT.PUT_LINE('Donor ID: ' || donor_record.donor_id || ', Last Year Donations: ' || donor_record.last_year_donations || ', Change: ' || donor_record.change_in_donations || ', Comments: ' || donor_record.comments || ', Classification: ' || donor_record.classification);
    END LOOP;
    CLOSE donor_cursor;

    -- פתיחת Ref Cursor להחזרת התוצאות
    OPEN out_donors FOR
        SELECT p.person_id, p.fname, p.lname, e.donorDescription, e.gender, c.monthly_donation
        FROM person p
        JOIN donation d ON p.person_id = d.person_id
        JOIN community c ON d.community_id = c.community_id
        JOIN external_donor e ON p.person_id = e.person_id;
END analyze_donations;
/
