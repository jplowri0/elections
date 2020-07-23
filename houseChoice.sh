#!/bin/sh

#Allowing the user to set a state code such as NY for New York to be passed into the AWK command.
echo "Please enter a state. Must be abbreviated in upper case. Eg. NY for New York or TX for Texas"
read -p "State: " state
echo "Now enter a Congressional district number"
read -p "District: " district

echo $state
echo $district
