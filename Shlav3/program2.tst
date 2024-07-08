PL/SQL Developer Test script 3.0
24
DECLARE
    out_donors SYS_REFCURSOR;
    donor_id person.person_id%TYPE;
    fname person.fname%TYPE;
    lname person.lname%TYPE;
    donorDescription external_donor.donorDescription%TYPE;
    gender external_donor.gender%TYPE;
    monthly_donation community.monthly_donation%TYPE;
BEGIN
    -- הגדלת גודל הבופר של DBMS_OUTPUT
    DBMS_OUTPUT.ENABLE(1000000);

    -- קריאה לפרוצדורה לניתוח הנתונים
    analyze_donations(out_donors);
    
    -- קריאה לתוצאות מתוך ה-Ref Cursor
    LOOP
        FETCH out_donors INTO donor_id, fname, lname, donorDescription, gender, monthly_donation;
        EXIT WHEN out_donors%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Donor ID: ' || donor_id || ', Name: ' || fname || ' ' || lname || ', Description: ' || donorDescription || ', Gender: ' || gender || ', Monthly Donation: ' || monthly_donation);
    END LOOP;
    CLOSE out_donors;
END;
0
0
