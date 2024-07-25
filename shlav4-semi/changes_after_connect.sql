
CREATE TABLE community
(
  community_id     INTEGER not null,
  monthly_donation NUMBER not null,
  community_type   VARCHAR2(30) not null,
  phone_number     VARCHAR2(10) not null,
  name VARCHAR2(20) not null,
  location VARCHAR2(20),
 -- num_of_members INTEGER NOT NULL,
  PRIMARY KEY (community_id)
);
ALTER TABLE COMMUNITY ADD CONSTRAINT CHK_MONTHLY_DONATION_POSITIVE CHECK (monthly_donation > 0);


CREATE TABLE community_member
(
  address VARCHAR2(100) not null,
  date_of_birth DATE not null,
  member_id INTEGER not null,
  join_date DATE not null,
  mail VARCHAR2(50),
  person_id INTEGER not null,
  community_id INTEGER not null,
  PRIMARY KEY (member_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id),
  FOREIGN KEY (community_id) REFERENCES community(community_id)
);


--שינוי שמות לבהירים יותר
CREATE TABLE serviceGiver
(
  sg_price NUMBER,
  sg_details VARCHAR2(100),
  sg_id INTEGER NOT NULL,
  PRIMARY KEY (sg_id),
  FOREIGN KEY (sg_id) REFERENCES community_member(member_id) --UPDATE
);


CREATE TABLE Consulting
(
  experience_years  INTEGER not null,--שינוי שם
  location VARCHAR2(100),
  c_type VARCHAR2(20) not null,
  sg_id INTEGER not null
  PRIMARY KEY (sg_id),
  FOREIGN KEY (sg_id) REFERENCES serviceGiver(sg_id)
);

CREATE TABLE Babysitting
(
  b_yearsOfExperience INTEGER,
  b_age NUMBER,
  b_gender VARCHAR2(1) not null,
  b_maxNumberOfChildren INTEGER,
  sg_id INTEGER NOT NULL,
  PRIMARY KEY (sg_id),
  FOREIGN KEY (sg_id) REFERENCES serviceGiver(sg_id)
);

CREATE TABLE Cleaning
(
  cleaning_type VARCHAR2(20),
  sg_id INTEGER not null,
  PRIMARY KEY (sg_id),
  FOREIGN KEY (sg_id) REFERENCES serviceGiver(sg_id)
);

CREATE TABLE YoledetServiceGiver
(
  service_start_time VARCHAR2(5) not null, --למה מחרוזת ולא זמן?
  rating INTEGER,
  service_date DATE not null,
  service_end_time VARCHAR2(5) not null, --למה מחרוזת ולא זמן?
  sg_id INTEGER not null,
  member_id INTEGER not null,
  PRIMARY KEY (sg_id, member_id),
  FOREIGN KEY (sg_id) REFERENCES serviceGiver(sg_id),
  FOREIGN KEY (member_id) REFERENCES birth(member_id)
);
alter table YOLEDETSERVICEGIVER
  add constraint CHECK_DIFFERENT_MEMBERS
  check (member_id != sg_id);

CREATE TABLE Times
(
  t_num INTEGER not null,
  day_of_week VARCHAR2(20) not null,
  start_time VARCHAR2(5) not null,
  end_time VARCHAR2(5) not null,
  sg_id INTEGER not null,
  PRIMARY KEY (T_num, sg_id),
  FOREIGN KEY (sg_id) REFERENCES serviceGiver(sg_id)
);