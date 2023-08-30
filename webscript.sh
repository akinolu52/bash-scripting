#!/bin/bash

# install dependencies
echo "################################################################"
echo "Installing dependencies"
echo "################################################################"
# redirect the logs to a null folder (this'll still show the error)
sudo yum install wget httpd unzip -y > /dev/null
echo

# start and enable http service
echo "################################################################"
echo "Start and enable http service"
echo "################################################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# create tmp directory
echo "################################################################"
echo "create tmp directory"
echo "################################################################"
mkdir /tmp/webfiles/
cd /tmp/webfiles/
echo

# download and unzip the website
echo "################################################################"
echo "download and unzip the website"
echo "################################################################"
wget https://www.tooplate.com/zip-templates/2132_clean_work.zip > /dev/null
unzip 2132_clean_work.zip
echo

# copy files to website folder
echo "################################################################"
echo "copy files to website folder"
echo "################################################################"
sudo cp -r ./2132_clean_work/* /var/www/html
echo

# restart service
echo "################################################################"
echo "restart service"
echo "################################################################"
sudo systemctl restart httpd
sudo systemctl is-enabled httpd
echo

# clean up tmp files
echo "################################################################"
echo "clean up tmp files"
echo "################################################################"
cd /tmp
rm -rf /tmp/webfiles
echo

# echo content of html folder
echo "################################################################"
echo "echo content of html folder"
echo "################################################################"
ls /var/www/html
echo
