#!/bin/bash

# NOTE: this script will be expecting two arguments 
# 1 - for the url template (as a zip file)
# 2 - the folder name in the zip file

# variable declaration
package="wget apache2 unzip"
tmpDir="/tmp/webfiles/"
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
wget $1 > $nullFolder
unzip $2.zip > $nullFolder
echo

# copy files to website folder
echo "################################################################"
echo "copy files to website folder"
echo "################################################################"
sudo cp -r ./$2/* $htmlFolder
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


# to run it
# chmod +x 4_args_ubuntu.sh
# 4_args_ubuntu.sh https://www.tooplate.com/zip-templates/2137_barista_cafe.zip 2137_barista_cafe