SELECT p.fname, p.lname
FROM person p
WHERE p.person_id IN (
    SELECT cm.person_id
    FROM communityMember cm
    WHERE cm.member_id IN (
        SELECT b.member_id
        FROM birth b
        WHERE b.baby_DOB BETWEEN TO_DATE(&d_from, 'dd-mm-yyyy') AND TO_DATE(&d_to, 'dd-mm-yyyy')
    )
)



SELECT c.community_id, c.community_type
FROM community c
WHERE c.community_id IN (
    SELECT s.community_id
    FROM spending s
    WHERE s.destination = '&<name="destination" list="Food for family, Things for the baby, Extra money, Clothing">'
);



SELECT ed.person_id, p.fname, p.lname, ed.gender, SUM(d.donation_amount) AS total_donation
FROM external_donor ed
JOIN person p ON ed.person_id = p.person_id
LEFT JOIN donation d ON ed.person_id = d.person_id
WHERE ed.gender = '&<name="gender" hint="male/female" type="string">'
GROUP BY ed.person_id, p.fname, p.lname, ed.gender
ORDER BY total_donation DESC;


SELECT p.person_id, p.fname, p.lname, d.donation_amount
FROM person p
JOIN donation d ON p.person_id = d.person_id
WHERE d.donation_amount > &<name="donation_amount" type="integer" hint="Enter donation amount">
ORDER BY d.donation_amount DESC;









