# bash-scripting

### comment example

```#!/bin/bash
# this is a comment

echo "###################################################"
echo "The system uptime is:"
uptime
echo 
```

### variable example

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

### argument example

- `$0` is by default the folder name
- `$1` - `$9` can be used as argument to the bash script
- `$#` to check how many arguments are passed to the bash script
- `$@` to list all arguments supplied to the bash script
- `$?` returns exit status of the last command
- `$$` returns current process id
- `$USER` returns username of user running the script
- `$HOSTNAME` returns hostname of the machine running the script
- `$SECONDS` returns the seconds since the script was started
- `$RANDOM` generate and return a random number
- `$LINENO` returns the current line number in the bash script
