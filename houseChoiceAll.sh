#!/bin/sh


echo "This script will analyse each district and rank each candidate by amount spent."

#Using the houseDistricts.csv as input for the state and district variables. This will loop through each one.
#REF E & REF F
while IFS=, read -r state district; do


#need to filter the weball20 file by parsing the state and district variables.
#REF A & REF B REF C

  awk -v st="$state" -v di="$district" -F "|" '{OFS="|"; if(($19==st) && ($20==di)) print $2, $5, $6, $8}' weball20.txt > processing/filtered$state$district.txt

#Arranging the columns to show the highest to lowest in expenditure.
  sort -t "|" -k 4 -nr processing/filtered$state$district.txt > processing/sorted/sortedFiltered$state$district.txt

done < houseDistricts.csv

#navigating to the processing/sorted directory where the each congressional district is arranged by top to lowest spender.
cp houseDistricts.csv processing/sorted/houseDistricts.csv
cd processing/sorted/
rm topSpender.txt #removes the top spender file to prevent adding on from previous calculations.
while IFS=, read -r state district; do

  line= head -n 1 sortedFiltered$state$district.txt >> topSpender.txt #REF G Reading the first line only of each district and parsing to the topSpender file.

done < houseDistricts.csv

cd ..
cd ..

#Counting the number of DEMs and Republican top Spenders.
dems=$(grep -o "DEM" processing/sorted/topSpender.txt | wc -l)
reps=$(grep -o "REP" processing/sorted/topSpender.txt | wc -l)

echo "Dems are outspending in $dems seats"
echo "GOP are outspending in $reps seats"


printf 'x%0.s' $(seq $dems) #REF I
