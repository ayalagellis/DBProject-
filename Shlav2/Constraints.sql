ALTER TABLE community
ADD CONSTRAINT chk_monthly_donation_positive
CHECK (monthly_donation > 0);


ALTER TABLE person
MODIFY phone_number DEFAULT '000000000';


ALTER TABLE external_donor
MODIFY donorDescription VARCHAR2(300) NOT NULL;
