PL/SQL Developer Test script 3.0
11
BEGIN
    DECLARE
        avg_donation NUMBER;
    BEGIN
        avg_donation := calc_avg_donation(123); -- example donor_id
        DBMS_OUTPUT.PUT_LINE('Average donation: ' || avg_donation);
        
        update_donor_status(123); -- example donor_id
    END;
END;

0
0
