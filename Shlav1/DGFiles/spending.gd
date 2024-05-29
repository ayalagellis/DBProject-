
[General]
Version=1

[Preferences]
Username=
Password=2790
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=AYALAG
Name=SPENDING
Count=400

[Record]
Name=DESTINATION
Type=VARCHAR2
Size=300
Data=List('Food for family','Things for the baby','Extra money','Clothing')
Master=

[Record]
Name=AMOUNT
Type=NUMBER
Size=
Data=Random(300, 1000)
Master=

[Record]
Name=SPENDING_DATE
Type=DATE
Size=
Data=Random(1/1/1990, 29/5/2024)
Master=

[Record]
Name=SPENDING_ID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

[Record]
Name=COMMUNITY_ID
Type=NUMBER
Size=
Data=List(select community_id from community)
Master=

