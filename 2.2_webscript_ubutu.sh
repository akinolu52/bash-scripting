#!/bin/bash

# install dependencies
echo "################################################################"
echo "Installing dependencies"
echo "################################################################"
sudo apt-get install wget apache2 unzip -y > /dev/null
echo

# verify apache2 installation
echo "################################################################"
echo "Verifying apache2 installation"
echo "################################################################"
sudo ufw status
echo

# start and enable apache service
echo "################################################################"
echo "Start and enable apache service"
echo "################################################################"
sudo systemctl start apache2
sudo systemctl enable apache2
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
unzip 2132_clean_work.zip > /dev/null
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
sudo systemctl restart apache2
sudo systemctl is-enabled apache2
echo

# clean up tmp files
echo "################################################################"
echo "clean up tmp files"
echo "################################################################"
cd /tmp
rm -rf /tmp/webfiles

# echo content of html folder
echo "################################################################"
echo "echo content of html folder"
echo "################################################################"
ls /var/www/html
echo
