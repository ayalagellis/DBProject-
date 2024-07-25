alter table COMMUNITY add C_name varchar2(20);
alter table COMMUNITY add C_location varchar2(20);
alter table COMMUNITY add C_numOfMembers INT;

alter table COMMUNITYMEMBER add M_dateOfJoining DATE;
alter table COMMUNITYMEMBER add M_mail varchar2(50);




create table SERVICEGIVER
(
  sg_price   NUMBER,
  sg_details VARCHAR2(100),
  sgm_id     INTEGER not null
);

alter table SERVICEGIVER
  add primary key (SGM_ID);

alter table SERVICEGIVER
  add foreign key (SGM_ID)
  references COMMUNITYMEMBER (member_id);

create table BABYSITTING
(
  b_gender            VARCHAR2(1) not null,
  b_age               NUMBER,
  b_yearsofexperience INTEGER,
  b_maxnumofchildren  INTEGER,
  sgm_id              INTEGER not null
);

alter table BABYSITTING
  add primary key (SGM_ID);

alter table BABYSITTING
  add foreign key (SGM_ID)
  references SERVICEGIVER (SGM_ID);

create table CLEANING
(
  cl_typeofcleaning VARCHAR2(20),
  sgm_id            INTEGER not null
);

alter table CLEANING
  add primary key (SGM_ID);

alter table CLEANING
  add foreign key (SGM_ID)
  references SERVICEGIVER (SGM_ID);


create table CONSULTING
(
  cns_location          VARCHAR2(100),
  cns_type              VARCHAR2(20) not null,
  cns_yearsofexperience INTEGER not null,
  sgm_id                INTEGER not null
);

alter table CONSULTING
  add primary key (SGM_ID);
alter table CONSULTING
  add foreign key (SGM_ID)
  references SERVICEGIVER (SGM_ID);

create table TIMES
(
  t_dayofweek   VARCHAR2(20) not null,
  t_starttime   VARCHAR2(5) not null,
  t_endtime     VARCHAR2(5) not null,
  t_num         INTEGER not null,
  t_constraints VARCHAR2(100),
  sgm_id        INTEGER not null
);

alter table TIMES
  add primary key (T_NUM, SGM_ID);
alter table TIMES
  add foreign key (SGM_ID)
  references SERVICEGIVER (SGM_ID);

create table YOLEDETSERVICEGIVER
(
  ysg_dateofservice DATE not null,
  ysg_starttime     VARCHAR2(5) not null,
  ysg_endtime       VARCHAR2(5) not null,
  ysg_rating        INTEGER,
  ym_id             INTEGER not null,
  sgm_id            INTEGER not null
); 

alter table YOLEDETSERVICEGIVER
  add primary key (YM_ID, SGM_ID);

alter table YOLEDETSERVICEGIVER
  add foreign key (YM_ID)
  references COMMUNITYMEMBER (member_id);

alter table YOLEDETSERVICEGIVER
  add foreign key (SGM_ID)
  references SERVICEGIVER (SGM_ID);

alter table YOLEDETSERVICEGIVER
  add constraint CHECK_DIFFERENT_MEMBERS
  check (YM_id != SGM_id);






