# bash-scripting

## comment example

```#!/bin/bash
# this is a comment

echo "###################################################"
echo "The system uptime is:"
uptime
echo 
```

## variable example

```#!/bin/bash
# variable declaration
package="wget apache2 unzip"
nullFolder="/dev/null"

# install dependencies
echo "################################################################"
echo "Installing dependencies"
echo "################################################################"
sudo apt-get install $package -y > $nullFolder
echo
```
