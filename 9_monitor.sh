#!/bin/bash


echo "################################################################"
date

ls /var/run/httpd/httpd.pid &> /dev/null

# #? is used to check the exit code of the last script
# if it's 0 then it's successful 
# if failed it's not 0

if [ $? -eq 0 ]
then 
    echo "Httpd process is currently running"
else
    echo "Httpd process is not running"
    echo "Starting Httpd process"
    echo
    systemctl start httpd
    if [ $? -eq 0 ]
    then 
        echo "Httpd process is currently running"
    else
        echo "Httpd process failed to start, contact system admin"
    fi
fi
echo
date
echo "################################################################"
