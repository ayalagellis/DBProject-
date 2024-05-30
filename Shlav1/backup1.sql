prompt PL/SQL Developer Export Tables for user AYALAG@XE
prompt Created by gelli on Thursday, May 30, 2024
set feedback off
set define off

prompt Creating PERSON...
create table PERSON
(
  person_id    INTEGER not null,
  fname        VARCHAR2(30) not null,
  lname        VARCHAR2(30) not null,
  phone_number VARCHAR2(10) not null
)
;
alter table PERSON
  add primary key (PERSON_ID);

prompt Creating COMMUNITYMEMBER...
create table COMMUNITYMEMBER
(
  address       VARCHAR2(30) not null,
  date_of_birth DATE not null,
  person_id     INTEGER not null,
  member_id     INTEGER not null
)
;
alter table COMMUNITYMEMBER
  add primary key (MEMBER_ID);
alter table COMMUNITYMEMBER
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating BIRTH...
create table BIRTH
(
  baby_dob        DATE not null,
  num_of_children INTEGER not null,
  comments        VARCHAR2(200) not null,
  person_id       INTEGER not null
)
;
alter table BIRTH
  add foreign key (PERSON_ID)
  references COMMUNITYMEMBER (MEMBER_ID);

prompt Creating DONATION...
create table DONATION
(
  date_of_donation DATE not null,
  donation_amount  NUMBER not null,
  donation_id      INTEGER not null,
  person_id        INTEGER not null
)
;
alter table DONATION
  add primary key (DONATION_ID);
alter table DONATION
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating COMMUNITY...
create table COMMUNITY
(
  community_id     INTEGER not null,
  monthly_donation NUMBER not null,
  community_type   VARCHAR2(30) not null,
  phone_number     VARCHAR2(10) not null,
  donation_id      INTEGER not null
)
;
alter table COMMUNITY
  add primary key (COMMUNITY_ID);
alter table COMMUNITY
  add foreign key (DONATION_ID)
  references DONATION (DONATION_ID);

prompt Creating EXTERNAL_DONOR...
create table EXTERNAL_DONOR
(
  donordescription VARCHAR2(300),
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
prompt Disabling triggers for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER disable all triggers;
prompt Disabling triggers for BIRTH...
alter table BIRTH disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for COMMUNITY...
alter table COMMUNITY disable all triggers;
prompt Disabling triggers for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR disable all triggers;
prompt Disabling triggers for SPENDING...
alter table SPENDING disable all triggers;
prompt Disabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER disable constraint SYS_C007855;
prompt Disabling foreign key constraints for BIRTH...
alter table BIRTH disable constraint SYS_C007871;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C007866;
prompt Disabling foreign key constraints for COMMUNITY...
alter table COMMUNITY disable constraint SYS_C007878;
prompt Disabling foreign key constraints for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR disable constraint SYS_C007860;
prompt Disabling foreign key constraints for SPENDING...
alter table SPENDING disable constraint SYS_C007885;
prompt Deleting SPENDING...
delete from SPENDING;
commit;
prompt Deleting EXTERNAL_DONOR...
delete from EXTERNAL_DONOR;
commit;
prompt Deleting COMMUNITY...
delete from COMMUNITY;
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
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000413, 'Daniel', 'Miller', '5552291641');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000414, 'Christopher', 'Smith', '5552900994');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000415, 'Matthew', 'Miller', '5552621359');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000416, 'Emma', 'Rodriguez', '5554798661');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000417, 'Matthew', 'Rodriguez', '5554740810');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000418, 'Emma', 'Martinez', '5559277004');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000419, 'John', 'Williams', '5551431232');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000420, 'Michael', 'Williams', '5551406237');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000421, 'John', 'Brown', '5553991285');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000422, 'Olivia', 'Williams', '5551133147');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000613, 'Daniel', 'Miller', '5552291641');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000000, 'Kelly', 'Hauser', '114686683');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000001, 'Merillee', 'Child', '279695914');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000002, 'Cuba', 'Applegate', '717267923');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000003, 'Max', 'Stevenson', '328546675');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000004, 'Cevin', 'Waite', '923264245');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000005, 'Danny', 'Liotta', '184486558');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000006, 'Roscoe', 'Stevenson', '321729311');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000007, 'Freddie', 'Avalon', '497147446');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000008, 'Lorraine', 'Soul', '659175369');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000009, 'Victor', 'Colton', '327936115');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000010, 'Peter', 'Kinnear', '537118562');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000011, 'Jean-Claude', 'Belles', '734997426');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000012, 'Robbie', 'Bassett', '885795742');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000013, 'Davy', 'Stiers', '911652447');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000014, 'Raul', 'Cox', '734227372');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000015, 'Lindsay', 'Bogguss', '274758474');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000016, 'Charlize', 'Hunt', '974343468');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000017, 'LeVar', 'English', '512963899');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000018, 'LeVar', 'Bassett', '241547794');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000019, 'Leonardo', 'Payne', '329956866');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000020, 'Rob', 'Blackwell', '314493756');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000021, 'Mitchell', 'Soul', '733111787');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000022, 'Victor', 'Stanton', '972549367');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000023, 'CeCe', 'Paul', '918921636');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000024, 'Kristin', 'Adler', '576845752');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000025, 'Anthony', 'DiBiasio', '834249787');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000026, 'Adrien', 'Tripplehorn', '529399285');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000027, 'Benicio', 'Thomas', '222145284');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000028, 'Goldie', 'Presley', '166776142');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000029, 'Debby', 'DiFranco', '864719155');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000030, 'Jean-Claude', 'Brody', '262943226');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000031, 'Steven', 'Chandler', '522738549');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000032, 'Brenda', 'Uggams', '791963174');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000033, 'France', 'Freeman', '655157491');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000034, 'Pam', 'McCormack', '889899948');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000035, 'Mint', 'Melvin', '985921248');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000036, 'Stewart', 'Cagle', '469269498');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000037, 'Tracy', 'Brooke', '837325638');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000038, 'Taylor', 'Gilliam', '597921713');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000039, 'Millie', 'Brothers', '581136593');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000040, 'Barry', 'Chapman', '663479551');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000041, 'Vendetta', 'Lucien', '612659435');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000042, 'Lily', 'Bush', '534819675');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000043, 'Machine', 'Arthur', '564664352');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000044, 'Armin', 'Pollack', '999638862');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000045, 'Gilbert', 'Moriarty', '176357959');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000046, 'Armin', 'Marx', '375729532');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000047, 'Veruca', 'Aaron', '264256543');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000048, 'Clarence', 'Kennedy', '154422287');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000049, 'Halle', 'Place', '556986361');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000050, 'Maury', 'Torn', '457733181');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000051, 'Martha', 'Kidman', '233417756');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000052, 'Juliana', 'Feuerstein', '469788279');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000053, 'Suzanne', 'Tsettos', '831889152');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000054, 'Andrew', 'Beatty', '186931446');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000055, 'Melanie', 'Ruiz', '165655164');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000056, 'Brenda', 'Ruiz', '758532427');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000057, 'Dennis', 'Estevez', '765417955');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000058, 'Rosario', 'Boothe', '381761216');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000059, 'Alfie', 'Landau', '395511936');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000060, 'Jody', 'Beckham', '993248766');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000061, 'Carrie', 'Jamal', '424127368');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000062, 'Horace', 'Russell', '259884719');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000063, 'Rebeka', 'Vincent', '252584265');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000064, 'Pete', 'Hutch', '336638967');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000065, 'Naomi', 'Berry', '857168892');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000066, 'Lynn', 'Gere', '621262468');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000067, 'Nicky', 'Forrest', '321489419');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000068, 'Ed', 'Orbit', '171243466');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000069, 'Freda', 'Hobson', '111227742');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000070, 'Donna', 'Hurt', '313454798');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000071, 'Kay', 'Serbedzija', '852231534');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000072, 'Gino', 'McFerrin', '229464231');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000073, 'Alicia', 'O''Donnell', '615343927');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000074, 'Bernard', 'Langella', '887776855');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000075, 'Gordon', 'Mars', '448382769');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000076, 'Jonny', 'Levy', '332389924');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000077, 'Miriam', 'Streep', '979969859');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000078, 'Rhys', 'Scaggs', '182538879');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000079, 'Vertical', 'Garr', '199973566');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000080, 'Frances', 'Redgrave', '757634578');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000081, 'Trini', 'Rudd', '679625992');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000082, 'Javon', 'Lattimore', '875859649');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000083, 'Mia', 'Harrison', '254744124');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000084, 'Willie', 'urban', '153747353');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000085, 'Collective', 'Ponce', '498345486');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000086, 'Beverley', 'Wiest', '255951733');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000087, 'Dionne', 'Thewlis', '747297659');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000088, 'Ty', 'Dale', '336287793');
commit;
prompt 100 records committed...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000089, 'Hex', 'Haslam', '924818556');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000090, 'Mary Beth', 'Bacon', '416469335');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000091, 'Kay', 'Rhodes', '596968448');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000092, 'Tara', 'Irving', '867738976');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000093, 'Tobey', 'Hawthorne', '925354115');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000094, 'Dar', 'Stevens', '938441732');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000095, 'Kyra', 'Posey', '153484159');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000096, 'Al', 'Pride', '568157528');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000097, 'Suzy', 'Malone', '843437841');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000098, 'Jill', 'Palminteri', '629654267');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000099, 'Joaquin', 'Dempsey', '729138655');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000100, 'Chloe', 'Devine', '863149775');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000101, 'Alana', 'Love', '315656414');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000102, 'Nigel', 'LaSalle', '221225294');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000103, 'Chrissie', 'Hersh', '647211881');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000104, 'Wayman', 'Branagh', '384699744');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000105, 'Lucy', 'Esposito', '214585539');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000106, 'Samantha', 'Northam', '371535524');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000107, 'Alice', 'Torres', '566885473');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000108, 'Anne', 'Lillard', '652169269');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000109, 'Amy', 'Garza', '439899674');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000110, 'Gabrielle', 'Ponty', '627629967');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000111, 'Rik', 'Snipes', '637926861');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000112, 'Donald', 'Suvari', '842747655');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000113, 'Miles', 'Willard', '468795538');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000114, 'Lloyd', 'Brooke', '436577137');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000115, 'Colm', 'Rippy', '265762519');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000116, 'Karon', 'Bancroft', '429655754');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000117, 'Carlos', 'Rain', '184647855');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000118, 'Armand', 'Leary', '396922765');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000119, 'Nora', 'Kelly', '417298943');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000120, 'Armin', 'Dourif', '652223446');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000121, 'Jessica', 'Simpson', '957868545');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000122, 'Davis', 'Vance', '237114757');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000123, 'Todd', 'Dunn', '924394937');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000124, 'Davis', 'Negbaur', '351643223');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000125, 'Liv', 'Keeslar', '637818661');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000126, 'Leon', 'Travers', '889344199');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000127, 'Bob', 'Rapaport', '547459169');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000128, 'Desmond', 'Rauhofer', '765627267');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000129, 'Ashton', 'Basinger', '957675446');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000130, 'Holly', 'Driver', '857142288');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000131, 'Rick', 'Flatts', '196836252');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000132, 'Lila', 'Stevens', '472951774');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000133, 'William', 'Stiller', '663333984');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000134, 'Rosie', 'Jeffreys', '285665937');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000135, 'Geoffrey', 'Austin', '737781154');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000136, 'Saul', 'Colon', '547749663');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000137, 'Mac', 'Rebhorn', '263326717');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000138, 'Jackie', 'Griffith', '397333455');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000139, 'Lennie', 'Lachey', '444357753');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000140, 'Giancarlo', 'Osmond', '564673625');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000141, 'Willie', 'Lynn', '128123228');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000142, 'Colin', 'Cazale', '196617313');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000143, 'Machine', 'Rippy', '251766262');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000144, 'Kurtwood', 'Neill', '768915815');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000145, 'Talvin', 'Schwimmer', '568355173');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000146, 'Claire', 'DeVita', '484951158');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000147, 'Thelma', 'Ontiveros', '517538292');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000148, 'Ernie', 'Cassel', '512974729');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000149, 'Larnelle', 'Rudd', '947495414');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000150, 'Madeline', 'Berkeley', '979659383');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000151, 'Daryle', 'Thomson', '187892813');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000152, 'Nikki', 'Lindley', '454385899');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000153, 'Seth', 'Latifah', '455399999');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000154, 'Gloria', 'Paxton', '944162249');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000155, 'Gabriel', 'Sarandon', '424141991');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000156, 'Junior', 'Favreau', '916977728');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000157, 'Rhett', 'Stoltz', '693796962');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000158, 'Gilbert', 'Levine', '614769156');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000159, 'Devon', 'Perez', '214774342');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000160, 'Matthew', 'Mantegna', '167368773');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000161, 'Frederic', 'Spiner', '949335241');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000162, 'Wendy', 'Adler', '358133385');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000163, 'Oliver', 'Coughlan', '884846625');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000164, 'Larry', 'Wolf', '583143277');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000165, 'Jonatha', 'Chan', '715721571');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000166, 'Sigourney', 'Paul', '958442335');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000167, 'Cary', 'Shandling', '154121449');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000168, 'Clarence', 'Atkinson', '175152775');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000169, 'Kathy', 'Walsh', '172682618');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000170, 'Edie', 'Copeland', '356914525');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000171, 'Leon', 'Ward', '279571645');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000172, 'Julio', 'Sawa', '575783612');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000173, 'Tea', 'Stowe', '114918592');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000174, 'Cary', 'Unger', '971118851');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000175, 'Hazel', 'Rippy', '371781589');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000176, 'Kay', 'urban', '594129686');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000177, 'Ashton', 'Travolta', '452561297');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000178, 'Patricia', 'Puckett', '587677296');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000179, 'Miranda', 'Shocked', '989885181');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000180, 'Nik', 'Bogguss', '412141285');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000181, 'Laurence', 'Alda', '148968771');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000182, 'Brenda', 'Makowicz', '672116668');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000183, 'Eliza', 'LuPone', '763949866');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000184, 'Lauren', 'Durning', '517799442');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000185, 'Lucy', 'Short', '472383792');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000186, 'Pete', 'Yankovic', '799181743');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000187, 'Gilberto', 'Goldberg', '224943186');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000188, 'Jay', 'Vassar', '397266272');
commit;
prompt 200 records committed...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000189, 'Anita', 'Nicholson', '239517878');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000190, 'Miguel', 'Farris', '761812922');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000191, 'Nicole', 'Rauhofer', '978881328');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000192, 'Dan', 'Hobson', '144364226');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000193, 'Rosario', 'Hayes', '821623271');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000194, 'Devon', 'Brown', '726221355');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000195, 'Helen', 'Davison', '785814794');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000196, 'Denise', 'Hingle', '187757574');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000197, 'Tori', 'Hersh', '126782984');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000198, 'Rick', 'Caviezel', '866477717');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000199, 'Angela', 'Stampley', '141447245');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000200, 'Joy', 'King', '941983386');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000201, 'Embeth', 'Harnes', '683335883');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000202, 'Ryan', 'Hunt', '663743425');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000203, 'Ellen', 'Byrd', '396472157');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000204, 'Derrick', 'Nightingale', '245542525');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000205, 'Tamala', 'Lizzy', '417711252');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000206, 'Brooke', 'Vince', '532311499');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000207, 'Amanda', 'Wilson', '643693653');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000208, 'Graham', 'Rooker', '162698288');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000209, 'Lee', 'Wilder', '581497992');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000210, 'Edwin', 'Neil', '844118854');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000211, 'Isaac', 'Ponty', '153157685');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000212, 'Collective', 'Carrere', '126756568');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000213, 'Kay', 'Stoltz', '697815584');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000214, 'Louise', 'Hopkins', '932591842');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000215, 'Ryan', 'Pierce', '948367298');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000216, 'Keith', 'Hall', '153891331');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000217, 'Carol', 'Spacey', '412341138');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000218, 'Barbara', 'Fender', '556436962');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000219, 'Gabrielle', 'Burstyn', '396512132');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000220, 'Eliza', 'Witherspoon', '896857315');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000221, 'Loren', 'Nugent', '819297777');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000222, 'Rik', 'Springfield', '131717741');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000223, 'Beverley', 'Knight', '954291159');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000224, 'Robbie', 'Noseworthy', '247461893');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000225, 'Petula', 'Caviezel', '447626296');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000226, 'Marty', 'Alda', '118321868');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000227, 'Avril', 'Keaton', '351937135');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000228, 'Salma', 'Goldblum', '626512566');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000229, 'Chaka', 'Bale', '766275886');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000230, 'Edwin', 'Diffie', '647792893');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000231, 'Toni', 'Conners', '989222461');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000232, 'Melba', 'Williams', '942678919');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000233, 'Isaiah', 'Burns', '279125197');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000234, 'King', 'Costello', '162392297');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000235, 'Lucy', 'Bachman', '948882898');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000236, 'Shannyn', 'Shepard', '137835684');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000237, 'Samuel', 'Loeb', '519971681');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000238, 'Earl', 'Benson', '614296426');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000239, 'Gil', 'Winwood', '359663179');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000240, 'Brian', 'Harmon', '861522776');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000241, 'Robby', 'Richardson', '822546176');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000242, 'Danni', 'Forster', '514651669');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000243, 'Denny', 'King', '614543145');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000244, 'Delbert', 'Wayans', '213787792');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000245, 'Arturo', 'Conlee', '714865835');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000246, 'Sander', 'McNeice', '336541456');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000247, 'Denny', 'Neill', '284147328');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000248, 'Stevie', 'Harris', '355787488');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000249, 'Jill', 'Cole', '483182999');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000250, 'Tilda', 'Schwarzenegger', '764673934');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000251, 'Curt', 'Kenoly', '775436636');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000252, 'Sheena', 'Rickman', '124527616');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000253, 'Jeanne', 'McCracken', '192552994');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000254, 'Elle', 'Stallone', '531844924');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000255, 'Sander', 'Winslet', '747721154');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000256, 'Burt', 'Sanchez', '748424618');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000257, 'Ernest', 'Nolte', '423395352');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000258, 'Ashley', 'Irving', '554953792');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000259, 'Collin', 'Oszajca', '429818195');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000260, 'Moe', 'Hingle', '898866934');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000261, 'Brooke', 'Richardson', '349953761');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000262, 'Meryl', 'Wen', '728872523');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000263, 'Bret', 'Ribisi', '878172161');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000264, 'Scarlett', 'Mortensen', '343369365');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000265, 'Talvin', 'Rollins', '171141441');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000266, 'Mint', 'Fierstein', '783954529');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000267, 'Andie', 'Washington', '548525426');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000268, 'Dionne', 'Spacek', '458265665');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000269, 'Holland', 'Randal', '682939887');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000270, 'Uma', 'Cromwell', '485724229');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000271, 'Adrien', 'Sevigny', '619694554');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000272, 'Lily', 'Benson', '346119912');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000273, 'Eileen', 'Carnes', '792615651');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000274, 'Jesus', 'Gold', '231792943');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000275, 'Horace', 'Whitaker', '141492199');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000276, 'Jackie', 'McDowell', '899166455');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000277, 'Brenda', 'Banderas', '428595884');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000278, 'Gilbert', 'Martinez', '663716285');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000279, 'Clea', 'Marshall', '565378488');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000280, 'Eric', 'Karyo', '757588517');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000281, 'Bill', 'Weiland', '577671518');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000282, 'Tal', 'Lindo', '219216281');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000283, 'Lisa', 'Atkinson', '673174955');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000284, 'Martin', 'Kilmer', '496249156');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000285, 'Hal', 'Weir', '629817417');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000286, 'Rhys', 'Warren', '732781837');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000287, 'Hilton', 'Reeve', '835366876');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000288, 'Matt', 'Kinney', '581267572');
commit;
prompt 300 records committed...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000289, 'Max', 'Mattea', '372348123');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000290, 'Teena', 'Hawke', '535931588');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000291, 'Gates', 'Fisher', '343484372');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000292, 'Bridgette', 'Maxwell', '342799857');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000293, 'Brooke', 'Melvin', '198124743');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000294, 'Albertina', 'Ripley', '287422617');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000295, 'Connie', 'Luongo', '692182271');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000296, 'Melanie', 'Connick', '223796989');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000297, 'Eliza', 'McIntosh', '554872597');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000298, 'Lindsay', 'Hawkins', '323468162');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000299, 'Phil', 'Francis', '539236946');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000300, 'Sam', 'Cale', '839666956');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000301, 'Treat', 'Shorter', '573527139');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000302, 'Pat', 'Douglas', '259438658');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000303, 'Loreena', 'Wilson', '279288397');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000304, 'Jeanne', 'Estevez', '269849874');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000305, 'Hugo', 'Adkins', '964918329');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000306, 'Geraldine', 'Mohr', '998947299');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000307, 'Emilio', 'Reiner', '367321151');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000308, 'Ivan', 'King', '618821658');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000309, 'Rhona', 'Valentin', '889513324');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000310, 'Devon', 'Fichtner', '596477963');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000311, 'Rawlins', 'Nicks', '215664513');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000312, 'Mena', 'Howard', '135911225');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000313, 'Anne', 'Winwood', '718531773');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000314, 'Kelli', 'Connick', '195886526');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000315, 'Natalie', 'McCormack', '311962238');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000316, 'Larenz', 'Dalton', '123554493');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000317, 'Timothy', 'Candy', '461929174');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000318, 'Donna', 'Savage', '932517484');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000319, 'Vivica', 'Reid', '376461631');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000320, 'Naomi', 'Kretschmann', '957352922');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000321, 'Alannah', 'Monk', '642344756');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000322, 'Albert', 'Buffalo', '113294943');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000323, 'Colleen', 'Liu', '266332582');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000324, 'Lionel', 'Delta', '511113874');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000325, 'Nathan', 'Wahlberg', '255648659');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000326, 'Cate', 'Neeson', '447458517');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000327, 'Edgar', 'Holm', '881971427');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000328, 'Sarah', 'Almond', '378215256');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000329, 'Leonardo', 'Hanley', '752264354');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000330, 'Judd', 'Sinatra', '126275457');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000331, 'Lila', 'Rubinek', '289588972');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000332, 'Natasha', 'Unger', '412972381');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000333, 'Nanci', 'Gano', '566135797');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000334, 'Harrison', 'Cockburn', '165441344');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000335, 'Laurie', 'Heald', '711721689');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000336, 'Cornell', 'Oates', '375926649');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000337, 'Mitchell', 'Hauser', '769878332');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000338, 'Nancy', 'Doucette', '974724614');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000339, 'Jane', 'Broadbent', '981286387');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000340, 'Veruca', 'Idol', '542221268');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000341, 'Lily', 'Meyer', '181934872');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000342, 'Jake', 'Evett', '915887863');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000343, 'Kirk', 'Addy', '644735749');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000344, 'Deborah', 'Pryce', '126356156');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000345, 'Stephen', 'McCann', '763452815');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000346, 'Desmond', 'Favreau', '732955317');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000347, 'Ivan', 'Cazale', '627423684');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000348, 'Colm', 'Whitwam', '656854635');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000349, 'Javon', 'Douglas', '499423457');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000350, 'Raymond', 'Browne', '286248441');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000351, 'Phil', 'Heslov', '349243848');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000352, 'Jesse', 'Renfro', '593296591');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000353, 'Michelle', 'McDonnell', '512624952');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000354, 'Mekhi', 'Bryson', '315193456');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000355, 'Marie', 'Crystal', '387525675');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000356, 'Martha', 'Chappelle', '971713366');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000357, 'Murray', 'Keener', '273786437');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000358, 'Judd', 'Brandt', '767959638');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000359, 'Rachael', 'Dern', '793424524');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000360, 'Mint', 'Checker', '389923916');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000361, 'Franz', 'Kutcher', '632493691');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000362, 'Machine', 'Rowlands', '685933322');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000363, 'Terrence', 'Crow', '851222286');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000364, 'Hugh', 'Jamal', '684767456');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000365, 'Lenny', 'Marin', '842672482');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000366, 'Roy', 'Stone', '514978456');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000367, 'Donna', 'Kingsley', '441295138');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000368, 'Chubby', 'Vai', '986791141');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000369, 'Loretta', 'Hagerty', '648455292');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000370, 'Patty', 'Noseworthy', '186723531');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000371, 'Joy', 'Whitaker', '732449329');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000372, 'Solomon', 'Peebles', '161625458');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000373, 'Cary', 'Crouch', '831757781');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000374, 'Jill', 'MacDonald', '732599131');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000375, 'Gailard', 'Pesci', '464645777');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000376, 'Martin', 'Kane', '994738262');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000377, 'Mike', 'Osbourne', '348598959');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000378, 'Kelli', 'Chan', '927464495');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000379, 'Dwight', 'Ticotin', '934851582');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000380, 'Olga', 'Molina', '931228871');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000381, 'Treat', 'Gosdin', '755132866');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000382, 'Mitchell', 'Madonna', '474526213');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000383, 'Reese', 'McDonald', '438311418');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000384, 'Suzanne', 'Gere', '911257464');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000385, 'Robby', 'Gleeson', '616698975');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000386, 'Kevn', 'Coleman', '797774598');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000387, 'Machine', 'Tisdale', '732387678');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000388, 'Sara', 'Kravitz', '173254168');
commit;
prompt 400 records committed...
insert into PERSON (person_id, fname, lname, phone_number)
values (100000389, 'Cheech', 'Crow', '255575355');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000390, 'Desmond', 'Carter', '749525521');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000391, 'Kid', 'Rush', '642642124');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000392, 'Mac', 'Dreyfuss', '235249347');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000393, 'Luke', 'Theron', '119834465');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000394, 'Brad', 'Ceasar', '228189246');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000395, 'Suzanne', 'Morton', '119726223');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000396, 'Cheryl', 'Rhys-Davies', '564726178');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000397, 'Edward', 'Pleasure', '252657355');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000398, 'Elijah', 'Gershon', '923928298');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000399, 'Tori', 'Benoit', '625317318');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000400, ' Tzivia', 'Gellis', '0545550770');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000401, ' Tamar', 'Levi', '0545550771');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000402, ' Sara', 'Cohen', '0545550772');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000403, ' Rivka', 'Rosenblatt', '0545550773');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000404, ' Rachel', 'Ben Shimon', '0545550774');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000405, ' Lea', 'Golan', '0545550775');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000406, ' Chana', 'Fisher', '0545550776');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000407, ' Shulamit', 'Elbaz', '0545550777');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000408, ' Pnina', 'Rachamim', '0545550778');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000409, ' Miryam', 'Sasonkin', '0545550779');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000410, ' Bella', 'Feldman', '0545551770');
insert into PERSON (person_id, fname, lname, phone_number)
values (100000411, ' Netanya ', 'Goldberg', '0545552770');
commit;
prompt 423 records loaded
prompt Loading COMMUNITYMEMBER...
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('68 Mantegna Road', to_date('27-04-1965', 'dd-mm-yyyy'), 100000384, 1);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('43 LaBelle Street', to_date('05-11-1953', 'dd-mm-yyyy'), 100000264, 2);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('92 Kid Road', to_date('25-12-1960', 'dd-mm-yyyy'), 100000140, 3);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('793 Stevens Road', to_date('15-07-1980', 'dd-mm-yyyy'), 100000356, 4);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('381 Hilversum Street', to_date('03-09-1999', 'dd-mm-yyyy'), 100000393, 5);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('8 Reykjavik Road', to_date('30-01-1998', 'dd-mm-yyyy'), 100000399, 6);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('88 Viggo Street', to_date('26-06-1953', 'dd-mm-yyyy'), 100000197, 7);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('15 Reeve Drive', to_date('26-06-1936', 'dd-mm-yyyy'), 100000133, 8);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('30 Rebeka Road', to_date('23-07-1992', 'dd-mm-yyyy'), 100000074, 9);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('99 Zooey Drive', to_date('14-09-2001', 'dd-mm-yyyy'), 100000354, 10);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('41 Graham Road', to_date('10-07-2000', 'dd-mm-yyyy'), 100000285, 11);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('78 St Kilda Road', to_date('17-06-1935', 'dd-mm-yyyy'), 100000187, 12);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('83rd Street', to_date('13-09-1942', 'dd-mm-yyyy'), 100000345, 13);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('28 Jackie Road', to_date('11-03-1941', 'dd-mm-yyyy'), 100000291, 14);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('63 Colin Young Street', to_date('11-12-2005', 'dd-mm-yyyy'), 100000093, 15);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('14 Russo Drive', to_date('26-05-1941', 'dd-mm-yyyy'), 100000269, 16);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('793 Stuermer Street', to_date('14-11-1969', 'dd-mm-yyyy'), 100000009, 17);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('27 Martin Street', to_date('27-02-1991', 'dd-mm-yyyy'), 100000142, 18);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('657 White Road', to_date('11-04-1976', 'dd-mm-yyyy'), 100000334, 19);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('593 Page Drive', to_date('27-10-1930', 'dd-mm-yyyy'), 100000053, 20);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('56 Sally Blvd', to_date('02-11-2004', 'dd-mm-yyyy'), 100000227, 21);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('93 Biel Ave', to_date('26-05-1932', 'dd-mm-yyyy'), 100000031, 22);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('40 Folds Street', to_date('30-07-1973', 'dd-mm-yyyy'), 100000038, 23);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('57 Neil Street', to_date('29-11-1999', 'dd-mm-yyyy'), 100000236, 24);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73 Karlstad Street', to_date('01-07-1989', 'dd-mm-yyyy'), 100000347, 25);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('91 Robby Road', to_date('24-06-1932', 'dd-mm-yyyy'), 100000331, 26);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('251 Robby Road', to_date('21-12-1943', 'dd-mm-yyyy'), 100000096, 27);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('30 Longueuil Drive', to_date('01-10-1970', 'dd-mm-yyyy'), 100000358, 28);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('42 Steyr', to_date('24-07-2008', 'dd-mm-yyyy'), 100000134, 29);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('1 Duke Drive', to_date('07-03-1973', 'dd-mm-yyyy'), 100000004, 30);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('95 MacLachlan Drive', to_date('19-04-2005', 'dd-mm-yyyy'), 100000354, 31);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('62nd Street', to_date('29-08-1945', 'dd-mm-yyyy'), 100000168, 32);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('44 København Drive', to_date('31-10-1946', 'dd-mm-yyyy'), 100000104, 33);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('41 Neve Drive', to_date('07-02-1934', 'dd-mm-yyyy'), 100000109, 34);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('95 Lane Street', to_date('26-04-1943', 'dd-mm-yyyy'), 100000243, 35);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('93 Lyon Street', to_date('22-02-1965', 'dd-mm-yyyy'), 100000054, 36);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('23 Farrow Road', to_date('13-01-1992', 'dd-mm-yyyy'), 100000110, 37);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('15 Ontiveros Blvd', to_date('12-07-1941', 'dd-mm-yyyy'), 100000273, 38);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('43 MacIsaac', to_date('16-11-1978', 'dd-mm-yyyy'), 100000274, 39);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('3 Pigott-Smith Drive', to_date('07-11-1991', 'dd-mm-yyyy'), 100000143, 40);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('8 Barrymore Street', to_date('24-10-1966', 'dd-mm-yyyy'), 100000215, 41);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('921 Hoffman Road', to_date('15-06-1945', 'dd-mm-yyyy'), 100000138, 42);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('49 Mint Street', to_date('21-09-1930', 'dd-mm-yyyy'), 100000189, 43);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Helsingborg Road', to_date('30-10-1946', 'dd-mm-yyyy'), 100000213, 44);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('98 Berkeley Road', to_date('24-06-1990', 'dd-mm-yyyy'), 100000310, 45);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('86 Pat Street', to_date('31-08-1967', 'dd-mm-yyyy'), 100000334, 46);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('50 Bright Street', to_date('25-05-1936', 'dd-mm-yyyy'), 100000033, 47);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('31 Johor Bahru Street', to_date('01-03-1967', 'dd-mm-yyyy'), 100000144, 48);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('59 Machine Drive', to_date('29-09-1960', 'dd-mm-yyyy'), 100000253, 49);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('10 Libertyville', to_date('15-07-2006', 'dd-mm-yyyy'), 100000028, 50);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73 Sorocaba Street', to_date('28-04-1931', 'dd-mm-yyyy'), 100000020, 51);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72nd Street', to_date('22-05-1991', 'dd-mm-yyyy'), 100000382, 52);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('782 Ankara Street', to_date('29-09-1998', 'dd-mm-yyyy'), 100000061, 53);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('35 Zaandam Road', to_date('30-05-2001', 'dd-mm-yyyy'), 100000122, 54);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('33 Giamatti Blvd', to_date('02-11-1995', 'dd-mm-yyyy'), 100000328, 55);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('29 Hikaru Road', to_date('17-03-1932', 'dd-mm-yyyy'), 100000347, 56);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('42nd Street', to_date('17-08-1943', 'dd-mm-yyyy'), 100000045, 57);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('44 Wakayama Road', to_date('24-05-1991', 'dd-mm-yyyy'), 100000048, 58);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('658 Owen Street', to_date('11-06-1967', 'dd-mm-yyyy'), 100000230, 59);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('95 Brooks Drive', to_date('13-06-1947', 'dd-mm-yyyy'), 100000291, 60);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('22nd Street', to_date('25-09-1939', 'dd-mm-yyyy'), 100000263, 61);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73rd Street', to_date('16-01-1951', 'dd-mm-yyyy'), 100000231, 62);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('45 Lari Road', to_date('07-11-1963', 'dd-mm-yyyy'), 100000024, 63);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('2 Concordville Drive', to_date('04-08-1938', 'dd-mm-yyyy'), 100000013, 64);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('55 Giancarlo', to_date('21-08-1957', 'dd-mm-yyyy'), 100000336, 65);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('21 Jacksonville Street', to_date('10-01-1982', 'dd-mm-yyyy'), 100000364, 66);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('89 Whitford Ave', to_date('26-12-2006', 'dd-mm-yyyy'), 100000330, 67);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('32nd Street', to_date('30-07-1964', 'dd-mm-yyyy'), 100000283, 68);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('715 Kumamoto Road', to_date('15-05-1953', 'dd-mm-yyyy'), 100000334, 69);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('82nd Street', to_date('05-02-1969', 'dd-mm-yyyy'), 100000104, 70);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('89 Paula Street', to_date('24-10-1933', 'dd-mm-yyyy'), 100000179, 71);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('82nd Street', to_date('13-06-1949', 'dd-mm-yyyy'), 100000054, 72);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('876 Eckhart Street', to_date('27-07-1930', 'dd-mm-yyyy'), 100000391, 73);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('422 Gwyneth Street', to_date('08-02-1960', 'dd-mm-yyyy'), 100000123, 74);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('14 Alfie Drive', to_date('17-03-1985', 'dd-mm-yyyy'), 100000059, 75);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72 Sevigny Street', to_date('10-04-1999', 'dd-mm-yyyy'), 100000025, 76);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('211 Whitley Street', to_date('02-01-1969', 'dd-mm-yyyy'), 100000367, 77);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('44 Forrest Road', to_date('09-07-1955', 'dd-mm-yyyy'), 100000161, 78);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('13 Kramer Ave', to_date('23-05-1964', 'dd-mm-yyyy'), 100000091, 79);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('82 Numan Ave', to_date('27-08-2003', 'dd-mm-yyyy'), 100000023, 80);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('55 Lillard Street', to_date('11-10-1993', 'dd-mm-yyyy'), 100000113, 81);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72nd Street', to_date('20-11-1995', 'dd-mm-yyyy'), 100000020, 82);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('392 Warden Road', to_date('19-06-1932', 'dd-mm-yyyy'), 100000141, 83);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73 Mary-Louise Street', to_date('26-01-1977', 'dd-mm-yyyy'), 100000368, 84);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('74 Carradine Road', to_date('22-01-1989', 'dd-mm-yyyy'), 100000335, 85);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('18 Portman Drive', to_date('24-04-1933', 'dd-mm-yyyy'), 100000069, 86);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('992 Cheech Street', to_date('11-08-1953', 'dd-mm-yyyy'), 100000189, 87);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('92nd Street', to_date('29-01-1959', 'dd-mm-yyyy'), 100000075, 88);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('75 Aracruz Road', to_date('01-10-1944', 'dd-mm-yyyy'), 100000053, 89);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('14 Stigers Drive', to_date('25-08-1981', 'dd-mm-yyyy'), 100000032, 90);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('256 Jones', to_date('08-02-1991', 'dd-mm-yyyy'), 100000085, 91);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('97 Spiner Drive', to_date('11-12-1972', 'dd-mm-yyyy'), 100000234, 92);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Platt Ave', to_date('04-09-1947', 'dd-mm-yyyy'), 100000172, 93);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('291 Gilliam Road', to_date('28-08-1977', 'dd-mm-yyyy'), 100000368, 94);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('59 Strathairn Road', to_date('06-10-1940', 'dd-mm-yyyy'), 100000157, 95);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('96 Dayne Road', to_date('17-05-1966', 'dd-mm-yyyy'), 100000063, 96);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('13rd Street', to_date('21-01-1933', 'dd-mm-yyyy'), 100000381, 97);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('21 Caldwell Street', to_date('19-05-2000', 'dd-mm-yyyy'), 100000286, 98);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('98 Doucette Street', to_date('16-02-2004', 'dd-mm-yyyy'), 100000052, 99);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('21st Street', to_date('13-08-1933', 'dd-mm-yyyy'), 100000019, 100);
commit;
prompt 100 records committed...
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('90 Isaak Ave', to_date('15-03-2002', 'dd-mm-yyyy'), 100000290, 101);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('45 Rebeka Ave', to_date('14-05-2006', 'dd-mm-yyyy'), 100000006, 102);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('60 Santa rita sapucaí Ave', to_date('17-06-1973', 'dd-mm-yyyy'), 100000049, 103);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('90 Gandolfini Drive', to_date('22-06-1940', 'dd-mm-yyyy'), 100000396, 104);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('65 Eastwood', to_date('24-11-2006', 'dd-mm-yyyy'), 100000000, 105);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('43 Sylvester Street', to_date('19-07-2000', 'dd-mm-yyyy'), 100000310, 106);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('69 Casey Drive', to_date('29-10-1990', 'dd-mm-yyyy'), 100000058, 107);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('75 Posey Drive', to_date('10-04-2005', 'dd-mm-yyyy'), 100000238, 108);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('4 Waite', to_date('09-04-1963', 'dd-mm-yyyy'), 100000092, 109);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('599 Cox Street', to_date('20-05-1989', 'dd-mm-yyyy'), 100000069, 110);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('23 Pompton Plains Road', to_date('18-08-1945', 'dd-mm-yyyy'), 100000133, 111);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Perrineau Drive', to_date('06-03-1993', 'dd-mm-yyyy'), 100000162, 112);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('99 Kurtwood Blvd', to_date('09-02-1949', 'dd-mm-yyyy'), 100000256, 113);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('12nd Street', to_date('29-03-1990', 'dd-mm-yyyy'), 100000072, 114);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('782 Mulroney Street', to_date('11-02-2003', 'dd-mm-yyyy'), 100000203, 115);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('94 Bretzfeld-Waldbach Drive', to_date('13-09-2008', 'dd-mm-yyyy'), 100000223, 116);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('320 Wayans Drive', to_date('08-12-1992', 'dd-mm-yyyy'), 100000336, 117);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('68 Carlsbad Blvd', to_date('07-09-1975', 'dd-mm-yyyy'), 100000153, 118);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('30 Frederiksberg Road', to_date('13-12-1988', 'dd-mm-yyyy'), 100000371, 119);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('60 Brisbane Street', to_date('17-06-1984', 'dd-mm-yyyy'), 100000370, 120);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('58 Edwardstown Road', to_date('22-02-1939', 'dd-mm-yyyy'), 100000115, 121);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('54 Price Road', to_date('22-03-1957', 'dd-mm-yyyy'), 100000246, 122);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('779 Englewood Cliffs Street', to_date('23-04-1962', 'dd-mm-yyyy'), 100000113, 123);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('35 McDonnell Street', to_date('23-10-1965', 'dd-mm-yyyy'), 100000198, 124);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('70 Oro', to_date('30-04-2000', 'dd-mm-yyyy'), 100000214, 125);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('85 Lennox Drive', to_date('14-08-1966', 'dd-mm-yyyy'), 100000357, 126);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('661 Johnette Road', to_date('26-09-1954', 'dd-mm-yyyy'), 100000320, 127);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('386 Giamatti Road', to_date('26-12-1951', 'dd-mm-yyyy'), 100000383, 128);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('42nd Street', to_date('04-06-1963', 'dd-mm-yyyy'), 100000103, 129);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('95 Cube Street', to_date('13-05-1982', 'dd-mm-yyyy'), 100000014, 130);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('83 Landau Drive', to_date('14-05-1954', 'dd-mm-yyyy'), 100000022, 131);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('62nd Street', to_date('14-09-1939', 'dd-mm-yyyy'), 100000062, 132);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('19 LaSalle Street', to_date('29-05-1968', 'dd-mm-yyyy'), 100000103, 133);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('56 Snoqualmie Ave', to_date('22-03-1988', 'dd-mm-yyyy'), 100000211, 134);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('53 Penders Blvd', to_date('24-03-1963', 'dd-mm-yyyy'), 100000249, 135);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('66 Griggs Road', to_date('23-03-1997', 'dd-mm-yyyy'), 100000005, 136);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('13 Reid Road', to_date('04-04-1952', 'dd-mm-yyyy'), 100000109, 137);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('61st Street', to_date('28-08-1960', 'dd-mm-yyyy'), 100000132, 138);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('708 Mitra Road', to_date('11-12-1998', 'dd-mm-yyyy'), 100000287, 139);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('61 Davison Ave', to_date('06-01-1979', 'dd-mm-yyyy'), 100000013, 140);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('59 Chan Drive', to_date('16-12-1953', 'dd-mm-yyyy'), 100000066, 141);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('15 Harriet Road', to_date('13-11-1968', 'dd-mm-yyyy'), 100000044, 142);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('79 Purley', to_date('14-02-1995', 'dd-mm-yyyy'), 100000336, 143);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('48 Klugh Road', to_date('20-09-1988', 'dd-mm-yyyy'), 100000058, 144);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('80 Woodbridge Drive', to_date('12-11-1988', 'dd-mm-yyyy'), 100000151, 145);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72nd Street', to_date('29-12-1985', 'dd-mm-yyyy'), 100000081, 146);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('15 Mykelti Road', to_date('13-01-2006', 'dd-mm-yyyy'), 100000377, 147);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('37 Cromwell Street', to_date('07-05-1971', 'dd-mm-yyyy'), 100000116, 148);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('18 Quinn Street', to_date('09-12-1943', 'dd-mm-yyyy'), 100000166, 149);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('5 Boothe Road', to_date('17-12-1952', 'dd-mm-yyyy'), 100000172, 150);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('99 Unger Street', to_date('24-09-1945', 'dd-mm-yyyy'), 100000174, 151);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('31 Vance Road', to_date('06-08-2004', 'dd-mm-yyyy'), 100000107, 152);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('92 Evett Street', to_date('20-07-1999', 'dd-mm-yyyy'), 100000114, 153);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('93 Cockburn Blvd', to_date('23-04-1972', 'dd-mm-yyyy'), 100000301, 154);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('457 Ralph Road', to_date('24-08-1999', 'dd-mm-yyyy'), 100000192, 155);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('621 Omar Blvd', to_date('31-01-1971', 'dd-mm-yyyy'), 100000189, 156);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('56 Fionnula Street', to_date('04-03-2002', 'dd-mm-yyyy'), 100000086, 157);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('49 Mendoza Road', to_date('20-01-1967', 'dd-mm-yyyy'), 100000337, 158);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('267 Lengdorf Street', to_date('01-02-1968', 'dd-mm-yyyy'), 100000223, 159);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('63 Feore Road', to_date('22-12-1960', 'dd-mm-yyyy'), 100000385, 160);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('6 Cummings Ave', to_date('21-04-1969', 'dd-mm-yyyy'), 100000042, 161);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('81 Ismaning Drive', to_date('12-06-1991', 'dd-mm-yyyy'), 100000232, 162);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('48 McKennitt Drive', to_date('02-10-2006', 'dd-mm-yyyy'), 100000228, 163);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('87 Neustadt Road', to_date('10-04-1969', 'dd-mm-yyyy'), 100000304, 164);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('13 Gugino Ave', to_date('06-10-1996', 'dd-mm-yyyy'), 100000361, 165);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('606 Waltham Drive', to_date('08-06-1986', 'dd-mm-yyyy'), 100000073, 166);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('607 Vondie Road', to_date('16-10-1959', 'dd-mm-yyyy'), 100000266, 167);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('99 Dortmund Road', to_date('23-01-1945', 'dd-mm-yyyy'), 100000047, 168);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('24 Aida Street', to_date('06-11-1987', 'dd-mm-yyyy'), 100000195, 169);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('69 Jean-Luc Blvd', to_date('14-09-2007', 'dd-mm-yyyy'), 100000371, 170);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('71st Street', to_date('04-10-1985', 'dd-mm-yyyy'), 100000127, 171);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('14 Elisabeth Street', to_date('18-07-1930', 'dd-mm-yyyy'), 100000177, 172);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('51st Street', to_date('27-08-1970', 'dd-mm-yyyy'), 100000059, 173);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('81 Mogi Guacu Street', to_date('16-07-1983', 'dd-mm-yyyy'), 100000370, 174);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72 Douglas Blvd', to_date('30-11-1977', 'dd-mm-yyyy'), 100000368, 175);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('37 Robin Road', to_date('12-10-1964', 'dd-mm-yyyy'), 100000033, 176);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('67 Lizzy', to_date('06-09-1968', 'dd-mm-yyyy'), 100000049, 177);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('77 Quatro Street', to_date('10-08-1956', 'dd-mm-yyyy'), 100000181, 178);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('75 Baldwin Street', to_date('22-05-1975', 'dd-mm-yyyy'), 100000064, 179);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('61 Cage Blvd', to_date('27-08-1997', 'dd-mm-yyyy'), 100000036, 180);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('33rd Street', to_date('04-08-1994', 'dd-mm-yyyy'), 100000373, 181);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('84 Aurora Road', to_date('18-02-1977', 'dd-mm-yyyy'), 100000052, 182);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Jeroen Drive', to_date('16-06-1959', 'dd-mm-yyyy'), 100000291, 183);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('32 El-Saher Drive', to_date('03-06-1984', 'dd-mm-yyyy'), 100000133, 184);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('888 Duluth Drive', to_date('11-08-1955', 'dd-mm-yyyy'), 100000046, 185);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('74 Mann', to_date('19-01-1939', 'dd-mm-yyyy'), 100000275, 186);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('92nd Street', to_date('28-06-2002', 'dd-mm-yyyy'), 100000229, 187);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('21st Street', to_date('05-03-1953', 'dd-mm-yyyy'), 100000101, 188);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('245 Veenendaal Road', to_date('27-12-1972', 'dd-mm-yyyy'), 100000172, 189);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('86 Lennie Drive', to_date('02-10-1991', 'dd-mm-yyyy'), 100000329, 190);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73 Lizzy', to_date('14-02-2008', 'dd-mm-yyyy'), 100000011, 191);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('18 Yogyakarta Street', to_date('23-04-1971', 'dd-mm-yyyy'), 100000047, 192);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('57 Vanessa Road', to_date('30-08-1997', 'dd-mm-yyyy'), 100000122, 193);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('79 Oshkosh Street', to_date('30-01-1941', 'dd-mm-yyyy'), 100000329, 194);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('68 Thin Street', to_date('08-03-1948', 'dd-mm-yyyy'), 100000106, 195);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('215 Redondo beach Road', to_date('27-07-1955', 'dd-mm-yyyy'), 100000186, 196);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('59 Olyphant Ave', to_date('27-09-1973', 'dd-mm-yyyy'), 100000278, 197);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('42nd Street', to_date('09-07-1957', 'dd-mm-yyyy'), 100000396, 198);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('15 Zellweger', to_date('25-06-1948', 'dd-mm-yyyy'), 100000225, 199);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('26 Carolyn Street', to_date('09-03-2008', 'dd-mm-yyyy'), 100000037, 200);
commit;
prompt 200 records committed...
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('31 Joinville Drive', to_date('21-12-2007', 'dd-mm-yyyy'), 100000114, 201);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('35 Winger Street', to_date('04-04-1953', 'dd-mm-yyyy'), 100000214, 202);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('1 Vallauris Road', to_date('21-12-1946', 'dd-mm-yyyy'), 100000253, 203);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('32nd Street', to_date('09-07-1992', 'dd-mm-yyyy'), 100000186, 204);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('98 Akins', to_date('20-06-1970', 'dd-mm-yyyy'), 100000045, 205);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('361 Masur Street', to_date('14-06-2001', 'dd-mm-yyyy'), 100000377, 206);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('57 Tcheky Drive', to_date('29-03-1976', 'dd-mm-yyyy'), 100000157, 207);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('860 Ferrer Road', to_date('03-10-1985', 'dd-mm-yyyy'), 100000075, 208);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('55 Heche Street', to_date('28-11-2008', 'dd-mm-yyyy'), 100000124, 209);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('614 New Hyde Park Blvd', to_date('03-09-1940', 'dd-mm-yyyy'), 100000245, 210);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('62nd Street', to_date('26-10-1977', 'dd-mm-yyyy'), 100000090, 211);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('6 Delbert Road', to_date('15-10-1991', 'dd-mm-yyyy'), 100000270, 212);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('19 Moe Street', to_date('08-08-1959', 'dd-mm-yyyy'), 100000099, 213);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('11st Street', to_date('22-05-1957', 'dd-mm-yyyy'), 100000187, 214);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('933 Crewson Road', to_date('05-02-2008', 'dd-mm-yyyy'), 100000387, 215);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('48 de Lancie Blvd', to_date('16-06-1974', 'dd-mm-yyyy'), 100000088, 216);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('74 Rebecca Road', to_date('27-05-1960', 'dd-mm-yyyy'), 100000336, 217);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('90 Gilbert Street', to_date('11-04-1990', 'dd-mm-yyyy'), 100000187, 218);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('30 Snow Road', to_date('21-02-1971', 'dd-mm-yyyy'), 100000320, 219);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('36 Vilnius Ave', to_date('21-03-2007', 'dd-mm-yyyy'), 100000154, 220);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('28 Quinlan Street', to_date('12-01-1964', 'dd-mm-yyyy'), 100000085, 221);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72 Kasey Street', to_date('16-05-1951', 'dd-mm-yyyy'), 100000021, 222);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('32nd Street', to_date('16-11-1984', 'dd-mm-yyyy'), 100000143, 223);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('50 Tarantino', to_date('22-04-1947', 'dd-mm-yyyy'), 100000292, 224);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('810 Thewlis Road', to_date('28-05-1945', 'dd-mm-yyyy'), 100000209, 225);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('97 Chambers Blvd', to_date('28-09-1974', 'dd-mm-yyyy'), 100000082, 226);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('79 Gallant Drive', to_date('21-04-1992', 'dd-mm-yyyy'), 100000302, 227);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('87 Firth Street', to_date('16-03-1962', 'dd-mm-yyyy'), 100000227, 228);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('64 Red Street', to_date('27-10-1974', 'dd-mm-yyyy'), 100000376, 229);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('55 Oszajca Blvd', to_date('28-11-1943', 'dd-mm-yyyy'), 100000239, 230);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('50 Victor Road', to_date('17-04-1985', 'dd-mm-yyyy'), 100000187, 231);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('62 Rossellini Drive', to_date('14-03-1930', 'dd-mm-yyyy'), 100000074, 232);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('82nd Street', to_date('22-04-2009', 'dd-mm-yyyy'), 100000286, 233);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('91st Street', to_date('20-03-1957', 'dd-mm-yyyy'), 100000154, 234);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('52 Hayward Street', to_date('18-02-1994', 'dd-mm-yyyy'), 100000125, 235);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('62 Moscow Drive', to_date('10-08-1995', 'dd-mm-yyyy'), 100000045, 236);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('71st Street', to_date('08-08-1969', 'dd-mm-yyyy'), 100000342, 237);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('66 Lennox Road', to_date('23-10-1944', 'dd-mm-yyyy'), 100000283, 238);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('93 Pepper Drive', to_date('06-01-1989', 'dd-mm-yyyy'), 100000172, 239);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('11st Street', to_date('23-02-1933', 'dd-mm-yyyy'), 100000023, 240);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('95 Balmoral Road', to_date('22-04-2003', 'dd-mm-yyyy'), 100000076, 241);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('34 Pat Road', to_date('04-05-2008', 'dd-mm-yyyy'), 100000120, 242);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('782 Wilson Road', to_date('21-01-1987', 'dd-mm-yyyy'), 100000118, 243);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('51 Kyoto Drive', to_date('17-06-1968', 'dd-mm-yyyy'), 100000334, 244);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('81 Oxford Road', to_date('11-03-1961', 'dd-mm-yyyy'), 100000081, 245);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('94 Tarantino Ave', to_date('12-12-2009', 'dd-mm-yyyy'), 100000030, 246);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('28 Holden Street', to_date('15-11-1962', 'dd-mm-yyyy'), 100000359, 247);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('55 Burton Street', to_date('14-04-1959', 'dd-mm-yyyy'), 100000343, 248);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('24 Hynde Street', to_date('15-09-1960', 'dd-mm-yyyy'), 100000366, 249);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('14 Gdansk Road', to_date('25-10-1984', 'dd-mm-yyyy'), 100000354, 250);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('10 Lynch Street', to_date('14-06-2005', 'dd-mm-yyyy'), 100000000, 251);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('7 Kathy Drive', to_date('15-11-1974', 'dd-mm-yyyy'), 100000375, 252);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('30 Wells Drive', to_date('26-05-1992', 'dd-mm-yyyy'), 100000116, 253);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('446 Nastassja Road', to_date('08-03-1934', 'dd-mm-yyyy'), 100000267, 254);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('47 Diddley Road', to_date('04-10-1942', 'dd-mm-yyyy'), 100000059, 255);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('71 Bielefeld Drive', to_date('16-08-1945', 'dd-mm-yyyy'), 100000256, 256);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('71 Kimball Street', to_date('23-07-1966', 'dd-mm-yyyy'), 100000392, 257);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('41 Larnelle Drive', to_date('26-03-1950', 'dd-mm-yyyy'), 100000067, 258);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('41 Akita', to_date('27-11-1935', 'dd-mm-yyyy'), 100000173, 259);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('60 Velizy Villacoublay Street', to_date('03-03-1967', 'dd-mm-yyyy'), 100000064, 260);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('12 Mobile Road', to_date('01-09-2004', 'dd-mm-yyyy'), 100000362, 261);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('76 Gore', to_date('08-03-1977', 'dd-mm-yyyy'), 100000141, 262);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('25 Palin Road', to_date('30-04-2001', 'dd-mm-yyyy'), 100000103, 263);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('43 Fender', to_date('13-10-1978', 'dd-mm-yyyy'), 100000085, 264);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('38 Mt. Laurel Road', to_date('14-02-1999', 'dd-mm-yyyy'), 100000099, 265);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('89 Heald Blvd', to_date('26-07-1964', 'dd-mm-yyyy'), 100000308, 266);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('23 Quinones Drive', to_date('13-05-1961', 'dd-mm-yyyy'), 100000366, 267);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('59 League city Ave', to_date('23-03-1943', 'dd-mm-yyyy'), 100000267, 268);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('84 Gallagher', to_date('03-07-1941', 'dd-mm-yyyy'), 100000026, 269);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('66 Affleck Road', to_date('21-09-1970', 'dd-mm-yyyy'), 100000073, 270);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('71 Remar Road', to_date('03-11-1979', 'dd-mm-yyyy'), 100000386, 271);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('45 Cannock', to_date('11-11-1945', 'dd-mm-yyyy'), 100000071, 272);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72 Kinski Drive', to_date('13-10-1970', 'dd-mm-yyyy'), 100000079, 273);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('54 Robinson Drive', to_date('04-10-1976', 'dd-mm-yyyy'), 100000266, 274);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('54 Nik Drive', to_date('15-10-1947', 'dd-mm-yyyy'), 100000032, 275);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('78 Walnut Creek Blvd', to_date('14-02-1973', 'dd-mm-yyyy'), 100000344, 276);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('913 Nolte Street', to_date('01-07-1987', 'dd-mm-yyyy'), 100000208, 277);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('26 Napolitano Drive', to_date('09-06-1963', 'dd-mm-yyyy'), 100000061, 278);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('10 Nathan Drive', to_date('31-01-1944', 'dd-mm-yyyy'), 100000172, 279);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('67 Def Road', to_date('19-05-1985', 'dd-mm-yyyy'), 100000273, 280);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('76 Elias Street', to_date('24-09-1931', 'dd-mm-yyyy'), 100000039, 281);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('90 Larter Street', to_date('25-05-2004', 'dd-mm-yyyy'), 100000258, 282);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('90 Marianne Drive', to_date('22-04-1960', 'dd-mm-yyyy'), 100000181, 283);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('85 Lillard Road', to_date('17-09-1957', 'dd-mm-yyyy'), 100000258, 284);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('72 Roy Parnell Street', to_date('28-01-2004', 'dd-mm-yyyy'), 100000109, 285);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('39 Chinlund Road', to_date('23-12-2004', 'dd-mm-yyyy'), 100000117, 286);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('3 Mili Ave', to_date('15-09-1986', 'dd-mm-yyyy'), 100000111, 287);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('23rd Street', to_date('18-01-1982', 'dd-mm-yyyy'), 100000156, 288);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('30 Neville Road', to_date('10-10-1966', 'dd-mm-yyyy'), 100000165, 289);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('42 Hunt Valley Ave', to_date('23-12-1975', 'dd-mm-yyyy'), 100000275, 290);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('704 Vaughan Street', to_date('11-05-1964', 'dd-mm-yyyy'), 100000062, 291);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('23 Sarandon', to_date('21-08-1943', 'dd-mm-yyyy'), 100000017, 292);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('327 Avril Street', to_date('17-02-1949', 'dd-mm-yyyy'), 100000312, 293);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('48 Hawthorne Street', to_date('17-04-1987', 'dd-mm-yyyy'), 100000263, 294);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Amsterdam Ave', to_date('06-09-1968', 'dd-mm-yyyy'), 100000233, 295);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('49 Borgnine Road', to_date('03-05-1932', 'dd-mm-yyyy'), 100000172, 296);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('54 Midler Street', to_date('06-08-2006', 'dd-mm-yyyy'), 100000382, 297);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('71st Street', to_date('19-06-2008', 'dd-mm-yyyy'), 100000286, 298);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('92nd Street', to_date('07-12-1931', 'dd-mm-yyyy'), 100000105, 299);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('26 Pleasence Road', to_date('04-08-1932', 'dd-mm-yyyy'), 100000060, 300);
commit;
prompt 300 records committed...
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('45 Baltimore Road', to_date('13-06-1972', 'dd-mm-yyyy'), 100000244, 301);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('21st Street', to_date('22-01-1941', 'dd-mm-yyyy'), 100000268, 302);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('341 Warwick Street', to_date('15-04-1977', 'dd-mm-yyyy'), 100000237, 303);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('4 Serbedzija Drive', to_date('24-09-1943', 'dd-mm-yyyy'), 100000133, 304);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('76 Mapo-gu Street', to_date('08-11-1942', 'dd-mm-yyyy'), 100000028, 305);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('97 Vilafranca Penedes Road', to_date('05-12-1973', 'dd-mm-yyyy'), 100000255, 306);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('75 Neil Street', to_date('20-03-1933', 'dd-mm-yyyy'), 100000035, 307);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Hjallerup Street', to_date('21-01-1954', 'dd-mm-yyyy'), 100000232, 308);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('31 Campana', to_date('30-08-1971', 'dd-mm-yyyy'), 100000042, 309);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('87 Rourke Drive', to_date('26-05-1982', 'dd-mm-yyyy'), 100000047, 310);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('40 Parma Ave', to_date('24-11-1970', 'dd-mm-yyyy'), 100000381, 311);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('9 Chambers Road', to_date('05-06-1986', 'dd-mm-yyyy'), 100000289, 312);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('18 Rhodes Drive', to_date('17-08-1992', 'dd-mm-yyyy'), 100000029, 313);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('97 Johansen Street', to_date('19-10-1931', 'dd-mm-yyyy'), 100000161, 314);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('59 Kyra Road', to_date('16-01-2002', 'dd-mm-yyyy'), 100000187, 315);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('52 Diggs Road', to_date('30-09-1959', 'dd-mm-yyyy'), 100000146, 316);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('34 Bassett Street', to_date('25-06-1988', 'dd-mm-yyyy'), 100000309, 317);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('21 Griggs Blvd', to_date('30-03-1940', 'dd-mm-yyyy'), 100000367, 318);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('94 Franklin Street', to_date('28-02-1948', 'dd-mm-yyyy'), 100000155, 319);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('38 Conley Street', to_date('04-04-1945', 'dd-mm-yyyy'), 100000316, 320);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('32 Gooding Street', to_date('17-03-1948', 'dd-mm-yyyy'), 100000158, 321);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('10 King of Prussia Street', to_date('29-08-2003', 'dd-mm-yyyy'), 100000203, 322);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('190 Lowe', to_date('03-11-1931', 'dd-mm-yyyy'), 100000384, 323);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('23rd Street', to_date('10-12-1960', 'dd-mm-yyyy'), 100000167, 324);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('36 Hornsby Road', to_date('25-10-1968', 'dd-mm-yyyy'), 100000064, 325);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('93 Eric Road', to_date('25-06-1976', 'dd-mm-yyyy'), 100000102, 326);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('86 Chubby Road', to_date('20-11-2002', 'dd-mm-yyyy'), 100000016, 327);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('34 Garry Street', to_date('21-06-1941', 'dd-mm-yyyy'), 100000166, 328);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('94 Salvador', to_date('12-05-1970', 'dd-mm-yyyy'), 100000303, 329);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('14 Sammy Street', to_date('31-03-1990', 'dd-mm-yyyy'), 100000264, 330);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('211 Plimpton Blvd', to_date('07-01-1949', 'dd-mm-yyyy'), 100000262, 331);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('2 Collins Road', to_date('17-12-1960', 'dd-mm-yyyy'), 100000376, 332);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('57 Samuel Street', to_date('26-04-1933', 'dd-mm-yyyy'), 100000078, 333);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('24 Michendorf Blvd', to_date('08-03-1982', 'dd-mm-yyyy'), 100000353, 334);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('93 Begley Street', to_date('09-11-1971', 'dd-mm-yyyy'), 100000072, 335);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('877 Nepean', to_date('13-03-2001', 'dd-mm-yyyy'), 100000190, 336);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('78 von Sydow Street', to_date('28-08-1947', 'dd-mm-yyyy'), 100000276, 337);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('95 Gaby Street', to_date('27-08-1956', 'dd-mm-yyyy'), 100000224, 338);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('77 Williamson Street', to_date('11-12-2008', 'dd-mm-yyyy'), 100000091, 339);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73 Alcobendas Road', to_date('15-09-1971', 'dd-mm-yyyy'), 100000352, 340);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Oakenfold Road', to_date('25-09-1954', 'dd-mm-yyyy'), 100000385, 341);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('82 Hunt Road', to_date('07-01-1933', 'dd-mm-yyyy'), 100000196, 342);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('61 Gavin Street', to_date('23-04-2008', 'dd-mm-yyyy'), 100000304, 343);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('56 Negbaur Blvd', to_date('26-10-1971', 'dd-mm-yyyy'), 100000236, 344);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73rd Street', to_date('06-11-1948', 'dd-mm-yyyy'), 100000130, 345);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('3 Goldblum', to_date('19-01-1972', 'dd-mm-yyyy'), 100000289, 346);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('71 Dawson Blvd', to_date('14-04-1951', 'dd-mm-yyyy'), 100000233, 347);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('69 Wien Blvd', to_date('03-04-1978', 'dd-mm-yyyy'), 100000385, 348);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('44 Szazhalombatta Street', to_date('07-03-1932', 'dd-mm-yyyy'), 100000197, 349);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('59 Rifkin Blvd', to_date('20-12-1970', 'dd-mm-yyyy'), 100000198, 350);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('798 Hirsch Road', to_date('12-01-1962', 'dd-mm-yyyy'), 100000281, 351);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('92 Jena Blvd', to_date('08-06-1994', 'dd-mm-yyyy'), 100000300, 352);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('13rd Street', to_date('01-09-1983', 'dd-mm-yyyy'), 100000389, 353);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('49 Campbell Road', to_date('02-03-2006', 'dd-mm-yyyy'), 100000123, 354);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('81 Annette Road', to_date('18-01-1977', 'dd-mm-yyyy'), 100000136, 355);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('49 Hochwald Street', to_date('28-02-2002', 'dd-mm-yyyy'), 100000206, 356);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('117 Torres Street', to_date('01-08-2002', 'dd-mm-yyyy'), 100000120, 357);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('4 Seattle Drive', to_date('27-01-1977', 'dd-mm-yyyy'), 100000131, 358);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('69 Riverdale', to_date('07-06-1990', 'dd-mm-yyyy'), 100000055, 359);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('33 Eugene Street', to_date('11-09-1974', 'dd-mm-yyyy'), 100000000, 360);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('53 Conley', to_date('15-01-1994', 'dd-mm-yyyy'), 100000319, 361);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('12 Leary Drive', to_date('26-11-1997', 'dd-mm-yyyy'), 100000345, 362);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('81 Waite', to_date('26-02-1958', 'dd-mm-yyyy'), 100000166, 363);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('29 Sampson Blvd', to_date('02-03-1950', 'dd-mm-yyyy'), 100000046, 364);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('891 Cube Road', to_date('28-05-1948', 'dd-mm-yyyy'), 100000377, 365);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('61 King Street', to_date('10-10-1956', 'dd-mm-yyyy'), 100000114, 366);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('32nd Street', to_date('13-07-1997', 'dd-mm-yyyy'), 100000303, 367);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('83 Bonn Drive', to_date('15-01-1974', 'dd-mm-yyyy'), 100000310, 368);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('5 Curtis Road', to_date('28-09-1975', 'dd-mm-yyyy'), 100000242, 369);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('69 Broderick Street', to_date('13-11-1944', 'dd-mm-yyyy'), 100000310, 370);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('93rd Street', to_date('13-05-1996', 'dd-mm-yyyy'), 100000157, 371);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('11 Hyde Street', to_date('06-01-1997', 'dd-mm-yyyy'), 100000174, 372);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('15 Alana', to_date('22-05-1956', 'dd-mm-yyyy'), 100000162, 373);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('111 Marley Street', to_date('30-07-1986', 'dd-mm-yyyy'), 100000063, 374);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('64 Athens Road', to_date('07-12-1983', 'dd-mm-yyyy'), 100000132, 375);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('73rd Street', to_date('19-02-1936', 'dd-mm-yyyy'), 100000309, 376);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('46 Woking Drive', to_date('17-07-1990', 'dd-mm-yyyy'), 100000081, 377);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('83 Griffiths Blvd', to_date('29-04-1982', 'dd-mm-yyyy'), 100000012, 378);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('31 Yokohama Street', to_date('26-12-1937', 'dd-mm-yyyy'), 100000044, 379);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('25 Hilton Street', to_date('10-08-1945', 'dd-mm-yyyy'), 100000132, 380);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('21st Street', to_date('06-11-1992', 'dd-mm-yyyy'), 100000256, 381);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('66 Cattrall', to_date('11-10-1990', 'dd-mm-yyyy'), 100000130, 382);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('74 Americana Street', to_date('17-10-1975', 'dd-mm-yyyy'), 100000231, 383);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('47 Branagh', to_date('19-10-1933', 'dd-mm-yyyy'), 100000027, 384);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('7 Ulm Ave', to_date('21-07-2000', 'dd-mm-yyyy'), 100000135, 385);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('97 Hong Kong Street', to_date('28-05-1980', 'dd-mm-yyyy'), 100000343, 386);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('274 Hikaru Road', to_date('26-07-1982', 'dd-mm-yyyy'), 100000176, 387);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('78 Gilliam Blvd', to_date('23-06-1937', 'dd-mm-yyyy'), 100000092, 388);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('48 Moriarty Blvd', to_date('08-04-1978', 'dd-mm-yyyy'), 100000065, 389);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('23 Lippetal Drive', to_date('08-07-1967', 'dd-mm-yyyy'), 100000392, 390);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('44 Colm Drive', to_date('17-10-1943', 'dd-mm-yyyy'), 100000002, 391);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('32 Fraser Street', to_date('31-05-2004', 'dd-mm-yyyy'), 100000220, 392);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('81 Tilly Blvd', to_date('24-10-1935', 'dd-mm-yyyy'), 100000397, 393);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('7 Macht Drive', to_date('01-08-1981', 'dd-mm-yyyy'), 100000299, 394);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('688 Aglukark', to_date('07-06-1976', 'dd-mm-yyyy'), 100000190, 395);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('43 Cocker Street', to_date('10-03-1998', 'dd-mm-yyyy'), 100000355, 396);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('52 Nagoya Street', to_date('06-10-1999', 'dd-mm-yyyy'), 100000174, 397);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('65 Carlisle Road', to_date('03-03-1947', 'dd-mm-yyyy'), 100000075, 398);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('43rd Street', to_date('10-08-1952', 'dd-mm-yyyy'), 100000372, 399);
insert into COMMUNITYMEMBER (address, date_of_birth, person_id, member_id)
values ('64 Bush Blvd', to_date('28-06-1980', 'dd-mm-yyyy'), 100000276, 400);
commit;
prompt 400 records loaded
prompt Loading BIRTH...
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-07-2019', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 64);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-07-1995', 'dd-mm-yyyy'), 9, 'one spouse works', 374);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-01-1998', 'dd-mm-yyyy'), 15, 'one spouse works', 367);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-04-1993', 'dd-mm-yyyy'), 3, 'one spouse works', 147);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-09-2008', 'dd-mm-yyyy'), 3, 'one spouse works', 322);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-06-1994', 'dd-mm-yyyy'), 24, 'one spouse works', 50);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-04-2022', 'dd-mm-yyyy'), 19, 'both spouses work', 38);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-08-1998', 'dd-mm-yyyy'), 23, 'both spouses work', 113);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-12-2001', 'dd-mm-yyyy'), 20, 'special child', 279);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-02-2022', 'dd-mm-yyyy'), 25, 'Family in need of extra financial help', 283);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-05-2021', 'dd-mm-yyyy'), 1, 'both spouses work', 10);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-08-2006', 'dd-mm-yyyy'), 22, 'one spouse works', 324);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-12-2018', 'dd-mm-yyyy'), 8, 'both spouses work', 67);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-01-2021', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 254);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-08-2018', 'dd-mm-yyyy'), 9, 'both spouses work', 155);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-03-2002', 'dd-mm-yyyy'), 18, 'both spouses work', 107);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-10-1991', 'dd-mm-yyyy'), 24, 'both spouses work', 365);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-03-1996', 'dd-mm-yyyy'), 10, 'one spouse works', 209);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-07-2013', 'dd-mm-yyyy'), 9, 'special child', 26);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-12-2005', 'dd-mm-yyyy'), 7, 'one spouse works', 394);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-03-1991', 'dd-mm-yyyy'), 2, 'both spouses work', 271);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-02-1996', 'dd-mm-yyyy'), 7, 'one spouse works', 132);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-11-1996', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 337);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-06-2020', 'dd-mm-yyyy'), 19, 'special child', 391);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-06-2000', 'dd-mm-yyyy'), 10, 'one spouse works', 381);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-05-2024', 'dd-mm-yyyy'), 24, 'special child', 21);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-11-1999', 'dd-mm-yyyy'), 2, 'special child', 32);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-02-2011', 'dd-mm-yyyy'), 25, 'special child', 259);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-04-1999', 'dd-mm-yyyy'), 1, 'one spouse works', 258);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-06-2020', 'dd-mm-yyyy'), 25, 'special child', 166);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-03-2006', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 165);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 15, 'one spouse works', 183);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-07-2013', 'dd-mm-yyyy'), 23, 'both spouses work', 315);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-01-2012', 'dd-mm-yyyy'), 20, 'special child', 218);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-07-2001', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 174);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('23-03-1995', 'dd-mm-yyyy'), 2, 'special child', 252);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-08-1992', 'dd-mm-yyyy'), 19, 'one spouse works', 83);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-12-1992', 'dd-mm-yyyy'), 20, 'one spouse works', 272);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-01-2023', 'dd-mm-yyyy'), 24, 'special child', 154);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-10-2005', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 331);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-02-1996', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 90);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-10-2006', 'dd-mm-yyyy'), 17, 'Family in need of extra financial help', 333);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-12-2001', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 333);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-03-2022', 'dd-mm-yyyy'), 16, 'Family in need of extra financial help', 337);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-12-2002', 'dd-mm-yyyy'), 17, 'Family in need of extra financial help', 133);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 15, 'Family in need of extra financial help', 197);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-02-2020', 'dd-mm-yyyy'), 6, 'both spouses work', 147);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-09-2014', 'dd-mm-yyyy'), 5, 'special child', 114);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-01-1995', 'dd-mm-yyyy'), 7, 'both spouses work', 356);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-05-1992', 'dd-mm-yyyy'), 4, 'Family in need of extra financial help', 125);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-11-2014', 'dd-mm-yyyy'), 20, 'Family in need of extra financial help', 116);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-02-2006', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 109);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-09-2006', 'dd-mm-yyyy'), 6, 'special child', 325);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-07-2022', 'dd-mm-yyyy'), 24, 'special child', 318);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('28-11-2000', 'dd-mm-yyyy'), 13, 'both spouses work', 119);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-10-2018', 'dd-mm-yyyy'), 5, 'both spouses work', 43);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-02-2002', 'dd-mm-yyyy'), 12, 'special child', 98);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-08-1991', 'dd-mm-yyyy'), 11, 'both spouses work', 391);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-02-2016', 'dd-mm-yyyy'), 14, 'one spouse works', 67);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-05-2020', 'dd-mm-yyyy'), 22, 'Family in need of extra financial help', 393);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-08-1993', 'dd-mm-yyyy'), 21, 'Family in need of extra financial help', 108);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-12-2004', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 46);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-05-1999', 'dd-mm-yyyy'), 15, 'both spouses work', 178);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-01-2008', 'dd-mm-yyyy'), 13, 'Family in need of extra financial help', 260);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-06-2022', 'dd-mm-yyyy'), 13, 'one spouse works', 230);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-01-1998', 'dd-mm-yyyy'), 10, 'one spouse works', 153);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-12-2011', 'dd-mm-yyyy'), 4, 'special child', 56);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-03-2023', 'dd-mm-yyyy'), 24, 'one spouse works', 49);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-06-2001', 'dd-mm-yyyy'), 22, 'one spouse works', 62);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-12-1992', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 219);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-06-2011', 'dd-mm-yyyy'), 18, 'one spouse works', 161);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-08-1994', 'dd-mm-yyyy'), 18, 'special child', 139);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-10-2005', 'dd-mm-yyyy'), 25, 'Family in need of extra financial help', 397);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-10-2009', 'dd-mm-yyyy'), 18, 'one spouse works', 268);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-12-2004', 'dd-mm-yyyy'), 22, 'one spouse works', 88);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-07-1994', 'dd-mm-yyyy'), 5, 'both spouses work', 363);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-06-2012', 'dd-mm-yyyy'), 15, 'Family in need of extra financial help', 299);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-01-2013', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 311);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-10-1994', 'dd-mm-yyyy'), 15, 'Family in need of extra financial help', 38);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-07-2012', 'dd-mm-yyyy'), 18, 'one spouse works', 283);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-07-2018', 'dd-mm-yyyy'), 11, 'one spouse works', 177);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-07-1995', 'dd-mm-yyyy'), 16, 'both spouses work', 224);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-12-1993', 'dd-mm-yyyy'), 11, 'both spouses work', 298);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-04-2005', 'dd-mm-yyyy'), 20, 'Family in need of extra financial help', 258);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-04-2022', 'dd-mm-yyyy'), 7, 'both spouses work', 62);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-04-1993', 'dd-mm-yyyy'), 5, 'both spouses work', 23);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-07-2006', 'dd-mm-yyyy'), 12, 'one spouse works', 310);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('28-09-2014', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 128);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-01-2003', 'dd-mm-yyyy'), 8, 'special child', 279);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-07-1997', 'dd-mm-yyyy'), 5, 'both spouses work', 138);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-05-2008', 'dd-mm-yyyy'), 23, 'Family in need of extra financial help', 151);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-12-2010', 'dd-mm-yyyy'), 5, 'one spouse works', 283);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-10-2005', 'dd-mm-yyyy'), 4, 'special child', 125);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-02-2004', 'dd-mm-yyyy'), 8, 'both spouses work', 89);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-10-1996', 'dd-mm-yyyy'), 24, 'one spouse works', 7);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-08-2010', 'dd-mm-yyyy'), 6, 'special child', 341);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-02-2018', 'dd-mm-yyyy'), 2, 'one spouse works', 141);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-02-1994', 'dd-mm-yyyy'), 4, 'one spouse works', 361);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-03-2005', 'dd-mm-yyyy'), 1, 'special child', 46);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-03-2023', 'dd-mm-yyyy'), 23, 'both spouses work', 221);
commit;
prompt 100 records committed...
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-12-2019', 'dd-mm-yyyy'), 8, 'one spouse works', 392);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-09-2017', 'dd-mm-yyyy'), 10, 'Family in need of extra financial help', 276);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-04-2015', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 294);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-02-1997', 'dd-mm-yyyy'), 13, 'Family in need of extra financial help', 21);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('23-06-1998', 'dd-mm-yyyy'), 2, 'one spouse works', 335);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-11-2002', 'dd-mm-yyyy'), 23, 'one spouse works', 274);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-05-2006', 'dd-mm-yyyy'), 20, 'both spouses work', 111);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-01-2007', 'dd-mm-yyyy'), 19, 'Family in need of extra financial help', 287);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-08-1997', 'dd-mm-yyyy'), 23, 'Family in need of extra financial help', 300);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-02-2011', 'dd-mm-yyyy'), 1, 'special child', 180);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-09-2004', 'dd-mm-yyyy'), 12, 'both spouses work', 64);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-05-1993', 'dd-mm-yyyy'), 22, 'both spouses work', 296);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-06-1995', 'dd-mm-yyyy'), 18, 'one spouse works', 163);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-11-2011', 'dd-mm-yyyy'), 16, 'both spouses work', 288);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-07-1995', 'dd-mm-yyyy'), 18, 'one spouse works', 205);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-05-2018', 'dd-mm-yyyy'), 18, 'one spouse works', 325);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-08-2022', 'dd-mm-yyyy'), 1, 'Family in need of extra financial help', 18);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-07-2000', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 29);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-12-2006', 'dd-mm-yyyy'), 2, 'one spouse works', 343);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-12-2005', 'dd-mm-yyyy'), 4, 'Family in need of extra financial help', 328);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-03-2005', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 58);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-10-2013', 'dd-mm-yyyy'), 3, 'both spouses work', 248);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-08-2021', 'dd-mm-yyyy'), 19, 'both spouses work', 321);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-07-1997', 'dd-mm-yyyy'), 1, 'one spouse works', 212);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-05-2020', 'dd-mm-yyyy'), 17, 'Family in need of extra financial help', 44);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-12-2006', 'dd-mm-yyyy'), 13, 'one spouse works', 281);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-09-1991', 'dd-mm-yyyy'), 9, 'special child', 288);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('21-11-1994', 'dd-mm-yyyy'), 12, 'both spouses work', 109);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-07-2002', 'dd-mm-yyyy'), 22, 'special child', 384);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-06-2006', 'dd-mm-yyyy'), 22, 'both spouses work', 228);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-12-1991', 'dd-mm-yyyy'), 9, 'special child', 179);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-12-2009', 'dd-mm-yyyy'), 2, 'both spouses work', 255);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-05-1998', 'dd-mm-yyyy'), 20, 'one spouse works', 8);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-12-2021', 'dd-mm-yyyy'), 24, 'special child', 27);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-06-1993', 'dd-mm-yyyy'), 4, 'one spouse works', 387);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-11-2010', 'dd-mm-yyyy'), 1, 'special child', 61);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('21-06-2010', 'dd-mm-yyyy'), 22, 'Family in need of extra financial help', 238);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-04-1992', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 134);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-09-2016', 'dd-mm-yyyy'), 10, 'one spouse works', 35);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-10-2005', 'dd-mm-yyyy'), 11, 'one spouse works', 393);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-01-2012', 'dd-mm-yyyy'), 9, 'special child', 271);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-05-2007', 'dd-mm-yyyy'), 3, 'one spouse works', 190);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-09-2008', 'dd-mm-yyyy'), 23, 'special child', 58);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 8, 'special child', 240);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('23-06-1996', 'dd-mm-yyyy'), 10, 'one spouse works', 247);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-02-2013', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 103);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-10-1995', 'dd-mm-yyyy'), 4, 'special child', 273);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-03-1991', 'dd-mm-yyyy'), 24, 'Family in need of extra financial help', 195);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-07-1992', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 327);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-11-1998', 'dd-mm-yyyy'), 24, 'one spouse works', 321);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('21-07-1995', 'dd-mm-yyyy'), 9, 'one spouse works', 54);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-01-1990', 'dd-mm-yyyy'), 24, 'one spouse works', 330);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-04-2010', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 169);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-04-2012', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 104);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-05-1997', 'dd-mm-yyyy'), 13, 'special child', 209);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-11-1994', 'dd-mm-yyyy'), 15, 'Family in need of extra financial help', 65);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-03-2022', 'dd-mm-yyyy'), 6, 'one spouse works', 400);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-06-2002', 'dd-mm-yyyy'), 8, 'one spouse works', 205);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-10-2011', 'dd-mm-yyyy'), 20, 'one spouse works', 54);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-11-1992', 'dd-mm-yyyy'), 21, 'one spouse works', 49);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-12-2011', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 93);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-11-2006', 'dd-mm-yyyy'), 13, 'one spouse works', 337);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-12-2016', 'dd-mm-yyyy'), 16, 'Family in need of extra financial help', 90);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-05-1998', 'dd-mm-yyyy'), 16, 'one spouse works', 33);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-03-1990', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 244);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-07-1994', 'dd-mm-yyyy'), 15, 'special child', 257);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-01-2008', 'dd-mm-yyyy'), 23, 'one spouse works', 274);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-01-1999', 'dd-mm-yyyy'), 1, 'special child', 345);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-03-2009', 'dd-mm-yyyy'), 16, 'both spouses work', 41);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-08-2018', 'dd-mm-yyyy'), 14, 'both spouses work', 33);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-01-2012', 'dd-mm-yyyy'), 5, 'Family in need of extra financial help', 296);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-06-2005', 'dd-mm-yyyy'), 11, 'special child', 164);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-11-2005', 'dd-mm-yyyy'), 18, 'special child', 346);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-10-1990', 'dd-mm-yyyy'), 24, 'both spouses work', 324);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-02-2000', 'dd-mm-yyyy'), 22, 'special child', 255);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-05-1997', 'dd-mm-yyyy'), 19, 'special child', 197);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-06-2023', 'dd-mm-yyyy'), 18, 'one spouse works', 364);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-08-2005', 'dd-mm-yyyy'), 22, 'special child', 253);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-03-2005', 'dd-mm-yyyy'), 9, 'both spouses work', 135);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('28-06-2007', 'dd-mm-yyyy'), 16, 'both spouses work', 153);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-09-2019', 'dd-mm-yyyy'), 16, 'both spouses work', 324);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-10-2011', 'dd-mm-yyyy'), 7, 'both spouses work', 83);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-12-1999', 'dd-mm-yyyy'), 8, 'special child', 76);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('28-11-1998', 'dd-mm-yyyy'), 13, 'special child', 217);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-05-2020', 'dd-mm-yyyy'), 8, 'one spouse works', 147);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-03-1999', 'dd-mm-yyyy'), 24, 'one spouse works', 292);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-12-2014', 'dd-mm-yyyy'), 19, 'special child', 250);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-11-2017', 'dd-mm-yyyy'), 1, 'special child', 126);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-10-1995', 'dd-mm-yyyy'), 14, 'one spouse works', 127);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-12-2013', 'dd-mm-yyyy'), 2, 'one spouse works', 245);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-11-2015', 'dd-mm-yyyy'), 7, 'both spouses work', 341);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-03-2002', 'dd-mm-yyyy'), 25, 'Family in need of extra financial help', 245);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-11-2013', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 3);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-06-2001', 'dd-mm-yyyy'), 25, 'one spouse works', 74);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-12-2021', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 213);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-03-2003', 'dd-mm-yyyy'), 18, 'one spouse works', 241);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-08-2014', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 34);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-04-1993', 'dd-mm-yyyy'), 16, 'one spouse works', 149);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-10-2017', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 189);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-08-1993', 'dd-mm-yyyy'), 2, 'special child', 156);
commit;
prompt 200 records committed...
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-08-1996', 'dd-mm-yyyy'), 16, 'Family in need of extra financial help', 78);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-03-2019', 'dd-mm-yyyy'), 20, 'one spouse works', 155);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-12-2002', 'dd-mm-yyyy'), 18, 'special child', 127);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-12-2020', 'dd-mm-yyyy'), 21, 'both spouses work', 286);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-05-1998', 'dd-mm-yyyy'), 19, 'one spouse works', 259);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-02-2019', 'dd-mm-yyyy'), 24, 'Family in need of extra financial help', 167);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-08-2006', 'dd-mm-yyyy'), 11, 'one spouse works', 90);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-10-2015', 'dd-mm-yyyy'), 20, 'Family in need of extra financial help', 253);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-05-2009', 'dd-mm-yyyy'), 24, 'one spouse works', 49);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-05-1995', 'dd-mm-yyyy'), 24, 'Family in need of extra financial help', 122);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-10-1999', 'dd-mm-yyyy'), 20, 'special child', 227);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-02-2013', 'dd-mm-yyyy'), 22, 'Family in need of extra financial help', 82);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-03-2020', 'dd-mm-yyyy'), 2, 'both spouses work', 142);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-09-1993', 'dd-mm-yyyy'), 18, 'Family in need of extra financial help', 101);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('23-06-2013', 'dd-mm-yyyy'), 25, 'special child', 243);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-10-1995', 'dd-mm-yyyy'), 12, 'both spouses work', 73);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-11-2002', 'dd-mm-yyyy'), 1, 'both spouses work', 326);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-01-2015', 'dd-mm-yyyy'), 18, 'special child', 195);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-02-2016', 'dd-mm-yyyy'), 25, 'both spouses work', 79);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-05-2012', 'dd-mm-yyyy'), 12, 'special child', 280);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-08-1994', 'dd-mm-yyyy'), 12, 'one spouse works', 159);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-02-1996', 'dd-mm-yyyy'), 5, 'one spouse works', 386);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-04-1997', 'dd-mm-yyyy'), 23, 'one spouse works', 182);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-06-2020', 'dd-mm-yyyy'), 15, 'one spouse works', 382);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-02-2010', 'dd-mm-yyyy'), 14, 'special child', 47);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-07-1996', 'dd-mm-yyyy'), 3, 'one spouse works', 22);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-05-2017', 'dd-mm-yyyy'), 3, 'special child', 182);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-09-2004', 'dd-mm-yyyy'), 11, 'one spouse works', 362);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-09-2021', 'dd-mm-yyyy'), 11, 'special child', 314);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-03-2007', 'dd-mm-yyyy'), 14, 'special child', 88);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-03-2016', 'dd-mm-yyyy'), 13, 'Family in need of extra financial help', 368);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-03-1992', 'dd-mm-yyyy'), 21, 'both spouses work', 378);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-01-2009', 'dd-mm-yyyy'), 5, 'one spouse works', 283);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-04-2000', 'dd-mm-yyyy'), 20, 'Family in need of extra financial help', 285);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-10-1999', 'dd-mm-yyyy'), 14, 'Family in need of extra financial help', 362);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-03-1998', 'dd-mm-yyyy'), 21, 'Family in need of extra financial help', 242);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-06-2008', 'dd-mm-yyyy'), 6, 'special child', 144);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-07-2012', 'dd-mm-yyyy'), 14, 'one spouse works', 103);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-06-2021', 'dd-mm-yyyy'), 15, 'one spouse works', 196);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-06-2007', 'dd-mm-yyyy'), 2, 'both spouses work', 92);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-08-1990', 'dd-mm-yyyy'), 11, 'special child', 36);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-12-2022', 'dd-mm-yyyy'), 4, 'both spouses work', 296);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-01-1990', 'dd-mm-yyyy'), 25, 'one spouse works', 182);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-11-2022', 'dd-mm-yyyy'), 23, 'both spouses work', 266);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('23-12-2012', 'dd-mm-yyyy'), 7, 'special child', 317);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-06-2002', 'dd-mm-yyyy'), 17, 'special child', 358);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-12-1994', 'dd-mm-yyyy'), 10, 'Family in need of extra financial help', 391);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-08-2012', 'dd-mm-yyyy'), 12, 'special child', 383);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-12-1993', 'dd-mm-yyyy'), 23, 'special child', 240);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-03-1997', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 398);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-04-2011', 'dd-mm-yyyy'), 18, 'special child', 130);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-04-1993', 'dd-mm-yyyy'), 2, 'both spouses work', 10);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-07-2003', 'dd-mm-yyyy'), 19, 'Family in need of extra financial help', 231);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-08-2006', 'dd-mm-yyyy'), 3, 'one spouse works', 213);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-01-2018', 'dd-mm-yyyy'), 16, 'both spouses work', 211);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('28-09-2010', 'dd-mm-yyyy'), 7, 'both spouses work', 144);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-09-2002', 'dd-mm-yyyy'), 3, 'special child', 160);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-02-1998', 'dd-mm-yyyy'), 22, 'one spouse works', 366);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-10-2013', 'dd-mm-yyyy'), 10, 'both spouses work', 31);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-11-2017', 'dd-mm-yyyy'), 25, 'special child', 281);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-04-1996', 'dd-mm-yyyy'), 23, 'Family in need of extra financial help', 17);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-11-1990', 'dd-mm-yyyy'), 18, 'special child', 59);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-05-1996', 'dd-mm-yyyy'), 10, 'both spouses work', 244);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-04-1992', 'dd-mm-yyyy'), 24, 'both spouses work', 297);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-10-2013', 'dd-mm-yyyy'), 12, 'special child', 190);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-05-2002', 'dd-mm-yyyy'), 13, 'one spouse works', 207);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-01-2013', 'dd-mm-yyyy'), 3, 'special child', 237);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-10-2020', 'dd-mm-yyyy'), 14, 'both spouses work', 318);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-12-2020', 'dd-mm-yyyy'), 24, 'one spouse works', 137);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-05-1994', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 116);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-07-2003', 'dd-mm-yyyy'), 9, 'one spouse works', 8);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-05-2004', 'dd-mm-yyyy'), 7, 'both spouses work', 198);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-07-2003', 'dd-mm-yyyy'), 10, 'one spouse works', 259);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-07-1991', 'dd-mm-yyyy'), 10, 'Family in need of extra financial help', 157);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-12-2020', 'dd-mm-yyyy'), 12, 'Family in need of extra financial help', 34);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-03-2017', 'dd-mm-yyyy'), 20, 'one spouse works', 192);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-02-2017', 'dd-mm-yyyy'), 25, 'both spouses work', 182);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-08-1992', 'dd-mm-yyyy'), 15, 'special child', 38);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-07-2006', 'dd-mm-yyyy'), 14, 'one spouse works', 354);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-08-2012', 'dd-mm-yyyy'), 4, 'both spouses work', 32);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-09-1995', 'dd-mm-yyyy'), 6, 'special child', 225);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-09-2020', 'dd-mm-yyyy'), 10, 'special child', 285);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-11-2010', 'dd-mm-yyyy'), 13, 'one spouse works', 38);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-08-2009', 'dd-mm-yyyy'), 24, 'both spouses work', 2);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-02-2007', 'dd-mm-yyyy'), 3, 'special child', 77);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-03-2000', 'dd-mm-yyyy'), 4, 'one spouse works', 110);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-10-2002', 'dd-mm-yyyy'), 12, 'both spouses work', 264);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-01-2005', 'dd-mm-yyyy'), 16, 'both spouses work', 15);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-05-1993', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 276);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-07-2012', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 91);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-07-2021', 'dd-mm-yyyy'), 18, 'both spouses work', 195);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-11-2022', 'dd-mm-yyyy'), 14, 'both spouses work', 283);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-11-1991', 'dd-mm-yyyy'), 9, 'both spouses work', 78);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('19-01-2002', 'dd-mm-yyyy'), 13, 'both spouses work', 45);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-05-2020', 'dd-mm-yyyy'), 2, 'one spouse works', 51);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-08-1991', 'dd-mm-yyyy'), 3, 'one spouse works', 397);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-12-2012', 'dd-mm-yyyy'), 22, 'Family in need of extra financial help', 135);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-04-1997', 'dd-mm-yyyy'), 21, 'special child', 105);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-12-2018', 'dd-mm-yyyy'), 1, 'special child', 186);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-05-2000', 'dd-mm-yyyy'), 5, 'special child', 398);
commit;
prompt 300 records committed...
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-05-2020', 'dd-mm-yyyy'), 17, 'one spouse works', 370);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('28-07-2022', 'dd-mm-yyyy'), 1, 'one spouse works', 192);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-12-2014', 'dd-mm-yyyy'), 20, 'both spouses work', 160);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-02-2004', 'dd-mm-yyyy'), 1, 'special child', 256);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-06-2015', 'dd-mm-yyyy'), 3, 'special child', 253);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-04-2010', 'dd-mm-yyyy'), 15, 'Family in need of extra financial help', 291);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-09-1999', 'dd-mm-yyyy'), 20, 'both spouses work', 219);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-11-2010', 'dd-mm-yyyy'), 19, 'special child', 141);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('02-06-2017', 'dd-mm-yyyy'), 2, 'one spouse works', 272);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-01-2022', 'dd-mm-yyyy'), 22, 'special child', 327);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-01-2007', 'dd-mm-yyyy'), 13, 'Family in need of extra financial help', 365);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-05-1993', 'dd-mm-yyyy'), 5, 'both spouses work', 303);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('03-11-2009', 'dd-mm-yyyy'), 6, 'special child', 213);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-12-2022', 'dd-mm-yyyy'), 3, 'one spouse works', 41);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-02-1991', 'dd-mm-yyyy'), 23, 'Family in need of extra financial help', 236);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-07-2007', 'dd-mm-yyyy'), 8, 'one spouse works', 140);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-01-1990', 'dd-mm-yyyy'), 10, 'both spouses work', 232);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-01-2000', 'dd-mm-yyyy'), 20, 'both spouses work', 60);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-06-2013', 'dd-mm-yyyy'), 13, 'one spouse works', 175);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('21-01-2001', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 80);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-06-2018', 'dd-mm-yyyy'), 9, 'both spouses work', 331);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('12-06-2011', 'dd-mm-yyyy'), 19, 'Family in need of extra financial help', 180);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-11-2016', 'dd-mm-yyyy'), 16, 'special child', 309);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-03-2000', 'dd-mm-yyyy'), 5, 'special child', 252);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-01-1993', 'dd-mm-yyyy'), 12, 'one spouse works', 231);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-04-1995', 'dd-mm-yyyy'), 9, 'both spouses work', 32);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-11-2012', 'dd-mm-yyyy'), 14, 'both spouses work', 25);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-12-2021', 'dd-mm-yyyy'), 23, 'special child', 361);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-03-2008', 'dd-mm-yyyy'), 14, 'both spouses work', 51);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-02-1991', 'dd-mm-yyyy'), 17, 'one spouse works', 164);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('15-05-1993', 'dd-mm-yyyy'), 19, 'special child', 242);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-05-2020', 'dd-mm-yyyy'), 20, 'both spouses work', 365);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-07-1991', 'dd-mm-yyyy'), 5, 'both spouses work', 180);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-03-2017', 'dd-mm-yyyy'), 18, 'Family in need of extra financial help', 314);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-07-2014', 'dd-mm-yyyy'), 23, 'one spouse works', 87);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-04-2004', 'dd-mm-yyyy'), 25, 'special child', 349);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-12-1993', 'dd-mm-yyyy'), 22, 'one spouse works', 351);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-09-2016', 'dd-mm-yyyy'), 16, 'one spouse works', 81);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-07-2005', 'dd-mm-yyyy'), 11, 'special child', 370);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-07-2018', 'dd-mm-yyyy'), 22, 'both spouses work', 400);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-06-1998', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 321);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-11-2010', 'dd-mm-yyyy'), 22, 'Family in need of extra financial help', 8);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-02-2024', 'dd-mm-yyyy'), 7, 'special child', 260);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-03-2021', 'dd-mm-yyyy'), 5, 'special child', 81);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-11-2003', 'dd-mm-yyyy'), 6, 'one spouse works', 140);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-01-2010', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 249);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-10-1996', 'dd-mm-yyyy'), 9, 'one spouse works', 359);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-10-2001', 'dd-mm-yyyy'), 7, 'both spouses work', 308);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-10-2005', 'dd-mm-yyyy'), 8, 'both spouses work', 30);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('21-03-1995', 'dd-mm-yyyy'), 10, 'both spouses work', 50);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('09-12-2008', 'dd-mm-yyyy'), 18, 'Family in need of extra financial help', 177);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('31-03-1996', 'dd-mm-yyyy'), 6, 'special child', 23);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('01-01-2011', 'dd-mm-yyyy'), 15, 'both spouses work', 257);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-02-2001', 'dd-mm-yyyy'), 17, 'one spouse works', 18);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-02-2010', 'dd-mm-yyyy'), 16, 'one spouse works', 7);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-01-1999', 'dd-mm-yyyy'), 3, 'Family in need of extra financial help', 72);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-11-2018', 'dd-mm-yyyy'), 3, 'special child', 210);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-01-1994', 'dd-mm-yyyy'), 15, 'Family in need of extra financial help', 3);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('14-05-2001', 'dd-mm-yyyy'), 22, 'one spouse works', 400);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-04-2012', 'dd-mm-yyyy'), 2, 'special child', 274);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-07-2001', 'dd-mm-yyyy'), 22, 'Family in need of extra financial help', 273);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-03-1990', 'dd-mm-yyyy'), 22, 'Family in need of extra financial help', 169);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-09-2015', 'dd-mm-yyyy'), 21, 'Family in need of extra financial help', 41);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-06-1992', 'dd-mm-yyyy'), 16, 'Family in need of extra financial help', 105);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-03-2022', 'dd-mm-yyyy'), 6, 'Family in need of extra financial help', 99);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('06-08-2001', 'dd-mm-yyyy'), 14, 'special child', 66);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-09-1995', 'dd-mm-yyyy'), 19, 'both spouses work', 23);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-06-2002', 'dd-mm-yyyy'), 20, 'one spouse works', 163);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-08-2009', 'dd-mm-yyyy'), 23, 'both spouses work', 90);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-12-2016', 'dd-mm-yyyy'), 11, 'Family in need of extra financial help', 113);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-08-2014', 'dd-mm-yyyy'), 23, 'both spouses work', 122);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-10-2020', 'dd-mm-yyyy'), 9, 'one spouse works', 52);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-09-2013', 'dd-mm-yyyy'), 6, 'one spouse works', 64);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('18-10-2016', 'dd-mm-yyyy'), 25, 'both spouses work', 266);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('11-10-2016', 'dd-mm-yyyy'), 22, 'both spouses work', 273);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-08-1990', 'dd-mm-yyyy'), 21, 'both spouses work', 251);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('10-03-2014', 'dd-mm-yyyy'), 11, 'one spouse works', 341);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-08-2022', 'dd-mm-yyyy'), 19, 'one spouse works', 295);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('26-01-2004', 'dd-mm-yyyy'), 11, 'special child', 42);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('29-01-2007', 'dd-mm-yyyy'), 25, 'both spouses work', 390);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('16-08-2004', 'dd-mm-yyyy'), 17, 'one spouse works', 5);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('17-02-2009', 'dd-mm-yyyy'), 8, 'Family in need of extra financial help', 62);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-12-2016', 'dd-mm-yyyy'), 4, 'both spouses work', 105);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-08-2022', 'dd-mm-yyyy'), 18, 'one spouse works', 329);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-05-2007', 'dd-mm-yyyy'), 7, 'special child', 390);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('05-02-2022', 'dd-mm-yyyy'), 20, 'Family in need of extra financial help', 190);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-11-2011', 'dd-mm-yyyy'), 7, 'one spouse works', 122);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-09-1999', 'dd-mm-yyyy'), 11, 'one spouse works', 27);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('24-09-2019', 'dd-mm-yyyy'), 25, 'one spouse works', 151);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-09-2021', 'dd-mm-yyyy'), 18, 'both spouses work', 344);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-08-2013', 'dd-mm-yyyy'), 25, 'Family in need of extra financial help', 209);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('08-07-1994', 'dd-mm-yyyy'), 4, 'both spouses work', 221);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('25-10-1994', 'dd-mm-yyyy'), 2, 'Family in need of extra financial help', 335);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('22-08-2000', 'dd-mm-yyyy'), 9, 'Family in need of extra financial help', 302);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('07-04-1993', 'dd-mm-yyyy'), 19, 'Family in need of extra financial help', 16);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('20-03-2000', 'dd-mm-yyyy'), 19, 'special child', 301);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('04-01-1994', 'dd-mm-yyyy'), 15, 'one spouse works', 263);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('27-03-1999', 'dd-mm-yyyy'), 24, 'both spouses work', 234);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('13-05-2020', 'dd-mm-yyyy'), 7, 'special child', 203);
insert into BIRTH (baby_dob, num_of_children, comments, person_id)
values (to_date('30-03-1996', 'dd-mm-yyyy'), 3, 'both spouses work', 182);
commit;
prompt 400 records loaded
prompt Loading DONATION...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-12-2016', 'dd-mm-yyyy'), 45685, 1, 100000016);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-11-2021', 'dd-mm-yyyy'), 36049, 2, 100000135);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-11-2008', 'dd-mm-yyyy'), 70653, 3, 100000362);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-11-2010', 'dd-mm-yyyy'), 8241, 4, 100000325);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-07-1994', 'dd-mm-yyyy'), 56701, 5, 100000374);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-10-2018', 'dd-mm-yyyy'), 20913, 6, 100000387);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-02-1992', 'dd-mm-yyyy'), 16640, 7, 100000059);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-05-2021', 'dd-mm-yyyy'), 92596, 8, 100000328);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-07-1994', 'dd-mm-yyyy'), 44743, 9, 100000099);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-07-2007', 'dd-mm-yyyy'), 96188, 10, 100000308);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-04-2013', 'dd-mm-yyyy'), 43710, 11, 100000148);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-12-2013', 'dd-mm-yyyy'), 76763, 12, 100000285);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-07-1995', 'dd-mm-yyyy'), 28596, 13, 100000365);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-12-2001', 'dd-mm-yyyy'), 41364, 14, 100000345);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-02-1991', 'dd-mm-yyyy'), 17002, 15, 100000104);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-04-2017', 'dd-mm-yyyy'), 15397, 16, 100000080);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-07-2022', 'dd-mm-yyyy'), 70250, 17, 100000101);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-10-1999', 'dd-mm-yyyy'), 15401, 18, 100000034);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-03-2023', 'dd-mm-yyyy'), 1823, 19, 100000339);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-11-2005', 'dd-mm-yyyy'), 98510, 20, 100000111);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-03-1994', 'dd-mm-yyyy'), 46952, 21, 100000131);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-02-2021', 'dd-mm-yyyy'), 73784, 22, 100000251);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('06-02-2016', 'dd-mm-yyyy'), 30527, 23, 100000167);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-04-2012', 'dd-mm-yyyy'), 2918, 24, 100000028);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-03-1992', 'dd-mm-yyyy'), 46034, 25, 100000305);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-01-2020', 'dd-mm-yyyy'), 40026, 26, 100000168);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-05-1994', 'dd-mm-yyyy'), 17408, 27, 100000318);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-04-2001', 'dd-mm-yyyy'), 59966, 28, 100000237);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('22-11-1997', 'dd-mm-yyyy'), 18784, 29, 100000197);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-07-2022', 'dd-mm-yyyy'), 64077, 30, 100000356);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-09-1992', 'dd-mm-yyyy'), 22940, 31, 100000057);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-11-1998', 'dd-mm-yyyy'), 38987, 32, 100000067);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-03-2019', 'dd-mm-yyyy'), 6101, 33, 100000043);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-11-1991', 'dd-mm-yyyy'), 27291, 34, 100000399);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-05-1994', 'dd-mm-yyyy'), 94717, 35, 100000225);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-02-2017', 'dd-mm-yyyy'), 62348, 36, 100000218);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-03-1991', 'dd-mm-yyyy'), 75870, 37, 100000316);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-07-1999', 'dd-mm-yyyy'), 74496, 38, 100000268);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-11-2009', 'dd-mm-yyyy'), 36288, 39, 100000034);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-12-2011', 'dd-mm-yyyy'), 999, 40, 100000383);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-06-2012', 'dd-mm-yyyy'), 36046, 41, 100000005);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-03-2012', 'dd-mm-yyyy'), 83157, 42, 100000021);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-06-2017', 'dd-mm-yyyy'), 79498, 43, 100000355);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-01-2017', 'dd-mm-yyyy'), 18203, 44, 100000258);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-04-2007', 'dd-mm-yyyy'), 11434, 45, 100000186);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-12-1993', 'dd-mm-yyyy'), 520, 46, 100000078);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-12-2014', 'dd-mm-yyyy'), 64258, 47, 100000318);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-03-2018', 'dd-mm-yyyy'), 58939, 48, 100000246);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-03-2013', 'dd-mm-yyyy'), 99987, 49, 100000372);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-04-1996', 'dd-mm-yyyy'), 7595, 50, 100000027);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-09-1990', 'dd-mm-yyyy'), 49427, 51, 100000170);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-02-2005', 'dd-mm-yyyy'), 3591, 52, 100000257);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-09-1994', 'dd-mm-yyyy'), 46775, 53, 100000002);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-08-2021', 'dd-mm-yyyy'), 93190, 54, 100000022);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-09-2010', 'dd-mm-yyyy'), 8668, 55, 100000211);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-06-2023', 'dd-mm-yyyy'), 31678, 56, 100000320);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-01-2020', 'dd-mm-yyyy'), 98511, 57, 100000380);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-01-2005', 'dd-mm-yyyy'), 44820, 58, 100000129);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-07-2006', 'dd-mm-yyyy'), 86408, 59, 100000142);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-07-1991', 'dd-mm-yyyy'), 67066, 60, 100000392);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-05-1996', 'dd-mm-yyyy'), 30692, 61, 100000023);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-01-1992', 'dd-mm-yyyy'), 89073, 62, 100000263);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-06-1995', 'dd-mm-yyyy'), 16825, 63, 100000058);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-03-2018', 'dd-mm-yyyy'), 98188, 64, 100000105);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-07-2022', 'dd-mm-yyyy'), 57745, 65, 100000104);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-06-2014', 'dd-mm-yyyy'), 41354, 66, 100000301);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('31-12-2022', 'dd-mm-yyyy'), 30135, 67, 100000018);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-02-2004', 'dd-mm-yyyy'), 94852, 68, 100000014);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-01-2021', 'dd-mm-yyyy'), 68742, 69, 100000377);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-09-1999', 'dd-mm-yyyy'), 44788, 70, 100000393);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-06-1992', 'dd-mm-yyyy'), 949, 71, 100000020);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('22-04-2003', 'dd-mm-yyyy'), 66425, 72, 100000098);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-09-2002', 'dd-mm-yyyy'), 49944, 73, 100000065);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-11-2023', 'dd-mm-yyyy'), 8939, 74, 100000053);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-04-1997', 'dd-mm-yyyy'), 12130, 75, 100000314);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-04-2007', 'dd-mm-yyyy'), 31907, 76, 100000075);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-07-2019', 'dd-mm-yyyy'), 84805, 77, 100000278);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('31-03-2024', 'dd-mm-yyyy'), 78859, 78, 100000271);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-05-1994', 'dd-mm-yyyy'), 37970, 79, 100000083);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('06-04-1991', 'dd-mm-yyyy'), 97034, 80, 100000281);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-04-2007', 'dd-mm-yyyy'), 45396, 81, 100000269);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-12-2018', 'dd-mm-yyyy'), 94298, 82, 100000218);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-08-2003', 'dd-mm-yyyy'), 71951, 83, 100000228);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-07-2003', 'dd-mm-yyyy'), 59290, 84, 100000279);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-07-2001', 'dd-mm-yyyy'), 13284, 85, 100000276);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-08-2002', 'dd-mm-yyyy'), 19920, 86, 100000176);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-10-1996', 'dd-mm-yyyy'), 51290, 87, 100000082);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-11-2018', 'dd-mm-yyyy'), 84615, 88, 100000136);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-02-2016', 'dd-mm-yyyy'), 95247, 89, 100000266);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-09-1997', 'dd-mm-yyyy'), 55628, 90, 100000079);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-04-1992', 'dd-mm-yyyy'), 54356, 91, 100000385);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-06-2008', 'dd-mm-yyyy'), 28512, 92, 100000156);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-08-2016', 'dd-mm-yyyy'), 22508, 93, 100000330);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-10-1997', 'dd-mm-yyyy'), 60164, 94, 100000291);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-02-2016', 'dd-mm-yyyy'), 73218, 95, 100000159);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-05-1998', 'dd-mm-yyyy'), 94216, 96, 100000181);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-04-2018', 'dd-mm-yyyy'), 46042, 97, 100000235);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-01-1990', 'dd-mm-yyyy'), 44056, 98, 100000208);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-05-2015', 'dd-mm-yyyy'), 87158, 99, 100000001);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-10-2001', 'dd-mm-yyyy'), 50984, 100, 100000066);
commit;
prompt 100 records committed...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('06-07-1999', 'dd-mm-yyyy'), 70061, 101, 100000103);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('31-03-2017', 'dd-mm-yyyy'), 16434, 102, 100000309);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('31-07-2023', 'dd-mm-yyyy'), 89071, 103, 100000039);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-03-1992', 'dd-mm-yyyy'), 54792, 104, 100000235);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-09-2022', 'dd-mm-yyyy'), 84693, 105, 100000294);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-10-2001', 'dd-mm-yyyy'), 92617, 106, 100000240);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-02-2024', 'dd-mm-yyyy'), 41323, 107, 100000073);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-06-1992', 'dd-mm-yyyy'), 44766, 108, 100000123);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-05-1996', 'dd-mm-yyyy'), 88726, 109, 100000288);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-11-1996', 'dd-mm-yyyy'), 96056, 110, 100000366);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-07-2002', 'dd-mm-yyyy'), 62342, 111, 100000336);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-09-2016', 'dd-mm-yyyy'), 8378, 112, 100000007);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-03-2001', 'dd-mm-yyyy'), 15952, 113, 100000034);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-02-2021', 'dd-mm-yyyy'), 11087, 114, 100000364);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-08-1995', 'dd-mm-yyyy'), 71259, 115, 100000202);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-05-1991', 'dd-mm-yyyy'), 36796, 116, 100000245);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-07-2014', 'dd-mm-yyyy'), 3856, 117, 100000154);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-04-2019', 'dd-mm-yyyy'), 70520, 118, 100000098);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 41040, 119, 100000281);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-08-1994', 'dd-mm-yyyy'), 15842, 120, 100000006);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-11-2005', 'dd-mm-yyyy'), 69622, 121, 100000282);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-12-2018', 'dd-mm-yyyy'), 86267, 122, 100000145);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-06-2010', 'dd-mm-yyyy'), 37458, 123, 100000225);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-08-1994', 'dd-mm-yyyy'), 21825, 124, 100000130);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-02-2012', 'dd-mm-yyyy'), 81658, 125, 100000118);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-09-2009', 'dd-mm-yyyy'), 53801, 126, 100000221);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-12-1998', 'dd-mm-yyyy'), 45499, 127, 100000275);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-02-1993', 'dd-mm-yyyy'), 18939, 128, 100000383);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-10-2013', 'dd-mm-yyyy'), 40663, 129, 100000283);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-01-2011', 'dd-mm-yyyy'), 90189, 130, 100000266);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-09-2004', 'dd-mm-yyyy'), 9316, 131, 100000288);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-06-2012', 'dd-mm-yyyy'), 77341, 132, 100000359);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-03-1993', 'dd-mm-yyyy'), 9986, 133, 100000145);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-12-2009', 'dd-mm-yyyy'), 88127, 134, 100000241);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-04-1998', 'dd-mm-yyyy'), 37354, 135, 100000070);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-01-1991', 'dd-mm-yyyy'), 58258, 136, 100000092);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-07-2014', 'dd-mm-yyyy'), 58940, 137, 100000314);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-11-2010', 'dd-mm-yyyy'), 92792, 138, 100000000);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-08-2023', 'dd-mm-yyyy'), 49921, 139, 100000138);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-09-2004', 'dd-mm-yyyy'), 35182, 140, 100000219);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-03-2001', 'dd-mm-yyyy'), 8378, 141, 100000369);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-05-1999', 'dd-mm-yyyy'), 35685, 142, 100000284);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-09-2009', 'dd-mm-yyyy'), 69582, 143, 100000170);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-03-2001', 'dd-mm-yyyy'), 47858, 144, 100000377);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-01-1996', 'dd-mm-yyyy'), 91470, 145, 100000115);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-06-2010', 'dd-mm-yyyy'), 82019, 146, 100000003);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-02-2013', 'dd-mm-yyyy'), 81999, 147, 100000034);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-04-2000', 'dd-mm-yyyy'), 8556, 148, 100000255);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-03-2012', 'dd-mm-yyyy'), 71185, 149, 100000338);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('31-12-2017', 'dd-mm-yyyy'), 75981, 150, 100000254);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-03-2022', 'dd-mm-yyyy'), 18223, 151, 100000064);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('31-08-1996', 'dd-mm-yyyy'), 5708, 152, 100000192);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-06-2002', 'dd-mm-yyyy'), 75305, 153, 100000351);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-04-2023', 'dd-mm-yyyy'), 89676, 154, 100000035);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-06-2008', 'dd-mm-yyyy'), 34847, 155, 100000093);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-01-2020', 'dd-mm-yyyy'), 76139, 156, 100000347);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-07-2001', 'dd-mm-yyyy'), 41130, 157, 100000094);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-02-2009', 'dd-mm-yyyy'), 10630, 158, 100000314);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-01-1992', 'dd-mm-yyyy'), 94556, 159, 100000077);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-12-2019', 'dd-mm-yyyy'), 40609, 160, 100000330);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-05-2021', 'dd-mm-yyyy'), 81620, 161, 100000298);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-08-2017', 'dd-mm-yyyy'), 23816, 162, 100000003);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-09-1998', 'dd-mm-yyyy'), 72422, 163, 100000053);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('22-12-2010', 'dd-mm-yyyy'), 22374, 164, 100000108);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-05-2013', 'dd-mm-yyyy'), 13797, 165, 100000262);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-08-1998', 'dd-mm-yyyy'), 72907, 166, 100000295);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-03-2001', 'dd-mm-yyyy'), 39855, 167, 100000047);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-05-1993', 'dd-mm-yyyy'), 95613, 168, 100000292);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-11-2010', 'dd-mm-yyyy'), 11526, 169, 100000152);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-10-2015', 'dd-mm-yyyy'), 6890, 170, 100000330);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-10-2016', 'dd-mm-yyyy'), 3495, 171, 100000269);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-12-1996', 'dd-mm-yyyy'), 33070, 172, 100000011);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-08-1990', 'dd-mm-yyyy'), 74015, 173, 100000380);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-10-1992', 'dd-mm-yyyy'), 45218, 174, 100000026);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-05-2021', 'dd-mm-yyyy'), 99606, 175, 100000034);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-09-2021', 'dd-mm-yyyy'), 47343, 176, 100000275);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-12-1997', 'dd-mm-yyyy'), 22406, 177, 100000365);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-08-2014', 'dd-mm-yyyy'), 20818, 178, 100000053);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-04-2008', 'dd-mm-yyyy'), 71694, 179, 100000326);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-01-2000', 'dd-mm-yyyy'), 48583, 180, 100000042);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-02-2021', 'dd-mm-yyyy'), 63480, 181, 100000241);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-10-2007', 'dd-mm-yyyy'), 81143, 182, 100000192);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-04-2007', 'dd-mm-yyyy'), 80898, 183, 100000246);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-09-2017', 'dd-mm-yyyy'), 61301, 184, 100000284);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-10-2006', 'dd-mm-yyyy'), 86357, 185, 100000004);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-05-2002', 'dd-mm-yyyy'), 57818, 186, 100000238);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-07-1994', 'dd-mm-yyyy'), 28488, 187, 100000078);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-10-2006', 'dd-mm-yyyy'), 72298, 188, 100000272);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-08-1999', 'dd-mm-yyyy'), 78888, 189, 100000270);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-01-2023', 'dd-mm-yyyy'), 35200, 190, 100000114);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-09-2009', 'dd-mm-yyyy'), 89379, 191, 100000192);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-09-1991', 'dd-mm-yyyy'), 4363, 192, 100000370);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-07-2023', 'dd-mm-yyyy'), 79364, 193, 100000137);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-04-2004', 'dd-mm-yyyy'), 77678, 194, 100000329);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-04-2014', 'dd-mm-yyyy'), 85562, 195, 100000323);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-10-2013', 'dd-mm-yyyy'), 35802, 196, 100000161);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-09-2015', 'dd-mm-yyyy'), 2287, 197, 100000119);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-10-1997', 'dd-mm-yyyy'), 97564, 198, 100000061);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-05-1997', 'dd-mm-yyyy'), 48684, 199, 100000262);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-04-2008', 'dd-mm-yyyy'), 12386, 200, 100000395);
commit;
prompt 200 records committed...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-09-1997', 'dd-mm-yyyy'), 1585, 201, 100000243);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('22-03-2018', 'dd-mm-yyyy'), 71165, 202, 100000212);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('31-03-2016', 'dd-mm-yyyy'), 50253, 203, 100000283);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-04-2015', 'dd-mm-yyyy'), 19955, 204, 100000181);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-08-2020', 'dd-mm-yyyy'), 61652, 205, 100000288);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-06-2018', 'dd-mm-yyyy'), 36425, 206, 100000077);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-11-2008', 'dd-mm-yyyy'), 330, 207, 100000133);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-01-2016', 'dd-mm-yyyy'), 15089, 208, 100000117);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-09-2017', 'dd-mm-yyyy'), 29060, 209, 100000046);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-03-2012', 'dd-mm-yyyy'), 29785, 210, 100000015);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-03-2011', 'dd-mm-yyyy'), 40650, 211, 100000332);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-01-2002', 'dd-mm-yyyy'), 32647, 212, 100000169);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-07-2012', 'dd-mm-yyyy'), 24070, 213, 100000381);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-10-1991', 'dd-mm-yyyy'), 44995, 214, 100000140);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-05-2013', 'dd-mm-yyyy'), 85177, 215, 100000395);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-04-1997', 'dd-mm-yyyy'), 16438, 216, 100000007);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-03-2007', 'dd-mm-yyyy'), 97132, 217, 100000379);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-06-2019', 'dd-mm-yyyy'), 21682, 218, 100000025);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-03-2003', 'dd-mm-yyyy'), 83073, 219, 100000327);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-06-2004', 'dd-mm-yyyy'), 42558, 220, 100000001);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-07-2017', 'dd-mm-yyyy'), 18554, 221, 100000366);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('06-11-2020', 'dd-mm-yyyy'), 96253, 222, 100000045);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-09-1997', 'dd-mm-yyyy'), 6663, 223, 100000203);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-07-1991', 'dd-mm-yyyy'), 31626, 224, 100000386);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-11-2007', 'dd-mm-yyyy'), 14591, 225, 100000264);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-12-2019', 'dd-mm-yyyy'), 73984, 226, 100000334);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-11-2008', 'dd-mm-yyyy'), 90409, 227, 100000381);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-09-2009', 'dd-mm-yyyy'), 69102, 228, 100000197);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-02-2004', 'dd-mm-yyyy'), 91368, 229, 100000084);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-07-2016', 'dd-mm-yyyy'), 3235, 230, 100000208);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-09-2003', 'dd-mm-yyyy'), 73709, 231, 100000163);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-10-1991', 'dd-mm-yyyy'), 80243, 232, 100000088);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-07-2017', 'dd-mm-yyyy'), 8641, 233, 100000225);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-06-2022', 'dd-mm-yyyy'), 61387, 234, 100000204);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-05-1992', 'dd-mm-yyyy'), 21525, 235, 100000054);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-04-1992', 'dd-mm-yyyy'), 28872, 236, 100000039);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-09-2005', 'dd-mm-yyyy'), 92275, 237, 100000166);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-02-1991', 'dd-mm-yyyy'), 84975, 238, 100000201);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-01-2013', 'dd-mm-yyyy'), 27078, 239, 100000030);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-07-2023', 'dd-mm-yyyy'), 35837, 240, 100000247);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-04-2002', 'dd-mm-yyyy'), 2374, 241, 100000224);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-10-2001', 'dd-mm-yyyy'), 592, 242, 100000369);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-04-1992', 'dd-mm-yyyy'), 21952, 243, 100000365);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-04-2024', 'dd-mm-yyyy'), 37881, 244, 100000029);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-05-2005', 'dd-mm-yyyy'), 91502, 245, 100000379);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-10-2001', 'dd-mm-yyyy'), 40474, 246, 100000210);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-04-2023', 'dd-mm-yyyy'), 44829, 247, 100000036);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('06-09-1993', 'dd-mm-yyyy'), 31179, 248, 100000013);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-03-2014', 'dd-mm-yyyy'), 22376, 249, 100000219);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-10-2002', 'dd-mm-yyyy'), 51278, 250, 100000247);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-03-1992', 'dd-mm-yyyy'), 46327, 251, 100000239);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-11-2017', 'dd-mm-yyyy'), 70685, 252, 100000261);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-10-1993', 'dd-mm-yyyy'), 28724, 253, 100000206);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-10-2017', 'dd-mm-yyyy'), 26733, 254, 100000212);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-10-2005', 'dd-mm-yyyy'), 30711, 255, 100000251);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-11-1997', 'dd-mm-yyyy'), 20607, 256, 100000189);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-01-2001', 'dd-mm-yyyy'), 38141, 257, 100000149);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-08-1995', 'dd-mm-yyyy'), 23820, 258, 100000090);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('29-08-2017', 'dd-mm-yyyy'), 61510, 259, 100000169);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-10-1994', 'dd-mm-yyyy'), 75309, 260, 100000325);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-07-1995', 'dd-mm-yyyy'), 92569, 261, 100000036);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-03-2023', 'dd-mm-yyyy'), 44710, 262, 100000086);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-08-2020', 'dd-mm-yyyy'), 82648, 263, 100000354);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-07-2018', 'dd-mm-yyyy'), 97882, 264, 100000392);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-03-1997', 'dd-mm-yyyy'), 32511, 265, 100000147);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-01-2001', 'dd-mm-yyyy'), 92056, 266, 100000051);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-09-2010', 'dd-mm-yyyy'), 31176, 267, 100000310);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-06-2022', 'dd-mm-yyyy'), 44468, 268, 100000327);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-05-1994', 'dd-mm-yyyy'), 32435, 269, 100000190);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-03-2009', 'dd-mm-yyyy'), 30836, 270, 100000245);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-06-2006', 'dd-mm-yyyy'), 43379, 271, 100000240);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-02-2013', 'dd-mm-yyyy'), 71016, 272, 100000145);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-08-2006', 'dd-mm-yyyy'), 3431, 273, 100000172);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-11-2001', 'dd-mm-yyyy'), 13788, 274, 100000179);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-01-2000', 'dd-mm-yyyy'), 81464, 275, 100000194);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-04-2023', 'dd-mm-yyyy'), 43078, 276, 100000248);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-09-1997', 'dd-mm-yyyy'), 99937, 277, 100000168);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-09-1994', 'dd-mm-yyyy'), 54667, 278, 100000392);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-04-2003', 'dd-mm-yyyy'), 31376, 279, 100000253);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-02-2012', 'dd-mm-yyyy'), 92316, 280, 100000290);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-06-1991', 'dd-mm-yyyy'), 96828, 281, 100000272);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-01-2021', 'dd-mm-yyyy'), 55840, 282, 100000137);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-05-2014', 'dd-mm-yyyy'), 48501, 283, 100000073);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-04-2007', 'dd-mm-yyyy'), 92156, 284, 100000010);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-08-2000', 'dd-mm-yyyy'), 23558, 285, 100000123);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-10-2005', 'dd-mm-yyyy'), 23281, 286, 100000002);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-05-2015', 'dd-mm-yyyy'), 53926, 287, 100000231);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-10-2021', 'dd-mm-yyyy'), 45903, 288, 100000322);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-04-2000', 'dd-mm-yyyy'), 71392, 289, 100000267);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-01-2020', 'dd-mm-yyyy'), 27245, 290, 100000251);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-02-2016', 'dd-mm-yyyy'), 6195, 291, 100000283);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-02-2006', 'dd-mm-yyyy'), 9023, 292, 100000286);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-08-2020', 'dd-mm-yyyy'), 12536, 293, 100000157);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-10-2014', 'dd-mm-yyyy'), 91221, 294, 100000128);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-04-1997', 'dd-mm-yyyy'), 1076, 295, 100000193);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-11-2006', 'dd-mm-yyyy'), 90340, 296, 100000058);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-05-2023', 'dd-mm-yyyy'), 93305, 297, 100000059);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-03-1998', 'dd-mm-yyyy'), 16990, 298, 100000275);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-12-1990', 'dd-mm-yyyy'), 75998, 299, 100000238);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-12-2017', 'dd-mm-yyyy'), 3001, 300, 100000021);
commit;
prompt 300 records committed...
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-10-1996', 'dd-mm-yyyy'), 93653, 301, 100000246);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-01-2010', 'dd-mm-yyyy'), 77673, 302, 100000136);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-07-1996', 'dd-mm-yyyy'), 20463, 303, 100000240);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-02-2021', 'dd-mm-yyyy'), 58639, 304, 100000020);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-09-2021', 'dd-mm-yyyy'), 63660, 305, 100000169);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-05-2016', 'dd-mm-yyyy'), 39091, 306, 100000287);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-01-2023', 'dd-mm-yyyy'), 18129, 307, 100000244);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-11-1996', 'dd-mm-yyyy'), 28591, 308, 100000282);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-12-2000', 'dd-mm-yyyy'), 78655, 309, 100000382);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-05-1990', 'dd-mm-yyyy'), 88707, 310, 100000160);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-02-2006', 'dd-mm-yyyy'), 74197, 311, 100000082);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-05-2004', 'dd-mm-yyyy'), 13377, 312, 100000153);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-08-1993', 'dd-mm-yyyy'), 76016, 313, 100000096);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-10-2007', 'dd-mm-yyyy'), 83525, 314, 100000109);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-04-2011', 'dd-mm-yyyy'), 2879, 315, 100000143);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-09-1991', 'dd-mm-yyyy'), 93958, 316, 100000037);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-07-2003', 'dd-mm-yyyy'), 62384, 317, 100000153);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-09-2022', 'dd-mm-yyyy'), 46839, 318, 100000083);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-06-2008', 'dd-mm-yyyy'), 76418, 319, 100000195);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('30-01-2004', 'dd-mm-yyyy'), 58794, 320, 100000061);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('06-08-2007', 'dd-mm-yyyy'), 6065, 321, 100000101);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-02-1995', 'dd-mm-yyyy'), 73492, 322, 100000051);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-06-2023', 'dd-mm-yyyy'), 64475, 323, 100000377);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-05-2019', 'dd-mm-yyyy'), 26205, 324, 100000254);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-02-2020', 'dd-mm-yyyy'), 53033, 325, 100000137);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-12-2016', 'dd-mm-yyyy'), 26050, 326, 100000247);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-02-2004', 'dd-mm-yyyy'), 12124, 327, 100000198);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-11-1993', 'dd-mm-yyyy'), 9287, 328, 100000368);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-12-1997', 'dd-mm-yyyy'), 31622, 329, 100000021);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-11-1991', 'dd-mm-yyyy'), 28735, 330, 100000181);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-11-2016', 'dd-mm-yyyy'), 35714, 331, 100000280);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-03-2018', 'dd-mm-yyyy'), 92040, 332, 100000325);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('26-07-2019', 'dd-mm-yyyy'), 33214, 333, 100000324);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-03-2011', 'dd-mm-yyyy'), 93551, 334, 100000282);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-05-1991', 'dd-mm-yyyy'), 37269, 335, 100000059);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-01-2013', 'dd-mm-yyyy'), 13205, 336, 100000011);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-12-2008', 'dd-mm-yyyy'), 84925, 337, 100000300);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-04-2000', 'dd-mm-yyyy'), 35296, 338, 100000120);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-07-1990', 'dd-mm-yyyy'), 63272, 339, 100000396);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-07-2018', 'dd-mm-yyyy'), 76237, 340, 100000021);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-09-2005', 'dd-mm-yyyy'), 52253, 341, 100000364);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-10-2002', 'dd-mm-yyyy'), 57877, 342, 100000066);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-02-1999', 'dd-mm-yyyy'), 60622, 343, 100000119);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-10-2006', 'dd-mm-yyyy'), 34029, 344, 100000251);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-11-1993', 'dd-mm-yyyy'), 35465, 345, 100000051);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-07-2002', 'dd-mm-yyyy'), 21712, 346, 100000158);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-08-2019', 'dd-mm-yyyy'), 5373, 347, 100000019);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-03-2014', 'dd-mm-yyyy'), 14692, 348, 100000164);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-06-1998', 'dd-mm-yyyy'), 49997, 349, 100000042);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('21-04-2014', 'dd-mm-yyyy'), 22443, 350, 100000004);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-10-2001', 'dd-mm-yyyy'), 6200, 351, 100000352);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('27-06-2021', 'dd-mm-yyyy'), 87049, 352, 100000210);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('08-05-1995', 'dd-mm-yyyy'), 3928, 353, 100000140);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-11-2014', 'dd-mm-yyyy'), 40963, 354, 100000106);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-02-1999', 'dd-mm-yyyy'), 9534, 355, 100000359);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('13-12-2016', 'dd-mm-yyyy'), 84574, 356, 100000030);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('06-02-2017', 'dd-mm-yyyy'), 11539, 357, 100000372);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-10-2014', 'dd-mm-yyyy'), 46233, 358, 100000238);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('14-05-1991', 'dd-mm-yyyy'), 56976, 359, 100000042);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('09-11-1997', 'dd-mm-yyyy'), 32733, 360, 100000336);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-05-2017', 'dd-mm-yyyy'), 8058, 361, 100000099);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-03-1997', 'dd-mm-yyyy'), 59159, 362, 100000255);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('25-02-1992', 'dd-mm-yyyy'), 72575, 363, 100000134);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('15-05-2018', 'dd-mm-yyyy'), 51162, 364, 100000275);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-08-1996', 'dd-mm-yyyy'), 53272, 365, 100000122);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-03-2007', 'dd-mm-yyyy'), 10531, 366, 100000374);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('19-06-1999', 'dd-mm-yyyy'), 80638, 367, 100000283);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-01-2022', 'dd-mm-yyyy'), 25701, 368, 100000191);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-05-2003', 'dd-mm-yyyy'), 39339, 369, 100000058);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-04-1997', 'dd-mm-yyyy'), 50171, 370, 100000083);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('28-08-2012', 'dd-mm-yyyy'), 81395, 371, 100000387);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-11-1996', 'dd-mm-yyyy'), 69590, 372, 100000182);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-11-2015', 'dd-mm-yyyy'), 40646, 373, 100000164);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-08-2005', 'dd-mm-yyyy'), 91307, 374, 100000147);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-09-2001', 'dd-mm-yyyy'), 35638, 375, 100000113);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('16-06-2002', 'dd-mm-yyyy'), 20871, 376, 100000163);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('17-03-2022', 'dd-mm-yyyy'), 70989, 377, 100000106);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-03-2013', 'dd-mm-yyyy'), 96509, 378, 100000262);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-03-1999', 'dd-mm-yyyy'), 34825, 379, 100000127);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('02-05-2004', 'dd-mm-yyyy'), 44267, 380, 100000042);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('12-02-2012', 'dd-mm-yyyy'), 36358, 381, 100000038);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-06-2006', 'dd-mm-yyyy'), 39031, 382, 100000197);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-12-2012', 'dd-mm-yyyy'), 58795, 383, 100000267);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('07-07-2011', 'dd-mm-yyyy'), 35119, 384, 100000308);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-09-2009', 'dd-mm-yyyy'), 97186, 385, 100000278);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-03-2021', 'dd-mm-yyyy'), 96841, 386, 100000012);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-10-2014', 'dd-mm-yyyy'), 46944, 387, 100000395);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('03-09-2022', 'dd-mm-yyyy'), 43511, 388, 100000251);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-08-2013', 'dd-mm-yyyy'), 80454, 389, 100000362);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-01-2022', 'dd-mm-yyyy'), 63147, 390, 100000176);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('20-12-1995', 'dd-mm-yyyy'), 34670, 391, 100000152);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('23-03-2018', 'dd-mm-yyyy'), 65522, 392, 100000307);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-06-1993', 'dd-mm-yyyy'), 3699, 393, 100000363);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('11-07-1997', 'dd-mm-yyyy'), 79151, 394, 100000165);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('18-10-2018', 'dd-mm-yyyy'), 31963, 395, 100000354);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('04-02-2003', 'dd-mm-yyyy'), 71061, 396, 100000339);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('24-08-1995', 'dd-mm-yyyy'), 1647, 397, 100000244);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('01-10-2003', 'dd-mm-yyyy'), 24476, 398, 100000183);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('10-07-1995', 'dd-mm-yyyy'), 45316, 399, 100000055);
insert into DONATION (date_of_donation, donation_amount, donation_id, person_id)
values (to_date('05-06-2010', 'dd-mm-yyyy'), 63798, 400, 100000161);
commit;
prompt 400 records loaded
prompt Loading COMMUNITY...
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (1, 11239, 'Beit Knesset', '965244152', 305);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (2, 44137, 'Kehila', '456525759', 231);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (3, 21816, 'Kehila', '963412442', 236);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (4, 17896, 'Kehila', '253141747', 204);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (5, 27826, 'Beit Knesset', '922276846', 109);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (6, 38625, 'Neighborhood', '785653867', 83);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (7, 26945, 'Kehila', '195317772', 143);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (8, 23104, 'Beit Knesset', '537976269', 319);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (9, 19227, 'Kehila', '574836496', 54);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (10, 29605, 'Neighborhood', '973885567', 214);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (11, 21411, 'Beit Knesset', '619313235', 388);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (12, 43897, 'Neighborhood', '229597425', 211);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (13, 14181, 'Kehila', '189895386', 380);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (14, 27772, 'Kehila', '341112976', 316);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (15, 31937, 'Beit Knesset', '211622116', 330);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (16, 30053, 'Neighborhood', '162266633', 243);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (17, 35055, 'Neighborhood', '344732141', 119);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (18, 40113, 'Neighborhood', '322516898', 80);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (19, 44658, 'Neighborhood', '785737525', 233);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (20, 23889, 'Beit Knesset', '977937848', 290);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (21, 19878, 'Kehila', '365234739', 123);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (22, 22401, 'Neighborhood', '544567934', 221);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (23, 37624, 'Beit Knesset', '532437445', 289);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (24, 32763, 'Beit Knesset', '776417794', 362);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (25, 14845, 'Kehila', '761355341', 84);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (26, 31701, 'Beit Knesset', '926553273', 303);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (27, 13298, 'Kehila', '637844435', 48);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (28, 21568, 'Kehila', '614854337', 34);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (29, 46815, 'Kehila', '229555123', 363);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (30, 18864, 'Kehila', '359292139', 163);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (31, 31061, 'Kehila', '189698351', 237);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (32, 25242, 'Kehila', '999657777', 263);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (33, 35810, 'Neighborhood', '544775748', 212);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (34, 21033, 'Beit Knesset', '887785814', 138);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (35, 39703, 'Kehila', '648789387', 191);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (36, 21257, 'Kehila', '714584322', 19);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (37, 27517, 'Neighborhood', '874462168', 2);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (38, 34140, 'Beit Knesset', '545592465', 87);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (39, 29930, 'Beit Knesset', '213743497', 74);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (40, 42127, 'Neighborhood', '727652133', 110);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (41, 25786, 'Neighborhood', '613592796', 246);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (42, 45402, 'Kehila', '566638657', 19);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (43, 26863, 'Neighborhood', '487712667', 303);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (44, 47902, 'Beit Knesset', '159885832', 202);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (45, 25133, 'Kehila', '133622296', 226);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (46, 25829, 'Beit Knesset', '962467568', 318);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (47, 42536, 'Neighborhood', '474675717', 179);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (48, 38673, 'Neighborhood', '255282961', 250);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (49, 43237, 'Kehila', '946161439', 214);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (50, 42720, 'Neighborhood', '237969936', 365);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (51, 28397, 'Beit Knesset', '826963569', 105);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (52, 47072, 'Beit Knesset', '833889732', 319);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (53, 33439, 'Beit Knesset', '146997712', 101);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (54, 12161, 'Kehila', '292997629', 366);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (55, 27809, 'Neighborhood', '321193512', 215);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (56, 10766, 'Neighborhood', '214937972', 11);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (57, 37247, 'Beit Knesset', '916162655', 22);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (58, 11528, 'Neighborhood', '416828483', 375);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (59, 48549, 'Kehila', '643953132', 198);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (60, 44966, 'Kehila', '611167961', 290);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (61, 16832, 'Beit Knesset', '877247765', 176);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (62, 31988, 'Beit Knesset', '771644981', 119);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (63, 15305, 'Neighborhood', '587921414', 324);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (64, 34916, 'Beit Knesset', '783294273', 104);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (65, 47530, 'Beit Knesset', '691992251', 258);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (66, 10992, 'Beit Knesset', '484525677', 27);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (67, 42186, 'Beit Knesset', '151194533', 68);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (68, 28403, 'Neighborhood', '668396313', 214);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (69, 30338, 'Kehila', '218212937', 79);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (70, 24786, 'Neighborhood', '268323973', 248);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (71, 25206, 'Neighborhood', '979394176', 332);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (72, 28254, 'Beit Knesset', '351185473', 218);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (73, 44422, 'Beit Knesset', '731555424', 192);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (74, 40902, 'Beit Knesset', '282832162', 83);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (75, 34801, 'Beit Knesset', '198893763', 78);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (76, 24831, 'Kehila', '952688823', 373);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (77, 19606, 'Neighborhood', '234999151', 120);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (78, 30660, 'Neighborhood', '784129935', 205);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (79, 28316, 'Kehila', '633225618', 143);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (80, 28540, 'Neighborhood', '621731716', 225);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (81, 48885, 'Kehila', '557511597', 175);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (82, 41672, 'Beit Knesset', '875995534', 85);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (83, 42513, 'Beit Knesset', '298841563', 274);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (84, 22321, 'Kehila', '641547282', 30);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (85, 20911, 'Kehila', '984668249', 90);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (86, 30335, 'Beit Knesset', '512463326', 221);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (87, 26066, 'Kehila', '695751423', 145);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (88, 34157, 'Beit Knesset', '165987898', 179);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (89, 12505, 'Neighborhood', '128822432', 39);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (90, 14341, 'Neighborhood', '261922552', 357);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (91, 32065, 'Kehila', '759924317', 385);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (92, 49569, 'Neighborhood', '873889675', 228);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (93, 41152, 'Kehila', '813286628', 63);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (94, 25166, 'Kehila', '749174483', 111);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (95, 10512, 'Neighborhood', '379233983', 5);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (96, 44116, 'Neighborhood', '256588994', 315);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (97, 17497, 'Beit Knesset', '117346849', 297);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (98, 20576, 'Neighborhood', '119759791', 3);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (99, 40826, 'Beit Knesset', '426685397', 219);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (100, 15896, 'Beit Knesset', '126452911', 192);
commit;
prompt 100 records committed...
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (101, 17852, 'Kehila', '355182174', 393);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (102, 37129, 'Beit Knesset', '344334782', 72);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (103, 44335, 'Beit Knesset', '946895284', 272);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (104, 18048, 'Kehila', '979717736', 247);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (105, 36695, 'Beit Knesset', '724926357', 144);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (106, 22667, 'Kehila', '214441879', 109);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (107, 16787, 'Kehila', '946926442', 65);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (108, 31249, 'Neighborhood', '395984368', 129);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (109, 19163, 'Neighborhood', '932431374', 114);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (110, 28826, 'Neighborhood', '298368619', 278);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (111, 20840, 'Beit Knesset', '448178362', 377);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (112, 36214, 'Beit Knesset', '982242685', 173);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (113, 13561, 'Kehila', '868187231', 256);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (114, 43529, 'Kehila', '129167579', 142);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (115, 18568, 'Beit Knesset', '235749646', 295);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (116, 46199, 'Kehila', '879177389', 26);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (117, 43858, 'Neighborhood', '428629587', 143);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (118, 23486, 'Neighborhood', '176164637', 89);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (119, 23958, 'Neighborhood', '195387555', 232);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (120, 19496, 'Beit Knesset', '955985192', 70);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (121, 22184, 'Neighborhood', '293553266', 389);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (122, 46700, 'Kehila', '335696436', 352);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (123, 15411, 'Neighborhood', '252118279', 161);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (124, 11941, 'Beit Knesset', '571887449', 51);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (125, 21336, 'Kehila', '756285935', 77);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (126, 24961, 'Beit Knesset', '754719939', 42);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (127, 48245, 'Beit Knesset', '991241662', 231);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (128, 49406, 'Beit Knesset', '141942667', 99);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (129, 27274, 'Kehila', '867746414', 182);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (130, 16347, 'Kehila', '979153331', 167);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (131, 47186, 'Beit Knesset', '151832682', 197);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (132, 40299, 'Kehila', '535718495', 156);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (133, 11622, 'Beit Knesset', '672612641', 197);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (134, 17728, 'Kehila', '573525318', 259);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (135, 38880, 'Kehila', '185232515', 46);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (136, 48074, 'Neighborhood', '897241848', 200);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (137, 44169, 'Kehila', '654941393', 356);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (138, 37260, 'Kehila', '658717827', 199);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (139, 24384, 'Kehila', '359443734', 218);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (140, 43717, 'Neighborhood', '266658462', 71);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (141, 45367, 'Neighborhood', '757516136', 261);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (142, 46891, 'Beit Knesset', '124393184', 42);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (143, 11670, 'Neighborhood', '582149344', 234);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (144, 18259, 'Kehila', '361137233', 95);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (145, 18830, 'Kehila', '165748146', 309);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (146, 14853, 'Neighborhood', '287229822', 240);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (147, 48125, 'Neighborhood', '146829718', 119);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (148, 15267, 'Beit Knesset', '618356314', 109);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (149, 43842, 'Beit Knesset', '877543876', 312);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (150, 18175, 'Kehila', '513289856', 272);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (151, 13046, 'Beit Knesset', '423636574', 231);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (152, 43348, 'Neighborhood', '815455427', 87);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (153, 27845, 'Neighborhood', '222322966', 125);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (154, 35168, 'Kehila', '854515976', 64);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (155, 10150, 'Beit Knesset', '267675751', 279);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (156, 28646, 'Neighborhood', '181437545', 364);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (157, 18948, 'Neighborhood', '846595248', 272);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (158, 17934, 'Neighborhood', '326629934', 215);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (159, 40064, 'Beit Knesset', '431678897', 356);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (160, 47347, 'Beit Knesset', '251285827', 260);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (161, 38425, 'Beit Knesset', '865441748', 167);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (162, 44868, 'Beit Knesset', '361248147', 224);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (163, 32829, 'Kehila', '361985534', 356);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (164, 38174, 'Kehila', '281451757', 310);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (165, 33211, 'Kehila', '888336881', 344);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (166, 33147, 'Kehila', '475384164', 315);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (167, 40403, 'Neighborhood', '967139394', 207);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (168, 34891, 'Neighborhood', '547615335', 81);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (169, 28407, 'Kehila', '447558948', 280);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (170, 11243, 'Beit Knesset', '691675964', 58);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (171, 29155, 'Neighborhood', '235523838', 90);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (172, 38798, 'Neighborhood', '235667482', 4);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (173, 39778, 'Kehila', '147891851', 215);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (174, 31415, 'Neighborhood', '833322764', 199);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (175, 32369, 'Neighborhood', '626124238', 266);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (176, 11237, 'Beit Knesset', '392828386', 395);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (177, 26253, 'Kehila', '852613132', 188);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (178, 42210, 'Beit Knesset', '352997319', 82);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (179, 22745, 'Kehila', '145542898', 101);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (180, 26089, 'Beit Knesset', '434251438', 84);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (181, 42425, 'Beit Knesset', '891111659', 251);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (182, 40965, 'Kehila', '594947497', 275);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (183, 24894, 'Neighborhood', '499483842', 293);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (184, 22272, 'Neighborhood', '658627481', 232);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (185, 31050, 'Beit Knesset', '189236321', 300);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (186, 26307, 'Kehila', '994494151', 395);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (187, 27843, 'Neighborhood', '823985168', 293);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (188, 36244, 'Kehila', '872214155', 167);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (189, 15550, 'Neighborhood', '721939389', 299);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (190, 30651, 'Beit Knesset', '236134799', 133);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (191, 17533, 'Neighborhood', '332543373', 133);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (192, 34503, 'Beit Knesset', '538441491', 1);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (193, 12509, 'Kehila', '174367542', 104);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (194, 32700, 'Beit Knesset', '226699178', 277);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (195, 49318, 'Neighborhood', '174316155', 249);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (196, 26084, 'Kehila', '653247361', 56);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (197, 24179, 'Beit Knesset', '433957255', 89);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (198, 29949, 'Beit Knesset', '533729433', 141);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (199, 40467, 'Beit Knesset', '344582425', 109);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (200, 15063, 'Beit Knesset', '943733834', 292);
commit;
prompt 200 records committed...
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (201, 30970, 'Beit Knesset', '157884299', 169);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (202, 31179, 'Neighborhood', '276791168', 188);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (203, 42662, 'Neighborhood', '997525675', 34);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (204, 33055, 'Kehila', '567976521', 130);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (205, 23960, 'Kehila', '454996898', 30);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (206, 48963, 'Kehila', '244333861', 253);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (207, 34500, 'Neighborhood', '612736591', 226);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (208, 11711, 'Beit Knesset', '997937471', 277);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (209, 37392, 'Kehila', '592727165', 146);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (210, 12159, 'Neighborhood', '361952911', 171);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (211, 33992, 'Kehila', '332156218', 194);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (212, 15227, 'Beit Knesset', '695845652', 152);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (213, 21169, 'Beit Knesset', '937637978', 13);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (214, 38419, 'Beit Knesset', '559416873', 1);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (215, 11064, 'Beit Knesset', '817554245', 173);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (216, 32833, 'Beit Knesset', '918113848', 110);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (217, 33362, 'Beit Knesset', '772344224', 368);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (218, 26680, 'Beit Knesset', '719815726', 250);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (219, 40054, 'Neighborhood', '595497234', 156);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (220, 11299, 'Beit Knesset', '229285278', 66);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (221, 32704, 'Kehila', '839161832', 213);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (222, 49672, 'Neighborhood', '895321839', 99);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (223, 12215, 'Kehila', '365637463', 115);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (224, 47436, 'Kehila', '987247733', 124);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (225, 31093, 'Neighborhood', '599542592', 247);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (226, 26407, 'Beit Knesset', '594442112', 28);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (227, 28214, 'Neighborhood', '786253265', 229);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (228, 20591, 'Kehila', '129173193', 398);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (229, 46091, 'Beit Knesset', '656856766', 282);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (230, 34696, 'Neighborhood', '564132748', 42);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (231, 30633, 'Kehila', '877236164', 304);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (232, 25153, 'Neighborhood', '125834189', 36);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (233, 13421, 'Neighborhood', '587777845', 278);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (234, 23631, 'Beit Knesset', '551824289', 293);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (235, 36467, 'Neighborhood', '865719383', 3);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (236, 43049, 'Neighborhood', '652473748', 252);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (237, 19476, 'Kehila', '293584384', 157);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (238, 46096, 'Neighborhood', '669626999', 107);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (239, 49624, 'Beit Knesset', '212182795', 269);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (240, 16244, 'Kehila', '199784323', 143);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (241, 13809, 'Kehila', '891319764', 36);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (242, 11264, 'Neighborhood', '558949774', 210);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (243, 13428, 'Kehila', '949921776', 349);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (244, 39245, 'Kehila', '498198356', 118);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (245, 41638, 'Beit Knesset', '496863376', 52);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (246, 37100, 'Kehila', '279915487', 152);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (247, 43119, 'Neighborhood', '327862948', 22);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (248, 31593, 'Neighborhood', '917434396', 122);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (249, 36344, 'Kehila', '272673356', 180);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (250, 42851, 'Beit Knesset', '436594732', 130);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (251, 18344, 'Neighborhood', '441463155', 220);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (252, 10373, 'Neighborhood', '414436166', 263);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (253, 11973, 'Beit Knesset', '712382196', 66);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (254, 21558, 'Kehila', '112487658', 16);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (255, 15672, 'Kehila', '293678623', 56);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (256, 42708, 'Neighborhood', '259998731', 233);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (257, 15736, 'Kehila', '224223615', 48);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (258, 32552, 'Beit Knesset', '537947277', 381);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (259, 21081, 'Neighborhood', '635186193', 249);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (260, 38258, 'Neighborhood', '947194347', 338);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (261, 40507, 'Beit Knesset', '186737887', 179);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (262, 33950, 'Beit Knesset', '141517495', 319);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (263, 42466, 'Beit Knesset', '349856185', 146);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (264, 21723, 'Kehila', '598432718', 118);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (265, 17324, 'Beit Knesset', '833566673', 58);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (266, 35160, 'Kehila', '669683166', 74);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (267, 22132, 'Beit Knesset', '145638774', 351);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (268, 45344, 'Neighborhood', '856133437', 174);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (269, 47889, 'Kehila', '936148598', 250);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (270, 49378, 'Neighborhood', '878581554', 64);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (271, 29304, 'Neighborhood', '985896517', 147);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (272, 21397, 'Beit Knesset', '423819568', 396);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (273, 37069, 'Kehila', '842326714', 112);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (274, 46089, 'Kehila', '999782468', 303);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (275, 12616, 'Kehila', '587318512', 122);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (276, 34702, 'Beit Knesset', '493784413', 184);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (277, 45394, 'Kehila', '957323714', 20);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (278, 23568, 'Neighborhood', '154623654', 232);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (279, 32619, 'Neighborhood', '572314716', 395);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (280, 15114, 'Neighborhood', '288811599', 273);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (281, 41558, 'Neighborhood', '583379433', 392);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (282, 41380, 'Kehila', '829313137', 139);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (283, 14276, 'Neighborhood', '755961874', 40);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (284, 10029, 'Kehila', '993824921', 161);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (285, 14919, 'Beit Knesset', '887265245', 312);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (286, 12874, 'Kehila', '377635558', 188);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (287, 19466, 'Kehila', '786579737', 109);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (288, 16882, 'Kehila', '168125151', 332);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (289, 48003, 'Neighborhood', '134348668', 160);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (290, 17696, 'Kehila', '483131243', 238);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (291, 39481, 'Kehila', '896177658', 262);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (292, 15647, 'Beit Knesset', '515997184', 80);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (293, 28992, 'Beit Knesset', '273253861', 231);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (294, 14274, 'Beit Knesset', '692357995', 77);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (295, 27526, 'Neighborhood', '582566754', 188);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (296, 41336, 'Neighborhood', '415855356', 138);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (297, 44240, 'Neighborhood', '977176488', 163);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (298, 32329, 'Kehila', '777747785', 37);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (299, 11222, 'Neighborhood', '832459156', 230);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (300, 16501, 'Beit Knesset', '568923577', 99);
commit;
prompt 300 records committed...
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (301, 10759, 'Kehila', '281272743', 362);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (302, 45370, 'Kehila', '482244746', 26);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (303, 45104, 'Kehila', '616764391', 12);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (304, 23734, 'Neighborhood', '888537944', 240);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (305, 28732, 'Beit Knesset', '518877293', 225);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (306, 43194, 'Beit Knesset', '731865932', 151);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (307, 43119, 'Neighborhood', '961587545', 264);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (308, 18163, 'Beit Knesset', '776982383', 153);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (309, 13998, 'Kehila', '839567815', 370);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (310, 24388, 'Beit Knesset', '995749866', 143);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (311, 11129, 'Neighborhood', '362494193', 244);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (312, 19959, 'Beit Knesset', '744985176', 165);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (313, 10565, 'Beit Knesset', '671463442', 54);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (314, 28830, 'Kehila', '335785691', 380);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (315, 39414, 'Neighborhood', '746733519', 367);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (316, 26830, 'Kehila', '184326932', 363);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (317, 23105, 'Neighborhood', '514513412', 204);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (318, 10182, 'Beit Knesset', '193262844', 117);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (319, 15161, 'Kehila', '617936142', 26);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (320, 46522, 'Kehila', '637168227', 22);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (321, 49454, 'Kehila', '922925359', 38);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (322, 28402, 'Neighborhood', '196476176', 104);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (323, 14975, 'Kehila', '616664152', 222);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (324, 49322, 'Neighborhood', '291948724', 228);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (325, 33107, 'Kehila', '545625937', 93);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (326, 42231, 'Beit Knesset', '819659753', 18);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (327, 17377, 'Neighborhood', '196893743', 183);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (328, 40554, 'Kehila', '479737739', 102);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (329, 15731, 'Neighborhood', '794656889', 47);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (330, 21701, 'Kehila', '829944286', 283);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (331, 15297, 'Kehila', '474444359', 394);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (332, 13084, 'Neighborhood', '946819459', 229);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (333, 49652, 'Beit Knesset', '417356482', 146);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (334, 20634, 'Neighborhood', '919765381', 298);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (335, 48584, 'Neighborhood', '146799631', 19);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (336, 19816, 'Beit Knesset', '431267184', 78);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (337, 30361, 'Neighborhood', '715817528', 230);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (338, 49142, 'Kehila', '996191343', 259);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (339, 36497, 'Kehila', '797987786', 329);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (340, 46191, 'Neighborhood', '726675996', 229);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (341, 49015, 'Neighborhood', '761199631', 356);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (342, 26122, 'Kehila', '312582547', 189);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (343, 10212, 'Beit Knesset', '421268494', 123);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (344, 42691, 'Kehila', '438168661', 201);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (345, 24931, 'Neighborhood', '558989961', 222);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (346, 11764, 'Neighborhood', '818576479', 157);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (347, 25318, 'Kehila', '631847162', 355);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (348, 37337, 'Neighborhood', '234716251', 272);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (349, 18094, 'Neighborhood', '513788347', 195);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (350, 40046, 'Neighborhood', '268265138', 107);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (351, 34318, 'Beit Knesset', '618975349', 361);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (352, 48188, 'Neighborhood', '687421967', 108);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (353, 21652, 'Neighborhood', '162212486', 334);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (354, 31233, 'Kehila', '842696627', 81);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (355, 39129, 'Beit Knesset', '383938243', 81);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (356, 35843, 'Beit Knesset', '382715399', 183);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (357, 34416, 'Neighborhood', '451716641', 216);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (358, 24382, 'Beit Knesset', '493533262', 45);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (359, 43582, 'Kehila', '813741629', 284);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (360, 15939, 'Kehila', '432369474', 12);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (361, 13360, 'Beit Knesset', '498334755', 361);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (362, 49839, 'Neighborhood', '163846228', 116);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (363, 45922, 'Kehila', '867942594', 395);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (364, 11655, 'Beit Knesset', '678678156', 368);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (365, 26128, 'Neighborhood', '935253765', 56);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (366, 41736, 'Kehila', '132364471', 382);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (367, 31308, 'Neighborhood', '935629193', 321);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (368, 46207, 'Beit Knesset', '781531626', 312);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (369, 43520, 'Kehila', '617676887', 380);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (370, 30496, 'Beit Knesset', '663154339', 330);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (371, 44315, 'Beit Knesset', '893991454', 270);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (372, 15346, 'Kehila', '981621615', 215);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (373, 12005, 'Kehila', '992683615', 31);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (374, 15332, 'Kehila', '684931972', 274);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (375, 21429, 'Neighborhood', '437481474', 184);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (376, 39871, 'Neighborhood', '953762888', 385);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (377, 46216, 'Kehila', '191177126', 347);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (378, 36745, 'Beit Knesset', '595539224', 372);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (379, 23552, 'Neighborhood', '624665669', 358);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (380, 18112, 'Kehila', '623363899', 92);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (381, 21448, 'Neighborhood', '131394875', 337);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (382, 49025, 'Beit Knesset', '293936724', 60);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (383, 28500, 'Neighborhood', '469219916', 67);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (384, 18442, 'Kehila', '854531927', 192);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (385, 46161, 'Beit Knesset', '368234755', 101);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (386, 32751, 'Beit Knesset', '655565834', 271);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (387, 43502, 'Beit Knesset', '942521312', 192);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (388, 31774, 'Neighborhood', '246463929', 150);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (389, 14479, 'Neighborhood', '521298933', 255);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (390, 27291, 'Kehila', '743356654', 62);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (391, 17701, 'Beit Knesset', '415114957', 244);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (392, 44056, 'Neighborhood', '386293236', 271);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (393, 38692, 'Beit Knesset', '655846189', 161);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (394, 43304, 'Neighborhood', '551266768', 39);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (395, 34656, 'Neighborhood', '618433699', 188);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (396, 28777, 'Kehila', '732586856', 320);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (397, 41750, 'Beit Knesset', '482277927', 145);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (398, 15234, 'Kehila', '369348629', 181);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (399, 24839, 'Beit Knesset', '156337241', 270);
insert into COMMUNITY (community_id, monthly_donation, community_type, phone_number, donation_id)
values (400, 19467, 'Beit Knesset', '853768375', 146);
commit;
prompt 400 records loaded
prompt Loading EXTERNAL_DONOR...
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000188, 401);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000189, 402);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000038, 403);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000280, 404);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000040, 405);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000260, 406);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000218, 407);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000320, 408);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000271, 409);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000236, 410);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000363, 411);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000114, 412);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000079, 413);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000042, 414);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000099, 415);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000116, 416);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000114, 417);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000213, 418);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000152, 419);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000000, 420);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000257, 421);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000063, 422);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000108, 423);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000212, 424);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000036, 425);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000018, 426);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000302, 427);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000388, 428);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000285, 429);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000237, 430);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000323, 431);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000002, 432);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000003, 433);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000116, 434);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000299, 435);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000280, 436);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000023, 437);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000182, 438);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000063, 439);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000151, 440);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000040, 441);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000391, 442);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000168, 443);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000292, 444);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000012, 445);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000128, 446);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000041, 447);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000209, 448);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000279, 449);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000118, 450);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000247, 451);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000233, 452);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000025, 453);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000158, 454);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000355, 455);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000359, 456);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000218, 457);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000267, 458);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000381, 459);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000013, 460);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000050, 461);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000172, 462);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000292, 463);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000084, 464);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000020, 465);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000127, 466);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000148, 467);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000278, 468);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000087, 469);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000175, 470);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000369, 471);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000165, 472);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000221, 473);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000258, 474);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000104, 475);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000360, 476);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000385, 477);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000087, 478);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000188, 479);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000398, 480);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000281, 481);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000166, 482);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000059, 483);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000366, 484);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000091, 485);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000287, 486);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000126, 487);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000238, 488);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000342, 489);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000303, 490);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000370, 491);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000181, 492);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000329, 493);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000072, 494);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000043, 495);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000371, 496);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000224, 497);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000396, 498);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000269, 499);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000201, 500);
commit;
prompt 100 records committed...
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000105, 501);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000047, 502);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000214, 503);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000007, 504);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000039, 505);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000094, 506);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000006, 507);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000192, 508);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000237, 509);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000036, 510);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000095, 511);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000297, 512);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000035, 513);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000345, 514);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000025, 515);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000268, 516);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000107, 517);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000124, 518);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000104, 519);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000285, 520);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000061, 521);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000298, 522);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000358, 523);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000003, 524);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000039, 525);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000019, 526);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000034, 527);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000169, 528);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000257, 529);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000128, 530);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000253, 531);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000058, 532);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000108, 533);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000338, 534);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000084, 535);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000300, 536);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000173, 537);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000186, 538);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000017, 539);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000341, 540);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000162, 541);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000223, 542);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000124, 543);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000302, 544);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000310, 545);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000076, 546);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000289, 547);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000290, 548);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000281, 549);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000076, 550);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000378, 551);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000314, 552);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000083, 553);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000055, 554);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000341, 555);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000075, 556);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000053, 557);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000228, 558);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000331, 559);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000363, 560);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000218, 561);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000359, 562);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000198, 563);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000338, 564);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000282, 565);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000321, 566);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000271, 567);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000252, 568);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000363, 569);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000054, 570);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000185, 571);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000043, 572);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000310, 573);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000227, 574);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000244, 575);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000389, 576);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000333, 577);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000212, 578);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000303, 579);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000060, 580);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000178, 581);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000079, 582);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000041, 583);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000323, 584);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000176, 585);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000210, 586);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000221, 587);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000073, 588);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000000, 589);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000243, 590);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000205, 591);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000220, 592);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000261, 593);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000358, 594);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000307, 595);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000014, 596);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000170, 597);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000399, 598);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000073, 599);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000050, 600);
commit;
prompt 200 records committed...
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000201, 601);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000049, 602);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000066, 603);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000014, 604);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000389, 605);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000159, 606);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000030, 607);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000116, 608);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000187, 609);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000235, 610);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000021, 611);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000090, 612);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000319, 613);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000002, 614);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000395, 615);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000090, 616);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000359, 617);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000228, 618);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000206, 619);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000354, 620);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000264, 621);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000140, 622);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000134, 623);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000189, 624);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000198, 625);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000022, 626);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000089, 627);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000136, 628);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000271, 629);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000104, 630);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000194, 631);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000063, 632);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000337, 633);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000152, 634);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000321, 635);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000051, 636);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000061, 637);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000260, 638);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000260, 639);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000222, 640);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000010, 641);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000261, 642);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000308, 643);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000175, 644);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000182, 645);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000044, 646);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000147, 647);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000374, 648);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000112, 649);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000006, 650);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000010, 651);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000355, 652);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000387, 653);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000127, 654);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000201, 655);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000299, 656);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000294, 657);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000283, 658);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000360, 659);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000239, 660);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000041, 661);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000103, 662);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000343, 663);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000041, 664);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000078, 665);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000376, 666);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000316, 667);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000234, 668);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000146, 669);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000105, 670);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000124, 671);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000228, 672);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000398, 673);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000234, 674);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000132, 675);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000188, 676);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000199, 677);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000337, 678);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000211, 679);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000116, 680);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000368, 681);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000274, 682);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000053, 683);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000197, 684);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000266, 685);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000142, 686);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000097, 687);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000163, 688);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000074, 689);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000301, 690);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000042, 691);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000338, 692);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000291, 693);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000193, 694);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000039, 695);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000315, 696);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000185, 697);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000365, 698);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000126, 699);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000123, 700);
commit;
prompt 300 records committed...
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000220, 701);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000196, 702);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000014, 703);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000034, 704);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000002, 705);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000333, 706);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000168, 707);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000084, 708);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000161, 709);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000142, 710);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000106, 711);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000038, 712);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000319, 713);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000191, 714);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000263, 715);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000281, 716);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000155, 717);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000257, 718);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000318, 719);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000171, 720);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000316, 721);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000269, 722);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000165, 723);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000128, 724);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000388, 725);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000099, 726);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000203, 727);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000198, 728);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000077, 729);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000195, 730);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000131, 731);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000359, 732);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000215, 733);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000371, 734);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000328, 735);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000325, 736);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000329, 737);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000164, 738);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000397, 739);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000301, 740);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000013, 741);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000253, 742);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000359, 743);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000243, 744);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000210, 745);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000148, 746);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000072, 747);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000087, 748);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000264, 749);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000270, 750);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000166, 751);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000298, 752);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000257, 753);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000211, 754);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000261, 755);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000188, 756);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000258, 757);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000283, 758);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000365, 759);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000383, 760);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000230, 761);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000372, 762);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000217, 763);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000265, 764);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000018, 765);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000195, 766);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'female', 100000275, 767);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000164, 768);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000145, 769);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000369, 770);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000109, 771);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000156, 772);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000257, 773);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000194, 774);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000101, 775);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000215, 776);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000144, 777);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000167, 778);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000020, 779);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000181, 780);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'female', 100000360, 781);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000117, 782);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'male', 100000150, 783);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000097, 784);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000389, 785);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000383, 786);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000373, 787);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000376, 788);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000380, 789);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'female', 100000334, 790);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000260, 791);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A family', 'male', 100000146, 792);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000174, 793);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000234, 794);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'female', 100000176, 795);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000245, 796);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('From Israel', 'male', 100000274, 797);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('A corporation', 'male', 100000167, 798);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('Not from Israel', 'female', 100000264, 799);
insert into EXTERNAL_DONOR (donordescription, gender, person_id, donor_id)
values ('An individual', 'male', 100000196, 800);
commit;
prompt 400 records loaded
prompt Loading SPENDING...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 465, to_date('08-04-2017', 'dd-mm-yyyy'), 1, 219);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 635, to_date('22-11-2020', 'dd-mm-yyyy'), 2, 76);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 675, to_date('04-11-2004', 'dd-mm-yyyy'), 3, 101);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 598, to_date('23-04-2002', 'dd-mm-yyyy'), 4, 121);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 376, to_date('14-11-2003', 'dd-mm-yyyy'), 5, 141);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 960, to_date('24-10-2017', 'dd-mm-yyyy'), 6, 263);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 511, to_date('20-06-2003', 'dd-mm-yyyy'), 7, 290);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 946, to_date('22-10-1995', 'dd-mm-yyyy'), 8, 41);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 424, to_date('19-05-2014', 'dd-mm-yyyy'), 9, 337);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 861, to_date('12-12-2011', 'dd-mm-yyyy'), 10, 283);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 828, to_date('28-06-2023', 'dd-mm-yyyy'), 11, 210);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 483, to_date('29-11-1996', 'dd-mm-yyyy'), 12, 109);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 456, to_date('23-05-1999', 'dd-mm-yyyy'), 13, 298);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 646, to_date('03-08-2022', 'dd-mm-yyyy'), 14, 376);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 833, to_date('27-09-1994', 'dd-mm-yyyy'), 15, 201);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 315, to_date('02-12-1996', 'dd-mm-yyyy'), 16, 335);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 910, to_date('20-04-2001', 'dd-mm-yyyy'), 17, 306);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 366, to_date('12-01-2006', 'dd-mm-yyyy'), 18, 321);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 519, to_date('29-12-2004', 'dd-mm-yyyy'), 19, 184);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 744, to_date('29-02-1996', 'dd-mm-yyyy'), 20, 59);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 707, to_date('23-01-2000', 'dd-mm-yyyy'), 21, 215);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 826, to_date('28-08-1999', 'dd-mm-yyyy'), 22, 208);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 968, to_date('15-10-1996', 'dd-mm-yyyy'), 23, 37);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 873, to_date('15-06-2010', 'dd-mm-yyyy'), 24, 318);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 364, to_date('24-10-2022', 'dd-mm-yyyy'), 25, 222);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 380, to_date('24-09-1990', 'dd-mm-yyyy'), 26, 18);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 453, to_date('10-09-2014', 'dd-mm-yyyy'), 27, 371);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 315, to_date('27-09-2008', 'dd-mm-yyyy'), 28, 227);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 895, to_date('29-09-2012', 'dd-mm-yyyy'), 29, 42);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 851, to_date('14-09-1991', 'dd-mm-yyyy'), 30, 391);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 355, to_date('02-05-2005', 'dd-mm-yyyy'), 31, 100);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 900, to_date('09-10-2022', 'dd-mm-yyyy'), 32, 148);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 615, to_date('23-07-2007', 'dd-mm-yyyy'), 33, 87);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 827, to_date('22-03-2012', 'dd-mm-yyyy'), 34, 209);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 557, to_date('17-11-1995', 'dd-mm-yyyy'), 35, 24);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 676, to_date('30-11-2015', 'dd-mm-yyyy'), 36, 73);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 356, to_date('17-04-2008', 'dd-mm-yyyy'), 37, 235);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 872, to_date('16-10-1996', 'dd-mm-yyyy'), 38, 163);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 459, to_date('06-04-1997', 'dd-mm-yyyy'), 39, 396);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 524, to_date('30-10-1992', 'dd-mm-yyyy'), 40, 389);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 963, to_date('13-03-2020', 'dd-mm-yyyy'), 41, 210);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 330, to_date('01-04-2003', 'dd-mm-yyyy'), 42, 334);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 681, to_date('27-08-2010', 'dd-mm-yyyy'), 43, 103);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 958, to_date('06-12-2005', 'dd-mm-yyyy'), 44, 264);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 805, to_date('08-05-1990', 'dd-mm-yyyy'), 45, 354);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 435, to_date('09-10-2002', 'dd-mm-yyyy'), 46, 166);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 567, to_date('23-06-1999', 'dd-mm-yyyy'), 47, 238);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 328, to_date('12-03-2024', 'dd-mm-yyyy'), 48, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 982, to_date('23-07-2020', 'dd-mm-yyyy'), 49, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 412, to_date('20-12-2023', 'dd-mm-yyyy'), 50, 41);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 597, to_date('04-02-1999', 'dd-mm-yyyy'), 51, 76);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 737, to_date('10-06-2008', 'dd-mm-yyyy'), 52, 274);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 728, to_date('06-05-1995', 'dd-mm-yyyy'), 53, 268);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 588, to_date('08-09-2021', 'dd-mm-yyyy'), 54, 52);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 588, to_date('17-01-2020', 'dd-mm-yyyy'), 55, 247);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 638, to_date('26-12-2020', 'dd-mm-yyyy'), 56, 392);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 519, to_date('06-04-2001', 'dd-mm-yyyy'), 57, 394);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 594, to_date('07-02-2021', 'dd-mm-yyyy'), 58, 381);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 704, to_date('29-01-2020', 'dd-mm-yyyy'), 59, 314);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 742, to_date('08-04-1991', 'dd-mm-yyyy'), 60, 383);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 982, to_date('12-09-2023', 'dd-mm-yyyy'), 61, 151);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 375, to_date('15-12-2020', 'dd-mm-yyyy'), 62, 75);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 357, to_date('28-10-2013', 'dd-mm-yyyy'), 63, 346);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 829, to_date('13-07-1997', 'dd-mm-yyyy'), 64, 113);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 395, to_date('16-02-2022', 'dd-mm-yyyy'), 65, 204);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 495, to_date('24-12-1999', 'dd-mm-yyyy'), 66, 215);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 621, to_date('12-06-2010', 'dd-mm-yyyy'), 67, 96);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 747, to_date('14-01-1998', 'dd-mm-yyyy'), 68, 76);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 601, to_date('24-05-2005', 'dd-mm-yyyy'), 69, 84);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 340, to_date('10-03-1992', 'dd-mm-yyyy'), 70, 299);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 330, to_date('27-01-2020', 'dd-mm-yyyy'), 71, 170);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 725, to_date('20-07-2009', 'dd-mm-yyyy'), 72, 164);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 306, to_date('27-09-2003', 'dd-mm-yyyy'), 73, 168);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 532, to_date('07-02-1990', 'dd-mm-yyyy'), 74, 209);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 593, to_date('14-06-1991', 'dd-mm-yyyy'), 75, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 975, to_date('21-07-2010', 'dd-mm-yyyy'), 76, 45);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 992, to_date('10-06-2006', 'dd-mm-yyyy'), 77, 53);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 425, to_date('04-01-2020', 'dd-mm-yyyy'), 78, 192);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 890, to_date('02-06-1990', 'dd-mm-yyyy'), 79, 255);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 599, to_date('13-07-2016', 'dd-mm-yyyy'), 80, 339);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 918, to_date('08-09-2002', 'dd-mm-yyyy'), 81, 127);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 522, to_date('12-10-2010', 'dd-mm-yyyy'), 82, 33);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 787, to_date('05-12-1999', 'dd-mm-yyyy'), 83, 340);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 698, to_date('08-08-2017', 'dd-mm-yyyy'), 84, 189);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 332, to_date('31-05-2022', 'dd-mm-yyyy'), 85, 350);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 671, to_date('13-10-2006', 'dd-mm-yyyy'), 86, 229);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 939, to_date('20-04-1995', 'dd-mm-yyyy'), 87, 47);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 473, to_date('14-05-2019', 'dd-mm-yyyy'), 88, 41);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 372, to_date('22-02-2005', 'dd-mm-yyyy'), 89, 226);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 378, to_date('12-04-2002', 'dd-mm-yyyy'), 90, 366);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 594, to_date('30-06-2019', 'dd-mm-yyyy'), 91, 291);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 336, to_date('18-12-2014', 'dd-mm-yyyy'), 92, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 576, to_date('14-11-2012', 'dd-mm-yyyy'), 93, 376);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 514, to_date('12-09-2016', 'dd-mm-yyyy'), 94, 292);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 705, to_date('11-07-2017', 'dd-mm-yyyy'), 95, 296);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 816, to_date('09-07-1991', 'dd-mm-yyyy'), 96, 277);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 584, to_date('02-09-1995', 'dd-mm-yyyy'), 97, 118);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 815, to_date('15-11-1997', 'dd-mm-yyyy'), 98, 93);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 729, to_date('13-12-2014', 'dd-mm-yyyy'), 99, 364);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 760, to_date('28-05-2005', 'dd-mm-yyyy'), 100, 227);
commit;
prompt 100 records committed...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 450, to_date('28-07-2004', 'dd-mm-yyyy'), 101, 236);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 893, to_date('06-07-2000', 'dd-mm-yyyy'), 102, 67);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 339, to_date('02-02-2021', 'dd-mm-yyyy'), 103, 258);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 446, to_date('31-08-2016', 'dd-mm-yyyy'), 104, 61);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 942, to_date('11-08-1991', 'dd-mm-yyyy'), 105, 160);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 542, to_date('18-08-2020', 'dd-mm-yyyy'), 106, 303);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 428, to_date('02-02-2001', 'dd-mm-yyyy'), 107, 370);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 485, to_date('07-09-1998', 'dd-mm-yyyy'), 108, 349);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 353, to_date('31-08-2022', 'dd-mm-yyyy'), 109, 340);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 743, to_date('27-12-2001', 'dd-mm-yyyy'), 110, 249);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 616, to_date('25-12-2019', 'dd-mm-yyyy'), 111, 98);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 729, to_date('12-06-2013', 'dd-mm-yyyy'), 112, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 406, to_date('13-09-2008', 'dd-mm-yyyy'), 113, 219);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 470, to_date('01-08-2014', 'dd-mm-yyyy'), 114, 294);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 954, to_date('20-04-2008', 'dd-mm-yyyy'), 115, 224);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 577, to_date('20-07-2011', 'dd-mm-yyyy'), 116, 301);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 960, to_date('11-11-2021', 'dd-mm-yyyy'), 117, 208);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 498, to_date('04-04-2020', 'dd-mm-yyyy'), 118, 138);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 833, to_date('18-05-2009', 'dd-mm-yyyy'), 119, 85);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 680, to_date('11-09-2010', 'dd-mm-yyyy'), 120, 361);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 313, to_date('05-04-1992', 'dd-mm-yyyy'), 121, 65);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 909, to_date('08-10-2016', 'dd-mm-yyyy'), 122, 369);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 690, to_date('02-10-2013', 'dd-mm-yyyy'), 123, 350);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 450, to_date('30-11-1998', 'dd-mm-yyyy'), 124, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 415, to_date('02-02-2024', 'dd-mm-yyyy'), 125, 63);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 692, to_date('04-11-2009', 'dd-mm-yyyy'), 126, 39);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 912, to_date('16-01-2000', 'dd-mm-yyyy'), 127, 194);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 463, to_date('02-11-2009', 'dd-mm-yyyy'), 128, 136);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 870, to_date('10-08-2023', 'dd-mm-yyyy'), 129, 174);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 862, to_date('13-08-2019', 'dd-mm-yyyy'), 130, 237);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 745, to_date('12-03-2010', 'dd-mm-yyyy'), 131, 76);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 667, to_date('06-07-1991', 'dd-mm-yyyy'), 132, 224);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 641, to_date('31-03-2015', 'dd-mm-yyyy'), 133, 36);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 554, to_date('09-04-2018', 'dd-mm-yyyy'), 134, 65);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 697, to_date('29-04-2018', 'dd-mm-yyyy'), 135, 108);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 689, to_date('16-04-2019', 'dd-mm-yyyy'), 136, 378);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 459, to_date('04-06-2010', 'dd-mm-yyyy'), 137, 132);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 836, to_date('25-04-2005', 'dd-mm-yyyy'), 138, 214);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 750, to_date('21-12-2005', 'dd-mm-yyyy'), 139, 37);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 839, to_date('20-08-1992', 'dd-mm-yyyy'), 140, 72);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 329, to_date('08-01-2014', 'dd-mm-yyyy'), 141, 164);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 813, to_date('11-01-2014', 'dd-mm-yyyy'), 142, 135);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 657, to_date('16-12-2002', 'dd-mm-yyyy'), 143, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 318, to_date('16-01-2020', 'dd-mm-yyyy'), 144, 132);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 536, to_date('27-05-1996', 'dd-mm-yyyy'), 145, 228);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 735, to_date('06-09-2014', 'dd-mm-yyyy'), 146, 21);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 960, to_date('14-08-1990', 'dd-mm-yyyy'), 147, 175);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 325, to_date('04-08-2012', 'dd-mm-yyyy'), 148, 307);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 548, to_date('05-02-2003', 'dd-mm-yyyy'), 149, 389);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 899, to_date('20-03-2024', 'dd-mm-yyyy'), 150, 374);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 483, to_date('23-06-2011', 'dd-mm-yyyy'), 151, 208);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 860, to_date('30-01-2000', 'dd-mm-yyyy'), 152, 49);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 729, to_date('16-08-2023', 'dd-mm-yyyy'), 153, 257);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 560, to_date('25-06-2009', 'dd-mm-yyyy'), 154, 387);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 853, to_date('29-08-2003', 'dd-mm-yyyy'), 155, 137);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 333, to_date('04-11-1999', 'dd-mm-yyyy'), 156, 84);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 538, to_date('09-12-1997', 'dd-mm-yyyy'), 157, 160);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 335, to_date('24-11-1996', 'dd-mm-yyyy'), 158, 313);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 491, to_date('14-10-2013', 'dd-mm-yyyy'), 159, 290);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 771, to_date('12-03-2023', 'dd-mm-yyyy'), 160, 388);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 941, to_date('05-12-1994', 'dd-mm-yyyy'), 161, 321);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 411, to_date('05-02-2010', 'dd-mm-yyyy'), 162, 246);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 531, to_date('26-12-1996', 'dd-mm-yyyy'), 163, 77);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 419, to_date('25-01-2013', 'dd-mm-yyyy'), 164, 163);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 512, to_date('28-05-2012', 'dd-mm-yyyy'), 165, 33);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 849, to_date('23-07-2007', 'dd-mm-yyyy'), 166, 90);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 919, to_date('20-05-1995', 'dd-mm-yyyy'), 167, 366);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 355, to_date('10-07-2022', 'dd-mm-yyyy'), 168, 212);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 646, to_date('25-12-2017', 'dd-mm-yyyy'), 169, 31);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 489, to_date('11-04-1992', 'dd-mm-yyyy'), 170, 338);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 720, to_date('28-11-2006', 'dd-mm-yyyy'), 171, 256);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 588, to_date('20-09-2014', 'dd-mm-yyyy'), 172, 112);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 959, to_date('30-04-2024', 'dd-mm-yyyy'), 173, 70);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 762, to_date('26-03-2018', 'dd-mm-yyyy'), 174, 47);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 528, to_date('06-10-1991', 'dd-mm-yyyy'), 175, 251);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 368, to_date('09-01-2007', 'dd-mm-yyyy'), 176, 191);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 995, to_date('27-05-1992', 'dd-mm-yyyy'), 177, 100);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 389, to_date('17-05-1990', 'dd-mm-yyyy'), 178, 11);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 668, to_date('30-06-2016', 'dd-mm-yyyy'), 179, 239);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 593, to_date('20-08-2008', 'dd-mm-yyyy'), 180, 304);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 537, to_date('08-12-2009', 'dd-mm-yyyy'), 181, 238);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 596, to_date('28-02-2015', 'dd-mm-yyyy'), 182, 336);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 804, to_date('09-08-2019', 'dd-mm-yyyy'), 183, 263);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 613, to_date('19-08-1992', 'dd-mm-yyyy'), 184, 203);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 609, to_date('18-08-2022', 'dd-mm-yyyy'), 185, 349);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 509, to_date('13-02-1994', 'dd-mm-yyyy'), 186, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 947, to_date('06-01-1990', 'dd-mm-yyyy'), 187, 99);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 636, to_date('25-08-2005', 'dd-mm-yyyy'), 188, 318);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 983, to_date('24-08-2012', 'dd-mm-yyyy'), 189, 13);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 971, to_date('09-10-2008', 'dd-mm-yyyy'), 190, 112);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 356, to_date('16-12-2007', 'dd-mm-yyyy'), 191, 29);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 638, to_date('13-04-2002', 'dd-mm-yyyy'), 192, 129);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 484, to_date('20-01-2005', 'dd-mm-yyyy'), 193, 106);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 641, to_date('08-06-2017', 'dd-mm-yyyy'), 194, 116);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 652, to_date('17-07-2010', 'dd-mm-yyyy'), 195, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 666, to_date('01-08-2023', 'dd-mm-yyyy'), 196, 141);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 802, to_date('19-06-2005', 'dd-mm-yyyy'), 197, 373);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 504, to_date('15-04-1999', 'dd-mm-yyyy'), 198, 337);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 516, to_date('04-09-2004', 'dd-mm-yyyy'), 199, 80);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 445, to_date('25-01-1997', 'dd-mm-yyyy'), 200, 259);
commit;
prompt 200 records committed...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 490, to_date('27-06-2006', 'dd-mm-yyyy'), 201, 203);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 678, to_date('22-03-1995', 'dd-mm-yyyy'), 202, 273);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 903, to_date('12-09-2004', 'dd-mm-yyyy'), 203, 273);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 382, to_date('06-06-2018', 'dd-mm-yyyy'), 204, 165);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 878, to_date('07-03-1994', 'dd-mm-yyyy'), 205, 206);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 715, to_date('06-02-2011', 'dd-mm-yyyy'), 206, 181);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 440, to_date('28-05-2004', 'dd-mm-yyyy'), 207, 254);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 480, to_date('26-11-2013', 'dd-mm-yyyy'), 208, 89);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 771, to_date('24-04-2023', 'dd-mm-yyyy'), 209, 182);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 611, to_date('09-03-2024', 'dd-mm-yyyy'), 210, 260);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 642, to_date('05-12-2017', 'dd-mm-yyyy'), 211, 63);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 632, to_date('27-12-2021', 'dd-mm-yyyy'), 212, 387);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 963, to_date('17-05-2017', 'dd-mm-yyyy'), 213, 305);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 416, to_date('02-01-2024', 'dd-mm-yyyy'), 214, 219);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 607, to_date('13-05-2017', 'dd-mm-yyyy'), 215, 97);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 940, to_date('16-06-1993', 'dd-mm-yyyy'), 216, 318);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 340, to_date('21-11-2015', 'dd-mm-yyyy'), 217, 288);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 531, to_date('19-10-2018', 'dd-mm-yyyy'), 218, 55);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 835, to_date('16-01-2008', 'dd-mm-yyyy'), 219, 283);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 610, to_date('28-03-2004', 'dd-mm-yyyy'), 220, 14);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 386, to_date('21-10-2008', 'dd-mm-yyyy'), 221, 168);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 622, to_date('27-07-2007', 'dd-mm-yyyy'), 222, 31);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 720, to_date('24-07-2000', 'dd-mm-yyyy'), 223, 58);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 368, to_date('09-01-2021', 'dd-mm-yyyy'), 224, 57);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 589, to_date('15-10-2011', 'dd-mm-yyyy'), 225, 273);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 624, to_date('08-12-2020', 'dd-mm-yyyy'), 226, 243);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 970, to_date('03-04-2017', 'dd-mm-yyyy'), 227, 338);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 660, to_date('13-12-2010', 'dd-mm-yyyy'), 228, 255);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 849, to_date('01-11-2003', 'dd-mm-yyyy'), 229, 2);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 345, to_date('15-05-2024', 'dd-mm-yyyy'), 230, 205);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 404, to_date('29-05-1995', 'dd-mm-yyyy'), 231, 295);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 559, to_date('05-11-2016', 'dd-mm-yyyy'), 232, 17);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 381, to_date('21-07-2002', 'dd-mm-yyyy'), 233, 197);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 477, to_date('14-06-1993', 'dd-mm-yyyy'), 234, 15);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 461, to_date('25-02-2000', 'dd-mm-yyyy'), 235, 136);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 874, to_date('02-09-1991', 'dd-mm-yyyy'), 236, 328);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 826, to_date('17-10-2001', 'dd-mm-yyyy'), 237, 318);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 797, to_date('20-07-2023', 'dd-mm-yyyy'), 238, 335);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 609, to_date('30-01-1990', 'dd-mm-yyyy'), 239, 271);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 954, to_date('20-05-2011', 'dd-mm-yyyy'), 240, 121);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 952, to_date('09-07-2012', 'dd-mm-yyyy'), 241, 22);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 476, to_date('13-03-1992', 'dd-mm-yyyy'), 242, 366);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 745, to_date('21-09-1995', 'dd-mm-yyyy'), 243, 95);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 392, to_date('25-02-2006', 'dd-mm-yyyy'), 244, 256);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 465, to_date('02-06-2000', 'dd-mm-yyyy'), 245, 334);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 485, to_date('05-11-2012', 'dd-mm-yyyy'), 246, 220);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 808, to_date('08-10-2022', 'dd-mm-yyyy'), 247, 356);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 741, to_date('30-08-2007', 'dd-mm-yyyy'), 248, 293);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 311, to_date('10-08-1995', 'dd-mm-yyyy'), 249, 22);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 402, to_date('03-01-1994', 'dd-mm-yyyy'), 250, 100);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 379, to_date('19-02-2024', 'dd-mm-yyyy'), 251, 336);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 906, to_date('02-12-2017', 'dd-mm-yyyy'), 252, 68);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 889, to_date('29-10-1995', 'dd-mm-yyyy'), 253, 374);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 817, to_date('12-03-2024', 'dd-mm-yyyy'), 254, 268);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 396, to_date('13-08-2009', 'dd-mm-yyyy'), 255, 225);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 961, to_date('19-09-2015', 'dd-mm-yyyy'), 256, 68);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 945, to_date('01-05-2007', 'dd-mm-yyyy'), 257, 372);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 839, to_date('24-11-1999', 'dd-mm-yyyy'), 258, 226);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 649, to_date('08-12-2017', 'dd-mm-yyyy'), 259, 290);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 350, to_date('26-06-1997', 'dd-mm-yyyy'), 260, 202);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 691, to_date('30-11-2016', 'dd-mm-yyyy'), 261, 268);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 499, to_date('02-07-2010', 'dd-mm-yyyy'), 262, 290);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 795, to_date('27-12-2019', 'dd-mm-yyyy'), 263, 60);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 999, to_date('25-02-2018', 'dd-mm-yyyy'), 264, 183);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 706, to_date('18-05-1998', 'dd-mm-yyyy'), 265, 357);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 364, to_date('04-09-2000', 'dd-mm-yyyy'), 266, 361);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 659, to_date('28-01-1994', 'dd-mm-yyyy'), 267, 291);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 612, to_date('28-02-1991', 'dd-mm-yyyy'), 268, 298);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 841, to_date('06-03-2022', 'dd-mm-yyyy'), 269, 154);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 435, to_date('03-09-2017', 'dd-mm-yyyy'), 270, 304);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 546, to_date('17-03-2001', 'dd-mm-yyyy'), 271, 149);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 689, to_date('25-07-2004', 'dd-mm-yyyy'), 272, 184);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 527, to_date('17-01-2021', 'dd-mm-yyyy'), 273, 366);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 458, to_date('05-05-2011', 'dd-mm-yyyy'), 274, 325);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 841, to_date('30-06-2019', 'dd-mm-yyyy'), 275, 380);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 525, to_date('03-11-2017', 'dd-mm-yyyy'), 276, 5);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 481, to_date('20-11-2002', 'dd-mm-yyyy'), 277, 73);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 929, to_date('06-08-2012', 'dd-mm-yyyy'), 278, 137);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 917, to_date('02-06-2019', 'dd-mm-yyyy'), 279, 87);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 317, to_date('12-12-2005', 'dd-mm-yyyy'), 280, 24);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 912, to_date('19-10-2022', 'dd-mm-yyyy'), 281, 296);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 598, to_date('08-04-2002', 'dd-mm-yyyy'), 282, 147);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 846, to_date('10-09-2004', 'dd-mm-yyyy'), 283, 305);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 774, to_date('11-03-2000', 'dd-mm-yyyy'), 284, 178);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 426, to_date('08-07-2017', 'dd-mm-yyyy'), 285, 376);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 981, to_date('01-10-2020', 'dd-mm-yyyy'), 286, 219);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 998, to_date('19-09-2018', 'dd-mm-yyyy'), 287, 375);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 616, to_date('20-06-1991', 'dd-mm-yyyy'), 288, 59);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 537, to_date('17-04-2018', 'dd-mm-yyyy'), 289, 348);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 358, to_date('09-06-2002', 'dd-mm-yyyy'), 290, 61);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 953, to_date('24-05-2013', 'dd-mm-yyyy'), 291, 320);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 388, to_date('30-06-2005', 'dd-mm-yyyy'), 292, 78);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 366, to_date('19-09-2019', 'dd-mm-yyyy'), 293, 118);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 390, to_date('31-12-2022', 'dd-mm-yyyy'), 294, 388);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 501, to_date('17-03-1993', 'dd-mm-yyyy'), 295, 20);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 663, to_date('03-02-2006', 'dd-mm-yyyy'), 296, 253);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 453, to_date('30-07-2020', 'dd-mm-yyyy'), 297, 232);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 814, to_date('13-03-1996', 'dd-mm-yyyy'), 298, 108);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 660, to_date('06-09-2021', 'dd-mm-yyyy'), 299, 385);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 948, to_date('19-10-2004', 'dd-mm-yyyy'), 300, 172);
commit;
prompt 300 records committed...
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 963, to_date('03-12-1995', 'dd-mm-yyyy'), 301, 259);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 455, to_date('22-05-2024', 'dd-mm-yyyy'), 302, 287);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 465, to_date('22-05-2021', 'dd-mm-yyyy'), 303, 134);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 689, to_date('25-07-1998', 'dd-mm-yyyy'), 304, 177);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 585, to_date('10-09-2006', 'dd-mm-yyyy'), 305, 362);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 335, to_date('07-02-1992', 'dd-mm-yyyy'), 306, 134);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 792, to_date('29-03-2021', 'dd-mm-yyyy'), 307, 166);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 982, to_date('21-07-2010', 'dd-mm-yyyy'), 308, 133);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 350, to_date('09-10-1999', 'dd-mm-yyyy'), 309, 70);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 473, to_date('07-10-2019', 'dd-mm-yyyy'), 310, 167);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 449, to_date('30-11-1990', 'dd-mm-yyyy'), 311, 338);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 671, to_date('02-06-1993', 'dd-mm-yyyy'), 312, 207);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 429, to_date('09-11-2020', 'dd-mm-yyyy'), 313, 258);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 895, to_date('20-11-2022', 'dd-mm-yyyy'), 314, 193);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 696, to_date('04-05-2019', 'dd-mm-yyyy'), 315, 237);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 866, to_date('10-10-2007', 'dd-mm-yyyy'), 316, 41);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 440, to_date('23-06-2014', 'dd-mm-yyyy'), 317, 322);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 538, to_date('29-09-1993', 'dd-mm-yyyy'), 318, 83);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 638, to_date('22-06-2011', 'dd-mm-yyyy'), 319, 357);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 335, to_date('11-03-2022', 'dd-mm-yyyy'), 320, 326);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 456, to_date('22-06-2002', 'dd-mm-yyyy'), 321, 149);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 361, to_date('09-11-2007', 'dd-mm-yyyy'), 322, 144);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 342, to_date('05-06-2004', 'dd-mm-yyyy'), 323, 75);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 725, to_date('21-11-2022', 'dd-mm-yyyy'), 324, 381);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 613, to_date('22-08-2021', 'dd-mm-yyyy'), 325, 97);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 845, to_date('18-12-2023', 'dd-mm-yyyy'), 326, 298);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 438, to_date('21-11-2001', 'dd-mm-yyyy'), 327, 23);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 555, to_date('06-03-2020', 'dd-mm-yyyy'), 328, 124);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 712, to_date('19-07-1992', 'dd-mm-yyyy'), 329, 168);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 902, to_date('22-09-1993', 'dd-mm-yyyy'), 330, 52);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 325, to_date('18-12-2014', 'dd-mm-yyyy'), 331, 65);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 432, to_date('01-07-2020', 'dd-mm-yyyy'), 332, 47);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 527, to_date('31-03-2001', 'dd-mm-yyyy'), 333, 382);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 983, to_date('18-10-2005', 'dd-mm-yyyy'), 334, 80);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 580, to_date('27-10-1999', 'dd-mm-yyyy'), 335, 74);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 553, to_date('25-06-1998', 'dd-mm-yyyy'), 336, 395);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 813, to_date('24-01-1996', 'dd-mm-yyyy'), 337, 355);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 582, to_date('01-01-2017', 'dd-mm-yyyy'), 338, 190);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 462, to_date('07-10-2001', 'dd-mm-yyyy'), 339, 300);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 311, to_date('06-08-2006', 'dd-mm-yyyy'), 340, 336);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 810, to_date('26-06-2000', 'dd-mm-yyyy'), 341, 70);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 644, to_date('12-06-1996', 'dd-mm-yyyy'), 342, 105);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 318, to_date('01-02-2024', 'dd-mm-yyyy'), 343, 155);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 702, to_date('04-08-2009', 'dd-mm-yyyy'), 344, 340);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 651, to_date('24-05-2016', 'dd-mm-yyyy'), 345, 255);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 368, to_date('02-10-2000', 'dd-mm-yyyy'), 346, 235);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 493, to_date('23-01-2000', 'dd-mm-yyyy'), 347, 177);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 430, to_date('27-02-1994', 'dd-mm-yyyy'), 348, 152);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 966, to_date('11-02-1996', 'dd-mm-yyyy'), 349, 359);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 316, to_date('29-06-2008', 'dd-mm-yyyy'), 350, 54);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 931, to_date('20-11-2005', 'dd-mm-yyyy'), 351, 16);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 419, to_date('12-10-2009', 'dd-mm-yyyy'), 352, 368);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 390, to_date('22-11-2020', 'dd-mm-yyyy'), 353, 122);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 621, to_date('16-06-1995', 'dd-mm-yyyy'), 354, 73);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 784, to_date('07-11-1991', 'dd-mm-yyyy'), 355, 400);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 610, to_date('01-03-2003', 'dd-mm-yyyy'), 356, 8);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 771, to_date('09-09-1997', 'dd-mm-yyyy'), 357, 355);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 588, to_date('23-11-2009', 'dd-mm-yyyy'), 358, 214);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 818, to_date('27-03-1995', 'dd-mm-yyyy'), 359, 315);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 975, to_date('15-09-1996', 'dd-mm-yyyy'), 360, 93);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 469, to_date('15-09-2009', 'dd-mm-yyyy'), 361, 113);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 403, to_date('20-12-2006', 'dd-mm-yyyy'), 362, 192);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 921, to_date('18-02-2009', 'dd-mm-yyyy'), 363, 179);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 416, to_date('02-10-1991', 'dd-mm-yyyy'), 364, 19);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 974, to_date('26-02-2013', 'dd-mm-yyyy'), 365, 269);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 743, to_date('20-10-1992', 'dd-mm-yyyy'), 366, 280);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 403, to_date('28-04-2023', 'dd-mm-yyyy'), 367, 215);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 583, to_date('04-06-2009', 'dd-mm-yyyy'), 368, 335);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 900, to_date('10-10-2015', 'dd-mm-yyyy'), 369, 293);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 975, to_date('14-07-1996', 'dd-mm-yyyy'), 370, 90);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 414, to_date('14-04-1996', 'dd-mm-yyyy'), 371, 29);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 565, to_date('16-11-1993', 'dd-mm-yyyy'), 372, 310);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 499, to_date('08-06-2014', 'dd-mm-yyyy'), 373, 221);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 867, to_date('18-12-2007', 'dd-mm-yyyy'), 374, 150);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 737, to_date('23-04-1999', 'dd-mm-yyyy'), 375, 185);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 710, to_date('05-10-1990', 'dd-mm-yyyy'), 376, 320);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 566, to_date('12-08-2001', 'dd-mm-yyyy'), 377, 234);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 894, to_date('24-05-2018', 'dd-mm-yyyy'), 378, 271);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 801, to_date('25-06-2016', 'dd-mm-yyyy'), 379, 175);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 821, to_date('25-01-2016', 'dd-mm-yyyy'), 380, 210);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 643, to_date('30-03-2006', 'dd-mm-yyyy'), 381, 233);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 441, to_date('09-09-1992', 'dd-mm-yyyy'), 382, 331);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 689, to_date('22-12-2019', 'dd-mm-yyyy'), 383, 400);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 469, to_date('01-10-1993', 'dd-mm-yyyy'), 384, 81);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 727, to_date('09-12-1996', 'dd-mm-yyyy'), 385, 212);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 916, to_date('09-05-2013', 'dd-mm-yyyy'), 386, 244);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 738, to_date('15-11-2010', 'dd-mm-yyyy'), 387, 144);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Food for family', 696, to_date('12-01-2003', 'dd-mm-yyyy'), 388, 255);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 877, to_date('07-09-1991', 'dd-mm-yyyy'), 389, 236);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 446, to_date('18-09-2011', 'dd-mm-yyyy'), 390, 336);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 453, to_date('01-04-1991', 'dd-mm-yyyy'), 391, 344);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 822, to_date('06-08-2009', 'dd-mm-yyyy'), 392, 57);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 815, to_date('12-06-1995', 'dd-mm-yyyy'), 393, 12);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 496, to_date('26-03-2015', 'dd-mm-yyyy'), 394, 123);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 907, to_date('31-12-2004', 'dd-mm-yyyy'), 395, 372);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 851, to_date('06-09-2009', 'dd-mm-yyyy'), 396, 187);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Things for the baby', 942, to_date('27-08-2006', 'dd-mm-yyyy'), 397, 67);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 562, to_date('27-04-2016', 'dd-mm-yyyy'), 398, 283);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Clothing', 850, to_date('09-09-2006', 'dd-mm-yyyy'), 399, 4);
insert into SPENDING (destination, amount, spending_date, spending_id, community_id)
values ('Extra money', 378, to_date('05-02-2002', 'dd-mm-yyyy'), 400, 294);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER enable constraint SYS_C007855;
prompt Enabling foreign key constraints for BIRTH...
alter table BIRTH enable constraint SYS_C007871;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C007866;
prompt Enabling foreign key constraints for COMMUNITY...
alter table COMMUNITY enable constraint SYS_C007878;
prompt Enabling foreign key constraints for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR enable constraint SYS_C007860;
prompt Enabling foreign key constraints for SPENDING...
alter table SPENDING enable constraint SYS_C007885;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for COMMUNITYMEMBER...
alter table COMMUNITYMEMBER enable all triggers;
prompt Enabling triggers for BIRTH...
alter table BIRTH enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for COMMUNITY...
alter table COMMUNITY enable all triggers;
prompt Enabling triggers for EXTERNAL_DONOR...
alter table EXTERNAL_DONOR enable all triggers;
prompt Enabling triggers for SPENDING...
alter table SPENDING enable all triggers;

set feedback on
set define on
prompt Done
