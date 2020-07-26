#!/bin/sh

echo "Please enter a state. Must be abbreviated in upper case. Eg. NY for New York or TX for Texas"
read -p "State: " state
echo "This script will analyse each district and rank each candidate by amount spent."



mkdir processing/$state/
mkdir processing/$state/sorted

#need to filter the weball20 file by parsing the state and district variables.
#REF A & REF B REF C

#Creating a new CSV for a state only. This is done by echoing the State and selects only the rows beginning with such state.
echo "$state" | grep $state houseDistricts.csv > houseDistricts$state.csv

#We loose the state variable after the while loop exits. Therefore I'm saving it as a text file to be called again after the while loops.
echo "$state" > statevar.txt

while IFS=, read -r state district; do


#need to filter the weball20 file by parsing the state and district variables.
#REF A & REF B REF C

  awk -v st="$state" -v di="$district" -F "|" '{OFS="|"; if(($19==st) && ($20==di)) print $2, $5, $6, $8}' weball20.txt > processing/$state/filtered$state$district.txt

#Arranging the columns to show the highest to lowest in expenditure.
  sort -t "|" -k 4 -nr processing/$state/filtered$state$district.txt > processing/$state/sorted/sortedFiltered$state$district.txt


done < houseDistricts$state.csv

#Now the while loop has exited, we need re-call the state variable from the statevar text file we wrote on line 19
state=$(cat statevar.txt)


#navigating to the processing/sorted directory where the each congressional district is arranged by top to lowest spender.
cp houseDistricts$state.csv processing/$state/sorted/houseDistricts$state.csv
cp statevar.txt processing/$state/sorted/statevar.txt
cd processing/$state/sorted/
rm topSpender.txt #removes the top spender file to prevent adding on from previous calculations.
while IFS=, read -r state district; do

  line= head -n 1 sortedFiltered$state$district.txt >> topSpender.txt #REF G Reading the first line only of each district and parsing to the topSpender file.

done < houseDistricts$state.csv
#Now the while loop has exited, we need re-call the state variable from the statevar text file we wrote on line 19
state=$(cat statevar.txt)


#Counting the number of DEMs and Republican top Spenders.
dems=$(grep -o "|DEM|" topSpender.txt | wc -l)
reps=$(grep -o "|REP|" topSpender.txt | wc -l)
ind=$(grep -o "|IND|" topSpender.txt | wc -l)

echo "Dems are outspending in $dems seats"
echo "GOP are outspending in $reps seats"
echo "Independants are outspending in $ind seats"




echo""
