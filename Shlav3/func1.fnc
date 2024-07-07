CREATE OR REPLACE NONEDITIONABLE FUNCTION find_and_print_top_community_stats RETURN VARCHAR2
IS
    v_output VARCHAR2(1000);  -- Variable to store output for return
    v_community_id_births NUMBER;
    v_community_type_births VARCHAR2(30);
    v_num_of_births NUMBER;
    v_community_id_food NUMBER;
    v_community_type_food VARCHAR2(30);
    v_amount_spent_on_food NUMBER;
    
    -- Cursors declaration
    CURSOR c_births IS
        SELECT cm.community_id,
               c.community_type,
               COUNT(b.birth_id) AS num_of_births
        FROM birth b
        JOIN communityMember cm ON b.member_id = cm.member_id
        JOIN community c ON cm.community_id = c.community_id
        WHERE b.baby_DOB >= ADD_MONTHS(TRUNC(SYSDATE, 'YEAR'), -36) -- Last 3 years
        GROUP BY cm.community_id, c.community_type
        ORDER BY COUNT(b.birth_id) DESC
        FETCH FIRST 1 ROWS ONLY;
    
    CURSOR c_food_spending IS
        SELECT c.community_id,
               c.community_type,
               SUM(s.amount) AS total_spending_on_food
        FROM spending s
        JOIN community c ON s.community_id = c.community_id
        WHERE s.destination = 'Food for family'
        GROUP BY c.community_id, c.community_type
        ORDER BY SUM(s.amount) DESC
        FETCH FIRST 1 ROWS ONLY;
BEGIN
    -- Query to find community with the most births
    OPEN c_births;
    FETCH c_births INTO v_community_id_births, v_community_type_births, v_num_of_births;
    CLOSE c_births;

    -- Build output for community with most births
    v_output := 'Community with Most Births:' || CHR(10);
    v_output := v_output || '  Community ID: ' || v_community_id_births || CHR(10);
    v_output := v_output || '  Community Type: ' || v_community_type_births || CHR(10);
    v_output := v_output || '  Number of Births: ' || v_num_of_births || CHR(10);
    v_output := v_output || '----------------------------------' || CHR(10);

    -- Query to find community that spent the most amount on food
    OPEN c_food_spending;
    FETCH c_food_spending INTO v_community_id_food, v_community_type_food, v_amount_spent_on_food;
    CLOSE c_food_spending;

    -- Build output for community with most spending on food
    v_output := v_output || 'Community with Most Spending on Food:' || CHR(10);
    v_output := v_output || '  Community ID: ' || v_community_id_food || CHR(10);
    v_output := v_output || '  Community Type: ' || v_community_type_food || CHR(10);
    v_output := v_output || '  Amount Spent on Food: ' || v_amount_spent_on_food || CHR(10);
    v_output := v_output || '----------------------------------';

    -- Print output using DBMS_OUTPUT
    DBMS_OUTPUT.PUT_LINE(v_output);

    -- Return the output for potential further use
    RETURN v_output;
END;
/
