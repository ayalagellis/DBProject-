CREATE OR REPLACE PROCEDURE community_donation_spending_summary IS
    -- Custom exception declaration
    no_food_spending_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(no_food_spending_exception, -20001); -- Assigning error code
    
    v_food_spending_found BOOLEAN := FALSE;  -- Flag to track if any food spending was found
    
BEGIN
    FOR rec IN (
        SELECT c.community_id,
               c.community_type,
               SUM(d.donation_amount) AS total_donations,
               SUM(CASE WHEN s.destination = 'Food for family' THEN s.amount ELSE 0 END) AS food_spending,
               SUM(CASE WHEN s.destination = 'Things for the baby' THEN s.amount ELSE 0 END) AS baby_things_spending,
               SUM(CASE WHEN s.destination = 'Extra money' THEN s.amount ELSE 0 END) AS extra_money,
               SUM(CASE WHEN s.destination = 'Clothing' THEN s.amount ELSE 0 END) AS clothing_spending,
               ROUND(SUM(CASE WHEN s.destination = 'Food for family' THEN s.amount ELSE 0 END) / SUM(d.donation_amount) * 100, 2) AS food_percentage,
               ROUND(SUM(CASE WHEN s.destination = 'Things for the baby' THEN s.amount ELSE 0 END) / SUM(d.donation_amount) * 100, 2) AS baby_things_percentage,
               ROUND(SUM(CASE WHEN s.destination = 'Extra money' THEN s.amount ELSE 0 END) / SUM(d.donation_amount) * 100, 2) AS extra_money_percentage,
               ROUND(SUM(CASE WHEN s.destination = 'Clothing' THEN s.amount ELSE 0 END) / SUM(d.donation_amount) * 100, 2) AS clothing_percentage
          FROM community c
          LEFT JOIN donation d ON c.community_id = d.community_id
          LEFT JOIN spending s ON c.community_id = s.community_id
         WHERE d.date_of_donation >= ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), -60)
           AND s.spending_date >= ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), -60)
         GROUP BY c.community_id, c.community_type
         ORDER BY c.community_id
    ) LOOP
        -- Checking if food spending is zero
        IF rec.food_spending = 0 THEN
            v_food_spending_found := TRUE;  -- Set flag to true if zero spending found
        END IF;
        
        -- Printing community details
        DBMS_OUTPUT.PUT_LINE('Community ID: ' || rec.community_id);
        DBMS_OUTPUT.PUT_LINE('Community Type: ' || rec.community_type);
        DBMS_OUTPUT.PUT_LINE('Total Donations: ' || NVL(rec.total_donations, 0));
        DBMS_OUTPUT.PUT_LINE('Food Spending: ' || NVL(rec.food_spending, 0) || ' (' || NVL(rec.food_percentage, 0) || '%)');
        DBMS_OUTPUT.PUT_LINE('Baby Things Spending: ' || NVL(rec.baby_things_spending, 0) || ' (' || NVL(rec.baby_things_percentage, 0) || '%)');
        DBMS_OUTPUT.PUT_LINE('Extra Money Spending: ' || NVL(rec.extra_money, 0) || ' (' || NVL(rec.extra_money_percentage, 0) || '%)');
        DBMS_OUTPUT.PUT_LINE('Clothing Spending: ' || NVL(rec.clothing_spending, 0) || ' (' || NVL(rec.clothing_percentage, 0) || '%)');
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
    END LOOP;
    
    -- Raise exception if no food spending was found
    IF NOT v_food_spending_found THEN
        RAISE_APPLICATION_ERROR(-20001, 'No money was spent on food for any community in the last year.');
    END IF;

EXCEPTION
    WHEN no_food_spending_exception THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END community_donation_spending_summary;
/
