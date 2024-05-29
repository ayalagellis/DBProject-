
[General]
Version=1

[Preferences]
Username=
Password=2655
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AYALAG
Name=BIRTH
Count=400

[Record]
Name=BABY_DOB
Type=DATE
Size=
Data=Random(1/1/1990, 29/5/2024)
Master=

[Record]
Name=NUM_OF_CHILDREN
Type=NUMBER
Size=
Data=Random(1,25)
Master=

[Record]
Name=COMMENTS
Type=VARCHAR2
Size=200
Data=List('Family in need of extra financial help','special child','one spouse works','both spouses work')
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=
Data=List(select member_id from COMMUNITYMEMBER)
Master=

