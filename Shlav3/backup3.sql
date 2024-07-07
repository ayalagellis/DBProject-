prompt PL/SQL Developer Export Tables for user AYALAG@XE
prompt Created by gelli on Sunday, July 7, 2024
set feedback off
set define off

prompt Creating PERSON...
create table PERSON
(
  person_id    INTEGER not null,
  fname        VARCHAR2(30) not null,
  lname        VARCHAR2(30) not null,
  phone_number VARCHAR2(10) default '000000000' not null
)
;
alter table PERSON
  add primary key (PERSON_ID);

prompt Creating COMMUNITY...
create table COMMUNITY
(
  community_id     INTEGER not null,
  monthly_donation NUMBER not null,
  community_type   VARCHAR2(30) not null,
  phone_number     VARCHAR2(10) not null
)
;
alter table COMMUNITY
  add primary key (COMMUNITY_ID);
alter table COMMUNITY
  add constraint CHK_MONTHLY_DONATION_POSITIVE
  check (monthly_donation > 0);

prompt Creating COMMUNITYMEMBER...
create table COMMUNITYMEMBER
(
  address       VARCHAR2(30) not null,
  date_of_birth DATE not null,
  member_id     INTEGER not null,
  community_id  INTEGER not null,
  person_id     INTEGER not null
)
;
alter table COMMUNITYMEMBER
  add primary key (MEMBER_ID);
alter table COMMUNITYMEMBER
  add foreign key (COMMUNITY_ID)
  references COMMUNITY (COMMUNITY_ID);
alter table COMMUNITYMEMBER
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating BIRTH...
create table BIRTH
(
  birth_id        INTEGER not null,
  baby_dob        DATE not null,
  num_of_children INTEGER not null,
  comments        VARCHAR2(200) not null,
  member_id       INTEGER not null
)
;
alter table BIRTH
  add primary key (BIRTH_ID);
alter table BIRTH
  add foreign key (MEMBER_ID)
  references COMMUNITYMEMBER (MEMBER_ID);

prompt Creating DONATION...
create table DONATION
(
  date_of_donation DATE not null,
  donation_amount  NUMBER not null,
  donation_id      INTEGER not null,
  person_id        INTEGER not null,
  community_id     INTEGER not null
)
;
alter table DONATION
  add foreign key (COMMUNITY_ID)
  references COMMUNITY (COMMUNITY_ID);
alter table DONATION
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating EXTERNAL_DONOR...
create table EXTERNAL_DONOR
(
  donordescription VARCHAR2(300) not null,
  gender           VARCHAR2(6) not null,
  person_id        INTEGER not null,
  donor_id         INTEGER not null
)
;
alter table EXTERNAL_DONOR
  add primary key (DONOR_ID);
alter table EXTERNAL_DONOR
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating SPENDING...
create table SPENDING
(
  destination   VARCHAR2(300) not null,
  amount        NUMBER not null,
  spending_date DATE not null,
  spending_id   INTEGER not null,
  community_id  INTEGER not null
)
;
alter table SPENDING
  add primary key (SPENDING_ID);
alter table SPENDING
  add foreign key (COMMUNITY_ID)
  references COMMUNITY (COMMUNITY_ID);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for COMMUNITY...
alter table COMMUNITY disable all triggers;
prompt Disabling triggers for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER disable all triggers;
prompt Disabling triggers for BIRTH...
alter table BIRTH disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR disable all triggers;
prompt Disabling triggers for SPENDING...
alter table SPENDING disable all triggers;
prompt Disabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER disable constraint SYS_C009734;
alter table COMMUNITYMEMBER disable constraint SYS_C009735;
prompt Disabling foreign key constraints for BIRTH...
alter table BIRTH disable constraint SYS_C009742;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C009748;
alter table DONATION disable constraint SYS_C009749;
prompt Disabling foreign key constraints for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR disable constraint SYS_C009755;
prompt Disabling foreign key constraints for SPENDING...
alter table SPENDING disable constraint SYS_C009762;
prompt Deleting SPENDING...
delete from SPENDING;
commit;
prompt Deleting EXTERNAL_DONOR...
delete from EXTERNAL_DONOR;
commit;
prompt Deleting DONATION...
delete from DONATION;
commit;
prompt Deleting BIRTH...
delete from BIRTH;
commit;
prompt Deleting COMMUNITYMEMBER...
delete from COMMUNITYMEMBER;
commit;
prompt Deleting COMMUNITY...
delete from COMMUNITY;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000201, 'Elias', 'Carradine', '512923452');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000202, 'Brendan', 'LaBelle', '811125276');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000203, 'Laurence', 'Janney', '972879666');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000204, 'Rachel', 'Gere', '859785748');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000205, 'Embeth', 'Fisher', '312175213');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000206, 'Andy', 'Crimson', '597126731');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000207, 'Cliff', 'Roth', '443778876');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000208, 'Oded', 'Carlisle', '757195164');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000209, 'Jon', 'Avalon', '132195345');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000210, 'Jeff', 'Giraldo', '343217154');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000211, 'Vickie', 'Borden', '174138579');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000212, 'Mary-Louise', 'Webb', '984873331');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000213, 'Davey', 'Teng', '893445916');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000214, 'Mel', 'Cohn', '125589823');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000215, 'Tracy', 'Grant', '933953718');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000216, 'Wayman', 'Giamatti', '645854779');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000217, 'Wes', 'Hawke', '962814373');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000218, 'Nikka', 'Barkin', '272815583');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000219, 'Simon', 'Spine', '249677377');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000220, 'Rebeka', 'Albright', '111141926');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000221, 'Lindsey', 'Torino', '741577445');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000222, 'Caroline', 'Lopez', '778783963');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000223, 'Raul', 'Cube', '574167734');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000224, 'Kazem', 'Thornton', '142878655');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000225, 'Harold', 'Steenburgen', '787927982');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000226, 'Glen', 'Seagal', '979637264');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000227, 'Tea', 'Meyer', '826782368');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000228, 'Mel', 'Perez', '725969858');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000229, 'Ving', 'Masur', '643713759');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000230, 'Rufus', 'Cusack', '347124165');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000231, 'Casey', 'Simpson', '724284417');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000232, 'Diamond', 'Witherspoon', '534512676');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000233, 'Nikka', 'Rubinek', '771339945');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000234, 'Chuck', 'Mewes', '889999165');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000235, 'Rachid', 'Armstrong', '835414724');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000236, 'Melba', 'McGowan', '774925991');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000237, 'Willem', 'Armstrong', '426862971');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000238, 'Jonathan', 'Schneider', '287451721');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000239, 'Kimberly', 'Marsden', '393373855');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000240, 'Donal', 'Roundtree', '926348131');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000241, 'Hope', 'Brooks', '687159353');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000242, 'Cledus', 'Cox', '246221585');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000243, 'Christmas', 'Michaels', '982995654');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000244, 'Toni', 'Colton', '173458194');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000245, 'Albertina', 'Jamal', '413981225');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000246, 'Sara', 'Deschanel', '188197511');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000247, 'Rebecca', 'Teng', '327384389');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000248, 'Mandy', 'Rooker', '485838954');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000249, 'Jude', 'Collins', '514924334');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000250, 'Nik', 'Reubens', '615491415');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000251, 'Vince', 'Worrell', '139756341');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000252, 'Tamala', 'Hampton', '521923311');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000253, 'Madeleine', 'Winwood', '968287986');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000254, 'Ted', 'Stills', '376157842');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000255, 'Heath', 'Connick', '261411616');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000256, 'Azucar', 'Cartlidge', '921243259');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000257, 'Mark', 'Garr', '656433787');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000258, 'Shelby', 'Cartlidge', '845837378');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000259, 'Devon', 'Krabbe', '613936662');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000260, 'Juliana', 'Englund', '452337184');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000261, 'Jet', 'Kingsley', '375295475');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000262, 'Benjamin', 'Evanswood', '289949286');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000263, 'Stanley', 'Nicks', '513689953');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000264, 'Kenneth', 'Campbell', '757941579');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000265, 'Kathy', 'Evett', '513584696');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000266, 'Edwin', 'Mahood', '684372965');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000267, 'Jonatha', 'Astin', '711769545');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000268, 'Glen', 'Secada', '566419676');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000269, 'Simon', 'Almond', '187544299');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000270, 'Stephanie', 'Lorenz', '569168945');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000271, 'Gordie', 'Pollack', '563369159');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000272, 'Garry', 'Meniketti', '378855242');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000273, 'Udo', 'Foster', '779265573');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000274, 'Brothers', 'Wen', '712235252');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000275, 'Richie', 'Hannah', '618762864');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000276, 'Rik', 'Leoni', '475311419');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000277, 'Taryn', 'Evans', '555184566');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000278, 'Adrien', 'Amos', '656812386');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000279, 'Tobey', 'McGoohan', '317757559');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000280, 'Jane', 'Merchant', '626833682');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000281, 'Johnny', 'Evanswood', '277475728');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000282, 'Lari', 'Thornton', '588929961');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000283, 'Freddie', 'Osmond', '289631515');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000284, 'Lizzy', 'Harrison', '588882298');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000285, 'Tom', 'Rodriguez', '917295898');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000286, 'Jose', 'Stone', '253577373');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000287, 'Graham', 'Duchovny', '692651151');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000288, 'Delbert', 'Underwood', '333738756');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000289, 'Jerry', 'LaPaglia', '198893736');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000290, 'Harrison', 'Weiss', '822914135');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000291, 'Joaquin', 'Diesel', '997227924');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000292, 'Jeroen', 'Roth', '679492392');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000293, 'Sheryl', 'Posey', '739776868');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000294, 'Gates', 'Zane', '155435372');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000295, 'Nelly', 'Pantoliano', '898455689');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000296, 'Hilton', 'Schiavelli', '461141789');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000297, 'Shannon', 'Forster', '696414148');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000298, 'Arturo', 'Santa Rosa', '199594546');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000299, 'Jack', 'Schiavelli', '417387259');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000300, 'Larnelle', 'Harnes', '691595321');
commit;
prompt 100 records committed...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000301, 'Todd', 'Vicious', '687635518');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000302, 'Judi', 'Luongo', '988349167');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000303, 'Whoopi', 'Hauser', '299159466');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000304, 'Giancarlo', 'Pollack', '898782931');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000305, 'Mac', 'Miller', '464915477');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000306, 'Aida', 'Penn', '644473855');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000307, 'Mary Beth', 'Tomei', '896616487');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000308, 'Mena', 'Dalley', '892815853');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000309, 'Vince', 'Hirsch', '346735494');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000310, 'Warren', 'Barkin', '217517951');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000311, 'Arturo', 'Gryner', '715271491');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000312, 'Meredith', 'Bryson', '254887674');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000313, 'Emily', 'Biel', '738222166');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000314, 'Debra', 'Pfeiffer', '684369863');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000315, 'Goran', 'Postlethwaite', '625386853');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000316, 'Carole', 'Ramirez', '297583441');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000317, 'Garth', 'Raitt', '157923538');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000318, 'Julio', 'Branagh', '631447289');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000319, 'Gin', 'Davidson', '638213882');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000320, 'Cole', 'Frakes', '754428348');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000321, 'Natasha', 'Danger', '575912634');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000322, 'Dorry', 'Gallagher', '141373223');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000323, 'Ernest', 'Cartlidge', '344198966');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000324, 'Rueben', 'Yankovic', '144155711');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000325, 'Frankie', 'Geldof', '411589453');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000326, 'Danni', 'Lewis', '522639569');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000327, 'Rob', 'Payton', '625633946');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000328, 'Casey', 'LaPaglia', '434852926');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000329, 'Philip', 'Graham', '435849877');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000330, 'Isabella', 'Schneider', '218789913');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000331, 'Delroy', 'Cocker', '142847716');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000332, 'Neneh', 'Shaw', '524812846');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000333, 'Courtney', 'Loring', '896453254');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000334, 'Todd', 'Duchovny', '362859753');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000335, 'Sharon', 'Kenoly', '698575491');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000336, 'Rascal', 'McKean', '988213282');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000337, 'Belinda', 'Dunaway', '137188392');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000338, 'Gord', 'Utada', '238542897');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000339, 'Roy', 'Pantoliano', '264758583');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000340, 'Dave', 'Chappelle', '567973785');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000341, 'Rene', 'Hawthorne', '736238746');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000342, 'Marley', 'Neeson', '849658746');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000343, 'Joanna', 'Gagnon', '214345317');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000344, 'Bob', 'Hoskins', '616726463');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000345, 'Andre', 'Page', '314295944');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000346, 'Wayne', 'Hatfield', '891254294');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000347, 'Jamie', 'Hopkins', '938585323');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000348, 'Naomi', 'Epps', '517425241');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000349, 'Lesley', 'Head', '132851421');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000350, 'Campbell', 'Gallant', '457176533');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000351, 'Brittany', 'Logue', '978882652');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000352, 'Crispin', 'Richter', '327281466');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000353, 'Joseph', 'Olin', '753732998');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000354, 'Lucinda', 'Rowlands', '788322822');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000355, 'Sandra', 'Greenwood', '764446873');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000356, 'Garry', 'Guinness', '671553599');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000357, 'Harris', 'von Sydow', '478411446');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000358, 'Elisabeth', 'Santana', '768643723');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000359, 'Benicio', 'Nelson', '712124362');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000360, 'Lou', 'Magnuson', '388264528');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000361, 'Thelma', 'Red', '729897195');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000362, 'Howard', 'Boorem', '996752136');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000363, 'Jennifer', 'Graham', '295164128');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000364, 'Caroline', 'Sedgwick', '133763312');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000365, 'Neneh', 'Morton', '998732874');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000366, 'Gil', 'Hart', '741915645');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000367, 'Liquid', 'Lofgren', '157891188');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000368, 'Claire', 'Chinlund', '469515684');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000369, 'Goran', 'Spacey', '716255379');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000370, 'Gin', 'Ponce', '337441519');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000371, 'Vincent', 'Camp', '824887326');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000372, 'Lucy', 'Sherman', '486764433');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000373, 'John', 'Harris', '717998185');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000374, 'Nikka', 'Stone', '575136417');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000375, 'Avril', 'Rubinek', '432846592');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000376, 'Casey', 'Mohr', '621829869');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000377, 'Lou', 'Brolin', '782562267');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000378, 'Desmond', 'Dalton', '982125258');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000379, 'Ossie', 'Latifah', '187813761');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000380, 'Denzel', 'Alston', '822441284');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000381, 'Jena', 'Griffith', '194114958');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000382, 'Tia', 'Overstreet', '541897152');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000383, 'Lauren', 'Harnes', '419839525');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000384, 'Malcolm', 'Bratt', '726937296');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000385, 'Claire', 'Gleeson', '622155957');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000386, 'Clay', 'Hayek', '767727132');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000387, 'Merle', 'Botti', '386375181');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000388, 'Tcheky', 'Young', '338354439');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000389, 'Chubby', 'Porter', '812321592');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000390, 'Anjelica', 'Luongo', '179816954');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000391, 'Aimee', 'Piven', '399826556');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000392, 'Cole', 'Darren', '757656966');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000393, 'Simon', 'Morrison', '474487971');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000394, 'Famke', 'Callow', '644388542');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000395, 'Johnnie', 'Bridges', '446317732');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000396, 'Vienna', 'Cleese', '975465254');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000397, 'Juliette', 'Busey', '651634874');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000398, 'Emerson', 'Summer', '675718346');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000399, 'Sean', 'Spall', '868997476');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000000, 'Joely', 'England', '994263516');
commit;
prompt 200 records committed...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000001, 'Martha', 'Lithgow', '243155153');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000002, 'Anne', 'Benoit', '534524862');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000003, 'Maceo', 'Dalley', '997681361');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000004, 'Danni', 'Woodward', '131394152');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000005, 'Hugh', 'Gyllenhaal', '259838652');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000006, 'Ike', 'Gore', '525284385');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000007, 'Christian', 'Yankovic', '152697847');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000008, 'Anne', 'Hackman', '493257467');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000009, 'Rueben', 'Bonham', '999926585');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000010, 'Jamie', 'Keith', '926183673');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000011, 'Brenda', 'LuPone', '411751973');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000012, 'Pat', 'Bacharach', '534549488');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000013, 'Claude', 'Krieger', '956735776');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000014, 'Hugo', 'Bugnon', '372789257');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000015, 'Pat', 'Merchant', '285188613');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000016, 'Malcolm', 'Zappacosta', '589697739');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000017, 'Oro', 'Lewin', '152697538');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000018, 'Rupert', 'Feuerstein', '866235539');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000019, 'Ceili', 'Mortensen', '715565813');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000020, 'Cloris', 'Seagal', '335279736');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000021, 'Deborah', 'Soul', '917582761');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000022, 'Norm', 'Michael', '638228951');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000023, 'Kelly', 'Dukakis', '591415722');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000024, 'Brendan', 'Estevez', '941835199');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000025, 'Lila', 'Keaton', '276729366');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000026, 'Rachael', 'Paxton', '822521136');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000027, 'Cole', 'Hauer', '877577778');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000028, 'Elisabeth', 'English', '636875765');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000029, 'Randy', 'Charles', '493354345');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000030, 'Jesse', 'Crowe', '262191559');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000031, 'Joaquin', 'Van Damme', '179111772');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000032, 'Howard', 'Gambon', '554757927');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000033, 'Clay', 'Hatchet', '499892858');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000034, 'Earl', 'Lee', '291789934');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000035, 'Daniel', 'Taha', '948699269');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000036, 'Cornell', 'Vaughn', '843362889');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000037, 'Eddie', 'Durning', '187753229');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000038, 'Lois', 'Nash', '127189218');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000039, 'Adrien', 'Lightfoot', '726162455');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000040, 'Armand', 'Stamp', '869348211');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000041, 'Mike', 'Dunn', '819782812');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000042, 'Walter', 'Harrison', '889568124');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000043, 'Caroline', 'LaPaglia', '751372719');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000044, 'Veruca', 'Rooker', '626319517');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000045, 'Cathy', 'Brown', '871571296');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000046, 'Victoria', 'Nash', '863437462');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000047, 'Rebecca', 'Jovovich', '349959161');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000048, 'Rosco', 'Ali', '261369359');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000049, 'Nicole', 'Atkins', '638854728');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000050, 'Jodie', 'Dillon', '768523134');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000051, 'Franz', 'Guilfoyle', '589977696');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000052, 'Maxine', 'Giraldo', '826333136');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000053, 'Cathy', 'Cockburn', '421229544');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000054, 'Jonny Lee', 'Wong', '252644279');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000055, 'Hal', 'Logue', '886631166');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000056, 'Armin', 'Breslin', '387755978');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000057, 'Jena', 'Skaggs', '345424769');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000058, 'Rebeka', 'Kurtz', '792162515');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000059, 'Carolyn', 'Cube', '338543922');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000060, 'Gladys', 'Schiff', '796638123');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000061, 'Danny', 'Alda', '485249868');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000062, 'Lois', 'Crouch', '652619275');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000063, 'Christian', 'Burton', '352213222');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000064, 'Rose', 'Kurtz', '782668268');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000065, 'Rose', 'Collins', '415278297');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000066, 'Joy', 'Oakenfold', '799678195');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000067, 'Lenny', 'Hamilton', '231387391');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000068, 'Cameron', 'Bratt', '431343847');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000069, 'Tom', 'Johnson', '744511285');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000070, 'Collective', 'Reiner', '376395821');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000071, 'Dustin', 'Morton', '822329388');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000072, 'Vonda', 'McDonnell', '763579719');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000073, 'Milla', 'Parsons', '596929223');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000074, 'Rosanne', 'Perlman', '642449462');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000075, 'Stanley', 'Flanery', '439967262');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000076, 'Juice', 'Burstyn', '189453254');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000077, 'Leelee', 'Noseworthy', '764253699');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000078, 'Randy', 'Stewart', '473749546');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000079, 'Ice', 'Hewett', '795546144');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000080, 'Sammy', 'Reeves', '976237836');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000081, 'Carla', 'Walken', '451777697');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000082, 'Goran', 'Sample', '763231932');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000083, 'Jean-Claude', 'Danes', '718973725');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000084, 'Aidan', 'Bassett', '272711573');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000085, 'Kirk', 'Waits', '443751885');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000086, 'Spike', 'Suvari', '659178391');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000087, 'Antonio', 'Roth', '147196579');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000088, 'Victor', 'Hauer', '722317536');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000089, 'Rosie', 'Warden', '899165144');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000090, 'Regina', 'Reeves', '429556711');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000091, 'Hilary', 'Carrere', '123491821');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000092, 'Jonatha', 'Paltrow', '344335518');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000093, 'Molly', 'Li', '183387453');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000094, 'Talvin', 'Chaykin', '995878518');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000095, 'Jamie', 'Loggins', '251518919');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000096, 'Holly', 'Breslin', '134584922');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000097, 'Leslie', 'Hynde', '999232467');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000098, 'Chrissie', 'Van Helden', '829538211');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000099, 'Merrill', 'Dorff', '843225288');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000100, 'Alec', 'Rosas', '813437575');
commit;
prompt 300 records committed...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000101, 'Stellan', 'Unger', '225221777');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000102, 'Cheryl', 'Lennox', '721847487');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000103, 'Millie', 'Nugent', '236655992');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000104, 'Allison', 'Rowlands', '116748388');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000105, 'Johnette', 'Baldwin', '739421398');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000106, 'Ike', 'Rodriguez', '629552852');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000107, 'Rade', 'McGregor', '636154441');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000108, 'Aidan', 'McCabe', '214281155');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000109, 'Geraldine', 'Gershon', '752383641');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000110, 'Fred', 'Guinness', '256463384');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000111, 'Beverley', 'Hewett', '485397698');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000112, 'Machine', 'Winger', '332459374');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000113, 'Rutger', 'Diffie', '472591918');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000114, 'Bo', 'Stiers', '317821139');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000115, 'Tony', 'Williams', '411745992');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000116, 'Pelvic', 'Flatts', '899661981');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000117, 'Harvey', 'Pollak', '834465134');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000118, 'Brooke', 'Donovan', '321142486');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000119, 'Harrison', 'Payton', '842941424');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000120, 'Lloyd', 'Bruce', '687971876');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000121, 'Juan', 'Chilton', '756372144');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000122, 'Lindsay', 'McCracken', '313544133');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000123, 'Austin', 'Edmunds', '636491948');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000124, 'Wendy', 'Richardson', '141545122');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000125, 'Scarlett', 'Orbit', '497297112');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000126, 'Hank', 'Adler', '626287993');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000127, 'Alannah', 'Rea', '679733458');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000128, 'Roberta', 'Sinatra', '667665927');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000129, 'Maxine', 'Benson', '819456655');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000130, 'Jonny Lee', 'Duschel', '937144473');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000131, 'Shannyn', 'Beck', '725538617');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000132, 'Dustin', 'Weiss', '722115351');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000133, 'Brian', 'DeVita', '452287315');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000134, 'Henry', 'Leary', '179835486');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000135, 'Maria', 'Chan', '722353956');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000136, 'Albert', 'Mantegna', '811193448');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000137, 'Jeroen', 'Spine', '262178418');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000138, 'Harris', 'Zellweger', '492339315');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000139, 'Barry', 'Jeffreys', '181298871');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000140, 'Amanda', 'Stevenson', '834619158');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000141, 'Janeane', 'Hurt', '427214454');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000142, 'Kristin', 'Wilson', '227648713');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000143, 'Jackie', 'Busey', '744477538');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000144, 'Brendan', 'Spine', '668355221');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000145, 'Will', 'Davies', '249298727');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000146, 'Ted', 'Utada', '259664335');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000147, 'Merrill', 'Hershey', '629191378');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000148, 'Maury', 'Clark', '617499796');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000149, 'Cloris', 'Mazzello', '558384935');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000150, 'Edwin', 'Sayer', '487164997');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000151, 'Richie', 'Clayton', '921316944');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000152, 'Donal', 'Barrymore', '522497194');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000153, 'Tea', 'Nelson', '129277937');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000154, 'Chely', 'Ceasar', '653888737');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000155, 'Casey', 'Cozier', '993721998');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000156, 'Barbara', 'Begley', '739392863');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000157, 'Jared', 'Leary', '879486437');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000158, 'Irene', 'Witherspoon', '487583641');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000159, 'Shelby', 'Adkins', '996954977');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000160, 'Simon', 'Shaye', '485149197');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000161, 'Leslie', 'Dunaway', '162149687');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000162, 'Elvis', 'Capshaw', '911348158');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000163, 'Vivica', 'Dukakis', '426281156');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000164, 'Lara', 'DeVito', '588284149');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000165, 'Bonnie', 'Lucien', '324373113');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000166, 'Noah', 'Bradford', '729115749');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000167, 'Carol', 'Simpson', '383662937');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000168, 'Fred', 'von Sydow', '825682362');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000169, 'Patti', 'LaBelle', '792882886');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000170, 'Loren', 'Rispoli', '514297675');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000171, 'Vivica', 'Herrmann', '565828231');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000172, 'Stewart', 'Sarandon', '836814132');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000173, 'Pete', 'Ellis', '471882534');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000174, 'Rosanne', 'Sandler', '554219964');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000175, 'Charlton', 'Sutherland', '693591959');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000176, 'Jaime', 'Van Damme', '447314648');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000177, 'Walter', 'Lange', '268973469');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000178, 'Robbie', 'urban', '825988737');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000179, 'Rhea', 'Davidson', '159422385');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000180, 'Regina', 'Dzundza', '696749195');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000181, 'Udo', 'David', '653968138');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000182, 'Jeffery', 'Atkins', '163874939');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000183, 'Illeana', 'Englund', '768926871');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000184, 'Stephen', 'Van Helden', '646317664');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000185, 'Howard', 'Ingram', '976651831');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000186, 'Owen', 'Martinez', '755713335');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000187, 'Joy', 'Thewlis', '362823252');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000188, 'Oded', 'Pleasence', '711251556');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000189, 'Brad', 'Cornell', '295299648');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000190, 'Stellan', 'Mazar', '335354551');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000191, 'April', 'Dysart', '134761123');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000192, 'Joanna', 'Magnuson', '549927879');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000193, 'Carol', 'Mathis', '665765376');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000194, 'Charles', 'Kinski', '315478724');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000195, 'CeCe', 'Fox', '158821815');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000196, 'Stanley', 'Spears', '245857143');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000197, 'Shelby', 'Macy', '568385411');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000198, 'Ty', 'Grant', '863983173');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000199, 'Shannon', 'Parm', '619894746');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000200, 'Sona', 'Sepulveda', '237996911');
commit;
prompt 400 records loaded
prompt Loading COMMUNITY...
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (1, 3382, 'Beit Knesset', '341731534');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (2, 3476, 'Kehila', '451911393');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (3, 2571, 'Kehila', '796697373');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (4, 2072, 'Neighborhood', '777838796');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (5, 1618, 'Kehila', '126998789');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (6, 3352, 'Kehila', '661315165');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (7, 2619, 'Kehila', '685569465');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (8, 2876, 'Beit Knesset', '364373528');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (9, 2789, 'Neighborhood', '893627769');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (10, 4289, 'Beit Knesset', '471997979');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (11, 3748, 'Neighborhood', '125634364');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (12, 1540, 'Beit Knesset', '588753958');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (13, 4335, 'Kehila', '359293578');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (14, 4539, 'Kehila', '244849558');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (15, 1163, 'Beit Knesset', '659557635');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (16, 2191, 'Kehila', '859638477');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (17, 1619, 'Neighborhood', '968845448');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (18, 1314, 'Beit Knesset', '942163524');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (19, 2312, 'Neighborhood', '562614785');
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number)
values (20, 1503, 'Neighborhood', '787488753');
commit;
prompt 20 records loaded
prompt Loading COMMUNITYMEMBER...
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('586 Joely Ave', to_date('03-10-1975', 'dd-mm-yyyy'), 173, 3, 100000332);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('91st Street', to_date('06-02-1975', 'dd-mm-yyyy'), 174, 2, 100000007);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('92nd Street', to_date('17-04-1971', 'dd-mm-yyyy'), 175, 6, 100000267);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('689 Alfie Road', to_date('30-03-1983', 'dd-mm-yyyy'), 176, 10, 100000146);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('18 Winter Drive', to_date('15-01-1997', 'dd-mm-yyyy'), 177, 18, 100000396);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('81 Cummings Street', to_date('20-11-1988', 'dd-mm-yyyy'), 178, 19, 100000194);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('46 Annette', to_date('25-07-1993', 'dd-mm-yyyy'), 179, 19, 100000340);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('1 Andie Drive', to_date('31-12-2003', 'dd-mm-yyyy'), 180, 17, 100000054);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('77 Lea Ave', to_date('23-01-1975', 'dd-mm-yyyy'), 181, 17, 100000103);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('90 Robin', to_date('18-11-1990', 'dd-mm-yyyy'), 182, 8, 100000075);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('20 Badalucco Ave', to_date('10-08-1981', 'dd-mm-yyyy'), 183, 11, 100000278);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('611 Ronnie', to_date('11-09-1978', 'dd-mm-yyyy'), 184, 6, 100000219);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('548 Mann Drive', to_date('03-09-1972', 'dd-mm-yyyy'), 185, 3, 100000370);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('9 Alexandria Blvd', to_date('22-02-1999', 'dd-mm-yyyy'), 186, 2, 100000091);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('35 Rene Blvd', to_date('26-11-1993', 'dd-mm-yyyy'), 187, 10, 100000170);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('36 Moss', to_date('12-03-2000', 'dd-mm-yyyy'), 188, 6, 100000288);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('1 Kershaw Drive', to_date('14-05-1982', 'dd-mm-yyyy'), 189, 10, 100000016);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('328 Harrison Street', to_date('22-03-1988', 'dd-mm-yyyy'), 190, 19, 100000331);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('28 Derrick Drive', to_date('03-06-1978', 'dd-mm-yyyy'), 191, 13, 100000211);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('40 Brent Street', to_date('13-04-1977', 'dd-mm-yyyy'), 192, 13, 100000153);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('73 Jovovich Road', to_date('30-01-1973', 'dd-mm-yyyy'), 193, 12, 100000361);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('83 Broadbent Road', to_date('04-05-1965', 'dd-mm-yyyy'), 194, 2, 100000173);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('124 Scott Road', to_date('03-09-1990', 'dd-mm-yyyy'), 195, 11, 100000161);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('223 Mickey', to_date('19-06-1990', 'dd-mm-yyyy'), 196, 20, 100000301);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('32 Kapanka Road', to_date('22-07-1989', 'dd-mm-yyyy'), 197, 4, 100000347);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('467 Nicholson Road', to_date('24-03-1970', 'dd-mm-yyyy'), 198, 4, 100000205);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('13 Mechelen Drive', to_date('10-05-2000', 'dd-mm-yyyy'), 199, 20, 100000316);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('35 Nuernberg Ave', to_date('15-01-1964', 'dd-mm-yyyy'), 200, 11, 100000090);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('72nd Street', to_date('14-10-2001', 'dd-mm-yyyy'), 1, 12, 100000223);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('11 Summer Street', to_date('04-09-1961', 'dd-mm-yyyy'), 2, 8, 100000170);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('57 McDonald Street', to_date('24-03-1961', 'dd-mm-yyyy'), 3, 9, 100000371);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('96 Martin Street', to_date('04-07-1967', 'dd-mm-yyyy'), 4, 4, 100000131);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('38 Marshall Road', to_date('20-11-2004', 'dd-mm-yyyy'), 5, 12, 100000257);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('89 Keeslar Drive', to_date('05-04-1999', 'dd-mm-yyyy'), 6, 9, 100000381);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('61st Street', to_date('06-09-2001', 'dd-mm-yyyy'), 7, 18, 100000080);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('989 Zahn Drive', to_date('29-01-1984', 'dd-mm-yyyy'), 8, 14, 100000143);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('63 Tokushima Road', to_date('18-05-1966', 'dd-mm-yyyy'), 9, 6, 100000392);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('98 Luedenscheid Drive', to_date('04-07-1987', 'dd-mm-yyyy'), 10, 11, 100000344);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('17 Keener Street', to_date('08-09-1969', 'dd-mm-yyyy'), 11, 11, 100000338);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('38 Nathan Drive', to_date('27-07-1961', 'dd-mm-yyyy'), 12, 4, 100000297);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('92nd Street', to_date('01-11-1988', 'dd-mm-yyyy'), 13, 1, 100000236);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('32 Shreveport Ave', to_date('20-10-1960', 'dd-mm-yyyy'), 14, 4, 100000196);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('88 Jackie Drive', to_date('22-04-1995', 'dd-mm-yyyy'), 15, 19, 100000164);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('44 Mason Street', to_date('06-07-1986', 'dd-mm-yyyy'), 16, 19, 100000261);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('75 Shannon Road', to_date('22-05-1974', 'dd-mm-yyyy'), 17, 13, 100000088);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('31 Jeremy Drive', to_date('24-08-1990', 'dd-mm-yyyy'), 18, 3, 100000216);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('16 Hatchet Drive', to_date('27-05-1977', 'dd-mm-yyyy'), 19, 5, 100000353);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('76 Satriani Road', to_date('09-11-1995', 'dd-mm-yyyy'), 20, 13, 100000103);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('37 Lorraine Drive', to_date('06-12-1993', 'dd-mm-yyyy'), 21, 4, 100000355);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('100 Forrest Ave', to_date('29-02-2000', 'dd-mm-yyyy'), 22, 15, 100000252);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('168 AniÃ¨res Drive', to_date('22-06-1999', 'dd-mm-yyyy'), 23, 17, 100000255);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('386 Rachid Street', to_date('30-08-1973', 'dd-mm-yyyy'), 24, 1, 100000225);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('413 Keener Drive', to_date('12-10-1971', 'dd-mm-yyyy'), 25, 2, 100000228);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('40 Cube Drive', to_date('17-10-1989', 'dd-mm-yyyy'), 26, 8, 100000006);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('98 Santa Clarita Ave', to_date('14-06-2002', 'dd-mm-yyyy'), 27, 20, 100000220);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('88 Sutherland', to_date('12-01-1966', 'dd-mm-yyyy'), 28, 16, 100000377);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('62nd Street', to_date('30-05-1994', 'dd-mm-yyyy'), 29, 18, 100000005);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('8 Garcia Ave', to_date('07-05-1967', 'dd-mm-yyyy'), 30, 6, 100000267);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('290 Coburn Drive', to_date('21-04-1970', 'dd-mm-yyyy'), 31, 7, 100000229);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('81 Mathis Street', to_date('15-10-1998', 'dd-mm-yyyy'), 32, 1, 100000187);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('97 West Monroe Drive', to_date('20-06-1991', 'dd-mm-yyyy'), 33, 20, 100000004);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('76 Blaine', to_date('24-01-1972', 'dd-mm-yyyy'), 34, 20, 100000133);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('86 Chemnitz Street', to_date('13-09-1980', 'dd-mm-yyyy'), 35, 7, 100000359);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('15 Dalley Street', to_date('17-05-2004', 'dd-mm-yyyy'), 36, 6, 100000371);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('528 Mantova Ave', to_date('07-09-1981', 'dd-mm-yyyy'), 37, 9, 100000150);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('31 Horb', to_date('18-06-2003', 'dd-mm-yyyy'), 38, 19, 100000233);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('61st Street', to_date('30-12-1981', 'dd-mm-yyyy'), 39, 18, 100000272);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('33rd Street', to_date('25-01-1981', 'dd-mm-yyyy'), 40, 15, 100000225);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('90 Marina Road', to_date('19-10-1962', 'dd-mm-yyyy'), 41, 2, 100000141);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('30 Thornton', to_date('09-05-1982', 'dd-mm-yyyy'), 42, 14, 100000330);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('90 Napolitano Street', to_date('11-02-1960', 'dd-mm-yyyy'), 43, 8, 100000367);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('4 Londrina Drive', to_date('14-09-1986', 'dd-mm-yyyy'), 44, 4, 100000394);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('40 EisenhÃ¼ttenstadt Drive', to_date('22-02-1981', 'dd-mm-yyyy'), 45, 2, 100000269);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('94 Pleasure Road', to_date('05-08-1966', 'dd-mm-yyyy'), 46, 14, 100000019);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('17 Wheel Road', to_date('28-09-1987', 'dd-mm-yyyy'), 47, 20, 100000236);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('48 Brody Road', to_date('31-07-1984', 'dd-mm-yyyy'), 48, 2, 100000156);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('90 Osbourne Street', to_date('22-01-1969', 'dd-mm-yyyy'), 49, 13, 100000013);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('57 Tomei Road', to_date('16-11-1979', 'dd-mm-yyyy'), 50, 17, 100000183);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('52 English Street', to_date('05-02-1964', 'dd-mm-yyyy'), 51, 7, 100000055);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('980 Milton Road', to_date('14-01-1981', 'dd-mm-yyyy'), 52, 15, 100000250);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('89 Henstridge Ave', to_date('27-06-1965', 'dd-mm-yyyy'), 53, 15, 100000046);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('75 Rickles Street', to_date('08-08-1981', 'dd-mm-yyyy'), 54, 4, 100000287);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('364 Kelli Road', to_date('14-08-1963', 'dd-mm-yyyy'), 55, 12, 100000134);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('29 Redwood City Ave', to_date('12-06-1980', 'dd-mm-yyyy'), 56, 11, 100000307);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('708 Vienna Road', to_date('11-07-1993', 'dd-mm-yyyy'), 57, 10, 100000129);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('55 Garza Road', to_date('16-03-2000', 'dd-mm-yyyy'), 58, 15, 100000084);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('71 Rose Road', to_date('04-01-1999', 'dd-mm-yyyy'), 59, 9, 100000259);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('749 O''Neal Street', to_date('24-05-1995', 'dd-mm-yyyy'), 60, 7, 100000124);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('12 Storrington Drive', to_date('28-01-1992', 'dd-mm-yyyy'), 61, 9, 100000145);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('72nd Street', to_date('19-09-1983', 'dd-mm-yyyy'), 62, 19, 100000336);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('81 Delta Road', to_date('26-09-2001', 'dd-mm-yyyy'), 63, 4, 100000055);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('99 Oakland Street', to_date('02-04-1989', 'dd-mm-yyyy'), 64, 4, 100000198);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('8 Loreena Street', to_date('07-12-1983', 'dd-mm-yyyy'), 65, 15, 100000371);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('40 Ike Ave', to_date('16-04-1979', 'dd-mm-yyyy'), 66, 20, 100000354);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('27 Angela Road', to_date('01-08-1989', 'dd-mm-yyyy'), 67, 13, 100000076);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('24 Ronnie Blvd', to_date('21-07-1986', 'dd-mm-yyyy'), 68, 8, 100000262);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('76 Bell Street', to_date('29-03-2000', 'dd-mm-yyyy'), 69, 14, 100000373);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('606 Heron Drive', to_date('13-10-1990', 'dd-mm-yyyy'), 70, 4, 100000050);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('821 Oslo', to_date('13-04-2000', 'dd-mm-yyyy'), 71, 16, 100000069);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('82nd Street', to_date('30-10-1979', 'dd-mm-yyyy'), 72, 19, 100000234);
commit;
prompt 100 records committed...
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('70 Louisville Blvd', to_date('01-12-1985', 'dd-mm-yyyy'), 73, 13, 100000200);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('953 Bonham Street', to_date('08-06-2004', 'dd-mm-yyyy'), 74, 17, 100000172);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('64 Hayes Drive', to_date('09-06-1962', 'dd-mm-yyyy'), 75, 8, 100000218);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('97 Cate Street', to_date('02-02-1989', 'dd-mm-yyyy'), 76, 20, 100000037);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('21 Murdock Street', to_date('22-01-1973', 'dd-mm-yyyy'), 77, 19, 100000232);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('26 Brando', to_date('10-02-1993', 'dd-mm-yyyy'), 78, 15, 100000311);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('81st Street', to_date('03-07-1998', 'dd-mm-yyyy'), 79, 20, 100000273);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('2 Rauhofer Street', to_date('19-04-2003', 'dd-mm-yyyy'), 80, 14, 100000122);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('81st Street', to_date('30-08-1976', 'dd-mm-yyyy'), 81, 11, 100000388);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('93rd Street', to_date('12-11-2002', 'dd-mm-yyyy'), 82, 6, 100000225);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('147 Selma Drive', to_date('08-02-1993', 'dd-mm-yyyy'), 83, 1, 100000243);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('43 Bening Blvd', to_date('21-09-1967', 'dd-mm-yyyy'), 84, 13, 100000148);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('28 Dwight Drive', to_date('27-06-1997', 'dd-mm-yyyy'), 85, 16, 100000201);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('34 Juliet Street', to_date('10-08-2000', 'dd-mm-yyyy'), 86, 10, 100000098);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('12 Fukushima', to_date('23-04-1996', 'dd-mm-yyyy'), 87, 2, 100000315);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('68 Leelee Ave', to_date('30-03-1993', 'dd-mm-yyyy'), 88, 7, 100000041);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('30 Caan Street', to_date('16-12-1960', 'dd-mm-yyyy'), 89, 7, 100000333);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('44 Orlando Drive', to_date('27-11-1962', 'dd-mm-yyyy'), 90, 6, 100000028);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('34 LaMond Street', to_date('23-06-1967', 'dd-mm-yyyy'), 91, 5, 100000062);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('56 Dean Ave', to_date('10-05-1995', 'dd-mm-yyyy'), 92, 18, 100000193);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('28 Heather', to_date('29-12-1974', 'dd-mm-yyyy'), 93, 1, 100000229);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('58 Bernex Road', to_date('07-09-1971', 'dd-mm-yyyy'), 94, 16, 100000243);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('84 Wes Blvd', to_date('15-02-1999', 'dd-mm-yyyy'), 95, 11, 100000371);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('47 Andrea', to_date('31-12-1981', 'dd-mm-yyyy'), 96, 14, 100000055);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('58 Atkins Road', to_date('16-04-1976', 'dd-mm-yyyy'), 97, 1, 100000056);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('3 North Sydney Blvd', to_date('11-04-1972', 'dd-mm-yyyy'), 98, 1, 100000236);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('241 Mortensen', to_date('30-01-1970', 'dd-mm-yyyy'), 99, 1, 100000131);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('31 Coburn Street', to_date('19-07-1987', 'dd-mm-yyyy'), 100, 9, 100000134);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('12nd Street', to_date('21-03-1980', 'dd-mm-yyyy'), 101, 2, 100000236);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('37 Studi Road', to_date('24-01-1979', 'dd-mm-yyyy'), 102, 19, 100000106);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('74 Kaysville Road', to_date('12-06-1960', 'dd-mm-yyyy'), 103, 18, 100000198);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('523 Buffalo Street', to_date('19-10-1995', 'dd-mm-yyyy'), 104, 7, 100000004);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('59 Warburton Road', to_date('02-10-2001', 'dd-mm-yyyy'), 105, 17, 100000008);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('96 Doug', to_date('01-05-1969', 'dd-mm-yyyy'), 106, 11, 100000182);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('950 Vienna Road', to_date('14-05-1987', 'dd-mm-yyyy'), 107, 16, 100000033);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('41 MacIsaac Street', to_date('08-01-1969', 'dd-mm-yyyy'), 108, 3, 100000178);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('32nd Street', to_date('19-12-1961', 'dd-mm-yyyy'), 109, 6, 100000245);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('951 Jenkins Street', to_date('12-10-1995', 'dd-mm-yyyy'), 110, 8, 100000319);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('29 Gettysburg Street', to_date('03-12-1999', 'dd-mm-yyyy'), 111, 20, 100000081);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('71 Rodriguez Street', to_date('11-02-1975', 'dd-mm-yyyy'), 112, 13, 100000013);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('1 Ammons Drive', to_date('09-07-1964', 'dd-mm-yyyy'), 113, 19, 100000381);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('12nd Street', to_date('26-04-1977', 'dd-mm-yyyy'), 114, 9, 100000147);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('94 Lindo Street', to_date('21-01-2004', 'dd-mm-yyyy'), 115, 16, 100000168);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('39 Rosas Street', to_date('26-12-1978', 'dd-mm-yyyy'), 116, 2, 100000311);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('29 Mickey Street', to_date('01-03-1982', 'dd-mm-yyyy'), 117, 19, 100000308);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('43 Edenbridge Drive', to_date('03-07-1993', 'dd-mm-yyyy'), 118, 7, 100000322);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('30 Derrick Ave', to_date('02-04-1960', 'dd-mm-yyyy'), 119, 9, 100000123);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('87 Stuart Street', to_date('04-07-1969', 'dd-mm-yyyy'), 120, 19, 100000159);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('5 Holly Road', to_date('22-02-1966', 'dd-mm-yyyy'), 121, 5, 100000195);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('3 Cocker', to_date('21-11-2000', 'dd-mm-yyyy'), 122, 13, 100000318);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('69 Smith', to_date('10-03-1978', 'dd-mm-yyyy'), 123, 8, 100000320);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('7 Costello Road', to_date('28-02-1989', 'dd-mm-yyyy'), 124, 15, 100000089);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('55 Itu Drive', to_date('07-01-2004', 'dd-mm-yyyy'), 125, 5, 100000151);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('92 Skerritt Blvd', to_date('22-05-1966', 'dd-mm-yyyy'), 126, 12, 100000094);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('93 Fairbanks Road', to_date('01-01-2001', 'dd-mm-yyyy'), 127, 11, 100000280);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('97 Shoreline', to_date('17-04-1968', 'dd-mm-yyyy'), 128, 12, 100000222);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('31st Street', to_date('29-11-1980', 'dd-mm-yyyy'), 129, 18, 100000033);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('3 Edwin Blvd', to_date('24-09-1961', 'dd-mm-yyyy'), 130, 20, 100000353);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('24 MacIsaac Blvd', to_date('02-05-1971', 'dd-mm-yyyy'), 131, 2, 100000149);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('2 Conners Street', to_date('01-02-1962', 'dd-mm-yyyy'), 132, 6, 100000355);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('16 Alexander Road', to_date('25-06-1971', 'dd-mm-yyyy'), 133, 7, 100000203);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('61 Estevez Ave', to_date('12-02-1981', 'dd-mm-yyyy'), 134, 10, 100000375);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('87 Charlize Blvd', to_date('16-11-1997', 'dd-mm-yyyy'), 135, 11, 100000397);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('72 Bristol Road', to_date('26-06-1961', 'dd-mm-yyyy'), 136, 14, 100000137);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('448 Collie Blvd', to_date('16-06-2004', 'dd-mm-yyyy'), 137, 11, 100000313);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('26 Neville Drive', to_date('03-08-1987', 'dd-mm-yyyy'), 138, 5, 100000320);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('4 MÃ¶nchengladbach Road', to_date('28-02-1977', 'dd-mm-yyyy'), 139, 1, 100000372);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('563 Bartlesville Street', to_date('04-02-1961', 'dd-mm-yyyy'), 140, 5, 100000142);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('17 Anderson Blvd', to_date('28-08-1972', 'dd-mm-yyyy'), 141, 16, 100000323);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('33rd Street', to_date('14-05-1961', 'dd-mm-yyyy'), 142, 10, 100000085);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('23 Nathan Ave', to_date('28-11-2001', 'dd-mm-yyyy'), 143, 7, 100000390);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('61 Williams', to_date('07-05-1999', 'dd-mm-yyyy'), 144, 19, 100000305);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('9 Goodall Street', to_date('31-01-1962', 'dd-mm-yyyy'), 145, 7, 100000195);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('20 Burmester Road', to_date('09-09-1998', 'dd-mm-yyyy'), 146, 19, 100000196);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('77 Brendan', to_date('17-04-1970', 'dd-mm-yyyy'), 147, 7, 100000127);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('5 Weir Street', to_date('11-01-1971', 'dd-mm-yyyy'), 148, 8, 100000195);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('56 Goiania Road', to_date('07-11-1978', 'dd-mm-yyyy'), 149, 15, 100000049);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('64 Bracco Road', to_date('24-01-1992', 'dd-mm-yyyy'), 150, 17, 100000266);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('1 Alan Blvd', to_date('19-02-1990', 'dd-mm-yyyy'), 151, 17, 100000368);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('55 Wes Blvd', to_date('15-08-2001', 'dd-mm-yyyy'), 152, 5, 100000065);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('89 Fukui Blvd', to_date('17-10-2002', 'dd-mm-yyyy'), 153, 9, 100000209);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('69 Margolyes Road', to_date('19-09-1967', 'dd-mm-yyyy'), 154, 10, 100000115);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('54 Marie Drive', to_date('21-06-2002', 'dd-mm-yyyy'), 155, 15, 100000047);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('1 Cumming', to_date('18-08-1984', 'dd-mm-yyyy'), 156, 14, 100000197);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('362 Saul Road', to_date('09-04-1996', 'dd-mm-yyyy'), 157, 9, 100000300);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('257 Macy Street', to_date('01-04-1983', 'dd-mm-yyyy'), 158, 19, 100000386);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('9 Posener Ave', to_date('07-08-1978', 'dd-mm-yyyy'), 159, 20, 100000381);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('26 Nick Road', to_date('03-06-1966', 'dd-mm-yyyy'), 160, 12, 100000236);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('69 Pepper Street', to_date('12-05-1973', 'dd-mm-yyyy'), 161, 3, 100000250);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('3 Hilton Road', to_date('28-01-1994', 'dd-mm-yyyy'), 162, 10, 100000031);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('100 Malcolm Drive', to_date('08-09-1999', 'dd-mm-yyyy'), 163, 20, 100000009);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('521 Kongserbg Road', to_date('05-11-1993', 'dd-mm-yyyy'), 164, 7, 100000240);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('401 Essen Blvd', to_date('03-05-1969', 'dd-mm-yyyy'), 165, 17, 100000303);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('10 Leeds Ave', to_date('05-11-1978', 'dd-mm-yyyy'), 166, 2, 100000030);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('79 Cattrall Ave', to_date('26-01-1975', 'dd-mm-yyyy'), 167, 2, 100000387);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('27 Nightingale Road', to_date('09-01-1996', 'dd-mm-yyyy'), 168, 9, 100000298);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('454 Peebles Street', to_date('07-08-1961', 'dd-mm-yyyy'), 169, 15, 100000065);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('868 Forrest Road', to_date('14-12-1991', 'dd-mm-yyyy'), 170, 2, 100000184);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('525 Hartmannsdorf Street', to_date('31-01-1961', 'dd-mm-yyyy'), 171, 6, 100000382);
insert into COMMUNITYMEMBER (address, date_of_birth, member_id, community_id, person_id)
values ('6 Mellencamp Street', to_date('27-08-1987', 'dd-mm-yyyy'), 172, 20, 100000251);
commit;
prompt 200 records loaded
prompt Loading BIRTH...
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (164, to_date('21-07-2022', 'dd-mm-yyyy'), 11, 'both spouses work', 72);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (165, to_date('19-08-2020', 'dd-mm-yyyy'), 8, 'both spouses work', 188);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (166, to_date('24-08-2023', 'dd-mm-yyyy'), 6, 'special child', 49);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (167, to_date('11-04-2023', 'dd-mm-yyyy'), 7, 'one spouse works', 103);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (168, to_date('29-08-2021', 'dd-mm-yyyy'), 7, 'special child', 126);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (169, to_date('20-01-2022', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 175);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (170, to_date('11-05-2020', 'dd-mm-yyyy'), 11, 'special child', 54);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (171, to_date('18-09-2021', 'dd-mm-yyyy'), 6, 'one spouse works', 190);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (172, to_date('15-08-2023', 'dd-mm-yyyy'), 11, 'special child', 94);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (173, to_date('27-11-2022', 'dd-mm-yyyy'), 2, 'one spouse works', 194);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (174, to_date('12-01-2021', 'dd-mm-yyyy'), 6, 'both spouses work', 128);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (175, to_date('24-02-2021', 'dd-mm-yyyy'), 2, 'both spouses work', 181);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (176, to_date('22-01-2020', 'dd-mm-yyyy'), 2, 'special child', 34);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (177, to_date('05-07-2021', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 48);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (178, to_date('15-05-2023', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 116);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (179, to_date('13-06-2020', 'dd-mm-yyyy'), 8, 'special child', 16);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (180, to_date('10-11-2021', 'dd-mm-yyyy'), 3, 'special child', 9);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (181, to_date('21-01-2021', 'dd-mm-yyyy'), 9, 'both spouses work', 103);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (182, to_date('18-01-2021', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 33);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (183, to_date('18-04-2024', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 70);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (184, to_date('02-06-2021', 'dd-mm-yyyy'), 1, 'special child', 21);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (185, to_date('16-09-2022', 'dd-mm-yyyy'), 4, 'one spouse works', 25);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (186, to_date('19-04-2023', 'dd-mm-yyyy'), 9, 'special child', 4);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (187, to_date('03-02-2023', 'dd-mm-yyyy'), 7, 'one spouse works', 87);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (188, to_date('05-01-2021', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 154);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (189, to_date('12-02-2023', 'dd-mm-yyyy'), 3, 'both spouses work', 119);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (190, to_date('13-07-2021', 'dd-mm-yyyy'), 5, 'one spouse works', 3);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (191, to_date('28-04-2021', 'dd-mm-yyyy'), 11, 'one spouse works', 118);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (192, to_date('09-07-2021', 'dd-mm-yyyy'), 4, 'both spouses work', 108);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (193, to_date('04-10-2020', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 67);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (194, to_date('25-02-2022', 'dd-mm-yyyy'), 1, 'one spouse works', 190);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (195, to_date('14-11-2021', 'dd-mm-yyyy'), 4, 'special child', 58);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (196, to_date('03-05-2024', 'dd-mm-yyyy'), 6, 'special child', 134);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (197, to_date('16-04-2022', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 64);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (198, to_date('12-01-2022', 'dd-mm-yyyy'), 2, 'special child', 47);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (199, to_date('05-07-2023', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 186);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (200, to_date('30-01-2020', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 180);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (201, to_date('28-05-2022', 'dd-mm-yyyy'), 12, 'both spouses work', 155);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (202, to_date('28-08-2023', 'dd-mm-yyyy'), 8, 'one spouse works', 116);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (203, to_date('10-11-2022', 'dd-mm-yyyy'), 8, 'one spouse works', 100);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (204, to_date('20-05-2021', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 17);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (205, to_date('05-06-2023', 'dd-mm-yyyy'), 3, 'both spouses work', 175);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (206, to_date('31-10-2023', 'dd-mm-yyyy'), 2, 'one spouse works', 137);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (207, to_date('14-09-2020', 'dd-mm-yyyy'), 5, 'one spouse works', 53);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (208, to_date('25-09-2020', 'dd-mm-yyyy'), 5, 'special child', 189);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (209, to_date('28-12-2023', 'dd-mm-yyyy'), 12, 'both spouses work', 82);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (210, to_date('11-01-2020', 'dd-mm-yyyy'), 9, 'both spouses work', 186);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (211, to_date('07-12-2023', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 97);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (212, to_date('07-04-2023', 'dd-mm-yyyy'), 1, 'both spouses work', 139);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (213, to_date('23-12-2020', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 103);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (214, to_date('10-02-2021', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 12);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (215, to_date('05-01-2021', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 13);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (216, to_date('24-03-2022', 'dd-mm-yyyy'), 10, 'one spouse works', 153);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (217, to_date('10-04-2020', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 59);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (218, to_date('04-11-2022', 'dd-mm-yyyy'), 3, 'both spouses work', 173);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (219, to_date('05-08-2023', 'dd-mm-yyyy'), 10, 'Family in need of extra financial help', 53);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (220, to_date('21-12-2022', 'dd-mm-yyyy'), 5, 'one spouse works', 98);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (221, to_date('14-01-2021', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 116);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (222, to_date('03-01-2023', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 176);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (223, to_date('07-05-2024', 'dd-mm-yyyy'), 5, 'special child', 75);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (224, to_date('28-10-2022', 'dd-mm-yyyy'), 6, 'special child', 155);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (225, to_date('25-01-2022', 'dd-mm-yyyy'), 12, 'both spouses work', 111);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (226, to_date('11-05-2023', 'dd-mm-yyyy'), 1, 'both spouses work', 14);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (227, to_date('14-12-2020', 'dd-mm-yyyy'), 7, 'special child', 83);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (228, to_date('02-11-2021', 'dd-mm-yyyy'), 7, 'both spouses work', 161);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (229, to_date('15-09-2023', 'dd-mm-yyyy'), 2, 'one spouse works', 98);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (230, to_date('24-09-2022', 'dd-mm-yyyy'), 4, 'special child', 100);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (231, to_date('02-06-2022', 'dd-mm-yyyy'), 12, 'one spouse works', 163);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (232, to_date('22-04-2020', 'dd-mm-yyyy'), 9, 'both spouses work', 144);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (233, to_date('17-12-2020', 'dd-mm-yyyy'), 6, 'both spouses work', 80);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (234, to_date('15-05-2023', 'dd-mm-yyyy'), 3, 'one spouse works', 10);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (235, to_date('28-02-2020', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 20);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (236, to_date('16-09-2020', 'dd-mm-yyyy'), 4, 'both spouses work', 60);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (237, to_date('30-01-2023', 'dd-mm-yyyy'), 5, 'one spouse works', 148);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (238, to_date('16-01-2024', 'dd-mm-yyyy'), 9, 'one spouse works', 17);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (239, to_date('13-10-2020', 'dd-mm-yyyy'), 11, 'both spouses work', 118);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (240, to_date('18-10-2020', 'dd-mm-yyyy'), 5, 'both spouses work', 134);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (241, to_date('10-03-2020', 'dd-mm-yyyy'), 7, 'special child', 22);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (242, to_date('24-12-2021', 'dd-mm-yyyy'), 7, 'one spouse works', 30);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (243, to_date('26-07-2021', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 13);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (244, to_date('11-05-2024', 'dd-mm-yyyy'), 11, 'one spouse works', 192);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (245, to_date('04-07-2020', 'dd-mm-yyyy'), 3, 'special child', 181);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (246, to_date('10-08-2023', 'dd-mm-yyyy'), 4, 'one spouse works', 130);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (247, to_date('18-03-2021', 'dd-mm-yyyy'), 1, 'both spouses work', 96);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (248, to_date('08-02-2021', 'dd-mm-yyyy'), 10, 'both spouses work', 4);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (249, to_date('26-05-2021', 'dd-mm-yyyy'), 1, 'special child', 10);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (250, to_date('10-01-2020', 'dd-mm-yyyy'), 11, 'both spouses work', 109);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (251, to_date('30-09-2021', 'dd-mm-yyyy'), 1, 'one spouse works', 126);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (252, to_date('09-11-2023', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 19);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (253, to_date('22-02-2020', 'dd-mm-yyyy'), 1, 'one spouse works', 127);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (254, to_date('19-03-2024', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 5);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (255, to_date('05-09-2021', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 169);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (256, to_date('25-12-2021', 'dd-mm-yyyy'), 7, 'one spouse works', 102);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (257, to_date('31-03-2020', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 131);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (258, to_date('22-01-2020', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 45);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (259, to_date('18-04-2022', 'dd-mm-yyyy'), 2, 'one spouse works', 137);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (260, to_date('04-01-2023', 'dd-mm-yyyy'), 3, 'both spouses work', 70);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (261, to_date('01-03-2020', 'dd-mm-yyyy'), 10, 'special child', 132);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (262, to_date('27-07-2021', 'dd-mm-yyyy'), 3, 'one spouse works', 175);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (263, to_date('17-10-2020', 'dd-mm-yyyy'), 3, 'special child', 125);
commit;
prompt 100 records committed...
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (264, to_date('08-09-2023', 'dd-mm-yyyy'), 12, 'one spouse works', 36);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (265, to_date('12-01-2024', 'dd-mm-yyyy'), 3, 'both spouses work', 91);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (266, to_date('09-12-2021', 'dd-mm-yyyy'), 6, 'both spouses work', 3);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (267, to_date('08-01-2021', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 144);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (268, to_date('25-09-2020', 'dd-mm-yyyy'), 9, 'special child', 139);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (269, to_date('23-07-2021', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 158);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (270, to_date('26-11-2021', 'dd-mm-yyyy'), 6, 'both spouses work', 136);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (271, to_date('07-03-2022', 'dd-mm-yyyy'), 7, 'both spouses work', 65);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (272, to_date('04-08-2021', 'dd-mm-yyyy'), 7, 'special child', 86);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (273, to_date('28-10-2020', 'dd-mm-yyyy'), 5, 'special child', 8);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (274, to_date('08-11-2022', 'dd-mm-yyyy'), 2, 'special child', 115);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (275, to_date('03-10-2020', 'dd-mm-yyyy'), 6, 'special child', 155);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (276, to_date('15-04-2024', 'dd-mm-yyyy'), 10, 'one spouse works', 86);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (277, to_date('27-09-2023', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 181);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (278, to_date('12-05-2024', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 154);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (279, to_date('08-04-2021', 'dd-mm-yyyy'), 7, 'one spouse works', 10);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (280, to_date('23-10-2023', 'dd-mm-yyyy'), 6, 'one spouse works', 192);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (281, to_date('30-07-2023', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 17);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (282, to_date('13-09-2021', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 77);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (283, to_date('21-07-2020', 'dd-mm-yyyy'), 8, 'special child', 98);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (284, to_date('23-10-2022', 'dd-mm-yyyy'), 1, 'one spouse works', 35);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (285, to_date('14-02-2020', 'dd-mm-yyyy'), 4, 'Family in need of extra financial help', 195);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (286, to_date('28-12-2020', 'dd-mm-yyyy'), 2, 'both spouses work', 56);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (287, to_date('06-12-2022', 'dd-mm-yyyy'), 11, 'one spouse works', 93);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (288, to_date('04-05-2020', 'dd-mm-yyyy'), 3, 'special child', 163);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (289, to_date('09-08-2021', 'dd-mm-yyyy'), 8, 'both spouses work', 70);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (290, to_date('07-07-2023', 'dd-mm-yyyy'), 4, 'both spouses work', 150);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (291, to_date('30-01-2020', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 15);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (292, to_date('01-08-2022', 'dd-mm-yyyy'), 6, 'both spouses work', 178);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (293, to_date('04-03-2020', 'dd-mm-yyyy'), 8, 'special child', 9);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (294, to_date('14-03-2023', 'dd-mm-yyyy'), 3, 'one spouse works', 39);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (295, to_date('02-11-2023', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 164);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (296, to_date('28-09-2022', 'dd-mm-yyyy'), 9, 'one spouse works', 74);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (297, to_date('11-04-2020', 'dd-mm-yyyy'), 5, 'special child', 131);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (298, to_date('26-10-2021', 'dd-mm-yyyy'), 1, 'special child', 163);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (299, to_date('12-01-2024', 'dd-mm-yyyy'), 6, 'both spouses work', 63);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (300, to_date('08-08-2020', 'dd-mm-yyyy'), 5, 'both spouses work', 172);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (301, to_date('16-12-2022', 'dd-mm-yyyy'), 11, 'special child', 45);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (302, to_date('24-01-2022', 'dd-mm-yyyy'), 10, 'special child', 61);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (303, to_date('12-04-2021', 'dd-mm-yyyy'), 2, 'special child', 189);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (304, to_date('19-01-2020', 'dd-mm-yyyy'), 6, 'one spouse works', 62);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (305, to_date('18-05-2023', 'dd-mm-yyyy'), 6, 'one spouse works', 184);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (306, to_date('07-09-2020', 'dd-mm-yyyy'), 1, 'special child', 108);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (307, to_date('02-02-2020', 'dd-mm-yyyy'), 2, 'both spouses work', 115);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (308, to_date('11-03-2022', 'dd-mm-yyyy'), 11, 'both spouses work', 137);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (309, to_date('20-07-2021', 'dd-mm-yyyy'), 1, 'one spouse works', 144);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (310, to_date('15-08-2023', 'dd-mm-yyyy'), 8, 'special child', 50);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (311, to_date('25-12-2021', 'dd-mm-yyyy'), 6, 'special child', 48);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (312, to_date('10-11-2022', 'dd-mm-yyyy'), 5, 'one spouse works', 133);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (313, to_date('14-04-2024', 'dd-mm-yyyy'), 3, 'one spouse works', 25);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (314, to_date('30-06-2021', 'dd-mm-yyyy'), 12, 'both spouses work', 145);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (315, to_date('03-01-2023', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 162);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (316, to_date('17-05-2023', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 63);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (317, to_date('29-08-2020', 'dd-mm-yyyy'), 5, 'special child', 162);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (318, to_date('25-05-2022', 'dd-mm-yyyy'), 4, 'both spouses work', 97);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (319, to_date('28-01-2020', 'dd-mm-yyyy'), 8, 'special child', 139);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (320, to_date('25-08-2023', 'dd-mm-yyyy'), 10, 'both spouses work', 158);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (321, to_date('16-08-2023', 'dd-mm-yyyy'), 2, 'both spouses work', 68);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (322, to_date('11-12-2022', 'dd-mm-yyyy'), 1, 'one spouse works', 198);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (323, to_date('16-09-2021', 'dd-mm-yyyy'), 5, 'both spouses work', 106);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (324, to_date('09-02-2024', 'dd-mm-yyyy'), 3, 'one spouse works', 3);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (325, to_date('04-06-2023', 'dd-mm-yyyy'), 4, 'special child', 169);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (326, to_date('15-06-2023', 'dd-mm-yyyy'), 7, 'both spouses work', 59);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (327, to_date('10-07-2023', 'dd-mm-yyyy'), 7, 'special child', 174);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (328, to_date('24-03-2023', 'dd-mm-yyyy'), 6, 'both spouses work', 73);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (329, to_date('31-05-2020', 'dd-mm-yyyy'), 2, 'one spouse works', 142);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (330, to_date('14-01-2021', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 156);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (331, to_date('16-05-2023', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 169);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (332, to_date('09-11-2023', 'dd-mm-yyyy'), 4, 'one spouse works', 75);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (333, to_date('24-07-2022', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 52);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (334, to_date('11-05-2020', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 160);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (335, to_date('12-04-2023', 'dd-mm-yyyy'), 10, 'one spouse works', 180);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (336, to_date('05-12-2021', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 80);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (337, to_date('04-12-2020', 'dd-mm-yyyy'), 1, 'both spouses work', 91);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (338, to_date('30-04-2022', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 77);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (339, to_date('24-07-2022', 'dd-mm-yyyy'), 1, 'special child', 87);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (340, to_date('11-08-2021', 'dd-mm-yyyy'), 12, 'both spouses work', 64);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (341, to_date('12-06-2022', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 113);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (342, to_date('16-08-2021', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 187);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (343, to_date('22-02-2024', 'dd-mm-yyyy'), 9, 'one spouse works', 102);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (344, to_date('05-01-2024', 'dd-mm-yyyy'), 2, 'special child', 45);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (345, to_date('06-01-2021', 'dd-mm-yyyy'), 2, 'special child', 175);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (346, to_date('09-11-2021', 'dd-mm-yyyy'), 11, 'special child', 180);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (347, to_date('15-04-2023', 'dd-mm-yyyy'), 8, 'both spouses work', 109);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (348, to_date('14-04-2020', 'dd-mm-yyyy'), 8, 'one spouse works', 21);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (349, to_date('15-06-2021', 'dd-mm-yyyy'), 11, 'one spouse works', 70);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (350, to_date('03-04-2024', 'dd-mm-yyyy'), 11, 'special child', 95);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (351, to_date('21-09-2022', 'dd-mm-yyyy'), 4, 'special child', 199);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (352, to_date('09-01-2020', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 103);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (353, to_date('15-10-2023', 'dd-mm-yyyy'), 10, 'both spouses work', 69);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (354, to_date('18-10-2020', 'dd-mm-yyyy'), 11, 'special child', 54);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (355, to_date('13-05-2021', 'dd-mm-yyyy'), 11, 'one spouse works', 5);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (356, to_date('24-04-2022', 'dd-mm-yyyy'), 9, 'one spouse works', 61);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (357, to_date('14-10-2020', 'dd-mm-yyyy'), 6, 'special child', 56);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (358, to_date('29-07-2022', 'dd-mm-yyyy'), 7, 'special child', 4);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (359, to_date('23-08-2020', 'dd-mm-yyyy'), 4, 'Family in need of extra financial help', 45);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (360, to_date('27-01-2022', 'dd-mm-yyyy'), 10, 'one spouse works', 52);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (361, to_date('04-12-2021', 'dd-mm-yyyy'), 7, 'both spouses work', 66);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (362, to_date('18-01-2022', 'dd-mm-yyyy'), 5, 'both spouses work', 50);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (363, to_date('12-01-2022', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 56);
commit;
prompt 200 records committed...
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (364, to_date('26-10-2020', 'dd-mm-yyyy'), 6, 'one spouse works', 165);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (365, to_date('22-01-2020', 'dd-mm-yyyy'), 10, 'special child', 21);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (366, to_date('09-06-2021', 'dd-mm-yyyy'), 1, 'one spouse works', 198);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (367, to_date('27-02-2020', 'dd-mm-yyyy'), 3, 'special child', 131);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (368, to_date('28-02-2024', 'dd-mm-yyyy'), 8, 'special child', 156);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (369, to_date('06-03-2024', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 72);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (370, to_date('30-05-2021', 'dd-mm-yyyy'), 6, 'special child', 88);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (371, to_date('08-05-2022', 'dd-mm-yyyy'), 7, 'special child', 61);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (372, to_date('09-09-2021', 'dd-mm-yyyy'), 4, 'special child', 182);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (373, to_date('16-09-2021', 'dd-mm-yyyy'), 6, 'one spouse works', 129);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (374, to_date('09-01-2023', 'dd-mm-yyyy'), 10, 'Family in need of extra financial help', 130);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (375, to_date('20-02-2024', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 64);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (376, to_date('13-03-2024', 'dd-mm-yyyy'), 2, 'one spouse works', 145);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (377, to_date('27-01-2020', 'dd-mm-yyyy'), 10, 'special child', 9);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (378, to_date('26-10-2020', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 50);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (379, to_date('22-05-2024', 'dd-mm-yyyy'), 9, 'both spouses work', 133);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (380, to_date('30-06-2021', 'dd-mm-yyyy'), 4, 'one spouse works', 24);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (381, to_date('10-03-2022', 'dd-mm-yyyy'), 6, 'both spouses work', 161);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (382, to_date('29-05-2022', 'dd-mm-yyyy'), 3, 'one spouse works', 16);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (383, to_date('06-11-2022', 'dd-mm-yyyy'), 9, 'both spouses work', 165);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (384, to_date('14-01-2024', 'dd-mm-yyyy'), 2, 'one spouse works', 15);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (385, to_date('29-12-2023', 'dd-mm-yyyy'), 7, 'special child', 15);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (386, to_date('05-12-2023', 'dd-mm-yyyy'), 8, 'both spouses work', 186);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (387, to_date('14-01-2022', 'dd-mm-yyyy'), 3, 'one spouse works', 102);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (388, to_date('28-09-2020', 'dd-mm-yyyy'), 10, 'both spouses work', 69);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (389, to_date('08-10-2020', 'dd-mm-yyyy'), 9, 'both spouses work', 112);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (390, to_date('19-10-2020', 'dd-mm-yyyy'), 4, 'both spouses work', 38);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (391, to_date('25-05-2020', 'dd-mm-yyyy'), 9, 'one spouse works', 71);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (392, to_date('18-08-2020', 'dd-mm-yyyy'), 2, 'one spouse works', 27);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (393, to_date('20-04-2022', 'dd-mm-yyyy'), 10, 'special child', 45);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (394, to_date('19-11-2022', 'dd-mm-yyyy'), 9, 'one spouse works', 112);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (395, to_date('07-01-2023', 'dd-mm-yyyy'), 6, 'one spouse works', 114);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (396, to_date('10-11-2023', 'dd-mm-yyyy'), 11, 'both spouses work', 161);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (397, to_date('15-12-2023', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 195);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (398, to_date('17-02-2021', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 145);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (399, to_date('10-07-2021', 'dd-mm-yyyy'), 5, 'both spouses work', 135);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (400, to_date('05-09-2023', 'dd-mm-yyyy'), 12, 'special child', 108);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (1, to_date('05-10-2022', 'dd-mm-yyyy'), 8, 'one spouse works', 136);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (2, to_date('03-06-2021', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 41);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (3, to_date('03-09-2021', 'dd-mm-yyyy'), 5, 'special child', 182);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (4, to_date('05-08-2023', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 129);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (5, to_date('17-01-2024', 'dd-mm-yyyy'), 6, 'one spouse works', 98);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (6, to_date('21-08-2022', 'dd-mm-yyyy'), 3, 'both spouses work', 30);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (7, to_date('28-12-2022', 'dd-mm-yyyy'), 8, 'both spouses work', 59);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (8, to_date('22-11-2022', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 114);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (9, to_date('08-02-2024', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 62);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (10, to_date('26-03-2023', 'dd-mm-yyyy'), 4, 'special child', 71);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (11, to_date('24-12-2020', 'dd-mm-yyyy'), 11, 'special child', 83);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (12, to_date('01-04-2022', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 158);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (13, to_date('20-07-2022', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 116);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (14, to_date('18-06-2021', 'dd-mm-yyyy'), 1, 'both spouses work', 109);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (15, to_date('07-03-2021', 'dd-mm-yyyy'), 12, 'special child', 59);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (16, to_date('20-03-2022', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 106);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (17, to_date('26-07-2020', 'dd-mm-yyyy'), 6, 'both spouses work', 73);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (18, to_date('24-08-2020', 'dd-mm-yyyy'), 3, 'special child', 21);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (19, to_date('03-01-2022', 'dd-mm-yyyy'), 4, 'Family in need of extra financial help', 193);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (20, to_date('04-10-2022', 'dd-mm-yyyy'), 11, 'special child', 106);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (21, to_date('30-12-2021', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 10);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (22, to_date('16-04-2022', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 160);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (23, to_date('01-02-2021', 'dd-mm-yyyy'), 9, 'both spouses work', 17);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (24, to_date('10-10-2020', 'dd-mm-yyyy'), 12, 'both spouses work', 147);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (25, to_date('14-01-2022', 'dd-mm-yyyy'), 4, 'one spouse works', 6);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (26, to_date('04-08-2023', 'dd-mm-yyyy'), 7, 'one spouse works', 87);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (27, to_date('06-08-2021', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 138);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (28, to_date('11-11-2020', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 198);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (29, to_date('30-05-2022', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 75);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (30, to_date('13-10-2023', 'dd-mm-yyyy'), 10, 'one spouse works', 112);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (31, to_date('19-12-2020', 'dd-mm-yyyy'), 8, 'both spouses work', 167);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (32, to_date('31-12-2023', 'dd-mm-yyyy'), 6, 'one spouse works', 145);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (33, to_date('17-01-2020', 'dd-mm-yyyy'), 8, 'one spouse works', 110);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (34, to_date('29-08-2021', 'dd-mm-yyyy'), 4, 'special child', 31);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (35, to_date('15-08-2021', 'dd-mm-yyyy'), 11, 'both spouses work', 61);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (36, to_date('27-08-2020', 'dd-mm-yyyy'), 6, 'one spouse works', 126);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (37, to_date('29-03-2022', 'dd-mm-yyyy'), 3, 'special child', 17);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (38, to_date('29-11-2021', 'dd-mm-yyyy'), 6, 'special child', 61);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (39, to_date('06-02-2024', 'dd-mm-yyyy'), 6, 'special child', 59);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (40, to_date('09-08-2023', 'dd-mm-yyyy'), 1, 'special child', 72);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (41, to_date('26-02-2022', 'dd-mm-yyyy'), 1, 'both spouses work', 53);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (42, to_date('27-10-2023', 'dd-mm-yyyy'), 7, 'both spouses work', 181);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (43, to_date('01-03-2020', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 20);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (44, to_date('30-04-2021', 'dd-mm-yyyy'), 9, 'both spouses work', 45);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (45, to_date('04-10-2022', 'dd-mm-yyyy'), 7, 'one spouse works', 162);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (46, to_date('13-03-2023', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 67);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (47, to_date('03-03-2021', 'dd-mm-yyyy'), 6, 'one spouse works', 158);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (48, to_date('21-01-2024', 'dd-mm-yyyy'), 8, 'special child', 170);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (49, to_date('18-02-2021', 'dd-mm-yyyy'), 3, 'both spouses work', 116);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (50, to_date('12-02-2023', 'dd-mm-yyyy'), 4, 'one spouse works', 30);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (51, to_date('03-05-2020', 'dd-mm-yyyy'), 10, 'one spouse works', 187);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (52, to_date('04-08-2021', 'dd-mm-yyyy'), 11, 'one spouse works', 178);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (53, to_date('23-08-2023', 'dd-mm-yyyy'), 1, 'both spouses work', 49);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (54, to_date('21-08-2022', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 155);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (55, to_date('09-02-2021', 'dd-mm-yyyy'), 9, 'special child', 47);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (56, to_date('09-07-2020', 'dd-mm-yyyy'), 7, 'one spouse works', 141);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (57, to_date('20-05-2021', 'dd-mm-yyyy'), 11, 'special child', 196);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (58, to_date('17-02-2023', 'dd-mm-yyyy'), 7, 'one spouse works', 37);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (59, to_date('18-06-2021', 'dd-mm-yyyy'), 4, 'both spouses work', 51);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (60, to_date('01-02-2024', 'dd-mm-yyyy'), 11, 'special child', 12);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (61, to_date('31-12-2022', 'dd-mm-yyyy'), 5, 'special child', 32);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (62, to_date('20-05-2021', 'dd-mm-yyyy'), 7, 'both spouses work', 118);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (63, to_date('29-03-2020', 'dd-mm-yyyy'), 9, 'special child', 20);
commit;
prompt 300 records committed...
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (64, to_date('26-11-2020', 'dd-mm-yyyy'), 9, 'one spouse works', 158);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (65, to_date('26-04-2021', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 7);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (66, to_date('10-05-2020', 'dd-mm-yyyy'), 1, 'one spouse works', 26);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (67, to_date('27-06-2023', 'dd-mm-yyyy'), 2, 'one spouse works', 18);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (68, to_date('24-02-2022', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 101);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (69, to_date('01-10-2021', 'dd-mm-yyyy'), 6, 'both spouses work', 84);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (70, to_date('17-04-2022', 'dd-mm-yyyy'), 10, 'both spouses work', 112);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (71, to_date('01-05-2024', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 91);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (72, to_date('25-10-2023', 'dd-mm-yyyy'), 5, 'both spouses work', 56);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (73, to_date('02-03-2022', 'dd-mm-yyyy'), 7, 'both spouses work', 78);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (74, to_date('28-10-2021', 'dd-mm-yyyy'), 10, 'special child', 187);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (75, to_date('25-07-2022', 'dd-mm-yyyy'), 8, 'one spouse works', 7);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (76, to_date('12-11-2021', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 64);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (77, to_date('24-08-2023', 'dd-mm-yyyy'), 6, 'special child', 191);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (78, to_date('17-02-2021', 'dd-mm-yyyy'), 7, 'one spouse works', 61);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (79, to_date('18-02-2022', 'dd-mm-yyyy'), 10, 'both spouses work', 188);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (80, to_date('22-12-2022', 'dd-mm-yyyy'), 4, 'both spouses work', 137);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (81, to_date('02-08-2023', 'dd-mm-yyyy'), 3, 'one spouse works', 152);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (82, to_date('21-01-2023', 'dd-mm-yyyy'), 6, 'special child', 77);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (83, to_date('13-04-2024', 'dd-mm-yyyy'), 3, 'special child', 54);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (84, to_date('07-01-2020', 'dd-mm-yyyy'), 9, 'one spouse works', 186);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (85, to_date('13-01-2022', 'dd-mm-yyyy'), 8, 'both spouses work', 155);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (86, to_date('17-03-2024', 'dd-mm-yyyy'), 10, 'both spouses work', 53);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (87, to_date('24-08-2020', 'dd-mm-yyyy'), 10, 'one spouse works', 154);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (88, to_date('08-06-2020', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 168);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (89, to_date('21-08-2023', 'dd-mm-yyyy'), 12, 'both spouses work', 191);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (90, to_date('22-04-2021', 'dd-mm-yyyy'), 11, 'one spouse works', 16);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (91, to_date('20-08-2021', 'dd-mm-yyyy'), 8, 'both spouses work', 110);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (92, to_date('21-09-2021', 'dd-mm-yyyy'), 1, 'both spouses work', 17);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (93, to_date('28-11-2021', 'dd-mm-yyyy'), 8, 'one spouse works', 193);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (94, to_date('02-12-2021', 'dd-mm-yyyy'), 6, 'special child', 142);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (95, to_date('02-02-2023', 'dd-mm-yyyy'), 6, 'special child', 149);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (96, to_date('05-03-2022', 'dd-mm-yyyy'), 4, 'special child', 183);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (97, to_date('20-03-2023', 'dd-mm-yyyy'), 9, 'one spouse works', 169);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (98, to_date('12-05-2024', 'dd-mm-yyyy'), 9, 'both spouses work', 92);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (99, to_date('13-06-2021', 'dd-mm-yyyy'), 7, 'one spouse works', 43);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (100, to_date('20-10-2022', 'dd-mm-yyyy'), 4, 'one spouse works', 173);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (101, to_date('05-04-2022', 'dd-mm-yyyy'), 1, 'special child', 140);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (102, to_date('06-01-2024', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 148);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (103, to_date('26-01-2020', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 48);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (104, to_date('18-06-2020', 'dd-mm-yyyy'), 1, 'both spouses work', 81);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (105, to_date('17-08-2021', 'dd-mm-yyyy'), 6, 'special child', 78);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (106, to_date('04-02-2024', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 156);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (107, to_date('11-05-2022', 'dd-mm-yyyy'), 5, 'one spouse works', 36);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (108, to_date('01-01-2023', 'dd-mm-yyyy'), 2, 'special child', 134);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (109, to_date('02-07-2020', 'dd-mm-yyyy'), 12, 'one spouse works', 44);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (110, to_date('01-05-2024', 'dd-mm-yyyy'), 12, 'both spouses work', 57);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (111, to_date('14-06-2020', 'dd-mm-yyyy'), 9, 'special child', 40);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (112, to_date('26-04-2020', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 25);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (113, to_date('30-12-2020', 'dd-mm-yyyy'), 8, 'special child', 125);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (114, to_date('02-12-2022', 'dd-mm-yyyy'), 5, 'one spouse works', 29);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (115, to_date('15-08-2023', 'dd-mm-yyyy'), 1, 'special child', 186);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (116, to_date('31-07-2021', 'dd-mm-yyyy'), 7, 'special child', 50);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (117, to_date('11-04-2021', 'dd-mm-yyyy'), 5, 'both spouses work', 171);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (118, to_date('03-11-2022', 'dd-mm-yyyy'), 6, 'both spouses work', 20);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (119, to_date('30-06-2020', 'dd-mm-yyyy'), 11, 'both spouses work', 33);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (120, to_date('12-11-2021', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 46);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (121, to_date('17-11-2021', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 133);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (122, to_date('26-07-2020', 'dd-mm-yyyy'), 5, 'one spouse works', 92);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (123, to_date('13-09-2020', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 108);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (124, to_date('24-09-2021', 'dd-mm-yyyy'), 3, 'both spouses work', 131);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (125, to_date('29-03-2023', 'dd-mm-yyyy'), 9, 'both spouses work', 200);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (126, to_date('25-03-2021', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 153);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (127, to_date('27-06-2021', 'dd-mm-yyyy'), 10, 'one spouse works', 47);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (128, to_date('02-05-2020', 'dd-mm-yyyy'), 9, 'special child', 39);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (129, to_date('25-03-2023', 'dd-mm-yyyy'), 2, 'one spouse works', 138);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (130, to_date('23-11-2022', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 96);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (131, to_date('28-11-2022', 'dd-mm-yyyy'), 9, 'both spouses work', 131);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (132, to_date('03-10-2021', 'dd-mm-yyyy'), 10, 'one spouse works', 57);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (133, to_date('17-06-2023', 'dd-mm-yyyy'), 7, 'special child', 27);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (134, to_date('01-12-2022', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 138);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (135, to_date('03-12-2020', 'dd-mm-yyyy'), 9, 'special child', 21);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (136, to_date('15-09-2023', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 165);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (137, to_date('05-06-2022', 'dd-mm-yyyy'), 2, 'both spouses work', 197);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (138, to_date('05-04-2024', 'dd-mm-yyyy'), 2, 'both spouses work', 156);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (139, to_date('19-07-2022', 'dd-mm-yyyy'), 3, 'special child', 100);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (140, to_date('15-11-2023', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 172);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (141, to_date('29-10-2021', 'dd-mm-yyyy'), 8, 'one spouse works', 165);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (142, to_date('20-03-2024', 'dd-mm-yyyy'), 7, 'Family in need of extra financial help', 24);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (143, to_date('01-05-2021', 'dd-mm-yyyy'), 3, 'both spouses work', 7);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (144, to_date('02-11-2021', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 52);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (145, to_date('31-01-2024', 'dd-mm-yyyy'), 8, 'one spouse works', 176);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (146, to_date('26-09-2020', 'dd-mm-yyyy'), 11, 'special child', 153);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (147, to_date('05-05-2021', 'dd-mm-yyyy'), 9, 'one spouse works', 176);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (148, to_date('05-01-2021', 'dd-mm-yyyy'), 5, 'both spouses work', 85);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (149, to_date('20-01-2021', 'dd-mm-yyyy'), 10, 'one spouse works', 139);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (150, to_date('05-03-2023', 'dd-mm-yyyy'), 1, 'one spouse works', 24);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (151, to_date('13-06-2021', 'dd-mm-yyyy'), 10, 'both spouses work', 174);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (152, to_date('29-09-2021', 'dd-mm-yyyy'), 12, 'special child', 191);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (153, to_date('29-05-2022', 'dd-mm-yyyy'), 1, 'both spouses work', 163);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (154, to_date('10-05-2023', 'dd-mm-yyyy'), 9, 'one spouse works', 132);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (155, to_date('28-08-2021', 'dd-mm-yyyy'), 11, 'special child', 36);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (156, to_date('03-04-2023', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 71);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (157, to_date('12-04-2022', 'dd-mm-yyyy'), 5, 'one spouse works', 94);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (158, to_date('16-12-2023', 'dd-mm-yyyy'), 2, 'both spouses work', 117);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (159, to_date('20-08-2020', 'dd-mm-yyyy'), 8, 'one spouse works', 6);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (160, to_date('20-02-2021', 'dd-mm-yyyy'), 7, 'special child', 141);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (161, to_date('01-04-2023', 'dd-mm-yyyy'), 9, 'special child', 57);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (162, to_date('25-10-2022', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 107);
insert into BIRTH (birth_id, baby_dob, num_of_children, comments, member_id)
values (163, to_date('19-01-2022', 'dd-mm-yyyy'), 10, 'one spouse works', 71);
commit;
prompt 400 records loaded
prompt Loading DONATION...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-01-1991', 'dd-mm-yyyy'), 10947, 231, 100000300, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-01-1999', 'dd-mm-yyyy'), 35045, 232, 100000396, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-06-1990', 'dd-mm-yyyy'), 56146, 233, 100000278, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-09-1994', 'dd-mm-yyyy'), 65903, 234, 100000367, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-10-2013', 'dd-mm-yyyy'), 93833, 235, 100000067, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-08-2006', 'dd-mm-yyyy'), 72168, 236, 100000187, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-12-2007', 'dd-mm-yyyy'), 57866, 237, 100000233, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-03-2003', 'dd-mm-yyyy'), 4785, 238, 100000341, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-10-2013', 'dd-mm-yyyy'), 2278, 239, 100000039, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-12-1997', 'dd-mm-yyyy'), 23364, 240, 100000075, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-02-2004', 'dd-mm-yyyy'), 48791, 241, 100000273, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-10-1991', 'dd-mm-yyyy'), 59692, 242, 100000105, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-06-2016', 'dd-mm-yyyy'), 15893, 243, 100000193, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-04-2003', 'dd-mm-yyyy'), 61832, 244, 100000017, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-05-1995', 'dd-mm-yyyy'), 28195, 245, 100000131, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-10-2015', 'dd-mm-yyyy'), 19680, 246, 100000351, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('27-06-1998', 'dd-mm-yyyy'), 8146, 247, 100000105, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-01-2012', 'dd-mm-yyyy'), 71699, 248, 100000096, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-08-2008', 'dd-mm-yyyy'), 48128, 249, 100000229, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-02-1994', 'dd-mm-yyyy'), 93409, 250, 100000217, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-05-2006', 'dd-mm-yyyy'), 64506, 251, 100000033, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-08-2022', 'dd-mm-yyyy'), 66360, 252, 100000106, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-02-1993', 'dd-mm-yyyy'), 32355, 253, 100000191, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-11-1999', 'dd-mm-yyyy'), 28765, 254, 100000040, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-02-1999', 'dd-mm-yyyy'), 1660, 255, 100000103, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-02-2023', 'dd-mm-yyyy'), 7405, 256, 100000171, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-08-2007', 'dd-mm-yyyy'), 94779, 257, 100000215, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-01-2000', 'dd-mm-yyyy'), 30702, 258, 100000354, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-04-2001', 'dd-mm-yyyy'), 85563, 259, 100000153, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-03-2006', 'dd-mm-yyyy'), 23155, 260, 100000191, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-05-1994', 'dd-mm-yyyy'), 58676, 261, 100000080, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-01-2008', 'dd-mm-yyyy'), 80662, 262, 100000119, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-06-2014', 'dd-mm-yyyy'), 51149, 263, 100000311, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-05-2018', 'dd-mm-yyyy'), 27786, 264, 100000089, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-12-2000', 'dd-mm-yyyy'), 74829, 265, 100000297, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-08-1995', 'dd-mm-yyyy'), 55214, 266, 100000127, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('22-01-1998', 'dd-mm-yyyy'), 20177, 267, 100000194, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-06-2003', 'dd-mm-yyyy'), 39765, 268, 100000077, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-12-2022', 'dd-mm-yyyy'), 40854, 269, 100000008, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-04-2011', 'dd-mm-yyyy'), 44482, 270, 100000005, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-02-2022', 'dd-mm-yyyy'), 20456, 271, 100000302, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-10-2023', 'dd-mm-yyyy'), 781, 272, 100000312, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-03-2019', 'dd-mm-yyyy'), 19535, 273, 100000075, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-03-2023', 'dd-mm-yyyy'), 71178, 274, 100000234, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-11-2006', 'dd-mm-yyyy'), 4576, 275, 100000065, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-01-2000', 'dd-mm-yyyy'), 94177, 276, 100000193, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-09-1995', 'dd-mm-yyyy'), 57753, 277, 100000266, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-12-2002', 'dd-mm-yyyy'), 9431, 278, 100000165, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-04-2013', 'dd-mm-yyyy'), 68444, 279, 100000182, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-08-2001', 'dd-mm-yyyy'), 64376, 280, 100000255, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-05-2020', 'dd-mm-yyyy'), 5419, 281, 100000133, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-08-2009', 'dd-mm-yyyy'), 3121, 282, 100000057, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-02-2017', 'dd-mm-yyyy'), 70407, 283, 100000315, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-10-2020', 'dd-mm-yyyy'), 34821, 284, 100000105, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-09-1997', 'dd-mm-yyyy'), 33705, 285, 100000205, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-04-1998', 'dd-mm-yyyy'), 85008, 286, 100000075, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-09-1992', 'dd-mm-yyyy'), 49591, 287, 100000032, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-02-2022', 'dd-mm-yyyy'), 27197, 288, 100000077, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-01-1993', 'dd-mm-yyyy'), 54373, 289, 100000116, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-02-2007', 'dd-mm-yyyy'), 95563, 290, 100000353, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-12-1996', 'dd-mm-yyyy'), 44830, 291, 100000392, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-01-1992', 'dd-mm-yyyy'), 80071, 292, 100000216, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-02-2007', 'dd-mm-yyyy'), 38209, 293, 100000298, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-04-2000', 'dd-mm-yyyy'), 1399, 294, 100000335, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-08-2012', 'dd-mm-yyyy'), 13494, 295, 100000369, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-10-2022', 'dd-mm-yyyy'), 67814, 296, 100000189, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-11-1990', 'dd-mm-yyyy'), 33752, 297, 100000140, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-11-2020', 'dd-mm-yyyy'), 13910, 298, 100000241, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-01-1997', 'dd-mm-yyyy'), 50027, 299, 100000319, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-04-2017', 'dd-mm-yyyy'), 19040, 300, 100000066, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-03-1998', 'dd-mm-yyyy'), 86128, 301, 100000326, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-06-1999', 'dd-mm-yyyy'), 8590, 302, 100000392, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-05-2001', 'dd-mm-yyyy'), 5068, 303, 100000253, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-08-2014', 'dd-mm-yyyy'), 35436, 304, 100000347, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-11-1994', 'dd-mm-yyyy'), 55980, 305, 100000122, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-08-2009', 'dd-mm-yyyy'), 43270, 306, 100000260, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-08-2012', 'dd-mm-yyyy'), 3694, 307, 100000147, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-02-1998', 'dd-mm-yyyy'), 10788, 308, 100000287, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-07-2010', 'dd-mm-yyyy'), 37796, 309, 100000275, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('22-04-2008', 'dd-mm-yyyy'), 77152, 310, 100000000, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-11-2003', 'dd-mm-yyyy'), 64542, 311, 100000246, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-10-2013', 'dd-mm-yyyy'), 49318, 312, 100000211, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-11-2016', 'dd-mm-yyyy'), 78948, 313, 100000047, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-08-2022', 'dd-mm-yyyy'), 89435, 314, 100000394, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-10-2017', 'dd-mm-yyyy'), 18646, 315, 100000329, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-03-2013', 'dd-mm-yyyy'), 84812, 316, 100000200, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-11-2010', 'dd-mm-yyyy'), 98514, 317, 100000033, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-10-1992', 'dd-mm-yyyy'), 98052, 318, 100000193, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-09-2009', 'dd-mm-yyyy'), 27665, 319, 100000046, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-06-2006', 'dd-mm-yyyy'), 99154, 320, 100000082, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-11-1995', 'dd-mm-yyyy'), 5915, 321, 100000055, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-10-1993', 'dd-mm-yyyy'), 78493, 322, 100000039, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-04-2000', 'dd-mm-yyyy'), 3214, 323, 100000018, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-04-2008', 'dd-mm-yyyy'), 41154, 324, 100000100, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-08-1996', 'dd-mm-yyyy'), 19347, 325, 100000272, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-07-2009', 'dd-mm-yyyy'), 82447, 326, 100000161, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-10-2021', 'dd-mm-yyyy'), 25200, 327, 100000330, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-06-2018', 'dd-mm-yyyy'), 45082, 328, 100000127, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('22-01-2005', 'dd-mm-yyyy'), 85108, 329, 100000230, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-08-2016', 'dd-mm-yyyy'), 56723, 330, 100000380, 12);
commit;
prompt 100 records committed...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('20-07-1995', 'dd-mm-yyyy'), 60848, 331, 100000240, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-10-2002', 'dd-mm-yyyy'), 49798, 332, 100000327, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-12-1995', 'dd-mm-yyyy'), 96131, 333, 100000108, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-08-1999', 'dd-mm-yyyy'), 61789, 334, 100000390, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-03-2022', 'dd-mm-yyyy'), 83333, 335, 100000264, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-04-2011', 'dd-mm-yyyy'), 17282, 336, 100000148, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-05-2010', 'dd-mm-yyyy'), 10616, 337, 100000241, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-03-2000', 'dd-mm-yyyy'), 90697, 338, 100000073, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-03-2018', 'dd-mm-yyyy'), 90513, 339, 100000004, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-01-2021', 'dd-mm-yyyy'), 51270, 340, 100000319, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-10-1998', 'dd-mm-yyyy'), 70565, 341, 100000205, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-01-1995', 'dd-mm-yyyy'), 87820, 342, 100000089, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-05-2006', 'dd-mm-yyyy'), 23759, 343, 100000067, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-04-2020', 'dd-mm-yyyy'), 16377, 344, 100000195, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-06-2008', 'dd-mm-yyyy'), 21303, 345, 100000236, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-05-2013', 'dd-mm-yyyy'), 67479, 346, 100000162, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-01-1993', 'dd-mm-yyyy'), 86391, 347, 100000175, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-05-2023', 'dd-mm-yyyy'), 56337, 348, 100000319, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-06-1991', 'dd-mm-yyyy'), 29320, 349, 100000313, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-04-2015', 'dd-mm-yyyy'), 32775, 350, 100000121, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-08-2017', 'dd-mm-yyyy'), 63098, 351, 100000156, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-11-2016', 'dd-mm-yyyy'), 13329, 352, 100000041, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-03-1992', 'dd-mm-yyyy'), 1695, 353, 100000332, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-04-2009', 'dd-mm-yyyy'), 94224, 354, 100000290, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-10-1995', 'dd-mm-yyyy'), 37983, 355, 100000193, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-04-2009', 'dd-mm-yyyy'), 46110, 356, 100000037, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-07-1990', 'dd-mm-yyyy'), 4431, 357, 100000169, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-11-1998', 'dd-mm-yyyy'), 88881, 358, 100000341, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-06-2009', 'dd-mm-yyyy'), 13683, 359, 100000124, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('27-07-2011', 'dd-mm-yyyy'), 49346, 360, 100000142, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-09-2019', 'dd-mm-yyyy'), 81387, 361, 100000399, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-07-1997', 'dd-mm-yyyy'), 98580, 362, 100000296, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-07-2012', 'dd-mm-yyyy'), 30007, 363, 100000343, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-09-2017', 'dd-mm-yyyy'), 71942, 364, 100000166, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-05-2009', 'dd-mm-yyyy'), 73202, 365, 100000098, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-06-2009', 'dd-mm-yyyy'), 69058, 366, 100000053, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-09-2017', 'dd-mm-yyyy'), 82765, 367, 100000193, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-10-2019', 'dd-mm-yyyy'), 36075, 368, 100000203, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-05-2007', 'dd-mm-yyyy'), 35638, 369, 100000336, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-11-2009', 'dd-mm-yyyy'), 28488, 370, 100000284, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('31-05-2008', 'dd-mm-yyyy'), 42597, 371, 100000200, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-04-2023', 'dd-mm-yyyy'), 55626, 372, 100000368, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-08-2022', 'dd-mm-yyyy'), 58501, 373, 100000121, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-01-1995', 'dd-mm-yyyy'), 6315, 374, 100000119, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('22-09-2022', 'dd-mm-yyyy'), 73311, 375, 100000288, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-12-1992', 'dd-mm-yyyy'), 55308, 376, 100000265, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-09-2005', 'dd-mm-yyyy'), 84579, 377, 100000030, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-10-1996', 'dd-mm-yyyy'), 51981, 378, 100000335, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-04-1996', 'dd-mm-yyyy'), 51206, 379, 100000370, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-10-2005', 'dd-mm-yyyy'), 89100, 380, 100000173, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-07-2001', 'dd-mm-yyyy'), 28267, 381, 100000155, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-08-1994', 'dd-mm-yyyy'), 53858, 382, 100000242, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('20-05-2018', 'dd-mm-yyyy'), 83308, 383, 100000253, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-08-1990', 'dd-mm-yyyy'), 59277, 384, 100000187, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-07-1992', 'dd-mm-yyyy'), 94006, 385, 100000063, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-07-1999', 'dd-mm-yyyy'), 57682, 386, 100000383, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-08-2002', 'dd-mm-yyyy'), 26601, 387, 100000153, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-08-2018', 'dd-mm-yyyy'), 34842, 388, 100000169, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-09-2016', 'dd-mm-yyyy'), 95705, 389, 100000157, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-05-2000', 'dd-mm-yyyy'), 85482, 390, 100000205, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-12-2011', 'dd-mm-yyyy'), 6258, 391, 100000277, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-05-2008', 'dd-mm-yyyy'), 70458, 392, 100000343, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-10-2010', 'dd-mm-yyyy'), 74881, 393, 100000054, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-11-2012', 'dd-mm-yyyy'), 54410, 394, 100000272, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-05-1998', 'dd-mm-yyyy'), 34770, 395, 100000169, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-07-2016', 'dd-mm-yyyy'), 25375, 396, 100000023, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-04-1997', 'dd-mm-yyyy'), 19684, 397, 100000168, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-01-1992', 'dd-mm-yyyy'), 95175, 398, 100000123, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-03-2024', 'dd-mm-yyyy'), 30681, 399, 100000073, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-12-2011', 'dd-mm-yyyy'), 81667, 400, 100000225, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-01-1997', 'dd-mm-yyyy'), 16843, 1, 100000073, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-07-2016', 'dd-mm-yyyy'), 77592, 2, 100000370, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-10-2013', 'dd-mm-yyyy'), 98684, 3, 100000351, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-09-2019', 'dd-mm-yyyy'), 32732, 4, 100000270, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-08-2000', 'dd-mm-yyyy'), 99128, 5, 100000322, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-02-2007', 'dd-mm-yyyy'), 11095, 6, 100000187, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-03-1994', 'dd-mm-yyyy'), 50177, 7, 100000255, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-06-1993', 'dd-mm-yyyy'), 64366, 8, 100000047, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-01-2009', 'dd-mm-yyyy'), 53433, 9, 100000057, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-05-2016', 'dd-mm-yyyy'), 35919, 10, 100000046, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-10-2000', 'dd-mm-yyyy'), 14185, 11, 100000110, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-01-2021', 'dd-mm-yyyy'), 79643, 12, 100000055, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-02-2010', 'dd-mm-yyyy'), 25999, 13, 100000113, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-07-2004', 'dd-mm-yyyy'), 61118, 14, 100000036, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-05-2015', 'dd-mm-yyyy'), 37249, 15, 100000216, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-10-2007', 'dd-mm-yyyy'), 38980, 16, 100000145, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('31-01-2012', 'dd-mm-yyyy'), 98341, 17, 100000031, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-08-2023', 'dd-mm-yyyy'), 28235, 18, 100000251, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-08-2007', 'dd-mm-yyyy'), 90690, 19, 100000224, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-09-1992', 'dd-mm-yyyy'), 44553, 20, 100000165, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-07-2001', 'dd-mm-yyyy'), 36371, 21, 100000050, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-07-1991', 'dd-mm-yyyy'), 29930, 22, 100000353, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-02-2019', 'dd-mm-yyyy'), 89344, 23, 100000128, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-06-1991', 'dd-mm-yyyy'), 59317, 24, 100000075, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-10-1992', 'dd-mm-yyyy'), 8432, 25, 100000307, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-09-2016', 'dd-mm-yyyy'), 29015, 26, 100000195, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-04-2006', 'dd-mm-yyyy'), 10190, 27, 100000224, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-04-2011', 'dd-mm-yyyy'), 25644, 28, 100000200, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-05-2008', 'dd-mm-yyyy'), 4625, 29, 100000399, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-08-2000', 'dd-mm-yyyy'), 76980, 30, 100000320, 9);
commit;
prompt 200 records committed...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-11-1992', 'dd-mm-yyyy'), 10989, 31, 100000326, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-07-1997', 'dd-mm-yyyy'), 83854, 32, 100000299, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-04-1991', 'dd-mm-yyyy'), 55346, 33, 100000299, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-04-1996', 'dd-mm-yyyy'), 33028, 34, 100000191, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-08-2016', 'dd-mm-yyyy'), 49402, 35, 100000023, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-05-2020', 'dd-mm-yyyy'), 91440, 36, 100000349, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-08-1991', 'dd-mm-yyyy'), 50210, 37, 100000041, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-07-2017', 'dd-mm-yyyy'), 82306, 38, 100000155, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-04-2006', 'dd-mm-yyyy'), 1633, 39, 100000157, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-01-2015', 'dd-mm-yyyy'), 41408, 40, 100000346, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-09-2009', 'dd-mm-yyyy'), 56489, 41, 100000355, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-03-2019', 'dd-mm-yyyy'), 55335, 42, 100000364, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-03-2003', 'dd-mm-yyyy'), 80754, 43, 100000143, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-11-2002', 'dd-mm-yyyy'), 81003, 44, 100000155, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-07-2011', 'dd-mm-yyyy'), 38140, 45, 100000377, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-08-2015', 'dd-mm-yyyy'), 46140, 46, 100000223, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-09-2004', 'dd-mm-yyyy'), 56239, 47, 100000165, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-06-2003', 'dd-mm-yyyy'), 30941, 48, 100000140, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-12-2011', 'dd-mm-yyyy'), 74336, 49, 100000267, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-05-1992', 'dd-mm-yyyy'), 31387, 50, 100000219, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-12-2012', 'dd-mm-yyyy'), 71893, 51, 100000121, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-04-2015', 'dd-mm-yyyy'), 3541, 52, 100000358, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-07-2021', 'dd-mm-yyyy'), 78498, 53, 100000365, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-03-1990', 'dd-mm-yyyy'), 88907, 54, 100000300, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-01-2016', 'dd-mm-yyyy'), 65186, 55, 100000255, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-01-1996', 'dd-mm-yyyy'), 21857, 56, 100000293, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-06-1992', 'dd-mm-yyyy'), 16827, 57, 100000214, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-11-2016', 'dd-mm-yyyy'), 16831, 58, 100000168, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-10-2002', 'dd-mm-yyyy'), 85684, 59, 100000313, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('20-10-2015', 'dd-mm-yyyy'), 38405, 60, 100000080, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-09-2005', 'dd-mm-yyyy'), 26934, 61, 100000343, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-04-1993', 'dd-mm-yyyy'), 51622, 62, 100000037, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-06-2012', 'dd-mm-yyyy'), 14074, 63, 100000008, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-05-1996', 'dd-mm-yyyy'), 53800, 64, 100000076, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-11-2010', 'dd-mm-yyyy'), 36972, 65, 100000322, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-05-2009', 'dd-mm-yyyy'), 87604, 66, 100000164, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-12-2011', 'dd-mm-yyyy'), 80407, 67, 100000133, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-11-2001', 'dd-mm-yyyy'), 35584, 68, 100000085, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-02-2013', 'dd-mm-yyyy'), 84067, 69, 100000131, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('22-05-1995', 'dd-mm-yyyy'), 95294, 70, 100000269, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-04-2014', 'dd-mm-yyyy'), 83618, 71, 100000191, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-10-2012', 'dd-mm-yyyy'), 36859, 72, 100000305, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-09-2019', 'dd-mm-yyyy'), 33346, 73, 100000317, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-10-2011', 'dd-mm-yyyy'), 40234, 74, 100000057, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-01-1990', 'dd-mm-yyyy'), 9662, 75, 100000283, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-01-2010', 'dd-mm-yyyy'), 15214, 76, 100000342, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-04-2020', 'dd-mm-yyyy'), 96178, 77, 100000074, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-09-2023', 'dd-mm-yyyy'), 1622, 78, 100000308, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-08-2020', 'dd-mm-yyyy'), 50248, 79, 100000266, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-03-2024', 'dd-mm-yyyy'), 51262, 80, 100000083, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-03-2002', 'dd-mm-yyyy'), 49692, 81, 100000357, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-02-2019', 'dd-mm-yyyy'), 91144, 82, 100000319, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-02-2003', 'dd-mm-yyyy'), 22165, 83, 100000267, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-02-2013', 'dd-mm-yyyy'), 67669, 84, 100000134, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-11-1999', 'dd-mm-yyyy'), 54720, 85, 100000013, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-01-2024', 'dd-mm-yyyy'), 72101, 86, 100000338, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-10-2009', 'dd-mm-yyyy'), 85317, 87, 100000053, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('22-05-2014', 'dd-mm-yyyy'), 47683, 88, 100000154, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-09-2006', 'dd-mm-yyyy'), 75120, 89, 100000307, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-03-2014', 'dd-mm-yyyy'), 77446, 90, 100000156, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-03-1993', 'dd-mm-yyyy'), 62149, 91, 100000040, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('20-12-2022', 'dd-mm-yyyy'), 53868, 92, 100000350, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-03-2024', 'dd-mm-yyyy'), 96312, 93, 100000100, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-12-1998', 'dd-mm-yyyy'), 29113, 94, 100000264, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-12-2007', 'dd-mm-yyyy'), 55788, 95, 100000222, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-03-2006', 'dd-mm-yyyy'), 47034, 96, 100000009, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-10-2008', 'dd-mm-yyyy'), 44106, 97, 100000305, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-11-2001', 'dd-mm-yyyy'), 56347, 98, 100000126, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-12-2018', 'dd-mm-yyyy'), 69164, 99, 100000062, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-12-2021', 'dd-mm-yyyy'), 4870, 100, 100000057, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-01-2024', 'dd-mm-yyyy'), 3238, 101, 100000317, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-02-2007', 'dd-mm-yyyy'), 14937, 102, 100000273, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-02-2020', 'dd-mm-yyyy'), 23747, 103, 100000357, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-12-1992', 'dd-mm-yyyy'), 40573, 104, 100000049, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('22-12-2014', 'dd-mm-yyyy'), 36296, 105, 100000296, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-12-2008', 'dd-mm-yyyy'), 5446, 106, 100000347, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-09-2014', 'dd-mm-yyyy'), 77978, 107, 100000056, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-03-1997', 'dd-mm-yyyy'), 21979, 108, 100000357, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-03-1995', 'dd-mm-yyyy'), 2653, 109, 100000191, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-12-1991', 'dd-mm-yyyy'), 92243, 110, 100000319, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-02-1996', 'dd-mm-yyyy'), 46595, 111, 100000281, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-06-2007', 'dd-mm-yyyy'), 89799, 112, 100000008, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-04-1993', 'dd-mm-yyyy'), 76701, 113, 100000283, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-06-2015', 'dd-mm-yyyy'), 22532, 114, 100000214, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-04-1997', 'dd-mm-yyyy'), 18774, 115, 100000132, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-09-2009', 'dd-mm-yyyy'), 76940, 116, 100000047, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-09-1998', 'dd-mm-yyyy'), 67277, 117, 100000032, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-10-2021', 'dd-mm-yyyy'), 44289, 118, 100000023, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('31-05-2002', 'dd-mm-yyyy'), 77150, 119, 100000224, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-03-2018', 'dd-mm-yyyy'), 26749, 120, 100000138, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-06-2011', 'dd-mm-yyyy'), 35799, 121, 100000045, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-07-2023', 'dd-mm-yyyy'), 25888, 122, 100000341, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-09-1996', 'dd-mm-yyyy'), 16855, 123, 100000173, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-10-2021', 'dd-mm-yyyy'), 11937, 124, 100000387, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-10-2022', 'dd-mm-yyyy'), 15296, 125, 100000167, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-03-2015', 'dd-mm-yyyy'), 74232, 126, 100000065, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-08-2015', 'dd-mm-yyyy'), 63547, 127, 100000359, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-09-1998', 'dd-mm-yyyy'), 53410, 128, 100000022, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-09-1995', 'dd-mm-yyyy'), 29138, 129, 100000122, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-11-2022', 'dd-mm-yyyy'), 53988, 130, 100000359, 5);
commit;
prompt 300 records committed...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-03-2022', 'dd-mm-yyyy'), 92941, 131, 100000303, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('20-10-2000', 'dd-mm-yyyy'), 39102, 132, 100000312, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-09-2017', 'dd-mm-yyyy'), 9866, 133, 100000346, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-12-2015', 'dd-mm-yyyy'), 5916, 134, 100000260, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-04-1991', 'dd-mm-yyyy'), 49139, 135, 100000143, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-03-1996', 'dd-mm-yyyy'), 42405, 136, 100000265, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-02-2006', 'dd-mm-yyyy'), 17729, 137, 100000232, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-01-1991', 'dd-mm-yyyy'), 65700, 138, 100000033, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-02-1993', 'dd-mm-yyyy'), 63266, 139, 100000194, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-02-2022', 'dd-mm-yyyy'), 41204, 140, 100000264, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-07-1998', 'dd-mm-yyyy'), 59609, 141, 100000110, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-02-2021', 'dd-mm-yyyy'), 83080, 142, 100000078, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-12-2001', 'dd-mm-yyyy'), 72596, 143, 100000195, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-09-1993', 'dd-mm-yyyy'), 36502, 144, 100000037, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-10-1995', 'dd-mm-yyyy'), 7853, 145, 100000231, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-01-1996', 'dd-mm-yyyy'), 40182, 146, 100000331, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-06-2014', 'dd-mm-yyyy'), 39084, 147, 100000354, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-11-1993', 'dd-mm-yyyy'), 71158, 148, 100000280, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-04-2011', 'dd-mm-yyyy'), 18611, 149, 100000222, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-05-2015', 'dd-mm-yyyy'), 70253, 150, 100000327, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-09-1995', 'dd-mm-yyyy'), 68004, 151, 100000123, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-09-2013', 'dd-mm-yyyy'), 48810, 152, 100000223, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-05-2017', 'dd-mm-yyyy'), 51059, 153, 100000101, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-09-1990', 'dd-mm-yyyy'), 76787, 154, 100000238, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-11-1997', 'dd-mm-yyyy'), 27067, 155, 100000065, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-03-2001', 'dd-mm-yyyy'), 52318, 156, 100000094, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-09-1994', 'dd-mm-yyyy'), 85933, 157, 100000024, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-03-2005', 'dd-mm-yyyy'), 51958, 158, 100000126, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-11-2002', 'dd-mm-yyyy'), 64667, 159, 100000151, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-08-2014', 'dd-mm-yyyy'), 62781, 160, 100000357, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-05-2016', 'dd-mm-yyyy'), 44360, 161, 100000234, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('15-06-2018', 'dd-mm-yyyy'), 95356, 162, 100000063, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-06-2006', 'dd-mm-yyyy'), 29202, 163, 100000343, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-03-1996', 'dd-mm-yyyy'), 78182, 164, 100000273, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-09-2021', 'dd-mm-yyyy'), 6393, 165, 100000392, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-06-2019', 'dd-mm-yyyy'), 33109, 166, 100000231, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-07-1998', 'dd-mm-yyyy'), 87209, 167, 100000361, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-02-1994', 'dd-mm-yyyy'), 32209, 168, 100000222, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-07-2003', 'dd-mm-yyyy'), 29938, 169, 100000212, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-03-2007', 'dd-mm-yyyy'), 36025, 170, 100000355, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-03-2013', 'dd-mm-yyyy'), 42793, 171, 100000151, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-12-2004', 'dd-mm-yyyy'), 12791, 172, 100000194, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 69585, 173, 100000131, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-09-2005', 'dd-mm-yyyy'), 38914, 174, 100000241, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-08-2005', 'dd-mm-yyyy'), 55665, 175, 100000300, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-07-2023', 'dd-mm-yyyy'), 81029, 176, 100000216, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-02-2020', 'dd-mm-yyyy'), 95243, 177, 100000037, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('20-03-2010', 'dd-mm-yyyy'), 59023, 178, 100000031, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-11-2004', 'dd-mm-yyyy'), 60464, 179, 100000365, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-08-2023', 'dd-mm-yyyy'), 90127, 180, 100000202, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-06-1996', 'dd-mm-yyyy'), 10965, 181, 100000128, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-04-2002', 'dd-mm-yyyy'), 14970, 182, 100000238, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-07-1991', 'dd-mm-yyyy'), 85193, 183, 100000347, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-01-2007', 'dd-mm-yyyy'), 3819, 184, 100000253, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-05-2000', 'dd-mm-yyyy'), 73290, 185, 100000277, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-06-1999', 'dd-mm-yyyy'), 45170, 186, 100000399, 18);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('25-10-2015', 'dd-mm-yyyy'), 70152, 187, 100000330, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('13-01-2019', 'dd-mm-yyyy'), 15012, 188, 100000240, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-02-2002', 'dd-mm-yyyy'), 10859, 189, 100000231, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('02-12-2000', 'dd-mm-yyyy'), 27069, 190, 100000344, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('14-02-2006', 'dd-mm-yyyy'), 86466, 191, 100000264, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('05-03-1991', 'dd-mm-yyyy'), 65002, 192, 100000193, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('16-07-2012', 'dd-mm-yyyy'), 42163, 193, 100000357, 6);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('21-04-2003', 'dd-mm-yyyy'), 95378, 194, 100000329, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-09-1990', 'dd-mm-yyyy'), 55115, 195, 100000051, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-03-1997', 'dd-mm-yyyy'), 62015, 196, 100000115, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-12-1994', 'dd-mm-yyyy'), 95060, 197, 100000251, 11);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('08-03-2015', 'dd-mm-yyyy'), 61395, 198, 100000103, 2);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-04-2009', 'dd-mm-yyyy'), 65372, 199, 100000381, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('31-12-1992', 'dd-mm-yyyy'), 99738, 200, 100000332, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('10-10-2017', 'dd-mm-yyyy'), 25313, 201, 100000132, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-07-2003', 'dd-mm-yyyy'), 31149, 202, 100000307, 7);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-10-1990', 'dd-mm-yyyy'), 93827, 203, 100000038, 8);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-06-2003', 'dd-mm-yyyy'), 76444, 204, 100000354, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('04-06-1994', 'dd-mm-yyyy'), 34923, 205, 100000387, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('03-01-2012', 'dd-mm-yyyy'), 24522, 206, 100000313, 19);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-12-2008', 'dd-mm-yyyy'), 23120, 207, 100000176, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('24-12-1999', 'dd-mm-yyyy'), 13431, 208, 100000175, 15);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('01-12-2007', 'dd-mm-yyyy'), 91458, 209, 100000212, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-11-2003', 'dd-mm-yyyy'), 93884, 210, 100000344, 1);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('17-02-2022', 'dd-mm-yyyy'), 60278, 211, 100000370, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('07-12-2018', 'dd-mm-yyyy'), 73750, 212, 100000100, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-04-2016', 'dd-mm-yyyy'), 46679, 213, 100000141, 20);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('28-09-2014', 'dd-mm-yyyy'), 43119, 214, 100000288, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-11-1991', 'dd-mm-yyyy'), 56135, 215, 100000053, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-05-2004', 'dd-mm-yyyy'), 81431, 216, 100000190, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('09-06-2005', 'dd-mm-yyyy'), 54882, 217, 100000397, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-08-1995', 'dd-mm-yyyy'), 45768, 218, 100000211, 14);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-10-2000', 'dd-mm-yyyy'), 23576, 219, 100000331, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('12-06-1995', 'dd-mm-yyyy'), 39725, 220, 100000223, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('27-10-2003', 'dd-mm-yyyy'), 92120, 221, 100000286, 10);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('18-12-1999', 'dd-mm-yyyy'), 64346, 222, 100000033, 5);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-10-1992', 'dd-mm-yyyy'), 56358, 223, 100000278, 13);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('06-06-2003', 'dd-mm-yyyy'), 49925, 224, 100000202, 9);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('23-08-1994', 'dd-mm-yyyy'), 74839, 225, 100000333, 3);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('29-03-1992', 'dd-mm-yyyy'), 68883, 226, 100000095, 12);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('30-01-1994', 'dd-mm-yyyy'), 48147, 227, 100000377, 16);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('26-09-1992', 'dd-mm-yyyy'), 30405, 228, 100000257, 4);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('19-07-1999', 'dd-mm-yyyy'), 78406, 229, 100000153, 17);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id, community_id)
values (to_date('11-09-2000', 'dd-mm-yyyy'), 55653, 230, 100000386, 17);
commit;
prompt 400 records loaded
prompt Loading EXTERNAL_DONOR...
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000152, 1);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000101, 2);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000248, 3);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000096, 4);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000321, 5);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000399, 6);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000260, 7);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000317, 8);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000038, 9);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000317, 10);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000349, 11);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000077, 12);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000357, 13);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000310, 14);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000326, 15);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000128, 16);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000073, 17);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000281, 18);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000214, 19);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000285, 20);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000393, 21);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000126, 22);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000074, 23);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000321, 24);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000067, 25);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000302, 26);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000284, 27);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000346, 28);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000154, 29);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000239, 30);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000283, 31);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000202, 32);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000253, 33);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000100, 34);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000202, 35);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000352, 36);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000348, 37);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000342, 38);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000281, 39);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000176, 40);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000152, 41);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000342, 42);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000284, 43);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000291, 44);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000039, 45);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000051, 46);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000138, 47);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000135, 48);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000071, 49);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000306, 50);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000140, 51);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000155, 52);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000010, 53);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000293, 54);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000064, 55);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000293, 56);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000369, 57);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000138, 58);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000217, 59);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000032, 60);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000204, 61);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000095, 62);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000095, 63);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000279, 64);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000175, 65);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000378, 66);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000002, 67);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000053, 68);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000341, 69);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000264, 70);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000018, 71);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000208, 72);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000383, 73);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000329, 74);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000022, 75);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000365, 76);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000180, 77);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000010, 78);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000335, 79);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000077, 80);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000350, 81);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000365, 82);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000180, 83);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000110, 84);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000210, 85);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000078, 86);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000180, 87);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000242, 88);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000167, 89);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000160, 90);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000165, 91);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000045, 92);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000363, 93);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000082, 94);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000017, 95);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000226, 96);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000256, 97);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000351, 98);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000186, 99);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000163, 100);
commit;
prompt 100 records committed...
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000302, 101);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000210, 102);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000268, 103);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000312, 104);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000380, 105);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000264, 106);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000270, 107);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000171, 108);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000286, 109);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000398, 110);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000166, 111);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000190, 112);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000166, 113);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000226, 114);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000253, 115);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000189, 116);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000230, 117);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000343, 118);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000071, 119);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000383, 120);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000191, 121);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000366, 122);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000327, 123);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000238, 124);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000215, 125);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000108, 126);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000248, 127);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000312, 128);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000097, 129);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000348, 130);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000290, 131);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000393, 132);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000063, 133);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000023, 134);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000097, 135);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000040, 136);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000116, 137);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000003, 138);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000101, 139);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000114, 140);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000239, 141);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000217, 142);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000212, 143);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000162, 144);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000105, 145);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000132, 146);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000039, 147);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000352, 148);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000276, 149);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000083, 150);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000024, 151);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000167, 152);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000277, 153);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000265, 154);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000043, 155);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000163, 156);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000167, 157);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000071, 158);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000289, 159);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000231, 160);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000246, 161);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000358, 162);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000364, 163);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000346, 164);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000038, 165);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000095, 166);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000036, 167);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000157, 168);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000299, 169);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000079, 170);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000165, 171);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000351, 172);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000335, 173);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000066, 174);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000275, 175);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000296, 176);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000053, 177);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000057, 178);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000189, 179);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000079, 180);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000374, 181);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000119, 182);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000169, 183);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000310, 184);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000121, 185);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000034, 186);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000237, 187);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000345, 188);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000224, 189);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000241, 190);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000066, 191);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000302, 192);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000113, 193);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000061, 194);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000241, 195);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000000, 196);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000057, 197);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000241, 198);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000043, 199);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000285, 200);
commit;
prompt 200 records loaded
prompt Loading SPENDING...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 924, to_date('19-11-1997', 'dd-mm-yyyy'), 194, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 476, to_date('10-04-1995', 'dd-mm-yyyy'), 195, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 432, to_date('15-02-2018', 'dd-mm-yyyy'), 196, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 393, to_date('30-04-2022', 'dd-mm-yyyy'), 197, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 477, to_date('25-10-2010', 'dd-mm-yyyy'), 198, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 345, to_date('17-05-2024', 'dd-mm-yyyy'), 199, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 897, to_date('25-06-1996', 'dd-mm-yyyy'), 200, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 343, to_date('24-10-2017', 'dd-mm-yyyy'), 201, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 378, to_date('01-06-2016', 'dd-mm-yyyy'), 202, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 489, to_date('04-05-2001', 'dd-mm-yyyy'), 203, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 667, to_date('23-01-1996', 'dd-mm-yyyy'), 204, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 744, to_date('11-01-2001', 'dd-mm-yyyy'), 205, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 833, to_date('30-05-2023', 'dd-mm-yyyy'), 206, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 558, to_date('20-05-2014', 'dd-mm-yyyy'), 207, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 515, to_date('09-04-2010', 'dd-mm-yyyy'), 208, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 474, to_date('15-11-1990', 'dd-mm-yyyy'), 209, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 936, to_date('12-05-2009', 'dd-mm-yyyy'), 210, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 794, to_date('17-02-2021', 'dd-mm-yyyy'), 211, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 872, to_date('03-07-2017', 'dd-mm-yyyy'), 212, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 820, to_date('04-03-2012', 'dd-mm-yyyy'), 213, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 909, to_date('08-10-2021', 'dd-mm-yyyy'), 214, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 758, to_date('26-06-2018', 'dd-mm-yyyy'), 215, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 557, to_date('25-05-2013', 'dd-mm-yyyy'), 216, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 700, to_date('10-05-1990', 'dd-mm-yyyy'), 217, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 832, to_date('11-11-2003', 'dd-mm-yyyy'), 218, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 862, to_date('23-01-2006', 'dd-mm-yyyy'), 219, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 412, to_date('31-08-2008', 'dd-mm-yyyy'), 220, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 301, to_date('05-02-1990', 'dd-mm-yyyy'), 221, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 767, to_date('25-11-1998', 'dd-mm-yyyy'), 222, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 399, to_date('18-06-2018', 'dd-mm-yyyy'), 223, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 635, to_date('23-07-1992', 'dd-mm-yyyy'), 224, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 509, to_date('12-10-2006', 'dd-mm-yyyy'), 225, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 897, to_date('24-05-2010', 'dd-mm-yyyy'), 226, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 479, to_date('24-11-2019', 'dd-mm-yyyy'), 227, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 901, to_date('07-07-1999', 'dd-mm-yyyy'), 228, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 937, to_date('16-09-1998', 'dd-mm-yyyy'), 229, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 956, to_date('16-12-1999', 'dd-mm-yyyy'), 230, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 652, to_date('30-03-2005', 'dd-mm-yyyy'), 231, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 504, to_date('17-10-2003', 'dd-mm-yyyy'), 232, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 759, to_date('10-08-2022', 'dd-mm-yyyy'), 233, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 355, to_date('10-10-2022', 'dd-mm-yyyy'), 234, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 449, to_date('01-12-1997', 'dd-mm-yyyy'), 235, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 586, to_date('19-07-2020', 'dd-mm-yyyy'), 236, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 941, to_date('15-08-1990', 'dd-mm-yyyy'), 237, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 420, to_date('09-01-2019', 'dd-mm-yyyy'), 238, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 905, to_date('19-04-2013', 'dd-mm-yyyy'), 239, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 764, to_date('16-06-2000', 'dd-mm-yyyy'), 240, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 871, to_date('24-03-2012', 'dd-mm-yyyy'), 241, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 319, to_date('24-02-2018', 'dd-mm-yyyy'), 242, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 494, to_date('05-03-2022', 'dd-mm-yyyy'), 243, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 664, to_date('07-08-1999', 'dd-mm-yyyy'), 244, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 594, to_date('13-08-2013', 'dd-mm-yyyy'), 245, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 695, to_date('09-02-1999', 'dd-mm-yyyy'), 246, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 862, to_date('01-06-2017', 'dd-mm-yyyy'), 247, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 753, to_date('07-04-2005', 'dd-mm-yyyy'), 248, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 938, to_date('14-10-2010', 'dd-mm-yyyy'), 249, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 997, to_date('31-05-1991', 'dd-mm-yyyy'), 250, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 653, to_date('26-10-2011', 'dd-mm-yyyy'), 251, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 368, to_date('24-08-2002', 'dd-mm-yyyy'), 252, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 847, to_date('07-03-2004', 'dd-mm-yyyy'), 253, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 309, to_date('07-03-2004', 'dd-mm-yyyy'), 254, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 545, to_date('16-07-2001', 'dd-mm-yyyy'), 255, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 653, to_date('22-01-2007', 'dd-mm-yyyy'), 256, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 314, to_date('12-12-2010', 'dd-mm-yyyy'), 257, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 987, to_date('31-12-2023', 'dd-mm-yyyy'), 258, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 580, to_date('13-05-1998', 'dd-mm-yyyy'), 259, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 480, to_date('30-12-1992', 'dd-mm-yyyy'), 260, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 514, to_date('18-12-1993', 'dd-mm-yyyy'), 261, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 382, to_date('26-09-2012', 'dd-mm-yyyy'), 262, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 995, to_date('22-02-1993', 'dd-mm-yyyy'), 263, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 789, to_date('18-03-1995', 'dd-mm-yyyy'), 264, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 428, to_date('27-04-1997', 'dd-mm-yyyy'), 265, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 780, to_date('26-08-2008', 'dd-mm-yyyy'), 266, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 950, to_date('18-06-2022', 'dd-mm-yyyy'), 267, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 517, to_date('23-04-2003', 'dd-mm-yyyy'), 268, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 481, to_date('19-07-2006', 'dd-mm-yyyy'), 269, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 425, to_date('02-01-2021', 'dd-mm-yyyy'), 270, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 766, to_date('12-06-1994', 'dd-mm-yyyy'), 271, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 928, to_date('16-01-1994', 'dd-mm-yyyy'), 272, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 570, to_date('07-04-2015', 'dd-mm-yyyy'), 273, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 659, to_date('29-06-1993', 'dd-mm-yyyy'), 274, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 651, to_date('11-04-1996', 'dd-mm-yyyy'), 275, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 844, to_date('15-12-1997', 'dd-mm-yyyy'), 276, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 898, to_date('17-01-2023', 'dd-mm-yyyy'), 277, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 444, to_date('21-07-2008', 'dd-mm-yyyy'), 278, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 834, to_date('17-10-2016', 'dd-mm-yyyy'), 279, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 978, to_date('05-01-1994', 'dd-mm-yyyy'), 280, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 700, to_date('07-11-1998', 'dd-mm-yyyy'), 281, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 700, to_date('15-12-2009', 'dd-mm-yyyy'), 282, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 993, to_date('23-02-2013', 'dd-mm-yyyy'), 283, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 563, to_date('03-09-2010', 'dd-mm-yyyy'), 284, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 480, to_date('04-07-2016', 'dd-mm-yyyy'), 285, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 935, to_date('04-02-2007', 'dd-mm-yyyy'), 286, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 388, to_date('16-11-2011', 'dd-mm-yyyy'), 287, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 989, to_date('07-07-2020', 'dd-mm-yyyy'), 288, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 743, to_date('17-09-2011', 'dd-mm-yyyy'), 289, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 771, to_date('07-01-2004', 'dd-mm-yyyy'), 290, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 797, to_date('09-07-2003', 'dd-mm-yyyy'), 291, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 323, to_date('29-11-2006', 'dd-mm-yyyy'), 292, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 717, to_date('22-09-2020', 'dd-mm-yyyy'), 293, 17);
commit;
prompt 100 records committed...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 785, to_date('10-04-1997', 'dd-mm-yyyy'), 294, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 337, to_date('23-04-2009', 'dd-mm-yyyy'), 295, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 454, to_date('08-04-1996', 'dd-mm-yyyy'), 296, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 593, to_date('14-03-2006', 'dd-mm-yyyy'), 297, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 531, to_date('10-03-2008', 'dd-mm-yyyy'), 298, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 607, to_date('10-03-2010', 'dd-mm-yyyy'), 299, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 914, to_date('25-06-2021', 'dd-mm-yyyy'), 300, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 957, to_date('17-08-1992', 'dd-mm-yyyy'), 301, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 777, to_date('18-11-2011', 'dd-mm-yyyy'), 302, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 507, to_date('21-06-2013', 'dd-mm-yyyy'), 303, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 411, to_date('22-07-2016', 'dd-mm-yyyy'), 304, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 813, to_date('31-05-1995', 'dd-mm-yyyy'), 305, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 833, to_date('05-12-2003', 'dd-mm-yyyy'), 306, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 581, to_date('15-04-2016', 'dd-mm-yyyy'), 307, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 465, to_date('28-11-2020', 'dd-mm-yyyy'), 308, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 521, to_date('10-09-2018', 'dd-mm-yyyy'), 309, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 784, to_date('23-03-1998', 'dd-mm-yyyy'), 310, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 340, to_date('13-06-2003', 'dd-mm-yyyy'), 311, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 635, to_date('03-03-2005', 'dd-mm-yyyy'), 312, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 528, to_date('18-10-2018', 'dd-mm-yyyy'), 313, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 920, to_date('02-06-1990', 'dd-mm-yyyy'), 314, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 496, to_date('01-02-2014', 'dd-mm-yyyy'), 315, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 751, to_date('02-09-2006', 'dd-mm-yyyy'), 316, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 796, to_date('21-04-2005', 'dd-mm-yyyy'), 317, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 470, to_date('03-03-1990', 'dd-mm-yyyy'), 318, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 996, to_date('21-11-2001', 'dd-mm-yyyy'), 319, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 345, to_date('24-01-2024', 'dd-mm-yyyy'), 320, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 935, to_date('03-07-2004', 'dd-mm-yyyy'), 321, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 529, to_date('31-12-2018', 'dd-mm-yyyy'), 322, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 445, to_date('26-12-2004', 'dd-mm-yyyy'), 323, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 887, to_date('08-03-2015', 'dd-mm-yyyy'), 324, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 334, to_date('27-10-2022', 'dd-mm-yyyy'), 325, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 693, to_date('30-11-2004', 'dd-mm-yyyy'), 326, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 449, to_date('02-03-2006', 'dd-mm-yyyy'), 327, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 305, to_date('07-02-1998', 'dd-mm-yyyy'), 328, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 395, to_date('06-04-2010', 'dd-mm-yyyy'), 329, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 589, to_date('12-02-2021', 'dd-mm-yyyy'), 330, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 838, to_date('16-07-1999', 'dd-mm-yyyy'), 331, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 830, to_date('03-08-2014', 'dd-mm-yyyy'), 332, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 459, to_date('27-11-1995', 'dd-mm-yyyy'), 333, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 704, to_date('02-08-2008', 'dd-mm-yyyy'), 334, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 496, to_date('17-10-2022', 'dd-mm-yyyy'), 335, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 717, to_date('26-04-1990', 'dd-mm-yyyy'), 336, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 740, to_date('30-11-2016', 'dd-mm-yyyy'), 337, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 420, to_date('14-10-2014', 'dd-mm-yyyy'), 338, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 301, to_date('04-06-2017', 'dd-mm-yyyy'), 339, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 682, to_date('23-12-2007', 'dd-mm-yyyy'), 340, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 356, to_date('10-03-2013', 'dd-mm-yyyy'), 341, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 944, to_date('19-06-2019', 'dd-mm-yyyy'), 342, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 448, to_date('12-08-1998', 'dd-mm-yyyy'), 343, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 529, to_date('18-06-1995', 'dd-mm-yyyy'), 344, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 965, to_date('27-03-1997', 'dd-mm-yyyy'), 345, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 535, to_date('03-05-2001', 'dd-mm-yyyy'), 346, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 582, to_date('29-08-2018', 'dd-mm-yyyy'), 347, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 684, to_date('21-12-1998', 'dd-mm-yyyy'), 348, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 583, to_date('13-08-2017', 'dd-mm-yyyy'), 349, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 946, to_date('28-09-2004', 'dd-mm-yyyy'), 350, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 632, to_date('26-10-1992', 'dd-mm-yyyy'), 351, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 928, to_date('29-10-2008', 'dd-mm-yyyy'), 352, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 733, to_date('02-03-2019', 'dd-mm-yyyy'), 353, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 540, to_date('10-11-1999', 'dd-mm-yyyy'), 354, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 942, to_date('19-10-2006', 'dd-mm-yyyy'), 355, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 521, to_date('25-09-1991', 'dd-mm-yyyy'), 356, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 961, to_date('16-11-2012', 'dd-mm-yyyy'), 357, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 736, to_date('08-03-2018', 'dd-mm-yyyy'), 358, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 996, to_date('11-12-2004', 'dd-mm-yyyy'), 359, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 444, to_date('03-11-1991', 'dd-mm-yyyy'), 360, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 376, to_date('11-12-2004', 'dd-mm-yyyy'), 361, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 531, to_date('04-10-2012', 'dd-mm-yyyy'), 362, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 958, to_date('17-07-1994', 'dd-mm-yyyy'), 363, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 720, to_date('18-12-1990', 'dd-mm-yyyy'), 364, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 579, to_date('09-08-1994', 'dd-mm-yyyy'), 365, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 835, to_date('26-08-1993', 'dd-mm-yyyy'), 366, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 399, to_date('30-03-2009', 'dd-mm-yyyy'), 367, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 551, to_date('03-09-2009', 'dd-mm-yyyy'), 368, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 894, to_date('21-05-2006', 'dd-mm-yyyy'), 369, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 399, to_date('22-05-1991', 'dd-mm-yyyy'), 370, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 528, to_date('20-09-2003', 'dd-mm-yyyy'), 371, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 548, to_date('25-11-2001', 'dd-mm-yyyy'), 372, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 596, to_date('03-03-2019', 'dd-mm-yyyy'), 373, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 852, to_date('23-05-2020', 'dd-mm-yyyy'), 374, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 824, to_date('09-07-2023', 'dd-mm-yyyy'), 375, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 764, to_date('04-06-1990', 'dd-mm-yyyy'), 376, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 449, to_date('01-06-1998', 'dd-mm-yyyy'), 377, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 525, to_date('16-01-2008', 'dd-mm-yyyy'), 378, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 566, to_date('30-06-1996', 'dd-mm-yyyy'), 379, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 819, to_date('29-11-1995', 'dd-mm-yyyy'), 380, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 734, to_date('05-04-1997', 'dd-mm-yyyy'), 381, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 890, to_date('09-12-1998', 'dd-mm-yyyy'), 382, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 366, to_date('26-11-2005', 'dd-mm-yyyy'), 383, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 739, to_date('07-05-2000', 'dd-mm-yyyy'), 384, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 677, to_date('18-09-2016', 'dd-mm-yyyy'), 385, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 382, to_date('21-02-2015', 'dd-mm-yyyy'), 386, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 902, to_date('27-12-2012', 'dd-mm-yyyy'), 387, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 382, to_date('18-09-2013', 'dd-mm-yyyy'), 388, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 686, to_date('14-07-2003', 'dd-mm-yyyy'), 389, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 843, to_date('10-08-2019', 'dd-mm-yyyy'), 390, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 942, to_date('23-06-1992', 'dd-mm-yyyy'), 391, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 976, to_date('06-01-2003', 'dd-mm-yyyy'), 392, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 376, to_date('31-01-2020', 'dd-mm-yyyy'), 393, 17);
commit;
prompt 200 records committed...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 638, to_date('03-04-2017', 'dd-mm-yyyy'), 394, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 984, to_date('25-03-1999', 'dd-mm-yyyy'), 395, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 336, to_date('07-05-1993', 'dd-mm-yyyy'), 396, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 809, to_date('11-05-2001', 'dd-mm-yyyy'), 397, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 399, to_date('02-06-2018', 'dd-mm-yyyy'), 398, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 581, to_date('21-01-1994', 'dd-mm-yyyy'), 399, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 716, to_date('10-12-1996', 'dd-mm-yyyy'), 400, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 578, to_date('29-05-1996', 'dd-mm-yyyy'), 1, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 500, to_date('25-03-1995', 'dd-mm-yyyy'), 2, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 915, to_date('09-04-1994', 'dd-mm-yyyy'), 3, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 429, to_date('27-05-2020', 'dd-mm-yyyy'), 4, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 411, to_date('30-07-1990', 'dd-mm-yyyy'), 5, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 490, to_date('07-07-2002', 'dd-mm-yyyy'), 6, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 425, to_date('20-03-1992', 'dd-mm-yyyy'), 7, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 445, to_date('01-06-2012', 'dd-mm-yyyy'), 8, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 870, to_date('28-09-1991', 'dd-mm-yyyy'), 9, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 615, to_date('24-07-2010', 'dd-mm-yyyy'), 10, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 656, to_date('04-11-2004', 'dd-mm-yyyy'), 11, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 480, to_date('11-01-2020', 'dd-mm-yyyy'), 12, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 962, to_date('31-03-2012', 'dd-mm-yyyy'), 13, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 654, to_date('25-01-1992', 'dd-mm-yyyy'), 14, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 658, to_date('10-12-2006', 'dd-mm-yyyy'), 15, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 527, to_date('01-11-2017', 'dd-mm-yyyy'), 16, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 716, to_date('01-03-2009', 'dd-mm-yyyy'), 17, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 677, to_date('21-10-1991', 'dd-mm-yyyy'), 18, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 771, to_date('24-09-2014', 'dd-mm-yyyy'), 19, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 943, to_date('28-10-1999', 'dd-mm-yyyy'), 20, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 466, to_date('25-04-2014', 'dd-mm-yyyy'), 21, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 478, to_date('30-03-2021', 'dd-mm-yyyy'), 22, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 654, to_date('22-11-2014', 'dd-mm-yyyy'), 23, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 468, to_date('16-08-2011', 'dd-mm-yyyy'), 24, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 980, to_date('06-07-1994', 'dd-mm-yyyy'), 25, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 410, to_date('04-01-2022', 'dd-mm-yyyy'), 26, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 818, to_date('03-11-1996', 'dd-mm-yyyy'), 27, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 572, to_date('22-09-2010', 'dd-mm-yyyy'), 28, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 792, to_date('07-06-2021', 'dd-mm-yyyy'), 29, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 811, to_date('04-05-2001', 'dd-mm-yyyy'), 30, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 654, to_date('12-05-2019', 'dd-mm-yyyy'), 31, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 670, to_date('20-12-2001', 'dd-mm-yyyy'), 32, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 536, to_date('20-03-1994', 'dd-mm-yyyy'), 33, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 735, to_date('16-07-1995', 'dd-mm-yyyy'), 34, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 670, to_date('16-01-2002', 'dd-mm-yyyy'), 35, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 364, to_date('25-12-2000', 'dd-mm-yyyy'), 36, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 975, to_date('16-10-2015', 'dd-mm-yyyy'), 37, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 889, to_date('04-01-1999', 'dd-mm-yyyy'), 38, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 515, to_date('14-05-1998', 'dd-mm-yyyy'), 39, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 974, to_date('12-08-1997', 'dd-mm-yyyy'), 40, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 329, to_date('28-03-2012', 'dd-mm-yyyy'), 41, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 959, to_date('08-07-1996', 'dd-mm-yyyy'), 42, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 519, to_date('13-07-2021', 'dd-mm-yyyy'), 43, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 761, to_date('10-08-2022', 'dd-mm-yyyy'), 44, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 716, to_date('01-12-2005', 'dd-mm-yyyy'), 45, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 444, to_date('09-06-1995', 'dd-mm-yyyy'), 46, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 414, to_date('20-11-2007', 'dd-mm-yyyy'), 47, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 666, to_date('27-10-2007', 'dd-mm-yyyy'), 48, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 570, to_date('26-01-2010', 'dd-mm-yyyy'), 49, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 885, to_date('09-08-2023', 'dd-mm-yyyy'), 50, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 874, to_date('24-03-2021', 'dd-mm-yyyy'), 51, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 941, to_date('08-07-1990', 'dd-mm-yyyy'), 52, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 385, to_date('13-04-1992', 'dd-mm-yyyy'), 53, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 398, to_date('13-12-2023', 'dd-mm-yyyy'), 54, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 842, to_date('22-10-2009', 'dd-mm-yyyy'), 55, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 573, to_date('28-12-2007', 'dd-mm-yyyy'), 56, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 737, to_date('13-12-2009', 'dd-mm-yyyy'), 57, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 807, to_date('16-05-2024', 'dd-mm-yyyy'), 58, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 461, to_date('10-08-2010', 'dd-mm-yyyy'), 59, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 928, to_date('15-03-1992', 'dd-mm-yyyy'), 60, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 319, to_date('10-09-2001', 'dd-mm-yyyy'), 61, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 769, to_date('25-12-1997', 'dd-mm-yyyy'), 62, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 509, to_date('29-07-2009', 'dd-mm-yyyy'), 63, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 967, to_date('20-06-2008', 'dd-mm-yyyy'), 64, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 975, to_date('23-08-1991', 'dd-mm-yyyy'), 65, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 812, to_date('21-07-1998', 'dd-mm-yyyy'), 66, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 424, to_date('11-04-2008', 'dd-mm-yyyy'), 67, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 888, to_date('22-06-2012', 'dd-mm-yyyy'), 68, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 823, to_date('26-06-2018', 'dd-mm-yyyy'), 69, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 662, to_date('04-10-2020', 'dd-mm-yyyy'), 70, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 542, to_date('05-10-2021', 'dd-mm-yyyy'), 71, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 856, to_date('21-02-2020', 'dd-mm-yyyy'), 72, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 695, to_date('02-09-1995', 'dd-mm-yyyy'), 73, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 778, to_date('07-01-1998', 'dd-mm-yyyy'), 74, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 824, to_date('01-08-2007', 'dd-mm-yyyy'), 75, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 429, to_date('09-04-2002', 'dd-mm-yyyy'), 76, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 765, to_date('08-12-2018', 'dd-mm-yyyy'), 77, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 377, to_date('16-10-2006', 'dd-mm-yyyy'), 78, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 986, to_date('11-04-2001', 'dd-mm-yyyy'), 79, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 796, to_date('06-01-2020', 'dd-mm-yyyy'), 80, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 678, to_date('29-01-2020', 'dd-mm-yyyy'), 81, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 375, to_date('28-07-2023', 'dd-mm-yyyy'), 82, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 635, to_date('02-01-2011', 'dd-mm-yyyy'), 83, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 702, to_date('15-04-2016', 'dd-mm-yyyy'), 84, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 385, to_date('28-08-2005', 'dd-mm-yyyy'), 85, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 708, to_date('23-07-1991', 'dd-mm-yyyy'), 86, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 800, to_date('20-05-2015', 'dd-mm-yyyy'), 87, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 784, to_date('20-01-2020', 'dd-mm-yyyy'), 88, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 972, to_date('10-06-2020', 'dd-mm-yyyy'), 89, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 468, to_date('14-07-1990', 'dd-mm-yyyy'), 90, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 556, to_date('04-10-1995', 'dd-mm-yyyy'), 91, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 899, to_date('17-07-2006', 'dd-mm-yyyy'), 92, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 588, to_date('13-08-2007', 'dd-mm-yyyy'), 93, 5);
commit;
prompt 300 records committed...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 836, to_date('14-11-1993', 'dd-mm-yyyy'), 94, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 664, to_date('08-11-2002', 'dd-mm-yyyy'), 95, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 957, to_date('04-05-1998', 'dd-mm-yyyy'), 96, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 888, to_date('31-01-2013', 'dd-mm-yyyy'), 97, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 310, to_date('03-01-2004', 'dd-mm-yyyy'), 98, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 897, to_date('03-01-2017', 'dd-mm-yyyy'), 99, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 352, to_date('26-05-1994', 'dd-mm-yyyy'), 100, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 847, to_date('17-04-2011', 'dd-mm-yyyy'), 101, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 439, to_date('17-11-2015', 'dd-mm-yyyy'), 102, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 873, to_date('29-10-2014', 'dd-mm-yyyy'), 103, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 895, to_date('25-04-2002', 'dd-mm-yyyy'), 104, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 408, to_date('11-04-2006', 'dd-mm-yyyy'), 105, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 350, to_date('15-10-2014', 'dd-mm-yyyy'), 106, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 887, to_date('09-06-2001', 'dd-mm-yyyy'), 107, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 641, to_date('04-10-2001', 'dd-mm-yyyy'), 108, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 601, to_date('12-02-1995', 'dd-mm-yyyy'), 109, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 384, to_date('26-08-2008', 'dd-mm-yyyy'), 110, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 639, to_date('09-05-2008', 'dd-mm-yyyy'), 111, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 322, to_date('22-02-2011', 'dd-mm-yyyy'), 112, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 882, to_date('15-03-2000', 'dd-mm-yyyy'), 113, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 827, to_date('07-06-1991', 'dd-mm-yyyy'), 114, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 772, to_date('30-06-2022', 'dd-mm-yyyy'), 115, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 682, to_date('28-08-2016', 'dd-mm-yyyy'), 116, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 657, to_date('05-04-1998', 'dd-mm-yyyy'), 117, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 634, to_date('26-10-2009', 'dd-mm-yyyy'), 118, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 894, to_date('12-06-2018', 'dd-mm-yyyy'), 119, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 503, to_date('11-07-2004', 'dd-mm-yyyy'), 120, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 823, to_date('31-05-2021', 'dd-mm-yyyy'), 121, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 371, to_date('11-06-2023', 'dd-mm-yyyy'), 122, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 416, to_date('22-09-1990', 'dd-mm-yyyy'), 123, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 939, to_date('06-04-1993', 'dd-mm-yyyy'), 124, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 389, to_date('05-06-2017', 'dd-mm-yyyy'), 125, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 941, to_date('09-12-2005', 'dd-mm-yyyy'), 126, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 784, to_date('07-06-2020', 'dd-mm-yyyy'), 127, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 745, to_date('09-02-1997', 'dd-mm-yyyy'), 128, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 816, to_date('27-07-2019', 'dd-mm-yyyy'), 129, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 910, to_date('17-08-2011', 'dd-mm-yyyy'), 130, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 701, to_date('10-11-1997', 'dd-mm-yyyy'), 131, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 612, to_date('25-11-2023', 'dd-mm-yyyy'), 132, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 539, to_date('06-11-2006', 'dd-mm-yyyy'), 133, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 848, to_date('21-04-2001', 'dd-mm-yyyy'), 134, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 472, to_date('17-10-1998', 'dd-mm-yyyy'), 135, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 496, to_date('29-01-2004', 'dd-mm-yyyy'), 136, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 709, to_date('28-01-2005', 'dd-mm-yyyy'), 137, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 655, to_date('27-02-2012', 'dd-mm-yyyy'), 138, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 724, to_date('17-02-2007', 'dd-mm-yyyy'), 139, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 448, to_date('31-12-1994', 'dd-mm-yyyy'), 140, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 415, to_date('30-11-2015', 'dd-mm-yyyy'), 141, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 393, to_date('15-12-2017', 'dd-mm-yyyy'), 142, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 441, to_date('11-12-2015', 'dd-mm-yyyy'), 143, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 748, to_date('28-09-2006', 'dd-mm-yyyy'), 144, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 320, to_date('12-09-2014', 'dd-mm-yyyy'), 145, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 417, to_date('26-09-1995', 'dd-mm-yyyy'), 146, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 599, to_date('01-12-1990', 'dd-mm-yyyy'), 147, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 635, to_date('17-12-1999', 'dd-mm-yyyy'), 148, 7);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 693, to_date('17-02-2017', 'dd-mm-yyyy'), 149, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 808, to_date('13-06-1992', 'dd-mm-yyyy'), 150, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 791, to_date('29-10-2005', 'dd-mm-yyyy'), 151, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 536, to_date('12-05-2021', 'dd-mm-yyyy'), 152, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 834, to_date('20-04-2008', 'dd-mm-yyyy'), 153, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 798, to_date('10-08-2019', 'dd-mm-yyyy'), 154, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 760, to_date('19-07-1999', 'dd-mm-yyyy'), 155, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 802, to_date('07-02-1995', 'dd-mm-yyyy'), 156, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 615, to_date('10-05-2009', 'dd-mm-yyyy'), 157, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 310, to_date('17-09-2016', 'dd-mm-yyyy'), 158, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 535, to_date('27-09-2014', 'dd-mm-yyyy'), 159, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 434, to_date('02-12-1995', 'dd-mm-yyyy'), 160, 9);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 601, to_date('10-07-2006', 'dd-mm-yyyy'), 161, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 788, to_date('21-02-2021', 'dd-mm-yyyy'), 162, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 556, to_date('04-09-2023', 'dd-mm-yyyy'), 163, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 721, to_date('03-02-2006', 'dd-mm-yyyy'), 164, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 791, to_date('13-10-2017', 'dd-mm-yyyy'), 165, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 417, to_date('21-12-1993', 'dd-mm-yyyy'), 166, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 407, to_date('24-11-1994', 'dd-mm-yyyy'), 167, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 461, to_date('23-07-2016', 'dd-mm-yyyy'), 168, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 741, to_date('01-12-2021', 'dd-mm-yyyy'), 169, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 572, to_date('04-04-2024', 'dd-mm-yyyy'), 170, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 352, to_date('14-04-1994', 'dd-mm-yyyy'), 171, 3);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 305, to_date('27-04-1990', 'dd-mm-yyyy'), 172, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 399, to_date('26-09-1990', 'dd-mm-yyyy'), 173, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 333, to_date('25-03-2017', 'dd-mm-yyyy'), 174, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 759, to_date('16-11-2010', 'dd-mm-yyyy'), 175, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 778, to_date('08-12-1997', 'dd-mm-yyyy'), 176, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 938, to_date('04-03-1990', 'dd-mm-yyyy'), 177, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 828, to_date('19-10-2001', 'dd-mm-yyyy'), 178, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 835, to_date('11-07-2023', 'dd-mm-yyyy'), 179, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 313, to_date('07-12-2008', 'dd-mm-yyyy'), 180, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 683, to_date('01-02-2006', 'dd-mm-yyyy'), 181, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 456, to_date('15-10-1990', 'dd-mm-yyyy'), 182, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 857, to_date('05-10-1998', 'dd-mm-yyyy'), 183, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 986, to_date('12-11-1992', 'dd-mm-yyyy'), 184, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 846, to_date('10-12-2010', 'dd-mm-yyyy'), 185, 6);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 625, to_date('03-03-2013', 'dd-mm-yyyy'), 186, 1);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 904, to_date('06-11-1991', 'dd-mm-yyyy'), 187, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 942, to_date('25-05-2020', 'dd-mm-yyyy'), 188, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 755, to_date('14-01-1996', 'dd-mm-yyyy'), 189, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 977, to_date('20-09-2008', 'dd-mm-yyyy'), 190, 10);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 985, to_date('02-01-2007', 'dd-mm-yyyy'), 191, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 830, to_date('17-04-2020', 'dd-mm-yyyy'), 192, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 786, to_date('13-10-2003', 'dd-mm-yyyy'), 193, 13);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER enable constraint SYS_C009734;
alter table COMMUNITYMEMBER enable constraint SYS_C009735;
prompt Enabling foreign key constraints for BIRTH...
alter table BIRTH enable constraint SYS_C009742;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C009748;
alter table DONATION enable constraint SYS_C009749;
prompt Enabling foreign key constraints for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR enable constraint SYS_C009755;
prompt Enabling foreign key constraints for SPENDING...
alter table SPENDING enable constraint SYS_C009762;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for COMMUNITY...
alter table COMMUNITY enable all triggers;
prompt Enabling triggers for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER enable all triggers;
prompt Enabling triggers for BIRTH...
alter table BIRTH enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR enable all triggers;
prompt Enabling triggers for SPENDING...
alter table SPENDING enable all triggers;

set feedback on
set define on
prompt Done
