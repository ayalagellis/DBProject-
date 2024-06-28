CREATE TABLE person
(
  person_id INT NOT NULL,
  fname VARCHAR2(30) NOT NULL,
  lname VARCHAR2(30) NOT NULL,
  phone_number VARCHAR2(10) NOT NULL,
  PRIMARY KEY (person_id)
);


CREATE TABLE community
(
  community_id INT NOT NULL,
  monthly_donation NUMBER NOT NULL,
  community_type VARCHAR2(30) NOT NULL,
  phone_number VARCHAR2(10) NOT NULL,
  PRIMARY KEY (community_id)
);

CREATE TABLE communityMember
(
  address VARCHAR2(30) NOT NULL,
  date_of_birth DATE NOT NULL,
  member_id INT NOT NULL,
  community_id INT NOT NULL,
  person_id INT NOT NULL,
  PRIMARY KEY (member_id),
  FOREIGN KEY (community_id) REFERENCES community(community_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);


CREATE TABLE external_donor
(
  donorDescription VARCHAR2(300),
  gender VARCHAR2(6) NOT NULL,
  person_id INT NOT NULL,
  donor_id INT NOT NULL,
  PRIMARY KEY (donor_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);


CREATE TABLE donation
(
  date_of_donation DATE NOT NULL,
  donation_amount NUMBER NOT NULL,
  donation_id INT NOT NULL,
  person_id INT NOT NULL,
  community_id INT NOT NULL,
  FOREIGN KEY (community_id) REFERENCES community(community_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE birth
(
  birth_id INT NOT NULL,
  baby_DOB DATE NOT NULL,
  num_of_children INT NOT NULL,
  comments VARCHAR2(200) NOT NULL,
  member_id INT NOT NULL,
  PRIMARY KEY (birth_id),
  FOREIGN KEY (member_id) REFERENCES communityMember(member_id)
);


CREATE TABLE spending
(
  destination VARCHAR2(300) NOT NULL,
  amount NUMBER NOT NULL,
  spending_date DATE NOT NULL,
  spending_id INT NOT NULL,
  community_id INT NOT NULL,
  PRIMARY KEY (spending_id),
  FOREIGN KEY (community_id) REFERENCES community(community_id)
);



