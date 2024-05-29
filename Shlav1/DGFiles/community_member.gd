
[General]
Version=1

[Preferences]
Username=
Password=2320
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AYALAG
Name=COMMUNITYMEMBER
Count=400

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=30
Data=Address1
Master=

[Record]
Name=DATE_OF_BIRTH
Type=DATE
Size=
Data=Random(1/1/1930, 1/1/2010)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=
Data=List(select PERSON_ID from PERSON)
Master=

[Record]
Name=MEMBER_ID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

