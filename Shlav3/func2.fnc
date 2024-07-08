CREATE OR REPLACE FUNCTION get_last_year_donations(person_id IN NUMBER) RETURN NUMBER IS
    last_year_donations NUMBER;
BEGIN
    SELECT NVL(SUM(donation_amount), 0)
    INTO last_year_donations
    FROM donation
    WHERE person_id = person_id
    AND date_of_donation >= ADD_MONTHS(SYSDATE, -12);
    
    RETURN last_year_donations;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RAISE;
END get_last_year_donations;
/
