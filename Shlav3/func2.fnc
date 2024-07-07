CREATE OR REPLACE FUNCTION calc_avg_donation(donor_id IN NUMBER) RETURN NUMBER IS
    avg_donation NUMBER;
BEGIN
    BEGIN
        SELECT AVG(donation_amount)
        INTO avg_donation
        FROM donation
        WHERE donor_id = donor_id;
        
        RETURN avg_donation;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            RAISE;
    END;
END calc_avg_donation;
/
