#!/bin/bash

#Setting chmod permissions:
chmod +x houseChoice.sh
chmod +x house.sh

#This code below REF ME Week3 megaMenu.sh

echo "$(tput setaf 3)2020 US Election Funds Lookup$(tput sgr 0)" #Colour set by bounding the "Access Granted" See REF https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

for ((i=0; ;++i)); do #This for loop, loops infitely until the user enters option 11 and exits the program. REF https://stackoverflow.com/questions/31625794/infinite-for-loop-with-bash
    echo "$(tput setaf 5) Choose a race:$(tput sgr 0)" #Colour set by bounding the "Choose an Options" See REF https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
    echo "$(tput setaf 6)1. Particular House District" #Open the colour setting for the menu options. See REF https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
    echo "2. Overall count of House top Spenders. Dems V GOP"
    echo "3. Presedential"
    echo "4. PACs"
    echo "5. Exit$(tput sgr 0)"
    read option;
    case $option in #The case options allows for user to make a choice.
    1) ./house.sh;;
    2) ./houseChoiceAll.sh;;
    3) ./executionCross.sh;;
    4) ./executionDOS.sh;;
    5) echo "Auf Wiedersehen"
        exit 0;; #user deciding to quit the program.
    *) echo "Please check your entry and try again" #user entering an invalid option - such as "12"
    esac
done

#need to point the correct cases to respective files.
