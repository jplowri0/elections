#!/bin/sh

#Allowing the user to set a state code such as NY for New York to be passed into the AWK command.
echo "Please enter a state. Must be abbreviated in upper case. Eg. NY for New York or TX for Texas"
read -p "State: " state
echo "Now enter a Congressional district number"
read -p "District: " district


#need to filter the weball20 file by parsing the state and district variables.
#REF A & REF B REF C

awk -v st="$state" -v di="$district" -F "|" '{OFS="|"; if(($19==st) && ($20==di)) print $2, $5, $6, $8}' weball20.txt > filtered$state$district.txt

#Arranging the columns to show the highest to lowest in expenditure. 
sort -t "|" -k 4 -nr filtered$state$district.txt > sortedfiltered$state$district.txt

#this awk command below is still formatted from the userAccounts.sh from school.
awk 'BEGIN {
    FS="|";
    printf ("| \033[34m%-30s\033[0m | \033[34m%-8s\033[0m | \033[34m%-20s\033[0m | \033[34m%-20s\033[0m |\n", "Candidate", "Party", "Received", "Spent");
    print "|________________________________|__________|______________________|______________________|";
}
{
    printf("| \033[33m%-30s\033[0m | \033[35m%-8s\033[0m | \033[35m%-20s\033[0m | \033[35m%-20s\033[0m |\n", $1, $2, $3, $4);
}' sortedfiltered$state$district.txt
