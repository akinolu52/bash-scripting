#!/bin/bash


echo "################################################################"
date

fileName=/var/run/apache2/apache2.pid
ls $fileName &> /dev/null


# -f flag is to know if the file exists

if [ -f $fileName ]
then 
    echo "Apache2 process is currently running"
else
    echo "Apache2 process is not running"
    echo
    echo "Starting Apache2 process"
    echo
    systemctl start apache2
    if [ $? -eq 0 ]
    then 
        echo "Apache2 process is currently running"
    else
        echo "Apache2 process failed to start, contact system admin"
    fi
fi
echo
date
echo "################################################################"
