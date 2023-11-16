#!/bin/bash

nullFolder="/dev/null"

# install nvm from ubuntu
echo "################################################################"
echo "install nvm from ubuntu"
echo "################################################################"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo

source ~/.bashrc
nvm install 18

# switch to node 18
echo "################################################################"
echo "switch to node 18"
echo "################################################################"
nvm -v
nvm use 18
echo

# install yarn from ubuntu
echo "################################################################"
echo "install yarn from ubuntu"
echo "################################################################"
sudo apt update > $nullFolder
sudo apt install curl > $nullFolder
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - > $nullFolder
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > $nullFolder
sudo apt install yarn -y > $nullFolder
echo

# verify yarn installation
echo "################################################################"
echo "verify yarn installation"
echo "################################################################"
yarn --version
echo

# Change and verify the project folder
echo "################################################################"
echo "Change and verify project directory"
echo "################################################################"
cd /opt/backend/wavy-pay-be
pwd
echo

# switch to develop branch
echo "################################################################"
echo "switch to develop branch"
echo "################################################################"
git switch develop
echo

# Pull the latest changes from the repository
echo "################################################################"
echo "pull latest changes from git"
echo "################################################################"
rm yarn.lock
git pull
echo

# Install dependencies
echo "################################################################"
echo "install latest dependencies"
echo "################################################################"
yarn > $nullFolder
echo

# build project 
echo "################################################################"
echo "build project"
echo "################################################################"
yarn build
echo

# Restart the PM2 process
echo "################################################################"
echo "pm2 stop and then start app"
echo "################################################################"
pwd
pm2 delete main
echo
NODE_ENV=development pm2 start dist/src/main.js
echo
sleep 4
pm2 list
echo
