#!/bin/sh

#Scrape the FEC data. https://www.fec.gov/data/browse-data/?tab=bulk-data for other categories
wget "https://www.fec.gov/files/bulk-downloads/2020/weball20.zip"
unzip weball20.zip
rm weball20.zip

#Above works well.
#Need to sort the AWK / sed command now to format thie weball20.txt
#Plan -
# 1) AWK to format the text doc.
# 2) enter the state & district which passes into two variables ST = NY & DI = district no.
# 3) Parse these ST & DI to the sed command to extract the desired state and district.
# 4) This will create text file. Containing Candidate name, party, $ received & $ spent.
# 5) Use AWK again to pretty up this text file.
# 6) Maybe an option to do this for all ? Need to find a way to only show Candidate on ballots. 
