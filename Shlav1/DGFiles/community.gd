
[General]
Version=1

[Preferences]
Username=
Password=2691
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AYALAG
Name=COMMUNITY
Count=400

[Record]
Name=COMMUNITY_ID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=MONTHLY_DONATION
Type=NUMBER
Size=
Data=Random(10000, 50000)
Master=

[Record]
Name=COMMUNITY_TYPE
Type=VARCHAR2
Size=30
Data=List('Beit Knesset','Neighborhood','Kehila')
Master=

[Record]
Name=PHONE_NUMBER
Type=VARCHAR2
Size=10
Data=[111111111]
Master=

[Record]
Name=DONATION_ID
Type=NUMBER
Size=
Data=List(select donation_id from donation)
Master=

