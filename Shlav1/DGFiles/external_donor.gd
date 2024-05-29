
[General]
Version=1

[Preferences]
Username=
Password=2457
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AYALAG
Name=EXTERNAL_DONOR
Count=400

[Record]
Name=DONORDESCRIPTION
Type=VARCHAR2
Size=300
Data=List('From Israel','Not from Israel','A corporation','An individual', 'A family')
Master=

[Record]
Name=GENDER
Type=VARCHAR2
Size=6
Data=List('male', 'female')
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=
Data=List(select PERSON_ID from PERSON)
Master=

[Record]
Name=DONOR_ID
Type=NUMBER
Size=
Data=Sequence(401)
Master=

