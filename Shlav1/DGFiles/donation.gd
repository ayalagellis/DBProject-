
[General]
Version=1

[Preferences]
Username=
Password=2683
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AYALAG
Name=DONATION
Count=400

[Record]
Name=DATE_OF_DONATION
Type=DATE
Size=
Data=Random(1/1/1990, 29/5/2024)
Master=

[Record]
Name=DONATION_AMOUNT
Type=NUMBER
Size=
Data=Random(100, 100000)
Master=

[Record]
Name=DONATION_ID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=
Data=List(select PERSON_ID from PERSON)
Master=

