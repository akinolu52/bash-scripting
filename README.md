# bash-scripting

### comment example

```bash
# this is a comment

echo "###################################################"
echo "The system uptime is:"
uptime
echo 
```

### variable example

```bash
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
- `$RANDOM` generate and return a random number (0 – 32767)
- `$LINENO` returns the current line number in the bash script

### quote example

```bash
skill="devops"

echo "I am a $skill engineer in view, and I will make \$1 million usd/month"
```

### exporting commands explanation

if you want to make a variable available for all users on the machine then add

```bash
export VARIABLE_NAME=VALUE
```

to `ls /etc/profile`

if you want to make a variable available for only the loggedIn user  on the machine then add

```bash
export VARIABLE_NAME=VALUE
```

to `ls ~/.bashrc`

### input example

```bash
echo "Enter your skill"
read SKILL

echo 
echo "Your skill is $SKILL, and it's in high demand"
echo

read -p "Username: " USR
read -sp "Password: " PSD
```

- `-p` for prompt
- `-sp` for suppressed prompt (password etc - it doesn't print to the console)

### if condition example

```bash
# start if block
# NB there must be space after [ and before ]
if [ condition ]
then
    statement
# end if block
fi
```

- `-lt`: less than
- `-gt`: greater than
- `sleep 5`: this is to wait for 5 seconds

condition example

```bash
read -p "Enter a number: " num

if [ $num -gt 100 ]
then
    echo "Number is greater than 100"
fi
```

### if...else condition example

```bash
# start if block
# NB there must be space after [ and before ]
if [ condition ]
then
    statement
# end if block
else
    statement
# end of else block
fi
```

condition example

```bash
read -p "Enter a number: " num

if [ $num -gt 100 ]
then
    echo "number is greater than 100"
else
    echo "number is less than 100"
fi
```
