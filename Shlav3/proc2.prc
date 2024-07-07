CREATE OR REPLACE PROCEDURE update_donor_status(donor_id IN NUMBER) IS
    total_donation NUMBER;
    v_new_status external_donor.donorDescription%TYPE;
    v_donor_name person.fname%TYPE;  -- Assuming donor's first name is stored in person.fname
BEGIN
    BEGIN
        SELECT SUM(donation_amount)
        INTO total_donation
        FROM donation
        WHERE person_id = donor_id;
        
        IF total_donation > 10000 THEN
            UPDATE external_donor
            SET donorDescription = 'VIP'
            WHERE donor_id = donor_id;
            v_new_status := 'VIP';  -- Set new status explicitly
        ELSE
            UPDATE external_donor
            SET donorDescription = 'Regular'
            WHERE donor_id = donor_id;
            v_new_status := 'Regular';  -- Set new status explicitly
        END IF;

        -- Fetch the donor's name for printing
        SELECT fname
        INTO v_donor_name
        FROM person
        WHERE person_id = donor_id;

        -- Print the update result
        DBMS_OUTPUT.PUT_LINE('Donor ' || v_donor_name || ' (ID: ' || donor_id || ') updated to ' || v_new_status || ' status.');
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No donations found for donor ' || donor_id);
        WHEN OTHERS THEN
            RAISE;

    END;
END update_donor_status;
/
