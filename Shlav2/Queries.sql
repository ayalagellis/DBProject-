SELECT 
    p.fname,
    p.lname,
    p.phone_number,
    b.baby_DOB
FROM
    person p
    JOIN communityMember cm ON p.person_id = cm.person_id
    JOIN birth b ON cm.member_id = b.member_id
WHERE
    b.baby_DOB >= ADD_MONTHS(SYSDATE, -12)
ORDER BY
    TO_CHAR(b.baby_DOB, 'MM'), b.baby_DOB;


SELECT 
    c.community_id,
    c.community_type,
    p.person_id,
    p.fname || ' ' || p.lname AS full_name,
    p.phone_number,
    SUM(d.donation_amount) AS total_donation
FROM
    donation d
    JOIN community c ON d.community_id = c.community_id
    JOIN person p ON d.person_id = p.person_id
GROUP BY
    c.community_id,
    c.community_type,
    p.person_id,
    p.fname,
    p.lname,
    p.phone_number
ORDER BY
    c.community_id,
    total_donation DESC;



SELECT p.fname, p.lname
FROM person p
JOIN communityMember cm ON p.person_id = cm.person_id
JOIN birth b ON cm.member_id = b.member_id
WHERE b.baby_DOB >= TRUNC(SYSDATE - INTERVAL '12' MONTH)
  AND b.baby_DOB < TRUNC(SYSDATE)
  AND b.num_of_children > 3;



SELECT c.community_id, c.community_type, SUM(s.amount) AS total_spent_on_clothing
FROM community c
JOIN spending s ON c.community_id = s.community_id
WHERE s.destination = 'Clothing'  
  AND s.spending_date >= TRUNC(SYSDATE, 'MM') - INTERVAL '1' MONTH
  AND s.spending_date < TRUNC(SYSDATE, 'MM')
GROUP BY c.community_id, c.community_type
HAVING SUM(s.amount) > 10000;



UPDATE community c
SET c.monthly_donation = c.monthly_donation * 5  
WHERE c.community_id IN (
    SELECT d.community_id
    FROM (
        SELECT community_id, SUM(donation_amount) AS total_donations
        FROM donation
        WHERE date_of_donation >= TRUNC(SYSDATE - INTERVAL '1' YEAR)
        GROUP BY community_id
    ) d
    WHERE d.total_donations < 10000
);


UPDATE external_donor
SET donorDescription = 'corporation'
WHERE donor_id IN (
    SELECT ed.donor_id
    FROM external_donor ed
    JOIN donation d ON ed.person_id = d.person_id
    WHERE d.donation_amount > 50000
);





DELETE FROM communityMember
WHERE NOT EXISTS (
    SELECT 1
    FROM birth b
    WHERE b.member_id = communityMember.member_id
)
AND NOT EXISTS (
    SELECT 1
    FROM donation d
    WHERE d.person_id = communityMember.person_id
);





select * from spending;

DELETE FROM spending
WHERE community_id IN (
    SELECT community_id
    FROM donation
    WHERE date_of_donation >= TRUNC(SYSDATE - INTERVAL '1' YEAR)
    GROUP BY community_id
    HAVING COUNT(*) < 20
);

select * from spending;




