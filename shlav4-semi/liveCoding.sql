SELECT *
FROM SERVICEGIVER s
WHERE s.sgm_id in 
( SELECT sgm_id FROM BABYSITTING b WHERE b.sgm_id = s.sgm_id) and 
( SELECT sgm_id FROM CLEANING c WHERE c.sgm_id = s.sgm_id) and
( SELECT sgm_id FROM CONSULTING l WHERE l.sgm_id = s.sgm_id);

-- לבחור נותן שרות אשר מופםיע ב3 הטבלאות 
