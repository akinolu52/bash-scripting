#!/bin/bash

# variable declaration
package="wget apache2 unzip"
tmpDir="/tmp/webfiles/"
url="https://www.tooplate.com/zip-templates/2132_clean_work.zip"
urlFolder="2132_clean_work"
nullFolder="/dev/null"
serviceName="apache2"
htmlFolder="/var/www/html"

# install dependencies
echo "################################################################"
echo "Installing dependencies"
echo "################################################################"
sudo apt-get install $package -y > $nullFolder
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
sudo systemctl start $serviceName
sudo systemctl enable $serviceName
echo

# create tmp directory
echo "################################################################"
echo "create tmp directory"
echo "################################################################"
mkdir $tmpDir
cd $tmpDir
echo

# download and unzip the website
echo "################################################################"
echo "download and unzip the website"
echo "################################################################"
wget $url > $nullFolder
unzip $urlFolder.zip > $nullFolder
echo

# copy files to website folder
echo "################################################################"
echo "copy files to website folder"
echo "################################################################"
sudo cp -r ./$urlFolder/* $htmlFolder
echo

# restart service
echo "################################################################"
echo "restart service"
echo "################################################################"
sudo systemctl restart $serviceName
sudo systemctl is-enabled $serviceName
echo

# clean up tmp files
echo "################################################################"
echo "clean up tmp files"
echo "################################################################"
cd /tmp
rm -rf $tmpDir

# echo content of html folder
echo "################################################################"
echo "echo content of html folder"
echo "################################################################"
ls $htmlFolder
echo
