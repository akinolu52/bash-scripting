#!/bin/bash


echo "################################################################"
date

ls /var/run/httpd/httpd.pid &> /dev/null

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
