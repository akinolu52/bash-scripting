#!/bin/bash

read -p "Enter a number: " num
echo

# start if block
# NB there must be space after [ and before ]
if [ $num -lt 100 ]
then
    echo "You're in the if block"
    # wait for 3 seconds
    sleep 3 
    echo "Your number is less than 100"
    echo
else
    echo "Your number is greater than 100"
# end if block
fi

echo "Script executed successfully at ", 
date
echo
