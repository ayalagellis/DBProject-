
--First view
CREATE VIEW community_members_birth_and_donation AS
SELECT 
    cm.member_id,
    p.fname AS first_name,
    p.lname AS last_name,
    b.baby_DOB AS birth_date,
    d.date_of_donation AS donation_date,
    d.donation_amount,
    b.num_of_children AS num_of_children
FROM 
    communityMember cm
    JOIN person p ON cm.person_id = p.person_id
    JOIN birth b ON cm.member_id = b.member_id
    JOIN donation d ON cm.person_id = d.person_id
WHERE
    d.community_id = cm.community_id;
    
--View1 Query1
SELECT 
    first_name,
    last_name,
    SUM(donation_amount) AS total_donations
FROM 
    community_members_birth_and_donation
GROUP BY 
    first_name, last_name
HAVING 
    SUM(donation_amount) > 70000;

--View1 Query2
SELECT 
    last_name,
    num_of_children
FROM 
    community_members_birth_and_donation
WHERE 
    num_of_children > 3

ORDER BY last_name, num_of_children;

--View2
CREATE VIEW HighRatedYoledetServiceGivers AS
SELECT *
FROM YOLEDETSERVICEGIVER
WHERE ysg_rating > 3;

--View2 Query1
SELECT ysg.sgm_id, ysg.ysg_rating, bs.b_gender, bs.b_age, bs.b_yearsofexperience
FROM HighRatedYoledetServiceGivers ysg
JOIN BABYSITTING bs ON ysg.sgm_id = bs.sgm_id
WHERE bs.b_yearsofexperience > 3;


--View2 Query2
SELECT ysg.sgm_id, ysg.ysg_rating, b.num_of_children
FROM HighRatedYoledetServiceGivers ysg
JOIN BIRTH b ON ysg.ym_id = b.member_id
WHERE b.num_of_children > 7;



